---
created: 2026-01-08
tags: [type/api-reference, api/block-storage]
api_name: DigitalOcean API
category: Block Storage
endpoint_count: 9
---

# DigitalOcean API - Block Storage

[[README|Back to Overview]]

---

## GET /v2/volumes

**List All Block Storage Volumes**

To list all of the block storage volumes available on your account, send a GET request to `/v2/volumes`.
## Filtering Results
### By Region
The `region` may be provided as query parameter in order to restrict results to volumes available in a specific region. For example: `/v2/volumes?region=nyc1`
### By Name
It is also possible to list volumes on your account that match a specified name. To do so, send a GET request with the volume's name as a query parameter to `/v2/volumes?name=$VOLUME_NAME`.
**Note:** You can only create one volume per region with the same name.
### By Name and Region
It is also possible to retrieve information about a block storage volume by name. To do so, send a GET request with the volume's name and the region slug for the region it is located in as query parameters to `/v2/volumes?name=$VOLUME_NAME&region=nyc1`.




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
  "https://api.digitalocean.com/v2/volumes"
```

---

## POST /v2/volumes

**Create a New Block Storage Volume**

To create a new volume, send a POST request to `/v2/volumes`. Optionally, a `filesystem_type` attribute may be provided in order to automatically format the volume's filesystem. Pre-formatted volumes are automatically mounted when attached to Ubuntu, Debian, Fedora, Fedora Atomic, and CentOS Droplets created on or after April 26, 2018. Attaching pre-formatted volumes to Droplets without support for auto-mounting is not recommended.

### Example

```bash
curl -X POST \
  -H "Authorization: Bearer $TOKEN" \
  "https://api.digitalocean.com/v2/volumes"
```

---

## DELETE /v2/volumes

**Delete a Block Storage Volume by Name**

Block storage volumes may also be deleted by name by sending a DELETE request with the volume's **name** and the **region slug** for the region it is located in as query parameters to `/v2/volumes?name=$VOLUME_NAME&region=nyc1`.
No response body will be sent back, but the response code will indicate success. Specifically, the response code will be a 204, which means that the action was successful with no returned body data.



### Parameters

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| `` | query | string | No |  |
| `` | query | string | No |  |

### Example

```bash
curl -X DELETE \
  -H "Authorization: Bearer $TOKEN" \
  "https://api.digitalocean.com/v2/volumes"
```

---

## GET /v2/volumes/snapshots/{snapshot_id}

**Retrieve an Existing Volume Snapshot**

To retrieve the details of a snapshot that has been created from a volume, send a GET request to `/v2/volumes/snapshots/$VOLUME_SNAPSHOT_ID`.



### Parameters

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| `` | query | string | No |  |

### Example

```bash
curl -X GET \
  -H "Authorization: Bearer $TOKEN" \
  "https://api.digitalocean.com/v2/volumes/snapshots/{snapshot_id}"
```

---

## DELETE /v2/volumes/snapshots/{snapshot_id}

**Delete a Volume Snapshot**

To delete a volume snapshot, send a DELETE request to
`/v2/volumes/snapshots/$VOLUME_SNAPSHOT_ID`.

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
  "https://api.digitalocean.com/v2/volumes/snapshots/{snapshot_id}"
```

---

## GET /v2/volumes/{volume_id}

**Retrieve an Existing Block Storage Volume**

To show information about a block storage volume, send a GET request to `/v2/volumes/$VOLUME_ID`.



### Parameters

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| `` | query | string | No |  |

### Example

```bash
curl -X GET \
  -H "Authorization: Bearer $TOKEN" \
  "https://api.digitalocean.com/v2/volumes/{volume_id}"
```

---

## DELETE /v2/volumes/{volume_id}

**Delete a Block Storage Volume**

To delete a block storage volume, destroying all data and removing it from your account, send a DELETE request to `/v2/volumes/$VOLUME_ID`.
No response body will be sent back, but the response code will indicate success. Specifically, the response code will be a 204, which means that the action was successful with no returned body data.



### Parameters

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| `` | query | string | No |  |

### Example

```bash
curl -X DELETE \
  -H "Authorization: Bearer $TOKEN" \
  "https://api.digitalocean.com/v2/volumes/{volume_id}"
```

---

## GET /v2/volumes/{volume_id}/snapshots

**List Snapshots for a Volume**

To retrieve the snapshots that have been created from a volume, send a GET request to `/v2/volumes/$VOLUME_ID/snapshots`.



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
  "https://api.digitalocean.com/v2/volumes/{volume_id}/snapshots"
```

---

## POST /v2/volumes/{volume_id}/snapshots

**Create Snapshot from a Volume**

To create a snapshot from a volume, sent a POST request to `/v2/volumes/$VOLUME_ID/snapshots`.

### Parameters

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| `` | query | string | No |  |

### Example

```bash
curl -X POST \
  -H "Authorization: Bearer $TOKEN" \
  "https://api.digitalocean.com/v2/volumes/{volume_id}/snapshots"
```

---
