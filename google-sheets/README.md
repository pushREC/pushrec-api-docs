# Google Sheets API Documentation

> **Status:** Complete
> **Last Updated:** 2026-01-08
> **Source:** sheets.googleapis.com

## Contents

| Type | Description |
|------|-------------|
| `discovery-v4.json` | Sheets API Discovery Document |
| `SOURCES.md` | Source tracking |
| `COVERAGE.md` | Coverage report |

## Quick Start

```bash
# Set OAuth credentials
export GOOGLE_OAUTH_CREDENTIALS="path/to/credentials.json"

# Get spreadsheet metadata
curl "https://sheets.googleapis.com/v4/spreadsheets/{spreadsheetId}" \
  -H "Authorization: Bearer $ACCESS_TOKEN"
```

## Key Endpoints

| Category | Endpoint | Description |
|----------|----------|-------------|
| **Spreadsheets** | `GET /v4/spreadsheets/{id}` | Get spreadsheet |
| **Spreadsheets** | `POST /v4/spreadsheets` | Create spreadsheet |
| **Values** | `GET /v4/spreadsheets/{id}/values/{range}` | Read cells |
| **Values** | `PUT /v4/spreadsheets/{id}/values/{range}` | Write cells |
| **Batch** | `POST /v4/spreadsheets/{id}:batchUpdate` | Batch operations |

## Authentication

- **Type:** OAuth 2.0 or API Key (read-only public sheets)
- **Scopes:** `https://www.googleapis.com/auth/spreadsheets`, `https://www.googleapis.com/auth/spreadsheets.readonly`
- **Console:** https://console.cloud.google.com/apis/credentials

## Resources

- [API Docs](https://developers.google.com/sheets/api)
- [API Reference](https://developers.google.com/sheets/api/reference/rest)
- [Python Client](https://github.com/googleapis/google-api-python-client)
