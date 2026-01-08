---
created: 2026-01-08
tags: [type/api-reference, api/account]
api_name: DigitalOcean API
category: Account
endpoint_count: 1
---

# DigitalOcean API - Account

[[README|Back to Overview]]

---

## GET /v2/account

**Get User Information**

To show information about the current user account, send a GET request to `/v2/account`.

### Example

```bash
curl -X GET \
  -H "Authorization: Bearer $TOKEN" \
  "https://api.digitalocean.com/v2/account"
```

---
