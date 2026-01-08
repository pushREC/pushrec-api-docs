---
created: 2026-01-08
tags: [type/api-reference, api/block-storage-actions]
api_name: DigitalOcean API
category: Block Storage Actions
endpoint_count: 4
---

# DigitalOcean API - Block Storage Actions

[[README|Back to Overview]]

---

## POST /v2/volumes/actions

**Initiate A Block Storage Action By Volume Name**

To initiate an action on a block storage volume by Name, send a POST request to
`~/v2/volumes/actions`. The body should contain the appropriate
attributes for the respective action.

## Attach a Block Storage Volume to a Droplet

| Attribute   | Details                                                             |
| ----------- | ------------------------------------------------------------------- |
| type        | This must be `attach`                                               |
| volume_name | The name of the block storage volume                                |
| droplet_id  | Set to the Droplet's ID                                             |
| region      | Set to the slug representing the region where the volume is located |

Each volume may only be attached to a single Droplet. However, up to fifteen
volumes may be attached to a Droplet at a time. Pre-formatted volumes will be
automatically mounted to Ubuntu, Debian, Fedora, Fedora Atomic, and CentOS
Droplets created on or after April 26, 2018 when attached. On older Droplets,
[additional configuration](https://docs.digitalocean.com/products/volumes/how-to/mount/)
is required.

## Remove a Block Storage Volume from a Droplet

| Attribute   | Details                                                             |
| ----------- | ------------------------------------------------------------------- |
| type        | This must be `detach`                                               |
| volume_name | The name of the block storage volume                                |
| droplet_id  | Set to the Droplet's ID                                             |
| region      | Set to the slug representing the region where the volume is located |


### Parameters

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| `` | query | string | No |  |
| `` | query | string | No |  |

### Example

```bash
curl -X POST \
  -H "Authorization: Bearer $TOKEN" \
  "https://api.digitalocean.com/v2/volumes/actions"
```

---

## GET /v2/volumes/{volume_id}/actions

**List All Actions for a Volume**

To retrieve all actions that have been executed on a volume, send a GET request to `/v2/volumes/$VOLUME_ID/actions`.



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
  "https://api.digitalocean.com/v2/volumes/{volume_id}/actions"
```

---

## POST /v2/volumes/{volume_id}/actions

**Initiate A Block Storage Action By Volume Id**

To initiate an action on a block storage volume by Id, send a POST request to
`~/v2/volumes/$VOLUME_ID/actions`. The body should contain the appropriate
attributes for the respective action.

## Attach a Block Storage Volume to a Droplet

| Attribute  | Details                                                             |
| ---------- | ------------------------------------------------------------------- |
| type       | This must be `attach`                                               |
| droplet_id | Set to the Droplet's ID                                             |
| region     | Set to the slug representing the region where the volume is located |

Each volume may only be attached to a single Droplet. However, up to fifteen
volumes may be attached to a Droplet at a time. Pre-formatted volumes will be
automatically mounted to Ubuntu, Debian, Fedora, Fedora Atomic, and CentOS
Droplets created on or after April 26, 2018 when attached. On older Droplets,
[additional configuration](https://docs.digitalocean.com/products/volumes/how-to/mount/)
is required.

## Remove a Block Storage Volume from a Droplet

| Attribute  | Details                                                             |
| ---------- | ------------------------------------------------------------------- |
| type       | This must be `detach`                                               |
| droplet_id | Set to the Droplet's ID                                             |
| region     | Set to the slug representing the region where the volume is located |

## Resize a Volume

| Attribute      | Details                                                             |
| -------------- | ------------------------------------------------------------------- |
| type           | This must be `resize`                                               |
| size_gigabytes | The new size of the block storage volume in GiB (1024^3)            |
| region         | Set to the slug representing the region where the volume is located |

Volumes may only be resized upwards. The maximum size for a volume is 16TiB.


### Parameters

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| `` | query | string | No |  |
| `` | query | string | No |  |
| `` | query | string | No |  |

### Example

```bash
curl -X POST \
  -H "Authorization: Bearer $TOKEN" \
  "https://api.digitalocean.com/v2/volumes/{volume_id}/actions"
```

---

## GET /v2/volumes/{volume_id}/actions/{action_id}

**Retrieve an Existing Volume Action**

To retrieve the status of a volume action, send a GET request to `/v2/volumes/$VOLUME_ID/actions/$ACTION_ID`.



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
  "https://api.digitalocean.com/v2/volumes/{volume_id}/actions/{action_id}"
```

---
