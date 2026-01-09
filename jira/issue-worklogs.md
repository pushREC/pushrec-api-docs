---
created: 2026-01-09
tags: [type/api-reference, api/issue-worklogs]
api_name: The Jira Cloud platform REST API
category: Issue worklogs
endpoint_count: 10
---

# The Jira Cloud platform REST API - Issue Worklogs

[[README|Back to Overview]]

---

## DELETE /rest/api/3/issue/{issueIdOrKey}/worklog

**Bulk delete worklogs**

Deletes a list of worklogs from an issue. This is an experimental API with limitations:

 *  You can't delete more than 5000 worklogs at once.
 *  No notifications will be sent for deleted worklogs.

Time tracking must be enabled in Jira, otherwise this operation returns an error. For more information, see [Configuring time tracking](https://confluence.atlassian.com/x/qoXKM).

**[Permissions](#permissions) required:**

 *  *Browse projects* [project permission](https://confluence.atlassian.com/x/yodKLg) for the project containing the issue.
 *  If [issue-level security](https://confluence.atlassian.com/x/J4lKLg) is configured, issue-level security permission to view the issue.
 *  *Delete all worklogs*[ project permission](https://confluence.atlassian.com/x/yodKLg) to delete any worklog.
 *  If any worklog has visibility restrictions, belongs to the group or has the role visibility is restricted to.

### Parameters

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| `issueIdOrKey` | path | string | Yes | The ID or key of the issue. |
| `adjustEstimate` | query | string | No | Defines how to update the issue's time estimate, t |
| `overrideEditableFlag` | query | boolean | No | Whether the work log entries should be removed to  |

### Example

```bash
curl -X DELETE \
  -H "Authorization: Bearer $TOKEN" \
  "https://your-domain.atlassian.net/rest/api/3/issue/{issueIdOrKey}/worklog"
```

---

## GET /rest/api/3/issue/{issueIdOrKey}/worklog

**Get issue worklogs**

Returns worklogs for an issue (ordered by created time), starting from the oldest worklog or from the worklog started on or after a date and time.

Time tracking must be enabled in Jira, otherwise this operation returns an error. For more information, see [Configuring time tracking](https://confluence.atlassian.com/x/qoXKM).

This operation can be accessed anonymously.

**[Permissions](#permissions) required:** Workloads are only returned where the user has:

 *  *Browse projects* [project permission](https://confluence.atlassian.com/x/yodKLg) for the project that the issue is in.
 *  If [issue-level security](https://confluence.atlassian.com/x/J4lKLg) is configured, issue-level security permission to view the issue.
 *  If the worklog has visibility restrictions, belongs to the group or has the role visibility is restricted to.

### Parameters

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| `issueIdOrKey` | path | string | Yes | The ID or key of the issue. |
| `startAt` | query | integer | No | The index of the first item to return in a page of |
| `maxResults` | query | integer | No | The maximum number of items to return per page. |
| `startedAfter` | query | integer | No | The worklog start date and time, as a UNIX timesta |
| `startedBefore` | query | integer | No | The worklog start date and time, as a UNIX timesta |
| `expand` | query | string | No | Use [expand](#expansion) to include additional inf |

### Example

```bash
curl -X GET \
  -H "Authorization: Bearer $TOKEN" \
  "https://your-domain.atlassian.net/rest/api/3/issue/{issueIdOrKey}/worklog"
```

---

## POST /rest/api/3/issue/{issueIdOrKey}/worklog

**Add worklog**

Adds a worklog to an issue.

Time tracking must be enabled in Jira, otherwise this operation returns an error. For more information, see [Configuring time tracking](https://confluence.atlassian.com/x/qoXKM).

This operation can be accessed anonymously.

**[Permissions](#permissions) required:**

 *  *Browse projects* and *Work on issues* [project permission](https://confluence.atlassian.com/x/yodKLg) for the project that the issue is in.
 *  If [issue-level security](https://confluence.atlassian.com/x/J4lKLg) is configured, issue-level security permission to view the issue.

### Parameters

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| `issueIdOrKey` | path | string | Yes | The ID or key the issue. |
| `notifyUsers` | query | boolean | No | Whether users watching the issue are notified by e |
| `adjustEstimate` | query | string | No | Defines how to update the issue's time estimate, t |
| `newEstimate` | query | string | No | The value to set as the issue's remaining time est |
| `reduceBy` | query | string | No | The amount to reduce the issue's remaining estimat |
| `expand` | query | string | No | Use [expand](#expansion) to include additional inf |
| `overrideEditableFlag` | query | boolean | No | Whether the worklog entry should be added to the i |

### Example

```bash
curl -X POST \
  -H "Authorization: Bearer $TOKEN" \
  "https://your-domain.atlassian.net/rest/api/3/issue/{issueIdOrKey}/worklog"
```

---

## POST /rest/api/3/issue/{issueIdOrKey}/worklog/move

**Bulk move worklogs**

Moves a list of worklogs from one issue to another. This is an experimental API with several limitations:

 *  You can't move more than 5000 worklogs at once.
 *  You can't move worklogs containing an attachment.
 *  You can't move worklogs restricted by project roles.
 *  No notifications will be sent for moved worklogs.
 *  No webhooks or events will be sent for moved worklogs.
 *  No issue history will be recorded for moved worklogs.

Time tracking must be enabled in Jira, otherwise this operation returns an error. For more information, see [Configuring time tracking](https://confluence.atlassian.com/x/qoXKM).

**[Permissions](#permissions) required:**

 *  *Browse projects* [project permission](https://confluence.atlassian.com/x/yodKLg) for the projects containing the source and destination issues.
 *  If [issue-level security](https://confluence.atlassian.com/x/J4lKLg) is configured, issue-level security permission to view the issue.
 *  *Delete all worklogs*[ and *Edit all worklogs*](https://confluence.atlassian.com/x/yodKLg)[project permission](https://confluence.atlassian.com/x/yodKLg)
 *  If the worklog has visibility restrictions, belongs to the group or has the role visibility is restricted to.

### Parameters

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| `issueIdOrKey` | path | string | Yes |  |
| `adjustEstimate` | query | string | No | Defines how to update the issues' time estimate, t |
| `overrideEditableFlag` | query | boolean | No | Whether the work log entry should be moved to and  |

### Example

```bash
curl -X POST \
  -H "Authorization: Bearer $TOKEN" \
  "https://your-domain.atlassian.net/rest/api/3/issue/{issueIdOrKey}/worklog/move"
```

---

## DELETE /rest/api/3/issue/{issueIdOrKey}/worklog/{id}

**Delete worklog**

Deletes a worklog from an issue.

Time tracking must be enabled in Jira, otherwise this operation returns an error. For more information, see [Configuring time tracking](https://confluence.atlassian.com/x/qoXKM).

This operation can be accessed anonymously.

**[Permissions](#permissions) required:**

 *  *Browse projects* [project permission](https://confluence.atlassian.com/x/yodKLg) for the project that the issue is in.
 *  If [issue-level security](https://confluence.atlassian.com/x/J4lKLg) is configured, issue-level security permission to view the issue.
 *  *Delete all worklogs*[ project permission](https://confluence.atlassian.com/x/yodKLg) to delete any worklog or *Delete own worklogs* to delete worklogs created by the user,
 *  If the worklog has visibility restrictions, belongs to the group or has the role visibility is restricted to.

### Parameters

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| `issueIdOrKey` | path | string | Yes | The ID or key of the issue. |
| `id` | path | string | Yes | The ID of the worklog. |
| `notifyUsers` | query | boolean | No | Whether users watching the issue are notified by e |
| `adjustEstimate` | query | string | No | Defines how to update the issue's time estimate, t |
| `newEstimate` | query | string | No | The value to set as the issue's remaining time est |
| `increaseBy` | query | string | No | The amount to increase the issue's remaining estim |
| `overrideEditableFlag` | query | boolean | No | Whether the work log entry should be added to the  |

### Example

```bash
curl -X DELETE \
  -H "Authorization: Bearer $TOKEN" \
  "https://your-domain.atlassian.net/rest/api/3/issue/{issueIdOrKey}/worklog/{id}"
```

---

## GET /rest/api/3/issue/{issueIdOrKey}/worklog/{id}

**Get worklog**

Returns a worklog.

Time tracking must be enabled in Jira, otherwise this operation returns an error. For more information, see [Configuring time tracking](https://confluence.atlassian.com/x/qoXKM).

This operation can be accessed anonymously.

**[Permissions](#permissions) required:**

 *  *Browse projects* [project permission](https://confluence.atlassian.com/x/yodKLg) for the project that the issue is in.
 *  If [issue-level security](https://confluence.atlassian.com/x/J4lKLg) is configured, issue-level security permission to view the issue.
 *  If the worklog has visibility restrictions, belongs to the group or has the role visibility is restricted to.

### Parameters

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| `issueIdOrKey` | path | string | Yes | The ID or key of the issue. |
| `id` | path | string | Yes | The ID of the worklog. |
| `expand` | query | string | No | Use [expand](#expansion) to include additional inf |

### Example

```bash
curl -X GET \
  -H "Authorization: Bearer $TOKEN" \
  "https://your-domain.atlassian.net/rest/api/3/issue/{issueIdOrKey}/worklog/{id}"
```

---

## PUT /rest/api/3/issue/{issueIdOrKey}/worklog/{id}

**Update worklog**

Updates a worklog.

Time tracking must be enabled in Jira, otherwise this operation returns an error. For more information, see [Configuring time tracking](https://confluence.atlassian.com/x/qoXKM).

This operation can be accessed anonymously.

**[Permissions](#permissions) required:**

 *  *Browse projects* [project permission](https://confluence.atlassian.com/x/yodKLg) for the project that the issue is in.
 *  If [issue-level security](https://confluence.atlassian.com/x/J4lKLg) is configured, issue-level security permission to view the issue.
 *  *Edit all worklogs*[ project permission](https://confluence.atlassian.com/x/yodKLg) to update any worklog or *Edit own worklogs* to update worklogs created by the user.
 *  If the worklog has visibility restrictions, belongs to the group or has the role visibility is restricted to.

### Parameters

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| `issueIdOrKey` | path | string | Yes | The ID or key the issue. |
| `id` | path | string | Yes | The ID of the worklog. |
| `notifyUsers` | query | boolean | No | Whether users watching the issue are notified by e |
| `adjustEstimate` | query | string | No | Defines how to update the issue's time estimate, t |
| `newEstimate` | query | string | No | The value to set as the issue's remaining time est |
| `expand` | query | string | No | Use [expand](#expansion) to include additional inf |
| `overrideEditableFlag` | query | boolean | No | Whether the worklog should be added to the issue e |

### Example

```bash
curl -X PUT \
  -H "Authorization: Bearer $TOKEN" \
  "https://your-domain.atlassian.net/rest/api/3/issue/{issueIdOrKey}/worklog/{id}"
```

---

## GET /rest/api/3/worklog/deleted

**Get IDs of deleted worklogs**

Returns a list of IDs and delete timestamps for worklogs deleted after a date and time.

This resource is paginated, with a limit of 1000 worklogs per page. Each page lists worklogs from oldest to youngest. If the number of items in the date range exceeds 1000, `until` indicates the timestamp of the youngest item on the page. Also, `nextPage` provides the URL for the next page of worklogs. The `lastPage` parameter is set to true on the last page of worklogs.

This resource does not return worklogs deleted during the minute preceding the request.

**[Permissions](#permissions) required:** Permission to access Jira.

### Parameters

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| `since` | query | integer | No | The date and time, as a UNIX timestamp in millisec |

### Example

```bash
curl -X GET \
  -H "Authorization: Bearer $TOKEN" \
  "https://your-domain.atlassian.net/rest/api/3/worklog/deleted"
```

---

## POST /rest/api/3/worklog/list

**Get worklogs**

Returns worklog details for a list of worklog IDs.

The returned list of worklogs is limited to 1000 items.

**[Permissions](#permissions) required:** Permission to access Jira, however, worklogs are only returned where either of the following is true:

 *  the worklog is set as *Viewable by All Users*.
 *  the user is a member of a project role or group with permission to view the worklog.

### Parameters

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| `expand` | query | string | No | Use [expand](#expansion) to include additional inf |

### Example

```bash
curl -X POST \
  -H "Authorization: Bearer $TOKEN" \
  "https://your-domain.atlassian.net/rest/api/3/worklog/list"
```

---

## GET /rest/api/3/worklog/updated

**Get IDs of updated worklogs**

Returns a list of IDs and update timestamps for worklogs updated after a date and time.

This resource is paginated, with a limit of 1000 worklogs per page. Each page lists worklogs from oldest to youngest. If the number of items in the date range exceeds 1000, `until` indicates the timestamp of the youngest item on the page. Also, `nextPage` provides the URL for the next page of worklogs. The `lastPage` parameter is set to true on the last page of worklogs.

This resource does not return worklogs updated during the minute preceding the request.

**[Permissions](#permissions) required:** Permission to access Jira, however, worklogs are only returned where either of the following is true:

 *  the worklog is set as *Viewable by All Users*.
 *  the user is a member of a project role or group with permission to view the worklog.

### Parameters

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| `since` | query | integer | No | The date and time, as a UNIX timestamp in millisec |
| `expand` | query | string | No | Use [expand](#expansion) to include additional inf |

### Example

```bash
curl -X GET \
  -H "Authorization: Bearer $TOKEN" \
  "https://your-domain.atlassian.net/rest/api/3/worklog/updated"
```

---
