---
created: 2026-01-09
tags: [type/api-reference, api/actors]
api_name: Apify API
category: Actors
endpoint_count: 5
---

# Apify API - Actors

[[README|Back to Overview]]

---

## GET /v2/acts

**Get list of Actors**

Gets the list of all Actors that the user created or used. The response is a
list of objects, where each object contains a basic information about a single Actor.

To only get Actors created by the user, add the `my=1` query parameter.

The endpoint supports pagination using the `limit` and `offset` parameters
and it will not return more than 1000 records.

By default, the records are sorted by the `createdAt` field in ascending
order, therefore you can use pagination to incrementally fetch all Actors while new
ones are still being created. To sort the records in descending order, use the `desc=1` parameter.

You can also sort by your last run by using the `sortBy=stats.lastRunStartedAt` query parameter.
In this case, descending order means the most recently run Actor appears first.


### Parameters

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| `my` | query | boolean | No | If `true` or `1` then the returned list only conta |
| `offset` | query | number | No | Number of records that should be skipped at the st |
| `limit` | query | number | No | Maximum number of records to return. The default v |
| `desc` | query | boolean | No | If `true` or `1` then the objects are sorted by th |
| `sortBy` | query | string | No | Field to sort the records by. The default is `crea |

### Example

```bash
curl -X GET \
  -H "Authorization: Bearer $TOKEN" \
  "https://api.apify.com/v2/acts"
```

---

## POST /v2/acts

**Create Actor**

Creates a new Actor with settings specified in an Actor object passed as
JSON in the POST payload.
The response is the full Actor object as returned by the
[Get Actor](#/reference/actors/actor-object/get-actor) endpoint.

The HTTP request must have the `Content-Type: application/json` HTTP header!

The Actor needs to define at least one version of the source code.
For more information, see [Version object](#/reference/actors/version-object).

If you want to make your Actor
[public](https://docs.apify.com/platform/actors/publishing) using `isPublic:
true`, you will need to provide the Actor's `title` and the `categories`
under which that Actor will be classified in Apify Store. For this, it's
best to use the [constants from our `apify-shared-js`
package](https://github.com/apify/apify-shared-js/blob/2d43ebc41ece9ad31cd6525bd523fb86939bf860/packages/consts/src/consts.ts#L452-L471).


### Example

```bash
curl -X POST \
  -H "Authorization: Bearer $TOKEN" \
  "https://api.apify.com/v2/acts"
```

---

## GET /v2/acts/{actorId}

**Get Actor**

Gets an object that contains all the details about a specific Actor.

### Parameters

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| `actorId` | path | string | Yes | Actor ID or a tilde-separated owner's username and |

### Example

```bash
curl -X GET \
  -H "Authorization: Bearer $TOKEN" \
  "https://api.apify.com/v2/acts/{actorId}"
```

---

## PUT /v2/acts/{actorId}

**Update Actor**

Updates settings of an Actor using values specified by an Actor object
passed as JSON in the POST payload.
If the object does not define a specific property, its value will not be
updated.

The response is the full Actor object as returned by the
[Get Actor](#/reference/actors/actor-object/get-actor) endpoint.

The request needs to specify the `Content-Type: application/json` HTTP header!

When providing your API authentication token, we recommend using the
request's `Authorization` header, rather than the URL. ([More
info](#/introduction/authentication)).

If you want to make your Actor
[public](https://docs.apify.com/platform/actors/publishing) using `isPublic:
true`, you will need to provide the Actor's `title` and the `categories`
under which that Actor will be classified in Apify Store. For this, it's
best to use the [constants from our `apify-shared-js`
package](https://github.com/apify/apify-shared-js/blob/2d43ebc41ece9ad31cd6525bd523fb86939bf860/packages/consts/src/consts.ts#L452-L471).


### Parameters

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| `actorId` | path | string | Yes | Actor ID or a tilde-separated owner's username and |

### Example

```bash
curl -X PUT \
  -H "Authorization: Bearer $TOKEN" \
  "https://api.apify.com/v2/acts/{actorId}"
```

---

## DELETE /v2/acts/{actorId}

**Delete Actor**

Deletes an Actor.

### Parameters

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| `actorId` | path | string | Yes | Actor ID or a tilde-separated owner's username and |

### Example

```bash
curl -X DELETE \
  -H "Authorization: Bearer $TOKEN" \
  "https://api.apify.com/v2/acts/{actorId}"
```

---
