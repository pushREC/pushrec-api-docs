---
created: 2026-01-08
tags: [type/api-reference, api/domain-records]
api_name: DigitalOcean API
category: Domain Records
endpoint_count: 6
---

# DigitalOcean API - Domain Records

[[README|Back to Overview]]

---

## GET /v2/domains/{domain_name}/records

**List All Domain Records**

To get a listing of all records configured for a domain, send a GET request to `/v2/domains/$DOMAIN_NAME/records`.
The list of records returned can be filtered by using the `name` and `type` query parameters. For example, to only include A records for a domain, send a GET request to `/v2/domains/$DOMAIN_NAME/records?type=A`. `name` must be a fully qualified record name. For example, to only include records matching `sub.example.com`, send a GET request to `/v2/domains/$DOMAIN_NAME/records?name=sub.example.com`. Both name and type may be used together.



### Parameters

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| `` | query | string | No |  |
| `` | query | string | No |  |
| `` | query | string | No |  |
| `` | query | string | No |  |
| `` | query | string | No |  |

### Example

```bash
curl -X GET \
  -H "Authorization: Bearer $TOKEN" \
  "https://api.digitalocean.com/v2/domains/{domain_name}/records"
```

---

## POST /v2/domains/{domain_name}/records

**Create a New Domain Record**

To create a new record to a domain, send a POST request to
`/v2/domains/$DOMAIN_NAME/records`.

The request must include all of the required fields for the domain record type
being added.

See the [attribute table](#tag/Domain-Records) for details regarding record
types and their respective required attributes.


### Parameters

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| `` | query | string | No |  |

### Example

```bash
curl -X POST \
  -H "Authorization: Bearer $TOKEN" \
  "https://api.digitalocean.com/v2/domains/{domain_name}/records"
```

---

## GET /v2/domains/{domain_name}/records/{domain_record_id}

**Retrieve an Existing Domain Record**

To retrieve a specific domain record, send a GET request to `/v2/domains/$DOMAIN_NAME/records/$RECORD_ID`.

### Parameters

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| `` | query | string | No |  |
| `` | query | string | No |  |

### Example

```bash
curl -X GET \
  -H "Authorization: Bearer $TOKEN" \
  "https://api.digitalocean.com/v2/domains/{domain_name}/records/{domain_record_id}"
```

---

## PATCH /v2/domains/{domain_name}/records/{domain_record_id}

**Update a Domain Record**

To update an existing record, send a PATCH request to
`/v2/domains/$DOMAIN_NAME/records/$DOMAIN_RECORD_ID`. Any attribute valid for
the record type can be set to a new value for the record.

See the [attribute table](#tag/Domain-Records) for details regarding record
types and their respective attributes.


### Parameters

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| `` | query | string | No |  |
| `` | query | string | No |  |

### Example

```bash
curl -X PATCH \
  -H "Authorization: Bearer $TOKEN" \
  "https://api.digitalocean.com/v2/domains/{domain_name}/records/{domain_record_id}"
```

---

## PUT /v2/domains/{domain_name}/records/{domain_record_id}

**Update a Domain Record**

To update an existing record, send a PUT request to
`/v2/domains/$DOMAIN_NAME/records/$DOMAIN_RECORD_ID`. Any attribute valid for
the record type can be set to a new value for the record.

See the [attribute table](#tag/Domain-Records) for details regarding record
types and their respective attributes.


### Parameters

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| `` | query | string | No |  |
| `` | query | string | No |  |

### Example

```bash
curl -X PUT \
  -H "Authorization: Bearer $TOKEN" \
  "https://api.digitalocean.com/v2/domains/{domain_name}/records/{domain_record_id}"
```

---

## DELETE /v2/domains/{domain_name}/records/{domain_record_id}

**Delete a Domain Record**

To delete a record for a domain, send a DELETE request to
`/v2/domains/$DOMAIN_NAME/records/$DOMAIN_RECORD_ID`.

The record will be deleted and the response status will be a 204. This
indicates a successful request with no body returned.


### Parameters

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| `` | query | string | No |  |
| `` | query | string | No |  |

### Example

```bash
curl -X DELETE \
  -H "Authorization: Bearer $TOKEN" \
  "https://api.digitalocean.com/v2/domains/{domain_name}/records/{domain_record_id}"
```

---
