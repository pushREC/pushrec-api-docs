---
created: 2026-01-09
tags: [type/api-reference, api/project-role-actors]
api_name: The Jira Cloud platform REST API
category: Project role actors
endpoint_count: 6
---

# The Jira Cloud platform REST API - Project Role Actors

[[README|Back to Overview]]

---

## DELETE /rest/api/3/project/{projectIdOrKey}/role/{id}

**Delete actors from project role**

Deletes actors from a project role for the project.

To remove default actors from the project role, use [Delete default actors from project role](#api-rest-api-3-role-id-actors-delete).

This operation can be accessed anonymously.

**[Permissions](#permissions) required:** *Administer Projects* [project permission](https://confluence.atlassian.com/x/yodKLg) for the project or *Administer Jira* [global permission](https://confluence.atlassian.com/x/x4dKLg).

### Parameters

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| `projectIdOrKey` | path | string | Yes | The project ID or project key (case sensitive). |
| `id` | path | integer | Yes | The ID of the project role. Use [Get all project r |
| `user` | query | string | No | The user account ID of the user to remove from the |
| `group` | query | string | No | The name of the group to remove from the project r |
| `groupId` | query | string | No | The ID of the group to remove from the project rol |

### Example

```bash
curl -X DELETE \
  -H "Authorization: Bearer $TOKEN" \
  "https://your-domain.atlassian.net/rest/api/3/project/{projectIdOrKey}/role/{id}"
```

---

## POST /rest/api/3/project/{projectIdOrKey}/role/{id}

**Add actors to project role**

Adds actors to a project role for the project.

To replace all actors for the project, use [Set actors for project role](#api-rest-api-3-project-projectIdOrKey-role-id-put).

This operation can be accessed anonymously.

**[Permissions](#permissions) required:** *Administer Projects* [project permission](https://confluence.atlassian.com/x/yodKLg) for the project or *Administer Jira* [global permission](https://confluence.atlassian.com/x/x4dKLg).

### Parameters

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| `projectIdOrKey` | path | string | Yes | The project ID or project key (case sensitive). |
| `id` | path | integer | Yes | The ID of the project role. Use [Get all project r |

### Example

```bash
curl -X POST \
  -H "Authorization: Bearer $TOKEN" \
  "https://your-domain.atlassian.net/rest/api/3/project/{projectIdOrKey}/role/{id}"
```

---

## PUT /rest/api/3/project/{projectIdOrKey}/role/{id}

**Set actors for project role**

Sets the actors for a project role for a project, replacing all existing actors.

To add actors to the project without overwriting the existing list, use [Add actors to project role](#api-rest-api-3-project-projectIdOrKey-role-id-post).

**[Permissions](#permissions) required:** *Administer Projects* [project permission](https://confluence.atlassian.com/x/yodKLg) for the project or *Administer Jira* [global permission](https://confluence.atlassian.com/x/x4dKLg).

### Parameters

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| `projectIdOrKey` | path | string | Yes | The project ID or project key (case sensitive). |
| `id` | path | integer | Yes | The ID of the project role. Use [Get all project r |

### Example

```bash
curl -X PUT \
  -H "Authorization: Bearer $TOKEN" \
  "https://your-domain.atlassian.net/rest/api/3/project/{projectIdOrKey}/role/{id}"
```

---

## DELETE /rest/api/3/role/{id}/actors

**Delete default actors from project role**

Deletes the [default actors](#api-rest-api-3-resolution-get) from a project role. You may delete a group or user, but you cannot delete a group and a user in the same request.

Changing a project role's default actors does not affect project role members for projects already created.

**[Permissions](#permissions) required:** *Administer Jira* [global permission](https://confluence.atlassian.com/x/x4dKLg).

### Parameters

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| `id` | path | integer | Yes | The ID of the project role. Use [Get all project r |
| `user` | query | string | No | The user account ID of the user to remove as a def |
| `groupId` | query | string | No | The group ID of the group to be removed as a defau |
| `group` | query | string | No | The group name of the group to be removed as a def |

### Example

```bash
curl -X DELETE \
  -H "Authorization: Bearer $TOKEN" \
  "https://your-domain.atlassian.net/rest/api/3/role/{id}/actors"
```

---

## GET /rest/api/3/role/{id}/actors

**Get default actors for project role**

Returns the [default actors](#api-rest-api-3-resolution-get) for the project role.

**[Permissions](#permissions) required:** *Administer Jira* [global permission](https://confluence.atlassian.com/x/x4dKLg).

### Parameters

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| `id` | path | integer | Yes | The ID of the project role. Use [Get all project r |

### Example

```bash
curl -X GET \
  -H "Authorization: Bearer $TOKEN" \
  "https://your-domain.atlassian.net/rest/api/3/role/{id}/actors"
```

---

## POST /rest/api/3/role/{id}/actors

**Add default actors to project role**

Adds [default actors](#api-rest-api-3-resolution-get) to a role. You may add groups or users, but you cannot add groups and users in the same request.

Changing a project role's default actors does not affect project role members for projects already created.

**[Permissions](#permissions) required:** *Administer Jira* [global permission](https://confluence.atlassian.com/x/x4dKLg).

### Parameters

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| `id` | path | integer | Yes | The ID of the project role. Use [Get all project r |

### Example

```bash
curl -X POST \
  -H "Authorization: Bearer $TOKEN" \
  "https://your-domain.atlassian.net/rest/api/3/role/{id}/actors"
```

---
