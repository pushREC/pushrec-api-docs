---
created: 2026-01-09
tags: [type/api-reference, api/issue-priorities]
api_name: The Jira Cloud platform REST API
category: Issue priorities
endpoint_count: 8
---

# The Jira Cloud platform REST API - Issue Priorities

[[README|Back to Overview]]

---

## GET /rest/api/3/priority

**Get priorities**

Returns the list of all issue priorities.

**[Permissions](#permissions) required:** Permission to access Jira.

### Example

```bash
curl -X GET \
  -H "Authorization: Bearer $TOKEN" \
  "https://your-domain.atlassian.net/rest/api/3/priority"
```

---

## POST /rest/api/3/priority

**Create priority**

Creates an issue priority.

Deprecation applies to iconUrl param in request body which will be sunset on 16th Mar 2025. For more details refer to [changelog](https://developer.atlassian.com/changelog/#CHANGE-1525).

**[Permissions](#permissions) required:** *Administer Jira* [global permission](https://confluence.atlassian.com/x/x4dKLg).

### Example

```bash
curl -X POST \
  -H "Authorization: Bearer $TOKEN" \
  "https://your-domain.atlassian.net/rest/api/3/priority"
```

---

## PUT /rest/api/3/priority/default

**Set default priority**

Sets default issue priority.

**[Permissions](#permissions) required:** *Administer Jira* [global permission](https://confluence.atlassian.com/x/x4dKLg).

### Example

```bash
curl -X PUT \
  -H "Authorization: Bearer $TOKEN" \
  "https://your-domain.atlassian.net/rest/api/3/priority/default"
```

---

## PUT /rest/api/3/priority/move

**Move priorities**

Changes the order of issue priorities.

**[Permissions](#permissions) required:** *Administer Jira* [global permission](https://confluence.atlassian.com/x/x4dKLg).

### Example

```bash
curl -X PUT \
  -H "Authorization: Bearer $TOKEN" \
  "https://your-domain.atlassian.net/rest/api/3/priority/move"
```

---

## GET /rest/api/3/priority/search

**Search priorities**

Returns a [paginated](#pagination) list of priorities. The list can contain all priorities or a subset determined by any combination of these criteria:

 *  a list of priority IDs. Any invalid priority IDs are ignored.
 *  a list of project IDs. Only priorities that are available in these projects will be returned. Any invalid project IDs are ignored.
 *  whether the field configuration is a default. This returns priorities from company-managed (classic) projects only, as there is no concept of default priorities in team-managed projects.

**[Permissions](#permissions) required:** Permission to access Jira.

### Parameters

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| `startAt` | query | string | No | The index of the first item to return in a page of |
| `maxResults` | query | string | No | The maximum number of items to return per page. |
| `id` | query | array | No | The list of priority IDs. To include multiple IDs, |
| `projectId` | query | array | No | The list of projects IDs. To include multiple IDs, |
| `priorityName` | query | string | No | The name of priority to search for. |
| `onlyDefault` | query | boolean | No | Whether only the default priority is returned. |
| `expand` | query | string | No | Use `schemes` to return the associated priority sc |

### Example

```bash
curl -X GET \
  -H "Authorization: Bearer $TOKEN" \
  "https://your-domain.atlassian.net/rest/api/3/priority/search"
```

---

## DELETE /rest/api/3/priority/{id}

**Delete priority**

Deletes an issue priority.

This operation is [asynchronous](#async). Follow the `location` link in the response to determine the status of the task and use [Get task](#api-rest-api-3-task-taskId-get) to obtain subsequent updates.

**[Permissions](#permissions) required:** *Administer Jira* [global permission](https://confluence.atlassian.com/x/x4dKLg).

### Parameters

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| `id` | path | string | Yes | The ID of the issue priority. |

### Example

```bash
curl -X DELETE \
  -H "Authorization: Bearer $TOKEN" \
  "https://your-domain.atlassian.net/rest/api/3/priority/{id}"
```

---

## GET /rest/api/3/priority/{id}

**Get priority**

Returns an issue priority.

**[Permissions](#permissions) required:** Permission to access Jira.

### Parameters

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| `id` | path | string | Yes | The ID of the issue priority. |

### Example

```bash
curl -X GET \
  -H "Authorization: Bearer $TOKEN" \
  "https://your-domain.atlassian.net/rest/api/3/priority/{id}"
```

---

## PUT /rest/api/3/priority/{id}

**Update priority**

Updates an issue priority.

At least one request body parameter must be defined.

Deprecation applies to iconUrl param in request body which will be sunset on 16th Mar 2025. For more details refer to [changelog](https://developer.atlassian.com/changelog/#CHANGE-1525).

**[Permissions](#permissions) required:** *Administer Jira* [global permission](https://confluence.atlassian.com/x/x4dKLg).

### Parameters

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| `id` | path | string | Yes | The ID of the issue priority. |

### Example

```bash
curl -X PUT \
  -H "Authorization: Bearer $TOKEN" \
  "https://your-domain.atlassian.net/rest/api/3/priority/{id}"
```

---
