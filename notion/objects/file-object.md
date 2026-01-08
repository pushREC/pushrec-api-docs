---
source: https://developers.notion.com/reference/file-object
scraped: 2026-01-08
---

# File Object

## Overview

The Notion API represents media assets through file objects that store metadata and hosting information. Each file object contains a required `type` field determining its structure.

## File Object Structure

| Field | Type | Description |
|-------|------|-------------|
| `type` | string enum | Values are `"file"`, `"file_upload"`, or `"external"` |
| Type-specific object | object | Configuration details based on the type |

## File Types

### Type: `file` (Notion-hosted)

These represent files uploaded manually through the Notion UI, such as images, PDFs, or page covers.

**Key characteristics:**
- An authenticated HTTP GET URL to the file valid for one hour
- Includes expiry timestamp in ISO 8601 format
- Requires re-fetching to refresh expired URLs

**Fields:**

| Field | Type | Purpose |
|-------|------|---------|
| `url` | string | Temporary authenticated download link |
| `expiry_time` | ISO 8601 datetime | URL expiration timestamp |

**Use case:** Working with existing content in a Notion workspace

### Type: `file_upload` (API-uploaded)

Files created through the File Upload API workflow—first create the upload, transmit content, then reference by ID.

**Key characteristics:**
- File ID persists for reuse across multiple locations
- Supports programmatic upload workflows
- Requires prior completion via File Upload endpoints

**Fields:**

| Field | Type | Purpose |
|-------|------|---------|
| `id` | UUID | Reference to completed File Upload object |

**Use case:** Programmatically uploading files to Notion

### Type: `external` (Third-party hosted)

Links to files hosted externally on CDNs, S3, Dropbox, or similar platforms.

**Key characteristics:**
- These links never expire and will always be returned as-is
- Requires public, HTTPS URLs
- No authentication support
- No Notion storage involved

**Fields:**

| Field | Type | Purpose |
|-------|------|---------|
| `url` | string | Public external file location |

**Use case:** Existing CDN or media server

## JSON Examples

```json
// Notion-hosted
{
  "type": "file",
  "file": {
    "url": "https://s3.us-west-2.amazonaws.com/...",
    "expiry_time": "2025-04-24T22:49:22.765Z"
  }
}

// API-uploaded
{
  "type": "file_upload",
  "file_upload": {
    "id": "43833259-72ae-404e-8441-b6577f3159b4"
  }
}

// External
{
  "type": "external",
  "external": {
    "url": "https://example.com/photo.png"
  }
}
```
