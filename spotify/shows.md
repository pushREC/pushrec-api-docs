---
created: 2026-01-09
tags: [type/api-reference, api/shows]
api_name: Spotify Web API
category: Shows
endpoint_count: 7
---

# Spotify Web API - Shows

[[README|Back to Overview]]

---

## GET /shows/{id}

**Get Show
**

Get Spotify catalog information for a single show identified by its
unique Spotify ID.


### Parameters

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| `` | query | string | No |  |
| `` | query | string | No |  |

### Example

```bash
curl -X GET \
  -H "Authorization: Bearer $TOKEN" \
  "https://api.spotify.com/v1/shows/{id}"
```

---

## GET /shows

**Get Several Shows
**

Get Spotify catalog information for several shows based on their Spotify IDs.


### Parameters

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| `` | query | string | No |  |
| `` | query | string | No |  |

### Example

```bash
curl -X GET \
  -H "Authorization: Bearer $TOKEN" \
  "https://api.spotify.com/v1/shows"
```

---

## GET /shows/{id}/episodes

**Get Show Episodes
**

Get Spotify catalog information about an show’s episodes. Optional parameters can be used to limit the number of episodes returned.


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
  "https://api.spotify.com/v1/shows/{id}/episodes"
```

---

## GET /me/shows

**Get User's Saved Shows
**

Get a list of shows saved in the current Spotify user's library. Optional parameters can be used to limit the number of shows returned.


### Parameters

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| `` | query | string | No |  |
| `` | query | string | No |  |

### Example

```bash
curl -X GET \
  -H "Authorization: Bearer $TOKEN" \
  "https://api.spotify.com/v1/me/shows"
```

---

## PUT /me/shows

**Save Shows for Current User
**

Save one or more shows to current Spotify user's library.


### Parameters

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| `` | query | string | No |  |

### Example

```bash
curl -X PUT \
  -H "Authorization: Bearer $TOKEN" \
  "https://api.spotify.com/v1/me/shows"
```

---

## DELETE /me/shows

**Remove User's Saved Shows
**

Delete one or more shows from current Spotify user's library.


### Parameters

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| `` | query | string | No |  |
| `` | query | string | No |  |

### Example

```bash
curl -X DELETE \
  -H "Authorization: Bearer $TOKEN" \
  "https://api.spotify.com/v1/me/shows"
```

---

## GET /me/shows/contains

**Check User's Saved Shows
**

Check if one or more shows is already saved in the current Spotify user's library.


### Parameters

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| `` | query | string | No |  |

### Example

```bash
curl -X GET \
  -H "Authorization: Bearer $TOKEN" \
  "https://api.spotify.com/v1/me/shows/contains"
```

---
