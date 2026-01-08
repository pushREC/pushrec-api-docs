---
created: 2026-01-08
tags: [type/api-reference, api/authentication]
api_name: Vercel API
category: authentication
endpoint_count: 5
---

# Vercel API - Authentication

[[README|Back to Overview]]

---

## POST /v1/integrations/sso/token

**SSO Token Exchange**

During the autorization process, Vercel sends the user to the provider [redirectLoginUrl](https://vercel.com/docs/integrations/create-integration/submit-integration#redirect-login-url), that includes the OAuth authorization `code` parameter. The provider then calls the SSO Token Exchange endpoint with the sent code and receives the OIDC token. They log the user in based on this token and redirects the user back to the Vercel account using deep-link parameters included the redirectLoginUrl. Providers should not persist the returned `id_token` in a database since the token will expire. See [**Authentication with SSO**](https://vercel.com/docs/integrations/create-integration/marketplace-api#authentication-with-sso) for more details.

### Example

```bash
curl -X POST \
  -H "Authorization: Bearer $TOKEN" \
  "https://api.vercel.com/v1/integrations/sso/token"
```

---

## GET /v5/user/tokens

**List Auth Tokens**

Retrieve a list of the current User's authentication tokens.

### Example

```bash
curl -X GET \
  -H "Authorization: Bearer $TOKEN" \
  "https://api.vercel.com/v5/user/tokens"
```

---

## POST /v3/user/tokens

**Create an Auth Token**

Creates and returns a new authentication token for the currently authenticated User. The `bearerToken` property is only provided once, in the response body, so be sure to save it on the client for use with API requests.

### Parameters

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| `teamId` | query | string | No | The Team identifier to perform the request on beha |
| `slug` | query | string | No | The Team slug to perform the request on behalf of. |

### Example

```bash
curl -X POST \
  -H "Authorization: Bearer $TOKEN" \
  "https://api.vercel.com/v3/user/tokens"
```

---

## GET /v5/user/tokens/{tokenId}

**Get Auth Token Metadata**

Retrieve metadata about an authentication token belonging to the currently authenticated User.

### Parameters

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| `tokenId` | path | string | Yes | The identifier of the token to retrieve. The speci |

### Example

```bash
curl -X GET \
  -H "Authorization: Bearer $TOKEN" \
  "https://api.vercel.com/v5/user/tokens/{tokenId}"
```

---

## DELETE /v3/user/tokens/{tokenId}

**Delete an authentication token**

Invalidate an authentication token, such that it will no longer be valid for future HTTP requests.

### Parameters

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| `tokenId` | path | string | Yes | The identifier of the token to invalidate. The spe |

### Example

```bash
curl -X DELETE \
  -H "Authorization: Bearer $TOKEN" \
  "https://api.vercel.com/v3/user/tokens/{tokenId}"
```

---
