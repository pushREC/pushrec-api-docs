# Gmail API Documentation

> **Status:** Complete
> **Last Updated:** 2026-01-08
> **Source:** gmail.googleapis.com

## Contents

| Type | Description |
|------|-------------|
| `discovery-v1.json` | Gmail API Discovery Document |
| `SOURCES.md` | Source tracking |
| `COVERAGE.md` | Coverage report |

## Quick Start

```bash
# Set OAuth credentials
export GOOGLE_OAUTH_CREDENTIALS="path/to/credentials.json"

# List labels (requires OAuth)
curl "https://gmail.googleapis.com/gmail/v1/users/me/labels" \
  -H "Authorization: Bearer $ACCESS_TOKEN"
```

## Key Endpoints

| Category | Endpoint | Description |
|----------|----------|-------------|
| **Messages** | `GET /gmail/v1/users/{userId}/messages` | List messages |
| **Messages** | `POST /gmail/v1/users/{userId}/messages/send` | Send email |
| **Labels** | `GET /gmail/v1/users/{userId}/labels` | List labels |
| **Threads** | `GET /gmail/v1/users/{userId}/threads` | List threads |
| **Drafts** | `POST /gmail/v1/users/{userId}/drafts` | Create draft |

## Authentication

- **Type:** OAuth 2.0
- **Scopes:** `https://www.googleapis.com/auth/gmail.readonly`, `https://www.googleapis.com/auth/gmail.send`, etc.
- **Console:** https://console.cloud.google.com/apis/credentials

## Resources

- [API Docs](https://developers.google.com/gmail/api)
- [API Reference](https://developers.google.com/gmail/api/reference/rest)
- [Python Client](https://github.com/googleapis/google-api-python-client)
