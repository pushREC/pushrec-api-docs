---
source: https://developers.notion.com/reference/retrieve-comment
scraped: 2026-01-08
---

# Retrieve a Comment

## Endpoint

**GET** `https://api.notion.com/v1/comments/{comment_id}`

## Description

Retrieves a Comment object using its unique identifier.

## Path Parameters

| Parameter | Type | Required | Description |
|-----------|------|----------|-------------|
| `comment_id` | string | Yes | The ID of the comment to retrieve |

## Response

Returns a Comment object containing metadata and content.

## Required Capabilities

Integration must have **read comment** capabilities enabled. Comment capabilities are disabled by default.

To enable permissions, visit the integration dashboard and update capability settings.

## Error Responses

| Status | Description |
|--------|-------------|
| 403 | Missing read comment capabilities |
| 404 | Comment doesn't exist or access denied |
| 400/429 | Request exceeds rate limits |
