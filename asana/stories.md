---
created: 2026-01-09
tags: [type/api-reference, api/stories]
api_name: Asana
category: Stories
endpoint_count: 5
---

# Asana - Stories

[[README|Back to Overview]]

---

## GET /stories/{story_gid}

**Get a story**

<b>Required scope: </b><code>stories:read</code>

<table>
  <tr>
    <th>Field</th>
    <th>Required Scope</th>
  </tr>
  <tr>
    <td><code>previews</code></td>
    <td><code>attachments:read</code></td>
  </tr>
  <tr>
    <td><code>attachments</code></td>
    <td><code>attachments:read</code></td>
  </tr>
</table>

Returns the full record for a single story.

### Parameters

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| `opt_fields` | query | array | No | This endpoint returns a resource which excludes so |

### Example

```bash
curl -X GET \
  -H "Authorization: Bearer $TOKEN" \
  "https://app.asana.com/api/1.0/stories/{story_gid}"
```

---

## PUT /stories/{story_gid}

**Update a story**

<b>Required scope: </b><code>stories:write</code>

Updates the story and returns the full record for the updated story. Only comment stories can have their text updated, and only comment stories and attachment stories can be pinned. Only one of `text` and `html_text` can be specified.

### Parameters

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| `opt_fields` | query | array | No | This endpoint returns a resource which excludes so |

### Example

```bash
curl -X PUT \
  -H "Authorization: Bearer $TOKEN" \
  "https://app.asana.com/api/1.0/stories/{story_gid}"
```

---

## DELETE /stories/{story_gid}

**Delete a story**

Deletes a story. A user can only delete stories they have created.

Returns an empty data record.

### Example

```bash
curl -X DELETE \
  -H "Authorization: Bearer $TOKEN" \
  "https://app.asana.com/api/1.0/stories/{story_gid}"
```

---

## GET /tasks/{task_gid}/stories

**Get stories from a task**

<b>Required scope: </b><code>stories:read</code>

Returns the compact records for all stories on the task.

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
  "https://app.asana.com/api/1.0/tasks/{task_gid}/stories"
```

---

## POST /tasks/{task_gid}/stories

**Create a story on a task**

<b>Required scope: </b><code>stories:write</code>

Adds a story to a task. This endpoint currently only allows for comment
stories to be created. The comment will be authored by the currently
authenticated user, and timestamped when the server receives the request.

Returns the full record for the new story added to the task.

### Parameters

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| `opt_fields` | query | array | No | This endpoint returns a resource which excludes so |

### Example

```bash
curl -X POST \
  -H "Authorization: Bearer $TOKEN" \
  "https://app.asana.com/api/1.0/tasks/{task_gid}/stories"
```

---
