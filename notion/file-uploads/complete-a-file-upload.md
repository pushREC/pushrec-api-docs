---
source: https://developers.notion.com/reference/complete-a-file-upload
scraped: 2026-01-08
---

# Complete a File Upload

## Endpoint

**POST** `https://api.notion.com/v1/file_uploads/{file_upload_id}/complete`

## Description

Finalizes a multipart file upload after all file segments have been successfully transmitted. Transitions the upload from pending to uploaded status.

## Path Parameters

| Parameter | Type | Required | Description |
|-----------|------|----------|-------------|
| `file_upload_id` | string | Yes | The ID of the file upload to complete |

## Response

Returns the completed File Upload object with status `"uploaded"`.

## Usage

This endpoint is used with `mode=multi_part` file uploads after all parts have been sent successfully.

## File Upload Workflow

This endpoint is step 3 of 3:

1. **Create a file upload** - Initiates the upload
2. **Send a file upload** - Transmits the actual file data
3. **Complete a file upload** (this endpoint) - Finalizes the process
