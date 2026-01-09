---
created: 2026-01-09
tags: [type/api-reference, api/calls]
api_name: Slack Web API
category: calls
endpoint_count: 4
---

# Slack Web API - Calls

[[README|Back to Overview]]

---

## POST /calls.add

Registers a new Call.

### Parameters

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| `token` | header | string | Yes | Authentication token. Requires scope: `calls:write |
| `external_unique_id` | formData | string | Yes | An ID supplied by the 3rd-party Call provider. It  |
| `external_display_id` | formData | string | No | An optional, human-readable ID supplied by the 3rd |
| `join_url` | formData | string | Yes | The URL required for a client to join the Call. |
| `desktop_app_join_url` | formData | string | No | When supplied, available Slack clients will attemp |
| `date_start` | formData | string | No | Call start time in UTC UNIX timestamp format |
| `title` | formData | string | No | The name of the Call. |
| `created_by` | formData | string | No | The valid Slack user ID of the user who created th |
| `users` | formData | string | No | The list of users to register as participants in t |

### Example

```bash
curl -X POST \
  -H "Authorization: Bearer $TOKEN" \
  "/calls.add"
```

---

## POST /calls.end

Ends a Call.

### Parameters

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| `token` | header | string | Yes | Authentication token. Requires scope: `calls:write |
| `id` | formData | string | Yes | `id` returned when registering the call using the  |
| `duration` | formData | string | No | Call duration in seconds |

### Example

```bash
curl -X POST \
  -H "Authorization: Bearer $TOKEN" \
  "/calls.end"
```

---

## GET /calls.info

Returns information about a Call.

### Parameters

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| `token` | header | string | Yes | Authentication token. Requires scope: `calls:read` |
| `id` | query | string | Yes | `id` of the Call returned by the [`calls.add`](/me |

### Example

```bash
curl -X GET \
  -H "Authorization: Bearer $TOKEN" \
  "/calls.info"
```

---

## POST /calls.update

Updates information about a Call.

### Parameters

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| `token` | header | string | Yes | Authentication token. Requires scope: `calls:write |
| `id` | formData | string | Yes | `id` returned by the [`calls.add`](/methods/calls. |
| `title` | formData | string | No | The name of the Call. |
| `join_url` | formData | string | No | The URL required for a client to join the Call. |
| `desktop_app_join_url` | formData | string | No | When supplied, available Slack clients will attemp |

### Example

```bash
curl -X POST \
  -H "Authorization: Bearer $TOKEN" \
  "/calls.update"
```

---
