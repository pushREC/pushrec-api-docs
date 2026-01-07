---
source: https://developers.google.com/youtube/v3/docs/members
scraped: 2026-01-07
api_provider: Google
discovery_tier: 3
verified: false
---
 YouTube Data API - Members Resource Documentation

## Resource Overview

The `members` resource represents a YouTube channel member who provides recurring monetary support to a creator and receives exclusive benefits. Members can access members-only chat and other exclusive features offered by creators.

**Key Points:**

- Replaced the deprecated `sponsors` endpoint as of March 31, 2020
- The `sponsors` endpoint ceased support on September 30, 2020
- Available exclusively to individual creators for their own channel-memberships-enabled YouTube channels
- Requires authorization from the channel owner

## Resource Representation

```json
{
  "kind": "youtube#member",
  "etag": "etag_value",
  "snippet": {
    "creatorChannelId": "string",
    "memberDetails": {
      "channelId": "string",
      "channelUrl": "string",
      "displayName": "string",
      "profileImageUrl": "string"
    },
    "membershipsDetails": {
      "highestAccessibleLevel": "string",
      "highestAccessibleLevelDisplayName": "string",
      "accessibleLevels": ["string"],
      "membershipsDuration": {
        "memberSince": "datetime",
        "memberTotalDurationMonths": "integer"
      },
      "membershipsDurationAtLevel": [
        {
          "level": "string",
          "memberSince": "datetime",
          "memberTotalDurationMonths": "integer"
        }
      ]
    }
  }
}
```

## Properties Reference

| Property | Type | Description |
|----------|------|-------------|
| `kind` | string | Always `youtube#member` |
| `etag` | etag | Resource etag identifier |
| `snippet.creatorChannelId` | string | YouTube channel ID offering memberships |
| `snippet.memberDetails.channelId` | string | Member's channel ID; serves as unique identifier |
| `snippet.memberDetails.channelUrl` | string | Member's channel URL |
| `snippet.memberDetails.displayName` | string | Member's channel display name |
| `snippet.memberDetails.profileImageUrl` | string | Member's channel avatar URL |
| `snippet.membershipsDetails.highestAccessibleLevel` | string | ID of highest membership tier accessible |
| `snippet.membershipsDetails.highestAccessibleLevelDisplayName` | string | Display name of highest tier |
| `snippet.membershipsDetails.accessibleLevels[]` | list | All membership levels currently accessible |
| `snippet.membershipsDuration.memberSince` | datetime | Current membership start date |
| `snippet.membershipsDuration.memberTotalDurationMonths` | integer | Total months as member (rounded down) |
| `snippet.membershipsDurationAtLevel[]` | list | Membership duration per tier |

**Note:** Members with deleted channels may have unavailable profile data within `memberDetails`, though membership details remain accessible.

## Available Methods

| Method | Description |
|--------|-------------|
| list | Retrieves the list of channel members. Authorization must be provided by the channel owner. |

## Access Restrictions

Limited to individual creators requesting data for their own memberships-enabled channel.

## Usage Notes

The API tracks membership across multiple scenarios. For instance, a member joining at level 1 in January through March, then rejoining in June at level 1 and upgrading to level 2 in August would show both membership durations and level-specific durations in API responses.
