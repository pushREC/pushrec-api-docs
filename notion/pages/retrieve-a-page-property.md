---
source: https://developers.notion.com/reference/retrieve-a-page-property
scraped: 2026-01-08
---

# Retrieve a Page Property Item

## Endpoint

**GET** `https://api.notion.com/v1/pages/{page_id}/properties/{property_id}`

## Description

Retrieves a property item object for a specified page and property, returning either a single value or a paginated list depending on the property type.

## Path Parameters

| Parameter | Type | Required | Description |
|-----------|------|----------|-------------|
| `page_id` | string | Yes | The ID of the page |
| `property_id` | string | Yes | The ID of the property to retrieve |

## Query Parameters

| Parameter | Type | Required | Description |
|-----------|------|----------|-------------|
| `start_cursor` | string | No | Cursor for pagination |
| `page_size` | integer | No | Number of results per page |

## Response

### Simple Properties

Return a single `type` key with the corresponding property value object.

### Paginated Properties

These property types return multiple items with pagination:

- `title`
- `rich_text`
- `relation`
- `people`

Include a `next_url` field for accessing additional results.

## Rollup Properties

| Rollup Type | Behavior |
|-------------|----------|
| "Show original" | Flattens all property items |
| With aggregations | Returns rollup property value under `rollup` key plus relation list |

Large rollups may include a `next_cursor` for pagination. The final aggregation value appears only when `has_more` returns `false`.

### Unsupported Aggregations

These return as property item lists instead:

- Show unique values
- Count unique values
- Median

## When to Use

Use this endpoint instead of "Retrieve a page" when properties exceed 25 references.

## Obtaining Property IDs

Get `property_id` values via the "Retrieve a database" endpoint.

## Required Capabilities

Integration must have **read content** capabilities.

## Error Responses

| Status | Description |
|--------|-------------|
| 403 | Missing read content capabilities |
| 404 | Page or property doesn't exist |
| 400/429 | Rate limit violations |
