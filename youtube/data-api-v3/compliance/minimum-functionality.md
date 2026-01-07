---
source: https://developers.google.com/youtube/terms/required-minimum-functionality
scraped: 2026-01-07
api_provider: Google
discovery_tier: 3
verified: false
category: compliance
method: webfetch
---
 YouTube API Services - Required Minimum Functionality

## Overview

This document establishes baseline requirements for API clients accessing YouTube services, ensuring consistent user experiences across platforms, content creators, and advertisers.

## YouTube Embedded Player Requirements

### API Client Identity and Credentials

API clients using the YouTube embedded player must provide identification via the HTTP Referer header. In environments where Referer is empty by default (WebView integrations), developers must implement alternative identification methods:

**Mobile App Implementation:**
- Android: Use `loadDataWithBaseURL` with baseUrl parameter or add Referer to `additionalHttpHeaders`
- iOS: Add Referer header to `loadRequest:` or use bundle ID as referrer value

**Desktop Applications:**
Use platform-specific HTTP header configuration (e.g., .NET's `HttpRequestHeaders.Referrer`)

**Referer Format Requirements:**
Specify HTTPS protocol with fully qualified URLs. For store-distributed apps, use the registered app ID (typically reverse-DNS format like `com.google.android.youtube`). For generated alphanumeric store IDs, format as: `<app-display-name>.<store-app-id>`

### Player Size Specifications

- Minimum viewport: 200px × 200px
- Recommended for 16:9 aspect ratio: 480px wide × 270px tall
- Controls must display without shrinking below minimum size

### Autoplay Restrictions

- Initiate playback only when player is fully visible with more than 50% on-screen
- Maximum one auto-playing YouTube player per page simultaneously
- YouTube thumbnails initiating playback: minimum 120px × 70px

### Player Modifications Prohibited

Do not alter player appearance, attributes, or parameters beyond documented API specifications. Overlays, frames, or visual elements cannot obscure player controls or content.

### Mouseover Restrictions

Cannot use mouseovers or touch events to trigger user actions (window opening, subscriptions).

## Video Upload Requirements

Clients enabling uploads must allow users to set:

- **Title:** Required; max 100 characters (UTF-8 valid except `<` and `>`)
- **Description:** Required; max 5000 bytes (UTF-8 valid except `<` and `>`)
- **Privacy Status:** Required; users choose public, private, or unlisted
- **Channel Selection:** Required when using `onBehalfOfContentOwner` parameter

## Comment Display Requirements

- Display full text or truncate with accessible full-text access
- Display channel name (for channel comments) or uploading channel name (for video comments)
- Display video title for video-related comments
- Clearly mark comments "held for review" or flagged as "likely spam"

## Comment Posting Requirements

When users add comments, clients must:

- Display the associated channel/video title
- Clearly identify the YouTube account to which the comment is attributed
- Specify channel when using `onBehalfOfContentOwner`

## Comment Reply Requirements

Display original comment text and video/channel information per display standards. Clearly identify the account posting the reply and specify channel when applicable.

## User Banning Requirements

When banning users from live chat, display:

- Banned channel name with link or URL
- YouTube account performing the action clearly identified

## Ongoing Compliance

Requirements may change with platform updates. Developers should monitor the Terms of Service revision history and RSS feed for updates affecting their API clients.
