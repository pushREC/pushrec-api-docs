---
created: 2026-01-08
tags: [type/api-reference, api/floating-ips]
api_name: DigitalOcean API
category: Floating IPs
endpoint_count: 4
---

# DigitalOcean API - Floating Ips

[[README|Back to Overview]]

---

## GET /v2/floating_ips

**List All Floating IPs**

To list all of the floating IPs available on your account, send a GET request to `/v2/floating_ips`.

### Parameters

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| `` | query | string | No |  |
| `` | query | string | No |  |

### Example

```bash
curl -X GET \
  -H "Authorization: Bearer $TOKEN" \
  "https://api.digitalocean.com/v2/floating_ips"
```

---

## POST /v2/floating_ips

**Create a New Floating IP**

On creation, a floating IP must be either assigned to a Droplet or reserved to a region.
* To create a new floating IP assigned to a Droplet, send a POST
  request to `/v2/floating_ips` with the `droplet_id` attribute.

* To create a new floating IP reserved to a region, send a POST request to
  `/v2/floating_ips` with the `region` attribute.

### Example

```bash
curl -X POST \
  -H "Authorization: Bearer $TOKEN" \
  "https://api.digitalocean.com/v2/floating_ips"
```

---

## GET /v2/floating_ips/{floating_ip}

**Retrieve an Existing Floating IP**

To show information about a floating IP, send a GET request to `/v2/floating_ips/$FLOATING_IP_ADDR`.

### Parameters

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| `` | query | string | No |  |

### Example

```bash
curl -X GET \
  -H "Authorization: Bearer $TOKEN" \
  "https://api.digitalocean.com/v2/floating_ips/{floating_ip}"
```

---

## DELETE /v2/floating_ips/{floating_ip}

**Delete a Floating IP**

To delete a floating IP and remove it from your account, send a DELETE request
to `/v2/floating_ips/$FLOATING_IP_ADDR`.

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
  "https://api.digitalocean.com/v2/floating_ips/{floating_ip}"
```

---
