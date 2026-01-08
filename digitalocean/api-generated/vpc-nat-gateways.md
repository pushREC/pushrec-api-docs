---
created: 2026-01-08
tags: [type/api-reference, api/vpc-nat-gateways]
api_name: DigitalOcean API
category: VPC NAT Gateways
endpoint_count: 5
---

# DigitalOcean API - Vpc Nat Gateways

[[README|Back to Overview]]

---

## GET /v2/vpc_nat_gateways

**List All VPC NAT Gateways**

To list all VPC NAT gateways in your team, send a GET request to `/v2/vpc_nat_gateways`.
The response body will be a JSON object with a key of `vpc_nat_gateways` containing an array of VPC NAT gateway objects.
These each contain the standard VPC NAT gateway attributes.


### Parameters

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| `` | query | string | No |  |
| `` | query | string | No |  |
| `` | query | string | No |  |
| `` | query | string | No |  |
| `` | query | string | No |  |
| `` | query | string | No |  |

### Example

```bash
curl -X GET \
  -H "Authorization: Bearer $TOKEN" \
  "https://api.digitalocean.com/v2/vpc_nat_gateways"
```

---

## POST /v2/vpc_nat_gateways

**Create a New VPC NAT Gateway**

To create a new VPC NAT gateway, send a POST request to `/v2/vpc_nat_gateways` setting the required attributes.

The response body will contain a JSON object with a key called `vpc_nat_gateway` containing the standard attributes for the new VPC NAT gateway.


### Example

```bash
curl -X POST \
  -H "Authorization: Bearer $TOKEN" \
  "https://api.digitalocean.com/v2/vpc_nat_gateways"
```

---

## GET /v2/vpc_nat_gateways/{id}

**Retrieve an Existing VPC NAT Gateway**

To show information about an individual VPC NAT gateway, send a GET request to
`/v2/vpc_nat_gateways/$VPC_NAT_GATEWAY_ID`.


### Parameters

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| `` | query | string | No |  |

### Example

```bash
curl -X GET \
  -H "Authorization: Bearer $TOKEN" \
  "https://api.digitalocean.com/v2/vpc_nat_gateways/{id}"
```

---

## PUT /v2/vpc_nat_gateways/{id}

**Update VPC NAT Gateway**

To update the configuration of an existing VPC NAT Gateway, send a PUT request to
`/v2/vpc_nat_gateways/$VPC_NAT_GATEWAY_ID`. The request must contain a full representation
of the VPC NAT Gateway including existing attributes. 


### Parameters

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| `` | query | string | No |  |

### Example

```bash
curl -X PUT \
  -H "Authorization: Bearer $TOKEN" \
  "https://api.digitalocean.com/v2/vpc_nat_gateways/{id}"
```

---

## DELETE /v2/vpc_nat_gateways/{id}

**Delete VPC NAT Gateway**

To destroy a VPC NAT Gateway, send a DELETE request to the `/v2/vpc_nat_gateways/$VPC_NAT_GATEWAY_ID` endpoint.

A successful response will include a 202 response code and no content. 


### Parameters

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| `` | query | string | No |  |

### Example

```bash
curl -X DELETE \
  -H "Authorization: Bearer $TOKEN" \
  "https://api.digitalocean.com/v2/vpc_nat_gateways/{id}"
```

---
