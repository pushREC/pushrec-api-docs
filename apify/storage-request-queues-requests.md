---
created: 2026-01-09
tags: [type/api-reference, api/storage/request-queues/requests]
api_name: Apify API
category: Storage/Request queues/Requests
endpoint_count: 5
---

# Apify API - Storage/Request Queues/Requests

[[README|Back to Overview]]

---

## GET /v2/request-queues/{queueId}/requests

**List requests**

Returns a list of requests. This endpoint is paginated using
exclusiveStartId and limit parameters.


### Parameters

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| `queueId` | path | string | Yes | Queue ID or `username~queue-name`. |
| `clientKey` | query | string | No | A unique identifier of the client accessing the re |
| `exclusiveStartId` | query | string | No | All requests up to this one (including) are skippe |
| `limit` | query | number | No | Number of keys to be returned. Maximum value is `1 |

### Example

```bash
curl -X GET \
  -H "Authorization: Bearer $TOKEN" \
  "https://api.apify.com/v2/request-queues/{queueId}/requests"
```

---

## POST /v2/request-queues/{queueId}/requests

**Add request**

Adds request to the queue. Response contains ID of the request and info if
request was already present in the queue or handled.

If request with same `uniqueKey` was already present in the queue then
returns an ID of existing request.


### Parameters

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| `queueId` | path | string | Yes | Queue ID or `username~queue-name`. |
| `clientKey` | query | string | No | A unique identifier of the client accessing the re |
| `forefront` | query | string | No | Determines if request should be added to the head  |

### Example

```bash
curl -X POST \
  -H "Authorization: Bearer $TOKEN" \
  "https://api.apify.com/v2/request-queues/{queueId}/requests"
```

---

## GET /v2/request-queues/{queueId}/requests/{requestId}

**Get request**

Returns request from queue.

### Parameters

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| `queueId` | path | string | Yes | Queue ID or `username~queue-name`. |
| `requestId` | path | string | Yes | Request ID. |

### Example

```bash
curl -X GET \
  -H "Authorization: Bearer $TOKEN" \
  "https://api.apify.com/v2/request-queues/{queueId}/requests/{requestId}"
```

---

## PUT /v2/request-queues/{queueId}/requests/{requestId}

**Update request**

Updates a request in a queue. Mark request as handled by setting
`request.handledAt = new Date()`.
If `handledAt` is set, the request will be removed from head of the queue (and unlocked, if applicable).


### Parameters

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| `queueId` | path | string | Yes | Queue ID or `username~queue-name`. |
| `requestId` | path | string | Yes | Request ID. |
| `forefront` | query | string | No | Determines if request should be added to the head  |
| `clientKey` | query | string | No | A unique identifier of the client accessing the re |

### Example

```bash
curl -X PUT \
  -H "Authorization: Bearer $TOKEN" \
  "https://api.apify.com/v2/request-queues/{queueId}/requests/{requestId}"
```

---

## DELETE /v2/request-queues/{queueId}/requests/{requestId}

**Delete request**

Deletes given request from queue.

### Parameters

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| `queueId` | path | string | Yes | Queue ID or `username~queue-name`. |
| `requestId` | path | string | Yes | Request ID. |
| `clientKey` | query | string | No | A unique identifier of the client accessing the re |

### Example

```bash
curl -X DELETE \
  -H "Authorization: Bearer $TOKEN" \
  "https://api.apify.com/v2/request-queues/{queueId}/requests/{requestId}"
```

---
