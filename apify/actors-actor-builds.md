---
created: 2026-01-09
tags: [type/api-reference, api/actors/actor-builds]
api_name: Apify API
category: Actors/Actor builds
endpoint_count: 6
---

# Apify API - Actors/Actor Builds

[[README|Back to Overview]]

---

## GET /v2/acts/{actorId}/builds

**Get list of builds**

Gets the list of builds of a specific Actor. The response is a JSON with the
list of objects, where each object contains basic information about a single build.

The endpoint supports pagination using the `limit` and `offset` parameters
and it will not return more than 1000 records.

By default, the records are sorted by the `startedAt` field in ascending order,
therefore you can use pagination to incrementally fetch all builds while new
ones are still being started. To sort the records in descending order, use
the `desc=1` parameter.


### Parameters

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| `actorId` | path | string | Yes | Actor ID or a tilde-separated owner's username and |
| `offset` | query | number | No | Number of records that should be skipped at the st |
| `limit` | query | number | No | Maximum number of records to return. The default v |
| `desc` | query | boolean | No | If `true` or `1` then the objects are sorted by th |

### Example

```bash
curl -X GET \
  -H "Authorization: Bearer $TOKEN" \
  "https://api.apify.com/v2/acts/{actorId}/builds"
```

---

## POST /v2/acts/{actorId}/builds

**Build Actor**

Builds an Actor.
The response is the build object as returned by the
[Get build](#/reference/actors/build-object/get-build) endpoint.


### Parameters

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| `actorId` | path | string | Yes | Actor ID or a tilde-separated owner's username and |
| `version` | query | string | Yes | Actor version number to be built. |
| `useCache` | query | boolean | No | If `true` or `1`, the system will use a cache to s |
| `betaPackages` | query | boolean | No | If `true` or `1` then the Actor is built with beta |
| `tag` | query | string | No | Tag to be applied to the build on success. By defa |
| `waitForFinish` | query | number | No | The maximum number of seconds the server waits for |

### Example

```bash
curl -X POST \
  -H "Authorization: Bearer $TOKEN" \
  "https://api.apify.com/v2/acts/{actorId}/builds"
```

---

## GET /v2/acts/{actorId}/builds/default

**Get default build**

Get the default build for an Actor.

Use the optional `waitForFinish` parameter to synchronously wait for the build to finish.
This avoids the need for periodic polling when waiting for the build to complete.

This endpoint does not require an authentication token. Instead, calls are authenticated using the Actor's unique ID.
However, if you access the endpoint without a token, certain attributes (e.g., `usageUsd` and `usageTotalUsd`) will be hidden.


### Parameters

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| `actorId` | path | string | Yes | Actor ID or a tilde-separated owner's username and |
| `waitForFinish` | query | number | No | The maximum number of seconds the server waits for |

### Example

```bash
curl -X GET \
  -H "Authorization: Bearer $TOKEN" \
  "https://api.apify.com/v2/acts/{actorId}/builds/default"
```

---

## GET /v2/acts/{actorId}/builds/{buildId}/openapi.json

**Get OpenAPI definition**


Get the OpenAPI definition for Actor builds. Two similar endpoints are available:

- [First endpoint](/api/v2/act-openapi-json-get): Requires both `actorId` and `buildId`. Use `default` as the `buildId` to get the OpenAPI schema for the default Actor build.
- [Second endpoint](/api/v2/actor-build-openapi-json-get): Requires only `buildId`.

Get the OpenAPI definition for a specific Actor build.

To fetch the default Actor build, simply pass `default` as the `buildId`.
Authentication is based on the build's unique ID. No authentication token is required.

:::note

You can also use the [`/api/v2/actor-build-openapi-json-get`](/api/v2/actor-build-openapi-json-get) endpoint to get the OpenAPI definition for a build.

:::


### Parameters

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| `actorId` | path | string | Yes | Actor ID or a tilde-separated owner's username and |
| `buildId` | path | string | Yes | ID of the build you want to get, found in the buil |

### Example

```bash
curl -X GET \
  -H "Authorization: Bearer $TOKEN" \
  "https://api.apify.com/v2/acts/{actorId}/builds/{buildId}/openapi.json"
```

---

## GET /v2/acts/{actorId}/builds/{buildId}

**Get build**

By passing the optional `waitForFinish` parameter the API endpoint will
synchronously wait for the build to finish.
This is useful to avoid periodic polling when waiting for an Actor build to
finish.

This endpoint does not require the authentication token. Instead, calls are authenticated using a hard-to-guess ID of the build. However,
if you access the endpoint without the token, certain attributes, such as `usageUsd` and `usageTotalUsd`, will be hidden.


### Parameters

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| `actorId` | path | string | Yes | Actor ID or a tilde-separated owner's username and |
| `buildId` | path | string | Yes | ID of the build you want to get, found in the buil |
| `waitForFinish` | query | number | No | The maximum number of seconds the server waits for |

### Example

```bash
curl -X GET \
  -H "Authorization: Bearer $TOKEN" \
  "https://api.apify.com/v2/acts/{actorId}/builds/{buildId}"
```

---

## POST /v2/acts/{actorId}/builds/{buildId}/abort

**Abort build**

**[DEPRECATED]** API endpoints related to build of the Actor were moved
under new namespace [`actor-builds`](#/reference/actor-builds). Aborts an
Actor build and returns an object that contains all the details about the
build.

Only builds that are starting or running are aborted. For builds with status
`FINISHED`, `FAILED`, `ABORTING` and `TIMED-OUT` this call does nothing.


### Parameters

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| `actorId` | path | string | Yes | Actor ID or a tilde-separated owner's username and |
| `buildId` | path | string | Yes | Build ID. |

### Example

```bash
curl -X POST \
  -H "Authorization: Bearer $TOKEN" \
  "https://api.apify.com/v2/acts/{actorId}/builds/{buildId}/abort"
```

---
