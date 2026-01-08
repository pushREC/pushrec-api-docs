---
source: https://developers.notion.com/reference/refresh-a-token
scraped: 2026-01-08
---

# Refresh a Token

## Endpoint

**POST** `https://api.notion.com/v1/oauth/token`

## Description

Refreshes an access token, generating a new access token and new refresh token. This enables applications to maintain valid credentials without requiring users to re-authenticate.

## Request Parameters

| Parameter | Type | Required | Description |
|-----------|------|----------|-------------|
| `grant_type` | string | Yes | Must be `"refresh_token"` |
| `refresh_token` | string | Yes | The refresh token from a previous token response |

## Response

Returns a new token object containing:

| Field | Type | Description |
|-------|------|-------------|
| `access_token` | string | The new bearer token for API authentication |
| `refresh_token` | string | A new refresh token for future refreshes |
| `token_type` | string | Always `"bearer"` |
| `expires_in` | integer | Token validity period in seconds |

## Use Cases

- Maintaining persistent authentication sessions
- Implementing automatic token renewal
- Supporting long-running background processes
- Building seamless user experiences without re-authentication

## Error Handling

Consult the Status codes documentation section for complete error code descriptions and meanings.

## Related Endpoints

| Endpoint | Purpose |
|----------|---------|
| Create a token | Generate initial access tokens |
| Introspect token | Check token status and validity |
| Revoke token | Invalidate tokens |
| Refresh a token | Generate new tokens from refresh token |
