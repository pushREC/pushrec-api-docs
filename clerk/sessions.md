---
created: 2026-01-08
tags: [type/api-reference, api/sessions]
api_name: Clerk Backend API
category: Sessions
endpoint_count: 8
---

# Clerk Backend API - Sessions

[[README|Back to Overview]]

---

## GET /sessions

**List all sessions**

Returns a list of all sessions.
The sessions are returned sorted by creation date, with the newest sessions appearing first.
**Deprecation Notice (2024-01-01):** All parameters were initially considered optional, however
moving forward at least one of `client_id` or `user_id` parameters should be provided.

### Parameters

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| `client_id` | query | string | No | List sessions for the given client |
| `user_id` | query | string | No | List sessions for the given user |
| `status` | query | string | No | Filter sessions by the provided status |
| `` | query | string | No |  |
| `` | query | string | No |  |
| `` | query | string | No |  |

### Example

```bash
curl -X GET \
  -H "Authorization: Bearer $TOKEN" \
  "https://api.clerk.com/v1/sessions"
```

---

## POST /sessions

**Create a new active session**

Create a new active session for the provided user ID.

**This operation is intended only for use in testing, and is not available for production instances.** If you are looking to generate a user session from the backend,
we recommend using the [Sign-in Tokens](https://clerk.com/docs/reference/backend-api/tag/Sign-in-Tokens#operation/CreateSignInToken) resource instead.

### Example

```bash
curl -X POST \
  -H "Authorization: Bearer $TOKEN" \
  "https://api.clerk.com/v1/sessions"
```

---

## GET /sessions/{session_id}

**Retrieve a session**

Retrieve the details of a session

### Parameters

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| `session_id` | path | string | Yes | The ID of the session |

### Example

```bash
curl -X GET \
  -H "Authorization: Bearer $TOKEN" \
  "https://api.clerk.com/v1/sessions/{session_id}"
```

---

## POST /sessions/{session_id}/refresh

**Refresh a session**

Refreshes a session by creating a new session token. A 401 is returned when there
are validation errors, which signals the SDKs to fallback to the handshake flow.

### Parameters

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| `session_id` | path | string | Yes | The ID of the session |

### Example

```bash
curl -X POST \
  -H "Authorization: Bearer $TOKEN" \
  "https://api.clerk.com/v1/sessions/{session_id}/refresh"
```

---

## POST /sessions/{session_id}/revoke

**Revoke a session**

Sets the status of a session as "revoked", which is an unauthenticated state.
In multi-session mode, a revoked session will still be returned along with its client object, however the user will need to sign in again.

### Parameters

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| `session_id` | path | string | Yes | The ID of the session |

### Example

```bash
curl -X POST \
  -H "Authorization: Bearer $TOKEN" \
  "https://api.clerk.com/v1/sessions/{session_id}/revoke"
```

---

## POST /sessions/{session_id}/verify

**Verify a session**

Returns the session if it is authenticated, otherwise returns an error.
WARNING: This endpoint is deprecated and will be removed in future versions. We strongly recommend switching to networkless verification using short-lived session tokens,
         which is implemented transparently in all recent SDK versions (e.g. [NodeJS SDK](https://clerk.com/docs/backend-requests/handling/nodejs#clerk-express-require-auth)).
         For more details on how networkless verification works, refer to our [Session Tokens documentation](https://clerk.com/docs/backend-requests/resources/session-tokens).

### Parameters

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| `session_id` | path | string | Yes | The ID of the session |

### Example

```bash
curl -X POST \
  -H "Authorization: Bearer $TOKEN" \
  "https://api.clerk.com/v1/sessions/{session_id}/verify"
```

---

## POST /sessions/{session_id}/tokens

**Create a session token**

Creates a session JSON Web Token (JWT) based on a session.

### Parameters

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| `session_id` | path | string | Yes | The ID of the session |

### Example

```bash
curl -X POST \
  -H "Authorization: Bearer $TOKEN" \
  "https://api.clerk.com/v1/sessions/{session_id}/tokens"
```

---

## POST /sessions/{session_id}/tokens/{template_name}

**Create a session token from a jwt template**

Creates a JSON Web Token(JWT) based on a session and a JWT Template name defined for your instance

### Parameters

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| `session_id` | path | string | Yes | The ID of the session |
| `template_name` | path | string | Yes | The name of the JWT Template defined in your insta |

### Example

```bash
curl -X POST \
  -H "Authorization: Bearer $TOKEN" \
  "https://api.clerk.com/v1/sessions/{session_id}/tokens/{template_name}"
```

---
