---
source: https://developers.notion.com/reference/file-upload
scraped: 2026-01-08
---

# File Upload Object

## Overview

The File Upload object tracks the lifecycle of files uploaded to Notion through the API. Once a file upload has a `status` of `"uploaded"`, pass its ID in a file object with a `type` of `file_upload` to attach it to blocks, pages, and databases.

## Object Properties

| Field | Type | Description |
|-------|------|-------------|
| `object` | String | Always `"file_upload"` |
| `id` | UUID | Unique identifier for the FileUpload |
| `created_time` | ISO 8601 | Timestamp of creation |
| `last_edited_time` | ISO 8601 | Timestamp of last modification |
| `expiry_time` | ISO 8601 (nullable) | When the upload expires if not attached to workspace objects |
| `status` | Enum | Current state: `pending`, `uploaded`, `expired`, or `failed` |
| `filename` | String (nullable) | Name provided during creation or inferred from upload |
| `content_type` | String (nullable) | MIME type of the file |
| `content_length` | Integer (nullable) | File size in bytes |
| `upload_url` | String | URL for sending file contents (pending uploads only) |
| `complete_url` | String | URL to finalize multi-part uploads |
| `file_import_result` | String | Success/failure details for external URL imports |

## Status Definitions

| Status | Description |
|--------|-------------|
| `pending` | Awaiting upload completion |
| `uploaded` | File contents sent; `expiry_time` is null if already attached |
| `expired` | Cannot be used further |
| `failed` | Cannot be used further |
