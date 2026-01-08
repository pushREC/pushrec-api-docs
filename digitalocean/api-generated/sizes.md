---
created: 2026-01-08
tags: [type/api-reference, api/sizes]
api_name: DigitalOcean API
category: Sizes
endpoint_count: 1
---

# DigitalOcean API - Sizes

[[README|Back to Overview]]

---

## GET /v2/sizes

**List All Droplet Sizes**

To list all of available Droplet sizes, send a GET request to `/v2/sizes`.
The response will be a JSON object with a key called `sizes`. The value of this will be an array of `size` objects each of which contain the standard size attributes.

### Parameters

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| `` | query | string | No |  |
| `` | query | string | No |  |

### Example

```bash
curl -X GET \
  -H "Authorization: Bearer $TOKEN" \
  "https://api.digitalocean.com/v2/sizes"
```

---
