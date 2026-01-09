---
created: 2026-01-09
tags: [type/api-reference, api/albums]
api_name: Spotify Web API
category: Albums
endpoint_count: 8
---

# Spotify Web API - Albums

[[README|Back to Overview]]

---

## GET /albums/{id}

**Get Album
**

Get Spotify catalog information for a single album.


### Parameters

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| `` | query | string | No |  |
| `` | query | string | No |  |

### Example

```bash
curl -X GET \
  -H "Authorization: Bearer $TOKEN" \
  "https://api.spotify.com/v1/albums/{id}"
```

---

## GET /albums

**Get Several Albums
**

Get Spotify catalog information for multiple albums identified by their Spotify IDs.


### Parameters

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| `` | query | string | No |  |
| `` | query | string | No |  |

### Example

```bash
curl -X GET \
  -H "Authorization: Bearer $TOKEN" \
  "https://api.spotify.com/v1/albums"
```

---

## GET /albums/{id}/tracks

**Get Album Tracks
**

Get Spotify catalog information about an album’s tracks.
Optional parameters can be used to limit the number of tracks returned.


### Parameters

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| `` | query | string | No |  |
| `` | query | string | No |  |
| `` | query | string | No |  |
| `` | query | string | No |  |

### Example

```bash
curl -X GET \
  -H "Authorization: Bearer $TOKEN" \
  "https://api.spotify.com/v1/albums/{id}/tracks"
```

---

## GET /me/albums

**Get User's Saved Albums
**

Get a list of the albums saved in the current Spotify user's 'Your Music' library.


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
  "https://api.spotify.com/v1/me/albums"
```

---

## PUT /me/albums

**Save Albums for Current User
**

Save one or more albums to the current user's 'Your Music' library.


### Parameters

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| `` | query | string | No |  |

### Example

```bash
curl -X PUT \
  -H "Authorization: Bearer $TOKEN" \
  "https://api.spotify.com/v1/me/albums"
```

---

## DELETE /me/albums

**Remove Users' Saved Albums
**

Remove one or more albums from the current user's 'Your Music' library.


### Parameters

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| `` | query | string | No |  |

### Example

```bash
curl -X DELETE \
  -H "Authorization: Bearer $TOKEN" \
  "https://api.spotify.com/v1/me/albums"
```

---

## GET /me/albums/contains

**Check User's Saved Albums
**

Check if one or more albums is already saved in the current Spotify user's 'Your Music' library.


### Parameters

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| `` | query | string | No |  |

### Example

```bash
curl -X GET \
  -H "Authorization: Bearer $TOKEN" \
  "https://api.spotify.com/v1/me/albums/contains"
```

---

## GET /browse/new-releases

**Get New Releases
**

Get a list of new album releases featured in Spotify (shown, for example, on a Spotify player’s “Browse” tab).


### Parameters

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| `` | query | string | No |  |
| `` | query | string | No |  |

### Example

```bash
curl -X GET \
  -H "Authorization: Bearer $TOKEN" \
  "https://api.spotify.com/v1/browse/new-releases"
```

---
