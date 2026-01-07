---
source: https://developers.google.com/youtube/v3/live/guides/encoding-with-dash
scraped: 2026-01-07
method: webfetch
api: youtube-data-v3
category: live-streaming
---

# YouTube DASH Live Streaming Technical Documentation

## Overview

"DASH (Dynamic Adaptive Streaming over HTTP) is the supported protocol for YouTube live streams, utilizing HTTP for segment delivery."

The protocol supports multiple codecs and containers including MP4 with H.264/AAC and WebM with VP8/VP9 and Vorbis/Opus audio.

## Key DASH Advantages

- Based on open standards (ISO/IEC 23009-1:2014)
- HTTP-based infrastructure compatibility and firewall traversal
- Support for multiple simultaneous HTTP sessions
- Nonsequential segment delivery for improved resilience
- Secure delivery via HTTPS
- Lossless delivery guarantees
- Codec-agnostic architecture

## Technical Requirements

### Timing Specifications

The YouTube endpoint functions as a passive HTTP server receiving PUT requests:

- "The MPD and Initialization segments should be PUT within 3 seconds of the first media segment."
- "Each segment or MPD must use a separate PUT request; multi-part upload of multiple segments is not supported."
- "Segments can be provided in nonsequential order within a time window of approximately 3 seconds."
- "The MPD and Initialization segments should be updated at least every 60 seconds."

### URL Structure Requirements

Encoder-generated URLs must append to the YouTube endpoint base URL using these allowed characters:

- Lowercase letters (a-z) and uppercase letters (A-Z)
- Digits (0-9)
- Special characters: underscore, hyphen, period

**MPD URLs** must terminate with `.mpd` extension.

**Segment URLs** must end with `.mp4` (ISO BMFF) or `.webm` (WebM container).

### MPD Requirements

The MPD must contain these mandatory elements:

- `/mpd:MPD/attribute::type`
- `/mpd:MPD/mpd:Period`
- `/mpd:MPD/mpd:Period/mpd:AdaptationSet`
- `/mpd:MPD/mpd:Period/mpd:AdaptationSet/attribute::mimeType`
- `/mpd:MPD/mpd:Period/mpd:AdaptationSet/mpd:SegmentTemplate`
- `media` and `initialization` attributes on SegmentTemplate
- `startNumber` attribute specification

Key MPD configuration:

- "The `<MPD>` element's `minimumUpdatePeriod` attribute must be set to a value equal to or less than 60 seconds."
- Media attribute must use `$Number$` variable for segment URL generation

### Initialization Segment Specifications

"The Initialization segment must not be longer than 100kb."

Can be embedded in MPD using RFC 2397 data URLs or delivered separately. "If the Initialization segment is included in the MPD, then the `data:` URL, which contains the segment, must not be longer than 100kb."

### Encoder Output Requirements

"The Initialization segment and media segments must constitute a multiplexed ISO BMFF or WebM file stream with closed GOPs (groups of pictures)."

- **GOP size target:** approximately 2 seconds, maximum 8 seconds
- Must contain both audio and video tracks
- **Media segment duration recommended:** 1-5 seconds

## Error Handling & HTTP Response Codes

### 200 OK

Successful segment receipt and processing.

### 202 Accepted

Operation accepted for deferred processing. Common when segments arrive out-of-sequence or MPD/initialization segments precede media segments.

### 400 Bad Request

- Malformed URL
- POST exceeds 10MB
- Unparseable MPD
- Corrupt initialization segment

### 401 Unauthorized

"The base URL for the YouTube DASH endpoint is corrupted or expired."

### 405 Method Not Allowed

Request used method other than POST or PUT.

### 409 Conflict

"YouTube cannot process the request. For example, this response might occur if the requester has sent numerous media segments, but YouTube still does not have the MPD, the Initialization segment, or both."

**Important:** "An encoder MUST handle this response code correctly because it can be returned at any time, including during normal operations."

### 500 Internal Server Error

Retry with exponential backoff recommended.

## Retry Strategy

For failed requests: "retry any such request using a randomized binary exponential backoff":

1. Wait randomly between 0-100ms, retry
2. Wait randomly between 0-200ms, retry
3. Wait randomly between 0-400ms, retry
4. Continue doubling the interval

Recommended HTTP timeout: 500ms greater than segment duration.

## Best Practices

### Encryption

"YouTube supports stream encryption via HTTPS. We strongly recommend that you use this feature."

### Segment Duration Communication

Include these MPD elements for performance optimization:

- `duration` attribute
- `timescale` attribute

"The calculated duration from those attributes should be within a factor of 2 of all actual segment durations or streaming performance may suffer."

### Initialization Segment Embedding

"You can represent the Initialization segment directly in the MPD using a `data:` URL, per RFC 2397. This simplifies your stream setup and reduces the possibility that the Initialization segment will not correspond to the rest of the stream."

## Known Limitations

"It is not possible to mix RTMP and DASH ingestions to YouTube. This applies to switching between the two during a broadcast as well as to using one as a primary ingestion method and the other for backup ingestion."

## Configuration Examples

### WebM MPD with Embedded Initialization

```xml
<?xml version="1.0" encoding="UTF-8"?>
<MPD xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance"
     xmlns="urn:mpeg:dash:schema:mpd:2011"
     type="dynamic"
     profiles="urn:mpeg:dash:profile:isoff-live:2011"
     minimumUpdatePeriod="PT60S"
     minBufferTime="PT12S"
     availabilityStartTime="2016-04-13T20:52:58">
  <Period start="PT0S" id="1">
    <AdaptationSet mimeType="video/webm">
      <ContentComponent contentType="video" id="1"/>
      <SegmentTemplate timescale="1000"
           duration="2000"
           startNumber="1"
           initialization="data:video/mp4;base64,AAAAGGZ0eXBpc..."
           media="/dash_upload?cid=xxxx-xxxx-xxxx-xxxx&copy=0&file=media-$Number%09d$.webm"/>
      <Representation id="1" width="1920" height="1080">
        <SubRepresentation contentComponent="1"/>
      </Representation>
    </AdaptationSet>
  </Period>
</MPD>
```

### ISO BMFF MPD with Embedded Initialization

```xml
<?xml version="1.0" encoding="UTF-8"?>
<MPD xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance"
    xmlns="urn:mpeg:dash:schema:mpd:2011"
    type="dynamic"
    minimumUpdatePeriod="PT30S"
    availabilityStartTime="2016-05-04T20:47:25"
    minBufferTime="PT12S"
    profiles="urn:mpeg:dash:profile:isoff-live:2011">
  <Period start="PT0S" id="1">
    <AdaptationSet mimeType="video/mp4" codecs="avc1.4d401e,mp4a.40.2">
      <ContentComponent contentType="video" id="1"/>
      <ContentComponent contentType="audio" id="2"/>
      <SegmentTemplate timescale="600"
             media="/dash_upload?cid=ug50-xg26&file=media$Number%09d$.mp4"
             initialization="data:video/mp4;base64,AAAAGGZ0eXBpc291..."
             duration="306"
             startNumber="1"/>
      <Representation id="1" width="640" height="360" bandwidth="526952">
        <SubRepresentation contentComponent="1" bandwidth="526952" codecs="avc1.4d401e"/>
        <SubRepresentation contentComponent="2" bandwidth="125584" codecs="mp4a.40.2"/>
      </Representation>
    </AdaptationSet>
  </Period>
</MPD>
```

## Specifications References

- ISO/IEC 23009-1:2014 Information technology -- Dynamic adaptive streaming over HTTP (DASH)
- WebM DASH specification documentation
