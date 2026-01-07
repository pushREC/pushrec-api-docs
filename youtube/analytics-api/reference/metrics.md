---
source: https://developers.google.com/youtube/analytics/metrics
scraped: 2026-01-07
api_provider: Google
discovery_tier: 3
verified: false
title: YouTube Analytics API - Metrics Reference
---
 YouTube Analytics API Metrics Documentation

## Overview

The YouTube Analytics API provides metrics measuring user activity, ad performance, and estimated revenue. Metrics are categorized into core metrics (subject to deprecation policy) and non-core metrics.

## Core Metrics

The following metrics are subject to Google's Deprecation Policy:

- `annotationClickThroughRate`
- `annotationCloseRate`
- `averageViewDuration`
- `comments`
- `dislikes`
- `engagedViews`
- `estimatedMinutesWatched`
- `estimatedRevenue`
- `likes`
- `shares`
- `subscribersGained`
- `subscribersLost`
- `viewerPercentage`
- `views`

---

## View Metrics

**engagedViews**: Views extending beyond initial seconds of videos.

**views**: Represents varying counts depending on report type; core metric subject to deprecation.

**playlistViews**: Views occurring within playlist context.

**redViews**: Views by YouTube Premium members.

**viewerPercentage**: "The percentage of viewers who were logged in when watching the video or playlist."

---

## Watch Time Metrics

**estimatedMinutesWatched**: Total minutes watched across specified channel, content owner, video, or playlist.

**estimatedRedMinutesWatched**: Minutes watched by Premium members.

**averageViewDuration**: "The average length, in seconds, of video playbacks" (excludes looping clips since December 13, 2021).

**averageViewPercentage**: Average percentage watched per playback, excluding looping traffic.

---

## Engagement Metrics

**comments**: "The number of times that users commented on a video."

**likes**: Positive ratings indicating user approval.

**dislikes**: Negative ratings indicating disapproval.

**shares**: Uses of the Share button for distribution.

**subscribersGained**: "The number of times that users subscribed to a channel." Includes subscriptions from video watch pages, channel pages, and YouTube home guide.

**subscribersLost**: Unsubscription events; calculated similarly to subscribersGained.

**videosAddedToPlaylists**: Additions to any YouTube playlist; counts absolute occurrences (available from October 1, 2014).

**videosRemovedFromPlaylists**: Removal from playlists; reflects absolute count of removal events.

---

## Playlist Metrics

Two metric types explain viewer interaction:

**Aggregated video metrics**: User activity aggregated for channel-owned videos within playlists only.

**In-playlist metrics**: Activity within playlist context, including videos owned by other channels.

### Specific Playlist Metrics

**averageTimeInPlaylist**: "The estimated average amount of time, in minutes, that a viewer viewed videos in a playlist after the playlist was initiated" (web views only).

**playlistAverageViewDuration**: Average seconds watched per individual video within playlist.

**playlistEstimatedMinutesWatched**: Minutes watching playlist content; excludes watch time from other contexts.

**playlistSaves**: Net saves count; reflects net change when users save/remove/resave.

**playlistStarts**: Playlist playback initiations (web only).

**viewsPerPlaylistStart**: Average video views per playlist initiation (web only).

---

## Annotation Metrics

Data available from June 10, 2012; remaining metrics from July 16, 2013.

**annotationImpressions**: Total annotation display occurrences.

**annotationClickableImpressions**: Annotations appearing and clickable.

**annotationClicks**: Clicked annotations count.

**annotationClickThroughRate**: "The ratio of annotations that viewers clicked to the total number of clickable annotation impressions."

**annotationClosableImpressions**: Annotations appearing and closable.

**annotationCloses**: Closed annotations count.

**annotationCloseRate**: "The ratio of annotations that viewers closed to the total number of annotation impressions."

---

## Card Metrics

**cardImpressions**: Card display frequency.

**cardClicks**: Click count on cards.

**cardClickRate**: Click-through ratio calculated as clicks divided by impressions.

**cardTeaserImpressions**: Teaser display occurrences.

**cardTeaserClicks**: Teaser click count.

**cardTeaserClickRate**: Teaser click-through ratio.

---

## Livestream Metrics (Concurrent Viewers)

**averageConcurrentViewers**: Average simultaneous viewers; segment-specific with livestreamPosition dimension.

**peakConcurrentViewers**: Maximum simultaneous viewers during broadcast or segment.

---

## Audience Retention Metrics

**audienceWatchRatio**: "The absolute ratio of viewers watching the video at the given point in the video" compared to total views. Values exceed 1.0 when segments rewatched.

**relativeRetentionPerformance**: Comparative retention metric (0-1 scale) showing performance versus similar-length videos; 0.5 represents median performance.

**startedWatching**: Count of first-viewed segments per playback session.

**stoppedWatching**: Count of final-viewed segments per playback session.

**totalSegmentImpressions**: Total viewings of particular video segments; counts rewatches.

---

## Membership Cancellation Metrics

**membershipsCancellationSurveyResponses**: Completed survey responses from members canceling subscriptions.

---

## Estimated Revenue Metrics

All figures reported in USD by default; currency parameter available for some metrics. Subject to month-end adjustment; excludes partner-sold and partner-served advertising.

**estimatedRevenue**: "The total estimated net revenue from all Google-sold advertising sources as well as from non-advertising sources for the selected date range and region."

**estimatedAdRevenue**: Net revenue from Google-sold advertising exclusively.

**estimatedRedPartnerRevenue**: Revenue from Premium subscriptions across music and non-music content.

---

## Ad Performance Metrics

**grossRevenue**: Estimated gross revenue in USD from Google-sold or DoubleClick partner-sold ads; excludes partner-served advertising.

**cpm**: Estimated gross revenue per thousand impressions.

**adImpressions**: Verified ad impression count.

**monetizedPlaybacks**: "The number of instances when a viewer played your video and was shown at least one ad impression" (+/- 2.0% expected error).

**playbackBasedCpm**: Gross revenue per thousand playbacks.

---

## Metric Categories Summary

| Category | Metrics |
|----------|---------|
| **Views** | views, engagedViews, playlistViews, redViews, viewerPercentage |
| **Watch Time** | estimatedMinutesWatched, estimatedRedMinutesWatched, averageViewDuration, averageViewPercentage |
| **Engagement** | comments, likes, dislikes, shares, subscribersGained, subscribersLost, videosAddedToPlaylists, videosRemovedFromPlaylists |
| **Playlist** | playlistViews, playlistEstimatedMinutesWatched, playlistAverageViewDuration, playlistSaves, playlistStarts, viewsPerPlaylistStart, averageTimeInPlaylist |
| **Annotations** | annotationImpressions, annotationClicks, annotationClickThroughRate, annotationCloses, annotationCloseRate |
| **Cards** | cardImpressions, cardClicks, cardClickRate, cardTeaserImpressions, cardTeaserClicks, cardTeaserClickRate |
| **Livestream** | averageConcurrentViewers, peakConcurrentViewers |
| **Retention** | audienceWatchRatio, relativeRetentionPerformance, startedWatching, stoppedWatching, totalSegmentImpressions |
| **Revenue** | estimatedRevenue, estimatedAdRevenue, estimatedRedPartnerRevenue, grossRevenue |
| **Ad Performance** | adImpressions, cpm, monetizedPlaybacks, playbackBasedCpm |

---

**Note**: Revenue metrics subject to month-end adjustment; content last updated September 18, 2025.
