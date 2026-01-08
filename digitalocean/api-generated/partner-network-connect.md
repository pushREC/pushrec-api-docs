---
created: 2026-01-08
tags: [type/api-reference, api/partner-network-connect]
api_name: DigitalOcean API
category: Partner Network Connect
endpoint_count: 9
---

# DigitalOcean API - Partner Network Connect

[[README|Back to Overview]]

---

## GET /v2/partner_network_connect/attachments

**List all partner attachments**

To list all of the Partner Attachments on your account, send a `GET` request to `/v2/partner_network_connect/attachments`.

### Parameters

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| `` | query | string | No |  |
| `` | query | string | No |  |

### Example

```bash
curl -X GET \
  -H "Authorization: Bearer $TOKEN" \
  "https://api.digitalocean.com/v2/partner_network_connect/attachments"
```

---

## POST /v2/partner_network_connect/attachments

**Create a new partner attachment**

To create a new partner attachment, send a `POST` request to
`/v2/partner_network_connect/attachments` with a JSON object containing the
required configuration details.


### Example

```bash
curl -X POST \
  -H "Authorization: Bearer $TOKEN" \
  "https://api.digitalocean.com/v2/partner_network_connect/attachments"
```

---

## GET /v2/partner_network_connect/attachments/{pa_id}

**Retrieve an existing partner attachment**

To get the details of a partner attachment, send a `GET` request to
`/v2/partner_network_connect/attachments/{pa_id}`.


### Parameters

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| `` | query | string | No |  |

### Example

```bash
curl -X GET \
  -H "Authorization: Bearer $TOKEN" \
  "https://api.digitalocean.com/v2/partner_network_connect/attachments/{pa_id}"
```

---

## PATCH /v2/partner_network_connect/attachments/{pa_id}

**Update an existing partner attachment**

To update an existing partner attachment, send a `PATCH` request to
`/v2/partner_network_connect/attachments/{pa_id}` with a JSON object containing the
fields to be updated.


### Parameters

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| `` | query | string | No |  |

### Example

```bash
curl -X PATCH \
  -H "Authorization: Bearer $TOKEN" \
  "https://api.digitalocean.com/v2/partner_network_connect/attachments/{pa_id}"
```

---

## DELETE /v2/partner_network_connect/attachments/{pa_id}

**Delete an existing partner attachment**

To delete an existing partner attachment, send a `DELETE` request to
`/v2/partner_network_connect/attachments/{pa_id}`.


### Parameters

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| `` | query | string | No |  |

### Example

```bash
curl -X DELETE \
  -H "Authorization: Bearer $TOKEN" \
  "https://api.digitalocean.com/v2/partner_network_connect/attachments/{pa_id}"
```

---

## GET /v2/partner_network_connect/attachments/{pa_id}/bgp_auth_key

**Get current BGP auth key for the partner attachment**

To get the current BGP auth key for a partner attachment, send a `GET` request to
`/v2/partner_network_connect/attachments/{pa_id}/bgp_auth_key`.


### Parameters

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| `` | query | string | No |  |

### Example

```bash
curl -X GET \
  -H "Authorization: Bearer $TOKEN" \
  "https://api.digitalocean.com/v2/partner_network_connect/attachments/{pa_id}/bgp_auth_key"
```

---

## GET /v2/partner_network_connect/attachments/{pa_id}/remote_routes

**List remote routes for a partner attachment**

To list all remote routes associated with a partner attachment, send a `GET` request to
`/v2/partner_network_connect/attachments/{pa_id}/remote_routes`.


### Parameters

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| `` | query | string | No |  |
| `` | query | string | No |  |
| `` | query | string | No |  |

### Example

```bash
curl -X GET \
  -H "Authorization: Bearer $TOKEN" \
  "https://api.digitalocean.com/v2/partner_network_connect/attachments/{pa_id}/remote_routes"
```

---

## GET /v2/partner_network_connect/attachments/{pa_id}/service_key

**Get the current service key for the partner attachment**

To get the current service key for a partner attachment, send a `GET` request to
`/v2/partner_network_connect/attachments/{pa_id}/service_key`.


### Parameters

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| `` | query | string | No |  |

### Example

```bash
curl -X GET \
  -H "Authorization: Bearer $TOKEN" \
  "https://api.digitalocean.com/v2/partner_network_connect/attachments/{pa_id}/service_key"
```

---

## POST /v2/partner_network_connect/attachments/{pa_id}/service_key

**Regenerate the service key for the partner attachment**

This operation generates a new service key for the specified partner attachment. The operation is asynchronous, and the response is an empty JSON object returned with a 202 status code. To poll for the new service key, send a `GET` request to `/v2/partner_network_connect/attachments/{pa_id}/service_key`.


### Parameters

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| `` | query | string | No |  |

### Example

```bash
curl -X POST \
  -H "Authorization: Bearer $TOKEN" \
  "https://api.digitalocean.com/v2/partner_network_connect/attachments/{pa_id}/service_key"
```

---
