---
created: 2026-01-09
tags: [type/api-reference, api/actors/actor-runs]
api_name: Apify API
category: Actors/Actor runs
endpoint_count: 11
---

# Apify API - Actors/Actor Runs

[[README|Back to Overview]]

---

## GET /v2/acts/{actorId}/runs

**Get list of runs**

Gets the list of runs of a specific Actor. The response is a list of
objects, where each object contains basic information about a single Actor run.

The endpoint supports pagination using the `limit` and `offset` parameters
and it will not return more than 1000 array elements.

By default, the records are sorted by the `startedAt` field in ascending
order, therefore you can use pagination to incrementally fetch all records while
new ones are still being created. To sort the records in descending order, use
`desc=1` parameter. You can also filter runs by status ([available
statuses](https://docs.apify.com/platform/actors/running/runs-and-builds#lifecycle)).


### Parameters

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| `actorId` | path | string | Yes | Actor ID or a tilde-separated owner's username and |
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
  "https://api.apify.com/v2/acts/{actorId}/runs"
```

---

## POST /v2/acts/{actorId}/runs

**Run Actor**

Runs an Actor and immediately returns without waiting for the run to finish.

The POST payload including its `Content-Type` header is passed as `INPUT` to
the Actor (usually `application/json`).

The Actor is started with the default options; you can override them using
various URL query parameters.

The response is the Run object as returned by the [Get
run](#/reference/actor-runs/run-object-and-its-storages/get-run) API
endpoint.

If you want to wait for the run to finish and receive the actual output of
the Actor as the response, please use one of the [Run Actor
synchronously](#/reference/actors/run-actor-synchronously) API endpoints
instead.

To fetch the Actor run results that are typically stored in the default
dataset, you'll need to pass the ID received in the `defaultDatasetId` field
received in the response JSON to the [Get dataset items](#/reference/datasets/item-collection/get-items)
API endpoint.


### Parameters

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| `actorId` | path | string | Yes | Actor ID or a tilde-separated owner's username and |
| `timeout` | query | number | No | Optional timeout for the run, in seconds. By defau |
| `memory` | query | number | No | Memory limit for the run, in megabytes. The amount |
| `` | query | string | No |  |
| `` | query | string | No |  |
| `restartOnError` | query | boolean | No | Determines whether the run will be restarted if it |
| `build` | query | string | No | Specifies the Actor build to run. It can be either |
| `waitForFinish` | query | number | No | The maximum number of seconds the server waits for |
| `webhooks` | query | string | No | Specifies optional webhooks associated with the Ac |
| `forcePermissionLevel` | query | string | No | Overrides the Actor's permission level for this sp |

### Example

```bash
curl -X POST \
  -H "Authorization: Bearer $TOKEN" \
  "https://api.apify.com/v2/acts/{actorId}/runs"
```

---

## POST /v2/acts/{actorId}/run-sync

**Run Actor synchronously with input and return output**

Runs a specific Actor and returns its output.

The POST payload including its `Content-Type` header is passed as `INPUT` to
the Actor (usually <code>application/json</code>).
The HTTP response contains Actors `OUTPUT` record from its default
key-value store.

The Actor is started with the default options; you can override them using
various URL query parameters.
If the Actor run exceeds 300<!-- MAX_ACTOR_JOB_SYNC_WAIT_SECS --> seconds,
the HTTP response will have status 408 (Request Timeout).

Beware that it might be impossible to maintain an idle HTTP connection for a
long period of time, due to client timeout or network conditions. Make sure your HTTP client is
configured to have a long enough connection timeout.
If the connection breaks, you will not receive any information about the run
and its status.

To run the Actor asynchronously, use the [Run
Actor](#/reference/actors/run-collection/run-actor) API endpoint instead.


### Parameters

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| `actorId` | path | string | Yes | Actor ID or a tilde-separated owner's username and |
| `outputRecordKey` | query | string | No | Key of the record from run's default key-value sto |
| `timeout` | query | number | No | Optional timeout for the run, in seconds. By defau |
| `memory` | query | number | No | Memory limit for the run, in megabytes. The amount |
| `` | query | string | No |  |
| `` | query | string | No |  |
| `restartOnError` | query | boolean | No | Determines whether the run will be restarted if it |
| `build` | query | string | No | Specifies the Actor build to run. It can be either |
| `webhooks` | query | string | No | Specifies optional webhooks associated with the Ac |

### Example

```bash
curl -X POST \
  -H "Authorization: Bearer $TOKEN" \
  "https://api.apify.com/v2/acts/{actorId}/run-sync"
```

---

## GET /v2/acts/{actorId}/run-sync

**Without input**

Runs a specific Actor and returns its output.
The run must finish in 300<!-- MAX_ACTOR_JOB_SYNC_WAIT_SECS --> seconds
otherwise the API endpoint returns a timeout error.
The Actor is not passed any input.

Beware that it might be impossible to maintain an idle HTTP connection for a
long period of time,
due to client timeout or network conditions. Make sure your HTTP client is
configured to have a long enough connection timeout.
If the connection breaks, you will not receive any information about the run
and its status.

To run the Actor asynchronously, use the [Run
Actor](#/reference/actors/run-collection/run-actor) API endpoint instead.


### Parameters

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| `actorId` | path | string | Yes | Actor ID or a tilde-separated owner's username and |
| `outputRecordKey` | query | string | No | Key of the record from run's default key-value sto |
| `timeout` | query | number | No | Optional timeout for the run, in seconds. By defau |
| `memory` | query | number | No | Memory limit for the run, in megabytes. The amount |
| `` | query | string | No |  |
| `` | query | string | No |  |
| `restartOnError` | query | boolean | No | Determines whether the run will be restarted if it |
| `build` | query | string | No | Specifies the Actor build to run. It can be either |
| `webhooks` | query | string | No | Specifies optional webhooks associated with the Ac |

### Example

```bash
curl -X GET \
  -H "Authorization: Bearer $TOKEN" \
  "https://api.apify.com/v2/acts/{actorId}/run-sync"
```

---

## POST /v2/acts/{actorId}/run-sync-get-dataset-items

**Run Actor synchronously with input and get dataset items**

Runs a specific Actor and returns its dataset items.

The POST payload including its `Content-Type` header is passed as `INPUT` to
the Actor (usually `application/json`).
The HTTP response contains the Actors dataset items, while the format of
items depends on specifying dataset items' `format` parameter.

You can send all the same options in parameters as the [Get Dataset
Items](#/reference/datasets/item-collection/get-items) API endpoint.

The Actor is started with the default options; you can override them using
URL query parameters.
If the Actor run exceeds 300<!-- MAX_ACTOR_JOB_SYNC_WAIT_SECS --> seconds,
the HTTP response will return the 408 status code (Request Timeout).

Beware that it might be impossible to maintain an idle HTTP connection for a
long period of time,
due to client timeout or network conditions. Make sure your HTTP client is
configured to have a long enough connection timeout.
If the connection breaks, you will not receive any information about the run
and its status.

To run the Actor asynchronously, use the [Run
Actor](#/reference/actors/run-collection/run-actor) API endpoint instead.


### Parameters

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| `actorId` | path | string | Yes | Actor ID or a tilde-separated owner's username and |
| `timeout` | query | number | No | Optional timeout for the run, in seconds. By defau |
| `memory` | query | number | No | Memory limit for the run, in megabytes. The amount |
| `` | query | string | No |  |
| `` | query | string | No |  |
| `restartOnError` | query | boolean | No | Determines whether the run will be restarted if it |
| `build` | query | string | No | Specifies the Actor build to run. It can be either |
| `webhooks` | query | string | No | Specifies optional webhooks associated with the Ac |
| `format` | query | string | No | Format of the results, possible values are: `json` |
| `clean` | query | boolean | No | If `true` or `1` then the API endpoint returns onl |
| `offset` | query | number | No | Number of items that should be skipped at the star |
| `limit` | query | number | No | Maximum number of items to return. By default ther |
| `fields` | query | string | No | A comma-separated list of fields which should be p |
| `omit` | query | string | No | A comma-separated list of fields which should be o |
| `unwind` | query | string | No | A comma-separated list of fields which should be u |
| `flatten` | query | string | No | A comma-separated list of fields which should tran |
| `desc` | query | boolean | No | By default, results are returned in the same order |
| `attachment` | query | boolean | No | If `true` or `1` then the response will define the |
| `delimiter` | query | string | No | A delimiter character for CSV files, only used if  |
| `bom` | query | boolean | No | All text responses are encoded in UTF-8 encoding.  |
| `xmlRoot` | query | string | No | Overrides default root element name of `xml` outpu |
| `xmlRow` | query | string | No | Overrides default element name that wraps each pag |
| `skipHeaderRow` | query | boolean | No | If `true` or `1` then header row in the `csv` form |
| `skipHidden` | query | boolean | No | If `true` or `1` then hidden fields are skipped fr |
| `skipEmpty` | query | boolean | No | If `true` or `1` then empty items are skipped from |
| `simplified` | query | boolean | No | If `true` or `1` then, the endpoint applies the
`f |
| `skipFailedPages` | query | boolean | No | If `true` or `1` then, the all the items with erro |

### Example

```bash
curl -X POST \
  -H "Authorization: Bearer $TOKEN" \
  "https://api.apify.com/v2/acts/{actorId}/run-sync-get-dataset-items"
```

---

## GET /v2/acts/{actorId}/run-sync-get-dataset-items

**Run Actor synchronously without input and get dataset items**

Runs a specific Actor and returns its dataset items.
The run must finish in 300<!-- MAX_ACTOR_JOB_SYNC_WAIT_SECS --> seconds
otherwise the API endpoint returns a timeout error.
The Actor is not passed any input.

It allows to send all possible options in parameters from [Get Dataset
Items](#/reference/datasets/item-collection/get-items) API endpoint.

Beware that it might be impossible to maintain an idle HTTP connection for a
long period of time,
due to client timeout or network conditions. Make sure your HTTP client is
configured to have a long enough connection timeout.
If the connection breaks, you will not receive any information about the run
and its status.

To run the Actor asynchronously, use the [Run
Actor](#/reference/actors/run-collection/run-actor) API endpoint instead.


### Parameters

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| `actorId` | path | string | Yes | Actor ID or a tilde-separated owner's username and |
| `timeout` | query | number | No | Optional timeout for the run, in seconds. By defau |
| `memory` | query | number | No | Memory limit for the run, in megabytes. The amount |
| `` | query | string | No |  |
| `` | query | string | No |  |
| `restartOnError` | query | boolean | No | Determines whether the run will be restarted if it |
| `build` | query | string | No | Specifies the Actor build to run. It can be either |
| `webhooks` | query | string | No | Specifies optional webhooks associated with the Ac |
| `format` | query | string | No | Format of the results, possible values are: `json` |
| `clean` | query | boolean | No | If `true` or `1` then the API endpoint returns onl |
| `offset` | query | number | No | Number of items that should be skipped at the star |
| `limit` | query | number | No | Maximum number of items to return. By default ther |
| `fields` | query | string | No | A comma-separated list of fields which should be p |
| `omit` | query | string | No | A comma-separated list of fields which should be o |
| `unwind` | query | string | No | A comma-separated list of fields which should be u |
| `flatten` | query | string | No | A comma-separated list of fields which should tran |
| `desc` | query | boolean | No | By default, results are returned in the same order |
| `attachment` | query | boolean | No | If `true` or `1` then the response will define the |
| `delimiter` | query | string | No | A delimiter character for CSV files, only used if  |
| `bom` | query | boolean | No | All text responses are encoded in UTF-8 encoding.  |
| `xmlRoot` | query | string | No | Overrides default root element name of `xml` outpu |
| `xmlRow` | query | string | No | Overrides default element name that wraps each pag |
| `skipHeaderRow` | query | boolean | No | If `true` or `1` then header row in the `csv` form |
| `skipHidden` | query | boolean | No | If `true` or `1` then hidden fields are skipped fr |
| `skipEmpty` | query | boolean | No | If `true` or `1` then empty items are skipped from |
| `simplified` | query | boolean | No | If `true` or `1` then, the endpoint applies the `f |
| `skipFailedPages` | query | boolean | No | If `true` or `1` then, the all the items with erro |

### Example

```bash
curl -X GET \
  -H "Authorization: Bearer $TOKEN" \
  "https://api.apify.com/v2/acts/{actorId}/run-sync-get-dataset-items"
```

---

## POST /v2/acts/{actorId}/runs/{runId}/resurrect

**Resurrect run**

**[DEPRECATED]** API endpoints related to run of the Actor were moved under
new namespace [`actor-runs`](#/reference/actor-runs).Resurrects a finished
Actor run and returns an object that contains all the details about the
resurrected run.

Only finished runs, i.e. runs with status `FINISHED`, `FAILED`, `ABORTED`
and `TIMED-OUT` can be resurrected.
Run status will be updated to RUNNING and its container will be restarted
with the same storages
(the same behaviour as when the run gets migrated to the new server).

For more information, see the [Actor
docs](https://docs.apify.com/platform/actors/running/runs-and-builds#resurrection-of-finished-run).


### Parameters

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| `actorId` | path | string | Yes | Actor ID or a tilde-separated owner's username and |
| `runId` | path | string | Yes | Run ID. |
| `build` | query | string | No | Specifies the Actor build to run. It can be either |
| `timeout` | query | number | No | Optional timeout for the run, in seconds. By defau |
| `memory` | query | number | No | Memory limit for the run, in megabytes. The amount |
| `restartOnError` | query | boolean | No | Determines whether the resurrected run will be res |

### Example

```bash
curl -X POST \
  -H "Authorization: Bearer $TOKEN" \
  "https://api.apify.com/v2/acts/{actorId}/runs/{runId}/resurrect"
```

---

## GET /v2/acts/{actorId}/runs/last

**Get last run**

This is not a single endpoint, but an entire group of endpoints that lets you to
retrieve and manage the last run of given Actor or any of its default storages.
All the endpoints require an authentication token.

The endpoints accept the same HTTP methods and query parameters as
the respective storage endpoints.
The base path represents the last Actor run object is:

`/v2/acts/{actorId}/runs/last{?token,status}`

Using the `status` query parameter you can ensure to only get a run with a certain status
(e.g. `status=SUCCEEDED`). The output of this endpoint and other query parameters
are the same as in the [Run object](#/reference/actors/run-object) endpoint.

In order to access the default storages of the last Actor run, i.e. log, key-value store, dataset and request queue,
use the following endpoints:

* `/v2/acts/{actorId}/runs/last/log{?token,status}`
* `/v2/acts/{actorId}/runs/last/key-value-store{?token,status}`
* `/v2/acts/{actorId}/runs/last/dataset{?token,status}`
* `/v2/acts/{actorId}/runs/last/request-queue{?token,status}`

These API endpoints have the same usage as the equivalent storage endpoints.
For example,
`/v2/acts/{actorId}/runs/last/key-value-store` has the same HTTP method and parameters as the
[Key-value store object](#/reference/key-value-stores/store-object) endpoint.

Additionally, each of the above API endpoints supports all sub-endpoints
of the original one:

#### Key-value store

* `/v2/acts/{actorId}/runs/last/key-value-store/keys{?token,status}` [Key collection](#/reference/key-value-stores/key-collection)
* `/v2/acts/{actorId}/runs/last/key-value-store/records/{recordKey}{?token,status}` [Record](#/reference/key-value-stores/record)

#### Dataset

* `/v2/acts/{actorId}/runs/last/dataset/items{?token,status}` [Item collection](#/reference/datasets/item-collection)

#### Request queue

* `/v2/acts/{actorId}/runs/last/request-queue/requests{?token,status}` [Request collection](#/reference/request-queues/request-collection)
* `/v2/acts/{actorId}/runs/last/request-queue/requests/{requestId}{?token,status}` [Request collection](#/reference/request-queues/request)
* `/v2/acts/{actorId}/runs/last/request-queue/head{?token,status}` [Queue head](#/reference/request-queues/queue-head)

For example, to download data from a dataset of the last succeeded Actor run in XML format,
send HTTP GET request to the following URL:

```
https://api.apify.com/v2/acts/{actorId}/runs/last/dataset/items?token={yourApiToken}&format=xml&status=SUCCEEDED
```

In order to save new items to the dataset, send HTTP POST request with JSON payload to the same URL.


### Parameters

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| `actorId` | path | string | Yes | Actor ID or a tilde-separated owner's username and |
| `status` | query | string | No | Filter for the run status. |

### Example

```bash
curl -X GET \
  -H "Authorization: Bearer $TOKEN" \
  "https://api.apify.com/v2/acts/{actorId}/runs/last"
```

---

## GET /v2/acts/{actorId}/runs/{runId}

**Get run**

**[DEPRECATED]** API endpoints related to run of the Actor were moved under
new namespace [`actor-runs`](#/reference/actor-runs).

Gets an object that contains all the details about a specific run of an Actor.

By passing the optional `waitForFinish` parameter the API endpoint will
synchronously wait for the run to finish.
This is useful to avoid periodic polling when waiting for Actor run to
complete.

This endpoint does not require the authentication token. Instead, calls are authenticated using a hard-to-guess ID of the run. However,
if you access the endpoint without the token, certain attributes, such as `usageUsd` and `usageTotalUsd`, will be hidden.


### Parameters

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| `actorId` | path | string | Yes | Actor ID or a tilde-separated owner's username and |
| `runId` | path | string | Yes | Run ID. |
| `waitForFinish` | query | number | No | The maximum number of seconds the server waits for |

### Example

```bash
curl -X GET \
  -H "Authorization: Bearer $TOKEN" \
  "https://api.apify.com/v2/acts/{actorId}/runs/{runId}"
```

---

## POST /v2/acts/{actorId}/runs/{runId}/abort

**Abort run**

**[DEPRECATED]** API endpoints related to run of the Actor were moved under
new namespace [`actor-runs`](#/reference/actor-runs). Aborts an Actor run and
returns an object that contains all the details about the run.

Only runs that are starting or running are aborted. For runs with status
`FINISHED`, `FAILED`, `ABORTING` and `TIMED-OUT` this call does nothing.


### Parameters

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| `actorId` | path | string | Yes | Actor ID or a tilde-separated owner's username and |
| `runId` | path | string | Yes | Run ID. |
| `gracefully` | query | boolean | No | If true passed, the Actor run will abort gracefull |

### Example

```bash
curl -X POST \
  -H "Authorization: Bearer $TOKEN" \
  "https://api.apify.com/v2/acts/{actorId}/runs/{runId}/abort"
```

---

## POST /v2/acts/{actorId}/runs/{runId}/metamorph

**Metamorph run**

**[DEPRECATED]** API endpoints related to run of the Actor were moved under
new namespace [`actor-runs`](#/reference/actor-runs).Transforms an Actor run
into a run of another Actor with a new input.

This is useful if you want to use another Actor to finish the work
of your current Actor run, without the need to create a completely new run
and waiting for its finish.
For the users of your Actors, the metamorph operation is transparent, they
will just see your Actor got the work done.

There is a limit on how many times you can metamorph a single run. You can
check the limit in [the Actor runtime limits](https://docs.apify.com/platform/limits#actor-limits).

Internally, the system stops the Docker container corresponding to the Actor
run and starts a new container using a different Docker image.
All the default storages are preserved and the new input is stored under the
`INPUT-METAMORPH-1` key in the same default key-value store.

For more information, see the [Actor
docs](https://docs.apify.com/platform/actors/development/programming-interface/metamorph).


### Parameters

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| `actorId` | path | string | Yes | Actor ID or a tilde-separated owner's username and |
| `runId` | path | string | Yes | Actor run ID. |
| `targetActorId` | query | string | Yes | ID of a target Actor that the run should be transf |
| `build` | query | string | No | Optional build of the target Actor.

It can be eit |

### Example

```bash
curl -X POST \
  -H "Authorization: Bearer $TOKEN" \
  "https://api.apify.com/v2/acts/{actorId}/runs/{runId}/metamorph"
```

---
