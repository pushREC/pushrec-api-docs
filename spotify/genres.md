---
created: 2026-01-09
tags: [type/api-reference, api/genres]
api_name: Spotify Web API
category: Genres
endpoint_count: 1
---

# Spotify Web API - Genres

[[README|Back to Overview]]

---

## GET /recommendations/available-genre-seeds

**Get Available Genre Seeds
**

Retrieve a list of available genres seed parameter values for [recommendations](/documentation/web-api/reference/get-recommendations).


### Example

```bash
curl -X GET \
  -H "Authorization: Bearer $TOKEN" \
  "https://api.spotify.com/v1/recommendations/available-genre-seeds"
```

---
