---
created: 2026-01-09
tags: [type/api-reference, api/google]
api_name: Google Slides API
api_version: v1
base_url: https://slides.googleapis.com/
auth_type: oauth2
endpoint_count: 5
discovery_tier: GOOGLE_DISCOVERY
verified: true
---

# Google Slides API

> Reads and writes Google Slides presentations.

## Overview

| Property | Value |
|----------|-------|
| **Base URL** | `https://slides.googleapis.com/` |
| **Version** | v1 |
| **Authentication** | OAuth 2.0 |
| **Total Methods** | 5 |
| **Resources** | 1 |

## Authentication

This API uses OAuth 2.0 authentication. You need:
1. A Google Cloud project with the Drive API enabled
2. OAuth 2.0 credentials (client ID and secret)
3. User consent for the required scopes

### Common Scopes

| Scope | Description |
|-------|-------------|
| `https://www.googleapis.com/auth/drive` | Full access to Drive |
| `https://www.googleapis.com/auth/drive.file` | Access to files created by the app |
| `https://www.googleapis.com/auth/drive.readonly` | Read-only access |
| `https://www.googleapis.com/auth/drive.metadata.readonly` | Read-only metadata access |

## Resources

- [[presentations|Presentations]] - 3 methods

## Quick Start

```python
from google.oauth2.credentials import Credentials
from googleapiclient.discovery import build

# Authenticate
creds = Credentials.from_authorized_user_file('token.json')
service = build('drive', 'v3', credentials=creds)

# List files
results = service.files().list(pageSize=10).execute()
files = results.get('files', [])
```

---

*Generated from Google Discovery Document*
*Last updated: 2026-01-09*
