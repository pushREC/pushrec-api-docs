---
source: https://developers.google.com/youtube/v3/guides/auth/client-side-web-apps
scraped: 2026-01-07
method: webfetch
api: youtube-data-v3
category: authentication
---

# OAuth 2.0 for JavaScript Web Applications - YouTube Data API v3

## Overview

The documentation explains how to implement OAuth 2.0 authorization for accessing YouTube Data API from JavaScript web applications. This authentication method enables applications to access user data through the "implicit grant flow," where users authorize access without the app storing sensitive credentials.

## Key Authentication Flow

The process involves four main steps:

**Step 1: Redirect to Google's OAuth Server**
Applications redirect users to `https://accounts.google.com/o/oauth2/v2/auth` with specific parameters including client ID, redirect URI, scopes, and a state parameter for security.

**Step 2: User Consent**
Google displays a consent screen showing requested permissions. Users can grant or deny access to specified scopes.

**Step 3: Handle Server Response**
Google redirects users back to the application with an access token in the URL fragment. The response includes token type (Bearer) and expiration time.

**Step 4: Verify Granted Scopes**
Applications must check which scopes were actually granted, as users can deny specific permissions.

## Required Setup

### Enable APIs
1. Open the API Library in Google API Console
2. Enable YouTube Data API for your project

### Create Authorization Credentials
1. Navigate to the Clients page
2. Create a new Web application client
3. Specify authorized JavaScript origins (domains from which requests can be sent)

### Identify Access Scopes
YouTube Data API v3 provides several scope options:
- `https://www.googleapis.com/auth/youtube` - Full account management
- `https://www.googleapis.com/auth/youtube.readonly` - View-only access
- `https://www.googleapis.com/auth/youtube.upload` - Video management
- `https://www.googleapis.com/auth/youtube.force-ssl` - Full video/comment/caption access

## OAuth 2.0 Endpoints and Parameters

### Required Parameters for Authorization Request

| Parameter | Purpose |
|-----------|---------|
| `client_id` | Identifies your application |
| `redirect_uri` | Where Google returns users after authorization |
| `response_type` | Must be "token" for client-side applications |
| `scope` | Space-delimited list of requested permissions |

### Recommended Parameters

**`state`** - A random string maintaining state between request and response, essential for preventing Cross-Site Request Forgery (CSRF) attacks. The server returns this exact value, allowing applications to verify the response originated from the same browser session.

### Optional Parameters

- `include_granted_scopes` - Enables incremental authorization
- `login_hint` - Pre-fills user email or suggests account
- `prompt` - Controls authentication screen display

## Implementation Examples

### JavaScript Form Submission

```javascript
function oauthSignIn() {
  var oauth2Endpoint = 'https://accounts.google.com/o/oauth2/v2/auth';
  var form = document.createElement('form');
  form.setAttribute('method', 'GET');
  form.setAttribute('action', oauth2Endpoint);

  var params = {
    'client_id': 'YOUR_CLIENT_ID',
    'redirect_uri': 'YOUR_REDIRECT_URI',
    'response_type': 'token',
    'scope': 'https://www.googleapis.com/auth/youtube.force-ssl',
    'state': 'pass-through value'
  };

  for (var p in params) {
    var input = document.createElement('input');
    input.setAttribute('type', 'hidden');
    input.setAttribute('name', p);
    input.setAttribute('value', params[p]);
    form.appendChild(input);
  }

  document.body.appendChild(form);
  form.submit();
}
```

### API Request with Access Token

```javascript
var xhr = new XMLHttpRequest();
xhr.open('GET',
    'https://www.googleapis.com/youtube/v3/channels?part=snippet&mine=true&' +
    'access_token=' + accessToken);
xhr.onreadystatechange = function (e) {
  console.log(xhr.response);
};
xhr.send(null);
```

### Using curl

```bash
curl -H "Authorization: Bearer access_token" \
  https://www.googleapis.com/youtube/v3/channels?part=snippet&mine=true
```

## Token Management

### Token Storage
Access tokens should be stored securely in the browser's local storage. The response includes:
- `access_token` - The authorization token
- `token_type` - Always "Bearer"
- `expires_in` - Token lifetime in seconds

### Token Revocation

Applications can programmatically revoke tokens by making requests to `https://oauth2.googleapis.com/revoke`:

```javascript
function revokeAccess(accessToken) {
  var revokeTokenEndpoint = 'https://oauth2.googleapis.com/revoke';
  var form = document.createElement('form');
  form.setAttribute('method', 'post');
  form.setAttribute('action', revokeTokenEndpoint);

  var tokenField = document.createElement('input');
  tokenField.setAttribute('type', 'hidden');
  tokenField.setAttribute('name', 'token');
  tokenField.setAttribute('value', accessToken);
  form.appendChild(tokenField);

  document.body.appendChild(form);
  form.submit();
}
```

## Incremental Authorization

The `include_granted_scopes=true` parameter enables requesting additional scopes over time. When set, new access tokens include all previously granted scopes, avoiding multiple token management.

## Security Considerations

### CSRF Protection
Applications must validate that the returned `state` parameter matches the sent value, ensuring the response originated from the same browser instance.

### Origin Validation Rules
- Must use HTTPS (except localhost)
- Cannot use raw IP addresses (except localhost)
- Cannot contain userinfo, path, query, or fragment components
- Cannot include wildcard or non-printable characters

### Common Errors
- `redirect_uri_mismatch` - Redirect URI doesn't match registered values
- `origin_mismatch` - Request origin not authorized
- `invalid_client` - Client ID invalid or deleted
- `admin_policy_enforced` - Workspace administrator restrictions
- `disallowed_useragent` - Request from embedded user-agent

## Google Libraries and Best Practices

The documentation strongly recommends using Google Identity Services library instead of implementing OAuth directly. This approach leverages well-tested code reducing security implementation risks.

Users can revoke application access through their Google Account permissions page, and applications should implement token revocation mechanisms as part of removal processes.
