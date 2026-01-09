---
created: 2026-01-09
tags: [type/api-reference, api/filter-sharing]
api_name: The Jira Cloud platform REST API
category: Filter sharing
endpoint_count: 6
---

# The Jira Cloud platform REST API - Filter Sharing

[[README|Back to Overview]]

---

## GET /rest/api/3/filter/defaultShareScope

**Get default share scope**

Returns the default sharing settings for new filters and dashboards for a user.

**[Permissions](#permissions) required:** Permission to access Jira.

### Example

```bash
curl -X GET \
  -H "Authorization: Bearer $TOKEN" \
  "https://your-domain.atlassian.net/rest/api/3/filter/defaultShareScope"
```

---

## PUT /rest/api/3/filter/defaultShareScope

**Set default share scope**

Sets the default sharing for new filters and dashboards for a user.

**[Permissions](#permissions) required:** Permission to access Jira.

### Example

```bash
curl -X PUT \
  -H "Authorization: Bearer $TOKEN" \
  "https://your-domain.atlassian.net/rest/api/3/filter/defaultShareScope"
```

---

## GET /rest/api/3/filter/{id}/permission

**Get share permissions**

Returns the share permissions for a filter. A filter can be shared with groups, projects, all logged-in users, or the public. Sharing with all logged-in users or the public is known as a global share permission.

This operation can be accessed anonymously.

**[Permissions](#permissions) required:** None, however, share permissions are only returned for:

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
  "https://your-domain.atlassian.net/rest/api/3/filter/{id}/permission"
```

---

## POST /rest/api/3/filter/{id}/permission

**Add share permission**

Add a share permissions to a filter. If you add a global share permission (one for all logged-in users or the public) it will overwrite all share permissions for the filter.

Be aware that this operation uses different objects for updating share permissions compared to [Update filter](#api-rest-api-3-filter-id-put).

**[Permissions](#permissions) required:** *Share dashboards and filters* [global permission](https://confluence.atlassian.com/x/x4dKLg) and the user must own the filter.

### Parameters

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| `id` | path | integer | Yes | The ID of the filter. |

### Example

```bash
curl -X POST \
  -H "Authorization: Bearer $TOKEN" \
  "https://your-domain.atlassian.net/rest/api/3/filter/{id}/permission"
```

---

## DELETE /rest/api/3/filter/{id}/permission/{permissionId}

**Delete share permission**

Deletes a share permission from a filter.

**[Permissions](#permissions) required:** Permission to access Jira and the user must own the filter.

### Parameters

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| `id` | path | integer | Yes | The ID of the filter. |
| `permissionId` | path | integer | Yes | The ID of the share permission. |

### Example

```bash
curl -X DELETE \
  -H "Authorization: Bearer $TOKEN" \
  "https://your-domain.atlassian.net/rest/api/3/filter/{id}/permission/{permissionId}"
```

---

## GET /rest/api/3/filter/{id}/permission/{permissionId}

**Get share permission**

Returns a share permission for a filter. A filter can be shared with groups, projects, all logged-in users, or the public. Sharing with all logged-in users or the public is known as a global share permission.

This operation can be accessed anonymously.

**[Permissions](#permissions) required:** None, however, a share permission is only returned for:

 *  filters owned by the user.
 *  filters shared with a group that the user is a member of.
 *  filters shared with a private project that the user has *Browse projects* [project permission](https://confluence.atlassian.com/x/yodKLg) for.
 *  filters shared with a public project.
 *  filters shared with the public.

### Parameters

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| `id` | path | integer | Yes | The ID of the filter. |
| `permissionId` | path | integer | Yes | The ID of the share permission. |

### Example

```bash
curl -X GET \
  -H "Authorization: Bearer $TOKEN" \
  "https://your-domain.atlassian.net/rest/api/3/filter/{id}/permission/{permissionId}"
```

---
