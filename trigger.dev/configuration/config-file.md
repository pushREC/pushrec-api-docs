# trigger.config.ts Configuration File

**NOTE:** This page was too large to fetch via WebFetch (>1MB HTML content).

## Source
https://trigger.dev/docs/config/config-file

## What We Know

This is the main configuration file for Trigger.dev projects. Based on other documentation pages, it should contain:

### Basic Structure
```typescript
import { defineConfig } from "@trigger.dev/sdk";

export default defineConfig({
  project: "<project ref>",
  // ... other configuration options
});
```

### Known Configuration Sections

**project**: Project reference/identifier

**build**: Build configuration including:
- `extensions`: Array of build extensions (see extensions directory for available options)
- `external`: External dependencies to not bundle

**legacyDevProcessCwdBehaviour**: Boolean flag affecting how process.cwd() works in dev mode

### Related Documentation
- Build extensions: See `/configuration/extensions/` for all available build extensions
- Each extension has its own configuration options documented in its respective file

---

**To get complete documentation:** Visit https://trigger.dev/docs/config/config-file directly in a browser, or use a different scraping method that can handle large HTML pages.

Last attempted: 2026-01-13
