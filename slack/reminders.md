---
created: 2026-01-09
tags: [type/api-reference, api/reminders]
api_name: Slack Web API
category: reminders
endpoint_count: 5
---

# Slack Web API - Reminders

[[README|Back to Overview]]

---

## POST /reminders.add

Creates a reminder.

### Parameters

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| `token` | header | string | Yes | Authentication token. Requires scope: `reminders:w |
| `text` | formData | string | Yes | The content of the reminder |
| `time` | formData | string | Yes | When this reminder should happen: the Unix timesta |
| `user` | formData | string | No | The user who will receive the reminder. If no user |

### Example

```bash
curl -X POST \
  -H "Authorization: Bearer $TOKEN" \
  "/reminders.add"
```

---

## POST /reminders.complete

Marks a reminder as complete.

### Parameters

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| `token` | header | string | No | Authentication token. Requires scope: `reminders:w |
| `reminder` | formData | string | No | The ID of the reminder to be marked as complete |

### Example

```bash
curl -X POST \
  -H "Authorization: Bearer $TOKEN" \
  "/reminders.complete"
```

---

## POST /reminders.delete

Deletes a reminder.

### Parameters

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| `token` | header | string | No | Authentication token. Requires scope: `reminders:w |
| `reminder` | formData | string | No | The ID of the reminder |

### Example

```bash
curl -X POST \
  -H "Authorization: Bearer $TOKEN" \
  "/reminders.delete"
```

---

## GET /reminders.info

Gets information about a reminder.

### Parameters

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| `token` | query | string | No | Authentication token. Requires scope: `reminders:r |
| `reminder` | query | string | No | The ID of the reminder |

### Example

```bash
curl -X GET \
  -H "Authorization: Bearer $TOKEN" \
  "/reminders.info"
```

---

## GET /reminders.list

Lists all reminders created by or for a given user.

### Parameters

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| `token` | query | string | No | Authentication token. Requires scope: `reminders:r |

### Example

```bash
curl -X GET \
  -H "Authorization: Bearer $TOKEN" \
  "/reminders.list"
```

---
