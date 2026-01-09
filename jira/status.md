---
created: 2026-01-09
tags: [type/api-reference, api/status]
api_name: The Jira Cloud platform REST API
category: Status
endpoint_count: 9
---

# The Jira Cloud platform REST API - Status

[[README|Back to Overview]]

---

## DELETE /rest/api/3/statuses

**Bulk delete Statuses**

Deletes statuses by ID.

**[Permissions](#permissions) required:**

 *  *Administer projects* [project permission.](https://confluence.atlassian.com/x/yodKLg)
 *  *Administer Jira* [project permission.](https://confluence.atlassian.com/x/yodKLg)

### Parameters

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| `id` | query | array | Yes | The list of status IDs. To include multiple IDs, p |

### Example

```bash
curl -X DELETE \
  -H "Authorization: Bearer $TOKEN" \
  "https://your-domain.atlassian.net/rest/api/3/statuses"
```

---

## GET /rest/api/3/statuses

**Bulk get statuses**

Returns a list of the statuses specified by one or more status IDs.

**[Permissions](#permissions) required:**

 *  *Administer projects* [project permission.](https://confluence.atlassian.com/x/yodKLg)
 *  *Administer Jira* [project permission.](https://confluence.atlassian.com/x/yodKLg)

### Parameters

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| `id` | query | array | Yes | The list of status IDs. To include multiple IDs, p |

### Example

```bash
curl -X GET \
  -H "Authorization: Bearer $TOKEN" \
  "https://your-domain.atlassian.net/rest/api/3/statuses"
```

---

## POST /rest/api/3/statuses

**Bulk create statuses**

Creates statuses for a global or project scope.

**[Permissions](#permissions) required:**

 *  *Administer projects* [project permission.](https://confluence.atlassian.com/x/yodKLg)
 *  *Administer Jira* [project permission.](https://confluence.atlassian.com/x/yodKLg)

### Example

```bash
curl -X POST \
  -H "Authorization: Bearer $TOKEN" \
  "https://your-domain.atlassian.net/rest/api/3/statuses"
```

---

## PUT /rest/api/3/statuses

**Bulk update statuses**

Updates statuses by ID.

**[Permissions](#permissions) required:**

 *  *Administer projects* [project permission.](https://confluence.atlassian.com/x/yodKLg)
 *  *Administer Jira* [project permission.](https://confluence.atlassian.com/x/yodKLg)

### Example

```bash
curl -X PUT \
  -H "Authorization: Bearer $TOKEN" \
  "https://your-domain.atlassian.net/rest/api/3/statuses"
```

---

## GET /rest/api/3/statuses/byNames

**Bulk get statuses by name**

Returns a list of the statuses specified by one or more status names.

**[Permissions](#permissions) required:**

 *  *Administer projects* [project permission.](https://confluence.atlassian.com/x/yodKLg)
 *  *Administer Jira* [project permission.](https://confluence.atlassian.com/x/yodKLg)
 *  *Browse projects* [project permission.](https://confluence.atlassian.com/x/yodKLg)

### Parameters

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| `name` | query | array | Yes | The list of status names. To include multiple name |
| `projectId` | query | string | No | The project the status is part of or null for glob |

### Example

```bash
curl -X GET \
  -H "Authorization: Bearer $TOKEN" \
  "https://your-domain.atlassian.net/rest/api/3/statuses/byNames"
```

---

## GET /rest/api/3/statuses/search

**Search statuses paginated**

Returns a [paginated](https://developer.atlassian.com/cloud/jira/platform/rest/v3/intro/#pagination) list of statuses that match a search on name or project.

**[Permissions](#permissions) required:**

 *  *Administer projects* [project permission.](https://confluence.atlassian.com/x/yodKLg)
 *  *Administer Jira* [project permission.](https://confluence.atlassian.com/x/yodKLg)

### Parameters

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| `projectId` | query | string | No | The project the status is part of or null for glob |
| `startAt` | query | integer | No | The index of the first item to return in a page of |
| `maxResults` | query | integer | No | The maximum number of items to return per page. |
| `searchString` | query | string | No | Term to match status names against or null to sear |
| `statusCategory` | query | string | No | Category of the status to filter by. The supported |

### Example

```bash
curl -X GET \
  -H "Authorization: Bearer $TOKEN" \
  "https://your-domain.atlassian.net/rest/api/3/statuses/search"
```

---

## GET /rest/api/3/statuses/{statusId}/project/{projectId}/issueTypeUsages

**Get issue type usages by status and project**

Returns a page of issue types in a project using a given status.

### Parameters

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| `statusId` | path | string | Yes | The statusId to fetch issue type usages for |
| `projectId` | path | string | Yes | The projectId to fetch issue type usages for |
| `nextPageToken` | query | string | No | The cursor for pagination |
| `maxResults` | query | integer | No | The maximum number of results to return. Must be a |

### Example

```bash
curl -X GET \
  -H "Authorization: Bearer $TOKEN" \
  "https://your-domain.atlassian.net/rest/api/3/statuses/{statusId}/project/{projectId}/issueTypeUsages"
```

---

## GET /rest/api/3/statuses/{statusId}/projectUsages

**Get project usages by status**

Returns a page of projects using a given status.

### Parameters

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| `statusId` | path | string | Yes | The statusId to fetch project usages for |
| `nextPageToken` | query | string | No | The cursor for pagination |
| `maxResults` | query | integer | No | The maximum number of results to return. Must be a |

### Example

```bash
curl -X GET \
  -H "Authorization: Bearer $TOKEN" \
  "https://your-domain.atlassian.net/rest/api/3/statuses/{statusId}/projectUsages"
```

---

## GET /rest/api/3/statuses/{statusId}/workflowUsages

**Get workflow usages by status**

Returns a page of workflows using a given status.

### Parameters

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| `statusId` | path | string | Yes | The statusId to fetch workflow usages for |
| `nextPageToken` | query | string | No | The cursor for pagination |
| `maxResults` | query | integer | No | The maximum number of results to return. Must be a |

### Example

```bash
curl -X GET \
  -H "Authorization: Bearer $TOKEN" \
  "https://your-domain.atlassian.net/rest/api/3/statuses/{statusId}/workflowUsages"
```

---
