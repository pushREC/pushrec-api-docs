---
source: https://developers.notion.com/reference/get-users
scraped: 2026-01-08
---

# List All Users

## Endpoint

**GET** `https://api.notion.com/v1/users`

## Description

Returns a paginated list of Users for the workspace.

## Query Parameters

| Parameter | Type | Description |
|-----------|------|-------------|
| `start_cursor` | string | Pagination cursor |
| `page_size` | integer | Results per page |

## Response

Returns a paginated list of User objects.

## Key Details

- Response may contain fewer than `page_size` results
- Guest accounts are excluded from the response
- Supports pagination via cursors

## Limitations

The API currently cannot filter users by email address or name.

## Required Capabilities

Integration must have **user information** capabilities.

## Error Responses

| Status | Description |
|--------|-------------|
| 403 | Missing user information capabilities |
| 429 | Request exceeds rate limits |
