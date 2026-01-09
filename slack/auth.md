---
created: 2026-01-09
tags: [type/api-reference, api/auth]
api_name: Slack Web API
category: auth
endpoint_count: 2
---

# Slack Web API - Auth

[[README|Back to Overview]]

---

## GET /auth.revoke

Revokes a token.

### Parameters

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| `token` | query | string | Yes | Authentication token. Requires scope: `none` |
| `test` | query | string | No | Setting this parameter to `1` triggers a _testing  |

### Example

```bash
curl -X GET \
  -H "Authorization: Bearer $TOKEN" \
  "/auth.revoke"
```

---

## GET /auth.test

Checks authentication & identity.

### Parameters

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| `token` | header | string | Yes | Authentication token. Requires scope: `none` |

### Example

```bash
curl -X GET \
  -H "Authorization: Bearer $TOKEN" \
  "/auth.test"
```

---
