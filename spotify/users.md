---
created: 2026-01-09
tags: [type/api-reference, api/users]
api_name: Spotify Web API
category: Users
endpoint_count: 10
---

# Spotify Web API - Users

[[README|Back to Overview]]

---

## GET /me

**Get Current User's Profile
**

Get detailed profile information about the current user (including the
current user's username).


### Example

```bash
curl -X GET \
  -H "Authorization: Bearer $TOKEN" \
  "https://api.spotify.com/v1/me"
```

---

## GET /me/top/{type}

**Get User's Top Items
**

Get the current user's top artists or tracks based on calculated affinity.


### Parameters

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| `type` | path | string | Yes |  |
| `time_range` | query | string | No |  |
| `` | query | string | No |  |
| `` | query | string | No |  |

### Example

```bash
curl -X GET \
  -H "Authorization: Bearer $TOKEN" \
  "https://api.spotify.com/v1/me/top/{type}"
```

---

## GET /users/{user_id}

**Get User's Profile
**

Get public profile information about a Spotify user.


### Parameters

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| `` | query | string | No |  |

### Example

```bash
curl -X GET \
  -H "Authorization: Bearer $TOKEN" \
  "https://api.spotify.com/v1/users/{user_id}"
```

---

## PUT /playlists/{playlist_id}/followers

**Follow Playlist
**

Add the current user as a follower of a playlist.


### Parameters

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| `` | query | string | No |  |

### Example

```bash
curl -X PUT \
  -H "Authorization: Bearer $TOKEN" \
  "https://api.spotify.com/v1/playlists/{playlist_id}/followers"
```

---

## DELETE /playlists/{playlist_id}/followers

**Unfollow Playlist
**

Remove the current user as a follower of a playlist.


### Parameters

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| `` | query | string | No |  |

### Example

```bash
curl -X DELETE \
  -H "Authorization: Bearer $TOKEN" \
  "https://api.spotify.com/v1/playlists/{playlist_id}/followers"
```

---

## GET /me/following

**Get Followed Artists
**

Get the current user's followed artists.


### Parameters

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| `type` | query | string | Yes |  |
| `after` | query | string | No |  |
| `limit` | query | integer | No |  |

### Example

```bash
curl -X GET \
  -H "Authorization: Bearer $TOKEN" \
  "https://api.spotify.com/v1/me/following"
```

---

## PUT /me/following

**Follow Artists or Users
**

Add the current user as a follower of one or more artists or other Spotify users.


### Parameters

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| `type` | query | string | Yes |  |
| `ids` | query | string | Yes |  |

### Example

```bash
curl -X PUT \
  -H "Authorization: Bearer $TOKEN" \
  "https://api.spotify.com/v1/me/following"
```

---

## DELETE /me/following

**Unfollow Artists or Users
**

Remove the current user as a follower of one or more artists or other Spotify users.


### Parameters

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| `type` | query | string | Yes |  |
| `ids` | query | string | Yes |  |

### Example

```bash
curl -X DELETE \
  -H "Authorization: Bearer $TOKEN" \
  "https://api.spotify.com/v1/me/following"
```

---

## GET /me/following/contains

**Check If User Follows Artists or Users
**

Check to see if the current user is following one or more artists or other Spotify users.


### Parameters

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| `type` | query | string | Yes |  |
| `ids` | query | string | Yes |  |

### Example

```bash
curl -X GET \
  -H "Authorization: Bearer $TOKEN" \
  "https://api.spotify.com/v1/me/following/contains"
```

---

## GET /playlists/{playlist_id}/followers/contains

**Check if Current User Follows Playlist
**

Check to see if the current user is following a specified playlist.


### Parameters

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| `` | query | string | No |  |
| `ids` | query | string | No |  |

### Example

```bash
curl -X GET \
  -H "Authorization: Bearer $TOKEN" \
  "https://api.spotify.com/v1/playlists/{playlist_id}/followers/contains"
```

---
