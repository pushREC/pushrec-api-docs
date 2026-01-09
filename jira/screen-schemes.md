---
created: 2026-01-09
tags: [type/api-reference, api/screen-schemes]
api_name: The Jira Cloud platform REST API
category: Screen schemes
endpoint_count: 4
---

# The Jira Cloud platform REST API - Screen Schemes

[[README|Back to Overview]]

---

## GET /rest/api/3/screenscheme

**Get screen schemes**

Returns a [paginated](#pagination) list of screen schemes.

Only screen schemes used in classic projects are returned.

**[Permissions](#permissions) required:** *Administer Jira* [global permission](https://confluence.atlassian.com/x/x4dKLg).

### Parameters

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| `startAt` | query | integer | No | The index of the first item to return in a page of |
| `maxResults` | query | integer | No | The maximum number of items to return per page. |
| `id` | query | array | No | The list of screen scheme IDs. To include multiple |
| `expand` | query | string | No | Use [expand](#expansion) include additional inform |
| `queryString` | query | string | No | String used to perform a case-insensitive partial  |
| `orderBy` | query | string | No | [Order](#ordering) the results by a field:

 *  `i |

### Example

```bash
curl -X GET \
  -H "Authorization: Bearer $TOKEN" \
  "https://your-domain.atlassian.net/rest/api/3/screenscheme"
```

---

## POST /rest/api/3/screenscheme

**Create screen scheme**

Creates a screen scheme.

**[Permissions](#permissions) required:** *Administer Jira* [global permission](https://confluence.atlassian.com/x/x4dKLg).

### Example

```bash
curl -X POST \
  -H "Authorization: Bearer $TOKEN" \
  "https://your-domain.atlassian.net/rest/api/3/screenscheme"
```

---

## DELETE /rest/api/3/screenscheme/{screenSchemeId}

**Delete screen scheme**

Deletes a screen scheme. A screen scheme cannot be deleted if it is used in an issue type screen scheme.

Only screens schemes used in classic projects can be deleted.

**[Permissions](#permissions) required:** *Administer Jira* [global permission](https://confluence.atlassian.com/x/x4dKLg).

### Parameters

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| `screenSchemeId` | path | string | Yes | The ID of the screen scheme. |

### Example

```bash
curl -X DELETE \
  -H "Authorization: Bearer $TOKEN" \
  "https://your-domain.atlassian.net/rest/api/3/screenscheme/{screenSchemeId}"
```

---

## PUT /rest/api/3/screenscheme/{screenSchemeId}

**Update screen scheme**

Updates a screen scheme. Only screen schemes used in classic projects can be updated.

**[Permissions](#permissions) required:** *Administer Jira* [global permission](https://confluence.atlassian.com/x/x4dKLg).

### Parameters

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| `screenSchemeId` | path | string | Yes | The ID of the screen scheme. |

### Example

```bash
curl -X PUT \
  -H "Authorization: Bearer $TOKEN" \
  "https://your-domain.atlassian.net/rest/api/3/screenscheme/{screenSchemeId}"
```

---
