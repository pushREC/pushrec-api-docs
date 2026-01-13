# Puppeteer - Trigger.dev Documentation

## Overview
The Puppeteer build extension enables support for Puppeteer in Trigger.dev projects, allowing browser automation capabilities within tasks.

## Setup Instructions

### 1. Configuration File
Add the puppeteer extension to your `trigger.config.ts`:

```typescript
import { defineConfig } from "@trigger.dev/sdk";
import { puppeteer } from "@trigger.dev/build/extensions/puppeteer";

export default defineConfig({
  project: "<project ref>",
  // Your other config settings...
  build: {
    extensions: [puppeteer()],
  },
});
```

### 2. Environment Variable
Set the following environment variable in your Trigger.dev dashboard (Environment Variables section):

```
PUPPETEER_EXECUTABLE_PATH: "/usr/bin/google-chrome-stable"
```

## Additional Resources
The documentation directs users to "an example demonstrating how to use Puppeteer with Trigger.dev" for complete setup guidance and implementation patterns.

## Key Points
- The extension is built-in to Trigger.dev
- Chrome installation is required on the deployment environment
- Configuration must include the executable path for proper browser access

---
Source: https://trigger.dev/docs/config/extensions/puppeteer
