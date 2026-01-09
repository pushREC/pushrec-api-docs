---
created: 2026-01-09
tags: [type/api-reference, api/tags]
api_name: Asana
category: Tags
endpoint_count: 8
---

# Asana - Tags

[[README|Back to Overview]]

---

## GET /tags

**Get multiple tags**

<b>Required scope: </b><code>tags:read</code>

Returns the compact tag records for some filtered set of tags. Use one or more of the parameters provided to filter the tags returned.

### Parameters

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| `` | query | string | No |  |
| `` | query | string | No |  |
| `workspace` | query | string | No | The workspace to filter tags on. |
| `opt_fields` | query | array | No | This endpoint returns a resource which excludes so |

### Example

```bash
curl -X GET \
  -H "Authorization: Bearer $TOKEN" \
  "https://app.asana.com/api/1.0/tags"
```

---

## POST /tags

**Create a tag**

<b>Required scope: </b><code>tags:write</code>

Creates a new tag in a workspace or organization.

Every tag is required to be created in a specific workspace or
organization, and this cannot be changed once set. Note that you can use
the workspace parameter regardless of whether or not it is an
organization.

Returns the full record of the newly created tag.

### Parameters

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| `opt_fields` | query | array | No | This endpoint returns a resource which excludes so |

### Example

```bash
curl -X POST \
  -H "Authorization: Bearer $TOKEN" \
  "https://app.asana.com/api/1.0/tags"
```

---

## GET /tags/{tag_gid}

**Get a tag**

<b>Required scope: </b><code>tags:read</code>

Returns the complete tag record for a single tag.

### Parameters

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| `opt_fields` | query | array | No | This endpoint returns a resource which excludes so |

### Example

```bash
curl -X GET \
  -H "Authorization: Bearer $TOKEN" \
  "https://app.asana.com/api/1.0/tags/{tag_gid}"
```

---

## PUT /tags/{tag_gid}

**Update a tag**

<b>Required scope: </b><code>tags:write</code>

Updates the properties of a tag. Only the fields provided in the `data`
block will be updated; any unspecified fields will remain unchanged.

When using this method, it is best to specify only those fields you wish
to change, or else you may overwrite changes made by another user since
you last retrieved the tag.

Returns the complete updated tag record.

### Parameters

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| `opt_fields` | query | array | No | This endpoint returns a resource which excludes so |

### Example

```bash
curl -X PUT \
  -H "Authorization: Bearer $TOKEN" \
  "https://app.asana.com/api/1.0/tags/{tag_gid}"
```

---

## DELETE /tags/{tag_gid}

**Delete a tag**

A specific, existing tag can be deleted by making a DELETE request on
the URL for that tag.

Returns an empty data record.

### Example

```bash
curl -X DELETE \
  -H "Authorization: Bearer $TOKEN" \
  "https://app.asana.com/api/1.0/tags/{tag_gid}"
```

---

## GET /tasks/{task_gid}/tags

**Get a task's tags**

<b>Required scope: </b><code>tags:read</code>

Get a compact representation of all of the tags the task has.

### Parameters

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| `opt_fields` | query | array | No | This endpoint returns a resource which excludes so |

### Example

```bash
curl -X GET \
  -H "Authorization: Bearer $TOKEN" \
  "https://app.asana.com/api/1.0/tasks/{task_gid}/tags"
```

---

## GET /workspaces/{workspace_gid}/tags

**Get tags in a workspace**

<b>Required scope: </b><code>tags:read</code>

Returns the compact tag records for some filtered set of tags. Use one or more of the parameters provided to filter the tags returned.

### Parameters

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| `` | query | string | No |  |
| `` | query | string | No |  |
| `opt_fields` | query | array | No | This endpoint returns a resource which excludes so |

### Example

```bash
curl -X GET \
  -H "Authorization: Bearer $TOKEN" \
  "https://app.asana.com/api/1.0/workspaces/{workspace_gid}/tags"
```

---

## POST /workspaces/{workspace_gid}/tags

**Create a tag in a workspace**

<b>Required scope: </b><code>tags:write</code>

Creates a new tag in a workspace or organization.

Every tag is required to be created in a specific workspace or
organization, and this cannot be changed once set. Note that you can use
the workspace parameter regardless of whether or not it is an
organization.

Returns the full record of the newly created tag.

### Parameters

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| `opt_fields` | query | array | No | This endpoint returns a resource which excludes so |

### Example

```bash
curl -X POST \
  -H "Authorization: Bearer $TOKEN" \
  "https://app.asana.com/api/1.0/workspaces/{workspace_gid}/tags"
```

---
