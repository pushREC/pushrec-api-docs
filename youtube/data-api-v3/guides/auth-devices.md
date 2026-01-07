---
source: https://developers.google.com/youtube/v3/guides/auth/devices
scraped: 2026-01-07
api_provider: Google
discovery_tier: 3
verified: false
category: guides
method: webfetch
---
 OAuth 2.0 Device Authentication Guide

## Overview

This guide covers OAuth 2.0 authorization for devices with limited input capabilities, like TVs and game consoles, enabling secure access to YouTube Data API and other Google services.

## Prerequisites

### Enable APIs
- Access the API Library in Google API Console
- Select or create a project
- Find and enable YouTube Data API

### Create Credentials
1. Navigate to the Clients page
2. Click "Create Client"
3. Select "TVs and Limited Input devices" application type
4. Name your OAuth 2.0 client and create

### Identify Scopes

"Scopes enable your application to only request access to the resources that it needs" while allowing user control over permissions.

### Allowed YouTube Scopes

| Scope | Purpose |
|-------|---------|
| `https://www.googleapis.com/auth/youtube` | Manage your YouTube account |
| `https://www.googleapis.com/auth/youtube.readonly` | View your YouTube account |
| `https://www.googleapis.com/auth/youtube.upload` | Manage YouTube videos |
| `https://www.googleapis.com/auth/youtube.force-ssl` | Edit/delete videos, ratings, comments, captions |
| `https://www.googleapis.com/auth/youtube.channel-memberships.creator` | View channel members |
| `https://www.googleapis.com/auth/youtubepartner` | Manage YouTube assets |
| `https://www.googleapis.com/auth/youtubepartner-channel-audit` | View partner audit information |

## Authentication Flow (6 Steps)

### Step 1: Request Device and User Codes

Send HTTP POST to `https://oauth2.googleapis.com/device/code` with:

**Required Parameters:**
- `client_id` - Your application's client ID
- `scope` - Space-delimited list of requested scopes

**Example curl command:**
```bash
curl -d "client_id=client_id&scope=https%3A%2F%2Fwww.googleapis.com%2Fauth%2Fyoutube.readonly" \
     https://oauth2.googleapis.com/device/code
```

### Step 2: Handle Authorization Server Response

**Success Response:**

The server returns JSON containing:

| Field | Description |
|-------|-------------|
| `device_code` | Uniquely identifies the requesting device |
| `user_code` | Case-sensitive code user enters on separate device |
| `verification_url` | URL where user enters the code |
| `expires_in` | Validity duration in seconds |
| `interval` | Seconds to wait between polling requests |

**Example Response:**
```json
{
  "device_code": "4/4-GMMhmHCXhWEzkobqIHGG_EnNYYsAkukHspeYUk9E8",
  "user_code": "GQVQ-JKEC",
  "verification_url": "https://www.google.com/device",
  "expires_in": 1800,
  "interval": 5
}
```

**Error Response:**

Rate limiting returns HTTP 403:
```json
{
  "error_code": "rate_limit_exceeded"
}
```

### Step 3: Display User Code

Present both `verification_url` and `user_code` to the user.

**UI Requirements:**
- `user_code` must fit 15 wide characters (test with "WWWWWWWWWWWWWWW")
- `user_code` is case-sensitive; don't modify it
- `verification_url` must accommodate 40-character strings
- Optionally remove URL scheme for display

**Critical:** Don't hardcode these values; handle variations in URL schemes.

### Step 4: Poll Authorization Server

Device continuously polls `https://oauth2.googleapis.com/token` until user responds or codes expire.

**Polling Parameters:**
- `client_id` - Your application's client ID
- `client_secret` - Your application's client secret
- `device_code` - From Step 2 response
- `grant_type` - Set to `urn:ietf:params:oauth:grant-type:device_code`

**Example curl command:**
```bash
curl -d "client_id=client_id&client_secret=client_secret&device_code=device_code&grant_type=urn%3Aietf%3Aparams%3Aoauth%3Agrant-type%3Adevice_code" \
     -H "Content-Type: application/x-www-form-urlencoded" \
     https://oauth2.googleapis.com/token
```

### Step 5: User Authorization (No Action Required from App)

User navigates to `verification_url` on another device, enters `user_code`, logs in, and grants or denies access.

### Step 6: Handle Polling Responses

**Access Granted (HTTP 200):**
```json
{
  "access_token": "1/fFAGRNJru1FTz70BzhT3Zg",
  "expires_in": 3920,
  "scope": "openid https://www.googleapis.com/auth/userinfo.profile...",
  "token_type": "Bearer",
  "refresh_token": "1/xEoDL4iW3cxlI7yDbSRFYNG01kVKM2C-259HOF2aQbI"
}
```

**Access Denied (HTTP 403):**
```json
{
  "error": "access_denied",
  "error_description": "Forbidden"
}
```

**Authorization Pending (HTTP 428):**
```json
{
  "error": "authorization_pending",
  "error_description": "Precondition Required"
}
```

**Polling Too Frequently (HTTP 403):**
```json
{
  "error": "slow_down",
  "error_description": "Forbidden"
}
```

**Other Errors:**

| Error | HTTP Code | Description |
|-------|-----------|-------------|
| `admin_policy_enforced` | 400 | Workspace admin restrictions apply |
| `invalid_client` | 401 | OAuth client not found or wrong type |
| `invalid_grant` | 400 | Invalid or expired code |
| `unsupported_grant_type` | 400 | Invalid grant_type parameter |
| `org_internal` | 403 | OAuth client restricted to specific Google Cloud Organization |

## Calling Google APIs

With valid access token, make API requests by including it as either query parameter or Authorization header.

**HTTP GET with Authorization header (preferred):**
```
GET /youtube/v3/channels?part=snippet&mine=true HTTP/1.1
Host: www.googleapis.com
Authorization: Bearer access_token
```

**Using query string parameter:**
```
GET https://www.googleapis.com/youtube/v3/channels?access_token=access_token&part=snippet&mine=true
```

**curl examples:**
```bash
# Using Authorization header (preferred)
curl -H "Authorization: Bearer access_token" \
     https://www.googleapis.com/youtube/v3/channels?part=snippet&mine=true

# Using query parameter
curl https://www.googleapis.com/youtube/v3/channels?access_token=access_token&part=snippet&mine=true
```

## Token Refresh

When access tokens expire, refresh using the refresh token via POST to `https://oauth2.googleapis.com/token`:

**Parameters:**
- `client_id` - Your application's client ID
- `client_secret` - Optional but recommended
- `grant_type` - Must be `refresh_token`
- `refresh_token` - Token from previous authorization

**Example Request:**
```
POST /token HTTP/1.1
Host: oauth2.googleapis.com
Content-Type: application/x-www-form-urlencoded

client_id=your_client_id&
refresh_token=refresh_token&
grant_type=refresh_token
```

**Response:**
```json
{
  "access_token": "1/fFAGRNJru1FTz70BzhT3Zg",
  "expires_in": 3920,
  "scope": "https://www.googleapis.com/auth/drive.metadata.readonly",
  "token_type": "Bearer"
}
```

**Note:** "There are limits on the number of refresh tokens...one limit per client/user combination." Store tokens securely for long-term use.

## Token Revocation

**Programmatic revocation** removes all OAuth 2.0 scopes granted to a project:

```bash
curl -d -X -POST --header "Content-type:application/x-www-form-urlencoded" \
        https://oauth2.googleapis.com/revoke?token={token}
```

Token can be access or refresh token. HTTP 200 indicates success; HTTP 400 indicates error.

**Important:** "Revocation removes all OAuth 2.0 scopes previously granted to a project, invalidating any issued access or refresh tokens for all clients registered under that project."

Users can also manually revoke access via Account Settings.

## Additional Security: Cross-Account Protection

Implement Google's Cross-Account Protection Service to subscribe to security event notifications such as:
- `https://schemas.openid.net/secevent/risc/event-type/sessions-revoked`
- `https://schemas.openid.net/secevent/oauth/event-type/token-revoked`
- `https://schemas.openid.net/secevent/risc/event-type/account-disabled`

## Supported Scopes for Device Flow

**Limited scope support exists:** OpenID Connect scopes (email, openid, profile), Drive API scopes, and specific YouTube scopes listed above. Incremental authorization is not supported for devices.
