---
created: 2026-01-08
tags: [type/api-reference, api/vpc-peerings]
api_name: DigitalOcean API
category: VPC Peerings
endpoint_count: 5
---

# DigitalOcean API - Vpc Peerings

[[README|Back to Overview]]

---

## GET /v2/vpc_peerings

**List All VPC Peerings**

To list all of the VPC peerings on your account, send a GET request to `/v2/vpc_peerings`.

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
  "https://api.digitalocean.com/v2/vpc_peerings"
```

---

## POST /v2/vpc_peerings

**Create a New VPC Peering**

To create a new VPC Peering, send a POST request to `/v2/vpc_peerings` 
specifying a name and a list of two VPC IDs to peer. The response code, 202 
Accepted, does not indicate the success or failure of the operation, just 
that the request has been accepted for processing.


### Example

```bash
curl -X POST \
  -H "Authorization: Bearer $TOKEN" \
  "https://api.digitalocean.com/v2/vpc_peerings"
```

---

## GET /v2/vpc_peerings/{vpc_peering_id}

**Retrieve an Existing VPC Peering**

To show information about an existing VPC Peering, send a GET request to `/v2/vpc_peerings/$VPC_PEERING_ID`.


### Parameters

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| `` | query | string | No |  |

### Example

```bash
curl -X GET \
  -H "Authorization: Bearer $TOKEN" \
  "https://api.digitalocean.com/v2/vpc_peerings/{vpc_peering_id}"
```

---

## PATCH /v2/vpc_peerings/{vpc_peering_id}

**Update a VPC peering**

To update the name of a VPC peering, send a PATCH request to `/v2/vpc_peerings/$VPC_PEERING_ID` with the new `name` in the request body.


### Parameters

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| `` | query | string | No |  |

### Example

```bash
curl -X PATCH \
  -H "Authorization: Bearer $TOKEN" \
  "https://api.digitalocean.com/v2/vpc_peerings/{vpc_peering_id}"
```

---

## DELETE /v2/vpc_peerings/{vpc_peering_id}

**Delete a VPC peering**

To delete a VPC peering, send a DELETE request to `/v2/vpc_peerings/$VPC_PEERING_ID`.


### Parameters

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| `` | query | string | No |  |

### Example

```bash
curl -X DELETE \
  -H "Authorization: Bearer $TOKEN" \
  "https://api.digitalocean.com/v2/vpc_peerings/{vpc_peering_id}"
```

---
