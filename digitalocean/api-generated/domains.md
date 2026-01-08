---
created: 2026-01-08
tags: [type/api-reference, api/domains]
api_name: DigitalOcean API
category: Domains
endpoint_count: 4
---

# DigitalOcean API - Domains

[[README|Back to Overview]]

---

## GET /v2/domains

**List All Domains**

To retrieve a list of all of the domains in your account, send a GET request to `/v2/domains`.

### Parameters

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| `` | query | string | No |  |
| `` | query | string | No |  |

### Example

```bash
curl -X GET \
  -H "Authorization: Bearer $TOKEN" \
  "https://api.digitalocean.com/v2/domains"
```

---

## POST /v2/domains

**Create a New Domain**

To create a new domain, send a POST request to `/v2/domains`. Set the "name"
attribute to the domain name you are adding. Optionally, you may set the
"ip_address" attribute, and an A record will be automatically created pointing
to the apex domain.


### Example

```bash
curl -X POST \
  -H "Authorization: Bearer $TOKEN" \
  "https://api.digitalocean.com/v2/domains"
```

---

## GET /v2/domains/{domain_name}

**Retrieve an Existing Domain**

To get details about a specific domain, send a GET request to `/v2/domains/$DOMAIN_NAME`.

### Parameters

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| `` | query | string | No |  |

### Example

```bash
curl -X GET \
  -H "Authorization: Bearer $TOKEN" \
  "https://api.digitalocean.com/v2/domains/{domain_name}"
```

---

## DELETE /v2/domains/{domain_name}

**Delete a Domain**

To delete a domain, send a DELETE request to `/v2/domains/$DOMAIN_NAME`.


### Parameters

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| `` | query | string | No |  |

### Example

```bash
curl -X DELETE \
  -H "Authorization: Bearer $TOKEN" \
  "https://api.digitalocean.com/v2/domains/{domain_name}"
```

---
