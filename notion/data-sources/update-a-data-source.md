---
source: https://developers.notion.com/reference/update-a-data-source
scraped: 2026-01-08
---

# Update a Data Source

## Endpoint

**PATCH** `https://api.notion.com/v1/data_sources/{data_source_id}`

## Description

Modifies a data source object within a database, allowing updates to properties, title, description, and trash status.

## Path Parameters

| Parameter | Type | Required | Description |
|-----------|------|----------|-------------|
| `data_source_id` | string | Yes | The ID of the data source to update |

## Request Body

| Parameter | Type | Description |
|-----------|------|-------------|
| `title` | array | Rich text array for data source title |
| `description` | array | Rich text array for description |
| `icon` | object | Emoji or file object |
| `properties` | object | Property schema updates |
| `parent` | object | New parent database (for moving) |
| `in_trash` | boolean | Move to/restore from trash |

## Moving Data Sources

The `parent` parameter enables relocating a data source to a different database. When moved:
- Existing views become linked views
- A new standard table view is automatically created in the destination database

## Type Conversion Behavior

When changing property types, data persists but displays differently:
- Multi-select values appear as comma-separated strings
- People properties use comma-separated IDs
- Not all conversions work reliably; some may prevent data from being returned

## Schema Limitations

Developers are encouraged to keep data source schema size to a maximum of **50KB** to maintain query performance.

## Unsupported Updates

The following properties cannot be modified via API:
- `formula`
- `status`
- Synced content
- `place`

## Row Management

This endpoint cannot update data source rows directly. Use:
- Update page properties endpoint for row data
- Create a page endpoint to add new rows

## Important Note

Relation properties require the related database to be shared with your integration before updates.
