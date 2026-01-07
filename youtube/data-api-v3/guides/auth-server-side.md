---
source: https://developers.google.com/youtube/v3/guides/auth/server-side-web-apps
scraped: 2026-01-07
method: webfetch
api: youtube-data-v3
category: guides
---

# OAuth 2.0 for Web Server Applications - Complete Guide

## Overview

OAuth 2.0 enables server-side web applications to securely access YouTube Data API and other Google APIs without exposing user credentials. The flow allows users to grant specific permissions (scopes) while keeping sensitive information private.

## Prerequisites

### Enable APIs
1. Open the [API Library](https://console.developers.google.com/apis/library) in Google API Console
2. Select or create a project
3. Find and enable the YouTube Data API

### Create Authorization Credentials
1. Go to the [Clients page](https://console.developers.google.com/auth/clients)
2. Click "Create Client"
3. Select "Web application"
4. Specify authorized redirect URIs (must use HTTPS except for localhost)
5. Download the `client_secret.json` file and store it securely

**Critical Security Note:** "Do not store the client_secret.json file in a publicly-accessible location."

## Available Scopes

| Scope | Permission |
|-------|-----------|
| `https://www.googleapis.com/auth/youtube` | Manage YouTube account |
| `https://www.googleapis.com/auth/youtube.force-ssl` | Edit/delete videos, ratings, comments, captions |
| `https://www.googleapis.com/auth/youtube.readonly` | View YouTube account |
| `https://www.googleapis.com/auth/youtube.upload` | Manage YouTube videos |
| `https://www.googleapis.com/auth/youtube.channel-memberships.creator` | See active channel members |
| `https://www.googleapis.com/auth/youtubepartner` | Manage assets and content |

## OAuth 2.0 Flow Steps

### Step 1: Set Authorization Parameters

**PHP Implementation:**
```php
use Google\Client;

$client = new Client();
$client->setAuthConfig('client_secret.json');
$client->addScope(Google_Service_YouTube::YOUTUBE_FORCE_SSL);
$client->setRedirectUri('http://' . $_SERVER['HTTP_HOST'] . '/oauth2callback.php');
$client->setAccessType('offline');
$state = bin2hex(random_bytes(16));
$client->setState($state);
$client->setIncludeGrantedScopes(true);
$client->setLoginHint('hint@example.com');
$client->setPrompt('consent');
```

**Python Implementation:**
```python
import google_auth_oauthlib.flow

flow = google_auth_oauthlib.flow.Flow.from_client_secrets_file(
    'client_secret.json',
    scopes=['https://www.googleapis.com/auth/youtube.force-ssl'])

flow.redirect_uri = 'https://www.example.com/oauth2callback'

authorization_url, state = flow.authorization_url(
    access_type='offline',
    include_granted_scopes='true',
    login_hint='hint@example.com',
    prompt='consent')
```

**Ruby Implementation:**
```ruby
require 'googleauth'
require 'google/apis/youtube_v3'

client_id = Google::Auth::ClientId.from_file('/path/to/client_secret.json')
scope = 'https://www.googleapis.com/auth/youtube.force-ssl'
token_store = Google::Auth::Stores::RedisTokenStore.new(redis: Redis.new)
callback_uri = '/oauth2callback'

authorizer = Google::Auth::WebUserAuthorizer.new(
    client_id, scope, token_store, callback_uri)
```

**Node.js Implementation:**
```javascript
const {google} = require('googleapis');
const crypto = require('crypto');

const oauth2Client = new google.auth.OAuth2(
    YOUR_CLIENT_ID,
    YOUR_CLIENT_SECRET,
    YOUR_REDIRECT_URL);

const scopes = ['https://www.googleapis.com/auth/youtube.force-ssl'];
const state = crypto.randomBytes(32).toString('hex');
req.session.state = state;

const authorizationUrl = oauth2Client.generateAuthUrl({
    access_type: 'offline',
    scope: scopes,
    include_granted_scopes: true,
    state: state
});
```

**HTTP/REST Parameters:**

```
https://accounts.google.com/o/oauth2/v2/auth?
  client_id=YOUR_CLIENT_ID
  &redirect_uri=http%3A%2F%2Flocalhost%2Foauth2callback
  &response_type=code
  &scope=https%3A%2F%2Fwww.googleapis.com%2Fauth%2Fyoutube.force-ssl
  &access_type=offline
  &include_granted_scopes=true
  &state=state_parameter_value
```

### Step 2: Redirect to Google's OAuth 2.0 Server

**PHP:**
```php
$auth_url = $client->createAuthUrl();
header('Location: ' . filter_var($auth_url, FILTER_SANITIZE_URL));
```

**Python (Flask):**
```python
return flask.redirect(authorization_url)
```

**Ruby:**
```ruby
auth_uri = authorizer.get_authorization_url(request: request)
redirect auth_uri
```

**Node.js:**
```javascript
res.redirect(authorizationUrl);
```

### Step 3: User Consent

Google displays a consent screen showing the application name and requested scopes. Users can approve or deny access.

#### Common Error Responses

| Error | Resolution |
|-------|-----------|
| `redirect_uri_mismatch` | Verify redirect URI matches configuration exactly |
| `invalid_client` | Check OAuth client secret |
| `admin_policy_enforced` | Google Workspace admin restrictions apply |
| `disallowed_useragent` | Use native libraries instead of embedded browsers |
| `deleted_client` | Client was deleted; restore within 30 days |
| `invalid_grant` | Token expired or invalid; re-authenticate user |

### Step 4: Handle OAuth Response

**Important:** "Before handling the OAuth 2.0 response on the server, you should confirm that the state received from Google matches the state sent in the authorization request."

Authorization code response:
```
https://oauth2.example.com/auth?code=4/P7q7W91a-oMsCeLvIaQm6bTrgtp7
```

Error response:
```
https://oauth2.example.com/auth?error=access_denied
```

### Step 5: Exchange Authorization Code for Tokens

**PHP:**
```php
$access_token = $client->fetchAccessTokenWithAuthCode($_GET['code']);
```

**Python:**
```python
state = flask.session['state']
flow = google_auth_oauthlib.flow.Flow.from_client_secrets_file(
    'client_secret.json',
    scopes=['https://www.googleapis.com/auth/youtube.force-ssl'],
    state=state)
flow.redirect_uri = flask.url_for('oauth2callback', _external=True)
authorization_response = flask.request.url
flow.fetch_token(authorization_response=authorization_response)

credentials = flow.credentials
flask.session['credentials'] = {
    'token': credentials.token,
    'refresh_token': credentials.refresh_token,
    'granted_scopes': credentials.granted_scopes}
```

**Ruby:**
```ruby
target_url = Google::Auth::WebUserAuthorizer.handle_auth_callback_deferred(request)
redirect target_url
```

**Node.js:**
```javascript
app.get('/oauth2callback', async (req, res) => {
    let q = url.parse(req.url, true).query;

    if (q.error) {
        console.log('Error:' + q.error);
    } else if (q.state !== req.session.state) {
        console.log('State mismatch. Possible CSRF attack');
        res.end('State mismatch. Possible CSRF attack');
    } else {
        let { tokens } = await oauth2Client.getToken(q.code);
        oauth2Client.setCredentials(tokens);
    }
});
```

**HTTP/REST:**
```
POST /token HTTP/1.1
Host: oauth2.googleapis.com
Content-Type: application/x-www-form-urlencoded

code=4/P7q7W91a-oMsCeLvIaQm6bTrgtp7&
client_id=your_client_id&
redirect_uri=https%3A//developers.google.com/oauthplayground&
grant_type=authorization_code&
client_secret=your_client_secret
```

**Token Response:**
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

**PHP:**
```php
$granted_scopes = $client->getOAuth2Service()->getGrantedScope();
```

**Python:**
```python
credentials = flow.credentials
granted_scopes = credentials.granted_scopes
```

**Ruby:**
```ruby
if credentials.scope.include?(Google::Apis::YoutubeV3::AUTH_YOUTUBE_FORCE_SSL)
  # Proceed with authorized operations
else
  # Update UX for unauthorized scopes
end
```

**Node.js:**
```javascript
if (tokens.scope.includes('https://www.googleapis.com/auth/youtube.force-ssl')) {
    // User authorized permission
} else {
    // User denied permission
}
```

## Making API Calls

**PHP:**
```php
$client->setAccessToken($access_token);
$youtube = new Google_Service_YouTube($client);
$channel = $youtube->channels->listChannels('snippet', array('mine' => true));
echo json_encode($channel);
```

**Python:**
```python
from googleapiclient.discovery import build

youtube = build('youtube', 'v3', credentials=credentials)
channel = youtube.channels().list(mine=True, part='snippet').execute()
```

**Ruby:**
```ruby
youtube = Google::Apis::YoutubeV3::YouTubeService.new
youtube.authorization = credentials
channel = youtube.list_channels(part, :mine => true)
```

**Node.js:**
```javascript
var service = google.youtube('v3');
service.channels.list({
    auth: oauth2Client,
    part: 'snippet,contentDetails,statistics',
    forUsername: 'GoogleDevelopers'
}, function (err, response) {
    if (err) {
        console.log('The API returned an error: ' + err);
        return;
    }
    var channels = response.data.items;
});
```

**HTTP/REST (with Authorization header):**
```bash
curl -H "Authorization: Bearer access_token" \
  https://www.googleapis.com/youtube/v3/channels?part=snippet&mine=true
```

## Offline Access and Token Refresh

When `access_type=offline` is set, Google returns both an access token and refresh token. Access tokens expire, but refresh tokens enable obtaining new access tokens without user interaction.

**PHP:**
```php
$client->setAccessType("offline");
// Client automatically refreshes tokens when needed
```

**Python:**
```python
authorization_url, state = flow.authorization_url(
    access_type='offline',
    include_granted_scopes='true')
```

**Ruby:**
```ruby
auth_client.update!(
    :additional_parameters => {"access_type" => "offline"}
)
```

**Node.js:**
```javascript
const authorizationUrl = oauth2Client.generateAuthUrl({
    access_type: 'offline',
    scope: scopes,
    include_granted_scopes: true
});

oauth2Client.on('tokens', (tokens) => {
    if (tokens.refresh_token) {
        console.log(tokens.refresh_token);
    }
    console.log(tokens.access_token);
});

oauth2Client.setCredentials({
    refresh_token: `STORED_REFRESH_TOKEN`
});
```

**HTTP/REST Token Refresh:**
```
POST /token HTTP/1.1
Host: oauth2.googleapis.com
Content-Type: application/x-www-form-urlencoded

client_id=your_client_id&
client_secret=your_client_secret&
grant_type=refresh_token&
refresh_token=refresh_token
```

Refresh Response:
```json
{
  "access_token": "1/fFAGRNJru1FTz70BzhT3Zg",
  "expires_in": 3920,
  "scope": "https://www.googleapis.com/auth/drive.metadata.readonly",
  "token_type": "Bearer"
}
```

## Token Revocation

Users can revoke access through [Account Settings](https://myaccount.google.com/permissions), or applications can revoke programmatically.

**PHP:**
```php
$client->revokeToken();
```

**Python:**
```python
requests.post('https://oauth2.googleapis.com/revoke',
    params={'token': credentials.token},
    headers={'content-type': 'application/x-www-form-urlencoded'})
```

**Ruby:**
```ruby
uri = URI('https://oauth2.googleapis.com/revoke')
response = Net::HTTP.post_form(uri, 'token' => auth_client.access_token)
```

**Node.js:**
```javascript
const https = require('https');

let postData = "token=" + userCredential.access_token;

let postOptions = {
    host: 'oauth2.googleapis.com',
    port: '443',
    path: '/revoke',
    method: 'POST',
    headers: {
        'Content-Type': 'application/x-www-form-urlencoded',
        'Content-Length': Buffer.byteLength(postData)
    }
};

const postReq = https.request(postOptions, function (res) {
    res.setEncoding('utf8');
    res.on('data', d => {
        console.log('Response: ' + d);
    });
});

postReq.write(postData);
postReq.end();
```

**HTTP/REST:**
```bash
curl -X POST --header "Content-type:application/x-www-form-urlencoded" \
    https://oauth2.googleapis.com/revoke?token={token}
```

**Key Point:** "Revocation removes all OAuth 2.0 scopes previously granted to a project, invalidating any issued access or refresh tokens for all clients registered under that project."

## Incremental Authorization

Request scopes contextually rather than all at once. When users grant new scopes, the combined authorization includes all previously granted scopes.

**Implementation adds `include_granted_scopes=true` parameter (shown in Step 1 examples above).**

## Redirect URI Validation Rules

URIs must adhere to these validation standards:

- **Scheme:** HTTPS required (localhost HTTP exempt)
- **Host:** No raw IP addresses (localhost IP exempt)
- **Domain:** TLD must be on public suffix list; cannot be `googleusercontent.com`
- **Userinfo:** Not allowed
- **Path:** Cannot contain `/..", `\..", or traversal encoding
- **Query:** Cannot contain open redirects
- **Fragment:** Not allowed
- **Characters:** No wildcards, non-printable ASCII, invalid percent encoding, or null characters

## Complete Implementation Examples

### Python (Flask) Full Example

```python
import os
import flask
import json
import requests
import google.oauth2.credentials
import google_auth_oauthlib.flow
import googleapiclient.discovery

CLIENT_SECRETS_FILE = "client_secret.json"
SCOPES = ['https://www.googleapis.com/auth/youtube.force-ssl']
API_SERVICE_NAME = 'youtube'
API_VERSION = 'v3'

app = flask.Flask(__name__)
app.secret_key = 'REPLACE_WITH_SECRET_KEY'

@app.route('/')
def index():
    return print_index_table()

@app.route('/test')
def test_api_request():
    if 'credentials' not in flask.session:
        return flask.redirect('authorize')

    credentials = google.oauth2.credentials.Credentials(
        **flask.session['credentials'])

    youtube = googleapiclient.discovery.build(
        API_SERVICE_NAME, API_VERSION, credentials=credentials)

    channel = youtube.channels().list(mine=True, part='snippet').execute()

    flask.session['credentials'] = credentials_to_dict(credentials)

    return flask.jsonify(**channel)

@app.route('/authorize')
def authorize():
    flow = google_auth_oauthlib.flow.Flow.from_client_secrets_file(
        CLIENT_SECRETS_FILE, scopes=SCOPES)

    flow.redirect_uri = flask.url_for('oauth2callback', _external=True)

    authorization_url, state = flow.authorization_url(
        access_type='offline',
        include_granted_scopes='true')

    flask.session['state'] = state

    return flask.redirect(authorization_url)

@app.route('/oauth2callback')
def oauth2callback():
    state = flask.session['state']

    flow = google_auth_oauthlib.flow.Flow.from_client_secrets_file(
        CLIENT_SECRETS_FILE, scopes=SCOPES, state=state)
    flow.redirect_uri = flask.url_for('oauth2callback', _external=True)

    authorization_response = flask.request.url
    flow.fetch_token(authorization_response=authorization_response)

    credentials = flow.credentials
    flask.session['credentials'] = credentials_to_dict(credentials)

    return flask.redirect(flask.url_for('test_api_request'))

@app.route('/revoke')
def revoke():
    if 'credentials' not in flask.session:
        return 'You need to authorize before testing revoke.'

    with open(CLIENT_SECRETS_FILE, 'r') as f:
        client_config = json.load(f)['web']

    session_credentials = flask.session['credentials']

    credentials = google.oauth2.credentials.Credentials(
        refresh_token=session_credentials.get('refresh_token'),
        scopes=session_credentials.get('granted_scopes'),
        token=session_credentials.get('token'),
        client_id=client_config.get('client_id'),
        client_secret=client_config.get('client_secret'),
        token_uri=client_config.get('token_uri'))

    revoke = requests.post('https://oauth2.googleapis.com/revoke',
        params={'token': credentials.token},
        headers={'content-type': 'application/x-www-form-urlencoded'})

    status_code = getattr(revoke, 'status_code')
    if status_code == 200:
        if 'credentials' in flask.session:
            del flask.session['credentials']
        return 'Credentials successfully revoked.'
    else:
        return 'An error occurred.'

@app.route('/clear')
def clear_credentials():
    if 'credentials' in flask.session:
        del flask.session['credentials']
    return 'Credentials have been cleared.'

def credentials_to_dict(credentials):
    return {'token': credentials.token,
            'refresh_token': credentials.refresh_token,
            'granted_scopes': credentials.granted_scopes}

if __name__ == '__main__':
    os.environ['OAUTHLIB_INSECURE_TRANSPORT'] = '1'
    os.environ['OAUTHLIB_RELAX_TOKEN_SCOPE'] = '1'
    app.run('localhost', 8080, debug=True)
```

### PHP Full Example

**index.php:**
```php
<?php
require_once __DIR__.'/vendor/autoload.php';

session_start();

$client = new Google\Client();
$client->setAuthConfig('client_secret.json');

if (isset($_SESSION['access_token']) && $_SESSION['access_token']) {
    $client->setAccessToken($_SESSION['access_token']);

    $youtube = new Google_Service_YouTube($client);
    $channel = $youtube->channels->listChannels('snippet', array('mine' => true));
    echo json_encode($channel);
} else {
    $redirect_uri = 'http://' . $_SERVER['HTTP_HOST'] . '/oauth2callback.php';
    header('Location: ' . filter_var($redirect_uri, FILTER_SANITIZE_URL));
}
?>
```

**oauth2callback.php:**
```php
<?php
require_once __DIR__.'/vendor/autoload.php';

session_start();

$client = new Google\Client();
$client->setAuthConfig('client_secret.json');
$client->setRedirectUri('http://' . $_SERVER['HTTP_HOST']. $_SERVER['PHP_SELF']);
$client->addScope(Google_Service_YouTube::YOUTUBE_FORCE_SSL);
$client->setIncludeGrantedScopes(true);
$client->setAccessType("offline");

if (!isset($_GET['code']) && !isset($_GET['error'])) {
    $state = bin2hex(random_bytes(16));
    $client->setState($state);
    $_SESSION['state'] = $state;

    $auth_url = $client->createAuthUrl();
    header('Location: ' . filter_var($auth_url, FILTER_SANITIZE_URL));
}

if (isset($_GET['code'])) {
    if (!isset($_GET['state']) || $_GET['state'] !== $_SESSION['state']) {
        die('State mismatch. Possible CSRF attack.');
    }

    $token = $client->fetchAccessTokenWithAuthCode($_GET['code']);
    $_SESSION['access_token'] = $token;
    $_SESSION['refresh_token'] = $client->getRefreshToken();

    $redirect_uri = 'http://' . $_SERVER['HTTP_HOST'] . '/';
    header('Location: ' . filter_var($redirect_uri, FILTER_SANITIZE_URL));
}

if (isset($_GET['error'])) {
    echo "Error: ". $_GET['error'];
}
?>
```

### Node.js Full Example

```javascript
const http = require('http');
const https = require('https');
const url = require('url');
const { google } = require('googleapis');
const crypto = require('crypto');
const express = require('express');
const session = require('express-session');

const oauth2Client = new google.auth.OAuth2(
    YOUR_CLIENT_ID,
    YOUR_CLIENT_SECRET,
    YOUR_REDIRECT_URL);

const scopes = ['https://www.googleapis.com/auth/youtube.force-ssl'];
let userCredential = null;

async function main() {
    const app = express();

    app.use(session({
        secret: 'your_secure_secret_key',
        resave: false,
        saveUninitialized: false,
    }));

    app.get('/', async (req, res) => {
        const state = crypto.randomBytes(32).toString('hex');
        req.session.state = state;

        const authorizationUrl = oauth2Client.generateAuthUrl({
            access_type: 'offline',
            scope: scopes,
            include_granted_scopes: true,
            state: state
        });

        res.redirect(authorizationUrl);
    });

    app.get('/oauth2callback', async (req, res) => {
        let q = url.parse(req.url, true).query;

        if (q.error) {
            console.log('Error:' + q.error);
        } else if (q.state !== req.session.state) {
            console.log('State mismatch. Possible CSRF attack');
            res.end('State mismatch. Possible CSRF attack');
        } else {
            let { tokens } = await oauth2Client.getToken(q.code);
            oauth2Client.setCredentials(tokens);
            userCredential = tokens;

            var service = google.youtube('v3');
            service.channels.list({
                auth: oauth2Client,
                part: 'snippet,contentDetails,statistics',
                forUsername: 'GoogleDevelopers'
            }, function (err, response) {
                if (err) {
                    console.log('The API returned an error: ' + err);
                    return;
                }
                var channels = response.data.items;
                if (channels.length == 0) {
                    console.log('No channel found.');
                } else {
                    console.log('Channel ID: %s, Title: %s, Views: %s',
                        channels[0].id,
                        channels[0].snippet.title,
                        channels[0].statistics.viewCount);
                }
            });
        }
    });

    app.get('/revoke', async (req, res) => {
        let postData = "token=" + userCredential.access_token;

        let postOptions = {
            host: 'oauth2.googleapis.com',
            port: '443',
            path: '/revoke',
            method: 'POST',
            headers: {
                'Content-Type': 'application/x-www-form-urlencoded',
                'Content-Length': Buffer.byteLength(postData)
            }
        };

        const postReq = https.request(postOptions, function (res) {
            res.setEncoding('utf8');
            res.on('data', d => {
                console.log('Response: ' + d);
            });
        });

        postReq.on('error', error => {
            console.log(error)
        });

        postReq.write(postData);
        postReq.end();
    });

    const server = http.createServer(app);
    server.listen(8080);
}

main().catch(console.error);
```

## Language-Specific Requirements

### PHP
- PHP 8.0+ with CLI and JSON extension
- Composer dependency manager
- `composer require google/apiclient:^2.15.0`

### Python
- Python 3.7+
- pip package manager
- `pip install --upgrade google-api-python-client google-auth google-auth-oauthlib google-auth-httplib2 flask requests`

### Ruby
- Ruby 2.6+
- `gem install googleauth sinatra`

### Node.js
- Maintenance LTS, active LTS, or current release
- `npm install googleapis crypto express express-session`

## Security Best Practices

1. **State Parameter:** "Using a state value can increase your assurance that an incoming connection is the result of an authentication request."

2. **CSRF Protection:** Always validate that returned state matches the state sent in the authorization request

3. **Secure Storage:** Store refresh tokens in secure, long-term persistent storage on the backend server

4. **HTTPS:** Use HTTPS for all OAuth interactions except localhost testing

5. **Client Secret:** Never expose `client_secret` in client-side code or public repositories

6. **Redirect URI Validation:** Carefully validate all redirect URIs to prevent open redirects

7. **Cross-Account Protection:** Consider implementing "Google's Cross-Account Protection Service" to subscribe to security events and protect user accounts

8. **Scope Minimization:** Request only the scopes your application actually needs

## Client Libraries

Google provides OAuth 2.0 client libraries for:
- Go
- Java
- .NET
- Node.js
- Dart
- PHP
- Python
- Ruby

"It is a best practice to use well-debugged code provided by others, and it will help you protect yourself and your users."
