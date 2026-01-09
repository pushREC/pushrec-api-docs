---
created: 2026-01-09
tags: [type/api-reference, api/screens]
api_name: The Jira Cloud platform REST API
category: Screens
endpoint_count: 7
---

# The Jira Cloud platform REST API - Screens

[[README|Back to Overview]]

---

## GET /rest/api/3/field/{fieldId}/screens

**Get screens for a field**

Returns a [paginated](#pagination) list of the screens a field is used in.

**[Permissions](#permissions) required:** *Administer Jira* [global permission](https://confluence.atlassian.com/x/x4dKLg).

### Parameters

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| `fieldId` | path | string | Yes | The ID of the field to return screens for. |
| `startAt` | query | integer | No | The index of the first item to return in a page of |
| `maxResults` | query | integer | No | The maximum number of items to return per page. |
| `expand` | query | string | No | Use [expand](#expansion) to include additional inf |

### Example

```bash
curl -X GET \
  -H "Authorization: Bearer $TOKEN" \
  "https://your-domain.atlassian.net/rest/api/3/field/{fieldId}/screens"
```

---

## GET /rest/api/3/screens

**Get screens**

Returns a [paginated](#pagination) list of all screens or those specified by one or more screen IDs.

**[Permissions](#permissions) required:** *Administer Jira* [global permission](https://confluence.atlassian.com/x/x4dKLg).

### Parameters

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| `startAt` | query | integer | No | The index of the first item to return in a page of |
| `maxResults` | query | integer | No | The maximum number of items to return per page. |
| `id` | query | array | No | The list of screen IDs. To include multiple IDs, p |
| `queryString` | query | string | No | String used to perform a case-insensitive partial  |
| `scope` | query | array | No | The scope filter string. To filter by multiple sco |
| `orderBy` | query | string | No | [Order](#ordering) the results by a field:

 *  `i |

### Example

```bash
curl -X GET \
  -H "Authorization: Bearer $TOKEN" \
  "https://your-domain.atlassian.net/rest/api/3/screens"
```

---

## POST /rest/api/3/screens

**Create screen**

Creates a screen with a default field tab.

**[Permissions](#permissions) required:** *Administer Jira* [global permission](https://confluence.atlassian.com/x/x4dKLg).

### Example

```bash
curl -X POST \
  -H "Authorization: Bearer $TOKEN" \
  "https://your-domain.atlassian.net/rest/api/3/screens"
```

---

## POST /rest/api/3/screens/addToDefault/{fieldId}

**Add field to default screen**

Adds a field to the default tab of the default screen.

**[Permissions](#permissions) required:** *Administer Jira* [global permission](https://confluence.atlassian.com/x/x4dKLg).

### Parameters

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| `fieldId` | path | string | Yes | The ID of the field. |

### Example

```bash
curl -X POST \
  -H "Authorization: Bearer $TOKEN" \
  "https://your-domain.atlassian.net/rest/api/3/screens/addToDefault/{fieldId}"
```

---

## DELETE /rest/api/3/screens/{screenId}

**Delete screen**

Deletes a screen. A screen cannot be deleted if it is used in a screen scheme, workflow, or workflow draft.

Only screens used in classic projects can be deleted.

### Parameters

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| `screenId` | path | integer | Yes | The ID of the screen. |

### Example

```bash
curl -X DELETE \
  -H "Authorization: Bearer $TOKEN" \
  "https://your-domain.atlassian.net/rest/api/3/screens/{screenId}"
```

---

## PUT /rest/api/3/screens/{screenId}

**Update screen**

Updates a screen. Only screens used in classic projects can be updated.

**[Permissions](#permissions) required:** *Administer Jira* [global permission](https://confluence.atlassian.com/x/x4dKLg).

### Parameters

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| `screenId` | path | integer | Yes | The ID of the screen. |

### Example

```bash
curl -X PUT \
  -H "Authorization: Bearer $TOKEN" \
  "https://your-domain.atlassian.net/rest/api/3/screens/{screenId}"
```

---

## GET /rest/api/3/screens/{screenId}/availableFields

**Get available screen fields**

Returns the fields that can be added to a tab on a screen.

**[Permissions](#permissions) required:** *Administer Jira* [global permission](https://confluence.atlassian.com/x/x4dKLg).

### Parameters

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| `screenId` | path | integer | Yes | The ID of the screen. |

### Example

```bash
curl -X GET \
  -H "Authorization: Bearer $TOKEN" \
  "https://your-domain.atlassian.net/rest/api/3/screens/{screenId}/availableFields"
```

---
