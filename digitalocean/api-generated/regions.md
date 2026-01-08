---
created: 2026-01-08
tags: [type/api-reference, api/regions]
api_name: DigitalOcean API
category: Regions
endpoint_count: 1
---

# DigitalOcean API - Regions

[[README|Back to Overview]]

---

## GET /v2/regions

**List All Data Center Regions**

To list all of the regions that are available, send a GET request to `/v2/regions`.
The response will be a JSON object with a key called `regions`. The value of this will be an array of `region` objects, each of which will contain the standard region attributes.

### Parameters

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| `` | query | string | No |  |
| `` | query | string | No |  |

### Example

```bash
curl -X GET \
  -H "Authorization: Bearer $TOKEN" \
  "https://api.digitalocean.com/v2/regions"
```

---
