---
created: 2026-01-09
tags: [type/api-reference, api/player]
api_name: Spotify Web API
category: Player
endpoint_count: 15
---

# Spotify Web API - Player

[[README|Back to Overview]]

---

## GET /me/player

**Get Playback State
**

Get information about the user’s current playback state, including track or episode, progress, and active device.


### Parameters

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| `` | query | string | No |  |
| `` | query | string | No |  |

### Example

```bash
curl -X GET \
  -H "Authorization: Bearer $TOKEN" \
  "https://api.spotify.com/v1/me/player"
```

---

## PUT /me/player

**Transfer Playback
**

Transfer playback to a new device and optionally begin playback. This API only works for users who have Spotify Premium. The order of execution is not guaranteed when you use this API with other Player API endpoints.


### Example

```bash
curl -X PUT \
  -H "Authorization: Bearer $TOKEN" \
  "https://api.spotify.com/v1/me/player"
```

---

## GET /me/player/devices

**Get Available Devices
**

Get information about a user’s available Spotify Connect devices. Some device models are not supported and will not be listed in the API response.


### Example

```bash
curl -X GET \
  -H "Authorization: Bearer $TOKEN" \
  "https://api.spotify.com/v1/me/player/devices"
```

---

## GET /me/player/currently-playing

**Get Currently Playing Track
**

Get the object currently being played on the user's Spotify account.


### Parameters

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| `` | query | string | No |  |
| `` | query | string | No |  |

### Example

```bash
curl -X GET \
  -H "Authorization: Bearer $TOKEN" \
  "https://api.spotify.com/v1/me/player/currently-playing"
```

---

## PUT /me/player/play

**Start/Resume Playback
**

Start a new context or resume current playback on the user's active device. This API only works for users who have Spotify Premium. The order of execution is not guaranteed when you use this API with other Player API endpoints.


### Parameters

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| `device_id` | query | string | No |  |

### Example

```bash
curl -X PUT \
  -H "Authorization: Bearer $TOKEN" \
  "https://api.spotify.com/v1/me/player/play"
```

---

## PUT /me/player/pause

**Pause Playback
**

Pause playback on the user's account. This API only works for users who have Spotify Premium. The order of execution is not guaranteed when you use this API with other Player API endpoints.


### Parameters

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| `device_id` | query | string | No |  |

### Example

```bash
curl -X PUT \
  -H "Authorization: Bearer $TOKEN" \
  "https://api.spotify.com/v1/me/player/pause"
```

---

## POST /me/player/next

**Skip To Next
**

Skips to next track in the user’s queue. This API only works for users who have Spotify Premium. The order of execution is not guaranteed when you use this API with other Player API endpoints.


### Parameters

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| `device_id` | query | string | No |  |

### Example

```bash
curl -X POST \
  -H "Authorization: Bearer $TOKEN" \
  "https://api.spotify.com/v1/me/player/next"
```

---

## POST /me/player/previous

**Skip To Previous
**

Skips to previous track in the user’s queue. This API only works for users who have Spotify Premium. The order of execution is not guaranteed when you use this API with other Player API endpoints.


### Parameters

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| `device_id` | query | string | No |  |

### Example

```bash
curl -X POST \
  -H "Authorization: Bearer $TOKEN" \
  "https://api.spotify.com/v1/me/player/previous"
```

---

## PUT /me/player/seek

**Seek To Position
**

Seeks to the given position in the user’s currently playing track. This API only works for users who have Spotify Premium. The order of execution is not guaranteed when you use this API with other Player API endpoints.


### Parameters

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| `position_ms` | query | integer | Yes |  |
| `device_id` | query | string | No |  |

### Example

```bash
curl -X PUT \
  -H "Authorization: Bearer $TOKEN" \
  "https://api.spotify.com/v1/me/player/seek"
```

---

## PUT /me/player/repeat

**Set Repeat Mode
**

Set the repeat mode for the user's playback. This API only works for users who have Spotify Premium. The order of execution is not guaranteed when you use this API with other Player API endpoints.


### Parameters

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| `state` | query | string | Yes |  |
| `device_id` | query | string | No |  |

### Example

```bash
curl -X PUT \
  -H "Authorization: Bearer $TOKEN" \
  "https://api.spotify.com/v1/me/player/repeat"
```

---

## PUT /me/player/volume

**Set Playback Volume
**

Set the volume for the user’s current playback device. This API only works for users who have Spotify Premium. The order of execution is not guaranteed when you use this API with other Player API endpoints.


### Parameters

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| `volume_percent` | query | integer | Yes |  |
| `device_id` | query | string | No |  |

### Example

```bash
curl -X PUT \
  -H "Authorization: Bearer $TOKEN" \
  "https://api.spotify.com/v1/me/player/volume"
```

---

## PUT /me/player/shuffle

**Toggle Playback Shuffle
**

Toggle shuffle on or off for user’s playback. This API only works for users who have Spotify Premium. The order of execution is not guaranteed when you use this API with other Player API endpoints.


### Parameters

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| `state` | query | boolean | Yes |  |
| `device_id` | query | string | No |  |

### Example

```bash
curl -X PUT \
  -H "Authorization: Bearer $TOKEN" \
  "https://api.spotify.com/v1/me/player/shuffle"
```

---

## GET /me/player/recently-played

**Get Recently Played Tracks
**

Get tracks from the current user's recently played tracks.
_**Note**: Currently doesn't support podcast episodes._


### Parameters

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| `limit` | query | integer | No |  |
| `after` | query | integer | No |  |
| `before` | query | integer | No |  |

### Example

```bash
curl -X GET \
  -H "Authorization: Bearer $TOKEN" \
  "https://api.spotify.com/v1/me/player/recently-played"
```

---

## GET /me/player/queue

**Get the User's Queue
**

Get the list of objects that make up the user's queue.


### Example

```bash
curl -X GET \
  -H "Authorization: Bearer $TOKEN" \
  "https://api.spotify.com/v1/me/player/queue"
```

---

## POST /me/player/queue

**Add Item to Playback Queue
**

Add an item to be played next in the user's current playback queue. This API only works for users who have Spotify Premium. The order of execution is not guaranteed when you use this API with other Player API endpoints.


### Parameters

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| `uri` | query | string | Yes |  |
| `device_id` | query | string | No |  |

### Example

```bash
curl -X POST \
  -H "Authorization: Bearer $TOKEN" \
  "https://api.spotify.com/v1/me/player/queue"
```

---
