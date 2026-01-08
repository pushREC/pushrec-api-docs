---
source: https://developers.notion.com/reference/status-codes
scraped: 2026-01-08
---

# Status Codes

## Overview

The Notion API uses standard HTTP response codes to communicate request outcomes. Responses are categorized into success and error classes.

## Success Responses

| Status | Description |
|--------|-------------|
| **HTTP 200** | Notion successfully processed the request |

## Error Responses

Error responses include `"code"` and `"message"` properties in the response body for debugging purposes.

### Client Errors (4xx)

| Status | Code | Description |
|--------|------|-------------|
| **400** | `invalid_json` | Request body cannot be decoded as JSON |
| **400** | `invalid_request_url` | The request URL format is invalid |
| **400** | `invalid_request` | The operation type isn't supported by the API |
| **400** | `invalid_grant` | Authorization credentials are invalid, expired, or revoked |
| **400** | `validation_error` | Request parameters don't match the expected schema |
| **400** | `missing_version` | The required `Notion-Version` header is absent |
| **401** | `unauthorized` | The bearer token is not valid |
| **403** | `restricted_resource` | The token lacks permission for the requested operation |
| **404** | `object_not_found` | The resource doesn't exist or isn't shared with your integration |
| **409** | `conflict_error` | Data collision during transaction, or File Upload storage provider outage |
| **429** | `rate_limited` | Request frequency exceeds allowed thresholds |

### Server Errors (5xx)

| Status | Code | Description |
|--------|------|-------------|
| **500** | `internal_server_error` | Unexpected server failure |
| **502** | `bad_gateway` | Upstream connection failure during request processing |
| **503** | `service_unavailable` | System unavailable or response exceeds 60-second timeout |
| **503** | `database_connection_unavailable` | Database connection unavailable |
| **504** | `gateway_timeout` | Request processing timeout |
