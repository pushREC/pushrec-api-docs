---
created: 2026-01-09
tags: [type/api-reference, api/classification-levels]
api_name: The Jira Cloud platform REST API
category: Classification levels
endpoint_count: 1
---

# The Jira Cloud platform REST API - Classification Levels

[[README|Back to Overview]]

---

## GET /rest/api/3/classification-levels

**Get all classification levels**

Returns all classification levels.

**[Permissions](#permissions) required:** None.

### Parameters

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| `status` | query | array | No | Optional set of statuses to filter by. |
| `orderBy` | query | string | No | Ordering of the results by a given field. If not p |

### Example

```bash
curl -X GET \
  -H "Authorization: Bearer $TOKEN" \
  "https://your-domain.atlassian.net/rest/api/3/classification-levels"
```

---
