---
created: 2026-01-09
tags: [type/api-reference, api/webhooks/webhooks]
api_name: Apify API
category: Webhooks/Webhooks
endpoint_count: 7
---

# Apify API - Webhooks/Webhooks

[[README|Back to Overview]]

---

## GET /v2/webhooks

**Get list of webhooks**

Gets the list of webhooks that the user created.

The endpoint supports pagination using the `limit` and `offset` parameters
and it will not return more than 1000 records.
By default, the records are sorted by the `createdAt` field in ascending
order. To sort the records in descending order, use the `desc=1`
parameter.


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
  "https://api.apify.com/v2/webhooks"
```

---

## POST /v2/webhooks

**Create webhook**

Creates a new webhook with settings provided by the webhook object passed as
JSON in the payload.
The response is the created webhook object.

To avoid duplicating a webhook, use the `idempotencyKey` parameter in the
request body.
Multiple calls to create a webhook with the same `idempotencyKey` will only
create the webhook with the first call and return the existing webhook on
subsequent calls.
Idempotency keys must be unique, so use a UUID or another random string with
enough entropy.

To assign the new webhook to an Actor or task, the request body must contain
`requestUrl`, `eventTypes`, and `condition` properties.

* `requestUrl` is the webhook's target URL, to which data is sent as a POST
request with a JSON payload.
* `eventTypes` is a list of events that will trigger the webhook, e.g. when
the Actor run succeeds.
* `condition` should be an object containing the ID of the Actor or task to
which the webhook will be assigned.
* `payloadTemplate` is a JSON-like string, whose syntax is extended with the
use of variables.
* `headersTemplate` is a JSON-like string, whose syntax is extended with the
use of variables. Following values will be re-written to defaults: "host",
"Content-Type", "X-Apify-Webhook", "X-Apify-Webhook-Dispatch-Id",
"X-Apify-Request-Origin"
* `description` is an optional string.
* `shouldInterpolateStrings` is a boolean indicating whether to interpolate
variables contained inside strings in the `payloadTemplate`

```
    "isAdHoc" : false,
    "requestUrl" : "https://example.com",
    "eventTypes" : [
        "ACTOR.RUN.SUCCEEDED",
        "ACTOR.RUN.ABORTED"
    ],
    "condition" : {
        "actorId": "janedoe~my-actor",
        "actorTaskId" : "W9bs9JE9v7wprjAnJ"
    },
    "payloadTemplate": "",
    "headersTemplate": "",
    "description": "my awesome webhook",
    "shouldInterpolateStrings": false,
```

**Important**: The request must specify the `Content-Type: application/json`
HTTP header.


### Parameters

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| `limit` | query | string | No |  |
| `offset` | query | string | No |  |
| `desc` | query | string | No |  |

### Example

```bash
curl -X POST \
  -H "Authorization: Bearer $TOKEN" \
  "https://api.apify.com/v2/webhooks"
```

---

## GET /v2/webhooks/{webhookId}

**Get webhook**

Gets webhook object with all details.

### Parameters

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| `webhookId` | path | string | Yes | Webhook ID. |

### Example

```bash
curl -X GET \
  -H "Authorization: Bearer $TOKEN" \
  "https://api.apify.com/v2/webhooks/{webhookId}"
```

---

## PUT /v2/webhooks/{webhookId}

**Update webhook**

Updates a webhook using values specified by a webhook object passed as JSON
in the POST payload.
If the object does not define a specific property, its value will not be
updated.

The response is the full webhook object as returned by the
[Get webhook](#/reference/webhooks/webhook-object/get-webhook) endpoint.

The request needs to specify the `Content-Type: application/json` HTTP
header!

When providing your API authentication token, we recommend using the
request's `Authorization` header, rather than the URL. ([More
info](#/introduction/authentication)).


### Parameters

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| `webhookId` | path | string | Yes | Webhook ID. |

### Example

```bash
curl -X PUT \
  -H "Authorization: Bearer $TOKEN" \
  "https://api.apify.com/v2/webhooks/{webhookId}"
```

---

## DELETE /v2/webhooks/{webhookId}

**Delete webhook**

Deletes a webhook.

### Parameters

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| `webhookId` | path | string | Yes | Webhook ID. |

### Example

```bash
curl -X DELETE \
  -H "Authorization: Bearer $TOKEN" \
  "https://api.apify.com/v2/webhooks/{webhookId}"
```

---

## POST /v2/webhooks/{webhookId}/test

**Test webhook**

Tests a webhook. Creates a webhook dispatch with a dummy payload.

### Parameters

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| `webhookId` | path | string | Yes | Webhook ID. |

### Example

```bash
curl -X POST \
  -H "Authorization: Bearer $TOKEN" \
  "https://api.apify.com/v2/webhooks/{webhookId}/test"
```

---

## GET /v2/webhooks/{webhookId}/dispatches

**Get collection**

Gets a given webhook's list of dispatches.

### Parameters

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| `webhookId` | path | string | Yes | ID number of the webhook. |

### Example

```bash
curl -X GET \
  -H "Authorization: Bearer $TOKEN" \
  "https://api.apify.com/v2/webhooks/{webhookId}/dispatches"
```

---
