---
created: 2026-01-08
tags: [type/api-reference, api/droplet-autoscale-pools]
api_name: DigitalOcean API
category: Droplet Autoscale Pools
endpoint_count: 8
---

# DigitalOcean API - Droplet Autoscale Pools

[[README|Back to Overview]]

---

## GET /v2/droplets/autoscale

**List All Autoscale Pools**

To list all autoscale pools in your team, send a GET request to `/v2/droplets/autoscale`.
The response body will be a JSON object with a key of `autoscale_pools` containing an array of autoscale pool objects.
These each contain the standard autoscale pool attributes.


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
  "https://api.digitalocean.com/v2/droplets/autoscale"
```

---

## POST /v2/droplets/autoscale

**Create a New Autoscale Pool**

To create a new autoscale pool, send a POST request to `/v2/droplets/autoscale` setting the required attributes.

The response body will contain a JSON object with a key called `autoscale_pool` containing the standard attributes for the new autoscale pool.


### Example

```bash
curl -X POST \
  -H "Authorization: Bearer $TOKEN" \
  "https://api.digitalocean.com/v2/droplets/autoscale"
```

---

## GET /v2/droplets/autoscale/{autoscale_pool_id}

**Retrieve an Existing Autoscale Pool**

To show information about an individual autoscale pool, send a GET request to
`/v2/droplets/autoscale/$AUTOSCALE_POOL_ID`.


### Parameters

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| `` | query | string | No |  |

### Example

```bash
curl -X GET \
  -H "Authorization: Bearer $TOKEN" \
  "https://api.digitalocean.com/v2/droplets/autoscale/{autoscale_pool_id}"
```

---

## PUT /v2/droplets/autoscale/{autoscale_pool_id}

**Update Autoscale Pool**

To update the configuration of an existing autoscale pool, send a PUT request to
`/v2/droplets/autoscale/$AUTOSCALE_POOL_ID`. The request must contain a full representation
of the autoscale pool including existing attributes. 


### Parameters

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| `` | query | string | No |  |

### Example

```bash
curl -X PUT \
  -H "Authorization: Bearer $TOKEN" \
  "https://api.digitalocean.com/v2/droplets/autoscale/{autoscale_pool_id}"
```

---

## DELETE /v2/droplets/autoscale/{autoscale_pool_id}

**Delete autoscale pool**

To destroy an autoscale pool, send a DELETE request to the `/v2/droplets/autoscale/$AUTOSCALE_POOL_ID` endpoint.

A successful response will include a 202 response code and no content. 


### Parameters

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| `` | query | string | No |  |

### Example

```bash
curl -X DELETE \
  -H "Authorization: Bearer $TOKEN" \
  "https://api.digitalocean.com/v2/droplets/autoscale/{autoscale_pool_id}"
```

---

## DELETE /v2/droplets/autoscale/{autoscale_pool_id}/dangerous

**Delete autoscale pool and resources**

To destroy an autoscale pool and its associated resources (Droplets),
send a DELETE request to the `/v2/droplets/autoscale/$AUTOSCALE_POOL_ID/dangerous` endpoint.


### Parameters

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| `` | query | string | No |  |
| `` | query | string | No |  |

### Example

```bash
curl -X DELETE \
  -H "Authorization: Bearer $TOKEN" \
  "https://api.digitalocean.com/v2/droplets/autoscale/{autoscale_pool_id}/dangerous"
```

---

## GET /v2/droplets/autoscale/{autoscale_pool_id}/members

**List members**

To list the Droplets in an autoscale pool, send a GET request to `/v2/droplets/autoscale/$AUTOSCALE_POOL_ID/members`.

The response body will be a JSON object with a key of `droplets`. This will be
set to an array containing information about each of the Droplets in the autoscale pool.


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
  "https://api.digitalocean.com/v2/droplets/autoscale/{autoscale_pool_id}/members"
```

---

## GET /v2/droplets/autoscale/{autoscale_pool_id}/history

**List history events**

To list all of the scaling history events of an autoscale pool, send a GET request to `/v2/droplets/autoscale/$AUTOSCALE_POOL_ID/history`.

The response body will be a JSON object with a key of `history`. This will be
set to an array containing objects each representing a history event. 


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
  "https://api.digitalocean.com/v2/droplets/autoscale/{autoscale_pool_id}/history"
```

---
