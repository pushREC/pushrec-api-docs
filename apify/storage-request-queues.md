---
created: 2026-01-09
tags: [type/api-reference, api/storage/request-queues]
api_name: Apify API
category: Storage/Request queues
endpoint_count: 7
---

# Apify API - Storage/Request Queues

[[README|Back to Overview]]

---

## GET /v2/request-queues

**Get list of request queues**

Lists all of a user's request queues. The response is a JSON array of
objects, where each object
contains basic information about one queue.

By default, the objects are sorted by the `createdAt` field in ascending order,
therefore you can use pagination to incrementally fetch all queues while new
ones are still being created. To sort them in descending order, use `desc=1`
parameter. The endpoint supports pagination using `limit` and `offset`
parameters and it will not return more than 1000
array elements.


### Parameters

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| `offset` | query | number | No | Number of array elements that should be skipped at |
| `limit` | query | number | No | Maximum number of array elements to return. The de |
| `desc` | query | boolean | No | If `true` or `1` then the objects are sorted by th |
| `unnamed` | query | boolean | No | If `true` or `1` then all the queues are returned. |

### Example

```bash
curl -X GET \
  -H "Authorization: Bearer $TOKEN" \
  "https://api.apify.com/v2/request-queues"
```

---

## POST /v2/request-queues

**Create request queue**

Creates a request queue and returns its object.
Keep in mind that requests stored under unnamed queue follows [data
retention period](https://docs.apify.com/platform/storage#data-retention).

It creates a queue of given name if the parameter name is used. If a queue
with the given name already exists then the endpoint returns
its object.


### Parameters

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| `name` | query | string | No | Custom unique name to easily identify the queue in |

### Example

```bash
curl -X POST \
  -H "Authorization: Bearer $TOKEN" \
  "https://api.apify.com/v2/request-queues"
```

---

## GET /v2/request-queues/{queueId}

**Get request queue**

Returns queue object for given queue ID.

### Parameters

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| `queueId` | path | string | Yes | Queue ID or `username~queue-name`. |

### Example

```bash
curl -X GET \
  -H "Authorization: Bearer $TOKEN" \
  "https://api.apify.com/v2/request-queues/{queueId}"
```

---

## PUT /v2/request-queues/{queueId}

**Update request queue**

Updates a request queue's name and general resource access level using a value specified by a JSON object
passed in the PUT payload.

The response is the updated request queue object, as returned by the
[Get request queue](#/reference/request-queues/queue-collection/get-request-queue) API endpoint.


### Parameters

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| `queueId` | path | string | Yes | Queue ID or `username~queue-name`. |

### Example

```bash
curl -X PUT \
  -H "Authorization: Bearer $TOKEN" \
  "https://api.apify.com/v2/request-queues/{queueId}"
```

---

## DELETE /v2/request-queues/{queueId}

**Delete request queue**

Deletes given queue.

### Parameters

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| `queueId` | path | string | Yes | Queue ID or `username~queue-name`. |

### Example

```bash
curl -X DELETE \
  -H "Authorization: Bearer $TOKEN" \
  "https://api.apify.com/v2/request-queues/{queueId}"
```

---

## POST /v2/request-queues/{queueId}/requests/batch

**Add requests**

Adds requests to the queue in batch. The maximum requests in batch is limit
to 25. The response contains an array of unprocessed and processed requests.
If any add operation fails because the request queue rate limit is exceeded
or an internal failure occurs,
the failed request is returned in the unprocessedRequests response
parameter.
You can resend these requests to add. It is recommended to use exponential
backoff algorithm for these retries.
If a request with the same `uniqueKey` was already present in the queue,
then it returns an ID of the existing request.


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
  "https://api.apify.com/v2/request-queues/{queueId}/requests/batch"
```

---

## DELETE /v2/request-queues/{queueId}/requests/batch

**Delete requests**

Batch-deletes given requests from the queue. The number of requests in a
batch is limited to 25. The response contains an array of unprocessed and
processed requests.
If any delete operation fails because the request queue rate limit is
exceeded or an internal failure occurs,
the failed request is returned in the `unprocessedRequests` response
parameter.
You can re-send these delete requests. It is recommended to use an
exponential backoff algorithm for these retries.
Each request is identified by its ID or uniqueKey parameter. You can use
either of them to identify the request.


### Parameters

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| `queueId` | path | string | Yes | Queue ID or `username~queue-name`. |
| `Content-Type` | header | string | Yes |  |
| `clientKey` | query | string | No | A unique identifier of the client accessing the re |

### Example

```bash
curl -X DELETE \
  -H "Authorization: Bearer $TOKEN" \
  "https://api.apify.com/v2/request-queues/{queueId}/requests/batch"
```

---
