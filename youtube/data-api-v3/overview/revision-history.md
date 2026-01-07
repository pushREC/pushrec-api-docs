---
source: https://developers.google.com/youtube/v3/revision_history
scraped: 2026-01-07
method: bright_data
api: youtube-data-v3
category: overview
---

# YouTube Data API v3 Revision History

## December 4, 2025

The quota cost for video uploads decreased from approximately 1600 units to approximately 100 units. Documentation and the Quota Calculator were updated accordingly.

## July 10, 2025

Starting July 21, 2025, the `video.list` method's `mostPopular` chart will feature videos from Trending Music, Movies, and Gaming charts instead of the previous Trending Now list.

## March 26, 2025

Beginning March 31, 2025, YouTube changed how Shorts view counts are calculated. Views now count each play or replay start without minimum watch time requirements. Affected fields include `channels.statistics.viewCount` and `videos.statistics.viewCount`.

## October 30, 2024

The API now supports identifying videos with altered or synthetic content via the `status.containsSyntheticMedia` property. This can be set using `videos.insert` or `videos.update` methods.

## April 30, 2024

Channel discussions are no longer supported in the YouTube Data API. The API cannot insert or retrieve channel discussion resources.

## April 12, 2024

The `sync` parameter for `captions.insert` and `captions.update` became unsupported. Developers must now include timing information when uploading caption tracks.

## March 12, 2024

The `snippet.name` field for captions has a maximum length of 150 characters. The API returns a `nameTooLong` error for longer track names.

## March 7, 2024

The `brandingSettings.channel.moderateComments` property was deprecated and is no longer supported.

## January 31, 2024

The `channels.list` method gained a new `forHandle` parameter enabling channel lookup by YouTube handle.

## November 9, 2023

References to the `videoId` resource under Comments were removed from documentation as this resource is not returned via API calls.

## September 12, 2023

The `comments.markAsSpam` method, previously unsupported on YouTube, was officially deprecated in the API.

## August 22, 2023

The `search.list` method now supports the `videoPaidProductPlacement` parameter for filtering videos with creator-denoted paid promotions.

## August 18, 2023

Documentation clarified that concurrent viewer counts from the API may differ from YouTube Analytics' processed, despammed counts.

## August 7, 2023

The `search.list` method's `relatedToVideoId` parameter was fully removed after previous deprecation notice.

## June 28, 2023

The `thumbnails.set` method now returns an `uploadRateLimitExceeded` error when channels exceed thumbnail upload limits.

## June 12, 2023

The `search.list` method's `relatedToVideoId` parameter was deprecated, effective August 7, 2023.

## Previous Notable Updates

### August 22, 2022
Video statistics field type annotations corrected from unsigned long to string.

### August 5, 2022
YouTube changed caption ID generation. Both old and new IDs were supported until December 1, 2022.

### April 27, 2022
Maximum video upload file size increased from 128GB to 256GB.

### December 15, 2021
The `statistics.dislikeCount` property became private, visible only to video owners.

### November 18, 2021
Announcement that dislike counts would become private as of December 13, 2021.

### July 2, 2021
The `commentThreads.update` endpoint was deprecated, with `comments.update` recommended as alternative.

### May 12, 2021
Multiple channel properties and channel section features were deprecated.

### March 31, 2020
New `member` and `membershipsLevel` resources replaced the deprecated `sponsor` resource.

### January 10, 2020
Added support for identifying child-directed content via `selfDeclaredMadeForKids` and `madeForKids` properties.

### October 15, 2020
New developer policy sections addressing embedded player data collection and Made for Kids content checking.
