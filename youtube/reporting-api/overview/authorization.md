---
source: https://developers.google.com/youtube/reporting/guides/authorization
scraped: 2026-01-07
api_provider: Google
discovery_tier: 3
verified: false
---
 OAuth 2.0 Authorization for YouTube Reporting API

## Core Concepts

The YouTube Reporting and Analytics APIs implement OAuth 2.0 to secure access to private user information. When users first access features requiring authentication, applications redirect them to Google's authorization server where they grant permission based on requested scopes.

## Authorization Flows Supported

Google's OAuth 2.0 supports three primary flows for these APIs:

1. **Server-side web apps** - For applications that securely store persistent data
2. **JavaScript/client-side web apps** - For browser-based applications
3. **Mobile and desktop apps** - For device-installed applications

**Important limitation:** The YouTube Reporting and Analytics APIs do not support device flow or service account flow authentication.

## OAuth 2.0 Scopes

### YouTube Reporting API Scopes

| Scope | Purpose |
|-------|---------|
| `https://www.googleapis.com/auth/yt-analytics-monetary.readonly` | View monetary and non-monetary reports |
| `https://www.googleapis.com/auth/yt-analytics.readonly` | View YouTube analytics reports |

### Additional YouTube API Scopes (for Analytics API)

| Scope | Purpose |
|-------|---------|
| `https://www.googleapis.com/auth/youtube` | Manage YouTube account |
| `https://www.googleapis.com/auth/youtube.readonly` | View YouTube account |
| `https://www.googleapis.com/auth/youtubepartner` | View/manage assets and content |

## Scope Selection Guidelines

- Use `yt-analytics.readonly` for basic user activity metrics like view and rating counts
- Use `yt-analytics-monetary.readonly` for revenue and ad performance data in addition to user activity metrics

## Key Requirements

**Before implementation:** Developers must obtain authorization credentials through the Google API Console.

**User Consent:** There may be an inverse relationship between the number of scopes requested and the likelihood of obtaining user consent. Request only the scopes you need.

**App Verification:** Applications using user-data scopes may require verification to avoid "unverified app" warnings during testing.

## Authorization Header

All API requests require an `Authorization` header with the OAuth 2.0 token:

```
Authorization: Bearer YOUR_ACCESS_TOKEN
```
