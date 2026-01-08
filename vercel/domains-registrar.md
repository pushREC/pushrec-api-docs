---
created: 2026-01-08
tags: [type/api-reference, api/domains-registrar]
api_name: Vercel API
category: domains-registrar
endpoint_count: 15
---

# Vercel API - Domains-Registrar

[[README|Back to Overview]]

---

## GET /v1/registrar/tlds/supported

**Get supported TLDs**

Get a list of TLDs supported by Vercel

### Parameters

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| `teamId` | query | string | No |  |

### Example

```bash
curl -X GET \
  -H "Authorization: Bearer $TOKEN" \
  "https://api.vercel.com/v1/registrar/tlds/supported"
```

---

## GET /v1/registrar/tlds/{tld}/price

**Get TLD price data**

Get price data for a specific TLD. This only reflects base prices for the given TLD. Premium domains may have different prices. Use the [Get price data for a domain](https://vercel.com/docs/rest-api/reference/endpoints/domains-registrar/get-price-data-for-a-domain) endpoint to get the price data for a specific domain.

### Parameters

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| `tld` | path | string | Yes |  |
| `years` | query | string | No | The number of years to get the price for. If not p |
| `teamId` | query | string | No |  |

### Example

```bash
curl -X GET \
  -H "Authorization: Bearer $TOKEN" \
  "https://api.vercel.com/v1/registrar/tlds/{tld}/price"
```

---

## GET /v1/registrar/domains/{domain}/availability

**Get availability for a domain**

Get availability for a specific domain. If the domain is available, it can be purchased using the [Buy a domain](https://vercel.com/docs/rest-api/reference/endpoints/domains-registrar/buy-a-domain) endpoint or the [Buy multiple domains](https://vercel.com/docs/rest-api/reference/endpoints/domains-registrar/buy-multiple-domains) endpoint.

### Parameters

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| `domain` | path | string | Yes |  |
| `teamId` | query | string | No |  |

### Example

```bash
curl -X GET \
  -H "Authorization: Bearer $TOKEN" \
  "https://api.vercel.com/v1/registrar/domains/{domain}/availability"
```

---

## GET /v1/registrar/domains/{domain}/price

**Get price data for a domain**

Get price data for a specific domain

### Parameters

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| `domain` | path | string | Yes |  |
| `years` | query | string | No | The number of years to get the price for. If not p |
| `teamId` | query | string | No |  |

### Example

```bash
curl -X GET \
  -H "Authorization: Bearer $TOKEN" \
  "https://api.vercel.com/v1/registrar/domains/{domain}/price"
```

---

## POST /v1/registrar/domains/availability

**Get availability for multiple domains**

Get availability for multiple domains. If the domains are available, they can be purchased using the [Buy a domain](https://vercel.com/docs/rest-api/reference/endpoints/domains-registrar/buy-a-domain) endpoint or the [Buy multiple domains](https://vercel.com/docs/rest-api/reference/endpoints/domains-registrar/buy-multiple-domains) endpoint.

### Parameters

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| `teamId` | query | string | No |  |

### Example

```bash
curl -X POST \
  -H "Authorization: Bearer $TOKEN" \
  "https://api.vercel.com/v1/registrar/domains/availability"
```

---

## GET /v1/registrar/domains/{domain}/auth-code

**Get the auth code for a domain**

Get the auth code for a domain. This is required to transfer a domain from Vercel to another registrar.

### Parameters

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| `domain` | path | string | Yes |  |
| `teamId` | query | string | No |  |

### Example

```bash
curl -X GET \
  -H "Authorization: Bearer $TOKEN" \
  "https://api.vercel.com/v1/registrar/domains/{domain}/auth-code"
```

---

## POST /v1/registrar/domains/{domain}/buy

**Buy a domain**

Buy a domain

### Parameters

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| `domain` | path | string | Yes |  |
| `teamId` | query | string | No |  |

### Example

```bash
curl -X POST \
  -H "Authorization: Bearer $TOKEN" \
  "https://api.vercel.com/v1/registrar/domains/{domain}/buy"
```

---

## POST /v1/registrar/domains/buy

**Buy multiple domains**

Buy multiple domains at once

### Parameters

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| `teamId` | query | string | No |  |

### Example

```bash
curl -X POST \
  -H "Authorization: Bearer $TOKEN" \
  "https://api.vercel.com/v1/registrar/domains/buy"
```

---

## POST /v1/registrar/domains/{domain}/transfer

**Transfer-in a domain**

Transfer a domain in from another registrar

### Parameters

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| `domain` | path | string | Yes |  |
| `teamId` | query | string | No |  |

### Example

```bash
curl -X POST \
  -H "Authorization: Bearer $TOKEN" \
  "https://api.vercel.com/v1/registrar/domains/{domain}/transfer"
```

---

## GET /v1/registrar/domains/{domain}/transfer

**Get a domain's transfer status**

Get the transfer status for a domain

### Parameters

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| `domain` | path | string | Yes |  |
| `teamId` | query | string | No |  |

### Example

```bash
curl -X GET \
  -H "Authorization: Bearer $TOKEN" \
  "https://api.vercel.com/v1/registrar/domains/{domain}/transfer"
```

---

## POST /v1/registrar/domains/{domain}/renew

**Renew a domain**

Renew a domain

### Parameters

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| `domain` | path | string | Yes |  |
| `teamId` | query | string | No |  |

### Example

```bash
curl -X POST \
  -H "Authorization: Bearer $TOKEN" \
  "https://api.vercel.com/v1/registrar/domains/{domain}/renew"
```

---

## PATCH /v1/registrar/domains/{domain}/auto-renew

**Update auto-renew for a domain**

Update the auto-renew setting for a domain

### Parameters

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| `domain` | path | string | Yes |  |
| `teamId` | query | string | No |  |

### Example

```bash
curl -X PATCH \
  -H "Authorization: Bearer $TOKEN" \
  "https://api.vercel.com/v1/registrar/domains/{domain}/auto-renew"
```

---

## PATCH /v1/registrar/domains/{domain}/nameservers

**Update nameservers for a domain**

Update the nameservers for a domain. Pass an empty array to use Vercel's default nameservers.

### Parameters

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| `domain` | path | string | Yes |  |
| `teamId` | query | string | No |  |

### Example

```bash
curl -X PATCH \
  -H "Authorization: Bearer $TOKEN" \
  "https://api.vercel.com/v1/registrar/domains/{domain}/nameservers"
```

---

## GET /v1/registrar/domains/{domain}/contact-info/schema

**Get contact info schema**

Some TLDs require additional contact information. Use this endpoint to get the schema for the tld-specific contact information for a domain.

### Parameters

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| `domain` | path | string | Yes |  |
| `teamId` | query | string | No |  |

### Example

```bash
curl -X GET \
  -H "Authorization: Bearer $TOKEN" \
  "https://api.vercel.com/v1/registrar/domains/{domain}/contact-info/schema"
```

---

## GET /v1/registrar/orders/{orderId}

**Get a domain order**

Get information about a domain order by its ID

### Parameters

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| `orderId` | path | string | Yes |  |
| `teamId` | query | string | No |  |

### Example

```bash
curl -X GET \
  -H "Authorization: Bearer $TOKEN" \
  "https://api.vercel.com/v1/registrar/orders/{orderId}"
```

---
