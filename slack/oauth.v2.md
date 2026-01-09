---
created: 2026-01-09
tags: [type/api-reference, api/oauth.v2]
api_name: Slack Web API
category: oauth.v2
endpoint_count: 1
---

# Slack Web API - Oauth.V2

[[README|Back to Overview]]

---

## GET /oauth.v2.access

Exchanges a temporary OAuth verifier code for an access token.

### Parameters

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| `client_id` | query | string | No | Issued when you created your application. |
| `client_secret` | query | string | No | Issued when you created your application. |
| `code` | query | string | Yes | The `code` param returned via the OAuth callback. |
| `redirect_uri` | query | string | No | This must match the originally submitted URI (if o |

### Example

```bash
curl -X GET \
  -H "Authorization: Bearer $TOKEN" \
  "/oauth.v2.access"
```

---
