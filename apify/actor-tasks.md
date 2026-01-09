---
created: 2026-01-09
tags: [type/api-reference, api/actor-tasks]
api_name: Apify API
category: Actor tasks
endpoint_count: 15
---

# Apify API - Actor Tasks

[[README|Back to Overview]]

---

## GET /v2/actor-tasks

**Get list of tasks**

Gets the complete list of tasks that a user has created or used.

The response is a list of objects in which each object contains essential
information about a single task.

The endpoint supports pagination using the `limit` and `offset` parameters,
and it does not return more than a 1000 records.

By default, the records are sorted by the `createdAt` field in ascending
order; therefore you can use pagination to incrementally fetch all tasks while new
ones are still being created. To sort the records in descending order, use
the `desc=1` parameter.


### Parameters

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| `offset` | query | number | No | Number of records that should be skipped at the st |
| `limit` | query | number | No | Maximum number of records to return. The default v |
| `desc` | query | boolean | No | If `true` or `1` then the objects are sorted by th |

### Example

```bash
curl -X GET \
  -H "Authorization: Bearer $TOKEN" \
  "https://api.apify.com/v2/actor-tasks"
```

---

## POST /v2/actor-tasks

**Create task**

Create a new task with settings specified by the object passed as JSON in
the POST payload.

The response is the full task object as returned by the
[Get task](#/reference/tasks/task-object/get-task) endpoint.

The request needs to specify the `Content-Type: application/json` HTTP header!

When providing your API authentication token, we recommend using the
request's `Authorization` header, rather than the URL. ([More
info](#/introduction/authentication)).


### Example

```bash
curl -X POST \
  -H "Authorization: Bearer $TOKEN" \
  "https://api.apify.com/v2/actor-tasks"
```

---

## GET /v2/actor-tasks/{actorTaskId}

**Get task**

Get an object that contains all the details about a task.

### Parameters

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| `actorTaskId` | path | string | Yes | Task ID or a tilde-separated owner's username and  |

### Example

```bash
curl -X GET \
  -H "Authorization: Bearer $TOKEN" \
  "https://api.apify.com/v2/actor-tasks/{actorTaskId}"
```

---

## PUT /v2/actor-tasks/{actorTaskId}

**Update task**

Update settings of a task using values specified by an object passed as JSON
in the POST payload.

If the object does not define a specific property, its value is not updated.

The response is the full task object as returned by the
[Get task](#/reference/tasks/task-object/get-task) endpoint.

The request needs to specify the `Content-Type: application/json` HTTP
header!

When providing your API authentication token, we recommend using the
request's `Authorization` header, rather than the URL. ([More
info](#/introduction/authentication)).


### Parameters

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| `actorTaskId` | path | string | Yes | Task ID or a tilde-separated owner's username and  |

### Example

```bash
curl -X PUT \
  -H "Authorization: Bearer $TOKEN" \
  "https://api.apify.com/v2/actor-tasks/{actorTaskId}"
```

---

## DELETE /v2/actor-tasks/{actorTaskId}

**Delete task**

Delete the task specified through the `actorTaskId` parameter.

### Parameters

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| `actorTaskId` | path | string | Yes | Task ID or a tilde-separated owner's username and  |

### Example

```bash
curl -X DELETE \
  -H "Authorization: Bearer $TOKEN" \
  "https://api.apify.com/v2/actor-tasks/{actorTaskId}"
```

---

## GET /v2/actor-tasks/{actorTaskId}/input

**Get task input**

Returns the input of a given task.

### Parameters

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| `actorTaskId` | path | string | Yes | Task ID or a tilde-separated owner's username and  |

### Example

```bash
curl -X GET \
  -H "Authorization: Bearer $TOKEN" \
  "https://api.apify.com/v2/actor-tasks/{actorTaskId}/input"
```

---

## PUT /v2/actor-tasks/{actorTaskId}/input

**Update task input**

Updates the input of a task using values specified by an object passed as
JSON in the PUT payload.

If the object does not define a specific property, its value is not updated.

The response is the full task input as returned by the
[Get task input](#/reference/tasks/task-input-object/get-task-input) endpoint.

The request needs to specify the `Content-Type: application/json` HTTP
header!

When providing your API authentication token, we recommend using the
request's `Authorization` header, rather than the URL. ([More
info](#/introduction/authentication)).


### Parameters

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| `actorTaskId` | path | string | Yes | Task ID or a tilde-separated owner's username and  |

### Example

```bash
curl -X PUT \
  -H "Authorization: Bearer $TOKEN" \
  "https://api.apify.com/v2/actor-tasks/{actorTaskId}/input"
```

---

## GET /v2/actor-tasks/{actorTaskId}/webhooks

**Get list of webhooks**

Gets the list of webhooks of a specific Actor task. The response is a JSON
with the list of objects, where each object contains basic information about a single webhook.

The endpoint supports pagination using the `limit` and `offset` parameters
and it will not return more than 1000 records.

By default, the records are sorted by the `createdAt` field in ascending
order, to sort the records in descending order, use the `desc=1` parameter.


### Parameters

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| `actorTaskId` | path | string | Yes | Task ID or a tilde-separated owner's username and  |
| `offset` | query | number | No | Number of array elements that should be skipped at |
| `limit` | query | number | No | Maximum number of array elements to return. The de |
| `desc` | query | boolean | No | If `true` or `1` then the objects are sorted by th |

### Example

```bash
curl -X GET \
  -H "Authorization: Bearer $TOKEN" \
  "https://api.apify.com/v2/actor-tasks/{actorTaskId}/webhooks"
```

---

## GET /v2/actor-tasks/{actorTaskId}/runs

**Get list of task runs**

Get a list of runs of a specific task. The response is a list of objects,
where each object contains essential information about a single task run.

The endpoint supports pagination using the `limit` and `offset` parameters,
and it does not return more than a 1000 array elements.

By default, the records are sorted by the `startedAt` field in ascending
order; therefore you can use pagination to incrementally fetch all records while
new ones are still being created. To sort the records in descending order, use
the `desc=1` parameter. You can also filter runs by status ([available
statuses](https://docs.apify.com/platform/actors/running/runs-and-builds#lifecycle)).


### Parameters

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| `actorTaskId` | path | string | Yes | Task ID or a tilde-separated owner's username and  |
| `offset` | query | number | No | Number of array elements that should be skipped at |
| `limit` | query | number | No | Maximum number of array elements to return. The de |
| `desc` | query | boolean | No | If `true` or `1` then the objects are sorted by th |
| `status` | query | string | No | Single status or comma-separated list of statuses, |

### Example

```bash
curl -X GET \
  -H "Authorization: Bearer $TOKEN" \
  "https://api.apify.com/v2/actor-tasks/{actorTaskId}/runs"
```

---

## POST /v2/actor-tasks/{actorTaskId}/runs

**Run task**

Runs an Actor task and immediately returns without waiting for the run to
finish.

Optionally, you can override the Actor input configuration by passing a JSON
object as the POST payload and setting the `Content-Type: application/json` HTTP header.

Note that if the object in the POST payload does not define a particular
input property, the Actor run uses the default value defined by the task (or Actor's input
schema if not defined by the task).

The response is the Actor Run object as returned by the [Get
run](#/reference/actor-runs/run-object-and-its-storages/get-run) endpoint.

If you want to wait for the run to finish and receive the actual output of
the Actor run as the response, use one of the [Run task
synchronously](#/reference/actor-tasks/run-task-synchronously) API endpoints
instead.

To fetch the Actor run results that are typically stored in the default
dataset, you'll need to pass the ID received in the `defaultDatasetId` field
received in the response JSON to the
[Get dataset items](#/reference/datasets/item-collection/get-items) API endpoint.


### Parameters

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| `actorTaskId` | path | string | Yes | Task ID or a tilde-separated owner's username and  |
| `timeout` | query | number | No | Optional timeout for the run, in seconds. By defau |
| `memory` | query | number | No | Memory limit for the run, in megabytes. The amount |
| `` | query | string | No |  |
| `` | query | string | No |  |
| `restartOnError` | query | boolean | No | Determines whether the run will be restarted if it |
| `build` | query | string | No | Specifies the Actor build to run. It can be either |
| `waitForFinish` | query | number | No | The maximum number of seconds the server waits for |
| `webhooks` | query | string | No | Specifies optional webhooks associated with the Ac |

### Example

```bash
curl -X POST \
  -H "Authorization: Bearer $TOKEN" \
  "https://api.apify.com/v2/actor-tasks/{actorTaskId}/runs"
```

---

## GET /v2/actor-tasks/{actorTaskId}/run-sync

**Run task synchronously**

Run a specific task and return its output.

The run must finish in 300<!-- MAX_ACTOR_JOB_SYNC_WAIT_SECS --> seconds
otherwise the HTTP request fails with a timeout error (this won't abort
the run itself).

Beware that it might be impossible to maintain an idle HTTP connection for
an extended period, due to client timeout or network conditions. Make sure your HTTP client is
configured to have a long enough connection timeout.

If the connection breaks, you will not receive any information about the run
and its status.

To run the Task asynchronously, use the
[Run task asynchronously](#/reference/actor-tasks/run-collection/run-task)
endpoint instead.


### Parameters

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| `actorTaskId` | path | string | Yes | Task ID or a tilde-separated owner's username and  |
| `timeout` | query | number | No | Optional timeout for the run, in seconds. By defau |
| `memory` | query | number | No | Memory limit for the run, in megabytes. The amount |
| `` | query | string | No |  |
| `build` | query | string | No | Specifies the Actor build to run. It can be either |
| `outputRecordKey` | query | string | No | Key of the record from run's default key-value sto |
| `webhooks` | query | string | No | Specifies optional webhooks associated with the Ac |

### Example

```bash
curl -X GET \
  -H "Authorization: Bearer $TOKEN" \
  "https://api.apify.com/v2/actor-tasks/{actorTaskId}/run-sync"
```

---

## POST /v2/actor-tasks/{actorTaskId}/run-sync

**Run task synchronously**

Runs an Actor task and synchronously returns its output.

The run must finish in 300<!-- MAX_ACTOR_JOB_SYNC_WAIT_SECS --> seconds
otherwise the HTTP request fails with a timeout error (this won't abort
the run itself).

Optionally, you can override the Actor input configuration by passing a JSON
object as the POST payload and setting the `Content-Type: application/json` HTTP header.

Note that if the object in the POST payload does not define a particular
input property, the Actor run uses the default value defined by the task (or Actor's input
schema if not defined by the task).

Beware that it might be impossible to maintain an idle HTTP connection for
an extended period, due to client timeout or network conditions. Make sure your HTTP client is
configured to have a long enough connection timeout.

If the connection breaks, you will not receive any information about the run
and its status.

Input fields from Actor task configuration can be overloaded with values
passed as the POST payload.

Just make sure to specify `Content-Type` header to be `application/json` and
input to be an object.

To run the task asynchronously, use the [Run
task](#/reference/actor-tasks/run-collection/run-task) API endpoint instead.


### Parameters

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| `actorTaskId` | path | string | Yes | Task ID or a tilde-separated owner's username and  |
| `timeout` | query | number | No | Optional timeout for the run, in seconds. By defau |
| `memory` | query | number | No | Memory limit for the run, in megabytes. The amount |
| `` | query | string | No |  |
| `` | query | string | No |  |
| `restartOnError` | query | boolean | No | Determines whether the run will be restarted if it |
| `build` | query | string | No | Specifies the Actor build to run. It can be either |
| `outputRecordKey` | query | string | No | Key of the record from run's default key-value sto |
| `webhooks` | query | string | No | Specifies optional webhooks associated with the Ac |

### Example

```bash
curl -X POST \
  -H "Authorization: Bearer $TOKEN" \
  "https://api.apify.com/v2/actor-tasks/{actorTaskId}/run-sync"
```

---

## GET /v2/actor-tasks/{actorTaskId}/run-sync-get-dataset-items

**Run task synchronously and get dataset items**

Run a specific task and return its dataset items.

The run must finish in 300<!-- MAX_ACTOR_JOB_SYNC_WAIT_SECS --> seconds
otherwise the HTTP request fails with a timeout error (this won't abort
the run itself).

You can send all the same options in parameters as the [Get Dataset
Items](#/reference/datasets/item-collection/get-items) API endpoint.

Beware that it might be impossible to maintain an idle HTTP connection for
an extended period, due to client timeout or network conditions. Make sure your HTTP client is
configured to have a long enough connection timeout.

If the connection breaks, you will not receive any information about the run
and its status.

To run the Task asynchronously, use the [Run task
asynchronously](#/reference/actor-tasks/run-collection/run-task) endpoint
instead.


### Parameters

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| `actorTaskId` | path | string | Yes | Task ID or a tilde-separated owner's username and  |
| `timeout` | query | number | No | Optional timeout for the run, in seconds. By defau |
| `memory` | query | number | No | Memory limit for the run, in megabytes. The amount |
| `` | query | string | No |  |
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
curl -X GET \
  -H "Authorization: Bearer $TOKEN" \
  "https://api.apify.com/v2/actor-tasks/{actorTaskId}/run-sync-get-dataset-items"
```

---

## POST /v2/actor-tasks/{actorTaskId}/run-sync-get-dataset-items

**Run task synchronously and get dataset items**

Runs an Actor task and synchronously returns its dataset items.

The run must finish in 300<!-- MAX_ACTOR_JOB_SYNC_WAIT_SECS --> seconds
otherwise the HTTP request fails with a timeout error (this won't abort
the run itself).

Optionally, you can override the Actor input configuration by passing a JSON
object as the POST payload and setting the `Content-Type: application/json` HTTP header.

Note that if the object in the POST payload does not define a particular
input property, the Actor run uses the default value defined by the task (or the Actor's
input schema if not defined by the task).

You can send all the same options in parameters as the [Get Dataset
Items](#/reference/datasets/item-collection/get-items) API endpoint.

Beware that it might be impossible to maintain an idle HTTP connection for
an extended period, due to client timeout or network conditions. Make sure your HTTP client is
configured to have a long enough connection timeout.

If the connection breaks, you will not receive any information about the run
and its status.

Input fields from Actor task configuration can be overloaded with values
passed as the POST payload.

Just make sure to specify the `Content-Type` header as `application/json`
and that the input is an object.

To run the task asynchronously, use the [Run
task](#/reference/actor-tasks/run-collection/run-task) API endpoint instead.


### Parameters

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| `actorTaskId` | path | string | Yes | Task ID or a tilde-separated owner's username and  |
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
  "https://api.apify.com/v2/actor-tasks/{actorTaskId}/run-sync-get-dataset-items"
```

---

## GET /v2/actor-tasks/{actorTaskId}/runs/last

**Get last run**

This is not a single endpoint, but an entire group of endpoints that lets you to
retrieve and manage the last run of given actor task or any of its default storages.
All the endpoints require an authentication token.

The endpoints accept the same HTTP methods and query parameters as
the respective storage endpoints.
The base path represents the last actor task run object is:

`/v2/actor-tasks/{actorTaskId}/runs/last{?token,status}`

Using the `status` query parameter you can ensure to only get a run with a certain status
(e.g. `status=SUCCEEDED`). The output of this endpoint and other query parameters
are the same as in the [Run object](/api/v2/actor-run-get) endpoint.

In order to access the default storages of the last actor task run, i.e. log, key-value store, dataset and request queue,
use the following endpoints:

* `/v2/actor-tasks/{actorTaskId}/runs/last/log{?token,status}`
* `/v2/actor-tasks/{actorTaskId}/runs/last/key-value-store{?token,status}`
* `/v2/actor-tasks/{actorTaskId}/runs/last/dataset{?token,status}`
* `/v2/actor-tasks/{actorTaskId}/runs/last/request-queue{?token,status}`

These API endpoints have the same usage as the equivalent storage endpoints.
For example,
`/v2/actor-tasks/{actorTaskId}/runs/last/key-value-store` has the same HTTP method and parameters as the
[Key-value store object](/api/v2/storage-key-value-stores) endpoint.

Additionally, each of the above API endpoints supports all sub-endpoints
of the original one:

##### Storage endpoints

* [Dataset - introduction](/api/v2/storage-datasets)

* [Key-value store - introduction](/api/v2/storage-key-value-stores)

* [Request queue - introduction](/api/v2/storage-request-queues)

For example, to download data from a dataset of the last succeeded actor task run in XML format,
send HTTP GET request to the following URL:

```
https://api.apify.com/v2/actor-tasks/{actorTaskId}/runs/last/dataset/items?token={yourApiToken}&format=xml&status=SUCCEEDED
```

In order to save new items to the dataset, send HTTP POST request with JSON payload to the same URL.


### Parameters

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| `actorTaskId` | path | string | Yes | Task ID or a tilde-separated owner's username and  |
| `status` | query | string | No | Filter for the run status. |

### Example

```bash
curl -X GET \
  -H "Authorization: Bearer $TOKEN" \
  "https://api.apify.com/v2/actor-tasks/{actorTaskId}/runs/last"
```

---
