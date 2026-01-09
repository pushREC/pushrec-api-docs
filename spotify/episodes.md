---
created: 2026-01-09
tags: [type/api-reference, api/episodes]
api_name: Spotify Web API
category: Episodes
endpoint_count: 6
---

# Spotify Web API - Episodes

[[README|Back to Overview]]

---

## GET /episodes/{id}

**Get Episode
**

Get Spotify catalog information for a single episode identified by its
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
  "https://api.spotify.com/v1/episodes/{id}"
```

---

## GET /episodes

**Get Several Episodes
**

Get Spotify catalog information for several episodes based on their Spotify IDs.


### Parameters

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| `ids` | query | string | Yes |  |
| `` | query | string | No |  |

### Example

```bash
curl -X GET \
  -H "Authorization: Bearer $TOKEN" \
  "https://api.spotify.com/v1/episodes"
```

---

## GET /me/episodes

**Get User's Saved Episodes
**

Get a list of the episodes saved in the current Spotify user's library.<br/>
This API endpoint is in __beta__ and could change without warning. Please share any feedback that you have, or issues that you discover, in our [developer community forum](https://community.spotify.com/t5/Spotify-for-Developers/bd-p/Spotify_Developer).


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
  "https://api.spotify.com/v1/me/episodes"
```

---

## PUT /me/episodes

**Save Episodes for Current User
**

Save one or more episodes to the current user's library.<br/>
This API endpoint is in __beta__ and could change without warning. Please share any feedback that you have, or issues that you discover, in our [developer community forum](https://community.spotify.com/t5/Spotify-for-Developers/bd-p/Spotify_Developer).


### Parameters

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| `ids` | query | string | Yes |  |

### Example

```bash
curl -X PUT \
  -H "Authorization: Bearer $TOKEN" \
  "https://api.spotify.com/v1/me/episodes"
```

---

## DELETE /me/episodes

**Remove User's Saved Episodes
**

Remove one or more episodes from the current user's library.<br/>
This API endpoint is in __beta__ and could change without warning. Please share any feedback that you have, or issues that you discover, in our [developer community forum](https://community.spotify.com/t5/Spotify-for-Developers/bd-p/Spotify_Developer).


### Parameters

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| `` | query | string | No |  |

### Example

```bash
curl -X DELETE \
  -H "Authorization: Bearer $TOKEN" \
  "https://api.spotify.com/v1/me/episodes"
```

---

## GET /me/episodes/contains

**Check User's Saved Episodes
**

Check if one or more episodes is already saved in the current Spotify user's 'Your Episodes' library.<br/>
This API endpoint is in __beta__ and could change without warning. Please share any feedback that you have, or issues that you discover, in our [developer community forum](https://community.spotify.com/t5/Spotify-for-Developers/bd-p/Spotify_Developer)..


### Parameters

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| `ids` | query | string | Yes |  |

### Example

```bash
curl -X GET \
  -H "Authorization: Bearer $TOKEN" \
  "https://api.spotify.com/v1/me/episodes/contains"
```

---
