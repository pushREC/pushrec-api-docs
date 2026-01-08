---
created: 2026-01-08
tags: [type/api-reference, api/sign-in-tokens]
api_name: Clerk Backend API
category: Sign-in Tokens
endpoint_count: 2
---

# Clerk Backend API - Sign-In Tokens

[[README|Back to Overview]]

---

## POST /sign_in_tokens

**Create sign-in token**

Creates a new sign-in token and associates it with the given user.
By default, sign-in tokens expire in 30 days.
You can optionally supply a different duration in seconds using the `expires_in_seconds` property.

### Example

```bash
curl -X POST \
  -H "Authorization: Bearer $TOKEN" \
  "https://api.clerk.com/v1/sign_in_tokens"
```

---

## POST /sign_in_tokens/{sign_in_token_id}/revoke

**Revoke the given sign-in token**

Revokes a pending sign-in token

### Parameters

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| `sign_in_token_id` | path | string | Yes | The ID of the sign-in token to be revoked |

### Example

```bash
curl -X POST \
  -H "Authorization: Bearer $TOKEN" \
  "https://api.clerk.com/v1/sign_in_tokens/{sign_in_token_id}/revoke"
```

---
