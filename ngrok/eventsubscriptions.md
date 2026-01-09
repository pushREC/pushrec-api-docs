---
created: 2026-01-09
tags: [type/api-reference, api/eventsubscriptions]
api_name: ngrok OpenAPI
category: EventSubscriptions
endpoint_count: 5
---

# ngrok OpenAPI - Eventsubscriptions

[[README|Back to Overview]]

---

## POST /event_subscriptions

**Create**

Create an Event Subscription.


### Parameters

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| `` | query | string | No |  |

### Example

```bash
curl -X POST \
  -H "Authorization: Bearer $TOKEN" \
  "https://api.ngrok.com/event_subscriptions"
```

---

## GET /event_subscriptions

**List**

List this Account's Event Subscriptions.


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
  "https://api.ngrok.com/event_subscriptions"
```

---

## DELETE /event_subscriptions/{id}

**Delete**

Delete an Event Subscription.


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
  "https://api.ngrok.com/event_subscriptions/{id}"
```

---

## GET /event_subscriptions/{id}

**Get**

Get an Event Subscription by ID.


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
  "https://api.ngrok.com/event_subscriptions/{id}"
```

---

## PATCH /event_subscriptions/{id}

**Update**

Update an Event Subscription.


### Parameters

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| `` | query | string | No |  |
| `id` | path | string | Yes | Unique identifier for this Event Subscription.
 |

### Example

```bash
curl -X PATCH \
  -H "Authorization: Bearer $TOKEN" \
  "https://api.ngrok.com/event_subscriptions/{id}"
```

---
