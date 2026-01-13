# Audio Waveform Build Extension Documentation

## Overview

The `audioWaveform` build extension enables support for Audio Waveform in Trigger.dev projects. This extension replaces the previous approach of installing Audio Waveform directly in the build image.

## Source

According to the documentation, "Previously, we installed [Audio Waveform](https://github.com/bbc/audiowaveform) in the build image. That's been moved to a build extension."

## Implementation

To use this extension, add it to your `trigger.config.ts` file:

```typescript
import { defineConfig } from "@trigger.dev/sdk";
import { audioWaveform } from "@trigger.dev/build/extensions/audioWaveform";

export default defineConfig({
  project: "<project ref>",
  // Your other config settings...
  build: {
    extensions: [audioWaveform()], // uses version 1.1.0 of audiowaveform by default
  },
});
```

## Version

The extension uses version 1.1.0 of audiowaveform by default.

## Context

This documentation appears within Trigger.dev's configuration section under "Built-in extensions," positioned alongside other extensions like Prisma, Python, Playwright, Puppeteer, FFmpeg, and custom build extensions.

---
Source: https://trigger.dev/docs/config/extensions/audioWaveform
