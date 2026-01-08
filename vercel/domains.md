---
created: 2026-01-08
tags: [type/api-reference, api/domains]
api_name: Vercel API
category: domains
endpoint_count: 8
---

# Vercel API - Domains

[[README|Back to Overview]]

---

## GET /v4/domains/price

**Check the price for a domain (deprecated)**

This endpoint is deprecated and replaced with the endpoint [Get price data for a domain](https://vercel.com/docs/rest-api/reference/endpoints/domains-registrar/get-price-data-for-a-domain). Check the price to purchase a domain and how long a single purchase period is.

### Parameters

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| `name` | query | string | Yes | The name of the domain for which the price needs t |
| `type` | query | string | No | In which status of the domain the price needs to b |
| `teamId` | query | string | No | The Team identifier to perform the request on beha |
| `slug` | query | string | No | The Team slug to perform the request on behalf of. |

### Example

```bash
curl -X GET \
  -H "Authorization: Bearer $TOKEN" \
  "https://api.vercel.com/v4/domains/price"
```

---

## GET /v4/domains/status

**Check a Domain Availability (deprecated)**

This endpoint is deprecated and replaced with the endpoint [Get availability for a domain](https://vercel.com/docs/rest-api/reference/endpoints/domains-registrar/get-availability-for-a-domain). Check if a domain name is available for purchase.

### Parameters

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| `name` | query | string | Yes | The name of the domain for which we would like to  |
| `teamId` | query | string | No | The Team identifier to perform the request on beha |
| `slug` | query | string | No | The Team slug to perform the request on behalf of. |

### Example

```bash
curl -X GET \
  -H "Authorization: Bearer $TOKEN" \
  "https://api.vercel.com/v4/domains/status"
```

---

## GET /v6/domains/{domain}/config

**Get a Domain's configuration**

Get a Domain's configuration.

### Parameters

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| `domain` | path | string | Yes | The name of the domain. |
| `projectIdOrName` | query | string | No | The project id or name that will be associated wit |
| `strict` | query | string | No | When true, the response will only include the name |
| `teamId` | query | string | No | The Team identifier to perform the request on beha |
| `slug` | query | string | No | The Team slug to perform the request on behalf of. |

### Example

```bash
curl -X GET \
  -H "Authorization: Bearer $TOKEN" \
  "https://api.vercel.com/v6/domains/{domain}/config"
```

---

## GET /v5/domains/{domain}

**Get Information for a Single Domain**

Get information for a single domain in an account or team.

### Parameters

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| `domain` | path | string | Yes | The name of the domain. |
| `teamId` | query | string | No | The Team identifier to perform the request on beha |
| `slug` | query | string | No | The Team slug to perform the request on behalf of. |

### Example

```bash
curl -X GET \
  -H "Authorization: Bearer $TOKEN" \
  "https://api.vercel.com/v5/domains/{domain}"
```

---

## GET /v5/domains

**List all the domains**

Retrieves a list of domains registered for the authenticated user or team. By default it returns the last 20 domains if no limit is provided.

### Parameters

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| `limit` | query | number | No | Maximum number of domains to list from a request. |
| `since` | query | number | No | Get domains created after this JavaScript timestam |
| `until` | query | number | No | Get domains created before this JavaScript timesta |
| `teamId` | query | string | No | The Team identifier to perform the request on beha |
| `slug` | query | string | No | The Team slug to perform the request on behalf of. |

### Example

```bash
curl -X GET \
  -H "Authorization: Bearer $TOKEN" \
  "https://api.vercel.com/v5/domains"
```

---

## POST /v7/domains

**Add an existing domain to the Vercel platform**

This endpoint is used for adding a new apex domain name with Vercel for the authenticating user. Note: This endpoint is no longer used for initiating domain transfers from external registrars to Vercel. For this, please use the endpoint [Transfer-in a domain](https://vercel.com/docs/rest-api/reference/endpoints/domains-registrar/transfer-in-a-domain).

### Parameters

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| `teamId` | query | string | No | The Team identifier to perform the request on beha |
| `slug` | query | string | No | The Team slug to perform the request on behalf of. |

### Example

```bash
curl -X POST \
  -H "Authorization: Bearer $TOKEN" \
  "https://api.vercel.com/v7/domains"
```

---

## PATCH /v3/domains/{domain}

**Update or move apex domain**

Update or move apex domain. Note: This endpoint is no longer used for updating auto-renew or nameservers. For this, please use the endpoints [Update auto-renew for a domain](https://vercel.com/docs/rest-api/reference/endpoints/domains-registrar/update-auto-renew-for-a-domain) and [Update nameservers for a domain](https://vercel.com/docs/rest-api/reference/endpoints/domains-registrar/update-nameservers-for-a-domain).

### Parameters

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| `domain` | path | string | No |  |
| `teamId` | query | string | No | The Team identifier to perform the request on beha |
| `slug` | query | string | No | The Team slug to perform the request on behalf of. |

### Example

```bash
curl -X PATCH \
  -H "Authorization: Bearer $TOKEN" \
  "https://api.vercel.com/v3/domains/{domain}"
```

---

## DELETE /v6/domains/{domain}

**Remove a domain by name**

Delete a previously registered domain name from Vercel. Deleting a domain will automatically remove any associated aliases.

### Parameters

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| `domain` | path | string | Yes | The name of the domain. |
| `teamId` | query | string | No | The Team identifier to perform the request on beha |
| `slug` | query | string | No | The Team slug to perform the request on behalf of. |

### Example

```bash
curl -X DELETE \
  -H "Authorization: Bearer $TOKEN" \
  "https://api.vercel.com/v6/domains/{domain}"
```

---
