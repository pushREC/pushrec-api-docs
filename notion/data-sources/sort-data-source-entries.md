---
source: https://developers.notion.com/reference/sort-data-source-entries
scraped: 2026-01-08
---

# Sort Data Source Entries

## Overview

A sort is a condition used to order the entries returned from a data source query.

## Sort Capabilities

Data source queries support sorting by:
- Individual properties with directional control
- Entry timestamps (created_time or last_edited_time)
- Multiple properties simultaneously (nested sorting)

## Sort Object Structure

### Property Value Sort

| Property | Type | Description | Example |
|----------|------|-------------|---------|
| `property` | string | The property name to sort against | `"Ingredients"` |
| `direction` | string (enum) | `"ascending"` or `"descending"` | `"descending"` |

### Entry Timestamp Sort

| Property | Type | Description | Example |
|----------|------|-------------|---------|
| `timestamp` | string (enum) | `"created_time"` or `"last_edited_time"` | `"last_edited_time"` |
| `direction` | string (enum) | `"ascending"` or `"descending"` | `"descending"` |

## Examples

### Single Property Sort

```json
{
  "sorts": [
    {
      "property": "created_time",
      "direction": "ascending"
    }
  ]
}
```

### Nested Sort (Multiple Properties)

```json
{
  "sorts": [
    {
      "property": "Food group",
      "direction": "descending"
    },
    {
      "property": "Name",
      "direction": "ascending"
    }
  ]
}
```

In nested sorts, the first-listed property takes precedence in ordering.
