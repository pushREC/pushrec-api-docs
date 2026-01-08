---
source: https://developers.notion.com/reference/move-page
scraped: 2026-01-08
---

# Move Page

## Endpoint

**POST** `https://api.notion.com/v1/pages/{page_id}/move`

## Description

Relocates an existing Notion page to a new parent location.

## Path Parameters

| Parameter | Type | Required | Description |
|-----------|------|----------|-------------|
| `page_id` | string (UUIDv4) | Yes | The ID of the page to move |

**Note:** Accepts UUIDs with or without dashes. Must be a regular Notion page, not a database.

## Request Body

| Parameter | Type | Required | Description |
|-----------|------|----------|-------------|
| `parent` | object | Yes | The new parent location |

### Page Parent

```json
{
  "parent": {
    "type": "page_id",
    "page_id": "<parent-page-id>"
  }
}
```

### Database Parent

```json
{
  "parent": {
    "type": "data_source_id",
    "data_source_id": "<database-data-source-id>"
  }
}
```

**Important:** When moving to a database, use `data_source_id` rather than `database_id`. Retrieve this value from the "Retrieve a database" endpoint.

## Example Request

```bash
curl -X POST https://api.notion.com/v1/pages/195de9221179449fab8075a27c979105/move \
  -H "Authorization: Bearer secret_xxx" \
  -H "Notion-Version: 2022-06-28" \
  -H "Content-Type: application/json" \
  -d '{
    "parent": {
      "type": "page_id",
      "page_id": "f336d0bc-b841-465b-8045-024475c079dd"
    }
  }'
```

## Response

Returns the updated Page object with the new parent.

## Required Capabilities

Integration must have write access to both the source page and the destination parent.
