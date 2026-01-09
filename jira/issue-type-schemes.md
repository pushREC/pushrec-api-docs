---
created: 2026-01-09
tags: [type/api-reference, api/issue-type-schemes]
api_name: The Jira Cloud platform REST API
category: Issue type schemes
endpoint_count: 10
---

# The Jira Cloud platform REST API - Issue Type Schemes

[[README|Back to Overview]]

---

## GET /rest/api/3/issuetypescheme

**Get all issue type schemes**

Returns a [paginated](#pagination) list of issue type schemes.

Only issue type schemes used in classic projects are returned.

**[Permissions](#permissions) required:** *Administer Jira* [global permission](https://confluence.atlassian.com/x/x4dKLg).

### Parameters

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| `startAt` | query | integer | No | The index of the first item to return in a page of |
| `maxResults` | query | integer | No | The maximum number of items to return per page. |
| `id` | query | array | No | The list of issue type schemes IDs. To include mul |
| `orderBy` | query | string | No | [Order](#ordering) the results by a field:

 *  `n |
| `expand` | query | string | No | Use [expand](#expansion) to include additional inf |
| `queryString` | query | string | No | String used to perform a case-insensitive partial  |

### Example

```bash
curl -X GET \
  -H "Authorization: Bearer $TOKEN" \
  "https://your-domain.atlassian.net/rest/api/3/issuetypescheme"
```

---

## POST /rest/api/3/issuetypescheme

**Create issue type scheme**

Creates an issue type scheme.

**[Permissions](#permissions) required:** *Administer Jira* [global permission](https://confluence.atlassian.com/x/x4dKLg).

### Example

```bash
curl -X POST \
  -H "Authorization: Bearer $TOKEN" \
  "https://your-domain.atlassian.net/rest/api/3/issuetypescheme"
```

---

## GET /rest/api/3/issuetypescheme/mapping

**Get issue type scheme items**

Returns a [paginated](#pagination) list of issue type scheme items.

Only issue type scheme items used in classic projects are returned.

**[Permissions](#permissions) required:** *Administer Jira* [global permission](https://confluence.atlassian.com/x/x4dKLg).

### Parameters

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| `startAt` | query | integer | No | The index of the first item to return in a page of |
| `maxResults` | query | integer | No | The maximum number of items to return per page. |
| `issueTypeSchemeId` | query | array | No | The list of issue type scheme IDs. To include mult |

### Example

```bash
curl -X GET \
  -H "Authorization: Bearer $TOKEN" \
  "https://your-domain.atlassian.net/rest/api/3/issuetypescheme/mapping"
```

---

## GET /rest/api/3/issuetypescheme/project

**Get issue type schemes for projects**

Returns a [paginated](#pagination) list of issue type schemes and, for each issue type scheme, a list of the projects that use it.

Only issue type schemes used in classic projects are returned.

**[Permissions](#permissions) required:** *Administer Jira* [global permission](https://confluence.atlassian.com/x/x4dKLg).

### Parameters

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| `startAt` | query | integer | No | The index of the first item to return in a page of |
| `maxResults` | query | integer | No | The maximum number of items to return per page. |
| `projectId` | query | array | Yes | The list of project IDs. To include multiple proje |

### Example

```bash
curl -X GET \
  -H "Authorization: Bearer $TOKEN" \
  "https://your-domain.atlassian.net/rest/api/3/issuetypescheme/project"
```

---

## PUT /rest/api/3/issuetypescheme/project

**Assign issue type scheme to project**

Assigns an issue type scheme to a project.

If any issues in the project are assigned issue types not present in the new scheme, the operation will fail. To complete the assignment those issues must be updated to use issue types in the new scheme.

Issue type schemes can only be assigned to classic projects.

**[Permissions](#permissions) required:** *Administer Jira* [global permission](https://confluence.atlassian.com/x/x4dKLg).

### Example

```bash
curl -X PUT \
  -H "Authorization: Bearer $TOKEN" \
  "https://your-domain.atlassian.net/rest/api/3/issuetypescheme/project"
```

---

## DELETE /rest/api/3/issuetypescheme/{issueTypeSchemeId}

**Delete issue type scheme**

Deletes an issue type scheme.

Only issue type schemes used in classic projects can be deleted.

Any projects assigned to the scheme are reassigned to the default issue type scheme.

**[Permissions](#permissions) required:** *Administer Jira* [global permission](https://confluence.atlassian.com/x/x4dKLg).

### Parameters

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| `issueTypeSchemeId` | path | integer | Yes | The ID of the issue type scheme. |

### Example

```bash
curl -X DELETE \
  -H "Authorization: Bearer $TOKEN" \
  "https://your-domain.atlassian.net/rest/api/3/issuetypescheme/{issueTypeSchemeId}"
```

---

## PUT /rest/api/3/issuetypescheme/{issueTypeSchemeId}

**Update issue type scheme**

Updates an issue type scheme.

**[Permissions](#permissions) required:** *Administer Jira* [global permission](https://confluence.atlassian.com/x/x4dKLg).

### Parameters

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| `issueTypeSchemeId` | path | integer | Yes | The ID of the issue type scheme. |

### Example

```bash
curl -X PUT \
  -H "Authorization: Bearer $TOKEN" \
  "https://your-domain.atlassian.net/rest/api/3/issuetypescheme/{issueTypeSchemeId}"
```

---

## PUT /rest/api/3/issuetypescheme/{issueTypeSchemeId}/issuetype

**Add issue types to issue type scheme**

Adds issue types to an issue type scheme.

The added issue types are appended to the issue types list.

If any of the issue types exist in the issue type scheme, the operation fails and no issue types are added.

**[Permissions](#permissions) required:** *Administer Jira* [global permission](https://confluence.atlassian.com/x/x4dKLg).

### Parameters

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| `issueTypeSchemeId` | path | integer | Yes | The ID of the issue type scheme. |

### Example

```bash
curl -X PUT \
  -H "Authorization: Bearer $TOKEN" \
  "https://your-domain.atlassian.net/rest/api/3/issuetypescheme/{issueTypeSchemeId}/issuetype"
```

---

## PUT /rest/api/3/issuetypescheme/{issueTypeSchemeId}/issuetype/move

**Change order of issue types**

Changes the order of issue types in an issue type scheme.

The request body parameters must meet the following requirements:

 *  all of the issue types must belong to the issue type scheme.
 *  either `after` or `position` must be provided.
 *  the issue type in `after` must not be in the issue type list.

**[Permissions](#permissions) required:** *Administer Jira* [global permission](https://confluence.atlassian.com/x/x4dKLg).

### Parameters

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| `issueTypeSchemeId` | path | integer | Yes | The ID of the issue type scheme. |

### Example

```bash
curl -X PUT \
  -H "Authorization: Bearer $TOKEN" \
  "https://your-domain.atlassian.net/rest/api/3/issuetypescheme/{issueTypeSchemeId}/issuetype/move"
```

---

## DELETE /rest/api/3/issuetypescheme/{issueTypeSchemeId}/issuetype/{issueTypeId}

**Remove issue type from issue type scheme**

Removes an issue type from an issue type scheme.

This operation cannot remove:

 *  any issue type used by issues.
 *  any issue types from the default issue type scheme.
 *  the last standard issue type from an issue type scheme.

**[Permissions](#permissions) required:** *Administer Jira* [global permission](https://confluence.atlassian.com/x/x4dKLg).

### Parameters

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| `issueTypeSchemeId` | path | integer | Yes | The ID of the issue type scheme. |
| `issueTypeId` | path | integer | Yes | The ID of the issue type. |

### Example

```bash
curl -X DELETE \
  -H "Authorization: Bearer $TOKEN" \
  "https://your-domain.atlassian.net/rest/api/3/issuetypescheme/{issueTypeSchemeId}/issuetype/{issueTypeId}"
```

---
