---
created: 2026-01-08
tags: [type/api-reference, api/reserved-ipv6]
api_name: DigitalOcean API
category: Reserved IPv6
endpoint_count: 4
---

# DigitalOcean API - Reserved Ipv6

[[README|Back to Overview]]

---

## GET /v2/reserved_ipv6

**List All Reserved IPv6s**

To list all of the reserved IPv6s available on your account, send a GET request to `/v2/reserved_ipv6`.

### Parameters

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| `` | query | string | No |  |
| `` | query | string | No |  |

### Example

```bash
curl -X GET \
  -H "Authorization: Bearer $TOKEN" \
  "https://api.digitalocean.com/v2/reserved_ipv6"
```

---

## POST /v2/reserved_ipv6

**Create a New Reserved IPv6**

On creation, a reserved IPv6 must be reserved to a region.
* To create a new reserved IPv6 reserved to a region, send a POST request to
  `/v2/reserved_ipv6` with the `region_slug` attribute.

### Example

```bash
curl -X POST \
  -H "Authorization: Bearer $TOKEN" \
  "https://api.digitalocean.com/v2/reserved_ipv6"
```

---

## GET /v2/reserved_ipv6/{reserved_ipv6}

**Retrieve an Existing Reserved IPv6**

To show information about a reserved IPv6, send a GET request to `/v2/reserved_ipv6/$RESERVED_IPV6`.

### Parameters

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| `` | query | string | No |  |

### Example

```bash
curl -X GET \
  -H "Authorization: Bearer $TOKEN" \
  "https://api.digitalocean.com/v2/reserved_ipv6/{reserved_ipv6}"
```

---

## DELETE /v2/reserved_ipv6/{reserved_ipv6}

**Delete a Reserved IPv6**

To delete a reserved IP and remove it from your account, send a DELETE request
to `/v2/reserved_ipv6/$RESERVED_IPV6`.

A successful request will receive a 204 status code with no body in response.
This indicates that the request was processed successfully.


### Parameters

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| `` | query | string | No |  |

### Example

```bash
curl -X DELETE \
  -H "Authorization: Bearer $TOKEN" \
  "https://api.digitalocean.com/v2/reserved_ipv6/{reserved_ipv6}"
```

---
