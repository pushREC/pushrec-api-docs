# Scrape the top 3 articles from Hacker News and email yourself a summary every weekday

## Overview

This example demonstrates how to scrape the top 3 articles from Hacker News using BrowserBase and Puppeteer, summarize them with ChatGPT and send a nicely formatted email summary to yourself every weekday using Resend.

## Build Configuration

Add the Puppeteer extension to your `trigger.config.ts`:

```typescript
import { defineConfig } from "@trigger.dev/sdk";
import { puppeteer } from "@trigger.dev/build/extensions/puppeteer";

export default defineConfig({
  project: "",
  // Your other config settings...
  build: {
    // This is required to use the Puppeteer library
    extensions: [puppeteer()],
  },
});
```

## Environment Variables

```typescript
BROWSERBASE_API_KEY: ""
OPENAI_API_KEY: ""
RESEND_API_KEY: ""
```

## Main Task Implementation

### Parent Task: Scheduled Scraper

The main task runs at 9 AM every weekday (Monday-Friday) in the Europe/London timezone:

```typescript
import { render } from "@react-email/render";
import { logger, schedules, task, wait } from "@trigger.dev/sdk";
import { OpenAI } from "openai";
import puppeteer from "puppeteer-core";
import { Resend } from "resend";
import { HNSummaryEmail } from "./summarize-hn-email";

const openai = new OpenAI({ apiKey: process.env.OPENAI_API_KEY });
const resend = new Resend(process.env.RESEND_API_KEY);

// Parent task (scheduled to run 9AM every weekday)
export const summarizeHackerNews = schedules.task({
  id: "summarize-hacker-news",
  cron: {
    pattern: "0 9 * * 1-5",
    timezone: "Europe/London",
  }, // Run at 9 AM, Monday to Friday
  run: async () => {
    // Connect to BrowserBase to proxy the scraping of the Hacker News articles
    const browser = await puppeteer.connect({
      browserWSEndpoint: `wss://connect.browserbase.com?apiKey=${process.env.BROWSERBASE_API_KEY}`,
    });
    logger.info("Connected to Browserbase");

    const page = await browser.newPage();

    // Navigate to Hacker News and scrape top 3 articles
    await page.goto("https://news.ycombinator.com/news", {
      waitUntil: "networkidle0",
    });
    logger.info("Navigated to Hacker News");

    const articles = await page.evaluate(() => {
      const items = document.querySelectorAll(".athing");
      return Array.from(items)
        .slice(0, 3)
        .map((item) => {
          const titleElement = item.querySelector(".titleline > a");
          const link = titleElement?.getAttribute("href");
          const title = titleElement?.textContent;
          return { title, link };
        });
    });
    logger.info("Scraped top 3 articles", { articles });

    await browser.close();
    await wait.for({ seconds: 5 });

    // Use batchTriggerAndWait to process articles
    const summaries = await scrapeAndSummarizeArticle
      .batchTriggerAndWait(
        articles.map((article) => ({
          payload: { title: article.title!, link: article.link! },
        }))
      )
      .then((batch) => batch.runs.filter((run) => run.ok).map((run) => run.output));

    // Send email using Resend
    await resend.emails.send({
      from: "Hacker News Summary <[email protected]>",
      to: ["[email protected]"],
      subject: "Your morning HN summary",
      html: render(<HNSummaryEmail articles={summaries} />),
    });

    logger.info("Email sent successfully");
  },
});
```

### Child Task: Article Scraper and Summarizer

The child task handles individual article processing with retry logic:

```typescript
// Child task for scraping and summarizing individual articles
export const scrapeAndSummarizeArticle = task({
  id: "scrape-and-summarize-articles",
  retry: {
    maxAttempts: 3,
    minTimeoutInMs: 5000,
    maxTimeoutInMs: 10000,
    factor: 2,
    randomize: true,
  },
  run: async ({ title, link }: { title: string; link: string }) => {
    logger.info(`Summarizing ${title}`);

    const browser = await puppeteer.connect({
      browserWSEndpoint: `wss://connect.browserbase.com?apiKey=${process.env.BROWSERBASE_API_KEY}`,
    });
    const page = await browser.newPage();

    // Prevent all assets from loading, images, stylesheets etc
    await page.setRequestInterception(true);
    page.on("request", (request) => {
      if (["script", "stylesheet", "image", "media", "font"].includes(request.resourceType())) {
        request.abort();
      } else {
        request.continue();
      }
    });

    await page.goto(link, { waitUntil: "networkidle0" });
    logger.info(`Navigated to article: ${title}`);

    // Extract the main content of the article
    const content = await page.evaluate(() => {
      const articleElement = document.querySelector("article") || document.body;
      return articleElement.innerText.trim().slice(0, 1500); // Limit to 1500 characters
    });

    await browser.close();

    logger.info(`Extracted content for article: ${title}`, { content });

    // Summarize the content using ChatGPT
    const response = await openai.chat.completions.create({
      model: "gpt-4o",
      messages: [
        {
          role: "user",
          content: `Summarize this article in 2-3 concise sentences:\n\n${content}`,
        },
      ],
    });

    logger.info(`Generated summary for article: ${title}`);

    return {
      title,
      link,
      summary: response.choices[0].message.content,
    };
  },
});
```

## Email Template

React Email component for the summary email:

```typescript
import { Html, Head, Body, Container, Section, Heading, Text, Link } from "@react-email/components";

interface Article {
  title: string;
  link: string;
  summary: string | null;
}

export const HNSummaryEmail: React.FC<{ articles: Article[] }> = ({ articles }) => (
  <Html>
    <Head />
    <Body style={{ fontFamily: "Arial, sans-serif", padding: "20px" }}>
      <Container>
        <Heading as="h1">Your Morning HN Summary</Heading>
        {articles.map((article, index) => (
          <Section key={index} style={{ marginBottom: "20px" }}>
            <Heading as="h3">
              <Link href={article.link}>{article.title}</Link>
            </Heading>
            <Text>{article.summary || "No summary available"}</Text>
          </Section>
        ))}
      </Container>
    </Body>
  </Html>
);
```

## Technical Stack

- **BrowserBase**: Cloud browser infrastructure for Puppeteer
- **Puppeteer**: Node library for controlling headless Chrome/Chromium
- **OpenAI API**: For generating article summaries using GPT-4o
- **Resend**: Transactional email service
- **Trigger.dev**: Task scheduling and orchestration platform
- **React Email**: Email template components

## Workflow

1. **Schedule**: Task runs every weekday at 9 AM via cron schedule
2. **Scrape**: Puppeteer connects to BrowserBase to scrape Hacker News front page
3. **Extract**: Top 3 articles are extracted using DOM selectors
4. **Batch Process**: Uses `batchTriggerAndWait` to process articles in parallel
5. **Navigate**: Each article is visited to extract content (assets disabled for speed)
6. **Summarize**: ChatGPT generates 2-3 sentence summaries
7. **Email**: Formatted summary sent via Resend with React Email template

## Key Features

- **Scheduled Execution**: Runs automatically Monday-Friday at 9 AM
- **Batch Processing**: Articles processed in parallel for efficiency
- **Resource Optimization**: Blocks images, scripts, and stylesheets when scraping article content
- **Retry Logic**: Child task has exponential backoff retry (3 attempts)
- **Cloud Browsers**: Uses BrowserBase for reliable browser automation
- **Professional Emails**: React Email components for clean HTML emails

## Configuration Requirements

- **BROWSERBASE_API_KEY**: BrowserBase authentication key
- **BROWSERBASE_PROJECT_ID**: BrowserBase project identifier (if needed)
- **OPENAI_API_KEY**: OpenAI API access key
- **RESEND_API_KEY**: Resend email service API key

## Selectors Used

- `.athing` - Hacker News article items
- `.titleline > a` - Article title and link elements
- `article` or `document.body` - Article content extraction fallback
