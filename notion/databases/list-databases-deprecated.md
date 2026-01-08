---
source: https://developers.notion.com/reference/get-databases
scraped: 2026-01-08
status: deprecated
---

# List Databases (Deprecated)

> **Status:** Deprecated (API version 2021-08-16 and earlier only). Use the Search API instead.

## Endpoint

**GET** `https://api.notion.com/v1/databases`

## Description

Retrieves all databases that have been shared with an authenticated integration. The response may contain fewer results than the specified `page_size`.

## Key Limitations

This endpoint is outdated. As stated in the documentation: "Use the Search API instead. This endpoint will only return explicitly shared databases, while search will also return child pages."

Additional constraints:
- Cannot filter results (unlike the replacement Search API)
- Results depend on user-sharing permissions
- Cannot match on page titles

## Query Parameters

| Parameter | Type | Description |
|-----------|------|-------------|
| `start_cursor` | string | Pagination cursor |
| `page_size` | integer | Number of results per page |

## Requirements

Integration must have **read content** capabilities.

## Access Control

Integrations can only access databases a user has shared with the integration.

## Migration Path

Developers should migrate to the Search API endpoint (`/v1/search`), which offers:
- Superior filtering capabilities
- Broader result coverage (including child pages)
- Title matching

## Error Responses

| Status | Description |
|--------|-------------|
| 403 | Missing read content capabilities |
| 429 | Request exceeds rate limits |
