# Puppeteer Integration with Trigger.dev

## Overview

The documentation demonstrates how to integrate Puppeteer with Trigger.dev through three practical examples showcasing browser automation capabilities.

## Prerequisites

- A Trigger.dev initialized project
- Puppeteer installed locally

## Required Configuration

Add to `trigger.config.ts`:

```typescript
import { defineConfig } from "@trigger.dev/sdk";
import { puppeteer } from "@trigger.dev/build/extensions/puppeteer";

export default defineConfig({
  project: "<project ref>",
  build: {
    extensions: [puppeteer()],
  },
});
```

Set environment variable: `PUPPETEER_EXECUTABLE_PATH: "/usr/bin/google-chrome-stable"`

## Example Tasks

**1. Basic Example:** Launches a browser, navigates to trigger.dev, retrieves the page title, and logs the content.

**2. PDF Generation:** Navigates to a webpage, generates a PDF, and uploads it to Cloudflare R2 storage using AWS SDK.

**3. Web Scraping with Proxy:** Uses BrowserBase proxy to scrape GitHub star count from a target website, demonstrating compliance with web scraping best practices.

## Critical Warning

Direct website scraping without proxy services violates terms of service and risks account suspension. The documentation emphasizes: "You must always have permission from the website owner to scrape their content."

## Recommended Proxy Services

- Browserbase
- Brightdata
- Browserless
- Oxylabs
- ScrapingBee
- Smartproxy

All examples include error handling with try-catch-finally blocks and proper resource cleanup.
