---
source: https://developers.google.com/youtube/v3/live/guides/hls-ingestion
scraped: 2026-01-07
method: webfetch
api: youtube-data-v3
category: live-streaming
---

# YouTube Live Streaming via HLS - Technical Documentation

## Overview

This documentation explains how encoder vendors can implement HTTP Live Streaming (HLS) protocol to deliver live content to YouTube. The approach suits premium content requiring "high quality and high resolution at a relatively higher latency."

## Media Format Requirements

### Video and Audio Specifications

- **Container format:** M2TS
- **Video codecs:** H.264 or HEVC
- **Frame rates:** Up to 60fps
- **GOP structure:** Closed GOP only
- **Audio codec:** AAC (single-track only)
- **Duration per segment:** 1-4 seconds recommended; maximum 5 seconds

### HDR Support (HEVC only)

- **Color standards:** 10-bit PQ or HLG with non-constant luminance
- **Chroma format:** YUV 4:2:0 10-bit
- **Color primaries:** Rec. 2020
- **Matrix coefficients:** Rec. 2020 non-constant luminance
- **Sample range:** Limited-range (MPEG) or full-range (JPEG)

## Obtaining Ingestion URLs

### Via YouTube Live Streaming API

Create a liveStream resource with these properties:

```json
"cdn": {
  "ingestionType": "hls",
  "frameRate": "variable",
  "resolution": "variable"
}
```

Response fields provide primary and backup ingestion addresses.

### Via Creator Studio (Beta)

Construct URLs using stream keys:

- **Primary:** `https://a.upload.youtube.com/http_upload_hls?cid=$STREAM_KEY&copy=0&file=`
- **Backup:** `https://b.upload.youtube.com/http_upload_hls?cid=$STREAM_KEY&copy=1&file=`

## HLS Protocol Requirements

### Encoder Obligations

- Send "exactly one encoded stream with the highest resolution that you want to serve"
- Mux audio and video together
- Use HTTPS with persistent connections
- Transmit only Media Playlists (Master Playlists ignored)

### Media Playlist Requirements

- **Filename extension:** `.m3u8` or `.m3u`
- **Initial sequence number:** 0, incrementing monotonically
- **Maximum outstanding segments:** 5 (plus acknowledged segments)
- Send updated playlists for every segment
- **Tag `EXT-X-KEY` and `EXT-X-SESSION-KEY`:** Not supported
- Include `EXT-X-MEDIA-SEQUENCE` tag identifying first segment

### Media Segment Requirements

- **Filename extension:** `.ts`
- Unique names across reboots/restarts
- Self-initializing M2TS format
- Single MPEG-2 Program per segment
- First two Transport Stream packets: PAT and PMT

## HTTP Response Codes

| Code | Meaning |
|------|---------|
| 200 | Successful receipt and handling |
| 202 | Segment received before playlist identification |
| 400 | Malformed URL or unparseable playlist |
| 401 | Corrupted/expired CID parameter |
| 405 | Request not POST, PUT, or DELETE |
| 500 | Server error; retry with exponential backoff |

## File Naming Conventions

Acceptable characters: alphanumeric, underscores, forward slashes, hyphens, periods. No URL encoding required. Relative or absolute path components permitted if referenced consistently in playlist entries.

## User-Agent Header

Encoders should set headers using format: `User-Agent: <manufacturer> / <model> / <version>` for debugging purposes only.

## Closed Captions

- **Option 1:** Separate HTTP POST requests (all HLS ingestions)
- **Option 2:** Embedded 608/708 captions (H.264 only; unsupported for HEVC)

## Segment Duration Rationale

Smaller segments reduce latency but increase rebuffer rates and decrease encoding efficiency. The 1-4 second recommendation balances these trade-offs for premium content delivery.
