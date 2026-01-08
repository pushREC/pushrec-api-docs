---
source: https://developers.notion.com/reference/post-database-query-sort
scraped: 2026-01-08
status: deprecated
---

# Sort Database Entries (Deprecated)

> **Note:** This documentation is for API versions up to 2022-06-28. The 2025-09-03 version separates databases and data sources into separate concepts.

## Overview

A sort is a condition used to order the entries returned from a database query.

Database queries support sorting by:
- Property values
- Timestamps (creation or modification times)
- Multiple properties (nested sorts)

## Sort Object Structure

### Property-Based Sorting

| Field | Type | Description |
|-------|------|-------------|
| `property` | string | The field name to sort against |
| `direction` | enum | `"ascending"` or `"descending"` |

**Example:**

```json
{"property": "Name", "direction": "ascending"}
```

### Timestamp-Based Sorting

| Field | Type | Description |
|-------|------|-------------|
| `timestamp` | enum | `"created_time"` or `"last_edited_time"` |
| `direction` | enum | `"ascending"` or `"descending"` |

## Nested Sorting

Multiple sort conditions can be applied as an array. The first condition takes precedence:

```json
{
  "sorts": [
    {"property": "Food group", "direction": "descending"},
    {"property": "Name", "direction": "ascending"}
  ]
}
```

Results are first sorted by Food group, then by Name within each group.

## JavaScript SDK Example

```javascript
const { Client } = require('@notionhq/client');
const notion = new Client({ auth: process.env.NOTION_API_KEY });

const response = await notion.databases.query({
  database_id: 'your-database-id',
  sorts: [{property: "Name", direction: "ascending"}]
});
```
