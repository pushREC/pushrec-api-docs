# Playwright API Documentation

> **Status:** Research from inbox
> **Last Updated:** 2026-01-07
> **Source:** Vault inbox research

## Contents

| File | Description | Size |
|------|-------------|------|
| `api-surface.md` | Playwright API surface analysis | 36KB |
| `tool-use-api.md` | Tool use API integration research | 35KB |

## Playwright Overview

Playwright is a browser automation framework supporting Chromium, Firefox, and WebKit.

### Core Classes

| Class | Description |
|-------|-------------|
| `Browser` | Browser instance |
| `BrowserContext` | Isolated browser context |
| `Page` | Single tab/page |
| `Frame` | iframe content |
| `Locator` | Element selection |
| `ElementHandle` | DOM element reference |

### Key APIs

| API | Purpose |
|-----|---------|
| `page.goto()` | Navigate to URL |
| `page.click()` | Click element |
| `page.fill()` | Fill input field |
| `page.screenshot()` | Capture screenshot |
| `page.evaluate()` | Execute JavaScript |
| `page.waitForSelector()` | Wait for element |

## Notes

1. **TypeScript definitions available** - Full type coverage
2. **No REST API** - Library-based, not HTTP
3. **MCP integration** - Can be wrapped as MCP server

## Resources

- [Playwright Docs](https://playwright.dev/docs/api/class-playwright)
- [API Reference](https://playwright.dev/docs/api/class-browser)
- [GitHub](https://github.com/microsoft/playwright)
