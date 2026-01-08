---
source: https://developers.notion.com/reference/update-property-schema-object
scraped: 2026-01-08
status: deprecated
---

# Update Database Properties (Deprecated)

> **Note:** This section is deprecated as of version 2025-09-03. Use the "Update data source properties" endpoint instead.

## Overview

Update properties (columns) in a Notion database using PATCH requests.

## Key Operations

### Remove a Property

Set a property object to `null` to delete it:

```json
{
  "properties": { "J@cT": null }
}
```

### Rename a Property

Update the `name` field within the property object:

```json
{
  "properties": {
    "existing_property_id": {
      "name": "New Property Name"
    }
  }
}
```

### Update Property Type

Modify the property schema by specifying the type key. Supported types:

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
- Timestamp types

**Limitation:** The `title` property type cannot be changed.

## Select & Multi-Select Options

When updating these property types, the `options` array can include:
- Existing options (identified by ID/name)
- New option objects

Omitted options are removed from the database.

## Notable Limitations

| Limitation | Description |
|------------|-------------|
| Formula Depth | Formulas exceeding depth of 10 referenced tables return validation errors |
| Rollup Aggregations | `show_unique`, `unique`, `median` return all property items instead of computed values |
| Missing Permissions | "Could not find page/database" errors occur when integration lacks access to related pages |
| Pagination | Property values computed during pagination may become inaccurate if underlying data changes |
