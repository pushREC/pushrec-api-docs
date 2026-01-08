---
source: https://developers.notion.com/reference/revoke-token
scraped: 2026-01-08
---

# Revoke Token

## Endpoint

**POST** `https://api.notion.com/v1/oauth/revoke`

## Description

This endpoint terminates the validity of an authentication token, effectively preventing future API requests using that credential.

## Use Cases

- Logging out users from your application
- Removing access after a security incident
- Cleaning up tokens when users disconnect integrations
- Implementing token lifecycle management

## Request Parameters

| Parameter | Type | Required | Description |
|-----------|------|----------|-------------|
| `token` | string | Yes | The access token to revoke |

## Response

A successful revocation returns an empty response with HTTP status 200.

## Important Notes

- Once revoked, a token cannot be restored
- The revoke functionality is part of Notion's OAuth management suite
- Related operations include creating, introspecting, and refreshing tokens
