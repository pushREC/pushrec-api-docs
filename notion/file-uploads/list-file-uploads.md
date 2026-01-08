---
source: https://developers.notion.com/reference/list-file-uploads
scraped: 2026-01-08
---

# List File Uploads

## Endpoint

**GET** `https://api.notion.com/v1/file_uploads`

## Description

Retrieves file upload objects associated with the current bot integration, ordered by most recent first.

## Query Parameters

| Parameter | Type | Description |
|-----------|------|-------------|
| `start_cursor` | string | Pagination cursor |
| `page_size` | integer | Results per page |

## Response

Returns a paginated list of File Upload objects.

## Key Details

- Results ordered by most recent uploads first
- Supports pagination via cursors
- Only returns uploads created by the current integration
