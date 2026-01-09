---
created: 2026-01-09
tags: [type/api-reference, api/tracks]
api_name: Spotify Web API
category: Tracks
endpoint_count: 10
---

# Spotify Web API - Tracks

[[README|Back to Overview]]

---

## GET /tracks/{id}

**Get Track
**

Get Spotify catalog information for a single track identified by its
unique Spotify ID.


### Parameters

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| `id` | path | string | Yes |  |
| `` | query | string | No |  |

### Example

```bash
curl -X GET \
  -H "Authorization: Bearer $TOKEN" \
  "https://api.spotify.com/v1/tracks/{id}"
```

---

## GET /tracks

**Get Several Tracks
**

Get Spotify catalog information for multiple tracks based on their Spotify IDs.


### Parameters

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| `` | query | string | No |  |
| `ids` | query | string | Yes |  |

### Example

```bash
curl -X GET \
  -H "Authorization: Bearer $TOKEN" \
  "https://api.spotify.com/v1/tracks"
```

---

## GET /me/tracks

**Get User's Saved Tracks
**

Get a list of the songs saved in the current Spotify user's 'Your Music' library.


### Parameters

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| `` | query | string | No |  |
| `` | query | string | No |  |
| `` | query | string | No |  |

### Example

```bash
curl -X GET \
  -H "Authorization: Bearer $TOKEN" \
  "https://api.spotify.com/v1/me/tracks"
```

---

## PUT /me/tracks

**Save Tracks for Current User
**

Save one or more tracks to the current user's 'Your Music' library.


### Example

```bash
curl -X PUT \
  -H "Authorization: Bearer $TOKEN" \
  "https://api.spotify.com/v1/me/tracks"
```

---

## DELETE /me/tracks

**Remove User's Saved Tracks
**

Remove one or more tracks from the current user's 'Your Music' library.


### Parameters

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| `` | query | string | No |  |

### Example

```bash
curl -X DELETE \
  -H "Authorization: Bearer $TOKEN" \
  "https://api.spotify.com/v1/me/tracks"
```

---

## GET /me/tracks/contains

**Check User's Saved Tracks
**

Check if one or more tracks is already saved in the current Spotify user's 'Your Music' library.


### Parameters

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| `` | query | string | No |  |

### Example

```bash
curl -X GET \
  -H "Authorization: Bearer $TOKEN" \
  "https://api.spotify.com/v1/me/tracks/contains"
```

---

## GET /audio-features

**Get Several Tracks' Audio Features
**

Get audio features for multiple tracks based on their Spotify IDs.


### Parameters

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| `ids` | query | string | Yes |  |

### Example

```bash
curl -X GET \
  -H "Authorization: Bearer $TOKEN" \
  "https://api.spotify.com/v1/audio-features"
```

---

## GET /audio-features/{id}

**Get Track's Audio Features
**

Get audio feature information for a single track identified by its unique
Spotify ID.


### Parameters

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| `id` | path | string | Yes |  |

### Example

```bash
curl -X GET \
  -H "Authorization: Bearer $TOKEN" \
  "https://api.spotify.com/v1/audio-features/{id}"
```

---

## GET /audio-analysis/{id}

**Get Track's Audio Analysis
**

Get a low-level audio analysis for a track in the Spotify catalog. The audio analysis describes the track’s structure and musical content, including rhythm, pitch, and timbre.


### Parameters

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| `id` | path | string | Yes |  |

### Example

```bash
curl -X GET \
  -H "Authorization: Bearer $TOKEN" \
  "https://api.spotify.com/v1/audio-analysis/{id}"
```

---

## GET /recommendations

**Get Recommendations
**

Recommendations are generated based on the available information for a given seed entity and matched against similar artists and tracks. If there is sufficient information about the provided seeds, a list of tracks will be returned together with pool size details.

For artists and tracks that are very new or obscure there might not be enough data to generate a list of tracks.


### Parameters

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| `limit` | query | integer | No |  |
| `` | query | string | No |  |
| `seed_artists` | query | string | Yes |  |
| `seed_genres` | query | string | Yes |  |
| `seed_tracks` | query | string | Yes |  |
| `min_acousticness` | query | number | No |  |
| `max_acousticness` | query | number | No |  |
| `target_acousticness` | query | number | No |  |
| `min_danceability` | query | number | No |  |
| `max_danceability` | query | number | No |  |
| `target_danceability` | query | number | No |  |
| `min_duration_ms` | query | integer | No |  |
| `max_duration_ms` | query | integer | No |  |
| `target_duration_ms` | query | integer | No |  |
| `min_energy` | query | number | No |  |
| `max_energy` | query | number | No |  |
| `target_energy` | query | number | No |  |
| `min_instrumentalness` | query | number | No |  |
| `max_instrumentalness` | query | number | No |  |
| `target_instrumentalness` | query | number | No |  |
| `min_key` | query | integer | No |  |
| `max_key` | query | integer | No |  |
| `target_key` | query | integer | No |  |
| `min_liveness` | query | number | No |  |
| `max_liveness` | query | number | No |  |
| `target_liveness` | query | number | No |  |
| `min_loudness` | query | number | No |  |
| `max_loudness` | query | number | No |  |
| `target_loudness` | query | number | No |  |
| `min_mode` | query | integer | No |  |
| `max_mode` | query | integer | No |  |
| `target_mode` | query | integer | No |  |
| `min_popularity` | query | integer | No |  |
| `max_popularity` | query | integer | No |  |
| `target_popularity` | query | integer | No |  |
| `min_speechiness` | query | number | No |  |
| `max_speechiness` | query | number | No |  |
| `target_speechiness` | query | number | No |  |
| `min_tempo` | query | number | No |  |
| `max_tempo` | query | number | No |  |
| `target_tempo` | query | number | No |  |
| `min_time_signature` | query | integer | No |  |
| `max_time_signature` | query | integer | No |  |
| `target_time_signature` | query | integer | No |  |
| `min_valence` | query | number | No |  |
| `max_valence` | query | number | No |  |
| `target_valence` | query | number | No |  |

### Example

```bash
curl -X GET \
  -H "Authorization: Bearer $TOKEN" \
  "https://api.spotify.com/v1/recommendations"
```

---
