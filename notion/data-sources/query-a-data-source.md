---
source: https://developers.notion.com/reference/query-a-data-source
scraped: 2026-01-08
---

# Query a Data Source

## Endpoint

**POST** `https://api.notion.com/v1/data_sources/{data_source_id}/query`

## Description

Retrieves a list of pages contained in a data source, with support for filtering and sorting.

## Path Parameters

| Parameter | Type | Required | Description |
|-----------|------|----------|-------------|
| `data_source_id` | string | Yes | The ID of the data source to query |

## Request Body

| Parameter | Type | Description |
|-----------|------|-------------|
| `filter` | object | Filter conditions for results |
| `sorts` | array | Sort conditions for results |
| `start_cursor` | string | Pagination cursor |
| `page_size` | integer | Number of results per page (max 100) |
| `filter_properties` | array | Property IDs to include in response |

## Key Capabilities

- **Wiki Support**: For wiki data sources, databases return as child data sources
- **Result Filtering**: Use `result_type` filter with `"page"` or `"data_source"`
- **Pagination**: Responses include `next_cursor` for iterating

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

## Performance Optimization

Use `filter_properties` parameter to optimize response size:

```
/data_sources/{id}/query?filter_properties[]=title&filter_properties[]=status
```

**Additional strategies:**
- Apply specific filter conditions to reduce result sets
- Split large data sources (50,000+ pages) into multiple sources
- Remove unused complex formulas, rollups, or relations
- Implement webhooks to reduce polling frequency

## Limitations

| Limitation | Description |
|------------|-------------|
| Formula/rollup constraints | Relations with 25+ references evaluate only first 25 |
| Multi-layer relations | May return incorrect results |
| Related page titles | Add rollup properties or retrieve pages individually |

## Requirements

- Parent database must be shared with integration
- Integration requires **read content** capabilities

## Error Responses

| Status | Description |
|--------|-------------|
| 403 | Missing read content capabilities |
| 404 | Data source doesn't exist or access denied |
| 400/429 | Request exceeds rate limits |
