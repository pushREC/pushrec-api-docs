# Prisma Extension

**NOTE:** This page was too large to fetch via WebFetch.

## Source
https://trigger.dev/docs/config/extensions/prismaExtension

## What We Know

The Prisma extension is a built-in extension for Trigger.dev that enables Prisma ORM support in tasks.

### Basic Usage Pattern (Inferred)
```typescript
import { defineConfig } from "@trigger.dev/sdk";
import { prismaExtension } from "@trigger.dev/build/extensions/core";

export default defineConfig({
  project: "<project ref>",
  build: {
    extensions: [
      prismaExtension(),
    ],
  },
});
```

### Expected Features
Based on standard Prisma integration patterns:
- Automatic Prisma Client generation
- Database migration support
- Schema file handling
- Connection string management

---

**To get complete documentation:** Visit https://trigger.dev/docs/config/extensions/prismaExtension directly in a browser.

Last attempted: 2026-01-13
