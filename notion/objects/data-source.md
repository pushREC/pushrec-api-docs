---
source: https://developers.notion.com/reference/data-source
scraped: 2026-01-08
---

# Data Source Object

## Overview

Data sources represent individual tables within a Notion database. Data sources are the individual tables of data that live under a Notion database. Pages are the items (or children) in a data source.

## Data Model Hierarchy

```
Database
  └── Data Source(s)
       └── Page(s)
```

Prior to API version `2025-09-03`, these concepts were unified in the API.

## Core Object Fields

| Field | Type | Purpose |
|-------|------|---------|
| `object` | string | Always returns `"data_source"` |
| `id` | UUID string | Unique identifier for the data source |
| `properties` | object | Schema defining available properties with names and Property objects |
| `parent` | object | References the parent database |
| `database_parent` | object | References the database's parent container |
| `created_time` | ISO 8601 | Creation timestamp |
| `created_by` | Partial User | Creator information |
| `last_edited_time` | ISO 8601 | Last modification timestamp |
| `last_edited_by` | Partial User | Last editor information |
| `title` | Rich text array | Data source name as displayed in Notion |
| `description` | Rich text array | Data source description |
| `icon` | File/Emoji object | Associated icon |
| `archived` | boolean | Archival status |
| `in_trash` | boolean | Deletion status |

## Available API Operations

| Operation | Description |
|-----------|-------------|
| **Create** | Add additional data sources to existing databases |
| **Update** | Modify attributes including properties |
| **Retrieve** | Fetch data source information |
| **Query** | Execute searches with filtering and sorting capabilities |

## Important Constraints

Notion recommends maintaining a maximum schema size of **50KB**. Updates exceeding this threshold will be blocked to preserve database performance.
