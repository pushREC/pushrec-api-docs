---
source: https://developers.notion.com/reference/send-a-file-upload
scraped: 2026-01-08
---

# Send a File Upload

## Endpoint

**POST** `https://api.notion.com/v1/file_uploads/{file_upload_id}/send`

## Description

Transmits file contents to Notion for a file upload object.

## Path Parameters

| Parameter | Type | Required | Description |
|-----------|------|----------|-------------|
| `file_upload_id` | string | Yes | The ID of the file upload |

## Request Body

Uses `multipart/form-data` content type with file contents provided under the `file` key.

## Content-Type Requirements

- Must use `multipart/form-data`
- Include a `boundary` parameter per RFC 2388
- Most request libraries handle this automatically when provided a form data object

## File Naming

- Maximum filename length: 900 bytes (including extension)
- Shorter names recommended for better performance

## Multi-Part Uploads

When `mode=multi_part`:

| Field | Description |
|-------|-------------|
| `part_number` | Position indicator for each part |
| Concurrency | Parts may be sent concurrently and out of order |
| Completion | All parts must complete before calling the complete endpoint |

## Important Notes

- The use of `multipart/form-data` is unique to this endpoint
- Other Notion APIs use JSON parameters
- Parts can be transmitted concurrently up to standard rate limits
