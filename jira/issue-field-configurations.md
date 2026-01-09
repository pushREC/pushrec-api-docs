---
created: 2026-01-09
tags: [type/api-reference, api/issue-field-configurations]
api_name: The Jira Cloud platform REST API
category: Issue field configurations
endpoint_count: 15
---

# The Jira Cloud platform REST API - Issue Field Configurations

[[README|Back to Overview]]

---

## GET /rest/api/3/fieldconfiguration

**Get all field configurations**

Returns a [paginated](#pagination) list of field configurations. The list can be for all field configurations or a subset determined by any combination of these criteria:

 *  a list of field configuration item IDs.
 *  whether the field configuration is a default.
 *  whether the field configuration name or description contains a query string.

Only field configurations used in company-managed (classic) projects are returned.

**[Permissions](#permissions) required:** *Administer Jira* [global permission](https://confluence.atlassian.com/x/x4dKLg).

### Parameters

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| `startAt` | query | integer | No | The index of the first item to return in a page of |
| `maxResults` | query | integer | No | The maximum number of items to return per page. |
| `id` | query | array | No | The list of field configuration IDs. To include mu |
| `isDefault` | query | boolean | No | If *true* returns default field configurations onl |
| `query` | query | string | No | The query string used to match against field confi |

### Example

```bash
curl -X GET \
  -H "Authorization: Bearer $TOKEN" \
  "https://your-domain.atlassian.net/rest/api/3/fieldconfiguration"
```

---

## POST /rest/api/3/fieldconfiguration

**Create field configuration**

Creates a field configuration. The field configuration is created with the same field properties as the default configuration, with all the fields being optional.

This operation can only create configurations for use in company-managed (classic) projects.

**[Permissions](#permissions) required:** *Administer Jira* [global permission](https://confluence.atlassian.com/x/x4dKLg).

### Example

```bash
curl -X POST \
  -H "Authorization: Bearer $TOKEN" \
  "https://your-domain.atlassian.net/rest/api/3/fieldconfiguration"
```

---

## DELETE /rest/api/3/fieldconfiguration/{id}

**Delete field configuration**

Deletes a field configuration.

This operation can only delete configurations used in company-managed (classic) projects.

**[Permissions](#permissions) required:** *Administer Jira* [global permission](https://confluence.atlassian.com/x/x4dKLg).

### Parameters

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| `id` | path | integer | Yes | The ID of the field configuration. |

### Example

```bash
curl -X DELETE \
  -H "Authorization: Bearer $TOKEN" \
  "https://your-domain.atlassian.net/rest/api/3/fieldconfiguration/{id}"
```

---

## PUT /rest/api/3/fieldconfiguration/{id}

**Update field configuration**

Updates a field configuration. The name and the description provided in the request override the existing values.

This operation can only update configurations used in company-managed (classic) projects.

**[Permissions](#permissions) required:** *Administer Jira* [global permission](https://confluence.atlassian.com/x/x4dKLg).

### Parameters

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| `id` | path | integer | Yes | The ID of the field configuration. |

### Example

```bash
curl -X PUT \
  -H "Authorization: Bearer $TOKEN" \
  "https://your-domain.atlassian.net/rest/api/3/fieldconfiguration/{id}"
```

---

## GET /rest/api/3/fieldconfiguration/{id}/fields

**Get field configuration items**

Returns a [paginated](#pagination) list of all fields for a configuration.

Only the fields from configurations used in company-managed (classic) projects are returned.

**[Permissions](#permissions) required:** *Administer Jira* [global permission](https://confluence.atlassian.com/x/x4dKLg).

### Parameters

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| `id` | path | integer | Yes | The ID of the field configuration. |
| `startAt` | query | integer | No | The index of the first item to return in a page of |
| `maxResults` | query | integer | No | The maximum number of items to return per page. |

### Example

```bash
curl -X GET \
  -H "Authorization: Bearer $TOKEN" \
  "https://your-domain.atlassian.net/rest/api/3/fieldconfiguration/{id}/fields"
```

---

## PUT /rest/api/3/fieldconfiguration/{id}/fields

**Update field configuration items**

Updates fields in a field configuration. The properties of the field configuration fields provided override the existing values.

This operation can only update field configurations used in company-managed (classic) projects.

The operation can set the renderer for text fields to the default text renderer (`text-renderer`) or wiki style renderer (`wiki-renderer`). However, the renderer cannot be updated for fields using the autocomplete renderer (`autocomplete-renderer`).

Hiding a field deletes it from the field configuration - deleting the required, description and renderer type values as well. As a result, hiding and unhiding will not restore the other values but use their default values.

**[Permissions](#permissions) required:** *Administer Jira* [global permission](https://confluence.atlassian.com/x/x4dKLg).

### Parameters

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| `id` | path | integer | Yes | The ID of the field configuration. |

### Example

```bash
curl -X PUT \
  -H "Authorization: Bearer $TOKEN" \
  "https://your-domain.atlassian.net/rest/api/3/fieldconfiguration/{id}/fields"
```

---

## GET /rest/api/3/fieldconfigurationscheme

**Get all field configuration schemes**

Returns a [paginated](#pagination) list of field configuration schemes.

Only field configuration schemes used in classic projects are returned.

**[Permissions](#permissions) required:** *Administer Jira* [global permission](https://confluence.atlassian.com/x/x4dKLg).

### Parameters

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| `startAt` | query | integer | No | The index of the first item to return in a page of |
| `maxResults` | query | integer | No | The maximum number of items to return per page. |
| `id` | query | array | No | The list of field configuration scheme IDs. To inc |

### Example

```bash
curl -X GET \
  -H "Authorization: Bearer $TOKEN" \
  "https://your-domain.atlassian.net/rest/api/3/fieldconfigurationscheme"
```

---

## POST /rest/api/3/fieldconfigurationscheme

**Create field configuration scheme**

Creates a field configuration scheme.

This operation can only create field configuration schemes used in company-managed (classic) projects.

**[Permissions](#permissions) required:** *Administer Jira* [global permission](https://confluence.atlassian.com/x/x4dKLg).

### Example

```bash
curl -X POST \
  -H "Authorization: Bearer $TOKEN" \
  "https://your-domain.atlassian.net/rest/api/3/fieldconfigurationscheme"
```

---

## GET /rest/api/3/fieldconfigurationscheme/mapping

**Get field configuration issue type items**

Returns a [paginated](#pagination) list of field configuration issue type items.

Only items used in classic projects are returned.

**[Permissions](#permissions) required:** *Administer Jira* [global permission](https://confluence.atlassian.com/x/x4dKLg).

### Parameters

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| `startAt` | query | integer | No | The index of the first item to return in a page of |
| `maxResults` | query | integer | No | The maximum number of items to return per page. |
| `fieldConfigurationSchemeId` | query | array | No | The list of field configuration scheme IDs. To inc |

### Example

```bash
curl -X GET \
  -H "Authorization: Bearer $TOKEN" \
  "https://your-domain.atlassian.net/rest/api/3/fieldconfigurationscheme/mapping"
```

---

## GET /rest/api/3/fieldconfigurationscheme/project

**Get field configuration schemes for projects**

Returns a [paginated](#pagination) list of field configuration schemes and, for each scheme, a list of the projects that use it.

The list is sorted by field configuration scheme ID. The first item contains the list of project IDs assigned to the default field configuration scheme.

Only field configuration schemes used in classic projects are returned.

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
  "https://your-domain.atlassian.net/rest/api/3/fieldconfigurationscheme/project"
```

---

## PUT /rest/api/3/fieldconfigurationscheme/project

**Assign field configuration scheme to project**

Assigns a field configuration scheme to a project. If the field configuration scheme ID is `null`, the operation assigns the default field configuration scheme.

Field configuration schemes can only be assigned to classic projects.

**[Permissions](#permissions) required:** *Administer Jira* [global permission](https://confluence.atlassian.com/x/x4dKLg).

### Example

```bash
curl -X PUT \
  -H "Authorization: Bearer $TOKEN" \
  "https://your-domain.atlassian.net/rest/api/3/fieldconfigurationscheme/project"
```

---

## DELETE /rest/api/3/fieldconfigurationscheme/{id}

**Delete field configuration scheme**

Deletes a field configuration scheme.

This operation can only delete field configuration schemes used in company-managed (classic) projects.

**[Permissions](#permissions) required:** *Administer Jira* [global permission](https://confluence.atlassian.com/x/x4dKLg).

### Parameters

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| `id` | path | integer | Yes | The ID of the field configuration scheme. |

### Example

```bash
curl -X DELETE \
  -H "Authorization: Bearer $TOKEN" \
  "https://your-domain.atlassian.net/rest/api/3/fieldconfigurationscheme/{id}"
```

---

## PUT /rest/api/3/fieldconfigurationscheme/{id}

**Update field configuration scheme**

Updates a field configuration scheme.

This operation can only update field configuration schemes used in company-managed (classic) projects.

**[Permissions](#permissions) required:** *Administer Jira* [global permission](https://confluence.atlassian.com/x/x4dKLg).

### Parameters

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| `id` | path | integer | Yes | The ID of the field configuration scheme. |

### Example

```bash
curl -X PUT \
  -H "Authorization: Bearer $TOKEN" \
  "https://your-domain.atlassian.net/rest/api/3/fieldconfigurationscheme/{id}"
```

---

## PUT /rest/api/3/fieldconfigurationscheme/{id}/mapping

**Assign issue types to field configurations**

Assigns issue types to field configurations on field configuration scheme.

This operation can only modify field configuration schemes used in company-managed (classic) projects.

**[Permissions](#permissions) required:** *Administer Jira* [global permission](https://confluence.atlassian.com/x/x4dKLg).

### Parameters

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| `id` | path | integer | Yes | The ID of the field configuration scheme. |

### Example

```bash
curl -X PUT \
  -H "Authorization: Bearer $TOKEN" \
  "https://your-domain.atlassian.net/rest/api/3/fieldconfigurationscheme/{id}/mapping"
```

---

## POST /rest/api/3/fieldconfigurationscheme/{id}/mapping/delete

**Remove issue types from field configuration scheme**

Removes issue types from the field configuration scheme.

This operation can only modify field configuration schemes used in company-managed (classic) projects.

**[Permissions](#permissions) required:** *Administer Jira* [global permission](https://confluence.atlassian.com/x/x4dKLg).

### Parameters

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| `id` | path | integer | Yes | The ID of the field configuration scheme. |

### Example

```bash
curl -X POST \
  -H "Authorization: Bearer $TOKEN" \
  "https://your-domain.atlassian.net/rest/api/3/fieldconfigurationscheme/{id}/mapping/delete"
```

---
