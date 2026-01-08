---
source: https://developers.notion.com/reference/get-block-children
scraped: 2026-01-08
---

# Retrieve Block Children

## Endpoint

**GET** `https://api.notion.com/v1/blocks/{block_id}/children`

## Description

Returns a paginated array of child block objects contained in the block using the ID specified.

## Path Parameters

| Parameter | Type | Required | Description |
|-----------|------|----------|-------------|
| `block_id` | string | Yes | The ID of the parent block |

## Query Parameters

| Parameter | Type | Required | Description |
|-----------|------|----------|-------------|
| `start_cursor` | string | No | Cursor for pagination |
| `page_size` | integer | No | Number of results to return (max 100) |

## Response

Returns a paginated list object containing:

| Field | Type | Description |
|-------|------|-------------|
| `object` | string | Always `"list"` |
| `results` | array | Array of block objects |
| `has_more` | boolean | Whether more results exist |
| `next_cursor` | string | Cursor for next page (null if no more) |

## Key Characteristics

- Only returns the first level of child blocks for a given parent block
- To obtain a complete block representation, recursively retrieve nested block children
- Response may contain fewer items than the `page_size` parameter

## Required Capabilities

This endpoint requires **read content** capabilities.

## Error Responses

| Status | Description |
|--------|-------------|
| 403 | Missing read content capabilities |
| 404 | Block doesn't exist or integration lacks access |
| 400/429 | Request exceeds rate limits |
