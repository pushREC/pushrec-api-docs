---
source: https://developers.notion.com/reference/list-data-source-templates
scraped: 2026-01-08
---

# List Data Source Templates

## Endpoint

**GET** `https://api.notion.com/v1/data_sources/{data_source_id}/templates`

## Description

Retrieves all page templates available for a specified data source, returning details about each template that the authenticated bot can access.

## Path Parameters

| Parameter | Type | Required | Description |
|-----------|------|----------|-------------|
| `data_source_id` | string | Yes | The ID of the data source |

## Query Parameters

| Parameter | Type | Description |
|-----------|------|-------------|
| `start_cursor` | string | Template ID for pagination |
| `page_size` | integer | Results per page (max 100) |

## Response

### Template Object Properties

| Property | Type | Description |
|----------|------|-------------|
| `id` | String (UUIDv4) | Unique identifier for the template |
| `name` | String | Display name of the template |
| `is_default` | Boolean | Whether this is the default template |

### Pagination Fields

| Field | Type | Description |
|-------|------|-------------|
| `has_more` | boolean | Indicates additional templates exist |
| `next_cursor` | string | Template ID for next page |

## Access Requirements

Templates only appear in responses if the bot has access to them. Bot access to the parent database typically extends to all child templates.

## Alternative Method

Users can obtain template IDs by copying template URLs directly from the Notion application.

## Related Functionality

Templates are valid Notion pages and can be queried using the Retrieve a Page endpoint to access their full properties and content.
