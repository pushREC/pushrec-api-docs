---
created: 2026-01-09
tags: [type/api-reference, api/playlists]
api_name: Spotify Web API
category: Playlists
endpoint_count: 13
---

# Spotify Web API - Playlists

[[README|Back to Overview]]

---

## GET /playlists/{playlist_id}

**Get Playlist
**

Get a playlist owned by a Spotify user.


### Parameters

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| `` | query | string | No |  |
| `` | query | string | No |  |
| `fields` | query | string | No |  |
| `` | query | string | No |  |

### Example

```bash
curl -X GET \
  -H "Authorization: Bearer $TOKEN" \
  "https://api.spotify.com/v1/playlists/{playlist_id}"
```

---

## PUT /playlists/{playlist_id}

**Change Playlist Details
**

Change a playlist's name and public/private state. (The user must, of
course, own the playlist.)


### Parameters

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| `` | query | string | No |  |

### Example

```bash
curl -X PUT \
  -H "Authorization: Bearer $TOKEN" \
  "https://api.spotify.com/v1/playlists/{playlist_id}"
```

---

## GET /playlists/{playlist_id}/tracks

**Get Playlist Items
**

Get full details of the items of a playlist owned by a Spotify user.


### Parameters

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| `` | query | string | No |  |
| `` | query | string | No |  |
| `fields` | query | string | No |  |
| `` | query | string | No |  |
| `` | query | string | No |  |
| `` | query | string | No |  |

### Example

```bash
curl -X GET \
  -H "Authorization: Bearer $TOKEN" \
  "https://api.spotify.com/v1/playlists/{playlist_id}/tracks"
```

---

## POST /playlists/{playlist_id}/tracks

**Add Items to Playlist
**

Add one or more items to a user's playlist.


### Parameters

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| `` | query | string | No |  |
| `position` | query | integer | No |  |
| `uris` | query | string | No |  |

### Example

```bash
curl -X POST \
  -H "Authorization: Bearer $TOKEN" \
  "https://api.spotify.com/v1/playlists/{playlist_id}/tracks"
```

---

## PUT /playlists/{playlist_id}/tracks

**Update Playlist Items
**

Either reorder or replace items in a playlist depending on the request's parameters.
To reorder items, include `range_start`, `insert_before`, `range_length` and `snapshot_id` in the request's body.
To replace items, include `uris` as either a query parameter or in the request's body.
Replacing items in a playlist will overwrite its existing items. This operation can be used for replacing or clearing items in a playlist.
<br/>
**Note**: Replace and reorder are mutually exclusive operations which share the same endpoint, but have different parameters.
These operations can't be applied together in a single request.


### Parameters

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| `` | query | string | No |  |
| `uris` | query | string | No |  |

### Example

```bash
curl -X PUT \
  -H "Authorization: Bearer $TOKEN" \
  "https://api.spotify.com/v1/playlists/{playlist_id}/tracks"
```

---

## DELETE /playlists/{playlist_id}/tracks

**Remove Playlist Items
**

Remove one or more items from a user's playlist.


### Parameters

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| `` | query | string | No |  |

### Example

```bash
curl -X DELETE \
  -H "Authorization: Bearer $TOKEN" \
  "https://api.spotify.com/v1/playlists/{playlist_id}/tracks"
```

---

## GET /me/playlists

**Get Current User's Playlists
**

Get a list of the playlists owned or followed by the current Spotify
user.


### Parameters

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| `` | query | string | No |  |
| `offset` | query | integer | No |  |

### Example

```bash
curl -X GET \
  -H "Authorization: Bearer $TOKEN" \
  "https://api.spotify.com/v1/me/playlists"
```

---

## GET /users/{user_id}/playlists

**Get User's Playlists
**

Get a list of the playlists owned or followed by a Spotify user.


### Parameters

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| `` | query | string | No |  |
| `` | query | string | No |  |
| `offset` | query | integer | No |  |

### Example

```bash
curl -X GET \
  -H "Authorization: Bearer $TOKEN" \
  "https://api.spotify.com/v1/users/{user_id}/playlists"
```

---

## POST /users/{user_id}/playlists

**Create Playlist
**

Create a playlist for a Spotify user. (The playlist will be empty until
you [add tracks](/documentation/web-api/reference/add-tracks-to-playlist).)
Each user is generally limited to a maximum of 11000 playlists.


### Parameters

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| `` | query | string | No |  |

### Example

```bash
curl -X POST \
  -H "Authorization: Bearer $TOKEN" \
  "https://api.spotify.com/v1/users/{user_id}/playlists"
```

---

## GET /browse/featured-playlists

**Get Featured Playlists
**

Get a list of Spotify featured playlists (shown, for example, on a Spotify player's 'Browse' tab).


### Parameters

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| `locale` | query | string | No |  |
| `` | query | string | No |  |
| `` | query | string | No |  |

### Example

```bash
curl -X GET \
  -H "Authorization: Bearer $TOKEN" \
  "https://api.spotify.com/v1/browse/featured-playlists"
```

---

## GET /browse/categories/{category_id}/playlists

**Get Category's Playlists
**

Get a list of Spotify playlists tagged with a particular category.


### Parameters

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| `category_id` | path | string | Yes |  |
| `` | query | string | No |  |
| `` | query | string | No |  |

### Example

```bash
curl -X GET \
  -H "Authorization: Bearer $TOKEN" \
  "https://api.spotify.com/v1/browse/categories/{category_id}/playlists"
```

---

## GET /playlists/{playlist_id}/images

**Get Playlist Cover Image
**

Get the current image associated with a specific playlist.


### Parameters

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| `` | query | string | No |  |

### Example

```bash
curl -X GET \
  -H "Authorization: Bearer $TOKEN" \
  "https://api.spotify.com/v1/playlists/{playlist_id}/images"
```

---

## PUT /playlists/{playlist_id}/images

**Add Custom Playlist Cover Image
**

Replace the image used to represent a specific playlist.


### Parameters

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| `` | query | string | No |  |

### Example

```bash
curl -X PUT \
  -H "Authorization: Bearer $TOKEN" \
  "https://api.spotify.com/v1/playlists/{playlist_id}/images"
```

---
