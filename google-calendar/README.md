# Google Calendar API Documentation

> **Status:** Complete
> **Last Updated:** 2026-01-08
> **Source:** googleapis.com/calendar

## Contents

| Type | Description |
|------|-------------|
| `discovery-v3.json` | Calendar API Discovery Document |
| `SOURCES.md` | Source tracking |
| `COVERAGE.md` | Coverage report |

## Quick Start

```bash
# Set OAuth credentials
export GOOGLE_OAUTH_CREDENTIALS="path/to/credentials.json"

# List calendars
curl "https://www.googleapis.com/calendar/v3/users/me/calendarList" \
  -H "Authorization: Bearer $ACCESS_TOKEN"
```

## Key Endpoints

| Category | Endpoint | Description |
|----------|----------|-------------|
| **Calendars** | `GET /calendar/v3/calendars/{id}` | Get calendar |
| **Events** | `GET /calendar/v3/calendars/{id}/events` | List events |
| **Events** | `POST /calendar/v3/calendars/{id}/events` | Create event |
| **Events** | `PUT /calendar/v3/calendars/{id}/events/{eventId}` | Update event |
| **FreeBusy** | `POST /calendar/v3/freeBusy` | Query free/busy |

## Authentication

- **Type:** OAuth 2.0
- **Scopes:** `https://www.googleapis.com/auth/calendar`, `https://www.googleapis.com/auth/calendar.readonly`
- **Console:** https://console.cloud.google.com/apis/credentials

## Resources

- [API Docs](https://developers.google.com/calendar/api)
- [API Reference](https://developers.google.com/calendar/api/v3/reference)
- [Python Client](https://github.com/googleapis/google-api-python-client)
