---
source: https://developers.notion.com/reference/parent-object
scraped: 2026-01-08
---

# Parent Object

## Overview

The parent object represents the hierarchical location of entities within Notion's API structure. Parent information is represented by a consistent `parent` object throughout the API.

## Parent Types

### Database Parent

Used primarily for Data source objects.

```json
{
  "type": "database_id",
  "database_id": "d9824bdc-8445-4327-be8b-5b47500af6ce"
}
```

| Property | Description |
|----------|-------------|
| `type` | Always `"database_id"` |
| `database_id` | UUID of the parent database |

### Data Source Parent

Commonly appears for Page objects.

```json
{
  "type": "data_source_id",
  "data_source_id": "1a44be12-0953-4631-b498-9e5817518db8",
  "database_id": "b8595b75-abd1-4cad-8dfe-f935a8ef57cb"
}
```

| Property | Description |
|----------|-------------|
| `type` | Always `"data_source_id"` |
| `data_source_id` | UUID of the parent data source |
| `database_id` | UUID of the parent database (convenience field) |

### Page Parent

Indicates a page nested within another page.

```json
{
  "type": "page_id",
  "page_id": "59833787-2cf9-4fdf-8782-e53db20768a5"
}
```

### Workspace Parent

Indicates top-level pages within a workspace.

```json
{
  "type": "workspace",
  "workspace": true
}
```

### Block Parent

For pages created inline or beneath other blocks.

```json
{
  "type": "block_id",
  "block_id": "7d50a184-5bbe-4d90-8f29-6bec57ed817b"
}
```

## Parenting Rules

Pages can be parented by other pages, data sources, blocks, or by the whole workspace.

| Entity | Can Be Parented By |
|--------|-------------------|
| Pages | Pages, data sources, blocks, or workspace |
| Blocks | Pages, data sources, or blocks |
| Databases | Pages, blocks, or workspace |
| Data sources | Databases only |
