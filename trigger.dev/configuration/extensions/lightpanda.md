# Lightpanda Build Extension Documentation

## Overview
The Lightpanda build extension enables integration of the Lightpanda browser into Trigger.dev projects.

## Installation

To add Lightpanda to your project, modify `trigger.config.ts`:

```typescript
import { defineConfig } from "@trigger.dev/sdk";
import { lightpanda } from "@trigger.dev/build/extensions/lightpanda";

export default defineConfig({
  project: "<project ref>",
  build: {
    extensions: [lightpanda()],
  },
});
```

## Configuration Options

The extension accepts two configurable parameters:

- **`version`**: Browser version to install. Defaults to `"latest"`
- **`disableTelemetry`**: Toggle telemetry reporting. Defaults to `false`

## Example Configuration

```typescript
import { defineConfig } from "@trigger.dev/sdk";
import { lightpanda } from "@trigger.dev/build/extensions/lightpanda";

export default defineConfig({
  project: "<project ref>",
  build: {
    extensions: [
      lightpanda({
        version: "nightly",
        disableTelemetry: true,
      }),
    ],
  },
});
```

## Local Development

For local development workflows, the Lightpanda browser binary must be manually downloaded and added to your system's `PATH`. Refer to the official Lightpanda documentation for installation instructions.

## Next Steps

Users can explore the "Lightpanda" guide to learn practical implementation within their projects.

---
Source: https://trigger.dev/docs/config/extensions/lightpanda
