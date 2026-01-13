# Auto-pagination - Trigger.dev Documentation

## Overview

This documentation page explains how to use auto-pagination with the Trigger.dev management API.

## Main Content

**Key Feature:** "All list endpoints in the management API support auto-pagination."

### Method 1: Using `for await...of` Syntax

The documentation demonstrates iterating through paginated results with async iteration:

```typescript
import { runs } from "@trigger.dev/sdk";

async function fetchAllRuns() {
  const allRuns = [];

  for await (const run of runs.list({ limit: 10 })) {
    allRuns.push(run);
  }

  return allRuns;
}
```

This approach automatically handles pagination across multiple pages.

### Method 2: Manual Pagination with Helper Methods

Alternatively, developers can use helper methods to manually navigate pages:

```typescript
import { runs } from "@trigger.dev/sdk";

async function main() {
  let page = await runs.list({ limit: 10 });

  for (const run of page.data) {
    console.log(run);
  }

  while (page.hasNextPage()) {
    page = await page.getNextPage();
    // ... do something with the next page
  }
}
```

Available methods include `hasNextPage()` and `getNextPage()` for controlling pagination flow.

## Summary

The page provides two practical approaches for handling paginated API responses, offering flexibility between automatic iteration and manual page control.
