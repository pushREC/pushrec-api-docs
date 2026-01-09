---
created: 2026-01-09
tags: [type/api-reference, api/workflow-status-categories]
api_name: The Jira Cloud platform REST API
category: Workflow status categories
endpoint_count: 2
---

# The Jira Cloud platform REST API - Workflow Status Categories

[[README|Back to Overview]]

---

## GET /rest/api/3/statuscategory

**Get all status categories**

Returns a list of all status categories.

**[Permissions](#permissions) required:** Permission to access Jira.

### Example

```bash
curl -X GET \
  -H "Authorization: Bearer $TOKEN" \
  "https://your-domain.atlassian.net/rest/api/3/statuscategory"
```

---

## GET /rest/api/3/statuscategory/{idOrKey}

**Get status category**

Returns a status category. Status categories provided a mechanism for categorizing [statuses](#api-rest-api-3-status-idOrName-get).

**[Permissions](#permissions) required:** Permission to access Jira.

### Parameters

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| `idOrKey` | path | string | Yes | The ID or key of the status category. |

### Example

```bash
curl -X GET \
  -H "Authorization: Bearer $TOKEN" \
  "https://your-domain.atlassian.net/rest/api/3/statuscategory/{idOrKey}"
```

---
