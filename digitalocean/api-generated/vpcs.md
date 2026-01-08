---
created: 2026-01-08
tags: [type/api-reference, api/vpcs]
api_name: DigitalOcean API
category: VPCs
endpoint_count: 10
---

# DigitalOcean API - Vpcs

[[README|Back to Overview]]

---

## GET /v2/vpcs

**List All VPCs**

To list all of the VPCs on your account, send a GET request to `/v2/vpcs`.

### Parameters

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| `` | query | string | No |  |
| `` | query | string | No |  |

### Example

```bash
curl -X GET \
  -H "Authorization: Bearer $TOKEN" \
  "https://api.digitalocean.com/v2/vpcs"
```

---

## POST /v2/vpcs

**Create a New VPC**

To create a VPC, send a POST request to `/v2/vpcs` specifying the attributes
in the table below in the JSON body.

**Note:** If you do not currently have a VPC network in a specific datacenter
region, the first one that you create will be set as the default for that
region. The default VPC for a region cannot be changed or deleted.


### Example

```bash
curl -X POST \
  -H "Authorization: Bearer $TOKEN" \
  "https://api.digitalocean.com/v2/vpcs"
```

---

## GET /v2/vpcs/{vpc_id}

**Retrieve an Existing VPC**

To show information about an existing VPC, send a GET request to `/v2/vpcs/$VPC_ID`.

### Parameters

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| `` | query | string | No |  |

### Example

```bash
curl -X GET \
  -H "Authorization: Bearer $TOKEN" \
  "https://api.digitalocean.com/v2/vpcs/{vpc_id}"
```

---

## PUT /v2/vpcs/{vpc_id}

**Update a VPC**

To update information about a VPC, send a PUT request to `/v2/vpcs/$VPC_ID`.


### Parameters

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| `` | query | string | No |  |

### Example

```bash
curl -X PUT \
  -H "Authorization: Bearer $TOKEN" \
  "https://api.digitalocean.com/v2/vpcs/{vpc_id}"
```

---

## PATCH /v2/vpcs/{vpc_id}

**Partially Update a VPC**

To update a subset of information about a VPC, send a PATCH request to
`/v2/vpcs/$VPC_ID`.


### Parameters

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| `` | query | string | No |  |

### Example

```bash
curl -X PATCH \
  -H "Authorization: Bearer $TOKEN" \
  "https://api.digitalocean.com/v2/vpcs/{vpc_id}"
```

---

## DELETE /v2/vpcs/{vpc_id}

**Delete a VPC**

To delete a VPC, send a DELETE request to `/v2/vpcs/$VPC_ID`. A 204 status
code with no body will be returned in response to a successful request.

The default VPC for a region can not be deleted. Additionally, a VPC can only
be deleted if it does not contain any member resources. Attempting to delete
a region's default VPC or a VPC that still has members will result in a
403 Forbidden error response.


### Parameters

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| `` | query | string | No |  |

### Example

```bash
curl -X DELETE \
  -H "Authorization: Bearer $TOKEN" \
  "https://api.digitalocean.com/v2/vpcs/{vpc_id}"
```

---

## GET /v2/vpcs/{vpc_id}/members

**List the Member Resources of a VPC**

To list all of the resources that are members of a VPC, send a GET request to
`/v2/vpcs/$VPC_ID/members`.

To only list resources of a specific type that are members of the VPC,
included a `resource_type` query parameter. For example, to only list Droplets
in the VPC, send a GET request to `/v2/vpcs/$VPC_ID/members?resource_type=droplet`.

Only resources that you are authorized to see will be returned (e.g. to see Droplets,
you must have `droplet:read`).


### Parameters

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| `` | query | string | No |  |
| `` | query | string | No |  |
| `` | query | string | No |  |
| `` | query | string | No |  |

### Example

```bash
curl -X GET \
  -H "Authorization: Bearer $TOKEN" \
  "https://api.digitalocean.com/v2/vpcs/{vpc_id}/members"
```

---

## GET /v2/vpcs/{vpc_id}/peerings

**List the Peerings of a VPC**

To list all of a VPC's peerings, send a GET request to
`/v2/vpcs/$VPC_ID/peerings`.


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
  "https://api.digitalocean.com/v2/vpcs/{vpc_id}/peerings"
```

---

## POST /v2/vpcs/{vpc_id}/peerings

**Create a Peering with a VPC**

To create a new VPC peering for a given VPC, send a POST request to
`/v2/vpcs/$VPC_ID/peerings`.


### Parameters

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| `` | query | string | No |  |

### Example

```bash
curl -X POST \
  -H "Authorization: Bearer $TOKEN" \
  "https://api.digitalocean.com/v2/vpcs/{vpc_id}/peerings"
```

---

## PATCH /v2/vpcs/{vpc_id}/peerings/{vpc_peering_id}

**Update a VPC Peering**

To update the name of a VPC peering in a particular VPC, send a PATCH request 
to `/v2/vpcs/$VPC_ID/peerings/$VPC_PEERING_ID` with the new `name` in the 
request body.


### Parameters

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| `` | query | string | No |  |
| `` | query | string | No |  |

### Example

```bash
curl -X PATCH \
  -H "Authorization: Bearer $TOKEN" \
  "https://api.digitalocean.com/v2/vpcs/{vpc_id}/peerings/{vpc_peering_id}"
```

---
