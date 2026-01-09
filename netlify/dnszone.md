---
created: 2026-01-09
tags: [type/api-reference, api/dnszone]
api_name: Netlify's API documentation
category: dnsZone
endpoint_count: 11
---

# Netlify's API documentation - Dnszone

[[README|Back to Overview]]

---

## GET /sites/{site_id}/dns

### Example

```bash
curl -X GET \
  -H "Authorization: Bearer $TOKEN" \
  "https://api.netlify.com/api/v1/sites/{site_id}/dns"
```

---

## PUT /sites/{site_id}/dns

### Example

```bash
curl -X PUT \
  -H "Authorization: Bearer $TOKEN" \
  "https://api.netlify.com/api/v1/sites/{site_id}/dns"
```

---

## POST /dns_zones

### Example

```bash
curl -X POST \
  -H "Authorization: Bearer $TOKEN" \
  "https://api.netlify.com/api/v1/dns_zones"
```

---

## GET /dns_zones

### Parameters

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| `account_slug` | query | string | No |  |

### Example

```bash
curl -X GET \
  -H "Authorization: Bearer $TOKEN" \
  "https://api.netlify.com/api/v1/dns_zones"
```

---

## GET /dns_zones/{zone_id}

### Example

```bash
curl -X GET \
  -H "Authorization: Bearer $TOKEN" \
  "https://api.netlify.com/api/v1/dns_zones/{zone_id}"
```

---

## DELETE /dns_zones/{zone_id}

### Example

```bash
curl -X DELETE \
  -H "Authorization: Bearer $TOKEN" \
  "https://api.netlify.com/api/v1/dns_zones/{zone_id}"
```

---

## PUT /dns_zones/{zone_id}/transfer

### Example

```bash
curl -X PUT \
  -H "Authorization: Bearer $TOKEN" \
  "https://api.netlify.com/api/v1/dns_zones/{zone_id}/transfer"
```

---

## GET /dns_zones/{zone_id}/dns_records

### Example

```bash
curl -X GET \
  -H "Authorization: Bearer $TOKEN" \
  "https://api.netlify.com/api/v1/dns_zones/{zone_id}/dns_records"
```

---

## POST /dns_zones/{zone_id}/dns_records

### Example

```bash
curl -X POST \
  -H "Authorization: Bearer $TOKEN" \
  "https://api.netlify.com/api/v1/dns_zones/{zone_id}/dns_records"
```

---

## GET /dns_zones/{zone_id}/dns_records/{dns_record_id}

### Example

```bash
curl -X GET \
  -H "Authorization: Bearer $TOKEN" \
  "https://api.netlify.com/api/v1/dns_zones/{zone_id}/dns_records/{dns_record_id}"
```

---

## DELETE /dns_zones/{zone_id}/dns_records/{dns_record_id}

### Example

```bash
curl -X DELETE \
  -H "Authorization: Bearer $TOKEN" \
  "https://api.netlify.com/api/v1/dns_zones/{zone_id}/dns_records/{dns_record_id}"
```

---
