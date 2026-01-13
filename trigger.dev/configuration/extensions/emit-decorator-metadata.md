# Emit Decorator Metadata - Trigger.dev Documentation

## Overview
The `emitDecoratorMetadata` build extension enables support for the TypeScript compiler option of the same name, required by certain ORMs like TypeORM that depend on decorator metadata emission.

## Configuration

To use this extension, import it and add it to your `trigger.config.ts`:

```typescript
import { defineConfig } from "@trigger.dev/sdk";
import { emitDecoratorMetadata } from "@trigger.dev/build/extensions/typescript";

export default defineConfig({
  project: "<project ref>",
  // Your other config settings...
  build: {
    extensions: [emitDecoratorMetadata()],
  },
});
```

## Key Details

**Performance Consideration:** "It's not enabled by default because there is a performance cost to enabling it."

**How It Works:** The extension hooks into esbuild and uses TypeScript compiler APIs to compile files where decorators are detected.

**Requirements:**
- Must have `emitDecoratorMetadata` enabled in `tsconfig.json`
- Must have `typescript` installed in `devDependencies`

## Use Cases
Primarily beneficial when using ORMs or frameworks that require decorator metadata at runtime for reflection and type information.

---
Source: https://trigger.dev/docs/config/extensions/emitDecoratorMetadata
