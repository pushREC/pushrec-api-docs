---
source: https://developers.notion.com/reference/patch-block-children
scraped: 2026-01-08
---

# Append Block Children

## Endpoint

**PATCH** `https://api.notion.com/v1/blocks/{block_id}/children`

## Description

Creates and appends new child blocks to a specified parent block.

## Path Parameters

| Parameter | Type | Required | Description |
|-----------|------|----------|-------------|
| `block_id` | string | Yes | The ID of the parent block |

## Request Body

| Parameter | Type | Required | Description |
|-----------|------|----------|-------------|
| `children` | array | Yes | Array of block objects to append |
| `after` | string | No | Block ID to insert after (appends to bottom if omitted) |

## Response

Returns a paginated list of newly created first-level child block objects.

## Key Constraints

| Constraint | Limit |
|------------|-------|
| Maximum block children per request | 100 |
| Maximum nesting levels per request | 2 |

## Important Notes

- Blocks are appended to the bottom of the parent by default
- Use the `"after"` parameter to insert after a specific block ID
- Already existing blocks cannot be moved using this endpoint
- This operation works with blocks that can have children, including other blocks, pages, and databases

## Required Capabilities

This endpoint requires integration to have **insert content** capabilities.

## Error Responses

| Status | Description |
|--------|-------------|
| 403 | Missing insert content capabilities |
| 404 | Block doesn't exist or integration lacks access |
| 400/429 | Request exceeds rate limits |
