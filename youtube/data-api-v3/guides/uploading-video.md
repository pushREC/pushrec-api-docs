---
source: https://developers.google.com/youtube/v3/guides/uploading_a_video
scraped: 2026-01-07
method: webfetch
api: youtube-data-v3
category: guides
---

# YouTube Video Upload Guide

## Overview

This guide covers uploading videos to YouTube using the YouTube Data API. The implementation uses resumable uploads with exponential backoff retry logic.

## Requirements

- Python 2.5 or higher
- Google APIs Client Library for Python
- OAuth 2.0 registration and credentials
- `client_secrets.json` file with authentication details

## Command-Line Parameters

| Argument | Required | Default | Description |
|----------|----------|---------|-------------|
| `--file` | Yes | - | Video file location |
| `--title` | No | "Test Title" | Video title |
| `--description` | No | "Test Description" | Video description |
| `--category` | No | "22" | Category ID (22 = People & Blogs) |
| `--keywords` | No | - | Comma-separated tags |
| `--privacyStatus` | No | - | "public", "private", or "unlisted" |

## Video Metadata Structure

The API constructs a video resource with:
- **snippet**: title, description, tags, categoryId
- **status**: privacyStatus

## Privacy Status Options

| Status | Description |
|--------|-------------|
| `public` | Visible to everyone |
| `private` | Only visible to uploader |
| `unlisted` | Accessible via direct link only |

## Video Categories

Common category IDs:
- 1 - Film & Animation
- 2 - Autos & Vehicles
- 10 - Music
- 15 - Pets & Animals
- 17 - Sports
- 20 - Gaming
- 22 - People & Blogs
- 23 - Comedy
- 24 - Entertainment
- 25 - News & Politics
- 26 - Howto & Style
- 27 - Education
- 28 - Science & Technology

## Complete Python Implementation

```python
#!/usr/bin/python

import httplib
import httplib2
import os
import random
import sys
import time

from apiclient.discovery import build
from apiclient.errors import HttpError
from apiclient.http import MediaFileUpload
from oauth2client.client import flow_from_clientsecrets
from oauth2client.file import Storage
from oauth2client.tools import argparser, run_flow

# Explicitly tell the underlying HTTP transport library not to retry, since
# we are handling retry logic ourselves.
httplib2.RETRIES = 1

# Maximum number of times to retry before giving up.
MAX_RETRIES = 10

# Always retry when these exceptions are raised.
RETRIABLE_EXCEPTIONS = (httplib2.HttpLib2Error, IOError, httplib.NotConnected,
  httplib.IncompleteRead, httplib.ImproperConnectionState,
  httplib.CannotSendRequest, httplib.CannotSendHeader,
  httplib.ResponseNotReady, httplib.BadStatusLine)

# Always retry when an apiclient.errors.HttpError with one of these status
# codes is raised.
RETRIABLE_STATUS_CODES = [500, 502, 503, 504]

# The CLIENT_SECRETS_FILE variable specifies the name of a file that contains
# the OAuth 2.0 information for this application, including its client_id and
# client_secret. You can acquire an OAuth 2.0 client ID and client secret from
# the Google API Console at
# https://console.cloud.google.com/.
# Please ensure that you have enabled the YouTube Data API for your project.
# For more information about using OAuth2 to access the YouTube Data API, see:
#   https://developers.google.com/youtube/v3/guides/authentication
# For more information about the client_secrets.json file format, see:
#   https://developers.google.com/api-client-library/python/guide/aaa_client_secrets
CLIENT_SECRETS_FILE = "client_secrets.json"

# This OAuth 2.0 access scope allows an application to upload files to the
# authenticated user's YouTube channel, but doesn't allow other types of access.
YOUTUBE_UPLOAD_SCOPE = "https://www.googleapis.com/auth/youtube.upload"
YOUTUBE_API_SERVICE_NAME = "youtube"
YOUTUBE_API_VERSION = "v3"

# This variable defines a message to display if the CLIENT_SECRETS_FILE is
# missing.
MISSING_CLIENT_SECRETS_MESSAGE = """
WARNING: Please configure OAuth 2.0

To make this sample run you will need to populate the client_secrets.json file
found at:

   %s

with information from the API Console
https://console.cloud.google.com/

For more information about the client_secrets.json file format, please visit:
https://developers.google.com/api-client-library/python/guide/aaa_client_secrets
""" % os.path.abspath(os.path.join(os.path.dirname(__file__),
                                   CLIENT_SECRETS_FILE))

VALID_PRIVACY_STATUSES = ("public", "private", "unlisted")


def get_authenticated_service(args):
  flow = flow_from_clientsecrets(CLIENT_SECRETS_FILE,
    scope=YOUTUBE_UPLOAD_SCOPE,
    message=MISSING_CLIENT_SECRETS_MESSAGE)

  storage = Storage("%s-oauth2.json" % sys.argv[0])
  credentials = storage.get()

  if credentials is None or credentials.invalid:
    credentials = run_flow(flow, storage, args)

  return build(YOUTUBE_API_SERVICE_NAME, YOUTUBE_API_VERSION,
    http=credentials.authorize(httplib2.Http()))


def initialize_upload(youtube, options):
  tags = None
  if options.keywords:
    tags = options.keywords.split(",")

  body=dict(
    snippet=dict(
      title=options.title,
      description=options.description,
      tags=tags,
      categoryId=options.category
    ),
    status=dict(
      privacyStatus=options.privacyStatus
    )
  )

  # Call the API's videos.insert method to create and upload the video.
  insert_request = youtube.videos().insert(
    part=",".join(body.keys()),
    body=body,
    # The chunksize parameter specifies the size of each chunk of data, in
    # bytes, that will be uploaded at a time. Set a higher value for
    # reliable connections as fewer chunks lead to faster uploads. Set a lower
    # value for better recovery on less reliable connections.
    #
    # Setting "chunksize" equal to -1 in the code below means that the entire
    # file will be uploaded in a single HTTP request. (If the upload fails,
    # it will still be retried where it left off.) This is usually a best
    # practice, but if you're using Python older than 2.6 or if you're
    # running on App Engine, you should set the chunksize to something like
    # 1024 * 1024 (1 megabyte).
    media_body=MediaFileUpload(options.file, chunksize=-1, resumable=True)
  )

  resumable_upload(insert_request)


# This method implements an exponential backoff strategy to resume a
# failed upload.
def resumable_upload(insert_request):
  response = None
  error = None
  retry = 0
  while response is None:
    try:
      print "Uploading file..."
      status, response = insert_request.next_chunk()
      if response is not None:
        if 'id' in response:
          print "Video id '%s' was successfully uploaded." % response['id']
        else:
          exit("The upload failed with an unexpected response: %s" % response)
    except HttpError, e:
      if e.resp.status in RETRIABLE_STATUS_CODES:
        error = "A retriable HTTP error %d occurred:\n%s" % (e.resp.status,
                                                             e.content)
      else:
        raise
    except RETRIABLE_EXCEPTIONS, e:
      error = "A retriable error occurred: %s" % e

    if error is not None:
      print error
      retry += 1
      if retry > MAX_RETRIES:
        exit("No longer attempting to retry.")

      max_sleep = 2 ** retry
      sleep_seconds = random.random() * max_sleep
      print "Sleeping %f seconds and then retrying..." % sleep_seconds
      time.sleep(sleep_seconds)


if __name__ == '__main__':
  argparser.add_argument("--file", required=True, help="Video file to upload")
  argparser.add_argument("--title", help="Video title", default="Test Title")
  argparser.add_argument("--description", help="Video description",
    default="Test Description")
  argparser.add_argument("--category", default="22",
    help="Numeric video category. " +
      "See https://developers.google.com/youtube/v3/docs/videoCategories/list")
  argparser.add_argument("--keywords", help="Video keywords, comma separated",
    default="")
  argparser.add_argument("--privacyStatus", choices=VALID_PRIVACY_STATUSES,
    default=VALID_PRIVACY_STATUSES[0], help="Video privacy status.")
  args = argparser.parse_args()

  if not os.path.exists(args.file):
    exit("Please specify a valid file using the --file= parameter.")

  youtube = get_authenticated_service(args)
  try:
    initialize_upload(youtube, args)
  except HttpError, e:
    print "An HTTP error %d occurred:\n%s" % (e.resp.status, e.content)
```

## Retry Logic

The implementation includes exponential backoff retry for:

**Retriable HTTP Status Codes:**
- 500 - Internal Server Error
- 502 - Bad Gateway
- 503 - Service Unavailable
- 504 - Gateway Timeout

**Retriable Exceptions:**
- `HttpLib2Error`
- `IOError`
- `NotConnected`
- `IncompleteRead`
- `ImproperConnectionState`
- `CannotSendRequest`
- `CannotSendHeader`
- `ResponseNotReady`
- `BadStatusLine`

**Backoff Strategy:**
- Maximum 10 retries
- Sleep time: `random() * 2^retry` seconds
- Exponentially increasing wait times between retries

## Usage Example

```bash
python upload_video.py --file="/path/to/video.mp4" \
  --title="My Video Title" \
  --description="Video description here" \
  --category="22" \
  --keywords="tag1,tag2,tag3" \
  --privacyStatus="private"
```

## OAuth 2.0 Scope

The upload requires the following scope:
```
https://www.googleapis.com/auth/youtube.upload
```

This scope allows uploading files to the authenticated user's YouTube channel but doesn't allow other types of access.

## Client Secrets File Format

The `client_secrets.json` file should contain:

```json
{
  "web": {
    "client_id": "your-client-id.apps.googleusercontent.com",
    "client_secret": "your-client-secret",
    "redirect_uris": ["http://localhost:8080/oauth2callback"],
    "auth_uri": "https://accounts.google.com/o/oauth2/auth",
    "token_uri": "https://oauth2.googleapis.com/token"
  }
}
```

## Chunk Size Recommendations

| Scenario | Recommended Chunk Size |
|----------|----------------------|
| Reliable connection | `-1` (entire file) |
| Unreliable connection | `1024 * 1024` (1 MB) |
| App Engine | `1024 * 1024` (1 MB) |
| Python < 2.6 | `1024 * 1024` (1 MB) |

Setting `chunksize=-1` uploads the entire file in a single HTTP request, which is usually the best practice for reliable connections.

## Additional Resources

- For other programming languages, see the Google APIs Client Libraries
- For quota information, see the YouTube Data API quota calculator
- For video processing status, use the videos.list endpoint with the `processingDetails` part
