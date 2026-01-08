---
created: 2026-01-08
tags: [type/api-reference, api/images]
api_name: DigitalOcean API
category: Images
endpoint_count: 5
---

# DigitalOcean API - Images

[[README|Back to Overview]]

---

## GET /v2/images

**List All Images**

To list all of the images available on your account, send a GET request to /v2/images.

## Filtering Results
-----

It's possible to request filtered results by including certain query parameters.

**Image Type**

Either 1-Click Application or OS Distribution images can be filtered by using the `type` query parameter.

> Important: The `type` query parameter does not directly relate to the `type` attribute.

To retrieve only ***distribution*** images, include the `type` query parameter set to distribution, `/v2/images?type=distribution`.

To retrieve only ***application*** images, include the `type` query parameter set to application, `/v2/images?type=application`.

**User Images**

To retrieve only the private images of a user, include the `private` query parameter set to true, `/v2/images?private=true`.

**Tags**

To list all images assigned to a specific tag, include the `tag_name` query parameter set to the name of the tag in your GET request. For example, `/v2/images?tag_name=$TAG_NAME`.


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
  "https://api.digitalocean.com/v2/images"
```

---

## POST /v2/images

**Create a Custom Image**

To create a new custom image, send a POST request to /v2/images.
The body must contain a url attribute pointing to a Linux virtual machine
image to be imported into DigitalOcean.
The image must be in the raw, qcow2, vhdx, vdi, or vmdk format.
It may be compressed using gzip or bzip2 and must be smaller than 100 GB after
 being decompressed.


### Example

```bash
curl -X POST \
  -H "Authorization: Bearer $TOKEN" \
  "https://api.digitalocean.com/v2/images"
```

---

## GET /v2/images/{image_id}

**Retrieve an Existing Image**

To retrieve information about an image, send a `GET` request to
`/v2/images/$IDENTIFIER`.


### Parameters

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| `image_id` | path | string | Yes | A unique number (id) or string (slug) used to iden |

### Example

```bash
curl -X GET \
  -H "Authorization: Bearer $TOKEN" \
  "https://api.digitalocean.com/v2/images/{image_id}"
```

---

## PUT /v2/images/{image_id}

**Update an Image**

To update an image, send a `PUT` request to `/v2/images/$IMAGE_ID`.
Set the `name` attribute to the new value you would like to use.
For custom images, the `description` and `distribution` attributes may also be updated.


### Parameters

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| `` | query | string | No |  |

### Example

```bash
curl -X PUT \
  -H "Authorization: Bearer $TOKEN" \
  "https://api.digitalocean.com/v2/images/{image_id}"
```

---

## DELETE /v2/images/{image_id}

**Delete an Image**

To delete a snapshot or custom image, send a `DELETE` request to `/v2/images/$IMAGE_ID`.


### Parameters

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| `` | query | string | No |  |

### Example

```bash
curl -X DELETE \
  -H "Authorization: Bearer $TOKEN" \
  "https://api.digitalocean.com/v2/images/{image_id}"
```

---
