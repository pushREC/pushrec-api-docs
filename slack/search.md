---
created: 2026-01-09
tags: [type/api-reference, api/search]
api_name: Slack Web API
category: search
endpoint_count: 1
---

# Slack Web API - Search

[[README|Back to Overview]]

---

## GET /search.messages

Searches for messages matching a query.

### Parameters

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| `token` | query | string | Yes | Authentication token. Requires scope: `search:read |
| `count` | query | string | No | Pass the number of results you want per "page". Ma |
| `highlight` | query | string | No | Pass a value of `true` to enable query highlight m |
| `page` | query | string | No |  |
| `query` | query | string | Yes | Search query. |
| `sort` | query | string | No | Return matches sorted by either `score` or `timest |
| `sort_dir` | query | string | No | Change sort direction to ascending (`asc`) or desc |

### Example

```bash
curl -X GET \
  -H "Authorization: Bearer $TOKEN" \
  "/search.messages"
```

---
