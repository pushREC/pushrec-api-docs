---
source: https://developers.google.com/youtube/reporting/v1/reports/channel_reports
scraped: 2026-01-07
api_provider: Google
discovery_tier: 3
verified: false
---
 YouTube Channel Reports Documentation

## Overview

The YouTube Reporting API enables channel owners to retrieve bulk data reports covering user activity, engagement metrics, and viewing statistics across various dimensions.

## Video Reports

### User Activity (`channel_basic_a3`)

Provides statistics for all user interactions with channel videos.

**Dimensions:**
- `date`
- `channel_id`
- `video_id`
- `live_or_on_demand`
- `subscribed_status`
- `country_code`

**Key Metrics:**
- `engaged_views`
- `views`
- `comments`
- `likes`
- `dislikes`
- `videos_added_to_playlists`
- `shares`
- `watch_time_minutes`
- `average_view_duration_seconds`

### User Activity by Province (`channel_province_a3`)

Focuses on US states and District of Columbia data.

**Additional Dimension:** `province_code`

**Metrics:**
- `engaged_views`
- `views`
- `watch_time_minutes`
- `average_view_duration_seconds`

### Playback Locations (`channel_playback_location_a3`)

Analyzes viewing by page/application type.

**Dimensions:**
- `playback_location_type`
- `playback_location_detail`

### Traffic Sources (`channel_traffic_source_a3`)

Aggregates views by referral method.

**Dimensions:**
- `traffic_source_type`
- `traffic_source_detail`

### Device/OS (`channel_device_os_a3`)

Breaks down viewing by device and operating system.

**Dimensions:**
- `device_type`
- `operating_system`

### Demographics (`channel_demographics_a1`)

Shows views by viewer demographics.

**Dimensions:**
- `age_group`
- `gender`

### Sharing (`channel_sharing_service_a2`)

Cross-platform sharing metrics.

**Dimensions:**
- `sharing_service`

### Annotations (`channel_annotations_a2`)

Individual annotation performance.

**Metrics:**
- `annotation_impressions`
- `annotation_clicks`
- `annotation_click_through_rate`
- `annotation_closes`
- `annotation_close_rate`

### Cards (`channel_cards_a2`)

Card impression and click data.

**Dimensions:**
- `card_type`
- `card_id`

**Metrics:**
- `card_impressions`
- `card_clicks`
- `card_click_rate`
- `card_teaser_impressions`
- `card_teaser_clicks`

### End Screens (`channel_end_screens_a2`)

Post-video element metrics.

**Dimensions:**
- `end_screen_element_type`
- `end_screen_element_id`

**Metrics:**
- `end_screen_element_impressions`
- `end_screen_element_clicks`
- `end_screen_element_click_rate`

### Subtitles (`channel_subtitles_a3`)

Caption language analytics.

**Dimensions:**
- `subtitle_language`
- `subtitle_language_autotranslated`

### Combined (`channel_combined_a3`)

Multi-dimensional analysis combining multiple dimension types.

## Playlist Reports

Parallel structures tracking user interactions within playlist contexts:

| Report ID | Purpose |
|-----------|---------|
| `playlist_basic_a2` | Basic playlist user activity |
| `playlist_playback_location_a2` | Playlist playback locations |
| `playlist_traffic_source_a2` | Playlist traffic sources |
| `playlist_device_os_a2` | Playlist device/OS breakdown |
| `playlist_combined_a2` | Combined playlist analysis |

### Playlist-Specific Metrics

- `playlist_starts` - Playlist playback initiations (web only)
- `playlist_saves_added` - Playlist additions
- `playlist_saves_removed` - Playlist removals

## Report ID Summary

| Report Type | Report ID |
|-------------|-----------|
| User Activity | `channel_basic_a3` |
| Province | `channel_province_a3` |
| Playback Location | `channel_playback_location_a3` |
| Traffic Source | `channel_traffic_source_a3` |
| Device/OS | `channel_device_os_a3` |
| Demographics | `channel_demographics_a1` |
| Sharing | `channel_sharing_service_a2` |
| Annotations | `channel_annotations_a2` |
| Cards | `channel_cards_a2` |
| End Screens | `channel_end_screens_a2` |
| Subtitles | `channel_subtitles_a3` |
| Combined | `channel_combined_a3` |
