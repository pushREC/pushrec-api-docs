---
created: 2026-01-08
tags: [type/api-reference, api/nfs]
api_name: DigitalOcean API
category: NFS
endpoint_count: 7
---

# DigitalOcean API - Nfs

[[README|Back to Overview]]

---

## POST /v2/nfs

**Create a new NFS share**

To create a new NFS share, send a POST request to `/v2/nfs`.


### Example

```bash
curl -X POST \
  -H "Authorization: Bearer $TOKEN" \
  "https://api.digitalocean.com/v2/nfs"
```

---

## GET /v2/nfs

**List NFS shares per region**

To list NFS shares, send a GET request to `/v2/nfs?region=${region}`.

A successful request will return all NFS shares belonging to the authenticated user.


### Parameters

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| `` | query | string | No |  |

### Example

```bash
curl -X GET \
  -H "Authorization: Bearer $TOKEN" \
  "https://api.digitalocean.com/v2/nfs"
```

---

## GET /v2/nfs/{nfs_id}

**Get an NFS share**

To get an NFS share, send a GET request to `/v2/nfs/{nfs_id}?region=${region}`.

A successful request will return the NFS share.


### Parameters

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| `` | query | string | No |  |
| `` | query | string | No |  |

### Example

```bash
curl -X GET \
  -H "Authorization: Bearer $TOKEN" \
  "https://api.digitalocean.com/v2/nfs/{nfs_id}"
```

---

## DELETE /v2/nfs/{nfs_id}

**Delete an NFS share**

To delete an NFS share, send a DELETE request to `/v2/nfs/{nfs_id}?region=${region}`.

A successful request will return a `204 No Content` status code.


### Parameters

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| `` | query | string | No |  |
| `` | query | string | No |  |

### Example

```bash
curl -X DELETE \
  -H "Authorization: Bearer $TOKEN" \
  "https://api.digitalocean.com/v2/nfs/{nfs_id}"
```

---

## GET /v2/nfs/snapshots

**List NFS snapshots per region**

To list all NFS snapshots, send a GET request to `/v2/nfs/snapshots?region=${region}&share_id={share_id}`.

A successful request will return all NFS snapshots belonging to the authenticated user in the specified region.

Optionally, you can filter snapshots by a specific NFS share by including the `share_id` query parameter.


### Parameters

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| `` | query | string | No |  |
| `` | query | string | No |  |

### Example

```bash
curl -X GET \
  -H "Authorization: Bearer $TOKEN" \
  "https://api.digitalocean.com/v2/nfs/snapshots"
```

---

## GET /v2/nfs/snapshots/{nfs_snapshot_id}

**Get an NFS snapshot by ID**

To get an NFS snapshot, send a GET request to `/v2/nfs/snapshots/{nfs_snapshot_id}?region=${region}`.

A successful request will return the NFS snapshot.


### Parameters

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| `` | query | string | No |  |
| `` | query | string | No |  |

### Example

```bash
curl -X GET \
  -H "Authorization: Bearer $TOKEN" \
  "https://api.digitalocean.com/v2/nfs/snapshots/{nfs_snapshot_id}"
```

---

## DELETE /v2/nfs/snapshots/{nfs_snapshot_id}

**Delete an NFS snapshot**

To delete an NFS snapshot, send a DELETE request to `/v2/nfs/snapshots/{nfs_snapshot_id}?region=${region}`.

A successful request will return a `204 No Content` status code.


### Parameters

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| `` | query | string | No |  |
| `` | query | string | No |  |

### Example

```bash
curl -X DELETE \
  -H "Authorization: Bearer $TOKEN" \
  "https://api.digitalocean.com/v2/nfs/snapshots/{nfs_snapshot_id}"
```

---
