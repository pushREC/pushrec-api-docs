---
source: https://developers.notion.com/reference/update-a-block
scraped: 2026-01-08
---

# Update a Block

## Endpoint

**PATCH** `https://api.notion.com/v1/blocks/{block_id}`

## Description

Modifies block content based on the specified block type. The update replaces entire field values, so omitting a field preserves its current state.

## Path Parameters

| Parameter | Type | Required | Description |
|-----------|------|----------|-------------|
| `block_id` | string | Yes | The ID of the block to update |

## Request Body

The request body varies based on block type. Include only the fields you want to update.

## Response

Returns the updated Block object with HTTP 200 on success.

## Key Constraints

| Constraint | Description |
|------------|-------------|
| Field replacement | The update replaces the entire value for a given field |
| No child updates | Direct child block updates aren't supported; use Append block children endpoint |
| Special blocks | Child pages and databases require their respective update endpoints |
| Toggle headings | Heading blocks support optional `is_toggleable` property |
| Toggle restriction | Toggled headings with children cannot have the toggle removed |

## Required Capabilities

Integration must possess **update content** capabilities to use this endpoint.

## Error Responses

| Status | Description |
|--------|-------------|
| 200 | Success - returns updated block object |
| 400 | Incorrect block type or invalid field input |
| 403 | Missing update content capabilities |
| 404 | Block doesn't exist, is archived, or access denied |
| 429 | Request limit exceeded |
