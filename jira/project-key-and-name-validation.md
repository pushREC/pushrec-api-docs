---
created: 2026-01-09
tags: [type/api-reference, api/project-key-and-name-validation]
api_name: The Jira Cloud platform REST API
category: Project key and name validation
endpoint_count: 3
---

# The Jira Cloud platform REST API - Project Key And Name Validation

[[README|Back to Overview]]

---

## GET /rest/api/3/projectvalidate/key

**Validate project key**

Validates a project key by confirming the key is a valid string and not in use.

**[Permissions](#permissions) required:** None.

### Parameters

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| `key` | query | string | No | The project key. |

### Example

```bash
curl -X GET \
  -H "Authorization: Bearer $TOKEN" \
  "https://your-domain.atlassian.net/rest/api/3/projectvalidate/key"
```

---

## GET /rest/api/3/projectvalidate/validProjectKey

**Get valid project key**

Validates a project key and, if the key is invalid or in use, generates a valid random string for the project key.

**[Permissions](#permissions) required:** None.

### Parameters

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| `key` | query | string | No | The project key. |

### Example

```bash
curl -X GET \
  -H "Authorization: Bearer $TOKEN" \
  "https://your-domain.atlassian.net/rest/api/3/projectvalidate/validProjectKey"
```

---

## GET /rest/api/3/projectvalidate/validProjectName

**Get valid project name**

Checks that a project name isn't in use. If the name isn't in use, the passed string is returned. If the name is in use, this operation attempts to generate a valid project name based on the one supplied, usually by adding a sequence number. If a valid project name cannot be generated, a 404 response is returned.

**[Permissions](#permissions) required:** None.

### Parameters

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| `name` | query | string | Yes | The project name. |

### Example

```bash
curl -X GET \
  -H "Authorization: Bearer $TOKEN" \
  "https://your-domain.atlassian.net/rest/api/3/projectvalidate/validProjectName"
```

---
