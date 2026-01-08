---
source: https://developers.notion.com/reference/comment-attachment
scraped: 2026-01-08
---

# Comment Attachment

## Overview

The Comment Attachment object represents files attached to comments within the Notion API. Comments can currently support up to 3 attachments.

## Request Format (Input)

When creating a comment with attachments, developers provide an array of objects with these properties:

| Parameter | Type | Purpose |
|-----------|------|---------|
| `file_upload_id` | string (UUID) | References a File Upload with "uploaded" status |
| `type` | string (optional) | Set to `"file_upload"` |

### Example Request

```json
{
  "parent": {
    "page_id": "d0a1ffaf-a4d8-4acf-a1ed-abae6e110418"
  },
  "rich_text": [
    {
      "text": {"content": "Thanks for the helpful page!"}
    }
  ],
  "attachments": {
    "file_upload_id": "2e2cdb8b-9897-4a6c-a935-82922b1cfb87"
  }
}
```

## Response Format (Output)

Comment API responses include attachments with these fields:

| Field | Type | Description |
|-------|------|-------------|
| `category` | string (enum) | File type: "audio", "image", "pdf", "productivity", or "video" |
| `file` | object | File object with URL and expiry time |

### Example Response

```json
{
  "category": "video",
  "file": {
    "url": "https://s3.us-west-2.amazonaws.com/...",
    "expiry_time": "2025-06-10T21:26:03.070Z"
  }
}
```

## Key Implementation Notes

- File URLs are temporary download links generated when retrieving comments
- The Notion interface automatically customizes display based on detected file category
- File Upload objects must have "uploaded" status before attachment
