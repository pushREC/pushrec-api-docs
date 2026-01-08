---
source: https://developers.notion.com/reference/update-data-source-properties
scraped: 2026-01-08
---

# Update Data Source Properties

## Overview

Modify data source properties (columns) via PATCH requests.

## Core Operations

### Remove a Property

Set the target property to `null` to delete it:

```json
{
  "properties": {
    "J@cT": null
  }
}
```

Both ID-based and name-based removal are supported.

### Rename a Property

Update the `name` field within the property object:

```json
{
  "properties": {
    "J@cT": {
      "name": "New Property Name"
    }
  }
}
```

### Update Property Type

Modify the property schema by specifying a type key.

**Supported types:**
- `title`
- `rich_text`
- `number`
- `select`
- `multi_select`
- `date`
- `people`
- `files`
- `checkbox`
- `url`
- `email`
- `phone_number`
- `formula`
- `relation`
- `rollup`
- `created_time`
- `created_by`
- `last_edited_time`
- `last_edited_by`

## Important Limitations

| Limitation | Description |
|------------|-------------|
| `title` type | Cannot be changed |
| `status` property | Name/options cannot be updated via API |
| Formula depth | Formulas exceeding 10 referenced tables trigger validation errors |
| Rollup aggregations | `show_unique`, `unique`, `median` return all items instead of computed values |
| Permissions | Integrations need access to related pages for rollup/formula computations |
| Pagination | Property values may become inaccurate if data changes during pagination |

## Select & Multi-Select Options

The `options` array can include:
- Existing options (require `name` and optional `id`)
- New option objects

If an existing option is omitted, it will be removed from the data source property. Existing option name and color cannot be updated.
