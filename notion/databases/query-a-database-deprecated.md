---
source: https://developers.notion.com/reference/post-database-query
scraped: 2026-01-08
status: deprecated
---

# Query a Database (Deprecated)

> **Note:** This endpoint is deprecated as of version 2025-09-03. Use the "Query a data source" API instead.

## Endpoint

**POST** `https://api.notion.com/v1/databases/{database_id}/query`

## Description

Retrieves a filtered and sorted list of pages and/or databases contained within a database.

## Path Parameters

| Parameter | Type | Required | Description |
|-----------|------|----------|-------------|
| `database_id` | string | Yes | The ID of the database to query |

## Request Body

| Parameter | Type | Description |
|-----------|------|-------------|
| `filter` | object | Filter conditions for results |
| `sorts` | array | Sort conditions for results |
| `start_cursor` | string | Pagination cursor |
| `page_size` | integer | Number of results per page (max 100) |
| `filter_properties` | array | Property IDs to include in response |

## Key Functionality

- **Filtering:** Similar to Notion's UI filters, supporting compound filters with "and"/"or" logic
- **Sorting:** Multiple sorts can be applied, with earlier sorts taking precedence
- **Pagination:** Responses may include a `next_cursor` value for iterating through results

## Filter Example

```json
{
  "and": [
    {"property": "Done", "checkbox": {"equals": true}},
    {"or": [
      {"property": "Tags", "contains": "A"},
      {"property": "Tags", "contains": "B"}
    ]}
  ]
}
```

## Important Limitations

- Formulas depending on relations with 25+ references only evaluate 25
- Multi-layer relational rollups may produce incorrect results
- Wiki databases can contain both pages and databases as children

## Requirements

The database must be shared with your integration. Integration requires **read content** capabilities.

## Error Responses

| Status | Description |
|--------|-------------|
| 404 | Database doesn't exist or access denied |
| 400/429 | Request limit violations |
