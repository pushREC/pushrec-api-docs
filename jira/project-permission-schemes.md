---
created: 2026-01-09
tags: [type/api-reference, api/project-permission-schemes]
api_name: The Jira Cloud platform REST API
category: Project permission schemes
endpoint_count: 4
---

# The Jira Cloud platform REST API - Project Permission Schemes

[[README|Back to Overview]]

---

## GET /rest/api/3/project/{projectKeyOrId}/issuesecuritylevelscheme

**Get project issue security scheme**

Returns the [issue security scheme](https://confluence.atlassian.com/x/J4lKLg) associated with the project.

**[Permissions](#permissions) required:** *Administer Jira* [global permission](https://confluence.atlassian.com/x/x4dKLg) or the *Administer Projects* [project permission](https://confluence.atlassian.com/x/yodKLg).

### Parameters

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| `projectKeyOrId` | path | string | Yes | The project ID or project key (case sensitive). |

### Example

```bash
curl -X GET \
  -H "Authorization: Bearer $TOKEN" \
  "https://your-domain.atlassian.net/rest/api/3/project/{projectKeyOrId}/issuesecuritylevelscheme"
```

---

## GET /rest/api/3/project/{projectKeyOrId}/permissionscheme

**Get assigned permission scheme**

Gets the [permission scheme](https://confluence.atlassian.com/x/yodKLg) associated with the project.

**[Permissions](#permissions) required:** *Administer Jira* [global permission](https://confluence.atlassian.com/x/x4dKLg) or *Administer projects* [project permission](https://confluence.atlassian.com/x/yodKLg).

### Parameters

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| `projectKeyOrId` | path | string | Yes | The project ID or project key (case sensitive). |
| `expand` | query | string | No | Use [expand](#expansion) to include additional inf |

### Example

```bash
curl -X GET \
  -H "Authorization: Bearer $TOKEN" \
  "https://your-domain.atlassian.net/rest/api/3/project/{projectKeyOrId}/permissionscheme"
```

---

## PUT /rest/api/3/project/{projectKeyOrId}/permissionscheme

**Assign permission scheme**

Assigns a permission scheme with a project. See [Managing project permissions](https://confluence.atlassian.com/x/yodKLg) for more information about permission schemes.

**[Permissions](#permissions) required:** *Administer Jira* [global permission](https://confluence.atlassian.com/x/x4dKLg)

### Parameters

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| `projectKeyOrId` | path | string | Yes | The project ID or project key (case sensitive). |
| `expand` | query | string | No | Use [expand](#expansion) to include additional inf |

### Example

```bash
curl -X PUT \
  -H "Authorization: Bearer $TOKEN" \
  "https://your-domain.atlassian.net/rest/api/3/project/{projectKeyOrId}/permissionscheme"
```

---

## GET /rest/api/3/project/{projectKeyOrId}/securitylevel

**Get project issue security levels**

Returns all [issue security](https://confluence.atlassian.com/x/J4lKLg) levels for the project that the user has access to.

This operation can be accessed anonymously.

**[Permissions](#permissions) required:** *Browse projects* [global permission](https://confluence.atlassian.com/x/x4dKLg) for the project, however, issue security levels are only returned for authenticated user with *Set Issue Security* [global permission](https://confluence.atlassian.com/x/x4dKLg) for the project.

### Parameters

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| `projectKeyOrId` | path | string | Yes | The project ID or project key (case sensitive). |

### Example

```bash
curl -X GET \
  -H "Authorization: Bearer $TOKEN" \
  "https://your-domain.atlassian.net/rest/api/3/project/{projectKeyOrId}/securitylevel"
```

---
