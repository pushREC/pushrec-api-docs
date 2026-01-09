---
created: 2026-01-09
tags: [type/api-reference, api/admin.usergroups]
api_name: Slack Web API
category: admin.usergroups
endpoint_count: 4
---

# Slack Web API - Admin.Usergroups

[[README|Back to Overview]]

---

## POST /admin.usergroups.addChannels

Add one or more default channels to an IDP group.

### Parameters

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| `token` | header | string | Yes | Authentication token. Requires scope: `admin.userg |
| `usergroup_id` | formData | string | Yes | ID of the IDP group to add default channels for. |
| `team_id` | formData | string | No | The workspace to add default channels in. |
| `channel_ids` | formData | string | Yes | Comma separated string of channel IDs. |

### Example

```bash
curl -X POST \
  -H "Authorization: Bearer $TOKEN" \
  "/admin.usergroups.addChannels"
```

---

## POST /admin.usergroups.addTeams

Associate one or more default workspaces with an organization-wide IDP group.

### Parameters

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| `token` | header | string | Yes | Authentication token. Requires scope: `admin.teams |
| `usergroup_id` | formData | string | Yes | An encoded usergroup (IDP Group) ID. |
| `team_ids` | formData | string | Yes | A comma separated list of encoded team (workspace) |
| `auto_provision` | formData | string | No | When `true`, this method automatically creates new |

### Example

```bash
curl -X POST \
  -H "Authorization: Bearer $TOKEN" \
  "/admin.usergroups.addTeams"
```

---

## GET /admin.usergroups.listChannels

List the channels linked to an org-level IDP group (user group).

### Parameters

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| `token` | header | string | Yes | Authentication token. Requires scope: `admin.userg |
| `usergroup_id` | query | string | Yes | ID of the IDP group to list default channels for. |
| `team_id` | query | string | No | ID of the the workspace. |
| `include_num_members` | query | string | No | Flag to include or exclude the count of members pe |

### Example

```bash
curl -X GET \
  -H "Authorization: Bearer $TOKEN" \
  "/admin.usergroups.listChannels"
```

---

## POST /admin.usergroups.removeChannels

Remove one or more default channels from an org-level IDP group (user group).

### Parameters

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| `token` | header | string | Yes | Authentication token. Requires scope: `admin.userg |
| `usergroup_id` | formData | string | Yes | ID of the IDP Group |
| `channel_ids` | formData | string | Yes | Comma-separated string of channel IDs |

### Example

```bash
curl -X POST \
  -H "Authorization: Bearer $TOKEN" \
  "/admin.usergroups.removeChannels"
```

---
