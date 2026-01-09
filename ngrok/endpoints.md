---
created: 2026-01-09
tags: [type/api-reference, api/endpoints]
api_name: ngrok OpenAPI
category: Endpoints
endpoint_count: 5
---

# ngrok OpenAPI - Endpoints

[[README|Back to Overview]]

---

## POST /endpoints

**Create**

Create an endpoint, currently available only for cloud endpoints


### Parameters

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| `` | query | string | No |  |

### Example

```bash
curl -X POST \
  -H "Authorization: Bearer $TOKEN" \
  "https://api.ngrok.com/endpoints"
```

---

## GET /endpoints

**List**

List all active endpoints on the account


### Parameters

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| `` | query | string | No |  |
| `before_id` | query | string | No |  |
| `limit` | query | string | No |  |
| `id` | query | array | No |  |
| `url` | query | array | No |  |
| `filter` | query | string | No |  |

### Example

```bash
curl -X GET \
  -H "Authorization: Bearer $TOKEN" \
  "https://api.ngrok.com/endpoints"
```

---

## GET /endpoints/{id}

**Get**

Get the status of an endpoint by ID


### Parameters

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| `` | query | string | No |  |
| `id` | path | string | Yes | a resource identifier
 |

### Example

```bash
curl -X GET \
  -H "Authorization: Bearer $TOKEN" \
  "https://api.ngrok.com/endpoints/{id}"
```

---

## PATCH /endpoints/{id}

**Update**

Update an Endpoint by ID, currently available only for cloud endpoints


### Parameters

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| `` | query | string | No |  |
| `id` | path | string | Yes | unique endpoint resource identifier
 |

### Example

```bash
curl -X PATCH \
  -H "Authorization: Bearer $TOKEN" \
  "https://api.ngrok.com/endpoints/{id}"
```

---

## DELETE /endpoints/{id}

**Delete**

Delete an Endpoint by ID, currently available only for cloud endpoints


### Parameters

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| `` | query | string | No |  |
| `id` | path | string | Yes | a resource identifier
 |

### Example

```bash
curl -X DELETE \
  -H "Authorization: Bearer $TOKEN" \
  "https://api.ngrok.com/endpoints/{id}"
```

---
