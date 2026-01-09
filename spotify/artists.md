---
created: 2026-01-09
tags: [type/api-reference, api/artists]
api_name: Spotify Web API
category: Artists
endpoint_count: 5
---

# Spotify Web API - Artists

[[README|Back to Overview]]

---

## GET /artists/{id}

**Get Artist
**

Get Spotify catalog information for a single artist identified by their unique Spotify ID.


### Parameters

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| `` | query | string | No |  |

### Example

```bash
curl -X GET \
  -H "Authorization: Bearer $TOKEN" \
  "https://api.spotify.com/v1/artists/{id}"
```

---

## GET /artists

**Get Several Artists
**

Get Spotify catalog information for several artists based on their Spotify IDs.


### Parameters

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| `ids` | query | string | Yes |  |

### Example

```bash
curl -X GET \
  -H "Authorization: Bearer $TOKEN" \
  "https://api.spotify.com/v1/artists"
```

---

## GET /artists/{id}/albums

**Get Artist's Albums
**

Get Spotify catalog information about an artist's albums.


### Parameters

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| `` | query | string | No |  |
| `` | query | string | No |  |
| `` | query | string | No |  |
| `` | query | string | No |  |
| `` | query | string | No |  |

### Example

```bash
curl -X GET \
  -H "Authorization: Bearer $TOKEN" \
  "https://api.spotify.com/v1/artists/{id}/albums"
```

---

## GET /artists/{id}/top-tracks

**Get Artist's Top Tracks
**

Get Spotify catalog information about an artist's top tracks by country.


### Parameters

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| `` | query | string | No |  |
| `` | query | string | No |  |

### Example

```bash
curl -X GET \
  -H "Authorization: Bearer $TOKEN" \
  "https://api.spotify.com/v1/artists/{id}/top-tracks"
```

---

## GET /artists/{id}/related-artists

**Get Artist's Related Artists
**

Get Spotify catalog information about artists similar to a given artist. Similarity is based on analysis of the Spotify community's listening history.


### Parameters

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| `` | query | string | No |  |

### Example

```bash
curl -X GET \
  -H "Authorization: Bearer $TOKEN" \
  "https://api.spotify.com/v1/artists/{id}/related-artists"
```

---
