---
created: 2026-01-09
tags: [type/api-reference, api/app-data-policies]
api_name: The Jira Cloud platform REST API
category: App data policies
endpoint_count: 2
---

# The Jira Cloud platform REST API - App Data Policies

[[README|Back to Overview]]

---

## GET /rest/api/3/data-policy

**Get data policy for the workspace**

Returns data policy for the workspace.

### Example

```bash
curl -X GET \
  -H "Authorization: Bearer $TOKEN" \
  "https://your-domain.atlassian.net/rest/api/3/data-policy"
```

---

## GET /rest/api/3/data-policy/project

**Get data policy for projects**

Returns data policies for the projects specified in the request.

### Parameters

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| `ids` | query | string | No | A list of project identifiers. This parameter acce |

### Example

```bash
curl -X GET \
  -H "Authorization: Bearer $TOKEN" \
  "https://your-domain.atlassian.net/rest/api/3/data-policy/project"
```

---
