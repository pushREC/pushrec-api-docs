---
created: 2026-01-09
tags: [type/api-reference, api/snicertificate]
api_name: Netlify's API documentation
category: sniCertificate
endpoint_count: 3
---

# Netlify's API documentation - Snicertificate

[[README|Back to Overview]]

---

## POST /sites/{site_id}/ssl

Provisions or updates a TLS certificate for the site.

**Creating a certificate (site has no certificate):**
- Omit certificate params to initiate Let's Encrypt provisioning
- Provide certificate, key, and ca_certificates to upload a custom certificate

**Updating a certificate (site already has a certificate):**
- REQUIRES certificate, key, and ca_certificates to replace with a new custom certificate
- Use POST /api/v1/sites/{site_id}/ssl/renew to renew an existing Let's Encrypt certificate

### Parameters

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| `site_id` | path | string | Yes |  |
| `certificate` | query | string | No | PEM-encoded certificate. Required when updating an |
| `key` | query | string | No | PEM-encoded private key. Required when updating an |
| `ca_certificates` | query | string | No | PEM-encoded CA certificate chain. Required when up |

### Example

```bash
curl -X POST \
  -H "Authorization: Bearer $TOKEN" \
  "https://api.netlify.com/api/v1/sites/{site_id}/ssl"
```

---

## GET /sites/{site_id}/ssl

### Parameters

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| `site_id` | path | string | Yes |  |

### Example

```bash
curl -X GET \
  -H "Authorization: Bearer $TOKEN" \
  "https://api.netlify.com/api/v1/sites/{site_id}/ssl"
```

---

## GET /sites/{site_id}/ssl/certificates

### Parameters

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| `site_id` | path | string | Yes |  |
| `domain` | query | string | Yes |  |

### Example

```bash
curl -X GET \
  -H "Authorization: Bearer $TOKEN" \
  "https://api.netlify.com/api/v1/sites/{site_id}/ssl/certificates"
```

---
