---
created: 2026-01-09
tags: [type/api-reference, api/project-features]
api_name: The Jira Cloud platform REST API
category: Project features
endpoint_count: 2
---

# The Jira Cloud platform REST API - Project Features

[[README|Back to Overview]]

---

## GET /rest/api/3/project/{projectIdOrKey}/features

**Get project features**

Returns the list of features for a project.

### Parameters

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| `projectIdOrKey` | path | string | Yes | The ID or (case-sensitive) key of the project. |

### Example

```bash
curl -X GET \
  -H "Authorization: Bearer $TOKEN" \
  "https://your-domain.atlassian.net/rest/api/3/project/{projectIdOrKey}/features"
```

---

## PUT /rest/api/3/project/{projectIdOrKey}/features/{featureKey}

**Set project feature state**

Sets the state of a project feature.

### Parameters

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| `projectIdOrKey` | path | string | Yes | The ID or (case-sensitive) key of the project. |
| `featureKey` | path | string | Yes | The key of the feature. |

### Example

```bash
curl -X PUT \
  -H "Authorization: Bearer $TOKEN" \
  "https://your-domain.atlassian.net/rest/api/3/project/{projectIdOrKey}/features/{featureKey}"
```

---
