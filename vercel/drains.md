---
created: 2026-01-08
tags: [type/api-reference, api/drains]
api_name: Vercel API
category: drains
endpoint_count: 6
---

# Vercel API - Drains

[[README|Back to Overview]]

---

## POST /v1/drains

**Create a new Drain**

Create a new Drain with the provided configuration.

### Parameters

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| `teamId` | query | string | No | The Team identifier to perform the request on beha |
| `slug` | query | string | No | The Team slug to perform the request on behalf of. |

### Example

```bash
curl -X POST \
  -H "Authorization: Bearer $TOKEN" \
  "https://api.vercel.com/v1/drains"
```

---

## GET /v1/drains

**Retrieve a list of all Drains**

Allows to retrieve the list of Drains of the authenticated team.

### Parameters

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| `projectId` | query | string | No |  |
| `includeMetadata` | query | boolean | No |  |
| `teamId` | query | string | No | The Team identifier to perform the request on beha |
| `slug` | query | string | No | The Team slug to perform the request on behalf of. |

### Example

```bash
curl -X GET \
  -H "Authorization: Bearer $TOKEN" \
  "https://api.vercel.com/v1/drains"
```

---

## DELETE /v1/drains/{id}

**Delete a drain**

Delete a specific Drain by passing the drain id in the URL.

### Parameters

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| `id` | path | string | Yes |  |
| `teamId` | query | string | No | The Team identifier to perform the request on beha |
| `slug` | query | string | No | The Team slug to perform the request on behalf of. |

### Example

```bash
curl -X DELETE \
  -H "Authorization: Bearer $TOKEN" \
  "https://api.vercel.com/v1/drains/{id}"
```

---

## GET /v1/drains/{id}

**Find a Drain by id**

Get the information for a specific Drain by passing the drain id in the URL.

### Parameters

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| `id` | path | string | Yes |  |
| `teamId` | query | string | No | The Team identifier to perform the request on beha |
| `slug` | query | string | No | The Team slug to perform the request on behalf of. |

### Example

```bash
curl -X GET \
  -H "Authorization: Bearer $TOKEN" \
  "https://api.vercel.com/v1/drains/{id}"
```

---

## PATCH /v1/drains/{id}

**Update an existing Drain**

Update the configuration of an existing drain.

### Parameters

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| `id` | path | string | Yes |  |
| `teamId` | query | string | No | The Team identifier to perform the request on beha |
| `slug` | query | string | No | The Team slug to perform the request on behalf of. |

### Example

```bash
curl -X PATCH \
  -H "Authorization: Bearer $TOKEN" \
  "https://api.vercel.com/v1/drains/{id}"
```

---

## POST /v1/drains/test

**Validate Drain delivery configuration**

Validate the delivery configuration of a Drain using sample events.

### Parameters

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| `teamId` | query | string | No | The Team identifier to perform the request on beha |
| `slug` | query | string | No | The Team slug to perform the request on behalf of. |

### Example

```bash
curl -X POST \
  -H "Authorization: Bearer $TOKEN" \
  "https://api.vercel.com/v1/drains/test"
```

---
