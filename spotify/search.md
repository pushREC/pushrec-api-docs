---
created: 2026-01-09
tags: [type/api-reference, api/search]
api_name: Spotify Web API
category: Search
endpoint_count: 1
---

# Spotify Web API - Search

[[README|Back to Overview]]

---

## GET /search

**Search for Item
**

Get Spotify catalog information about albums, artists, playlists, tracks, shows, episodes or audiobooks
that match a keyword string. Audiobooks are only available within the US, UK, Canada, Ireland, New Zealand and Australia markets.


### Parameters

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| `q` | query | string | Yes |  |
| `type` | query | array | Yes |  |
| `` | query | string | No |  |
| `limit` | query | integer | No |  |
| `offset` | query | integer | No |  |
| `include_external` | query | string | No |  |

### Example

```bash
curl -X GET \
  -H "Authorization: Bearer $TOKEN" \
  "https://api.spotify.com/v1/search"
```

---
