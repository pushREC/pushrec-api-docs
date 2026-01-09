---
created: 2026-01-09
tags: [type/api-reference, api/audiobooks]
api_name: Spotify Web API
category: Audiobooks
endpoint_count: 7
---

# Spotify Web API - Audiobooks

[[README|Back to Overview]]

---

## GET /audiobooks/{id}

**Get an Audiobook
**

Get Spotify catalog information for a single audiobook. Audiobooks are only available within the US, UK, Canada, Ireland, New Zealand and Australia markets.


### Parameters

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| `` | query | string | No |  |
| `` | query | string | No |  |

### Example

```bash
curl -X GET \
  -H "Authorization: Bearer $TOKEN" \
  "https://api.spotify.com/v1/audiobooks/{id}"
```

---

## GET /audiobooks

**Get Several Audiobooks
**

Get Spotify catalog information for several audiobooks identified by their Spotify IDs. Audiobooks are only available within the US, UK, Canada, Ireland, New Zealand and Australia markets.


### Parameters

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| `` | query | string | No |  |
| `` | query | string | No |  |

### Example

```bash
curl -X GET \
  -H "Authorization: Bearer $TOKEN" \
  "https://api.spotify.com/v1/audiobooks"
```

---

## GET /audiobooks/{id}/chapters

**Get Audiobook Chapters
**

Get Spotify catalog information about an audiobook's chapters. Audiobooks are only available within the US, UK, Canada, Ireland, New Zealand and Australia markets.


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
  "https://api.spotify.com/v1/audiobooks/{id}/chapters"
```

---

## GET /me/audiobooks

**Get User's Saved Audiobooks
**

Get a list of the audiobooks saved in the current Spotify user's 'Your Music' library.


### Parameters

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| `` | query | string | No |  |
| `` | query | string | No |  |

### Example

```bash
curl -X GET \
  -H "Authorization: Bearer $TOKEN" \
  "https://api.spotify.com/v1/me/audiobooks"
```

---

## PUT /me/audiobooks

**Save Audiobooks for Current User
**

Save one or more audiobooks to the current Spotify user's library.


### Parameters

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| `` | query | string | No |  |

### Example

```bash
curl -X PUT \
  -H "Authorization: Bearer $TOKEN" \
  "https://api.spotify.com/v1/me/audiobooks"
```

---

## DELETE /me/audiobooks

**Remove User's Saved Audiobooks
**

Remove one or more audiobooks from the Spotify user's library.


### Parameters

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| `` | query | string | No |  |

### Example

```bash
curl -X DELETE \
  -H "Authorization: Bearer $TOKEN" \
  "https://api.spotify.com/v1/me/audiobooks"
```

---

## GET /me/audiobooks/contains

**Check User's Saved Audiobooks
**

Check if one or more audiobooks are already saved in the current Spotify user's library.


### Parameters

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| `` | query | string | No |  |

### Example

```bash
curl -X GET \
  -H "Authorization: Bearer $TOKEN" \
  "https://api.spotify.com/v1/me/audiobooks/contains"
```

---
