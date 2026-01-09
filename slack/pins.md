---
created: 2026-01-09
tags: [type/api-reference, api/pins]
api_name: Slack Web API
category: pins
endpoint_count: 3
---

# Slack Web API - Pins

[[README|Back to Overview]]

---

## POST /pins.add

Pins an item to a channel.

### Parameters

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| `token` | header | string | Yes | Authentication token. Requires scope: `pins:write` |
| `channel` | formData | string | Yes | Channel to pin the item in. |
| `timestamp` | formData | string | No | Timestamp of the message to pin. |

### Example

```bash
curl -X POST \
  -H "Authorization: Bearer $TOKEN" \
  "/pins.add"
```

---

## GET /pins.list

Lists items pinned to a channel.

### Parameters

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| `token` | query | string | Yes | Authentication token. Requires scope: `pins:read` |
| `channel` | query | string | Yes | Channel to get pinned items for. |

### Example

```bash
curl -X GET \
  -H "Authorization: Bearer $TOKEN" \
  "/pins.list"
```

---

## POST /pins.remove

Un-pins an item from a channel.

### Parameters

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| `token` | header | string | Yes | Authentication token. Requires scope: `pins:write` |
| `channel` | formData | string | Yes | Channel where the item is pinned to. |
| `timestamp` | formData | string | No | Timestamp of the message to un-pin. |

### Example

```bash
curl -X POST \
  -H "Authorization: Bearer $TOKEN" \
  "/pins.remove"
```

---
