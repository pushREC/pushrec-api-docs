---
created: 2026-01-08
tags: [type/api-reference, api/groups]
api_name: OpenAI API
category: Groups
endpoint_count: 4
---

# OpenAI API - Groups

[[README|Back to Overview]]

---

## GET /organization/groups

**List groups**

Lists all groups in the organization.

### Parameters

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| `limit` | query | integer | No | A limit on the number of groups to be returned. Li |
| `after` | query | string | No | A cursor for use in pagination. `after` is a group |
| `order` | query | string | No | Specifies the sort order of the returned groups. |

### Example

```bash
curl -X GET \
  -H "Authorization: Bearer $TOKEN" \
  "https://api.openai.com/v1/organization/groups"
```

---

## POST /organization/groups

**Create group**

Creates a new group in the organization.

### Example

```bash
curl -X POST \
  -H "Authorization: Bearer $TOKEN" \
  "https://api.openai.com/v1/organization/groups"
```

---

## POST /organization/groups/{group_id}

**Update group**

Updates a group's information.

### Parameters

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| `group_id` | path | string | Yes | The ID of the group to update. |

### Example

```bash
curl -X POST \
  -H "Authorization: Bearer $TOKEN" \
  "https://api.openai.com/v1/organization/groups/{group_id}"
```

---

## DELETE /organization/groups/{group_id}

**Delete group**

Deletes a group from the organization.

### Parameters

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| `group_id` | path | string | Yes | The ID of the group to delete. |

### Example

```bash
curl -X DELETE \
  -H "Authorization: Bearer $TOKEN" \
  "https://api.openai.com/v1/organization/groups/{group_id}"
```

---
