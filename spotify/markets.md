---
created: 2026-01-09
tags: [type/api-reference, api/markets]
api_name: Spotify Web API
category: Markets
endpoint_count: 1
---

# Spotify Web API - Markets

[[README|Back to Overview]]

---

## GET /markets

**Get Available Markets
**

Get the list of markets where Spotify is available.


### Example

```bash
curl -X GET \
  -H "Authorization: Bearer $TOKEN" \
  "https://api.spotify.com/v1/markets"
```

---
