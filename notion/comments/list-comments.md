---
source: https://developers.notion.com/reference/list-comments
scraped: 2026-01-08
---

# List Comments

## Endpoint

**GET** `https://api.notion.com/v1/comments`

## Description

Retrieves unresolved comment objects from a page or block.

## Query Parameters

| Parameter | Type | Required | Description |
|-----------|------|----------|-------------|
| `block_id` | string | Yes | The ID of the block or page |
| `start_cursor` | string | No | Pagination cursor |
| `page_size` | integer | No | Results per page |

## Response

Returns a paginated list of Comment objects.

## Important Notes

- Returns only **unresolved** comments
- Works with both pages and blocks
- Supports pagination via cursors

## Required Capabilities

Integration must have **read comment** capabilities enabled. Comment capabilities are disabled by default.

## Error Responses

| Status | Description |
|--------|-------------|
| 403 | Missing read comment capabilities |
| 404 | Block/page doesn't exist or access denied |
| 400/429 | Request exceeds rate limits |
