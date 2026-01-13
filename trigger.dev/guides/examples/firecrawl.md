# Crawl a URL Using Firecrawl with Trigger.dev

## Overview

Firecrawl is a web crawling tool that "extracts clean markdown that's structured in an LLM-ready format." The documentation provides two implementation examples for integrating Firecrawl with Trigger.dev.

## Prerequisites

- A Trigger.dev project that has been initialized
- An active Firecrawl account

## Example 1: Website Crawling

This task crawls multiple URLs from a website and returns a `crawlResult` object. The `limit` parameter controls how many URLs get processed.

**Key implementation details:**

- Initialize the Firecrawl client using your API key from the dashboard
- Call the `crawl()` method with the URL and configuration options
- Set `limit: 100` to restrict the number of URLs crawled
- Specify `formats: ["markdown", "html"]` to get content in both formats
- Check the status before returning results; throw an error if crawling fails

## Example 2: Single URL Scraping

This task processes a single URL and returns a `scrapeResult` object containing the page content.

**Implementation approach:**

- Use the same client initialization process
- Call the `scrape()` method instead of `crawl()`
- Request formats in markdown and HTML
- Return the extracted data directly

## Testing Your Tasks

Both examples can be tested from the Trigger.dev dashboard by providing a URL parameter in JSON format: `{"url": "<your-url-here>"}`.

The documentation emphasizes that tasks should handle errors gracefully and extract content suitable for LLM processing.
