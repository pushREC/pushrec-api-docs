---
created: 2026-01-08
tags: [type/api-reference, api/actor-tokens]
api_name: Clerk Backend API
category: Actor Tokens
endpoint_count: 2
---

# Clerk Backend API - Actor Tokens

[[README|Back to Overview]]

---

## POST /actor_tokens

**Create actor token**

Create an actor token that can be used to impersonate the given user.
The `actor` parameter needs to include at least a "sub" key whose value is the ID of the actor (impersonating) user.

### Example

```bash
curl -X POST \
  -H "Authorization: Bearer $TOKEN" \
  "https://api.clerk.com/v1/actor_tokens"
```

---

## POST /actor_tokens/{actor_token_id}/revoke

**Revoke actor token**

Revokes a pending actor token.

### Parameters

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| `actor_token_id` | path | string | Yes | The ID of the actor token to be revoked. |

### Example

```bash
curl -X POST \
  -H "Authorization: Bearer $TOKEN" \
  "https://api.clerk.com/v1/actor_tokens/{actor_token_id}/revoke"
```

---
