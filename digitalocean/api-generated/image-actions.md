---
created: 2026-01-08
tags: [type/api-reference, api/image-actions]
api_name: DigitalOcean API
category: Image Actions
endpoint_count: 3
---

# DigitalOcean API - Image Actions

[[README|Back to Overview]]

---

## GET /v2/images/{image_id}/actions

**List All Actions for an Image**

To retrieve all actions that have been executed on an image, send a GET request to `/v2/images/$IMAGE_ID/actions`.

### Parameters

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| `` | query | string | No |  |

### Example

```bash
curl -X GET \
  -H "Authorization: Bearer $TOKEN" \
  "https://api.digitalocean.com/v2/images/{image_id}/actions"
```

---

## POST /v2/images/{image_id}/actions

**Initiate an Image Action**

The following actions are available on an Image.

## Convert an Image to a Snapshot

To convert an image, for example, a backup to a snapshot, send a POST request
to `/v2/images/$IMAGE_ID/actions`. Set the `type` attribute to `convert`.

## Transfer an Image

To transfer an image to another region, send a POST request to
`/v2/images/$IMAGE_ID/actions`. Set the `type` attribute to `transfer` and set
`region` attribute to the slug identifier of the region you wish to transfer
to.


### Parameters

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| `` | query | string | No |  |

### Example

```bash
curl -X POST \
  -H "Authorization: Bearer $TOKEN" \
  "https://api.digitalocean.com/v2/images/{image_id}/actions"
```

---

## GET /v2/images/{image_id}/actions/{action_id}

**Retrieve an Existing Action**

To retrieve the status of an image action, send a GET request to `/v2/images/$IMAGE_ID/actions/$IMAGE_ACTION_ID`.

### Parameters

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| `` | query | string | No |  |
| `` | query | string | No |  |

### Example

```bash
curl -X GET \
  -H "Authorization: Bearer $TOKEN" \
  "https://api.digitalocean.com/v2/images/{image_id}/actions/{action_id}"
```

---
