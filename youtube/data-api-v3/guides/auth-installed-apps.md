---
source: https://developers.google.com/youtube/v3/guides/auth/installed-apps
scraped: 2026-01-07
method: webfetch
api: youtube-data-v3
category: guides
---

# OAuth 2.0 for Mobile & Desktop Apps - Complete Guide

## Overview

This guide explains how installed applications on phones, tablets, and computers use Google's OAuth 2.0 endpoints to authorize access to the YouTube Data API.

**Key Concept:** "OAuth 2.0 allows users to share specific data with an application while keeping their usernames, passwords, and other information private."

## Prerequisites

### Enable APIs
1. Open the API Library in Google API Console
2. Select or create a project
3. Find and enable the YouTube Data API
4. Enable any other required APIs

### Create Authorization Credentials

Navigate to the Clients page and click "Create client." Choose your application type:

#### iOS Configuration
1. Select iOS application type
2. Enter OAuth client name
3. Provide bundle identifier (CFBundleIdentifier from info.plist)
4. (Optional) Add App Store ID
5. (Optional) Add Team ID
6. (Optional) Enable App Check
7. Click Create

#### UWP Configuration
1. Select Universal Windows Platform type
2. Enter OAuth client name
3. Provide 12-character Microsoft Store ID (from Partner Center)
4. Click Create

**Redirect URI Format for UWP:** "ms-app://YOUR_APP_PACKAGE_SID" (lowercase SID required)

### Identify Access Scopes

Available YouTube Data API v3 scopes:

| Scope | Purpose |
|-------|---------|
| `https://www.googleapis.com/auth/youtube` | Manage YouTube account |
| `https://www.googleapis.com/auth/youtube.readonly` | View YouTube account |
| `https://www.googleapis.com/auth/youtube.upload` | Manage videos |
| `https://www.googleapis.com/auth/youtube.force-ssl` | Edit/delete videos, ratings, comments, captions |
| `https://www.googleapis.com/auth/youtube.channel-memberships.creator` | View channel members |
| `https://www.googleapis.com/auth/youtubepartner` | Manage assets and content |
| `https://www.googleapis.com/auth/youtubepartner-channel-audit` | View partner audit information |

**Important:** "Incremental authorization is not supported for installed apps or devices."

## OAuth 2.0 Access Token Flow

### Step 1: Generate Code Verifier and Challenge

The guide requires PKCE (Proof Key for Code Exchange) for security.

**Code Verifier Requirements:**
- High-entropy cryptographic random string
- Characters: [A-Z] / [a-z] / [0-9] / "-" / "." / "_" / "~"
- Minimum length: 43 characters
- Maximum length: 128 characters

**Code Challenge Methods:**

**S256 (Recommended):** Base64URL-encoded SHA256 hash of the verifier

**Plain:** Same value as code verifier

### Step 2: Send Authorization Request

Send request to `https://accounts.google.com/o/oauth2/v2/auth`

**Required Parameters:**

| Parameter | Value |
|-----------|-------|
| `client_id` | From Cloud Console Clients page |
| `redirect_uri` | Custom URI scheme or loopback IP |
| `response_type` | `code` |
| `scope` | Space-delimited list of scopes |
| `code_challenge` | Encoded code_verifier (recommended) |
| `code_challenge_method` | `S256` or `plain` (recommended) |
| `state` | Random string for CSRF protection (recommended) |

**Optional Parameters:**
- `login_hint`: Email or sub identifier to pre-fill login

#### Redirect URI Options

**Custom URI Scheme:**
```
com.example.app:redirect_uri_path
com.googleusercontent.apps.123:redirect_uri_path
```
*Note: Custom schemes no longer supported on Android/Chrome apps*

**Loopback IP Address:**
```
http://127.0.0.1:port
http://[::1]:port
```
*Note: Deprecated for Android, Chrome, and iOS mobile apps*

#### Sample Authorization URLs

**Custom URI Scheme Example:**
```
https://accounts.google.com/o/oauth2/v2/auth?
 scope=https%3A%2F%2Fwww.googleapis.com%2Fauth%2Fyoutube.readonly&
 response_type=code&
 state=security_token%3D138r5719ru3e1%26url%3Dhttps%3A%2F%2Foauth2.example.com%2Ftoken&
 redirect_uri=com.example.app%3A/oauth2redirect&
 client_id=client_id
```

**Loopback IP Example:**
```
https://accounts.google.com/o/oauth2/v2/auth?
 scope=https%3A%2F%2Fwww.googleapis.com%2Fauth%2Fyoutube.readonly&
 response_type=code&
 state=security_token%3D138r5719ru3e1%26url%3Dhttps%3A%2F%2Foauth2.example.com%2Ftoken&
 redirect_uri=http%3A//127.0.0.1%3A9004&
 client_id=client_id
```

### Step 3: User Consent

Google displays a consent screen showing your application name, requested API services, and scope access summary. The user approves or denies the request.

**Common Authorization Errors:**

| Error | Resolution |
|-------|-----------|
| `admin_policy_enforced` | Workspace admin restricts scope access; see admin policies |
| `disallowed_useragent` | Don't use embedded web views; use system browser or AppAuth |
| `org_internal` | Client limited to specific Google Cloud Organization |
| `deleted_client` | OAuth client deleted; can restore within 30 days |
| `invalid_grant` | Invalid code_challenge or expired/invalidated tokens |
| `redirect_uri_mismatch` | redirect_uri doesn't match configured URIs |
| `invalid_request` | Malformed request or unsupported custom scheme |

### Step 4: Handle Authorization Response

Google returns either an authorization `code` or an `error` response to your redirect URI.

Example success: `redirect_uri?code=AUTH_CODE&state=STATE_VALUE`

Example error: `redirect_uri?error=access_denied&state=STATE_VALUE`

### Step 5: Exchange Authorization Code for Tokens

Send HTTPS POST request to `https://oauth2.googleapis.com/token`

**Request Parameters:**

| Field | Required | Description |
|-------|----------|-------------|
| `client_id` | Yes | From Cloud Console |
| `client_secret` | No | From Cloud Console (not for Android/iOS/Chrome) |
| `code` | Yes | Authorization code from Step 4 |
| `code_verifier` | Yes | From Step 1 |
| `grant_type` | Yes | Must be `authorization_code` |
| `redirect_uri` | Yes | Must match configured redirect URI |

**Example Request:**
```
POST /token HTTP/1.1
Host: oauth2.googleapis.com
Content-Type: application/x-www-form-urlencoded

code=4/P7q7W91a-oMsCeLvIaQm6bTrgtp7&
client_id=your_client_id&
redirect_uri=http://127.0.0.1:9004&
grant_type=authorization_code
```

**Token Response Fields:**

| Field | Description |
|-------|-------------|
| `access_token` | Token for authorizing API requests |
| `expires_in` | Remaining lifetime in seconds |
| `id_token` | JWT with signed identity info (if identity scope requested) |
| `refresh_token` | Token for obtaining new access tokens |
| `refresh_token_expires_in` | Lifetime of refresh token (time-based access only) |
| `scope` | Space-delimited list of granted scopes |
| `token_type` | Always `Bearer` |

**Example Response:**
```json
{
  "access_token": "1/fFAGRNJru1FTz70BzhT3Zg",
  "expires_in": 3920,
  "token_type": "Bearer",
  "scope": "https://www.googleapis.com/auth/youtube.force-ssl",
  "refresh_token": "1//xEoDL4iW3cxlI7yDbSRFYNG01kVKM2C-259HOF2aQbI"
}
```

**Critical:** "Your application should store both tokens in a secure, long-lived location that is accessible between different invocations of your application."

### Step 6: Verify Granted Scopes

When requesting multiple permissions, users may not grant all scopes. Examine the `scope` field in the response to verify which scopes were actually granted.

Example response showing granted scope:
```json
{
  "access_token": "1/fFAGRNJru1FTz70BzhT3Zg",
  "expires_in": 3920,
  "token_type": "Bearer",
  "scope": "https://www.googleapis.com/auth/youtube.force-ssl",
  "refresh_token": "1//xEoDL4iW3cxlI7yDbSRFYNG01kVKM2C-259HOF2aQbI"
}
```

## Making API Calls

After obtaining an access token, include it in API requests using either:

1. **Authorization HTTP header (preferred):**
```
Authorization: Bearer access_token
```

2. **Query parameter:**
```
access_token=access_token
```

### HTTP GET Examples

**Using Authorization header:**
```
GET /youtube/v3/channels?part=snippet&mine=true HTTP/1.1
Host: www.googleapis.com
Authorization: Bearer access_token
```

**Using query parameter:**
```
GET https://www.googleapis.com/youtube/v3/channels?access_token=access_token&part=snippet&mine=true
```

### curl Examples

**With header (preferred):**
```bash
curl -H "Authorization: Bearer access_token" \
  https://www.googleapis.com/youtube/v3/channels?part=snippet&mine=true
```

**With query parameter:**
```bash
curl https://www.googleapis.com/youtube/v3/channels?access_token=access_token&part=snippet&mine=true
```

## Refreshing Access Tokens

Access tokens expire periodically. Use the refresh token to obtain a new access token without user interaction.

Send HTTPS POST to `https://oauth2.googleapis.com/token`

**Request Parameters:**

| Field | Required | Description |
|-------|----------|-------------|
| `client_id` | Yes | From Cloud Console |
| `client_secret` | No | From Cloud Console (not for Android/iOS/Chrome) |
| `grant_type` | Yes | Must be `refresh_token` |
| `refresh_token` | Yes | From previous token exchange |

**Example Request:**
```
POST /token HTTP/1.1
Host: oauth2.googleapis.com
Content-Type: application/x-www-form-urlencoded

client_id=your_client_id&
refresh_token=refresh_token&
grant_type=refresh_token
```

**Example Response:**
```json
{
  "access_token": "1/fFAGRNJru1FTz70BzhT3Zg",
  "expires_in": 3920,
  "scope": "https://www.googleapis.com/auth/drive.metadata.readonly",
  "token_type": "Bearer"
}
```

**Token Limits:** "Note that there are limits on the number of refresh tokens that will be issued; one limit per client/user combination, and another per user across all clients."

## Token Revocation

Users can revoke access through Account Settings or programmatically via your application.

**Programmatic Revocation:**
```bash
curl -d -X -POST --header "Content-type:application/x-www-form-urlencoded" \
  https://oauth2.googleapis.com/revoke?token={token}
```

Pass either an access token or refresh token. If access token is passed with corresponding refresh token, both are revoked.

**Success Response:** HTTP status 200
**Error Response:** HTTP status 400 with error code

**Important:** "Revocation removes all OAuth 2.0 scopes previously granted to a project, invalidating any issued access or refresh tokens for all clients registered under that project."

## Redirect Method Alternatives

### Custom URI Schemes (Deprecated)

**Important:** Custom URI schemes no longer supported due to app impersonation risk.

**Chrome Apps Alternative:** Use the Chrome Identity API for direct response delivery.

### Loopback IP Address (macOS, Linux, Windows Desktop)

**Status:** Deprecated for Android, Chrome apps, and iOS

Create local HTTP server listening on loopback address. Recommended for desktop apps that support system browsers.

**Recommended Platform:** macOS, Linux, Windows desktop (not UWP)

**Configuration:** Set application type to "Desktop app"

When receiving authorization response, display HTML page instructing user to close browser and return to app.

*Note: `localhost` can substitute for loopback IP but may cause firewall issues.*

## Security Protections

### App Check (iOS Only)

Uses Apple's App Attest service to verify OAuth 2.0 requests originate from authentic apps, reducing impersonation risk.

**Requirements:**
- Specify Team ID for iOS client
- Bundle ID cannot contain wildcard (*)

**Enabling:**
1. Turn on "Protect your OAuth client from abuse with Firebase App Check" toggle
2. Monitor verification metrics before enforcement

**Enforcement:**
- Review metrics showing verified vs. unverified requests
- Click ENFORCE button to block unverified requests
- Takes up to 15 minutes to activate

**Unenforcement:** Click UNENFORCE to stop enforcement and allow all requests

**Disabling:** Turn off App Check toggle (15-minute activation time)

**Warning:** Cannot edit bundle ID after App Check enabled; verify correctness beforehand.

### Cross-Account Protection

Implement Google's Cross-Account Protection Service to receive security event notifications about major user account changes.

Example event types:
- `https://schemas.openid.net/secevent/risc/event-type/sessions-revoked`
- `https://schemas.openid.net/secevent/oauth/event-type/token-revoked`
- `https://schemas.openid.net/secevent/risc/event-type/account-disabled`

## Time-Based Access

Time-based access allows users to grant limited-duration access for specific actions. Available in select Google products.

When granted: refresh token expires after specified duration

`refresh_token_expires_in` field indicates remaining time until expiration

Example use case: Data Portability API for one-time data transfers

## Additional Resources

- **iOS Development:** Use Sign In With Google iOS SDK for simpler implementation
- **Limited-Input Devices:** See OAuth 2.0 for TVs & Devices guide
- **Best Practices:** Review IETF RFC 8252 (OAuth 2.0 for Native Apps)
- **Testing:** Use OAuth 2.0 Playground to test all Google APIs
- **Code Samples:** Available on GitHub and in multiple programming languages
