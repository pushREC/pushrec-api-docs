---
created: 2026-01-08
tags: [type/api-reference, api/byoip-prefixes]
api_name: DigitalOcean API
category: BYOIP Prefixes
endpoint_count: 6
---

# DigitalOcean API - Byoip Prefixes

[[README|Back to Overview]]

---

## POST /v2/byoip_prefixes

**Create a BYOIP Prefix**

To create a BYOIP prefix, send a POST request to `/v2/byoip_prefixes`.

A successful request will initiate the process of bringing your BYOIP Prefix into your account.
The response will include the details of the created prefix, including its UUID and status.


### Example

```bash
curl -X POST \
  -H "Authorization: Bearer $TOKEN" \
  "https://api.digitalocean.com/v2/byoip_prefixes"
```

---

## GET /v2/byoip_prefixes

**List BYOIP Prefixes**

To list all BYOIP prefixes, send a GET request to `/v2/byoip_prefixes`.
A successful response will return a list of all BYOIP prefixes associated with the account.


### Parameters

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| `` | query | string | No |  |
| `` | query | string | No |  |

### Example

```bash
curl -X GET \
  -H "Authorization: Bearer $TOKEN" \
  "https://api.digitalocean.com/v2/byoip_prefixes"
```

---

## GET /v2/byoip_prefixes/{byoip_prefix_uuid}

**Get a BYOIP Prefix**

To get a BYOIP prefix, send a GET request to `/v2/byoip_prefixes/$byoip_prefix_uuid`. 

A successful response will return the details of the specified BYOIP prefix.


### Parameters

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| `` | query | string | No |  |

### Example

```bash
curl -X GET \
  -H "Authorization: Bearer $TOKEN" \
  "https://api.digitalocean.com/v2/byoip_prefixes/{byoip_prefix_uuid}"
```

---

## DELETE /v2/byoip_prefixes/{byoip_prefix_uuid}

**Delete a BYOIP Prefix**

To delete a BYOIP prefix and remove it from your account, send a DELETE request
to `/v2/byoip_prefixes/$byoip_prefix_uuid`.

A successful request will receive a 202 status code with no body in response.
This indicates that the request was accepted and the prefix is being deleted.


### Parameters

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| `` | query | string | No |  |

### Example

```bash
curl -X DELETE \
  -H "Authorization: Bearer $TOKEN" \
  "https://api.digitalocean.com/v2/byoip_prefixes/{byoip_prefix_uuid}"
```

---

## PATCH /v2/byoip_prefixes/{byoip_prefix_uuid}

**Update a BYOIP Prefix**

To update a BYOIP prefix, send a PATCH request to `/v2/byoip_prefixes/$byoip_prefix_uuid`.

Currently, you can update the advertisement status of the prefix.
The response will include the updated details of the prefix.


### Parameters

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| `byoip_prefix_uuid` | path | string | Yes | A unique identifier for a BYOIP prefix. |

### Example

```bash
curl -X PATCH \
  -H "Authorization: Bearer $TOKEN" \
  "https://api.digitalocean.com/v2/byoip_prefixes/{byoip_prefix_uuid}"
```

---

## GET /v2/byoip_prefixes/{byoip_prefix_uuid}/ips

**List BYOIP Prefix Resources**

To list resources associated with BYOIP prefixes, send a GET request to `/v2/byoip_prefixes/{byoip_prefix_uuid}/ips`.

A successful response will return a list of resources associated with the specified BYOIP prefix.


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
  "https://api.digitalocean.com/v2/byoip_prefixes/{byoip_prefix_uuid}/ips"
```

---
