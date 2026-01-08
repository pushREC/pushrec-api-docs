---
created: 2026-01-08
tags: [type/api-reference, api/droplets]
api_name: DigitalOcean API
category: Droplets
endpoint_count: 19
---

# DigitalOcean API - Droplets

[[README|Back to Overview]]

---

## GET /v2/droplets

**List All Droplets**

To list all Droplets in your account, send a GET request to `/v2/droplets`.

The response body will be a JSON object with a key of `droplets`. This will be
set to an array containing objects each representing a Droplet. These will
contain the standard Droplet attributes.

### Filtering Results by Tag

It's possible to request filtered results by including certain query parameters.
To only list Droplets assigned to a specific tag, include the `tag_name` query
parameter set to the name of the tag in your GET request. For example,
`/v2/droplets?tag_name=$TAG_NAME`.

### GPU Droplets

By default, only non-GPU Droplets are returned. To list only GPU Droplets, set
the `type` query parameter to `gpus`. For example, `/v2/droplets?type=gpus`.


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
  "https://api.digitalocean.com/v2/droplets"
```

---

## POST /v2/droplets

**Create a New Droplet**

To create a new Droplet, send a POST request to `/v2/droplets` setting the
required attributes.

A Droplet will be created using the provided information. The response body
will contain a JSON object with a key called `droplet`. The value will be an
object containing the standard attributes for your new Droplet. The response
code, 202 Accepted, does not indicate the success or failure of the operation,
just that the request has been accepted for processing. The `actions` returned
as part of the response's `links` object can be used to check the status
of the Droplet create event.

### Create Multiple Droplets

Creating multiple Droplets is very similar to creating a single Droplet.
Instead of sending `name` as a string, send `names` as an array of strings. A
Droplet will be created for each name you send using the associated
information. Up to ten Droplets may be created this way at a time.

Rather than returning a single Droplet, the response body will contain a JSON
array with a key called `droplets`. This will be set to an array of JSON
objects, each of which will contain the standard Droplet attributes. The
response code, 202 Accepted, does not indicate the success or failure of any
operation, just that the request has been accepted for processing. The array
of `actions` returned as part of the response's `links` object can be used to
check the status of each individual Droplet create event.


### Example

```bash
curl -X POST \
  -H "Authorization: Bearer $TOKEN" \
  "https://api.digitalocean.com/v2/droplets"
```

---

## DELETE /v2/droplets

**Deleting Droplets by Tag**

To delete **all** Droplets assigned to a specific tag, include the `tag_name`
query parameter set to the name of the tag in your DELETE request. For
example, `/v2/droplets?tag_name=$TAG_NAME`.

This endpoint requires `tag:read` scope.

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
  "https://api.digitalocean.com/v2/droplets"
```

---

## GET /v2/droplets/{droplet_id}

**Retrieve an Existing Droplet**

To show information about an individual Droplet, send a GET request to
`/v2/droplets/$DROPLET_ID`.


### Parameters

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| `` | query | string | No |  |

### Example

```bash
curl -X GET \
  -H "Authorization: Bearer $TOKEN" \
  "https://api.digitalocean.com/v2/droplets/{droplet_id}"
```

---

## DELETE /v2/droplets/{droplet_id}

**Delete an Existing Droplet**

To delete a Droplet, send a DELETE request to `/v2/droplets/$DROPLET_ID`.

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
  "https://api.digitalocean.com/v2/droplets/{droplet_id}"
```

---

## GET /v2/droplets/{droplet_id}/backups

**List Backups for a Droplet**

To retrieve any backups associated with a Droplet, send a GET request to
`/v2/droplets/$DROPLET_ID/backups`.

You will get back a JSON object that has a `backups` key. This will be set to
an array of backup objects, each of which contain the standard
Droplet backup attributes.


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
  "https://api.digitalocean.com/v2/droplets/{droplet_id}/backups"
```

---

## GET /v2/droplets/{droplet_id}/backups/policy

**Retrieve the Backup Policy for an Existing Droplet**

To show information about an individual Droplet's backup policy, send a GET
request to `/v2/droplets/$DROPLET_ID/backups/policy`.


### Parameters

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| `` | query | string | No |  |

### Example

```bash
curl -X GET \
  -H "Authorization: Bearer $TOKEN" \
  "https://api.digitalocean.com/v2/droplets/{droplet_id}/backups/policy"
```

---

## GET /v2/droplets/backups/policies

**List Backup Policies for All Existing Droplets**

To list information about the backup policies for all Droplets in the account,
send a GET request to `/v2/droplets/backups/policies`.


### Parameters

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| `` | query | string | No |  |
| `` | query | string | No |  |

### Example

```bash
curl -X GET \
  -H "Authorization: Bearer $TOKEN" \
  "https://api.digitalocean.com/v2/droplets/backups/policies"
```

---

## GET /v2/droplets/backups/supported_policies

**List Supported Droplet Backup Policies**

To retrieve a list of all supported Droplet backup policies, send a GET
request to `/v2/droplets/backups/supported_policies`.


### Example

```bash
curl -X GET \
  -H "Authorization: Bearer $TOKEN" \
  "https://api.digitalocean.com/v2/droplets/backups/supported_policies"
```

---

## GET /v2/droplets/{droplet_id}/snapshots

**List Snapshots for a Droplet**

To retrieve the snapshots that have been created from a Droplet, send a GET
request to `/v2/droplets/$DROPLET_ID/snapshots`.

You will get back a JSON object that has a `snapshots` key. This will be set
to an array of snapshot objects, each of which contain the standard Droplet
snapshot attributes.


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
  "https://api.digitalocean.com/v2/droplets/{droplet_id}/snapshots"
```

---

## GET /v2/droplets/{droplet_id}/kernels

**List All Available Kernels for a Droplet**

To retrieve a list of all kernels available to a Droplet, send a GET request
to `/v2/droplets/$DROPLET_ID/kernels`

The response will be a JSON object that has a key called `kernels`. This will
be set to an array of `kernel` objects, each of which contain the standard
`kernel` attributes.


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
  "https://api.digitalocean.com/v2/droplets/{droplet_id}/kernels"
```

---

## GET /v2/droplets/{droplet_id}/firewalls

**List all Firewalls Applied to a Droplet**

To retrieve a list of all firewalls available to a Droplet, send a GET request
to `/v2/droplets/$DROPLET_ID/firewalls`

The response will be a JSON object that has a key called `firewalls`. This will
be set to an array of `firewall` objects, each of which contain the standard
`firewall` attributes.


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
  "https://api.digitalocean.com/v2/droplets/{droplet_id}/firewalls"
```

---

## GET /v2/droplets/{droplet_id}/neighbors

**List Neighbors for a Droplet**

To retrieve a list of any "neighbors" (i.e. Droplets that are co-located on
the same physical hardware) for a specific Droplet, send a GET request to
`/v2/droplets/$DROPLET_ID/neighbors`.

The results will be returned as a JSON object with a key of `droplets`. This
will be set to an array containing objects representing any other Droplets
that share the same physical hardware. An empty array indicates that the
Droplet is not co-located any other Droplets associated with your account.


### Parameters

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| `` | query | string | No |  |

### Example

```bash
curl -X GET \
  -H "Authorization: Bearer $TOKEN" \
  "https://api.digitalocean.com/v2/droplets/{droplet_id}/neighbors"
```

---

## GET /v2/droplets/{droplet_id}/destroy_with_associated_resources

**List Associated Resources for a Droplet**

To list the associated billable resources that can be destroyed along with a
Droplet, send a GET request to the
`/v2/droplets/$DROPLET_ID/destroy_with_associated_resources` endpoint.

This endpoint will only return resources that you are authorized to see. For
example, to see associated Reserved IPs, include the `reserved_ip:read` scope.

The response will be a JSON object containing `snapshots`, `volumes`, and
`volume_snapshots` keys. Each will be set to an array of objects containing
information about the associated resources.


### Parameters

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| `` | query | string | No |  |

### Example

```bash
curl -X GET \
  -H "Authorization: Bearer $TOKEN" \
  "https://api.digitalocean.com/v2/droplets/{droplet_id}/destroy_with_associated_resources"
```

---

## DELETE /v2/droplets/{droplet_id}/destroy_with_associated_resources/selective

**Selectively Destroy a Droplet and its Associated Resources**

To destroy a Droplet along with a sub-set of its associated resources, send a
DELETE request to the `/v2/droplets/$DROPLET_ID/destroy_with_associated_resources/selective`
endpoint. The JSON body of the request should include `reserved_ips`, `snapshots`, `volumes`,
or `volume_snapshots` keys each set to an array of IDs for the associated
resources to be destroyed. The IDs can be found by querying the Droplet's
associated resources. Any associated resource not included in the request
will remain and continue to accrue changes on your account.

A successful response will include a 202 response code and no content. Use
the status endpoint to check on the success or failure of the destruction of
the individual resources.


### Parameters

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| `` | query | string | No |  |

### Example

```bash
curl -X DELETE \
  -H "Authorization: Bearer $TOKEN" \
  "https://api.digitalocean.com/v2/droplets/{droplet_id}/destroy_with_associated_resources/selective"
```

---

## DELETE /v2/droplets/{droplet_id}/destroy_with_associated_resources/dangerous

**Destroy a Droplet and All of its Associated Resources (Dangerous)**

To destroy a Droplet along with all of its associated resources, send a DELETE
request to the `/v2/droplets/$DROPLET_ID/destroy_with_associated_resources/dangerous`
endpoint. The headers of this request must include an `X-Dangerous` key set to
`true`. To preview which resources will be destroyed, first query the
Droplet's associated resources. This operation _can not_ be reverse and should
be used with caution.

A successful response will include a 202 response code and no content. Use the
status endpoint to check on the success or failure of the destruction of the
individual resources.


### Parameters

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| `` | query | string | No |  |
| `` | query | string | No |  |

### Example

```bash
curl -X DELETE \
  -H "Authorization: Bearer $TOKEN" \
  "https://api.digitalocean.com/v2/droplets/{droplet_id}/destroy_with_associated_resources/dangerous"
```

---

## GET /v2/droplets/{droplet_id}/destroy_with_associated_resources/status

**Check Status of a Droplet Destroy with Associated Resources Request**

To check on the status of a request to destroy a Droplet with its associated
resources, send a GET request to the
`/v2/droplets/$DROPLET_ID/destroy_with_associated_resources/status` endpoint.


### Parameters

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| `` | query | string | No |  |

### Example

```bash
curl -X GET \
  -H "Authorization: Bearer $TOKEN" \
  "https://api.digitalocean.com/v2/droplets/{droplet_id}/destroy_with_associated_resources/status"
```

---

## POST /v2/droplets/{droplet_id}/destroy_with_associated_resources/retry

**Retry a Droplet Destroy with Associated Resources Request**

If the status of a request to destroy a Droplet with its associated resources
reported any errors, it can be retried by sending a POST request to the
`/v2/droplets/$DROPLET_ID/destroy_with_associated_resources/retry` endpoint.

Only one destroy can be active at a time per Droplet. If a retry is issued
while another destroy is in progress for the Droplet a 409 status code will
be returned. A successful response will include a 202 response code and no
content.


### Parameters

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| `` | query | string | No |  |

### Example

```bash
curl -X POST \
  -H "Authorization: Bearer $TOKEN" \
  "https://api.digitalocean.com/v2/droplets/{droplet_id}/destroy_with_associated_resources/retry"
```

---

## GET /v2/reports/droplet_neighbors_ids

**List All Droplet Neighbors**

To retrieve a list of all Droplets that are co-located on the same physical
hardware, send a GET request to `/v2/reports/droplet_neighbors_ids`.

The results will be returned as a JSON object with a key of `neighbor_ids`.
This will be set to an array of arrays. Each array will contain a set of
Droplet IDs for Droplets that share a physical server. An empty array
indicates that all Droplets associated with your account are located on
separate physical hardware.


### Example

```bash
curl -X GET \
  -H "Authorization: Bearer $TOKEN" \
  "https://api.digitalocean.com/v2/reports/droplet_neighbors_ids"
```

---
