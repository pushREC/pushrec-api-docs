---
source: https://developers.google.com/youtube/v3/guides/auth/client-side-web-apps
scraped: 2026-01-07
api_provider: Google
discovery_tier: 3
verified: false
category: guides
method: webfetch
---
 OAuth 2.0 Client-Side Web Apps Authentication Guide

## Overview

The implicit grant flow enables JavaScript applications to access the YouTube Data API while users are present. Unlike server-side apps, client-side applications cannot securely store credentials, making this flow ideal for browser-based implementations.

## Prerequisites

### Enable APIs
1. Navigate to the [API Library](https://console.developers.google.com/apis/library) in Google API Console
2. Select or create a project
3. Find and enable the YouTube Data API

### Create Authorization Credentials
1. Go to the [Clients page](https://console.developers.google.com/auth/clients)
2. Click **Create Client**
3. Select **Web application**
4. Specify authorized JavaScript origins (domains from which your app sends OAuth requests)

## OAuth 2.0 Scopes

YouTube Data API v3 supports these scopes:

| Scope | Permission |
|-------|-----------|
| `https://www.googleapis.com/auth/youtube` | Full account management |
| `https://www.googleapis.com/auth/youtube.readonly` | View account only |
| `https://www.googleapis.com/auth/youtube.upload` | Manage videos |
| `https://www.googleapis.com/auth/youtube.force-ssl` | Edit/delete videos, ratings, comments, captions |
| `https://www.googleapis.com/auth/youtube.channel-memberships.creator` | View channel membership info |
| `https://www.googleapis.com/auth/youtubepartner` | Manage YouTube assets |
| `https://www.googleapis.com/auth/youtubepartner-channel-audit` | Audit information access |

## Step 1: Redirect to Google's OAuth 2.0 Server

### Endpoint
`https://accounts.google.com/o/oauth2/v2/auth` (HTTPS only)

### Required Parameters

| Parameter | Purpose |
|-----------|---------|
| `client_id` | Your application identifier from Cloud Console |
| `redirect_uri` | Where Google redirects after authorization (must match registered URI exactly) |
| `response_type` | Set to `token` for implicit flow |
| `scope` | Space-delimited list of requested permissions |

### Recommended Parameters

**`state`** (Recommended): Maintains state between request and response, preventing CSRF attacks. The server returns the exact value you send.

**`include_granted_scopes`** (Optional): Set to `true` for incremental authorization, covering previously granted scopes.

### Sample Authorization URL

```
https://accounts.google.com/o/oauth2/v2/auth?
 scope=https%3A%2F%2Fwww.googleapis.com%2Fauth%2Fyoutube.readonly&
 include_granted_scopes=true&
 state=state_parameter_passthrough_value&
 redirect_uri=http%3A%2F%2Flocalhost%2Foauth2callback&
 response_type=token&
 client_id=client_id
```

### JavaScript Implementation

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
    'include_granted_scopes': 'true',
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

## Step 2: User Consent

Google displays a consent screen showing your application name and requested scopes. Users can grant or deny access to one or more requested permissions.

### Common Authorization Errors

| Error | Resolution |
|-------|-----------|
| `admin_policy_enforced` | Google Workspace admin restricted scope access |
| `disallowed_useragent` | Embedded browser violates OAuth policies (use native SDKs instead) |
| `origin_mismatch` | JavaScript origin doesn't match registered URI |
| `redirect_uri_mismatch` | Redirect URI doesn't exactly match registered value |
| `invalid_client` | Origin not authorized for this client |
| `invalid_grant` | Token expired or invalidated (re-authenticate) |

## Step 3: Handle OAuth Response

Google redirects to your `redirect_uri` with the response in the URL fragment (`#`).

### Success Response
```
https://oauth2.example.com/callback#
 access_token=4/P7q7W91&
 token_type=Bearer&
 expires_in=3600&
 state=state_parameter_passthrough_value
```

### Error Response
```
https://oauth2.example.com/callback#error=access_denied
```

**Critical:** Verify the returned `state` parameter matches your original request to prevent CSRF attacks.

## Step 4: Verify Granted Scopes

When requesting multiple scopes, users may grant partial access. Check the `scope` field in the response to determine which permissions were actually granted:

```javascript
var params = JSON.parse(localStorage.getItem('oauth2-test-params'));
if (params.hasOwnProperty('scope')) {
  var scopes = params['scope'].split(' ');
  for (var s = 0; s < scopes.length; s++) {
    if (SCOPE == scopes[s]) {
      current_scope_granted = true;
    }
  }
}
```

## Calling Google APIs

### Using the Access Token

Include the token via HTTP header (preferred) or query parameter:

**HTTP Header (Preferred):**
```
GET /youtube/v3/channels?part=snippet&mine=true HTTP/1.1
Host: www.googleapis.com
Authorization: Bearer access_token
```

**Query Parameter:**
```
GET https://www.googleapis.com/youtube/v3/channels?
 access_token=access_token&
 part=snippet&
 mine=true
```

### JavaScript Example with CORS

```javascript
var xhr = new XMLHttpRequest();
xhr.open('GET',
    'https://www.googleapis.com/youtube/v3/channels?part=snippet&mine=true&' +
    'access_token=' + params['access_token']);
xhr.onreadystatechange = function (e) {
  if (xhr.readyState === 4 && xhr.status === 200) {
    console.log(xhr.response);
  } else if (xhr.readyState === 4 && xhr.status === 401) {
    oauth2SignIn(); // Re-authenticate if token invalid
  }
};
xhr.send(null);
```

### cURL Examples

```bash
# Using Authorization header (recommended)
curl -H "Authorization: Bearer access_token" \
  https://www.googleapis.com/youtube/v3/channels?part=snippet&mine=true

# Using query parameter
curl https://www.googleapis.com/youtube/v3/channels?
 access_token=access_token&part=snippet&mine=true
```

## Complete Implementation Example

```html
<html>
<head></head>
<body>
<script>
  var YOUR_CLIENT_ID = 'REPLACE_THIS_VALUE';
  var YOUR_REDIRECT_URI = 'REPLACE_THIS_VALUE';

  // Parse hash fragment for OAuth response
  var fragmentString = location.hash.substring(1);
  var params = {};
  var regex = /([^&=]+)=([^&]*)/g, m;
  while (m = regex.exec(fragmentString)) {
    params[decodeURIComponent(m[1])] = decodeURIComponent(m[2]);
  }

  // Verify state parameter matches (CSRF protection)
  if (Object.keys(params).length > 0 && params['state']) {
    if (params['state'] == localStorage.getItem('state')) {
      localStorage.setItem('oauth2-test-params', JSON.stringify(params));
      trySampleRequest();
    } else {
      console.log('State mismatch. Possible CSRF attack');
    }
  }

  // Generate cryptographically secure random state
  function generateCryptoRandomState() {
    const randomValues = new Uint32Array(2);
    window.crypto.getRandomValues(randomValues);
    const utf8Encoder = new TextEncoder();
    const utf8Array = utf8Encoder.encode(
      String.fromCharCode.apply(null, randomValues)
    );
    return btoa(String.fromCharCode.apply(null, utf8Array))
      .replace(/\+/g, '-')
      .replace(/\//g, '_')
      .replace(/=+$/, '');
  }

  // Execute API request if token available
  function trySampleRequest() {
    var params = JSON.parse(localStorage.getItem('oauth2-test-params'));
    if (params && params['access_token']) {
      var xhr = new XMLHttpRequest();
      xhr.open('GET',
          'https://www.googleapis.com/youtube/v3/channels?part=snippet&mine=true&' +
          'access_token=' + params['access_token']);
      xhr.onreadystatechange = function (e) {
        if (xhr.readyState === 4 && xhr.status === 200) {
          console.log(xhr.response);
        } else if (xhr.readyState === 4 && xhr.status === 401) {
          oauth2SignIn();
        }
      };
      xhr.send(null);
    } else {
      oauth2SignIn();
    }
  }

  // Initiate OAuth 2.0 flow
  function oauth2SignIn() {
    var state = generateCryptoRandomState();
    localStorage.setItem('state', state);

    var oauth2Endpoint = 'https://accounts.google.com/o/oauth2/v2/auth';
    var form = document.createElement('form');
    form.setAttribute('method', 'GET');
    form.setAttribute('action', oauth2Endpoint);

    var params = {
      'client_id': YOUR_CLIENT_ID,
      'redirect_uri': YOUR_REDIRECT_URI,
      'scope': 'https://www.googleapis.com/auth/youtube.force-ssl',
      'state': state,
      'include_granted_scopes': 'true',
      'response_type': 'token'
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
</script>

<button onclick="trySampleRequest();">Try sample request</button>
</body>
</html>
```

## Incremental Authorization

Request additional scopes on-demand to improve user experience. When users grant new scopes with `include_granted_scopes=true`, the new token covers all previously granted scopes plus the new ones.

### Implementation Pattern

```javascript
var SCOPE = 'https://www.googleapis.com/auth/youtube.force-ssl';
var params = JSON.parse(localStorage.getItem('oauth2-test-params'));

var current_scope_granted = false;
if (params.hasOwnProperty('scope')) {
  var scopes = params['scope'].split(' ');
  for (var s = 0; s < scopes.length; s++) {
    if (SCOPE == scopes[s]) {
      current_scope_granted = true;
    }
  }
}

if (!current_scope_granted) {
  oauth2SignIn(); // Request additional scope
} else {
  // Proceed with API request
}
```

## Token Revocation

### User-Initiated Revocation
Users can revoke access via [Account Settings](https://myaccount.google.com/permissions).

### Programmatic Revocation

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

**cURL Example:**
```bash
curl -d -X -POST --header "Content-type:application/x-www-form-urlencoded" \
  https://oauth2.googleapis.com/revoke?token={token}
```

**Response:** HTTP 200 indicates success; HTTP 400 indicates error.

**Note:** "Following a successful revocation response, it might take some time before the revocation has full effect."

## JavaScript Origin Validation Rules

Registered origins must comply with:
- **Scheme:** HTTPS required (except localhost)
- **Host:** No raw IP addresses (localhost excepted)
- **Domain:** Must use valid public suffix list TLDs; no `googleusercontent.com`
- **Components:** No userinfo, path, query, or fragment
- **Characters:** No wildcards, non-printable characters, invalid percent-encoding, or null characters

## Security Best Practices

1. **Always use HTTPS** for non-localhost origins
2. **Store tokens securely** in browser local storage
3. **Use `state` parameter** for all requests to prevent CSRF
4. **Verify `state` matches** between request and response
5. **Use Google Identity Services library** instead of direct OAuth 2.0 endpoint interaction for production applications
6. **Request only necessary scopes** to increase user consent likelihood
7. **Handle partial scope grants** gracefully by disabling features requiring denied permissions
8. **Implement Cross-Account Protection** to monitor account security events
