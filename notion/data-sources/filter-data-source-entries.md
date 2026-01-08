---
source: https://developers.notion.com/reference/filter-data-source-entries
scraped: 2026-01-08
---

# Filter Data Source Entries

## Overview

Limit returned entries when querying a data source using a `filter` object in the request body.

## Filter Structure

Each filter contains:
- `property`: The property name or ID to filter on
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

## Supported Property Types

| Type | Conditions |
|------|------------|
| **Checkbox** | `equals`, `does_not_equal` (boolean) |
| **Date** | `after`, `before`, `equals`, `on_or_after`, `on_or_before`, `is_empty`, `is_not_empty`, `next_week`, `next_month`, `next_year`, `past_week`, `past_month`, `past_year`, `this_week` |
| **Files** | `is_empty`, `is_not_empty` |
| **Formula** | Matches result type (checkbox, date, number, string) |
| **Multi-select** | `contains`, `does_not_contain`, `is_empty`, `is_not_empty` |
| **Number** | `equals`, `does_not_equal`, `greater_than`, `greater_than_or_equal_to`, `less_than`, `less_than_or_equal_to`, `is_empty`, `is_not_empty` |
| **People** | `contains`, `does_not_contain`, `is_empty`, `is_not_empty` (UUIDv4) |
| **Phone number** | Same as rich text |
| **Relation** | `contains`, `does_not_contain`, `is_empty`, `is_not_empty` (UUIDv4) |
| **Rich text** | `contains`, `does_not_contain`, `equals`, `does_not_equal`, `starts_with`, `ends_with`, `is_empty`, `is_not_empty` |
| **Select** | `equals`, `does_not_equal`, `is_empty`, `is_not_empty` |
| **Status** | `equals`, `does_not_equal`, `is_empty`, `is_not_empty` |
| **Timestamp** | Date conditions on `created_time` or `last_edited_time` |
| **Verification** | `status` with values `verified`, `expired`, `none` |
| **ID** | Numeric comparisons |

## Compound Filters

Combine multiple conditions using `and` or `or` operators:

```json
{
  "and": [
    {"property": "Done", "checkbox": {"equals": true}},
    {"property": "Tags", "multi_select": {"contains": "A"}}
  ]
}
```

Nesting supports up to two levels deep.

## Notes

- Without a filter, all entries return with pagination
- Date comparisons use millisecond precision with UTC default
- Rollup properties support `any`, `every`, `none` conditions
