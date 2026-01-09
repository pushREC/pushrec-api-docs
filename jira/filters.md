---
created: 2026-01-09
tags: [type/api-reference, api/filters]
api_name: The Jira Cloud platform REST API
category: Filters
endpoint_count: 13
---

# The Jira Cloud platform REST API - Filters

[[README|Back to Overview]]

---

## POST /rest/api/3/filter

**Create filter**

Creates a filter. The filter is shared according to the [default share scope](#api-rest-api-3-filter-post). The filter is not selected as a favorite.

**[Permissions](#permissions) required:** Permission to access Jira.

### Parameters

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| `expand` | query | string | No | Use [expand](#expansion) to include additional inf |
| `overrideSharePermissions` | query | boolean | No | EXPERIMENTAL: Whether share permissions are overri |

### Example

```bash
curl -X POST \
  -H "Authorization: Bearer $TOKEN" \
  "https://your-domain.atlassian.net/rest/api/3/filter"
```

---

## GET /rest/api/3/filter/favourite

**Get favorite filters**

Returns the visible favorite filters of the user.

This operation can be accessed anonymously.

**[Permissions](#permissions) required:** A favorite filter is only visible to the user where the filter is:

 *  owned by the user.
 *  shared with a group that the user is a member of.
 *  shared with a private project that the user has *Browse projects* [project permission](https://confluence.atlassian.com/x/yodKLg) for.
 *  shared with a public project.
 *  shared with the public.

For example, if the user favorites a public filter that is subsequently made private that filter is not returned by this operation.

### Parameters

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| `expand` | query | string | No | Use [expand](#expansion) to include additional inf |

### Example

```bash
curl -X GET \
  -H "Authorization: Bearer $TOKEN" \
  "https://your-domain.atlassian.net/rest/api/3/filter/favourite"
```

---

## GET /rest/api/3/filter/my

**Get my filters**

Returns the filters owned by the user. If `includeFavourites` is `true`, the user's visible favorite filters are also returned.

**[Permissions](#permissions) required:** Permission to access Jira, however, a favorite filters is only visible to the user where the filter is:

 *  owned by the user.
 *  shared with a group that the user is a member of.
 *  shared with a private project that the user has *Browse projects* [project permission](https://confluence.atlassian.com/x/yodKLg) for.
 *  shared with a public project.
 *  shared with the public.

For example, if the user favorites a public filter that is subsequently made private that filter is not returned by this operation.

### Parameters

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| `expand` | query | string | No | Use [expand](#expansion) to include additional inf |
| `includeFavourites` | query | boolean | No | Include the user's favorite filters in the respons |

### Example

```bash
curl -X GET \
  -H "Authorization: Bearer $TOKEN" \
  "https://your-domain.atlassian.net/rest/api/3/filter/my"
```

---

## GET /rest/api/3/filter/search

**Search for filters**

Returns a [paginated](#pagination) list of filters. Use this operation to get:

 *  specific filters, by defining `id` only.
 *  filters that match all of the specified attributes. For example, all filters for a user with a particular word in their name. When multiple attributes are specified only filters matching all attributes are returned.

This operation can be accessed anonymously.

**[Permissions](#permissions) required:** None, however, only the following filters that match the query parameters are returned:

 *  filters owned by the user.
 *  filters shared with a group that the user is a member of.
 *  filters shared with a private project that the user has *Browse projects* [project permission](https://confluence.atlassian.com/x/yodKLg) for.
 *  filters shared with a public project.
 *  filters shared with the public.

### Parameters

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| `filterName` | query | string | No | String used to perform a case-insensitive partial  |
| `accountId` | query | string | No | User account ID used to return filters with the ma |
| `owner` | query | string | No | This parameter is deprecated because of privacy ch |
| `groupname` | query | string | No | As a group's name can change, use of `groupId` is  |
| `groupId` | query | string | No | Group ID used to returns filters that are shared w |
| `projectId` | query | integer | No | Project ID used to returns filters that are shared |
| `id` | query | array | No | The list of filter IDs. To include multiple IDs, p |
| `orderBy` | query | string | No | [Order](#ordering) the results by a field:

 *  `d |
| `startAt` | query | integer | No | The index of the first item to return in a page of |
| `maxResults` | query | integer | No | The maximum number of items to return per page. |
| `expand` | query | string | No | Use [expand](#expansion) to include additional inf |
| `overrideSharePermissions` | query | boolean | No | EXPERIMENTAL: Whether share permissions are overri |
| `isSubstringMatch` | query | boolean | No | When `true` this will perform a case-insensitive s |

### Example

```bash
curl -X GET \
  -H "Authorization: Bearer $TOKEN" \
  "https://your-domain.atlassian.net/rest/api/3/filter/search"
```

---

## DELETE /rest/api/3/filter/{id}

**Delete filter**

Delete a filter.

**[Permissions](#permissions) required:** Permission to access Jira, however filters can only be deleted by the creator of the filter or a user with *Administer Jira* [global permission](https://confluence.atlassian.com/x/x4dKLg).

### Parameters

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| `id` | path | integer | Yes | The ID of the filter to delete. |

### Example

```bash
curl -X DELETE \
  -H "Authorization: Bearer $TOKEN" \
  "https://your-domain.atlassian.net/rest/api/3/filter/{id}"
```

---

## GET /rest/api/3/filter/{id}

**Get filter**

Returns a filter.

This operation can be accessed anonymously.

**[Permissions](#permissions) required:** None, however, the filter is only returned where it is:

 *  owned by the user.
 *  shared with a group that the user is a member of.
 *  shared with a private project that the user has *Browse projects* [project permission](https://confluence.atlassian.com/x/yodKLg) for.
 *  shared with a public project.
 *  shared with the public.

### Parameters

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| `id` | path | integer | Yes | The ID of the filter to return. |
| `expand` | query | string | No | Use [expand](#expansion) to include additional inf |
| `overrideSharePermissions` | query | boolean | No | EXPERIMENTAL: Whether share permissions are overri |

### Example

```bash
curl -X GET \
  -H "Authorization: Bearer $TOKEN" \
  "https://your-domain.atlassian.net/rest/api/3/filter/{id}"
```

---

## PUT /rest/api/3/filter/{id}

**Update filter**

Updates a filter. Use this operation to update a filter's name, description, JQL, or sharing.

**[Permissions](#permissions) required:** Permission to access Jira, however the user must own the filter.

### Parameters

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| `id` | path | integer | Yes | The ID of the filter to update. |
| `expand` | query | string | No | Use [expand](#expansion) to include additional inf |
| `overrideSharePermissions` | query | boolean | No | EXPERIMENTAL: Whether share permissions are overri |

### Example

```bash
curl -X PUT \
  -H "Authorization: Bearer $TOKEN" \
  "https://your-domain.atlassian.net/rest/api/3/filter/{id}"
```

---

## DELETE /rest/api/3/filter/{id}/columns

**Reset columns**

Reset the user's column configuration for the filter to the default.

**[Permissions](#permissions) required:** Permission to access Jira, however, columns are only reset for:

 *  filters owned by the user.
 *  filters shared with a group that the user is a member of.
 *  filters shared with a private project that the user has *Browse projects* [project permission](https://confluence.atlassian.com/x/yodKLg) for.
 *  filters shared with a public project.
 *  filters shared with the public.

### Parameters

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| `id` | path | integer | Yes | The ID of the filter. |

### Example

```bash
curl -X DELETE \
  -H "Authorization: Bearer $TOKEN" \
  "https://your-domain.atlassian.net/rest/api/3/filter/{id}/columns"
```

---

## GET /rest/api/3/filter/{id}/columns

**Get columns**

Returns the columns configured for a filter. The column configuration is used when the filter's results are viewed in *List View* with the *Columns* set to *Filter*.

This operation can be accessed anonymously.

**[Permissions](#permissions) required:** None, however, column details are only returned for:

 *  filters owned by the user.
 *  filters shared with a group that the user is a member of.
 *  filters shared with a private project that the user has *Browse projects* [project permission](https://confluence.atlassian.com/x/yodKLg) for.
 *  filters shared with a public project.
 *  filters shared with the public.

### Parameters

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| `id` | path | integer | Yes | The ID of the filter. |

### Example

```bash
curl -X GET \
  -H "Authorization: Bearer $TOKEN" \
  "https://your-domain.atlassian.net/rest/api/3/filter/{id}/columns"
```

---

## PUT /rest/api/3/filter/{id}/columns

**Set columns**

Sets the columns for a filter. Only navigable fields can be set as columns. Use [Get fields](#api-rest-api-3-field-get) to get the list fields in Jira. A navigable field has `navigable` set to `true`.

The parameters for this resource are expressed as HTML form data. For example, in curl:

`curl -X PUT -d columns=summary -d columns=description https://your-domain.atlassian.net/rest/api/3/filter/10000/columns`

**[Permissions](#permissions) required:** Permission to access Jira, however, columns are only set for:

 *  filters owned by the user.
 *  filters shared with a group that the user is a member of.
 *  filters shared with a private project that the user has *Browse projects* [project permission](https://confluence.atlassian.com/x/yodKLg) for.
 *  filters shared with a public project.
 *  filters shared with the public.

### Parameters

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| `id` | path | integer | Yes | The ID of the filter. |

### Example

```bash
curl -X PUT \
  -H "Authorization: Bearer $TOKEN" \
  "https://your-domain.atlassian.net/rest/api/3/filter/{id}/columns"
```

---

## DELETE /rest/api/3/filter/{id}/favourite

**Remove filter as favorite**

Removes a filter as a favorite for the user. Note that this operation only removes filters visible to the user from the user's favorites list. For example, if the user favorites a public filter that is subsequently made private (and is therefore no longer visible on their favorites list) they cannot remove it from their favorites list.

**[Permissions](#permissions) required:** Permission to access Jira.

### Parameters

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| `id` | path | integer | Yes | The ID of the filter. |
| `expand` | query | string | No | Use [expand](#expansion) to include additional inf |

### Example

```bash
curl -X DELETE \
  -H "Authorization: Bearer $TOKEN" \
  "https://your-domain.atlassian.net/rest/api/3/filter/{id}/favourite"
```

---

## PUT /rest/api/3/filter/{id}/favourite

**Add filter as favorite**

Add a filter as a favorite for the user.

**[Permissions](#permissions) required:** Permission to access Jira, however, the user can only favorite:

 *  filters owned by the user.
 *  filters shared with a group that the user is a member of.
 *  filters shared with a private project that the user has *Browse projects* [project permission](https://confluence.atlassian.com/x/yodKLg) for.
 *  filters shared with a public project.
 *  filters shared with the public.

### Parameters

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| `id` | path | integer | Yes | The ID of the filter. |
| `expand` | query | string | No | Use [expand](#expansion) to include additional inf |

### Example

```bash
curl -X PUT \
  -H "Authorization: Bearer $TOKEN" \
  "https://your-domain.atlassian.net/rest/api/3/filter/{id}/favourite"
```

---

## PUT /rest/api/3/filter/{id}/owner

**Change filter owner**

Changes the owner of the filter.

**[Permissions](#permissions) required:** Permission to access Jira. However, the user must own the filter or have the *Administer Jira* [global permission](https://confluence.atlassian.com/x/x4dKLg).

### Parameters

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| `id` | path | integer | Yes | The ID of the filter to update. |

### Example

```bash
curl -X PUT \
  -H "Authorization: Bearer $TOKEN" \
  "https://your-domain.atlassian.net/rest/api/3/filter/{id}/owner"
```

---
