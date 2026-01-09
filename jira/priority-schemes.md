---
created: 2026-01-09
tags: [type/api-reference, api/priority-schemes]
api_name: The Jira Cloud platform REST API
category: Priority schemes
endpoint_count: 8
---

# The Jira Cloud platform REST API - Priority Schemes

[[README|Back to Overview]]

---

## GET /rest/api/3/priorityscheme

**Get priority schemes**

Returns a [paginated](#pagination) list of priority schemes.

**[Permissions](#permissions) required:** Permission to access Jira.

### Parameters

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| `startAt` | query | string | No | The index of the first item to return in a page of |
| `maxResults` | query | string | No | The maximum number of items to return per page. |
| `priorityId` | query | array | No | A set of priority IDs to filter by. To include mul |
| `schemeId` | query | array | No | A set of priority scheme IDs. To include multiple  |
| `schemeName` | query | string | No | The name of scheme to search for. |
| `onlyDefault` | query | boolean | No | Whether only the default priority is returned. |
| `orderBy` | query | string | No | The ordering to return the priority schemes by. |
| `expand` | query | string | No | A comma separated list of additional information t |

### Example

```bash
curl -X GET \
  -H "Authorization: Bearer $TOKEN" \
  "https://your-domain.atlassian.net/rest/api/3/priorityscheme"
```

---

## POST /rest/api/3/priorityscheme

**Create priority scheme**

Creates a new priority scheme.

**[Permissions](#permissions) required:** *Administer Jira* [global permission](https://confluence.atlassian.com/x/x4dKLg).

### Example

```bash
curl -X POST \
  -H "Authorization: Bearer $TOKEN" \
  "https://your-domain.atlassian.net/rest/api/3/priorityscheme"
```

---

## POST /rest/api/3/priorityscheme/mappings

**Suggested priorities for mappings**

Returns a [paginated](#pagination) list of priorities that would require mapping, given a change in priorities or projects associated with a priority scheme.

**[Permissions](#permissions) required:** Permission to access Jira.

### Example

```bash
curl -X POST \
  -H "Authorization: Bearer $TOKEN" \
  "https://your-domain.atlassian.net/rest/api/3/priorityscheme/mappings"
```

---

## GET /rest/api/3/priorityscheme/priorities/available

**Get available priorities by priority scheme**

Returns a [paginated](#pagination) list of priorities available for adding to a priority scheme.

**[Permissions](#permissions) required:** Permission to access Jira.

### Parameters

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| `startAt` | query | string | No | The index of the first item to return in a page of |
| `maxResults` | query | string | No | The maximum number of items to return per page. |
| `query` | query | string | No | The string to query priorities on by name. |
| `schemeId` | query | string | Yes | The priority scheme ID. |
| `exclude` | query | array | No | A list of priority IDs to exclude from the results |

### Example

```bash
curl -X GET \
  -H "Authorization: Bearer $TOKEN" \
  "https://your-domain.atlassian.net/rest/api/3/priorityscheme/priorities/available"
```

---

## DELETE /rest/api/3/priorityscheme/{schemeId}

**Delete priority scheme**

Deletes a priority scheme.

This operation is only available for priority schemes without any associated projects. Any associated projects must be removed from the priority scheme before this operation can be performed.

**[Permissions](#permissions) required:** *Administer Jira* [global permission](https://confluence.atlassian.com/x/x4dKLg).

### Parameters

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| `schemeId` | path | integer | Yes | The priority scheme ID. |

### Example

```bash
curl -X DELETE \
  -H "Authorization: Bearer $TOKEN" \
  "https://your-domain.atlassian.net/rest/api/3/priorityscheme/{schemeId}"
```

---

## PUT /rest/api/3/priorityscheme/{schemeId}

**Update priority scheme**

Updates a priority scheme. This includes its details, the lists of priorities and projects in it

**[Permissions](#permissions) required:** *Administer Jira* [global permission](https://confluence.atlassian.com/x/x4dKLg).

### Parameters

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| `schemeId` | path | integer | Yes | The ID of the priority scheme. |

### Example

```bash
curl -X PUT \
  -H "Authorization: Bearer $TOKEN" \
  "https://your-domain.atlassian.net/rest/api/3/priorityscheme/{schemeId}"
```

---

## GET /rest/api/3/priorityscheme/{schemeId}/priorities

**Get priorities by priority scheme**

Returns a [paginated](#pagination) list of priorities by scheme.

**[Permissions](#permissions) required:** Permission to access Jira.

### Parameters

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| `startAt` | query | string | No | The index of the first item to return in a page of |
| `maxResults` | query | string | No | The maximum number of items to return per page. |
| `schemeId` | path | string | Yes | The priority scheme ID. |

### Example

```bash
curl -X GET \
  -H "Authorization: Bearer $TOKEN" \
  "https://your-domain.atlassian.net/rest/api/3/priorityscheme/{schemeId}/priorities"
```

---

## GET /rest/api/3/priorityscheme/{schemeId}/projects

**Get projects by priority scheme**

Returns a [paginated](#pagination) list of projects by scheme.

**[Permissions](#permissions) required:** Permission to access Jira.

### Parameters

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| `startAt` | query | string | No | The index of the first item to return in a page of |
| `maxResults` | query | string | No | The maximum number of items to return per page. |
| `projectId` | query | array | No | The project IDs to filter by. For example, `projec |
| `schemeId` | path | string | Yes | The priority scheme ID. |
| `query` | query | string | No | The string to query projects on by name. |

### Example

```bash
curl -X GET \
  -H "Authorization: Bearer $TOKEN" \
  "https://your-domain.atlassian.net/rest/api/3/priorityscheme/{schemeId}/projects"
```

---
