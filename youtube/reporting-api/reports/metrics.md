---
source: https://developers.google.com/youtube/reporting/v1/reports/metrics
scraped: 2026-01-07
api: youtube-reporting
type: metrics
---

# YouTube Reporting API Metrics Documentation

## Overview

The YouTube Reporting API provides metrics for tracking channel performance across multiple categories, including user activity, engagement, revenue, and ad performance.

## Naming Convention

The Reporting API uses **lowercase with underscores** (e.g., `ad_impressions`, `watch_time_minutes`), unlike the Analytics API which uses camelCase.

## Core Metrics

Core metrics are subject to Google's Deprecation Policy:

- `annotation_click_through_rate`
- `annotation_close_rate`
- `average_view_duration_seconds`
- `comments`
- `dislikes`
- `engaged_views`
- `estimated_partner_revenue`
- `likes`
- `shares`
- `subscribers_gained`
- `subscribers_lost`
- `views_percentage`
- `views`
- `watch_time_minutes`

## View Metrics

| Metric | Description |
|--------|-------------|
| `engaged_views` | Times videos were viewed past initial seconds |
| `views` | Total video playback count |
| `red_views` | Views by YouTube Premium members |
| `views_percentage` | Percentage of logged-in viewers |

### Shorts View Counting Change (March 2025)

For Shorts, views now count the number of times a Short starts to play or replay, with no minimum watch time requirement. The `engaged_views` metric reflects the previous counting methodology.

## Watch Time Metrics

| Metric | Description |
|--------|-------------|
| `watch_time_minutes` | Total minutes watched across channel content |
| `red_watch_time_minutes` | Watch time from Premium subscribers |
| `average_view_duration_seconds` | Average playback length (excludes looping clips) |
| `average_view_duration_percentage` | Average percentage of video watched |

## Engagement Metrics

| Metric | Description |
|--------|-------------|
| `comments` | User-generated comments on videos |
| `likes` | Positive ratings given to content |
| `dislikes` | Negative ratings on videos |
| `shares` | Videos shared through YouTube's Share button |
| `subscribers_gained` | New channel subscriptions |
| `subscribers_lost` | Unsubscribe counts |
| `videos_added_to_playlists` | Playlist additions (excludes automatic playlists) |
| `videos_removed_from_playlists` | Playlist removal counts |

## Playlist Metrics

| Metric | Description |
|--------|-------------|
| `playlist_starts` | Playlist playback initiations (web only) |
| `playlist_saves_added` | Saved playlist additions |
| `playlist_saves_removed` | Saved playlist removals |

These aggregate video metrics for owned videos and track in-playlist user interactions.

## Annotation Metrics

| Metric | Description |
|--------|-------------|
| `annotation_impressions` | Total annotation displays |
| `annotation_clickable_impressions` | Clickable annotations shown |
| `annotation_clicks` | Annotations clicked by viewers |
| `annotation_click_through_rate` | Click ratio to impressions |
| `annotation_closable_impressions` | Closable annotations displayed |
| `annotation_closes` | Annotations closed by viewers |
| `annotation_close_rate` | Close ratio to total impressions |

## Card Metrics

| Metric | Description |
|--------|-------------|
| `card_impressions` | Card display count |
| `card_clicks` | User clicks on cards |
| `card_click_rate` | Click ratio for cards |
| `card_teaser_impressions` | Teaser display count |
| `card_teaser_clicks` | Teaser click count |
| `card_teaser_click_rate` | Click ratio for teasers |

## End Screen Metrics

| Metric | Description |
|--------|-------------|
| `end_screen_element_impressions` | Element displays during final 5-20 seconds |
| `end_screen_element_clicks` | Element click count |
| `end_screen_element_click_rate` | Click ratio for elements |

## Membership Metrics

| Metric | Description |
|--------|-------------|
| `memberships_cancellation_survey_responses` | Surveys from canceled members |

## Revenue Metrics

All revenue figures are reported in USD and subject to month-end adjustments.

| Metric | Description |
|--------|-------------|
| `estimated_partner_revenue` | Net revenue from advertising and non-advertising sources |
| `estimated_partner_ad_revenue` | Google-sold advertising net revenue |
| `estimated_partner_ad_auction_revenue` | AdSense auction earnings |
| `estimated_partner_ad_reserved_revenue` | Reserved-sold advertising earnings |
| `estimated_partner_red_revenue` | YouTube Premium subscription earnings |
| `estimated_partner_transaction_revenue` | Paid content and Fan Funding revenue |

### Revenue Calculation Notes

- Partner revenue = Your share after YouTube's cut
- Estimated = Subject to finalization
- USD currency for all revenue metrics
- Month-end adjustments may affect final values

## Ad Performance Metrics

| Metric | Description |
|--------|-------------|
| `estimated_youtube_ad_revenue` | Gross advertising revenue (all sources) |
| `estimated_cpm` | Gross revenue per thousand ad impressions |
| `ad_impressions` | Verified ad impressions served |
| `estimated_monetized_playbacks` | Instances where viewers saw at least one ad (+/-2.0% error) |
| `estimated_playback_based_cpm` | Gross revenue per thousand playbacks |

### Ad Metric Definitions

- **CPM (Cost Per Mille)**: Revenue per 1,000 impressions
- **Playback-based CPM**: Revenue per 1,000 video playbacks with ads
- **Monetized Playbacks**: Video views that included at least one ad impression

## Metric Availability by Report Type

| Category | Available In |
|----------|--------------|
| View/Watch Metrics | All reports |
| Engagement Metrics | Most reports |
| Annotation/Card Metrics | Specific interaction reports |
| Revenue Metrics | Monetary reports only (requires monetary scope) |
| Ad Performance | Content owner ad reports |

## Data Accuracy Notes

- `estimated_monetized_playbacks` has +/-2.0% error margin
- Revenue metrics are estimates until month-end finalization
- Some metrics may be delayed by 24-48 hours
- Privacy thresholds may affect metric availability for small audiences
