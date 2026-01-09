---
created: 2026-01-09
tags: [type/api-reference, api/admin.teams.settings]
api_name: Slack Web API
category: admin.teams.settings
endpoint_count: 6
---

# Slack Web API - Admin.Teams.Settings

[[README|Back to Overview]]

---

## GET /admin.teams.settings.info

Fetch information about settings in a workspace

### Parameters

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| `token` | header | string | Yes | Authentication token. Requires scope: `admin.teams |
| `team_id` | query | string | Yes |  |

### Example

```bash
curl -X GET \
  -H "Authorization: Bearer $TOKEN" \
  "/admin.teams.settings.info"
```

---

## POST /admin.teams.settings.setDefaultChannels

Set the default channels of a workspace.

### Parameters

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| `token` | formData | string | Yes | Authentication token. Requires scope: `admin.teams |
| `team_id` | formData | string | Yes | ID for the workspace to set the default channel fo |
| `channel_ids` | formData | string | Yes | An array of channel IDs. |

### Example

```bash
curl -X POST \
  -H "Authorization: Bearer $TOKEN" \
  "/admin.teams.settings.setDefaultChannels"
```

---

## POST /admin.teams.settings.setDescription

Set the description of a given workspace.

### Parameters

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| `token` | header | string | Yes | Authentication token. Requires scope: `admin.teams |
| `team_id` | formData | string | Yes | ID for the workspace to set the description for. |
| `description` | formData | string | Yes | The new description for the workspace. |

### Example

```bash
curl -X POST \
  -H "Authorization: Bearer $TOKEN" \
  "/admin.teams.settings.setDescription"
```

---

## POST /admin.teams.settings.setDiscoverability

An API method that allows admins to set the discoverability of a given workspace

### Parameters

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| `token` | header | string | Yes | Authentication token. Requires scope: `admin.teams |
| `team_id` | formData | string | Yes | The ID of the workspace to set discoverability on. |
| `discoverability` | formData | string | Yes | This workspace's discovery setting. It must be set |

### Example

```bash
curl -X POST \
  -H "Authorization: Bearer $TOKEN" \
  "/admin.teams.settings.setDiscoverability"
```

---

## POST /admin.teams.settings.setIcon

Sets the icon of a workspace.

### Parameters

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| `token` | formData | string | Yes | Authentication token. Requires scope: `admin.teams |
| `image_url` | formData | string | Yes | Image URL for the icon |
| `team_id` | formData | string | Yes | ID for the workspace to set the icon for. |

### Example

```bash
curl -X POST \
  -H "Authorization: Bearer $TOKEN" \
  "/admin.teams.settings.setIcon"
```

---

## POST /admin.teams.settings.setName

Set the name of a given workspace.

### Parameters

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| `token` | header | string | Yes | Authentication token. Requires scope: `admin.teams |
| `team_id` | formData | string | Yes | ID for the workspace to set the name for. |
| `name` | formData | string | Yes | The new name of the workspace. |

### Example

```bash
curl -X POST \
  -H "Authorization: Bearer $TOKEN" \
  "/admin.teams.settings.setName"
```

---
