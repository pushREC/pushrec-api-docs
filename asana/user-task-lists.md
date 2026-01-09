---
created: 2026-01-09
tags: [type/api-reference, api/user-task-lists]
api_name: Asana
category: User task lists
endpoint_count: 2
---

# Asana - User Task Lists

[[README|Back to Overview]]

---

## GET /user_task_lists/{user_task_list_gid}

**Get a user task list**

<b>Required scope: </b><code>tasks:read</code>

Returns the full record for a user task list.

### Parameters

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| `opt_fields` | query | array | No | This endpoint returns a resource which excludes so |

### Example

```bash
curl -X GET \
  -H "Authorization: Bearer $TOKEN" \
  "https://app.asana.com/api/1.0/user_task_lists/{user_task_list_gid}"
```

---

## GET /users/{user_gid}/user_task_list

**Get a user's task list**

<b>Required scope: </b><code>tasks:read</code>

Returns the full record for a user's task list.

### Parameters

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| `opt_fields` | query | array | No | This endpoint returns a resource which excludes so |

### Example

```bash
curl -X GET \
  -H "Authorization: Bearer $TOKEN" \
  "https://app.asana.com/api/1.0/users/{user_gid}/user_task_list"
```

---
