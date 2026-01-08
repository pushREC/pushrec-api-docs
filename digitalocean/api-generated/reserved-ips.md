---
created: 2026-01-08
tags: [type/api-reference, api/reserved-ips]
api_name: DigitalOcean API
category: Reserved IPs
endpoint_count: 4
---

# DigitalOcean API - Reserved Ips

[[README|Back to Overview]]

---

## GET /v2/reserved_ips

**List All Reserved IPs**

To list all of the reserved IPs available on your account, send a GET request to `/v2/reserved_ips`.

### Parameters

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| `` | query | string | No |  |
| `` | query | string | No |  |

### Example

```bash
curl -X GET \
  -H "Authorization: Bearer $TOKEN" \
  "https://api.digitalocean.com/v2/reserved_ips"
```

---

## POST /v2/reserved_ips

**Create a New Reserved IP**

On creation, a reserved IP must be either assigned to a Droplet or reserved to a region.
* To create a new reserved IP assigned to a Droplet, send a POST
  request to `/v2/reserved_ips` with the `droplet_id` attribute.

* To create a new reserved IP reserved to a region, send a POST request to
  `/v2/reserved_ips` with the `region` attribute.

### Example

```bash
curl -X POST \
  -H "Authorization: Bearer $TOKEN" \
  "https://api.digitalocean.com/v2/reserved_ips"
```

---

## GET /v2/reserved_ips/{reserved_ip}

**Retrieve an Existing Reserved IP**

To show information about a reserved IP, send a GET request to `/v2/reserved_ips/$RESERVED_IP_ADDR`.

### Parameters

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| `` | query | string | No |  |

### Example

```bash
curl -X GET \
  -H "Authorization: Bearer $TOKEN" \
  "https://api.digitalocean.com/v2/reserved_ips/{reserved_ip}"
```

---

## DELETE /v2/reserved_ips/{reserved_ip}

**Delete a Reserved IP**

To delete a reserved IP and remove it from your account, send a DELETE request
to `/v2/reserved_ips/$RESERVED_IP_ADDR`.

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
  "https://api.digitalocean.com/v2/reserved_ips/{reserved_ip}"
```

---
