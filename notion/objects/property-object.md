---
source: https://developers.notion.com/reference/property-object
scraped: 2026-01-08
---

# Data Source Properties

## Overview

Data source property objects define the schema for Notion data sources, rendered as columns in the Notion UI. Each property contains an `id`, `name`, `type`, and type-specific configuration object.

## Core Property Fields

| Field | Type | Purpose |
|-------|------|---------|
| `id` | string | Unique identifier (e.g., "title" for title properties) |
| `name` | string | Display name in Notion UI |
| `description` | string | Property description |
| `type` | string (enum) | Controls property behavior |

## Supported Property Types

### Basic Types

| Type | Description |
|------|-------------|
| `checkbox` | Boolean toggle values |
| `rich_text` | Text content |
| `title` | Page title (required, one per data source) |
| `url` | Web links |
| `email` | Email addresses |
| `phone_number` | Phone numbers |
| `number` | Numeric values with formatting options |
| `date` | Date values |

### Selection Types

| Type | Description |
|------|-------------|
| `select` | Single option from list |
| `multi_select` | Multiple options from list |
| `status` | Status values with grouping |

### System Types

| Type | Description |
|------|-------------|
| `created_by` | Creator attribution |
| `created_time` | Creation timestamp |
| `last_edited_by` | Last editor attribution |
| `last_edited_time` | Last modification timestamp |

### Relationship Types

| Type | Description |
|------|-------------|
| `relation` | References to other data sources |
| `rollup` | Aggregated values from related entries |
| `formula` | Computed values using expressions |

### Other Types

| Type | Description |
|------|-------------|
| `files` | File uploads and external links |
| `people` | User mentions |
| `place` | Location data with coordinates |
| `unique_id` | Auto-incrementing unique identifiers with optional prefix |

## Key Constraints

- All data sources require exactly one `title` property and one data source title field
- Status property names and option names must be unique (case-insensitive)
- Commas are invalid in select/multi-select option names
- Status properties cannot be updated via API; modify through Notion UI instead

## Related Database Requirements

To access relation properties from other data sources, those databases must be shared with your integration in addition to the primary database.
