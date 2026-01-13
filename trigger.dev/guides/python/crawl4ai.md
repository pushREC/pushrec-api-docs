# Python Headless Browser Web Crawler Example

## Overview
This guide demonstrates building a web crawler using Trigger.dev with Python, Crawl4AI, and Playwright to navigate websites and extract content via headless browser.

## Prerequisites
- A Trigger.dev initialized project
- Python installed locally

## Key Features
- Trigger.dev for background task orchestration
- Python build extension for dependency installation
- Crawl4AI (open source LLM-friendly web crawler)
- Custom Playwright extension for headless Chromium browser
- Proxy support

## Web Scraping Requirements
**Important:** When scraping, you must use a proxy to comply with terms of service. Direct scraping without site owner permission violates Trigger.dev Cloud policies and results in account suspension.

### Recommended Proxy Services
- Smartproxy
- Bright Data
- Browserbase
- Oxylabs
- ScrapingBee

### Environment Variables
Set in `.env` file and Trigger.dev dashboard:
- `PROXY_URL`: Proxy server URL (e.g., `http://proxy.example.com:8080`)
- `PROXY_USERNAME`: Optional authentication username
- `PROXY_PASSWORD`: Optional authentication password

## Implementation Structure

### Build Configuration (trigger.config.ts)
Includes Python extension and custom Playwright Chromium installation with necessary system dependencies (libnspr4, libnss3, libasound2, etc.).

### Task Code
Uses `python.runScript()` method to execute `crawl-url.py` with URL argument, passing proxy environment variables.

### Dependencies (requirements.txt)
```
crawl4ai
playwright
urllib3<2.0.0
```

### Python Script (crawl-url.py)
Accepts URL as command-line argument, configures proxy authentication if credentials provided, runs AsyncWebCrawler, and outputs markdown content.

## Testing Steps
1. Create virtual environment: `python -m venv venv`
2. Activate environment (Mac/Linux: `source venv/bin/activate`; Windows: `venv\Scripts\activate`)
3. Install dependencies: `pip install -r requirements.txt`
4. Add project ref to `trigger.config.ts`
5. Run Trigger.dev CLI dev command
6. Test in dashboard with chosen URL

## Deployment
Deploy to production using Trigger.dev CLI deploy command.

## Additional Resources
Learn more about Python build extension for installing dependencies and running code in Trigger.dev projects.
