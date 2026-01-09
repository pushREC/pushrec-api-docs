---
created: 2026-01-09
tags: [type/api-reference, api/oauth]
api_name: Slack Web API
category: oauth
endpoint_count: 2
---

# Slack Web API - Oauth

[[README|Back to Overview]]

---

## GET /oauth.access

Exchanges a temporary OAuth verifier code for an access token.

### Parameters

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| `client_id` | query | string | No | Issued when you created your application. |
| `client_secret` | query | string | No | Issued when you created your application. |
| `code` | query | string | No | The `code` param returned via the OAuth callback. |
| `redirect_uri` | query | string | No | This must match the originally submitted URI (if o |
| `single_channel` | query | string | No | Request the user to add your app only to a single  |

### Example

```bash
curl -X GET \
  -H "Authorization: Bearer $TOKEN" \
  "/oauth.access"
```

---

## GET /oauth.token

Exchanges a temporary OAuth verifier code for a workspace token.

### Parameters

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| `client_id` | query | string | No | Issued when you created your application. |
| `client_secret` | query | string | No | Issued when you created your application. |
| `code` | query | string | No | The `code` param returned via the OAuth callback. |
| `redirect_uri` | query | string | No | This must match the originally submitted URI (if o |
| `single_channel` | query | string | No | Request the user to add your app only to a single  |

### Example

```bash
curl -X GET \
  -H "Authorization: Bearer $TOKEN" \
  "/oauth.token"
```

---
