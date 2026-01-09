---
created: 2026-01-09
tags: [type/api-reference, api/categories]
api_name: Spotify Web API
category: Categories
endpoint_count: 2
---

# Spotify Web API - Categories

[[README|Back to Overview]]

---

## GET /browse/categories

**Get Several Browse Categories
**

Get a list of categories used to tag items in Spotify (on, for example, the Spotify player’s “Browse” tab).


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
  "https://api.spotify.com/v1/browse/categories"
```

---

## GET /browse/categories/{category_id}

**Get Single Browse Category
**

Get a single category used to tag items in Spotify (on, for example, the Spotify player’s “Browse” tab).


### Parameters

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| `category_id` | path | string | Yes |  |
| `locale` | query | string | No |  |

### Example

```bash
curl -X GET \
  -H "Authorization: Bearer $TOKEN" \
  "https://api.spotify.com/v1/browse/categories/{category_id}"
```

---
