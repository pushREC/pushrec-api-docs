---
created: 2026-01-09
tags: [type/api-reference, api/tasks]
api_name: The Jira Cloud platform REST API
category: Tasks
endpoint_count: 2
---

# The Jira Cloud platform REST API - Tasks

[[README|Back to Overview]]

---

## GET /rest/api/3/task/{taskId}

**Get task**

Returns the status of a [long-running asynchronous task](#async).

When a task has finished, this operation returns the JSON blob applicable to the task. See the documentation of the operation that created the task for details. Task details are not permanently retained. As of September 2019, details are retained for 14 days although this period may change without notice.

**Deprecation notice:** The required OAuth 2.0 scopes will be updated on June 15, 2024.

 *  `read:jira-work`

**[Permissions](#permissions) required:** either of:

 *  *Administer Jira* [global permission](https://confluence.atlassian.com/x/x4dKLg).
 *  Creator of the task.

### Parameters

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| `taskId` | path | string | Yes | The ID of the task. |

### Example

```bash
curl -X GET \
  -H "Authorization: Bearer $TOKEN" \
  "https://your-domain.atlassian.net/rest/api/3/task/{taskId}"
```

---

## POST /rest/api/3/task/{taskId}/cancel

**Cancel task**

Cancels a task.

**[Permissions](#permissions) required:** either of:

 *  *Administer Jira* [global permission](https://confluence.atlassian.com/x/x4dKLg).
 *  Creator of the task.

### Parameters

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| `taskId` | path | string | Yes | The ID of the task. |

### Example

```bash
curl -X POST \
  -H "Authorization: Bearer $TOKEN" \
  "https://your-domain.atlassian.net/rest/api/3/task/{taskId}/cancel"
```

---
