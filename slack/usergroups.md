---
created: 2026-01-09
tags: [type/api-reference, api/usergroups]
api_name: Slack Web API
category: usergroups
endpoint_count: 5
---

# Slack Web API - Usergroups

[[README|Back to Overview]]

---

## POST /usergroups.create

Create a User Group

### Parameters

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| `token` | header | string | Yes | Authentication token. Requires scope: `usergroups: |
| `channels` | formData | string | No | A comma separated string of encoded channel IDs fo |
| `description` | formData | string | No | A short description of the User Group. |
| `handle` | formData | string | No | A mention handle. Must be unique among channels, u |
| `include_count` | formData | string | No | Include the number of users in each User Group. |
| `name` | formData | string | Yes | A name for the User Group. Must be unique among Us |

### Example

```bash
curl -X POST \
  -H "Authorization: Bearer $TOKEN" \
  "/usergroups.create"
```

---

## POST /usergroups.disable

Disable an existing User Group

### Parameters

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| `token` | header | string | Yes | Authentication token. Requires scope: `usergroups: |
| `include_count` | formData | string | No | Include the number of users in the User Group. |
| `usergroup` | formData | string | Yes | The encoded ID of the User Group to disable. |

### Example

```bash
curl -X POST \
  -H "Authorization: Bearer $TOKEN" \
  "/usergroups.disable"
```

---

## POST /usergroups.enable

Enable a User Group

### Parameters

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| `token` | header | string | Yes | Authentication token. Requires scope: `usergroups: |
| `include_count` | formData | string | No | Include the number of users in the User Group. |
| `usergroup` | formData | string | Yes | The encoded ID of the User Group to enable. |

### Example

```bash
curl -X POST \
  -H "Authorization: Bearer $TOKEN" \
  "/usergroups.enable"
```

---

## GET /usergroups.list

List all User Groups for a team

### Parameters

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| `include_users` | query | string | No | Include the list of users for each User Group. |
| `token` | query | string | Yes | Authentication token. Requires scope: `usergroups: |
| `include_count` | query | string | No | Include the number of users in each User Group. |
| `include_disabled` | query | string | No | Include disabled User Groups. |

### Example

```bash
curl -X GET \
  -H "Authorization: Bearer $TOKEN" \
  "/usergroups.list"
```

---

## POST /usergroups.update

Update an existing User Group

### Parameters

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| `handle` | formData | string | No | A mention handle. Must be unique among channels, u |
| `description` | formData | string | No | A short description of the User Group. |
| `channels` | formData | string | No | A comma separated string of encoded channel IDs fo |
| `token` | header | string | Yes | Authentication token. Requires scope: `usergroups: |
| `include_count` | formData | string | No | Include the number of users in the User Group. |
| `usergroup` | formData | string | Yes | The encoded ID of the User Group to update. |
| `name` | formData | string | No | A name for the User Group. Must be unique among Us |

### Example

```bash
curl -X POST \
  -H "Authorization: Bearer $TOKEN" \
  "/usergroups.update"
```

---
