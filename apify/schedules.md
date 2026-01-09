---
created: 2026-01-09
tags: [type/api-reference, api/schedules]
api_name: Apify API
category: Schedules
endpoint_count: 6
---

# Apify API - Schedules

[[README|Back to Overview]]

---

## GET /v2/schedules

**Get list of schedules**

Gets the list of schedules that the user created.

The endpoint supports pagination using the `limit` and `offset` parameters.
It will not return more than 1000 records.

By default, the records are sorted by the `createdAt` field in ascending
order. To sort the records in descending order, use the `desc=1` parameter.


### Parameters

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| `offset` | query | number | No | Number of records that should be skipped at the st |
| `limit` | query | number | No | Maximum number of records to return. The default v |
| `desc` | query | boolean | No | If `true` or `1`, the objects are sorted by the `c |

### Example

```bash
curl -X GET \
  -H "Authorization: Bearer $TOKEN" \
  "https://api.apify.com/v2/schedules"
```

---

## POST /v2/schedules

**Create schedule**

Creates a new schedule with settings provided by the schedule object passed
as JSON in the payload. The response is the created schedule object.

The request needs to specify the `Content-Type: application/json` HTTP header!

When providing your API authentication token, we recommend using the
request's `Authorization` header, rather than the URL. ([More
info](#/introduction/authentication)).


### Example

```bash
curl -X POST \
  -H "Authorization: Bearer $TOKEN" \
  "https://api.apify.com/v2/schedules"
```

---

## GET /v2/schedules/{scheduleId}

**Get schedule**

Gets the schedule object with all details.

### Parameters

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| `scheduleId` | path | string | Yes | Schedule ID. |

### Example

```bash
curl -X GET \
  -H "Authorization: Bearer $TOKEN" \
  "https://api.apify.com/v2/schedules/{scheduleId}"
```

---

## PUT /v2/schedules/{scheduleId}

**Update schedule**

Updates a schedule using values specified by a schedule object passed as
JSON in the POST payload. If the object does not define a specific property,
its value will not be updated.

The response is the full schedule object as returned by the
[Get schedule](#/reference/schedules/schedule-object/get-schedule) endpoint.

**The request needs to specify the `Content-Type: application/json` HTTP
header!**

When providing your API authentication token, we recommend using the
request's `Authorization` header, rather than the URL. ([More
info](#/introduction/authentication)).


### Parameters

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| `scheduleId` | path | string | Yes | Schedule ID. |

### Example

```bash
curl -X PUT \
  -H "Authorization: Bearer $TOKEN" \
  "https://api.apify.com/v2/schedules/{scheduleId}"
```

---

## DELETE /v2/schedules/{scheduleId}

**Delete schedule**

Deletes a schedule.

### Parameters

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| `scheduleId` | path | string | Yes | Schedule ID. |

### Example

```bash
curl -X DELETE \
  -H "Authorization: Bearer $TOKEN" \
  "https://api.apify.com/v2/schedules/{scheduleId}"
```

---

## GET /v2/schedules/{scheduleId}/log

**Get schedule log**

Gets the schedule log as a JSON array containing information about up to a
1000 invocations of the schedule.


### Parameters

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| `scheduleId` | path | string | Yes | Schedule ID. |

### Example

```bash
curl -X GET \
  -H "Authorization: Bearer $TOKEN" \
  "https://api.apify.com/v2/schedules/{scheduleId}/log"
```

---
