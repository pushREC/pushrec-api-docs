---
created: 2026-01-08
tags: [type/api-reference, api/general]
api_name: Vercel API
category: general
endpoint_count: 3
---

# Vercel API - General

[[README|Back to Overview]]

---

## DELETE /data-cache/purge-all

### Parameters

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| `projectIdOrName` | query | string | Yes |  |

### Example

```bash
curl -X DELETE \
  -H "Authorization: Bearer $TOKEN" \
  "https://api.vercel.com/data-cache/purge-all"
```

---

## PATCH /data-cache/billing-settings

### Example

```bash
curl -X PATCH \
  -H "Authorization: Bearer $TOKEN" \
  "https://api.vercel.com/data-cache/billing-settings"
```

---

## GET /certs

### Example

```bash
curl -X GET \
  -H "Authorization: Bearer $TOKEN" \
  "https://api.vercel.com/certs"
```

---
