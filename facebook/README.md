# Facebook/Meta Graph API Documentation

> **Status:** Research from inbox
> **Last Updated:** 2026-01-07
> **Source:** Vault inbox research

## Contents

| File | Description | Size |
|------|-------------|------|
| `graph-api.md` | Graph API comprehensive research | 92KB |

## Graph API Overview

The Facebook Graph API is Meta's primary API for reading/writing to the social graph.

### Key Endpoints

| Category | Description |
|----------|-------------|
| `/me` | Current user profile |
| `/{user-id}` | User data |
| `/{page-id}` | Page data |
| `/{post-id}` | Post content |
| `/{photo-id}` | Photo data |
| `/{video-id}` | Video data |
| `/oauth/access_token` | Token exchange |

### Authentication

- **OAuth 2.0** - Primary authentication method
- **Access Tokens** - User, Page, App tokens
- **Permissions** - Granular scope-based access

## Notes

1. **No public OpenAPI spec** - Meta doesn't publish machine-readable spec
2. **Rate limited** - Complex rate limiting per endpoint
3. **Requires app approval** - Many endpoints need Facebook app review

## Resources

- [Graph API Docs](https://developers.facebook.com/docs/graph-api)
- [Graph API Explorer](https://developers.facebook.com/tools/explorer/)
- [Access Token Debugger](https://developers.facebook.com/tools/debug/accesstoken/)
