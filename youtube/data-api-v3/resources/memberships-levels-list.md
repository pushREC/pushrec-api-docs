---
source: https://developers.google.com/youtube/v3/docs/membershipsLevels/list
scraped: 2026-01-07
api_provider: Google
discovery_tier: 3
verified: false
method: list
---
 YouTube Data API: MembershipsLevels list

## Method Overview

This endpoint enables individual YouTube creators with enabled channel memberships to retrieve their channel's membership tier structure. The API returns pricing levels in implicit display order.

**Key Capability:** Retrieve a list of their channel's membership levels

The method yields one of three outcomes:
- List of membership levels (if memberships enabled with pricing tiers defined)
- Empty list (if memberships enabled but no pricing tiers configured)
- Error response (if memberships not enabled)

**Quota Cost:** 1 unit per request

## HTTP Request

```
GET https://www.googleapis.com/youtube/v3/membershipsLevels
```

## Authorization

**Required Scope:**
```
https://www.googleapis.com/auth/youtube.channel-memberships.creator
```

## Parameters

### Required Parameters

| Parameter | Type | Description |
|-----------|------|-------------|
| `part` | string | Specifies which membershipsLevel resource properties to include. Accepts comma-separated values: `id` or `snippet` (or both) |

## Request Body

No request body required for this method.

## Response Schema

```json
{
  "kind": "youtube#membershipsLevelListResponse",
  "etag": "[etag value]",
  "items": [
    {
      "[membershipsLevel Resource]": {}
    }
  ]
}
```

### Response Properties

| Property | Type | Description |
|----------|------|-------------|
| `kind` | string | Constant value: `youtube#membershipsLevelListResponse` |
| `etag` | etag | Resource version identifier |
| `items[]` | list | Array of membershipsLevel resources owned by authorized channel |

## Error Handling

| HTTP Status | Error Code | Description |
|-------------|-----------|-------------|
| 400 | `channelMembershipsNotEnabled` | The creator channel authorizing the request does not have channel memberships enabled |

## Important Restrictions

**Access Limitation:** This endpoint can only be used by individual creators to make requests for their own, channel-memberships-enabled YouTube channel. Special access approval required from Google/YouTube representatives.
