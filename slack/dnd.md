---
created: 2026-01-09
tags: [type/api-reference, api/dnd]
api_name: Slack Web API
category: dnd
endpoint_count: 5
---

# Slack Web API - Dnd

[[README|Back to Overview]]

---

## POST /dnd.endDnd

Ends the current user's Do Not Disturb session immediately.

### Parameters

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| `token` | header | string | Yes | Authentication token. Requires scope: `dnd:write` |

### Example

```bash
curl -X POST \
  -H "Authorization: Bearer $TOKEN" \
  "/dnd.endDnd"
```

---

## POST /dnd.endSnooze

Ends the current user's snooze mode immediately.

### Parameters

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| `token` | header | string | Yes | Authentication token. Requires scope: `dnd:write` |

### Example

```bash
curl -X POST \
  -H "Authorization: Bearer $TOKEN" \
  "/dnd.endSnooze"
```

---

## GET /dnd.info

Retrieves a user's current Do Not Disturb status.

### Parameters

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| `token` | query | string | No | Authentication token. Requires scope: `dnd:read` |
| `user` | query | string | No | User to fetch status for (defaults to current user |

### Example

```bash
curl -X GET \
  -H "Authorization: Bearer $TOKEN" \
  "/dnd.info"
```

---

## POST /dnd.setSnooze

Turns on Do Not Disturb mode for the current user, or changes its duration.

### Parameters

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| `token` | formData | string | Yes | Authentication token. Requires scope: `dnd:write` |
| `num_minutes` | formData | string | Yes | Number of minutes, from now, to snooze until. |

### Example

```bash
curl -X POST \
  -H "Authorization: Bearer $TOKEN" \
  "/dnd.setSnooze"
```

---

## GET /dnd.teamInfo

Retrieves the Do Not Disturb status for up to 50 users on a team.

### Parameters

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| `token` | query | string | No | Authentication token. Requires scope: `dnd:read` |
| `users` | query | string | No | Comma-separated list of users to fetch Do Not Dist |

### Example

```bash
curl -X GET \
  -H "Authorization: Bearer $TOKEN" \
  "/dnd.teamInfo"
```

---
