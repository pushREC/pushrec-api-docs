---
created: 2026-01-09
tags: [type/api-reference, api/calls.participants]
api_name: Slack Web API
category: calls.participants
endpoint_count: 2
---

# Slack Web API - Calls.Participants

[[README|Back to Overview]]

---

## POST /calls.participants.add

Registers new participants added to a Call.

### Parameters

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| `token` | header | string | Yes | Authentication token. Requires scope: `calls:write |
| `id` | formData | string | Yes | `id` returned by the [`calls.add`](/methods/calls. |
| `users` | formData | string | Yes | The list of users to add as participants in the Ca |

### Example

```bash
curl -X POST \
  -H "Authorization: Bearer $TOKEN" \
  "/calls.participants.add"
```

---

## POST /calls.participants.remove

Registers participants removed from a Call.

### Parameters

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| `token` | header | string | Yes | Authentication token. Requires scope: `calls:write |
| `id` | formData | string | Yes | `id` returned by the [`calls.add`](/methods/calls. |
| `users` | formData | string | Yes | The list of users to remove as participants in the |

### Example

```bash
curl -X POST \
  -H "Authorization: Bearer $TOKEN" \
  "/calls.participants.remove"
```

---
