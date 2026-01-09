---
created: 2026-01-09
tags: [type/api-reference, api/storage/request-queues/requests-locks]
api_name: Apify API
category: Storage/Request queues/Requests locks
endpoint_count: 5
---

# Apify API - Storage/Request Queues/Requests Locks

[[README|Back to Overview]]

---

## POST /v2/request-queues/{queueId}/requests/unlock

**Unlock requests**

Unlocks requests in the queue that are currently locked by the client.

* If the client is within an Actor run, it unlocks all requests locked by that specific run plus all requests locked by the same clientKey.
* If the client is outside of an Actor run, it unlocks all requests locked using the same clientKey.


### Parameters

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| `queueId` | path | string | Yes | Queue ID or `username~queue-name`. |
| `clientKey` | query | string | No | A unique identifier of the client accessing the re |

### Example

```bash
curl -X POST \
  -H "Authorization: Bearer $TOKEN" \
  "https://api.apify.com/v2/request-queues/{queueId}/requests/unlock"
```

---

## GET /v2/request-queues/{queueId}/head

**Get head**

Returns given number of first requests from the queue.

The response contains the `hadMultipleClients` boolean field which indicates
that the queue was accessed by more than one client (with unique or empty
`clientKey`).
This field is used by [Apify SDK](https://sdk.apify.com) to determine
whether the local cache is consistent with the request queue, and thus
optimize performance of certain operations.


### Parameters

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| `queueId` | path | string | Yes | Queue ID or `username~queue-name`. |
| `limit` | query | number | No | How many items from queue should be returned. |
| `clientKey` | query | string | No | A unique identifier of the client accessing the re |

### Example

```bash
curl -X GET \
  -H "Authorization: Bearer $TOKEN" \
  "https://api.apify.com/v2/request-queues/{queueId}/head"
```

---

## POST /v2/request-queues/{queueId}/head/lock

**Get head and lock**

Returns the given number of first requests from the queue and locks them for
the given time.

If this endpoint locks the request, no other client or run will be able to get and
lock these requests.

The response contains the `hadMultipleClients` boolean field which indicates
that the queue was accessed by more than one client (with unique or empty
`clientKey`).


### Parameters

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| `queueId` | path | string | Yes | Queue ID or `username~queue-name`. |
| `lockSecs` | query | number | Yes | How long the requests will be locked for (in secon |
| `limit` | query | number | No | How many items from the queue should be returned. |
| `clientKey` | query | string | No | A unique identifier of the client accessing the re |

### Example

```bash
curl -X POST \
  -H "Authorization: Bearer $TOKEN" \
  "https://api.apify.com/v2/request-queues/{queueId}/head/lock"
```

---

## PUT /v2/request-queues/{queueId}/requests/{requestId}/lock

**Prolong request lock**

Prolongs request lock. The request lock can be prolonged only by the client
that has locked it using [Get and lock head
operation](#/reference/request-queues/queue-head-with-locks).


### Parameters

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| `queueId` | path | string | Yes | Queue ID or `username~queue-name`. |
| `requestId` | path | string | Yes | Request ID. |
| `lockSecs` | query | number | Yes | For how long second request will be locked. |
| `clientKey` | query | string | No | A unique identifier of the client accessing the re |
| `forefront` | query | string | No | Determines if request should be added to the head  |

### Example

```bash
curl -X PUT \
  -H "Authorization: Bearer $TOKEN" \
  "https://api.apify.com/v2/request-queues/{queueId}/requests/{requestId}/lock"
```

---

## DELETE /v2/request-queues/{queueId}/requests/{requestId}/lock

**Delete request lock**

Deletes a request lock. The request lock can be deleted only by the client
that has locked it using [Get and lock head
operation](#/reference/request-queues/queue-head-with-locks).


### Parameters

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| `queueId` | path | string | Yes | Queue ID or `username~queue-name`. |
| `requestId` | path | string | Yes | Request ID. |
| `Content-Type` | header | string | Yes |  |
| `clientKey` | query | string | No | A unique identifier of the client accessing the re |
| `forefront` | query | string | No | Determines if request should be added to the head  |

### Example

```bash
curl -X DELETE \
  -H "Authorization: Bearer $TOKEN" \
  "https://api.apify.com/v2/request-queues/{queueId}/requests/{requestId}/lock"
```

---
