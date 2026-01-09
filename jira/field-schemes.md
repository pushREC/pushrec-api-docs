---
created: 2026-01-09
tags: [type/api-reference, api/field-schemes]
api_name: The Jira Cloud platform REST API
category: Field schemes
endpoint_count: 14
---

# The Jira Cloud platform REST API - Field Schemes

[[README|Back to Overview]]

---

## GET /rest/api/3/config/fieldschemes

**Get field schemes**

REST endpoint for retrieving a paginated list of field association schemes with optional filtering.

This endpoint allows clients to fetch field association schemes with optional filtering by project IDs and text queries. The response includes scheme details with navigation links and filter metadata when applicable.

Filtering Behavior:

 *  When projectId or query parameters are provided, the response includes matchedFilters metadata showing which filters were applied.
 *  When no filters are applied, matchedFilters is omitted from individual scheme objects

**[Permissions](#permissions) required:** *Administer Jira* [global permission](https://confluence.atlassian.com/x/x4dKLg).

### Parameters

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| `projectId` | query | array | No | (optional) List of project IDs to filter schemes b |
| `query` | query | string | No | (optional) Text filter for scheme name or descript |
| `startAt` | query | integer | No | Zero-based index of the first item to return (defa |
| `maxResults` | query | integer | No | Maximum number of items to return per page (defaul |

### Example

```bash
curl -X GET \
  -H "Authorization: Bearer $TOKEN" \
  "https://your-domain.atlassian.net/rest/api/3/config/fieldschemes"
```

---

## POST /rest/api/3/config/fieldschemes

**Create field scheme**

Endpoint for creating a new field association scheme.

**[Permissions](#permissions) required:** *Administer Jira* [global permission](https://confluence.atlassian.com/x/x4dKLg).

### Example

```bash
curl -X POST \
  -H "Authorization: Bearer $TOKEN" \
  "https://your-domain.atlassian.net/rest/api/3/config/fieldschemes"
```

---

## DELETE /rest/api/3/config/fieldschemes/fields

**Remove fields associated with field schemes**

Remove fields associated with field association schemes.

**[Permissions](#permissions) required:** *Administer Jira* [global permission](https://confluence.atlassian.com/x/x4dKLg).

### Example

```bash
curl -X DELETE \
  -H "Authorization: Bearer $TOKEN" \
  "https://your-domain.atlassian.net/rest/api/3/config/fieldschemes/fields"
```

---

## PUT /rest/api/3/config/fieldschemes/fields

**Update fields associated with field schemes**

Update fields associated with field association schemes.

**[Permissions](#permissions) required:** *Administer Jira* [global permission](https://confluence.atlassian.com/x/x4dKLg).

### Example

```bash
curl -X PUT \
  -H "Authorization: Bearer $TOKEN" \
  "https://your-domain.atlassian.net/rest/api/3/config/fieldschemes/fields"
```

---

## DELETE /rest/api/3/config/fieldschemes/fields/parameters

**Remove field parameters**

Remove field association parameters overrides for work types.

**[Permissions](#permissions) required:** *Administer Jira* [global permission](https://confluence.atlassian.com/x/x4dKLg).

### Example

```bash
curl -X DELETE \
  -H "Authorization: Bearer $TOKEN" \
  "https://your-domain.atlassian.net/rest/api/3/config/fieldschemes/fields/parameters"
```

---

## PUT /rest/api/3/config/fieldschemes/fields/parameters

**Update field parameters**

Update field association item parameters in field association schemes.

**[Permissions](#permissions) required:** *Administer Jira* [global permission](https://confluence.atlassian.com/x/x4dKLg).

### Example

```bash
curl -X PUT \
  -H "Authorization: Bearer $TOKEN" \
  "https://your-domain.atlassian.net/rest/api/3/config/fieldschemes/fields/parameters"
```

---

## GET /rest/api/3/config/fieldschemes/projects

**Get projects with field schemes**

Get projects with field association schemes. This will be a temporary API but useful when transitioning from the legacy field configuration APIs to the new ones.

**[Permissions](#permissions) required:** *Administer Jira* [global permission](https://confluence.atlassian.com/x/x4dKLg).

### Parameters

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| `startAt` | query | integer | No | The starting index of the returned projects. Base  |
| `maxResults` | query | integer | No | The maximum number of projects to return per page, |
| `projectId` | query | array | Yes | List of project ids to filter the results by. |

### Example

```bash
curl -X GET \
  -H "Authorization: Bearer $TOKEN" \
  "https://your-domain.atlassian.net/rest/api/3/config/fieldschemes/projects"
```

---

## PUT /rest/api/3/config/fieldschemes/projects

**Associate projects to field schemes**

Associate projects to field association schemes.

**[Permissions](#permissions) required:** *Administer Jira* [global permission](https://confluence.atlassian.com/x/x4dKLg).

### Example

```bash
curl -X PUT \
  -H "Authorization: Bearer $TOKEN" \
  "https://your-domain.atlassian.net/rest/api/3/config/fieldschemes/projects"
```

---

## DELETE /rest/api/3/config/fieldschemes/{id}

**Delete a field scheme**

Delete a specified field association scheme

**[Permissions](#permissions) required:** *Administer Jira* [global permission](https://confluence.atlassian.com/x/x4dKLg).

### Parameters

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| `id` | path | integer | Yes | The ID of the field association scheme to delete. |

### Example

```bash
curl -X DELETE \
  -H "Authorization: Bearer $TOKEN" \
  "https://your-domain.atlassian.net/rest/api/3/config/fieldschemes/{id}"
```

---

## GET /rest/api/3/config/fieldschemes/{id}

**Get field scheme**

Endpoint for fetching a field association scheme by its ID

**[Permissions](#permissions) required:** *Administer Jira* [global permission](https://confluence.atlassian.com/x/x4dKLg).

### Parameters

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| `id` | path | integer | Yes | The scheme id to fetch |

### Example

```bash
curl -X GET \
  -H "Authorization: Bearer $TOKEN" \
  "https://your-domain.atlassian.net/rest/api/3/config/fieldschemes/{id}"
```

---

## PUT /rest/api/3/config/fieldschemes/{id}

**Update field scheme**

Endpoint for updating an existing field association scheme.

**[Permissions](#permissions) required:** *Administer Jira* [global permission](https://confluence.atlassian.com/x/x4dKLg).

### Parameters

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| `id` | path | integer | Yes |  |

### Example

```bash
curl -X PUT \
  -H "Authorization: Bearer $TOKEN" \
  "https://your-domain.atlassian.net/rest/api/3/config/fieldschemes/{id}"
```

---

## GET /rest/api/3/config/fieldschemes/{id}/fields

**Search field scheme fields**

Search for fields belonging to a given field association scheme.

**[Permissions](#permissions) required:** *Administer Jira* [global permission](https://confluence.atlassian.com/x/x4dKLg).

### Parameters

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| `startAt` | query | integer | No | The starting index of the returned fields. Base in |
| `maxResults` | query | integer | No | The maximum number of fields to return per page, m |
| `fieldId` | query | array | No | The field IDs to filter by, if empty then all fiel |
| `id` | path | integer | Yes | The scheme ID to search for child fields |

### Example

```bash
curl -X GET \
  -H "Authorization: Bearer $TOKEN" \
  "https://your-domain.atlassian.net/rest/api/3/config/fieldschemes/{id}/fields"
```

---

## GET /rest/api/3/config/fieldschemes/{id}/fields/{fieldId}/parameters

**Get field parameters**

Retrieve field association parameters on a field association scheme

**[Permissions](#permissions) required:** *Administer Jira* [global permission](https://confluence.atlassian.com/x/x4dKLg).

### Parameters

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| `id` | path | integer | Yes | the ID of the field association scheme to retrieve |
| `fieldId` | path | string | Yes | the ID of the field |

### Example

```bash
curl -X GET \
  -H "Authorization: Bearer $TOKEN" \
  "https://your-domain.atlassian.net/rest/api/3/config/fieldschemes/{id}/fields/{fieldId}/parameters"
```

---

## GET /rest/api/3/config/fieldschemes/{id}/projects

**Search field scheme projects**

REST Endpoint for searching for projects belonging to a given field association scheme

**[Permissions](#permissions) required:** *Administer Jira* [global permission](https://confluence.atlassian.com/x/x4dKLg).

### Parameters

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| `startAt` | query | integer | No | The starting index of the returned projects. Base  |
| `maxResults` | query | integer | No | The maximum number of projects to return per page, |
| `projectId` | query | array | No | The project Ids to filter by, if empty then all pr |
| `id` | path | integer | Yes | The scheme id to search for associated projects |

### Example

```bash
curl -X GET \
  -H "Authorization: Bearer $TOKEN" \
  "https://your-domain.atlassian.net/rest/api/3/config/fieldschemes/{id}/projects"
```

---
