---
created: 2026-01-08
tags: [type/api-reference, api/actions]
api_name: DigitalOcean API
category: Actions
endpoint_count: 2
---

# DigitalOcean API - Actions

[[README|Back to Overview]]

---

## GET /v2/actions

**List All Actions**

This will be the entire list of actions taken on your account, so it will be quite large. As with any large collection returned by the API, the results will be paginated with only 20 on each page by default.

### Parameters

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| `` | query | string | No |  |
| `` | query | string | No |  |

### Example

```bash
curl -X GET \
  -H "Authorization: Bearer $TOKEN" \
  "https://api.digitalocean.com/v2/actions"
```

---

## GET /v2/actions/{action_id}

**Retrieve an Existing Action**

To retrieve a specific action object, send a GET request to `/v2/actions/$ACTION_ID`.

### Parameters

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| `` | query | string | No |  |

### Example

```bash
curl -X GET \
  -H "Authorization: Bearer $TOKEN" \
  "https://api.digitalocean.com/v2/actions/{action_id}"
```

---
