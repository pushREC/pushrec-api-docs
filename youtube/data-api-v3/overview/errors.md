---
source: https://developers.google.com/youtube/v3/docs/errors
scraped: 2026-01-07
method: webfetch
api: youtube-data-v3
category: overview
---

# YouTube Data API - Errors Documentation

## Overview

The YouTube Data API returns various error types to indicate problems with requests. Errors fall into several categories including authorization issues, invalid parameters, and resource-not-found scenarios.

## General Error Categories

### Core API Errors

| Error Type | Error Detail | Description |
|-----------|--------------|-------------|
| `forbidden (403)` | `forbidden` | "Access forbidden. The request may not be properly authorized." |
| `forbidden (403)` | `quotaExceeded` | Request exceeds quota limits |

### Common Request Errors

**Bad Request (400) Errors:**
- `incompatibleParameters`: Multiple parameters cannot be used together
- `invalidFilters`: Invalid filter parameter specified
- `invalidPageToken`: Page token is invalid
- `missingRequiredParameter`: Required parameter absent from request
- `unexpectedParameter`: Unexpected parameter included

**Authorization Errors (401/403):**
- `authorizationRequired`: Proper authorization missing
- `authenticatedUserAccountClosed`: User's YouTube account is closed
- `authenticatedUserAccountSuspended`: User's YouTube account suspended
- `insufficientPermissions`: OAuth token lacks required scopes
- `youtubeSignupRequired`: User lacks YouTube channel (common with Service Accounts)

## Resource-Specific Errors

### Activities
- `homeParameterDeprecated`: Home page activity data unavailable
- `channelNotFound`: Channel ID cannot be located

### Captions
- `captionNotFound`: Caption track cannot be found
- `contentRequired`: Caption track contents missing
- `captionExists`: Caption with same language/name already exists
- `nameTooLong`: Caption name exceeds 150-character maximum
- `videoNotFound`: Target video not found

### Channel Sections
- `notEditable`: Section cannot be created/deleted/edited
- `maxChannelSectionExceeded`: Channel reached maximum section limit
- `playlistIsPrivate`: Specified playlist is private
- `titleRequired`: Title mandatory for certain section types
- `channelNotFound`: Channel not found

### Channels
- `brandingValidationError`: Branding settings failed validation
- `channelTitleUpdateForbidden`: Cannot change channel title through API
- `websiteLinkNotAllowed`: Specified website URL not permitted

### Comments
- `commentTextRequired`: Comment cannot be empty
- `commentTextTooLong`: Comment exceeds character limit
- `parentCommentIsPrivate`: Cannot reply to private comments
- `parentCommentNotFound`: Target parent comment not found

### PlaylistItems
- `videoAlreadyInPlaylist`: Video already exists in playlist
- `playlistContainsMaximumNumberOfVideos`: Playlist full
- `videoNotFound`: Target video not found
- `playlistNotFound`: Target playlist not found

### Videos
- `invalidCategoryId`: Category ID invalid; use `videoCategories.list` to find valid options
- `invalidTitle`: Title is invalid or empty
- `invalidDescription`: Description metadata invalid
- `uploadLimitExceeded`: User exceeded upload quota
- `forbiddenPrivacySetting`: Invalid privacy setting attempted
- `forbiddenLicenseSetting`: Invalid license setting attempted

### Search
- `invalidSearchFilter`: Invalid filter combination used
- `invalidLocation`: Location parameters formatted incorrectly

### Subscriptions
- `subscriptionDuplicate`: Subscription already exists
- `subscriptionForbidden`: Maximum subscriptions reached or too many recent subscriptions

### Thumbnails
- `invalidImage`: Provided image content invalid
- `uploadRateLimitExceeded`: Too many thumbnail uploads recently

## Error Response Pattern

Errors follow HTTP status codes:
- **400 (Bad Request)**: Invalid parameters or malformed request
- **401 (Unauthorized)**: Authentication required
- **403 (Forbidden)**: Authorization insufficient or operation blocked
- **404 (Not Found)**: Resource doesn't exist
- **409 (Conflict)**: Resource already exists
- **429 (Too Many Requests)**: Rate limit exceeded

## Troubleshooting Steps

1. Verify required parameters are included
2. Check OAuth token scopes match operation requirements
3. Confirm resource IDs (videos, channels, playlists) exist and are accessible
4. Review quota status if receiving quota-related errors
5. Ensure proper authentication when accessing restricted resources
