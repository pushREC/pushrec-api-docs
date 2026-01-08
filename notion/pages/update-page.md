---
source: https://developers.notion.com/reference/patch-page
scraped: 2026-01-08
---

# Update Page

## Endpoint

**PATCH** `https://api.notion.com/v1/pages/{page_id}`

## Description

Modifies Notion page attributes including properties, icons, covers, and content status.

## Path Parameters

| Parameter | Type | Required | Description |
|-----------|------|----------|-------------|
| `page_id` | string | Yes | The ID of the page to update |

## Request Body

| Parameter | Type | Description |
|-----------|------|-------------|
| `properties` | object | Property values to update (must match parent schema) |
| `icon` | object | Emoji or file object for page icon |
| `cover` | object | File object for page cover |
| `archived` | boolean | Archive/restore page |
| `in_trash` | boolean | Alternative to archived |
| `is_locked` | boolean | Lock page from UI editing (API updates still work) |
| `template` | string | Apply template: `default` or template page ID |
| `erase_content` | boolean | Remove all block children (irreversible via API) |

## Use Cases

| Feature | Description |
|---------|-------------|
| **Updating Properties** | Modify properties when parent is a data source. Only `title` works outside data sources |
| **Icon, Cover, Archive** | Adjust visual elements or archive/restore pages |
| **Page Locking** | Use `is_locked` to prevent UI editing |
| **Template Application** | Merges template content and properties into existing page |
| **Content Erasure** | `erase_content` removes all block children (destructive, cannot be reversed) |

## Response

Returns the updated Page object.

## Limitations

- Rollup property value updates are unsupported
- A page's parent cannot be changed (use Move page endpoint)

## Required Capabilities

Integration needs **update content** capabilities.

## Error Responses

| Status | Description |
|--------|-------------|
| 403 | Missing update content capabilities |
| 404 | Page doesn't exist or access denied |
| 400/429 | Request limit violations |
