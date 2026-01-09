---
created: 2026-01-09
tags: [type/api-reference, api/usergroups.users]
api_name: Slack Web API
category: usergroups.users
endpoint_count: 2
---

# Slack Web API - Usergroups.Users

[[README|Back to Overview]]

---

## GET /usergroups.users.list

List all users in a User Group

### Parameters

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| `token` | query | string | Yes | Authentication token. Requires scope: `usergroups: |
| `include_disabled` | query | string | No | Allow results that involve disabled User Groups. |
| `usergroup` | query | string | Yes | The encoded ID of the User Group to update. |

### Example

```bash
curl -X GET \
  -H "Authorization: Bearer $TOKEN" \
  "/usergroups.users.list"
```

---

## POST /usergroups.users.update

Update the list of users for a User Group

### Parameters

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| `token` | header | string | Yes | Authentication token. Requires scope: `usergroups: |
| `include_count` | formData | string | No | Include the number of users in the User Group. |
| `usergroup` | formData | string | Yes | The encoded ID of the User Group to update. |
| `users` | formData | string | Yes | A comma separated string of encoded user IDs that  |

### Example

```bash
curl -X POST \
  -H "Authorization: Bearer $TOKEN" \
  "/usergroups.users.update"
```

---
