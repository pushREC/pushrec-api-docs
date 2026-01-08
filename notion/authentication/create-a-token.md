---
source: https://developers.notion.com/reference/create-a-token
scraped: 2026-01-08
---

# Create a Token

## Endpoint

**POST** `https://api.notion.com/v1/oauth/token`

## Description

This endpoint generates access tokens enabling third-party services to authenticate with Notion's platform.

## Redirect URI Requirements

### Required When

The `redirect_uri` field is **required** in the request body when:

- A `redirect_uri` query parameter was included in the Authorization URL, OR
- Multiple redirect URIs are configured in the integration settings

### Not Allowed When

The `redirect_uri` field is **not allowed** when:

- Only one redirect URI exists in integration settings AND no query parameter was specified in the Authorization URL

## Request Parameters

| Parameter | Type | Required | Description |
|-----------|------|----------|-------------|
| `grant_type` | string | Yes | Must be `"authorization_code"` |
| `code` | string | Yes | The authorization code received from the OAuth flow |
| `redirect_uri` | string | Conditional | The redirect URI used in the authorization request |

## Response

Returns an access token object containing:

| Field | Type | Description |
|-------|------|-------------|
| `access_token` | string | The bearer token for API authentication |
| `token_type` | string | Always `"bearer"` |
| `bot_id` | string | The ID of the integration's bot user |
| `workspace_id` | string | The workspace where the integration was authorized |
| `workspace_name` | string | Name of the workspace |
| `workspace_icon` | string | URL of the workspace icon |
| `duplicated_template_id` | string | ID of duplicated template (if applicable) |
| `owner` | object | Information about the bot owner |

## Error Handling

Each Public API endpoint may return multiple error codes. Consult the Status Codes documentation for complete error descriptions.
