# aptGet Build Extension - Trigger.dev Documentation

## Overview

The `aptGet` build extension enables installation of system packages into the deployed Docker image for Trigger.dev tasks.

## Basic Usage

To use this extension, import it and configure it in your `trigger.config.ts`:

```typescript
import { defineConfig } from "@trigger.dev/sdk";
import { aptGet } from "@trigger.dev/build/extensions/core";

export default defineConfig({
  project: "<project ref>",
  // Your other config settings...
  build: {
    extensions: [aptGet({ packages: ["ffmpeg"] })],
  },
});
```

## Installing Specific Package Versions

You can specify exact versions when needed by appending version information to the package name:

```typescript
import { defineConfig } from "@trigger.dev/sdk";

export default defineConfig({
  project: "<project ref>",
  // Your other config settings...
  build: {
    extensions: [aptGet({ packages: ["ffmpeg=6.0-4"] })],
  },
});
```

## Key Points

- The extension accepts a `packages` array parameter containing package names
- Version specifications follow standard apt-get syntax when precision is required
- Installed packages become available in your deployed task environment
- This complements other build extensions like `ffmpeg`, `playwright`, and `puppeteer`

---
Source: https://trigger.dev/docs/config/extensions/aptGet
