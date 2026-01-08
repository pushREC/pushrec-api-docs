---
source: https://developers.notion.com/reference/create-a-file-upload
scraped: 2026-01-08
---

# Create a File Upload

## Endpoint

**POST** `https://api.notion.com/v1/file_uploads`

## Description

Initiates the file upload process to a Notion workspace.

## Request Body

| Parameter | Type | Required | Description |
|-----------|------|----------|-------------|
| `filename` | string | No | Name for the file (max 900 bytes) |
| `content_type` | string | No | MIME type of the file |
| `mode` | string | No | Upload mode: `single` or `multi_part` |

## Response

Returns a File Upload object with status `"pending"`.

## Constraints

The `filename` parameter has a maximum length of 900 bytes, including the file extension. Shorter names are recommended for performance and easier file management.

## File Upload Workflow

This endpoint is step 1 of 3:

1. **Create a file upload** (this endpoint) - Initiates the upload
2. **Send a file upload** - Transmits the actual file data
3. **Complete a file upload** - Finalizes the upload process
