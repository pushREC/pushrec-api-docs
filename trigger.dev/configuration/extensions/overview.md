# Build Extensions Documentation Summary

## Overview
Build extensions are customization tools that hook into Trigger.dev's build system to modify project builds and deployments. They can alter the build process, resulting bundle, or container image.

## Installation & Setup

Extensions are added to `trigger.config.ts` under the `build.extensions` property. Pre-built extensions come from the `@trigger.dev/build` package installed in `devDependencies`, or developers can create custom ones.

**Basic Example:**
```typescript
export default defineConfig({
  project: "my-project",
  build: {
    extensions: [
      {
        name: "my-extension",
        onBuildStart: async (context) => {
          console.log("Build starting!");
        },
      },
    ],
  },
});
```

**Using Pre-built Extensions:**
```typescript
import { ffmpeg } from "@trigger.dev/build/extensions/core";

export default defineConfig({
  project: "my-project",
  build: {
    extensions: [ffmpeg()],
  },
});
```

## Built-in Extensions

| Extension | Purpose |
|-----------|---------|
| prismaExtension | Enable Prisma ORM in tasks |
| pythonExtension | Execute Python scripts |
| puppeteer | Headless browser automation |
| ffmpeg | Video/audio processing |
| aptGet | Install system packages |
| additionalFiles | Copy extra files to build |
| additionalPackages | Add npm packages |
| syncEnvVars | Auto-sync environment variables |
| syncVercelEnvVars | Sync from Vercel specifically |
| esbuildPlugin | Customize esbuild configuration |
| emitDecoratorMetadata | Enable TypeScript decorator support |
| audioWaveform | Add audio waveform tools |

## Custom Extensions

Developers requiring functionality beyond built-in options can create custom extensions following the provided guide on custom build extensions.

---
Source: https://trigger.dev/docs/config/extensions/overview
