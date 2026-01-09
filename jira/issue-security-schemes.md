---
created: 2026-01-09
tags: [type/api-reference, api/issue-security-schemes]
api_name: The Jira Cloud platform REST API
category: Issue security schemes
endpoint_count: 16
---

# The Jira Cloud platform REST API - Issue Security Schemes

[[README|Back to Overview]]

---

## GET /rest/api/3/issuesecurityschemes

**Get issue security schemes**

Returns all [issue security schemes](https://confluence.atlassian.com/x/J4lKLg).

**[Permissions](#permissions) required:** *Administer Jira* [global permission](https://confluence.atlassian.com/x/x4dKLg).

### Example

```bash
curl -X GET \
  -H "Authorization: Bearer $TOKEN" \
  "https://your-domain.atlassian.net/rest/api/3/issuesecurityschemes"
```

---

## POST /rest/api/3/issuesecurityschemes

**Create issue security scheme**

Creates a security scheme with security scheme levels and levels' members. You can create up to 100 security scheme levels and security scheme levels' members per request.

**[Permissions](#permissions) required:** *Administer Jira* [global permission](https://confluence.atlassian.com/x/x4dKLg).

### Example

```bash
curl -X POST \
  -H "Authorization: Bearer $TOKEN" \
  "https://your-domain.atlassian.net/rest/api/3/issuesecurityschemes"
```

---

## GET /rest/api/3/issuesecurityschemes/level

**Get issue security levels**

Returns a [paginated](#pagination) list of issue security levels.

Only issue security levels in the context of classic projects are returned.

Filtering using IDs is inclusive: if you specify both security scheme IDs and level IDs, the result will include both specified issue security levels and all issue security levels from the specified schemes.

**[Permissions](#permissions) required:** *Administer Jira* [global permission](https://confluence.atlassian.com/x/x4dKLg).

### Parameters

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| `startAt` | query | string | No | The index of the first item to return in a page of |
| `maxResults` | query | string | No | The maximum number of items to return per page. |
| `id` | query | array | No | The list of issue security scheme level IDs. To in |
| `schemeId` | query | array | No | The list of issue security scheme IDs. To include  |
| `onlyDefault` | query | boolean | No | When set to true, returns multiple default levels  |

### Example

```bash
curl -X GET \
  -H "Authorization: Bearer $TOKEN" \
  "https://your-domain.atlassian.net/rest/api/3/issuesecurityschemes/level"
```

---

## PUT /rest/api/3/issuesecurityschemes/level/default

**Set default issue security levels**

Sets default issue security levels for schemes.

**[Permissions](#permissions) required:** *Administer Jira* [global permission](https://confluence.atlassian.com/x/x4dKLg).

### Example

```bash
curl -X PUT \
  -H "Authorization: Bearer $TOKEN" \
  "https://your-domain.atlassian.net/rest/api/3/issuesecurityschemes/level/default"
```

---

## GET /rest/api/3/issuesecurityschemes/level/member

**Get issue security level members**

Returns a [paginated](#pagination) list of issue security level members.

Only issue security level members in the context of classic projects are returned.

Filtering using parameters is inclusive: if you specify both security scheme IDs and level IDs, the result will include all issue security level members from the specified schemes and levels.

**[Permissions](#permissions) required:** *Administer Jira* [global permission](https://confluence.atlassian.com/x/x4dKLg).

### Parameters

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| `startAt` | query | string | No | The index of the first item to return in a page of |
| `maxResults` | query | string | No | The maximum number of items to return per page. |
| `id` | query | array | No | The list of issue security level member IDs. To in |
| `schemeId` | query | array | No | The list of issue security scheme IDs. To include  |
| `levelId` | query | array | No | The list of issue security level IDs. To include m |
| `expand` | query | string | No | Use expand to include additional information in th |

### Example

```bash
curl -X GET \
  -H "Authorization: Bearer $TOKEN" \
  "https://your-domain.atlassian.net/rest/api/3/issuesecurityschemes/level/member"
```

---

## GET /rest/api/3/issuesecurityschemes/project

**Get projects using issue security schemes**

Returns a [paginated](#pagination) mapping of projects that are using security schemes. You can provide either one or multiple security scheme IDs or project IDs to filter by. If you don't provide any, this will return a list of all mappings. Only issue security schemes in the context of classic projects are supported. **[Permissions](#permissions) required:** *Administer Jira* [global permission](https://confluence.atlassian.com/x/x4dKLg).

### Parameters

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| `startAt` | query | string | No | The index of the first item to return in a page of |
| `maxResults` | query | string | No | The maximum number of items to return per page. |
| `issueSecuritySchemeId` | query | array | No | The list of security scheme IDs to be filtered out |
| `projectId` | query | array | No | The list of project IDs to be filtered out. |

### Example

```bash
curl -X GET \
  -H "Authorization: Bearer $TOKEN" \
  "https://your-domain.atlassian.net/rest/api/3/issuesecurityschemes/project"
```

---

## PUT /rest/api/3/issuesecurityschemes/project

**Associate security scheme to project**

Associates an issue security scheme with a project and remaps security levels of issues to the new levels, if provided.

This operation is [asynchronous](#async). Follow the `location` link in the response to determine the status of the task and use [Get task](#api-rest-api-3-task-taskId-get) to obtain subsequent updates.

**[Permissions](#permissions) required:** *Administer Jira* [global permission](https://confluence.atlassian.com/x/x4dKLg).

### Example

```bash
curl -X PUT \
  -H "Authorization: Bearer $TOKEN" \
  "https://your-domain.atlassian.net/rest/api/3/issuesecurityschemes/project"
```

---

## GET /rest/api/3/issuesecurityschemes/search

**Search issue security schemes**

Returns a [paginated](#pagination) list of issue security schemes.  
If you specify the project ID parameter, the result will contain issue security schemes and related project IDs you filter by. Use \{@link IssueSecuritySchemeResource\#searchProjectsUsingSecuritySchemes(String, String, Set, Set)\} to obtain all projects related to scheme.

Only issue security schemes in the context of classic projects are returned.

**[Permissions](#permissions) required:** *Administer Jira* [global permission](https://confluence.atlassian.com/x/x4dKLg).

### Parameters

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| `startAt` | query | string | No | The index of the first item to return in a page of |
| `maxResults` | query | string | No | The maximum number of items to return per page. |
| `id` | query | array | No | The list of issue security scheme IDs. To include  |
| `projectId` | query | array | No | The list of project IDs. To include multiple proje |

### Example

```bash
curl -X GET \
  -H "Authorization: Bearer $TOKEN" \
  "https://your-domain.atlassian.net/rest/api/3/issuesecurityschemes/search"
```

---

## GET /rest/api/3/issuesecurityschemes/{id}

**Get issue security scheme**

Returns an issue security scheme along with its security levels.

**[Permissions](#permissions) required:**

 *  *Administer Jira* [global permission](https://confluence.atlassian.com/x/x4dKLg).
 *  *Administer Projects* [project permission](https://confluence.atlassian.com/x/yodKLg) for a project that uses the requested issue security scheme.

### Parameters

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| `id` | path | integer | Yes | The ID of the issue security scheme. Use the [Get  |

### Example

```bash
curl -X GET \
  -H "Authorization: Bearer $TOKEN" \
  "https://your-domain.atlassian.net/rest/api/3/issuesecurityschemes/{id}"
```

---

## PUT /rest/api/3/issuesecurityschemes/{id}

**Update issue security scheme**

Updates the issue security scheme.

**[Permissions](#permissions) required:** *Administer Jira* [global permission](https://confluence.atlassian.com/x/x4dKLg).

### Parameters

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| `id` | path | string | Yes | The ID of the issue security scheme. |

### Example

```bash
curl -X PUT \
  -H "Authorization: Bearer $TOKEN" \
  "https://your-domain.atlassian.net/rest/api/3/issuesecurityschemes/{id}"
```

---

## DELETE /rest/api/3/issuesecurityschemes/{schemeId}

**Delete issue security scheme**

Deletes an issue security scheme.

**[Permissions](#permissions) required:** *Administer Jira* [global permission](https://confluence.atlassian.com/x/x4dKLg).

### Parameters

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| `schemeId` | path | string | Yes | The ID of the issue security scheme. |

### Example

```bash
curl -X DELETE \
  -H "Authorization: Bearer $TOKEN" \
  "https://your-domain.atlassian.net/rest/api/3/issuesecurityschemes/{schemeId}"
```

---

## PUT /rest/api/3/issuesecurityschemes/{schemeId}/level

**Add issue security levels**

Adds levels and levels' members to the issue security scheme. You can add up to 100 levels per request.

**[Permissions](#permissions) required:** *Administer Jira* [global permission](https://confluence.atlassian.com/x/x4dKLg).

### Parameters

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| `schemeId` | path | string | Yes | The ID of the issue security scheme. |

### Example

```bash
curl -X PUT \
  -H "Authorization: Bearer $TOKEN" \
  "https://your-domain.atlassian.net/rest/api/3/issuesecurityschemes/{schemeId}/level"
```

---

## DELETE /rest/api/3/issuesecurityschemes/{schemeId}/level/{levelId}

**Remove issue security level**

Deletes an issue security level.

This operation is [asynchronous](#async). Follow the `location` link in the response to determine the status of the task and use [Get task](#api-rest-api-3-task-taskId-get) to obtain subsequent updates.

**[Permissions](#permissions) required:** *Administer Jira* [global permission](https://confluence.atlassian.com/x/x4dKLg).

### Parameters

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| `schemeId` | path | string | Yes | The ID of the issue security scheme. |
| `levelId` | path | string | Yes | The ID of the issue security level to remove. |
| `replaceWith` | query | string | No | The ID of the issue security level that will repla |

### Example

```bash
curl -X DELETE \
  -H "Authorization: Bearer $TOKEN" \
  "https://your-domain.atlassian.net/rest/api/3/issuesecurityschemes/{schemeId}/level/{levelId}"
```

---

## PUT /rest/api/3/issuesecurityschemes/{schemeId}/level/{levelId}

**Update issue security level**

Updates the issue security level.

**[Permissions](#permissions) required:** *Administer Jira* [global permission](https://confluence.atlassian.com/x/x4dKLg).

### Parameters

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| `schemeId` | path | string | Yes | The ID of the issue security scheme level belongs  |
| `levelId` | path | string | Yes | The ID of the issue security level to update. |

### Example

```bash
curl -X PUT \
  -H "Authorization: Bearer $TOKEN" \
  "https://your-domain.atlassian.net/rest/api/3/issuesecurityschemes/{schemeId}/level/{levelId}"
```

---

## PUT /rest/api/3/issuesecurityschemes/{schemeId}/level/{levelId}/member

**Add issue security level members**

Adds members to the issue security level. You can add up to 100 members per request.

**[Permissions](#permissions) required:** *Administer Jira* [global permission](https://confluence.atlassian.com/x/x4dKLg).

### Parameters

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| `schemeId` | path | string | Yes | The ID of the issue security scheme. |
| `levelId` | path | string | Yes | The ID of the issue security level. |

### Example

```bash
curl -X PUT \
  -H "Authorization: Bearer $TOKEN" \
  "https://your-domain.atlassian.net/rest/api/3/issuesecurityschemes/{schemeId}/level/{levelId}/member"
```

---

## DELETE /rest/api/3/issuesecurityschemes/{schemeId}/level/{levelId}/member/{memberId}

**Remove member from issue security level**

Removes an issue security level member from an issue security scheme.

**[Permissions](#permissions) required:** *Administer Jira* [global permission](https://confluence.atlassian.com/x/x4dKLg).

### Parameters

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| `schemeId` | path | string | Yes | The ID of the issue security scheme. |
| `levelId` | path | string | Yes | The ID of the issue security level. |
| `memberId` | path | string | Yes | The ID of the issue security level member to be re |

### Example

```bash
curl -X DELETE \
  -H "Authorization: Bearer $TOKEN" \
  "https://your-domain.atlassian.net/rest/api/3/issuesecurityschemes/{schemeId}/level/{levelId}/member/{memberId}"
```

---
