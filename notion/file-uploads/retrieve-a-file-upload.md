---
source: https://developers.notion.com/reference/retrieve-a-file-upload
scraped: 2026-01-08
---

# Retrieve a File Upload

## Endpoint

**GET** `https://api.notion.com/v1/file_uploads/{file_upload_id}`

## Description

Retrieves detailed information about a specific File Upload object.

## Path Parameters

| Parameter | Type | Required | Description |
|-----------|------|----------|-------------|
| `file_upload_id` | string | Yes | The ID of the file upload |

## Response

Returns a File Upload object containing:

| Field | Type | Description |
|-------|------|-------------|
| `id` | string | Unique identifier |
| `status` | string | Current status: `pending`, `uploaded`, `expired`, `failed` |
| `filename` | string | Name of the file |
| `content_type` | string | MIME type |
| `content_length` | integer | File size in bytes |
| `created_time` | string | ISO 8601 timestamp |
| `expiry_time` | string | When the upload expires (if not attached) |
