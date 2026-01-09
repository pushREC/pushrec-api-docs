---
created: 2026-01-09
tags: [type/api-reference, api/project-types]
api_name: The Jira Cloud platform REST API
category: Project types
endpoint_count: 4
---

# The Jira Cloud platform REST API - Project Types

[[README|Back to Overview]]

---

## GET /rest/api/3/project/type

**Get all project types**

Returns all [project types](https://confluence.atlassian.com/x/Var1Nw), whether or not the instance has a valid license for each type.

This operation can be accessed anonymously.

**[Permissions](#permissions) required:** None.

### Example

```bash
curl -X GET \
  -H "Authorization: Bearer $TOKEN" \
  "https://your-domain.atlassian.net/rest/api/3/project/type"
```

---

## GET /rest/api/3/project/type/accessible

**Get licensed project types**

Returns all [project types](https://confluence.atlassian.com/x/Var1Nw) with a valid license.

### Example

```bash
curl -X GET \
  -H "Authorization: Bearer $TOKEN" \
  "https://your-domain.atlassian.net/rest/api/3/project/type/accessible"
```

---

## GET /rest/api/3/project/type/{projectTypeKey}

**Get project type by key**

Returns a [project type](https://confluence.atlassian.com/x/Var1Nw).

This operation can be accessed anonymously.

**[Permissions](#permissions) required:** None.

### Parameters

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| `projectTypeKey` | path | string | Yes | The key of the project type. |

### Example

```bash
curl -X GET \
  -H "Authorization: Bearer $TOKEN" \
  "https://your-domain.atlassian.net/rest/api/3/project/type/{projectTypeKey}"
```

---

## GET /rest/api/3/project/type/{projectTypeKey}/accessible

**Get accessible project type by key**

Returns a [project type](https://confluence.atlassian.com/x/Var1Nw) if it is accessible to the user.

**[Permissions](#permissions) required:** Permission to access Jira.

### Parameters

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| `projectTypeKey` | path | string | Yes | The key of the project type. |

### Example

```bash
curl -X GET \
  -H "Authorization: Bearer $TOKEN" \
  "https://your-domain.atlassian.net/rest/api/3/project/type/{projectTypeKey}/accessible"
```

---
