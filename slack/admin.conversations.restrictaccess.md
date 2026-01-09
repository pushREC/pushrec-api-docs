---
created: 2026-01-09
tags: [type/api-reference, api/admin.conversations.restrictaccess]
api_name: Slack Web API
category: admin.conversations.restrictAccess
endpoint_count: 3
---

# Slack Web API - Admin.Conversations.Restrictaccess

[[README|Back to Overview]]

---

## POST /admin.conversations.restrictAccess.addGroup

Add an allowlist of IDP groups for accessing a channel

### Parameters

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| `token` | formData | string | Yes | Authentication token. Requires scope: `admin.conve |
| `team_id` | formData | string | No | The workspace where the channel exists. This argum |
| `group_id` | formData | string | Yes | The [IDP Group](https://slack.com/help/articles/11 |
| `channel_id` | formData | string | Yes | The channel to link this group to. |

### Example

```bash
curl -X POST \
  -H "Authorization: Bearer $TOKEN" \
  "/admin.conversations.restrictAccess.addGroup"
```

---

## GET /admin.conversations.restrictAccess.listGroups

List all IDP Groups linked to a channel

### Parameters

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| `token` | query | string | Yes | Authentication token. Requires scope: `admin.conve |
| `channel_id` | query | string | Yes |  |
| `team_id` | query | string | No | The workspace where the channel exists. This argum |

### Example

```bash
curl -X GET \
  -H "Authorization: Bearer $TOKEN" \
  "/admin.conversations.restrictAccess.listGroups"
```

---

## POST /admin.conversations.restrictAccess.removeGroup

Remove a linked IDP group linked from a private channel

### Parameters

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| `token` | formData | string | Yes | Authentication token. Requires scope: `admin.conve |
| `team_id` | formData | string | Yes | The workspace where the channel exists. This argum |
| `group_id` | formData | string | Yes | The [IDP Group](https://slack.com/help/articles/11 |
| `channel_id` | formData | string | Yes | The channel to remove the linked group from. |

### Example

```bash
curl -X POST \
  -H "Authorization: Bearer $TOKEN" \
  "/admin.conversations.restrictAccess.removeGroup"
```

---
