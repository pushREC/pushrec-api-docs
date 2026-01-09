---
created: 2026-01-09
tags: [type/api-reference, api/issue-notification-schemes]
api_name: The Jira Cloud platform REST API
category: Issue notification schemes
endpoint_count: 8
---

# The Jira Cloud platform REST API - Issue Notification Schemes

[[README|Back to Overview]]

---

## GET /rest/api/3/notificationscheme

**Get notification schemes paginated**

Returns a [paginated](#pagination) list of [notification schemes](https://confluence.atlassian.com/x/8YdKLg) ordered by the display name.

*Note that you should allow for events without recipients to appear in responses.*

**[Permissions](#permissions) required:** Permission to access Jira, however, the user must have permission to administer at least one project associated with a notification scheme for it to be returned.

### Parameters

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| `startAt` | query | string | No | The index of the first item to return in a page of |
| `maxResults` | query | string | No | The maximum number of items to return per page. |
| `id` | query | array | No | The list of notification schemes IDs to be filtere |
| `projectId` | query | array | No | The list of projects IDs to be filtered by |
| `onlyDefault` | query | boolean | No | When set to true, returns only the default notific |
| `expand` | query | string | No | Use [expand](#expansion) to include additional inf |

### Example

```bash
curl -X GET \
  -H "Authorization: Bearer $TOKEN" \
  "https://your-domain.atlassian.net/rest/api/3/notificationscheme"
```

---

## POST /rest/api/3/notificationscheme

**Create notification scheme**

Creates a notification scheme with notifications. You can create up to 1000 notifications per request.

**[Permissions](#permissions) required:** *Administer Jira* [global permission](https://confluence.atlassian.com/x/x4dKLg).

### Example

```bash
curl -X POST \
  -H "Authorization: Bearer $TOKEN" \
  "https://your-domain.atlassian.net/rest/api/3/notificationscheme"
```

---

## GET /rest/api/3/notificationscheme/project

**Get projects using notification schemes paginated**

Returns a [paginated](#pagination) mapping of project that have notification scheme assigned. You can provide either one or multiple notification scheme IDs or project IDs to filter by. If you don't provide any, this will return a list of all mappings. Note that only company-managed (classic) projects are supported. This is because team-managed projects don't have a concept of a default notification scheme. The mappings are ordered by projectId.

**[Permissions](#permissions) required:** Permission to access Jira.

### Parameters

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| `startAt` | query | string | No | The index of the first item to return in a page of |
| `maxResults` | query | string | No | The maximum number of items to return per page. |
| `notificationSchemeId` | query | array | No | The list of notifications scheme IDs to be filtere |
| `projectId` | query | array | No | The list of project IDs to be filtered out |

### Example

```bash
curl -X GET \
  -H "Authorization: Bearer $TOKEN" \
  "https://your-domain.atlassian.net/rest/api/3/notificationscheme/project"
```

---

## GET /rest/api/3/notificationscheme/{id}

**Get notification scheme**

Returns a [notification scheme](https://confluence.atlassian.com/x/8YdKLg), including the list of events and the recipients who will receive notifications for those events.

**[Permissions](#permissions) required:** Permission to access Jira, however, the user must have permission to administer at least one project associated with the notification scheme.

### Parameters

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| `id` | path | integer | Yes | The ID of the notification scheme. Use [Get notifi |
| `expand` | query | string | No | Use [expand](#expansion) to include additional inf |

### Example

```bash
curl -X GET \
  -H "Authorization: Bearer $TOKEN" \
  "https://your-domain.atlassian.net/rest/api/3/notificationscheme/{id}"
```

---

## PUT /rest/api/3/notificationscheme/{id}

**Update notification scheme**

Updates a notification scheme.

**[Permissions](#permissions) required:** *Administer Jira* [global permission](https://confluence.atlassian.com/x/x4dKLg).

### Parameters

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| `id` | path | string | Yes | The ID of the notification scheme. |

### Example

```bash
curl -X PUT \
  -H "Authorization: Bearer $TOKEN" \
  "https://your-domain.atlassian.net/rest/api/3/notificationscheme/{id}"
```

---

## PUT /rest/api/3/notificationscheme/{id}/notification

**Add notifications to notification scheme**

Adds notifications to a notification scheme. You can add up to 1000 notifications per request.

*Deprecated: The notification type `EmailAddress` is no longer supported in Cloud. Refer to the [changelog](https://developer.atlassian.com/cloud/jira/platform/changelog/#CHANGE-1031) for more details.*

**[Permissions](#permissions) required:** *Administer Jira* [global permission](https://confluence.atlassian.com/x/x4dKLg).

### Parameters

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| `id` | path | string | Yes | The ID of the notification scheme. |

### Example

```bash
curl -X PUT \
  -H "Authorization: Bearer $TOKEN" \
  "https://your-domain.atlassian.net/rest/api/3/notificationscheme/{id}/notification"
```

---

## DELETE /rest/api/3/notificationscheme/{notificationSchemeId}

**Delete notification scheme**

Deletes a notification scheme.

**[Permissions](#permissions) required:** *Administer Jira* [global permission](https://confluence.atlassian.com/x/x4dKLg).

### Parameters

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| `notificationSchemeId` | path | string | Yes | The ID of the notification scheme. |

### Example

```bash
curl -X DELETE \
  -H "Authorization: Bearer $TOKEN" \
  "https://your-domain.atlassian.net/rest/api/3/notificationscheme/{notificationSchemeId}"
```

---

## DELETE /rest/api/3/notificationscheme/{notificationSchemeId}/notification/{notificationId}

**Remove notification from notification scheme**

Removes a notification from a notification scheme.

**[Permissions](#permissions) required:** *Administer Jira* [global permission](https://confluence.atlassian.com/x/x4dKLg).

### Parameters

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| `notificationSchemeId` | path | string | Yes | The ID of the notification scheme. |
| `notificationId` | path | string | Yes | The ID of the notification. |

### Example

```bash
curl -X DELETE \
  -H "Authorization: Bearer $TOKEN" \
  "https://your-domain.atlassian.net/rest/api/3/notificationscheme/{notificationSchemeId}/notification/{notificationId}"
```

---
