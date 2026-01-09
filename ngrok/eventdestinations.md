---
created: 2026-01-09
tags: [type/api-reference, api/eventdestinations]
api_name: ngrok OpenAPI
category: EventDestinations
endpoint_count: 5
---

# ngrok OpenAPI - Eventdestinations

[[README|Back to Overview]]

---

## POST /event_destinations

**Create**

Create a new Event Destination. It will not apply to anything until it is associated with an Event Subscription.


### Parameters

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| `` | query | string | No |  |

### Example

```bash
curl -X POST \
  -H "Authorization: Bearer $TOKEN" \
  "https://api.ngrok.com/event_destinations"
```

---

## GET /event_destinations

**List**

List all Event Destinations on this account.


### Parameters

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| `` | query | string | No |  |
| `before_id` | query | string | No |  |
| `limit` | query | string | No |  |
| `filter` | query | string | No |  |

### Example

```bash
curl -X GET \
  -H "Authorization: Bearer $TOKEN" \
  "https://api.ngrok.com/event_destinations"
```

---

## DELETE /event_destinations/{id}

**Delete**

Delete an Event Destination. If the Event Destination is still referenced by an Event Subscription.


### Parameters

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| `` | query | string | No |  |
| `id` | path | string | Yes | a resource identifier
 |

### Example

```bash
curl -X DELETE \
  -H "Authorization: Bearer $TOKEN" \
  "https://api.ngrok.com/event_destinations/{id}"
```

---

## GET /event_destinations/{id}

**Get**

Get detailed information about an Event Destination by ID.


### Parameters

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| `` | query | string | No |  |
| `id` | path | string | Yes | a resource identifier
 |

### Example

```bash
curl -X GET \
  -H "Authorization: Bearer $TOKEN" \
  "https://api.ngrok.com/event_destinations/{id}"
```

---

## PATCH /event_destinations/{id}

**Update**

Update attributes of an Event Destination.


### Parameters

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| `` | query | string | No |  |
| `id` | path | string | Yes | Unique identifier for this Event Destination.
 |

### Example

```bash
curl -X PATCH \
  -H "Authorization: Bearer $TOKEN" \
  "https://api.ngrok.com/event_destinations/{id}"
```

---
