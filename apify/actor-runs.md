---
created: 2026-01-09
tags: [type/api-reference, api/actor-runs]
api_name: Apify API
category: Actor runs
endpoint_count: 9
---

# Apify API - Actor Runs

[[README|Back to Overview]]

---

## GET /v2/actor-runs

**Get user runs list**

Gets a list of all runs for a user. The response is a list of objects, where
each object contains basic information about a single Actor run.

The endpoint supports pagination using the `limit` and `offset` parameters
and it will not return more than 1000 array elements.

By default, the records are sorted by the `startedAt` field in ascending
order. Therefore, you can use pagination to incrementally fetch all records while
new ones are still being created. To sort the records in descending order, use
`desc=1` parameter. You can also filter runs by `startedAt`` and `status`` fields ([available
statuses](https://docs.apify.com/platform/actors/running/runs-and-builds#lifecycle)).


### Parameters

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| `offset` | query | number | No | Number of array elements that should be skipped at |
| `limit` | query | number | No | Maximum number of array elements to return. The de |
| `desc` | query | boolean | No | If `true` or `1` then the objects are sorted by th |
| `status` | query | string | No | Single status or comma-separated list of statuses, |
| `startedAfter` | query | string | No | Filter runs that started after the specified date  |
| `startedBefore` | query | string | No | Filter runs that started before the specified date |

### Example

```bash
curl -X GET \
  -H "Authorization: Bearer $TOKEN" \
  "https://api.apify.com/v2/actor-runs"
```

---

## GET /v2/actor-runs/{runId}

**Get run**

This is not a single endpoint, but an entire group of endpoints that lets
you retrieve the run or any of its default storages.

The endpoints accept the same HTTP methods and query parameters as
the respective storage endpoints.

The base path that represents the Actor run object is:

`/v2/actor-runs/{runId}{?token}`

In order to access the default storages of the Actor run, i.e. log,
key-value store, dataset and request queue, use the following endpoints:

* `/v2/actor-runs/{runId}/log{?token}`
* `/v2/actor-runs/{runId}/key-value-store{?token}`
* `/v2/actor-runs/{runId}/dataset{?token}`
* `/v2/actor-runs/{runId}/request-queue{?token}`

These API endpoints have the same usage as the equivalent storage endpoints.

For example, `/v2/actor-runs/{runId}/key-value-store` has the same HTTP method and
parameters as the [Key-value store object](#/reference/key-value-stores/store-object) endpoint.

Additionally, each of the above API endpoints supports all sub-endpoints
of the original one:

#### Log

* `/v2/actor-runs/{runId}/log` [Log](#/reference/logs)

#### Key-value store

* `/v2/actor-runs/{runId}/key-value-store/keys{?token}` [Key
collection](#/reference/key-value-stores/key-collection)
* `/v2/actor-runs/{runId}/key-value-store/records/{recordKey}{?token}`
[Record](#/reference/key-value-stores/record)

#### Dataset

* `/v2/actor-runs/{runId}/dataset/items{?token}` [Item
collection](#/reference/datasets/item-collection)

#### Request queue

* `/v2/actor-runs/{runId}/request-queue/requests{?token}` [Request
collection](#/reference/request-queues/request-collection)
* `/v2/actor-runs/{runId}/request-queue/requests/{requestId}{?token}`
[Request collection](#/reference/request-queues/request)
* `/v2/actor-runs/{runId}/request-queue/head{?token}` [Queue
head](#/reference/request-queues/queue-head)

For example, to download data from a dataset of the Actor run in XML format,
send HTTP GET request to the following URL:

```
https://api.apify.com/v2/actor-runs/{runId}/dataset/items?format=xml
```

In order to save new items to the dataset, send HTTP POST request with JSON
payload to the same URL.

Gets an object that contains all the details about a
specific run of an Actor.

By passing the optional `waitForFinish` parameter the API endpoint will synchronously wait
for the run to finish. This is useful to avoid periodic polling when waiting for Actor run to complete.

This endpoint does not require the authentication token. Instead, calls are authenticated using a hard-to-guess ID of the run. However,
if you access the endpoint without the token, certain attributes, such as `usageUsd` and `usageTotalUsd`, will be hidden.


### Parameters

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| `runId` | path | string | Yes | Run ID. |
| `waitForFinish` | query | number | No | The maximum number of seconds the server waits for |

### Example

```bash
curl -X GET \
  -H "Authorization: Bearer $TOKEN" \
  "https://api.apify.com/v2/actor-runs/{runId}"
```

---

## PUT /v2/actor-runs/{runId}

**Update run**

This endpoint can be used to update both the run's status message and to configure its general resource access level.

**Status message:**

You can set a single status message on your run that will be displayed in
the Apify Console UI. During an Actor run, you will typically do this in order
to inform users of your Actor about the Actor's progress.

The request body must contain `runId` and `statusMessage` properties. The
`isStatusMessageTerminal` property is optional and it indicates if the
status message is the very last one. In the absence of a status message, the
platform will try to substitute sensible defaults.

**General resource access:**

You can also update the run's general resource access setting, which determines who can view the run and its related data.

Allowed values:

* `FOLLOW_USER_SETTING` - The run inherits the general access setting from the account level.
* `ANYONE_WITH_ID_CAN_READ` - The run can be viewed anonymously by anyone who has its ID.
* `RESTRICTED` - Only users with explicit access to the resource can access the run.

When a run is accessible anonymously, all of the run's default storages and logs also become accessible anonymously.


### Parameters

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| `runId` | path | string | Yes | Run ID. |

### Example

```bash
curl -X PUT \
  -H "Authorization: Bearer $TOKEN" \
  "https://api.apify.com/v2/actor-runs/{runId}"
```

---

## DELETE /v2/actor-runs/{runId}

**Delete run**

Delete the run. Only finished runs can be deleted. Only the person or
organization that initiated the run can delete it.


### Parameters

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| `runId` | path | string | Yes | Run ID. |

### Example

```bash
curl -X DELETE \
  -H "Authorization: Bearer $TOKEN" \
  "https://api.apify.com/v2/actor-runs/{runId}"
```

---

## POST /v2/actor-runs/{runId}/abort

**Abort run**

Aborts an Actor run and returns an object that contains all the details
about the run.

Only runs that are starting or running are aborted. For runs with status
`FINISHED`, `FAILED`, `ABORTING` and `TIMED-OUT` this call does nothing.


### Parameters

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| `runId` | path | string | Yes | Run ID. |
| `gracefully` | query | boolean | No | If true passed, the Actor run will abort gracefull |

### Example

```bash
curl -X POST \
  -H "Authorization: Bearer $TOKEN" \
  "https://api.apify.com/v2/actor-runs/{runId}/abort"
```

---

## POST /v2/actor-runs/{runId}/metamorph

**Metamorph run**

Transforms an Actor run into a run of another Actor with a new input.

This is useful if you want to use another Actor to finish the work
of your current Actor run, without the need to create a completely new run
and waiting for its finish.

For the users of your Actors, the metamorph operation is transparent, they
will just see your Actor got the work done.

Internally, the system stops the Docker container corresponding to the Actor
run and starts a new container using a different Docker image.

All the default storages are preserved and the new input is stored under the
`INPUT-METAMORPH-1` key in the same default key-value store.

For more information, see the [Actor docs](https://docs.apify.com/platform/actors/development/programming-interface/metamorph).


### Parameters

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| `runId` | path | string | Yes | Actor run ID. |
| `targetActorId` | query | string | Yes | ID of a target Actor that the run should be transf |
| `build` | query | string | No | Optional build of the target Actor.

It can be eit |

### Example

```bash
curl -X POST \
  -H "Authorization: Bearer $TOKEN" \
  "https://api.apify.com/v2/actor-runs/{runId}/metamorph"
```

---

## POST /v2/actor-runs/{runId}/reboot

**Reboot run**

Reboots an Actor run and returns an object that contains all the details
about the rebooted run.

Only runs that are running, i.e. runs with status `RUNNING` can be rebooted.

The run's container will be restarted, so any data not persisted in the
key-value store, dataset, or request queue will be lost.


### Parameters

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| `runId` | path | string | Yes | Actor run ID. |

### Example

```bash
curl -X POST \
  -H "Authorization: Bearer $TOKEN" \
  "https://api.apify.com/v2/actor-runs/{runId}/reboot"
```

---

## POST /v2/actor-runs/{runId}/resurrect

**Resurrect run**

Resurrects a finished Actor run and returns an object that contains all the details about the resurrected run.
Only finished runs, i.e. runs with status `FINISHED`, `FAILED`, `ABORTED` and `TIMED-OUT` can be resurrected.
Run status will be updated to RUNNING and its container will be restarted with the same storages
(the same behaviour as when the run gets migrated to the new server).

For more information, see the [Actor docs](https://docs.apify.com/platform/actors/running/runs-and-builds#resurrection-of-finished-run).


### Parameters

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| `runId` | path | string | Yes | Run ID. |
| `build` | query | string | No | Specifies the Actor build to run. It can be either |
| `timeout` | query | number | No | Optional timeout for the run, in seconds. By defau |
| `memory` | query | number | No |  |
| `` | query | string | No |  |
| `` | query | string | No |  |
| `restartOnError` | query | boolean | No | Determines whether the resurrected run will be res |

### Example

```bash
curl -X POST \
  -H "Authorization: Bearer $TOKEN" \
  "https://api.apify.com/v2/actor-runs/{runId}/resurrect"
```

---

## POST /v2/actor-runs/{runId}/charge

**Charge events in run**

Charge for events in the run of your [pay per event Actor](https://docs.apify.com/platform/actors/running/actors-in-store#pay-per-event).
The event you are charging for must be one of the configured events in your Actor. If the Actor is not set up as pay per event, or if the event is not configured,
the endpoint will return an error. The endpoint must be called from the Actor run itself, with the same API token that the run was started with.

:::info Learn more about pay-per-event pricing

For more details about pay-per-event (PPE) pricing, refer to our [PPE documentation](/platform/actors/publishing/monetize/pay-per-event).

:::


### Parameters

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| `runId` | path | string | Yes | Run ID. |
| `idempotency-key` | header | string | No | Always pass a unique idempotency key (any unique s |

### Example

```bash
curl -X POST \
  -H "Authorization: Bearer $TOKEN" \
  "https://api.apify.com/v2/actor-runs/{runId}/charge"
```

---
