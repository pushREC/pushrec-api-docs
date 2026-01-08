---
created: 2026-01-08
tags: [type/api-reference, api/spaces-keys]
api_name: DigitalOcean API
category: Spaces Keys
endpoint_count: 6
---

# DigitalOcean API - Spaces Keys

[[README|Back to Overview]]

---

## GET /v2/spaces/keys

**List Spaces Access Keys**

To list Spaces Access Key, send a GET request to `/v2/spaces/keys`. Sort parameter must be used with Sort Direction.


### Parameters

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| `` | query | string | No |  |
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
  "https://api.digitalocean.com/v2/spaces/keys"
```

---

## POST /v2/spaces/keys

**Create a New Spaces Access Key**

To create a new Spaces Access Key, send a POST request to `/v2/spaces/keys`.
At the moment, you cannot mix a fullaccess permission with scoped permissions.
A fullaccess permission will be prioritized if fullaccess and scoped permissions are both added.


### Example

```bash
curl -X POST \
  -H "Authorization: Bearer $TOKEN" \
  "https://api.digitalocean.com/v2/spaces/keys"
```

---

## GET /v2/spaces/keys/{access_key}

**Get a Spaces Access Key**

To get a Spaces Access Key, send a GET request to `/v2/spaces/keys/$ACCESS_KEY`.

A successful request will return the Access Key.


### Parameters

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| `` | query | string | No |  |

### Example

```bash
curl -X GET \
  -H "Authorization: Bearer $TOKEN" \
  "https://api.digitalocean.com/v2/spaces/keys/{access_key}"
```

---

## DELETE /v2/spaces/keys/{access_key}

**Delete a Spaces Access Key**

To delete a Spaces Access Key, send a DELETE request to `/v2/spaces/keys/$ACCESS_KEY`.

A successful request will return a `204 No Content` status code.


### Parameters

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| `` | query | string | No |  |

### Example

```bash
curl -X DELETE \
  -H "Authorization: Bearer $TOKEN" \
  "https://api.digitalocean.com/v2/spaces/keys/{access_key}"
```

---

## PUT /v2/spaces/keys/{access_key}

**Update Spaces Access Keys**

To update Spaces Access Key, send a PUT or PATCH request to `/v2/spaces/keys/$ACCESS_KEY`. At the moment, you cannot convert a
fullaccess key to a scoped key or vice versa. You can only update the name of the key.


### Parameters

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| `` | query | string | No |  |

### Example

```bash
curl -X PUT \
  -H "Authorization: Bearer $TOKEN" \
  "https://api.digitalocean.com/v2/spaces/keys/{access_key}"
```

---

## PATCH /v2/spaces/keys/{access_key}

**Update Spaces Access Keys**

To update Spaces Access Key, send a PUT or PATCH request to `/v2/spaces/keys/$ACCESS_KEY`. At the moment, you cannot convert a
fullaccess key to a scoped key or vice versa. You can only update the name of the key.


### Parameters

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| `` | query | string | No |  |

### Example

```bash
curl -X PATCH \
  -H "Authorization: Bearer $TOKEN" \
  "https://api.digitalocean.com/v2/spaces/keys/{access_key}"
```

---
