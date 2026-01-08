---
created: 2026-01-08
tags: [type/api-reference, api/snapshots]
api_name: DigitalOcean API
category: Snapshots
endpoint_count: 3
---

# DigitalOcean API - Snapshots

[[README|Back to Overview]]

---

## GET /v2/snapshots

**List All Snapshots**

To list all of the snapshots available on your account, send a GET request to
`/v2/snapshots`.

The response will be a JSON object with a key called `snapshots`. This will be
set to an array of `snapshot` objects, each of which will contain the standard
snapshot attributes.

### Filtering Results by Resource Type

It's possible to request filtered results by including certain query parameters.

#### List Droplet Snapshots

To retrieve only snapshots based on Droplets, include the `resource_type`
query parameter set to `droplet`. For example, `/v2/snapshots?resource_type=droplet`.

#### List Volume Snapshots

To retrieve only snapshots based on volumes, include the `resource_type`
query parameter set to `volume`. For example, `/v2/snapshots?resource_type=volume`.


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
  "https://api.digitalocean.com/v2/snapshots"
```

---

## GET /v2/snapshots/{snapshot_id}

**Retrieve an Existing Snapshot**

To retrieve information about a snapshot, send a GET request to
`/v2/snapshots/$SNAPSHOT_ID`.

The response will be a JSON object with a key called `snapshot`. The value of
this will be an snapshot object containing the standard snapshot attributes.


### Parameters

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| `` | query | string | No |  |

### Example

```bash
curl -X GET \
  -H "Authorization: Bearer $TOKEN" \
  "https://api.digitalocean.com/v2/snapshots/{snapshot_id}"
```

---

## DELETE /v2/snapshots/{snapshot_id}

**Delete a Snapshot**

Both Droplet and volume snapshots are managed through the `/v2/snapshots/`
endpoint. To delete a snapshot, send a DELETE request to
`/v2/snapshots/$SNAPSHOT_ID`.

A status of 204 will be given. This indicates that the request was processed
successfully, but that no response body is needed.


### Parameters

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| `` | query | string | No |  |

### Example

```bash
curl -X DELETE \
  -H "Authorization: Bearer $TOKEN" \
  "https://api.digitalocean.com/v2/snapshots/{snapshot_id}"
```

---
