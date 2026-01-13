# FFmpeg Build Extension for Trigger.dev

## Overview

The FFmpeg build extension enables FFmpeg integration within Trigger.dev projects. This tool processes video and audio files during task execution.

## Basic Setup

To integrate FFmpeg, add the extension to your configuration:

```typescript
import { defineConfig } from "@trigger.dev/sdk";
import { ffmpeg } from "@trigger.dev/build/extensions/core";

export default defineConfig({
  project: "<project ref>",
  build: {
    extensions: [ffmpeg()],
  },
});
```

By default, the extension installs FFmpeg from Debian's package manager via `apt`.

## FFmpeg 7.x Static Build

For FFmpeg 7.x compatibility, use the static build variant:

```typescript
export default defineConfig({
  project: "<project ref>",
  build: {
    extensions: [ffmpeg({ version: "7" })],
  },
});
```

This option deploys a static FFmpeg 7.x build rather than the Debian package.

## Environment Variables

The extension automatically sets `FFMPEG_PATH` and `FFPROBE_PATH` environment variables, facilitating integration with libraries like `fluent-ffmpeg`.

**Important:** Add `fluent-ffmpeg` to the `external` configuration in `trigger.config.ts`.

## Next Steps

Refer to the FFmpeg video processing guide for comprehensive implementation examples with Trigger.dev.

---
Source: https://trigger.dev/docs/config/extensions/ffmpeg
