---
created: 2026-01-09
tags: [type/api-reference, api/labels]
api_name: The Jira Cloud platform REST API
category: Labels
endpoint_count: 1
---

# The Jira Cloud platform REST API - Labels

[[README|Back to Overview]]

---

## GET /rest/api/3/label

**Get all labels**

Returns a [paginated](#pagination) list of labels.

### Parameters

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| `startAt` | query | integer | No | The index of the first item to return in a page of |
| `maxResults` | query | integer | No | The maximum number of items to return per page. |

### Example

```bash
curl -X GET \
  -H "Authorization: Bearer $TOKEN" \
  "https://your-domain.atlassian.net/rest/api/3/label"
```

---
