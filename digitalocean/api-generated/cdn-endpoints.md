---
created: 2026-01-08
tags: [type/api-reference, api/cdn-endpoints]
api_name: DigitalOcean API
category: CDN Endpoints
endpoint_count: 6
---

# DigitalOcean API - Cdn Endpoints

[[README|Back to Overview]]

---

## GET /v2/cdn/endpoints

**List All CDN Endpoints**

To list all of the CDN endpoints available on your account, send a GET request to `/v2/cdn/endpoints`.

### Parameters

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| `` | query | string | No |  |
| `` | query | string | No |  |

### Example

```bash
curl -X GET \
  -H "Authorization: Bearer $TOKEN" \
  "https://api.digitalocean.com/v2/cdn/endpoints"
```

---

## POST /v2/cdn/endpoints

**Create a New CDN Endpoint**

To create a new CDN endpoint, send a POST request to `/v2/cdn/endpoints`. The
origin attribute must be set to the fully qualified domain name (FQDN) of a
DigitalOcean Space. Optionally, the TTL may be configured by setting the `ttl`
attribute.

A custom subdomain may be configured by specifying the `custom_domain` and
`certificate_id` attributes.


### Example

```bash
curl -X POST \
  -H "Authorization: Bearer $TOKEN" \
  "https://api.digitalocean.com/v2/cdn/endpoints"
```

---

## GET /v2/cdn/endpoints/{cdn_id}

**Retrieve an Existing CDN Endpoint**

To show information about an existing CDN endpoint, send a GET request to `/v2/cdn/endpoints/$ENDPOINT_ID`.

### Parameters

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| `` | query | string | No |  |

### Example

```bash
curl -X GET \
  -H "Authorization: Bearer $TOKEN" \
  "https://api.digitalocean.com/v2/cdn/endpoints/{cdn_id}"
```

---

## PUT /v2/cdn/endpoints/{cdn_id}

**Update a CDN Endpoint**

To update the TTL, certificate ID, or the FQDN of the custom subdomain for
an existing CDN endpoint, send a PUT request to
`/v2/cdn/endpoints/$ENDPOINT_ID`.


### Parameters

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| `` | query | string | No |  |

### Example

```bash
curl -X PUT \
  -H "Authorization: Bearer $TOKEN" \
  "https://api.digitalocean.com/v2/cdn/endpoints/{cdn_id}"
```

---

## DELETE /v2/cdn/endpoints/{cdn_id}

**Delete a CDN Endpoint**

To delete a specific CDN endpoint, send a DELETE request to
`/v2/cdn/endpoints/$ENDPOINT_ID`.

A status of 204 will be given. This indicates that the request was processed
successfully, but that no response body is needed.


### Parameters

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| `` | query | string | No |  |

### Example

```bash
curl -X DELETE \
  -H "Authorization: Bearer $TOKEN" \
  "https://api.digitalocean.com/v2/cdn/endpoints/{cdn_id}"
```

---

## DELETE /v2/cdn/endpoints/{cdn_id}/cache

**Purge the Cache for an Existing CDN Endpoint**

To purge cached content from a CDN endpoint, send a DELETE request to
`/v2/cdn/endpoints/$ENDPOINT_ID/cache`. The body of the request should include
a `files` attribute containing a list of cached file paths to be purged. A
path may be for a single file or may contain a wildcard (`*`) to recursively
purge all files under a directory. When only a wildcard is provided, all cached 
files will be purged. There is a rate limit of 50 files per 20 seconds that can 
be purged. CDN endpoints have a rate limit of 5 requests per 10 seconds. 
Purging files using a wildcard path counts as a single request against the API's 
rate limit. Two identical purge requests cannot be sent at the same time.


### Parameters

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| `` | query | string | No |  |

### Example

```bash
curl -X DELETE \
  -H "Authorization: Bearer $TOKEN" \
  "https://api.digitalocean.com/v2/cdn/endpoints/{cdn_id}/cache"
```

---
