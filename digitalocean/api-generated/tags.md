---
created: 2026-01-08
tags: [type/api-reference, api/tags]
api_name: DigitalOcean API
category: Tags
endpoint_count: 6
---

# DigitalOcean API - Tags

[[README|Back to Overview]]

---

## GET /v2/tags

**List All Tags**

To list all of your tags, you can send a GET request to `/v2/tags`.

This endpoint will only return tagged resources that you are authorized to see
(e.g. Droplets will only be returned if you have `droplet:read`).


### Parameters

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| `` | query | string | No |  |
| `` | query | string | No |  |

### Example

```bash
curl -X GET \
  -H "Authorization: Bearer $TOKEN" \
  "https://api.digitalocean.com/v2/tags"
```

---

## POST /v2/tags

**Create a New Tag**

To create a tag you can send a POST request to `/v2/tags` with a `name` attribute.

### Example

```bash
curl -X POST \
  -H "Authorization: Bearer $TOKEN" \
  "https://api.digitalocean.com/v2/tags"
```

---

## GET /v2/tags/{tag_id}

**Retrieve a Tag**

To retrieve an individual tag, you can send a `GET` request to
`/v2/tags/$TAG_NAME`.

This endpoint will only return tagged resources that you are authorized to see.
For example, to see tagged Droplets, include the `droplet:read` scope.


### Parameters

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| `` | query | string | No |  |

### Example

```bash
curl -X GET \
  -H "Authorization: Bearer $TOKEN" \
  "https://api.digitalocean.com/v2/tags/{tag_id}"
```

---

## DELETE /v2/tags/{tag_id}

**Delete a Tag**

A tag can be deleted by sending a `DELETE` request to `/v2/tags/$TAG_NAME`. Deleting a tag also untags all the resources that have previously been tagged by the Tag

### Parameters

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| `` | query | string | No |  |

### Example

```bash
curl -X DELETE \
  -H "Authorization: Bearer $TOKEN" \
  "https://api.digitalocean.com/v2/tags/{tag_id}"
```

---

## POST /v2/tags/{tag_id}/resources

**Tag a Resource**

Resources can be tagged by sending a POST request to
`/v2/tags/$TAG_NAME/resources` with an array of json objects containing
`resource_id` and `resource_type` attributes.

Currently only tagging of Droplets, Databases, Images, Volumes, and Volume
Snapshots is supported. `resource_type` is expected to be the string `droplet`,
`database`, `image`, `volume` or `volume_snapshot`. `resource_id` is expected
to be the ID of the resource as a string.

In order to tag a resource, you must have both `tag:create` and `<resource type>:update` scopes. For example, 
to tag a Droplet, you must have `tag:create` and `droplet:update`.


### Parameters

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| `` | query | string | No |  |

### Example

```bash
curl -X POST \
  -H "Authorization: Bearer $TOKEN" \
  "https://api.digitalocean.com/v2/tags/{tag_id}/resources"
```

---

## DELETE /v2/tags/{tag_id}/resources

**Untag a Resource**

Resources can be untagged by sending a DELETE request to
`/v2/tags/$TAG_NAME/resources` with an array of json objects containing
`resource_id` and `resource_type` attributes.

Currently only untagging of Droplets, Databases, Images, Volumes, and Volume
Snapshots is supported. `resource_type` is expected to be the string `droplet`,
`database`, `image`, `volume` or `volume_snapshot`. `resource_id` is expected
to be the ID of the resource as a string.

In order to untag a resource, you must have both `tag:delete` and `<resource type>:update` scopes. For example, 
to untag a Droplet, you must have `tag:delete` and `droplet:update`.


### Parameters

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| `` | query | string | No |  |

### Example

```bash
curl -X DELETE \
  -H "Authorization: Bearer $TOKEN" \
  "https://api.digitalocean.com/v2/tags/{tag_id}/resources"
```

---
