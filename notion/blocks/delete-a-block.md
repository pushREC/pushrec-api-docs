---
source: https://developers.notion.com/reference/delete-a-block
scraped: 2026-01-08
---

# Delete a Block

## Endpoint

**DELETE** `https://api.notion.com/v1/blocks/{block_id}`

## Description

Archives a Block object by setting its `archived` property to `true`. This includes page blocks. In Notion's user interface, archived blocks move to "Trash" but remain accessible for restoration.

## Path Parameters

| Parameter | Type | Required | Description |
|-----------|------|----------|-------------|
| `block_id` | string | Yes | The ID of the block to delete |

## Response

Returns the archived Block object with `archived: true`.

## Restoration

To restore an archived block via the API, use either:
- Update a block endpoint
- Update page endpoint

## Important Notes

- The API marks blocks as archived rather than deleting them permanently
- While users see blocks in a recoverable trash state, the technical implementation uses archival
- This endpoint works on both regular blocks and page blocks

## Required Capabilities

Integration must have **update content** capabilities.

## Error Responses

| Status | Description |
|--------|-------------|
| 403 | Missing update content capabilities |
| 404 | Block doesn't exist or integration lacks access |
| 400/429 | Request exceeds rate limits |
