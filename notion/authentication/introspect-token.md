---
source: https://developers.notion.com/reference/introspect-token
scraped: 2026-01-08
---

# Introspect Token

## Endpoint

**POST** `https://api.notion.com/v1/oauth/introspect`

## Description

This endpoint allows you to validate and retrieve information about an OAuth token's current status. It provides details on whether a token is active, its authorized scopes, and when it was issued.

## Key Information Available

When you introspect a token, you can obtain:

| Field | Description |
|-------|-------------|
| **Active status** | Whether the token is currently valid and usable |
| **Scope** | The permissions granted to the token |
| **Issued time** | When the token was originally created |

## Use Cases

Developers typically use token introspection to:

- Verify token validity before making API calls
- Check what permissions a token has been granted
- Monitor token lifecycle and metadata
- Implement token validation in integration logic

## Request Parameters

| Parameter | Type | Required | Description |
|-----------|------|----------|-------------|
| `token` | string | Yes | The access token to introspect |

## Response

| Field | Type | Description |
|-------|------|-------------|
| `active` | boolean | Whether the token is valid |
| `scope` | string | Permissions granted to the token |
| `iat` | integer | Unix timestamp when token was issued |
| `client_id` | string | The integration client ID |
| `token_type` | string | Type of token (e.g., "bearer") |

The introspection capability helps ensure secure OAuth token management within applications that integrate with Notion's API ecosystem.
