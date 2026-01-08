---
source: https://developers.notion.com/reference/post-search
scraped: 2026-01-08
---

# Search by Title

## Endpoint

**POST** `https://api.notion.com/v1/search`

## Description

Searches all parent or child pages and data sources that have been shared with an integration. Returns pages or data sources with titles matching the query parameter.

## Request Body

| Parameter | Type | Required | Description |
|-----------|------|----------|-------------|
| `query` | string | No | Text to search for in titles |
| `filter` | object | No | Limit results to `page` or `data_source` |
| `sort` | object | No | Sort direction for results |
| `start_cursor` | string | No | Pagination cursor |
| `page_size` | integer | No | Results per page (default: 100) |

## Filter Object

```json
{
  "filter": {
    "value": "page",
    "property": "object"
  }
}
```

Values: `"page"` or `"data_source"`

## Sort Object

```json
{
  "sort": {
    "direction": "ascending",
    "timestamp": "last_edited_time"
  }
}
```

## Response

Returns a paginated list of Page and/or Data Source objects.

## Key Features

- If no query is provided, returns all pages/data sources shared with the integration
- Results exclude duplicated linked databases
- Results respect integration capabilities and limitations

## Important Notes

To search a specific data source (not all shared sources), use the Query a data source endpoint instead.
