---
created: 2026-01-09
tags: [type/api-reference, api/actor-builds]
api_name: Apify API
category: Actor builds
endpoint_count: 6
---

# Apify API - Actor Builds

[[README|Back to Overview]]

---

## GET /v2/actor-builds

**Get user builds list**

Gets a list of all builds for a user. The response is a JSON array of
objects, where each object contains basic information about a single build.

The endpoint supports pagination using the `limit` and `offset` parameters
and it will not return more than 1000 records.

By default, the records are sorted by the `startedAt` field in ascending
order. Therefore, you can use pagination to incrementally fetch all builds while
new ones are still being started. To sort the records in descending order, use
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
  "https://api.apify.com/v2/actor-builds"
```

---

## GET /v2/actor-builds/{buildId}

**Get build**

Gets an object that contains all the details about a specific build of an
Actor.

By passing the optional `waitForFinish` parameter the API endpoint will
synchronously wait for the build to finish. This is useful to avoid periodic
polling when waiting for an Actor build to finish.

This endpoint does not require the authentication token. Instead, calls are authenticated using a hard-to-guess ID of the build. However,
if you access the endpoint without the token, certain attributes, such as `usageUsd` and `usageTotalUsd`, will be hidden.


### Parameters

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| `buildId` | path | string | Yes | ID of the build you want to get, found in the buil |
| `waitForFinish` | query | number | No | The maximum number of seconds the server waits for |

### Example

```bash
curl -X GET \
  -H "Authorization: Bearer $TOKEN" \
  "https://api.apify.com/v2/actor-builds/{buildId}"
```

---

## DELETE /v2/actor-builds/{buildId}

**Delete build**

Delete the build. The build that is the current default build for the Actor
cannot be deleted.

Only users with build permissions for the Actor can delete builds.


### Parameters

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| `buildId` | path | string | Yes | ID of the build you want to get, found in the buil |

### Example

```bash
curl -X DELETE \
  -H "Authorization: Bearer $TOKEN" \
  "https://api.apify.com/v2/actor-builds/{buildId}"
```

---

## POST /v2/actor-builds/{buildId}/abort

**Abort build**

Aborts an Actor build and returns an object that contains all the details
about the build.

Only builds that are starting or running are aborted. For builds with status
`FINISHED`, `FAILED`, `ABORTING` and `TIMED-OUT` this call does nothing.


### Parameters

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| `buildId` | path | string | Yes | Build ID. |

### Example

```bash
curl -X POST \
  -H "Authorization: Bearer $TOKEN" \
  "https://api.apify.com/v2/actor-builds/{buildId}/abort"
```

---

## GET /v2/actor-builds/{buildId}/log

**Get log**

Check out [Logs](#/reference/logs) for full reference.

### Parameters

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| `buildId` | path | string | Yes | ID of the Actor build. |
| `stream` | query | boolean | Yes | If `true` or `1` then the logs will be streamed as |
| `download` | query | boolean | Yes | If `true` or `1` then the web browser will downloa |

### Example

```bash
curl -X GET \
  -H "Authorization: Bearer $TOKEN" \
  "https://api.apify.com/v2/actor-builds/{buildId}/log"
```

---

## GET /v2/actor-builds/{buildId}/openapi.json

**Get OpenAPI definition**

Get the OpenAPI definition for Actor builds. Two similar endpoints are available:

- [First endpoint](/api/v2/act-openapi-json-get): Requires both `actorId` and `buildId`. Use `default` as the `buildId` to get the OpenAPI schema for the default Actor build.
- [Second endpoint](/api/v2/actor-build-openapi-json-get): Requires only `buildId`.

Get the OpenAPI definition for a specific Actor build.
Authentication is based on the build's unique ID. No authentication token is required.

:::note

You can also use the [`/api/v2/act-openapi-json-get`](/api/v2/act-openapi-json-get) endpoint to get the OpenAPI definition for a build.

:::


### Parameters

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| `buildId` | path | string | Yes | ID of the build you want to get, found in the buil |

### Example

```bash
curl -X GET \
  -H "Authorization: Bearer $TOKEN" \
  "https://api.apify.com/v2/actor-builds/{buildId}/openapi.json"
```

---
