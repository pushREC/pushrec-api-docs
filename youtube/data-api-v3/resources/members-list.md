---
source: https://developers.google.com/youtube/v3/docs/members/list
scraped: 2026-01-07
api: YouTube Data API v3
resource: Members
method: list
---

# YouTube Data API: Members list

## Method Overview

The Members: list endpoint enables individual YouTube creators to retrieve a list of members for their channel-memberships-enabled channel. This endpoint requires specific authorization and is restricted to the channel owner making requests for their own channel.

**Key Requirement:** This endpoint can only be used by individual creators to make requests for their own, channel-memberships-enabled YouTube channel.

**Quota Cost:** 2 units per API call

## HTTP Request

```
GET https://www.googleapis.com/youtube/v3/members
```

## Authorization

**Required Scope:** `https://www.googleapis.com/auth/youtube.channel-memberships.creator`

## Parameters

### Required Parameters

| Parameter | Type | Description |
|-----------|------|-------------|
| `part` | string | Specifies member resource properties to include in response. Must be set to `snippet`. |

### Optional Parameters

| Parameter | Type | Description |
|-----------|------|-------------|
| `mode` | string | Indicates which members to include. Options: `all_current` (default, lists current members newest to oldest) or `updates` (lists only members who joined/upgraded since previous call). |
| `maxResults` | unsigned integer | Maximum items in result set. Acceptable range: 0-1000. Default: 5. |
| `pageToken` | string | Identifies specific page in result set. Token is mode-specific. |
| `hasAccessToLevel` | string | Specifies minimum membership level for returned members. |
| `filterByMemberChannelId` | string | Comma-separated list of channel IDs (max 100) to check membership status. |

## Request Body

No request body required.

## Response Schema

```json
{
  "kind": "youtube#memberListResponse",
  "etag": "string",
  "nextPageToken": "string",
  "pageInfo": {
    "totalResults": "integer",
    "resultsPerPage": "integer"
  },
  "items": [
    {
      "[member resource properties]": "..."
    }
  ]
}
```

### Response Properties

| Property | Description |
|----------|-------------|
| `kind` | Always returns `youtube#memberListResponse` |
| `etag` | Etag identifier for this resource |
| `nextPageToken` | Token for retrieving next page (may expire) |
| `pageInfo.totalResults` | Total number of results available |
| `pageInfo.resultsPerPage` | Number of results in current response |
| `items[]` | Array of member resources matching request criteria |

## Error Handling

| Error Type | Error Detail | Description |
|------------|--------------|-------------|
| 400 | `channelMembershipsNotEnabled` | Creator channel lacks memberships enablement |
| 400 | `invalidMode` | Invalid mode parameter or mismatched page token |
| 400 | `invalidPageToken` | Expired or unrecognized page token |
| 400 | `invalidHasAccessToLevel` | Referenced level ID doesn't exist |
| 400 | `invalidFilterByMemberChannelId` | Exceeds 100-channel limit or invalid format |

## Important Implementation Notes

- Page tokens are mode-specific and cannot be transferred between different mode values
- The `updates` mode returns a `nextPageToken` in every response
- First call using `updates` mode initiates tracking but returns no members; polling with subsequent tokens retrieves actual updates
