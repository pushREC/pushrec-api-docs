---
created: 2026-01-09
tags: [type/api-reference, api/issue-type-screen-schemes]
api_name: The Jira Cloud platform REST API
category: Issue type screen schemes
endpoint_count: 11
---

# The Jira Cloud platform REST API - Issue Type Screen Schemes

[[README|Back to Overview]]

---

## GET /rest/api/3/issuetypescreenscheme

**Get issue type screen schemes**

Returns a [paginated](#pagination) list of issue type screen schemes.

Only issue type screen schemes used in classic projects are returned.

**[Permissions](#permissions) required:** *Administer Jira* [global permission](https://confluence.atlassian.com/x/x4dKLg).

### Parameters

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| `startAt` | query | integer | No | The index of the first item to return in a page of |
| `maxResults` | query | integer | No | The maximum number of items to return per page. |
| `id` | query | array | No | The list of issue type screen scheme IDs. To inclu |
| `queryString` | query | string | No | String used to perform a case-insensitive partial  |
| `orderBy` | query | string | No | [Order](#ordering) the results by a field:

 *  `n |
| `expand` | query | string | No | Use [expand](#expansion) to include additional inf |

### Example

```bash
curl -X GET \
  -H "Authorization: Bearer $TOKEN" \
  "https://your-domain.atlassian.net/rest/api/3/issuetypescreenscheme"
```

---

## POST /rest/api/3/issuetypescreenscheme

**Create issue type screen scheme**

Creates an issue type screen scheme.

**[Permissions](#permissions) required:** *Administer Jira* [global permission](https://confluence.atlassian.com/x/x4dKLg).

### Example

```bash
curl -X POST \
  -H "Authorization: Bearer $TOKEN" \
  "https://your-domain.atlassian.net/rest/api/3/issuetypescreenscheme"
```

---

## GET /rest/api/3/issuetypescreenscheme/mapping

**Get issue type screen scheme items**

Returns a [paginated](#pagination) list of issue type screen scheme items.

Only issue type screen schemes used in classic projects are returned.

**[Permissions](#permissions) required:** *Administer Jira* [global permission](https://confluence.atlassian.com/x/x4dKLg).

### Parameters

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| `startAt` | query | integer | No | The index of the first item to return in a page of |
| `maxResults` | query | integer | No | The maximum number of items to return per page. |
| `issueTypeScreenSchemeId` | query | array | No | The list of issue type screen scheme IDs. To inclu |

### Example

```bash
curl -X GET \
  -H "Authorization: Bearer $TOKEN" \
  "https://your-domain.atlassian.net/rest/api/3/issuetypescreenscheme/mapping"
```

---

## GET /rest/api/3/issuetypescreenscheme/project

**Get issue type screen schemes for projects**

Returns a [paginated](#pagination) list of issue type screen schemes and, for each issue type screen scheme, a list of the projects that use it.

Only issue type screen schemes used in classic projects are returned.

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
  "https://your-domain.atlassian.net/rest/api/3/issuetypescreenscheme/project"
```

---

## PUT /rest/api/3/issuetypescreenscheme/project

**Assign issue type screen scheme to project**

Assigns an issue type screen scheme to a project.

Issue type screen schemes can only be assigned to classic projects.

**[Permissions](#permissions) required:** *Administer Jira* [global permission](https://confluence.atlassian.com/x/x4dKLg).

### Example

```bash
curl -X PUT \
  -H "Authorization: Bearer $TOKEN" \
  "https://your-domain.atlassian.net/rest/api/3/issuetypescreenscheme/project"
```

---

## DELETE /rest/api/3/issuetypescreenscheme/{issueTypeScreenSchemeId}

**Delete issue type screen scheme**

Deletes an issue type screen scheme.

**[Permissions](#permissions) required:** *Administer Jira* [global permission](https://confluence.atlassian.com/x/x4dKLg).

### Parameters

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| `issueTypeScreenSchemeId` | path | string | Yes | The ID of the issue type screen scheme. |

### Example

```bash
curl -X DELETE \
  -H "Authorization: Bearer $TOKEN" \
  "https://your-domain.atlassian.net/rest/api/3/issuetypescreenscheme/{issueTypeScreenSchemeId}"
```

---

## PUT /rest/api/3/issuetypescreenscheme/{issueTypeScreenSchemeId}

**Update issue type screen scheme**

Updates an issue type screen scheme.

**[Permissions](#permissions) required:** *Administer Jira* [global permission](https://confluence.atlassian.com/x/x4dKLg).

### Parameters

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| `issueTypeScreenSchemeId` | path | string | Yes | The ID of the issue type screen scheme. |

### Example

```bash
curl -X PUT \
  -H "Authorization: Bearer $TOKEN" \
  "https://your-domain.atlassian.net/rest/api/3/issuetypescreenscheme/{issueTypeScreenSchemeId}"
```

---

## PUT /rest/api/3/issuetypescreenscheme/{issueTypeScreenSchemeId}/mapping

**Append mappings to issue type screen scheme**

Appends issue type to screen scheme mappings to an issue type screen scheme.

**[Permissions](#permissions) required:** *Administer Jira* [global permission](https://confluence.atlassian.com/x/x4dKLg).

### Parameters

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| `issueTypeScreenSchemeId` | path | string | Yes | The ID of the issue type screen scheme. |

### Example

```bash
curl -X PUT \
  -H "Authorization: Bearer $TOKEN" \
  "https://your-domain.atlassian.net/rest/api/3/issuetypescreenscheme/{issueTypeScreenSchemeId}/mapping"
```

---

## PUT /rest/api/3/issuetypescreenscheme/{issueTypeScreenSchemeId}/mapping/default

**Update issue type screen scheme default screen scheme**

Updates the default screen scheme of an issue type screen scheme. The default screen scheme is used for all unmapped issue types.

**[Permissions](#permissions) required:** *Administer Jira* [global permission](https://confluence.atlassian.com/x/x4dKLg).

### Parameters

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| `issueTypeScreenSchemeId` | path | string | Yes | The ID of the issue type screen scheme. |

### Example

```bash
curl -X PUT \
  -H "Authorization: Bearer $TOKEN" \
  "https://your-domain.atlassian.net/rest/api/3/issuetypescreenscheme/{issueTypeScreenSchemeId}/mapping/default"
```

---

## POST /rest/api/3/issuetypescreenscheme/{issueTypeScreenSchemeId}/mapping/remove

**Remove mappings from issue type screen scheme**

Removes issue type to screen scheme mappings from an issue type screen scheme.

**[Permissions](#permissions) required:** *Administer Jira* [global permission](https://confluence.atlassian.com/x/x4dKLg).

### Parameters

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| `issueTypeScreenSchemeId` | path | string | Yes | The ID of the issue type screen scheme. |

### Example

```bash
curl -X POST \
  -H "Authorization: Bearer $TOKEN" \
  "https://your-domain.atlassian.net/rest/api/3/issuetypescreenscheme/{issueTypeScreenSchemeId}/mapping/remove"
```

---

## GET /rest/api/3/issuetypescreenscheme/{issueTypeScreenSchemeId}/project

**Get issue type screen scheme projects**

Returns a [paginated](#pagination) list of projects associated with an issue type screen scheme.

Only company-managed projects associated with an issue type screen scheme are returned.

**[Permissions](#permissions) required:** *Administer Jira* [global permission](https://confluence.atlassian.com/x/x4dKLg).

### Parameters

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| `issueTypeScreenSchemeId` | path | integer | Yes | The ID of the issue type screen scheme. |
| `startAt` | query | integer | No | The index of the first item to return in a page of |
| `maxResults` | query | integer | No | The maximum number of items to return per page. |
| `query` | query | string | No |  |

### Example

```bash
curl -X GET \
  -H "Authorization: Bearer $TOKEN" \
  "https://your-domain.atlassian.net/rest/api/3/issuetypescreenscheme/{issueTypeScreenSchemeId}/project"
```

---
