---
created: 2026-01-08
tags: [type/api-reference, api/group-users]
api_name: OpenAI API
category: Group users
endpoint_count: 3
---

# OpenAI API - Group Users

[[README|Back to Overview]]

---

## GET /organization/groups/{group_id}/users

**List group users**

Lists the users assigned to a group.

### Parameters

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| `group_id` | path | string | Yes | The ID of the group to inspect. |
| `limit` | query | integer | No | A limit on the number of users to be returned. Lim |
| `after` | query | string | No | A cursor for use in pagination. Provide the ID of  |
| `order` | query | string | No | Specifies the sort order of users in the list. |

### Example

```bash
curl -X GET \
  -H "Authorization: Bearer $TOKEN" \
  "https://api.openai.com/v1/organization/groups/{group_id}/users"
```

---

## POST /organization/groups/{group_id}/users

**Add group user**

Adds a user to a group.

### Parameters

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| `group_id` | path | string | Yes | The ID of the group to update. |

### Example

```bash
curl -X POST \
  -H "Authorization: Bearer $TOKEN" \
  "https://api.openai.com/v1/organization/groups/{group_id}/users"
```

---

## DELETE /organization/groups/{group_id}/users/{user_id}

**Remove group user**

Removes a user from a group.

### Parameters

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| `group_id` | path | string | Yes | The ID of the group to update. |
| `user_id` | path | string | Yes | The ID of the user to remove from the group. |

### Example

```bash
curl -X DELETE \
  -H "Authorization: Bearer $TOKEN" \
  "https://api.openai.com/v1/organization/groups/{group_id}/users/{user_id}"
```

---
