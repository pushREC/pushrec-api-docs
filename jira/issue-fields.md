---
created: 2026-01-09
tags: [type/api-reference, api/issue-fields]
api_name: The Jira Cloud platform REST API
category: Issue fields
endpoint_count: 10
---

# The Jira Cloud platform REST API - Issue Fields

[[README|Back to Overview]]

---

## GET /rest/api/3/field

**Get fields**

Returns system and custom issue fields according to the following rules:

 *  Fields that cannot be added to the issue navigator are always returned.
 *  Fields that cannot be placed on an issue screen are always returned.
 *  Fields that depend on global Jira settings are only returned if the setting is enabled. That is, timetracking fields, subtasks, votes, and watches.
 *  For all other fields, this operation only returns the fields that the user has permission to view (that is, the field is used in at least one project that the user has *Browse Projects* [project permission](https://confluence.atlassian.com/x/yodKLg) for.)

This operation can be accessed anonymously.

**[Permissions](#permissions) required:** None.

### Example

```bash
curl -X GET \
  -H "Authorization: Bearer $TOKEN" \
  "https://your-domain.atlassian.net/rest/api/3/field"
```

---

## POST /rest/api/3/field

**Create custom field**

Creates a custom field.

**[Permissions](#permissions) required:** *Administer Jira* [global permission](https://confluence.atlassian.com/x/x4dKLg).

### Example

```bash
curl -X POST \
  -H "Authorization: Bearer $TOKEN" \
  "https://your-domain.atlassian.net/rest/api/3/field"
```

---

## GET /rest/api/3/field/search

**Get fields paginated**

Returns a [paginated](#pagination) list of fields for Classic Jira projects. The list can include:

 *  all fields
 *  specific fields, by defining `id`
 *  fields that contain a string in the field name or description, by defining `query`
 *  specific fields that contain a string in the field name or description, by defining `id` and `query`

Use `type` must be set to `custom` to show custom fields only.

**[Permissions](#permissions) required:** Permission to access Jira.

### Parameters

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| `startAt` | query | integer | No | The index of the first item to return in a page of |
| `maxResults` | query | integer | No | The maximum number of items to return per page. |
| `type` | query | array | No | The type of fields to search. |
| `id` | query | array | No | The IDs of the custom fields to return or, where ` |
| `query` | query | string | No | String used to perform a case-insensitive partial  |
| `orderBy` | query | string | No | [Order](#ordering) the results by:

 *  `contextsC |
| `expand` | query | string | No | Use [expand](#expansion) to include additional inf |
| `projectIds` | query | array | No | The IDs of the projects to filter the fields by. F |

### Example

```bash
curl -X GET \
  -H "Authorization: Bearer $TOKEN" \
  "https://your-domain.atlassian.net/rest/api/3/field/search"
```

---

## GET /rest/api/3/field/search/trashed

**Get fields in trash paginated**

Returns a [paginated](#pagination) list of fields in the trash. The list may be restricted to fields whose field name or description partially match a string.

Only custom fields can be queried, `type` must be set to `custom`.

**[Permissions](#permissions) required:** *Administer Jira* [global permission](https://confluence.atlassian.com/x/x4dKLg).

### Parameters

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| `startAt` | query | integer | No | The index of the first item to return in a page of |
| `maxResults` | query | integer | No | The maximum number of items to return per page. |
| `id` | query | array | No |  |
| `query` | query | string | No | String used to perform a case-insensitive partial  |
| `expand` | query | string | No |  |
| `orderBy` | query | string | No | [Order](#ordering) the results by a field:

 *  `n |

### Example

```bash
curl -X GET \
  -H "Authorization: Bearer $TOKEN" \
  "https://your-domain.atlassian.net/rest/api/3/field/search/trashed"
```

---

## PUT /rest/api/3/field/{fieldId}

**Update custom field**

Updates a custom field.

**[Permissions](#permissions) required:** *Administer Jira* [global permission](https://confluence.atlassian.com/x/x4dKLg).

### Parameters

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| `fieldId` | path | string | Yes | The ID of the custom field. |

### Example

```bash
curl -X PUT \
  -H "Authorization: Bearer $TOKEN" \
  "https://your-domain.atlassian.net/rest/api/3/field/{fieldId}"
```

---

## GET /rest/api/3/field/{fieldId}/contexts

**Get contexts for a field**

Returns a [paginated](#pagination) list of the contexts a field is used in. Deprecated, use [ Get custom field contexts](#api-rest-api-3-field-fieldId-context-get).

**[Permissions](#permissions) required:** *Administer Jira* [global permission](https://confluence.atlassian.com/x/x4dKLg).

### Parameters

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| `fieldId` | path | string | Yes | The ID of the field to return contexts for. |
| `startAt` | query | integer | No | The index of the first item to return in a page of |
| `maxResults` | query | integer | No | The maximum number of items to return per page. |

### Example

```bash
curl -X GET \
  -H "Authorization: Bearer $TOKEN" \
  "https://your-domain.atlassian.net/rest/api/3/field/{fieldId}/contexts"
```

---

## DELETE /rest/api/3/field/{id}

**Delete custom field**

Deletes a custom field. The custom field is deleted whether it is in the trash or not. See [Edit or delete a custom field](https://confluence.atlassian.com/x/Z44fOw) for more information on trashing and deleting custom fields.

This operation is [asynchronous](#async). Follow the `location` link in the response to determine the status of the task and use [Get task](#api-rest-api-3-task-taskId-get) to obtain subsequent updates.

**[Permissions](#permissions) required:** *Administer Jira* [global permission](https://confluence.atlassian.com/x/x4dKLg).

### Parameters

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| `id` | path | string | Yes | The ID of a custom field. |

### Example

```bash
curl -X DELETE \
  -H "Authorization: Bearer $TOKEN" \
  "https://your-domain.atlassian.net/rest/api/3/field/{id}"
```

---

## POST /rest/api/3/field/{id}/restore

**Restore custom field from trash**

Restores a custom field from trash. See [Edit or delete a custom field](https://confluence.atlassian.com/x/Z44fOw) for more information on trashing and deleting custom fields.

**[Permissions](#permissions) required:** *Administer Jira* [global permission](https://confluence.atlassian.com/x/x4dKLg).

### Parameters

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| `id` | path | string | Yes | The ID of a custom field. |

### Example

```bash
curl -X POST \
  -H "Authorization: Bearer $TOKEN" \
  "https://your-domain.atlassian.net/rest/api/3/field/{id}/restore"
```

---

## POST /rest/api/3/field/{id}/trash

**Move custom field to trash**

Moves a custom field to trash. See [Edit or delete a custom field](https://confluence.atlassian.com/x/Z44fOw) for more information on trashing and deleting custom fields.

**[Permissions](#permissions) required:** *Administer Jira* [global permission](https://confluence.atlassian.com/x/x4dKLg).

### Parameters

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| `id` | path | string | Yes | The ID of a custom field. |

### Example

```bash
curl -X POST \
  -H "Authorization: Bearer $TOKEN" \
  "https://your-domain.atlassian.net/rest/api/3/field/{id}/trash"
```

---

## GET /rest/api/3/projects/fields

**Get fields for projects**

Returns a [paginated](#pagination) list of fields for the requested projects and work types.

Only fields that are available for the specified combination of projects and work types are returned. This endpoint allows filtering to specific fields if field IDs are provided.

**[Permissions](#permissions) required:** Permission to access Jira.

### Parameters

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| `startAt` | query | integer | No | The index of the first item to return in a page of |
| `maxResults` | query | integer | No | The maximum number of items to return per page. |
| `projectId` | query | array | Yes | The IDs of projects to return fields for. |
| `workTypeId` | query | array | Yes | The IDs of work types (issue types) to return fiel |
| `fieldId` | query | array | No | The IDs of fields to return. If not provided, all  |

### Example

```bash
curl -X GET \
  -H "Authorization: Bearer $TOKEN" \
  "https://your-domain.atlassian.net/rest/api/3/projects/fields"
```

---
