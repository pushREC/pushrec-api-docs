# Additional Files - Trigger.dev Documentation

## Overview

The `additionalFiles` build extension enables copying supplementary files into the build directory during both development and deployment phases.

## Implementation

### Basic Setup

Import and configure the extension in `trigger.config.ts`:

```typescript
import { defineConfig } from "@trigger.dev/sdk";
import { additionalFiles } from "@trigger.dev/build/extensions/core";

export default defineConfig({
  project: "<project ref>",
  // Recommended setting
  legacyDevProcessCwdBehaviour: false,
  build: {
    extensions: [
      additionalFiles({
        files: ["./assets/**", "wrangler/wrangler.toml"]
      })
    ],
  },
});
```

## Key Characteristics

**File Globbing Support**: The `files` array accepts glob patterns for flexible file matching.

**Path Preservation**: Output paths maintain the relative structure from the project root.

**Dual Scope**: The extension operates identically during both `dev` and `deploy` commands.

## Working Directory Consideration

When `legacyDevProcessCwdBehaviour: false` is configured, developers can reference copied files using `process.cwd()`:

```typescript
import path from "node:path";

const fontPath = path.join(process.cwd(), "assets/Inter-Regular.ttf");
```

## Project Root Definition

The project root is identified as the directory containing `trigger.config.ts`.

---
Source: https://trigger.dev/docs/config/extensions/additionalFiles
