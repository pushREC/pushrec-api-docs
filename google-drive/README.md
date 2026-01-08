---
created: 2026-01-08
tags: [type/api-reference, api/google]
api_name: Google Drive API
api_version: v3
base_url: https://www.googleapis.com/drive/v3/
auth_type: oauth2
endpoint_count: 57
discovery_tier: GOOGLE_DISCOVERY
verified: true
---

# Google Drive API

> The Google Drive API allows clients to access resources from Google Drive.

## Overview

| Property | Value |
|----------|-------|
| **Base URL** | `https://www.googleapis.com/drive/v3/` |
| **Version** | v3 |
| **Authentication** | OAuth 2.0 |
| **Total Methods** | 57 |
| **Resources** | 14 |

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

- [[about|About]] - 1 methods
- [[accessproposals|Accessproposals]] - 3 methods
- [[approvals|Approvals]] - 2 methods
- [[apps|Apps]] - 2 methods
- [[changes|Changes]] - 3 methods
- [[channels|Channels]] - 1 methods
- [[comments|Comments]] - 5 methods
- [[drives|Drives]] - 7 methods
- [[files|Files]] - 13 methods
- [[operations|Operations]] - 1 methods
- [[permissions|Permissions]] - 5 methods
- [[replies|Replies]] - 5 methods
- [[revisions|Revisions]] - 4 methods
- [[teamdrives|Teamdrives]] - 5 methods

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
*Last updated: 2026-01-08*
