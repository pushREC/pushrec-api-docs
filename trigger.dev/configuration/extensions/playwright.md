# Playwright Build Extension Documentation

## Overview

The Playwright build extension enables seamless integration of Playwright with Trigger.dev by automating browser dependency installation and configuration.

## Key Features

The extension provides several important capabilities:

- **Automatic Installation**: "Automatically installs Playwright and required browser dependencies"
- **Browser Selection**: Allows specification of which browsers to install (chromium, firefox, webkit)
- **Mode Options**: Supports both headless and non-headless execution modes
- **Version Management**: Enables specifying Playwright version or auto-detection from project dependencies
- **Optimization**: "Installs only the dependencies needed for the selected browsers to optimize build time and image size"

## Basic Setup

The simplest implementation imports the extension and adds it to the build configuration:

```typescript
import { defineConfig } from "@trigger.dev/sdk";
import { playwright } from "@trigger.dev/build/extensions/playwright";

export default defineConfig({
  project: "<project ref>",
  build: {
    extensions: [
      playwright(),
    ],
  },
});
```

## Configuration Options

**browsers**: Array parameter accepting "chromium", "firefox", or "webkit" values (default: ["chromium"])

**headless**: Boolean controlling browser UI visibility (default: true); setting to false automatically configures virtual display via Xvfb

**version**: String specifying Playwright version; auto-detection from package dependencies is recommended to prevent compatibility issues

## Environment Variables

The extension automatically configures:
- `PLAYWRIGHT_BROWSERS_PATH`: Points to `/ms-playwright`
- `PLAYWRIGHT_SKIP_BROWSER_DOWNLOAD`: Set to `1`
- `PLAYWRIGHT_SKIP_BROWSER_VALIDATION`: Set to `1`
- `DISPLAY`: Set to `:99` when non-headless mode is enabled

## Browser Instance Management

The documentation demonstrates using middleware and locals to maintain browser instances across task lifecycle events, ensuring proper cleanup during waits, resumes, and completion.

## Important Limitation

"This extension only affects the build and deploy process, not the `dev` command."

---
Source: https://trigger.dev/docs/config/extensions/playwright
