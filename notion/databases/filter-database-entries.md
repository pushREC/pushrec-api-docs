---
source: https://developers.notion.com/reference/post-database-query-filter
scraped: 2026-01-08
status: deprecated
---

# Filter Database Entries (Deprecated)

> **Note:** This documentation covers API versions through 2022-06-28. The 2025-09-03 version separates databases and data sources into distinct concepts.

## Overview

When querying a database, send a `filter` object in the request body to limit returned entries based on specified criteria.

## Filter Object Structure

Each filter contains:
- `property`: The database property name or ID
- Type-specific condition: An object matching the property type

## Example

```json
{
  "filter": {
    "property": "Task completed",
    "checkbox": {
      "equals": true
    }
  }
}
```

## Supported Filter Types

### Checkbox

| Condition | Value Type |
|-----------|------------|
| `equals` | boolean |
| `does_not_equal` | boolean |

### Date

| Condition | Value Type |
|-----------|------------|
| `after`, `before`, `equals` | ISO 8601 date |
| `on_or_after`, `on_or_before` | ISO 8601 date |
| `is_empty`, `is_not_empty` | boolean |
| `next_month`, `next_week`, `next_year` | empty object |
| `past_month`, `past_week`, `past_year` | empty object |
| `this_week` | empty object |

### Files

| Condition | Value Type |
|-----------|------------|
| `is_empty`, `is_not_empty` | boolean |

### Number

| Condition | Value Type |
|-----------|------------|
| `equals`, `does_not_equal` | number |
| `greater_than`, `greater_than_or_equal_to` | number |
| `less_than`, `less_than_or_equal_to` | number |
| `is_empty`, `is_not_empty` | boolean |

### Rich Text

| Condition | Value Type |
|-----------|------------|
| `contains`, `does_not_contain` | string |
| `equals`, `does_not_equal` | string |
| `starts_with`, `ends_with` | string |
| `is_empty`, `is_not_empty` | boolean |

### Select / Status

| Condition | Value Type |
|-----------|------------|
| `equals`, `does_not_equal` | string |
| `is_empty`, `is_not_empty` | boolean |

### Multi-select

| Condition | Value Type |
|-----------|------------|
| `contains`, `does_not_contain` | string |
| `is_empty`, `is_not_empty` | boolean |

### People / Relation

| Condition | Value Type |
|-----------|------------|
| `contains`, `does_not_contain` | UUIDv4 |
| `is_empty`, `is_not_empty` | boolean |

### Timestamp

| Condition | Value Type |
|-----------|------------|
| `created_time`, `last_edited_time` | date conditions |

### Formula

Matches result type (checkbox, date, number, string).

## Compound Filters

```json
{
  "and": [
    {"property": "Done", "checkbox": {"equals": true}},
    {"or": [
      {"property": "Tags", "contains": "A"},
      {"property": "Tags", "contains": "B"}
    ]}
  ]
}
```

Nesting supports up to two levels deep.

## Notes

- If no filter is provided, all database pages are returned with pagination
- Date comparisons with time use millisecond precision; UTC is the default timezone
- Rollup properties support `any`, `every`, and `none` conditions for array values
