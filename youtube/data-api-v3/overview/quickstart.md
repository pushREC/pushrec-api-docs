---
source: https://developers.google.com/youtube/v3/quickstart/python
scraped: 2026-01-07
method: bright_data
api: youtube-data-v3
category: overview
---

# Python Quickstart for YouTube Data API

## Overview

This guide explains how to create a Python command-line application that interacts with the YouTube Data API. The tutorial covers two key scenarios: using an API key for public data retrieval and using OAuth 2.0 credentials for authorized requests.

## Prerequisites

To complete this quickstart, you'll need:

- Python 2.7 or Python 3.5 or later
- The `pip` package management tool
- Google APIs Client Library for Python: `pip install --upgrade google-api-python-client`
- Authorization libraries: `pip install --upgrade google-auth-oauthlib google-auth-httplib2`

## Step 1: Set Up Your Project and Credentials

Complete these tasks in the [API Console](https://console.cloud.google.com/):

### 1. Enable the YouTube Data API v3
- Search for "YouTube Data API v3" in the library panel
- Ensure it's enabled for your project

### 2. Create Two Types of Credentials

#### API Key
- Use this for requests that don't require user authorization
- Suitable for accessing public YouTube channel information

#### OAuth 2.0 Client ID
- Set application type to "Other"
- Required for requests needing user authorization
- Download the JSON credentials file (named `client_secret_CLIENTID.json`)

## Step 2: Retrieve Public Channel Information

This example demonstrates retrieving data about the GoogleDevelopers channel using an API key:

1. Access the channels.list method documentation
2. Use the APIs Explorer to locate the first use case example
3. Select the Python tab in the fullscreen explorer
4. Copy the provided code sample and save it as `example.py`
5. Replace `YOUR_API_KEY` with your actual API key
6. Execute: `python example.py`
7. The response will display in your terminal

### Example Code: Public Data Request

```python
from googleapiclient.discovery import build

# Create the API client
youtube = build('youtube', 'v3', developerKey='YOUR_API_KEY')

# Request channel information
request = youtube.channels().list(
    part='snippet,statistics',
    id='UC_x5XG1OV2P6uZZ5FSM9Ttw'  # GoogleDevelopers channel
)
response = request.execute()

# Print channel info
channel = response['items'][0]
print(f"Channel: {channel['snippet']['title']}")
print(f"Subscribers: {channel['statistics']['subscriberCount']}")
```

## Step 3: Make an Authorized Request

To retrieve information about your own YouTube channel:

1. Return to the channels.list documentation
2. Find the third use case example ("my channel")
3. Note the changes in the APIs Explorer:
   - Parameter: `mine` is set to `true`
   - Credentials: Select "Google OAuth 2.0"
   - Required scope: `https://www.googleapis.com/auth/youtube.readonly`
4. Copy the Python code sample and save as `example.py`
5. Replace `YOUR_CLIENT_SECRET_FILE.json` with your credentials file path
6. Run: `python example.py`
7. Copy the authorization URL into your browser
8. Grant the requested permissions
9. Return the auth code to your terminal

### Example Code: Authorized Request

```python
import os
from google_auth_oauthlib.flow import InstalledAppFlow
from googleapiclient.discovery import build

# OAuth 2.0 scopes
SCOPES = ['https://www.googleapis.com/auth/youtube.readonly']

def get_authenticated_service():
    flow = InstalledAppFlow.from_client_secrets_file(
        'client_secret.json', SCOPES)
    credentials = flow.run_local_server(port=0)
    return build('youtube', 'v3', credentials=credentials)

# Get authenticated client
youtube = get_authenticated_service()

# Request your channel info
request = youtube.channels().list(
    part='snippet,statistics',
    mine=True
)
response = request.execute()

# Print your channel info
if response['items']:
    channel = response['items'][0]
    print(f"Your Channel: {channel['snippet']['title']}")
```

## Common OAuth 2.0 Scopes

| Scope | Description |
|-------|-------------|
| `youtube.readonly` | View YouTube account |
| `youtube` | Manage YouTube account |
| `youtube.upload` | Upload videos |
| `youtube.force-ssl` | View and manage YouTube videos (requires SSL) |
| `youtubepartner` | View and manage YouTube assets (partners only) |

## Additional Resources

- [Google Developers Console help](https://console.cloud.google.com/)
- [Python client library documentation](https://github.com/googleapis/google-api-python-client)
- [YouTube Data API reference](https://developers.google.com/youtube/v3/docs)
- [OAuth 2.0 for Python](https://developers.google.com/identity/protocols/oauth2)

## Troubleshooting

### API Key Not Working
- Ensure the API is enabled in Google Cloud Console
- Check that the key has no IP restrictions blocking your requests
- Verify the key is correctly copied without extra spaces

### OAuth Errors
- Ensure redirect URIs are configured in Google Cloud Console
- Check that the client secret file path is correct
- Verify the required scopes are enabled for your project

### Quota Exceeded
- Default quota is 10,000 units per day
- Search requests cost 100 units each
- Request quota increase through Google Cloud Console
