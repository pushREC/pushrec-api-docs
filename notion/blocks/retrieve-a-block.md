---
source: https://developers.notion.com/reference/retrieve-a-block
scraped: 2026-01-08
---

# Retrieve a Block

## Endpoint

**GET** `https://api.notion.com/v1/blocks/{block_id}`

## Description

Retrieves a Block object using a specified block identifier.

## Path Parameters

| Parameter | Type | Required | Description |
|-----------|------|----------|-------------|
| `block_id` | string | Yes | The ID of the block to retrieve |

## Response

Returns a Block object.

## Key Notes

- If the block returned contains `has_children: true`, use the Retrieve block children endpoint to get the list of children
- Page IDs can be used as block IDs when calling the retrieve block children endpoint
- Page content is modeled as hierarchical block structures

## Required Capabilities

This endpoint requires integrations to have **read content** capabilities.

## Error Responses

| Status | Description |
|--------|-------------|
| 403 | Missing read content capabilities |
| 404 | Block doesn't exist or integration lacks access |
| 400/429 | Request exceeds rate limits |
