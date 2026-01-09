---
created: 2026-01-09
tags: [type/api-reference, api/issue-resolutions]
api_name: The Jira Cloud platform REST API
category: Issue resolutions
endpoint_count: 8
---

# The Jira Cloud platform REST API - Issue Resolutions

[[README|Back to Overview]]

---

## GET /rest/api/3/resolution

**Get resolutions**

Returns a list of all issue resolution values.

**[Permissions](#permissions) required:** Permission to access Jira.

### Example

```bash
curl -X GET \
  -H "Authorization: Bearer $TOKEN" \
  "https://your-domain.atlassian.net/rest/api/3/resolution"
```

---

## POST /rest/api/3/resolution

**Create resolution**

Creates an issue resolution.

**[Permissions](#permissions) required:** *Administer Jira* [global permission](https://confluence.atlassian.com/x/x4dKLg).

### Example

```bash
curl -X POST \
  -H "Authorization: Bearer $TOKEN" \
  "https://your-domain.atlassian.net/rest/api/3/resolution"
```

---

## PUT /rest/api/3/resolution/default

**Set default resolution**

Sets default issue resolution.

**[Permissions](#permissions) required:** *Administer Jira* [global permission](https://confluence.atlassian.com/x/x4dKLg).

### Example

```bash
curl -X PUT \
  -H "Authorization: Bearer $TOKEN" \
  "https://your-domain.atlassian.net/rest/api/3/resolution/default"
```

---

## PUT /rest/api/3/resolution/move

**Move resolutions**

Changes the order of issue resolutions.

**[Permissions](#permissions) required:** *Administer Jira* [global permission](https://confluence.atlassian.com/x/x4dKLg).

### Example

```bash
curl -X PUT \
  -H "Authorization: Bearer $TOKEN" \
  "https://your-domain.atlassian.net/rest/api/3/resolution/move"
```

---

## GET /rest/api/3/resolution/search

**Search resolutions**

Returns a [paginated](#pagination) list of resolutions. The list can contain all resolutions or a subset determined by any combination of these criteria:

 *  a list of resolutions IDs.
 *  whether the field configuration is a default. This returns resolutions from company-managed (classic) projects only, as there is no concept of default resolutions in team-managed projects.

**[Permissions](#permissions) required:** Permission to access Jira.

### Parameters

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| `startAt` | query | string | No | The index of the first item to return in a page of |
| `maxResults` | query | string | No | The maximum number of items to return per page. |
| `id` | query | array | No | The list of resolutions IDs to be filtered out |
| `onlyDefault` | query | boolean | No | When set to true, return default only, when IDs pr |

### Example

```bash
curl -X GET \
  -H "Authorization: Bearer $TOKEN" \
  "https://your-domain.atlassian.net/rest/api/3/resolution/search"
```

---

## DELETE /rest/api/3/resolution/{id}

**Delete resolution**

Deletes an issue resolution.

This operation is [asynchronous](#async). Follow the `location` link in the response to determine the status of the task and use [Get task](#api-rest-api-3-task-taskId-get) to obtain subsequent updates.

**[Permissions](#permissions) required:** *Administer Jira* [global permission](https://confluence.atlassian.com/x/x4dKLg).

### Parameters

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| `id` | path | string | Yes | The ID of the issue resolution. |
| `replaceWith` | query | string | Yes | The ID of the issue resolution that will replace t |

### Example

```bash
curl -X DELETE \
  -H "Authorization: Bearer $TOKEN" \
  "https://your-domain.atlassian.net/rest/api/3/resolution/{id}"
```

---

## GET /rest/api/3/resolution/{id}

**Get resolution**

Returns an issue resolution value.

**[Permissions](#permissions) required:** Permission to access Jira.

### Parameters

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| `id` | path | string | Yes | The ID of the issue resolution value. |

### Example

```bash
curl -X GET \
  -H "Authorization: Bearer $TOKEN" \
  "https://your-domain.atlassian.net/rest/api/3/resolution/{id}"
```

---

## PUT /rest/api/3/resolution/{id}

**Update resolution**

Updates an issue resolution.

**[Permissions](#permissions) required:** *Administer Jira* [global permission](https://confluence.atlassian.com/x/x4dKLg).

### Parameters

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| `id` | path | string | Yes | The ID of the issue resolution. |

### Example

```bash
curl -X PUT \
  -H "Authorization: Bearer $TOKEN" \
  "https://your-domain.atlassian.net/rest/api/3/resolution/{id}"
```

---
