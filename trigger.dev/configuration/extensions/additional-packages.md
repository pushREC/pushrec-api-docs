# Additional Packages - Trigger.dev Documentation

## Overview

The `additionalPackages` build extension enables inclusion of supplementary packages in your Trigger.dev build that aren't automatically detected through imports.

## Purpose

This extension is particularly useful when you need to install packages containing CLI tools that you want to invoke in tasks using the `exec` function.

## Implementation

### Basic Setup

Import the extension and configure it in your `trigger.config.ts`:

```typescript
import { defineConfig } from "@trigger.dev/sdk";
import { additionalPackages } from "@trigger.dev/build/extensions/core";

export default defineConfig({
  project: "<project ref>",
  // Your other config settings...
  build: {
    extensions: [additionalPackages({ packages: ["wrangler"] })],
  },
});
```

### Version Specification

The system attempts automatic version resolution, but you can specify explicit versions using the `@` symbol:

```typescript
build: {
  extensions: [
    additionalPackages({ packages: ["wrangler@1.19.0"] })
  ],
}
```

## Key Characteristics

- **Development Mode**: This extension has no effect during `dev` mode execution
- **Deployment**: Packages install in the build directory during `deploy`
- **Location**: Installed packages appear in the `node_modules` directory within the build environment

## Use Cases

Ideal scenarios include:
- CLI tools needed for task execution
- System utilities required during runtime
- External command-line applications invoked via `exec`

---
Source: https://trigger.dev/docs/config/extensions/additionalPackages
