---
created: 2026-01-09
tags: [type/api-reference, api/eventsources]
api_name: ngrok OpenAPI
category: EventSources
endpoint_count: 5
---

# ngrok OpenAPI - Eventsources

[[README|Back to Overview]]

---

## POST /event_subscriptions/{subscription_id}/sources

**Create**

Add an additional type for which this event subscription will trigger


### Parameters

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| `` | query | string | No |  |
| `subscription_id` | path | string | Yes | The unique identifier for the Event Subscription t |

### Example

```bash
curl -X POST \
  -H "Authorization: Bearer $TOKEN" \
  "https://api.ngrok.com/event_subscriptions/{subscription_id}/sources"
```

---

## GET /event_subscriptions/{subscription_id}/sources

**List**

List the types for which this event subscription will trigger


### Parameters

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| `` | query | string | No |  |
| `subscription_id` | path | string | Yes | The unique identifier for the Event Subscription t |

### Example

```bash
curl -X GET \
  -H "Authorization: Bearer $TOKEN" \
  "https://api.ngrok.com/event_subscriptions/{subscription_id}/sources"
```

---

## DELETE /event_subscriptions/{subscription_id}/sources/{type}

**Delete**

Remove a type for which this event subscription will trigger


### Parameters

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| `` | query | string | No |  |
| `subscription_id` | path | string | Yes | The unique identifier for the Event Subscription t |
| `type` | path | string | Yes | Type of event for which an event subscription will |

### Example

```bash
curl -X DELETE \
  -H "Authorization: Bearer $TOKEN" \
  "https://api.ngrok.com/event_subscriptions/{subscription_id}/sources/{type}"
```

---

## GET /event_subscriptions/{subscription_id}/sources/{type}

**Get**

Get the details for a given type that triggers for the given event subscription


### Parameters

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| `` | query | string | No |  |
| `subscription_id` | path | string | Yes | The unique identifier for the Event Subscription t |
| `type` | path | string | Yes | Type of event for which an event subscription will |

### Example

```bash
curl -X GET \
  -H "Authorization: Bearer $TOKEN" \
  "https://api.ngrok.com/event_subscriptions/{subscription_id}/sources/{type}"
```

---

## PATCH /event_subscriptions/{subscription_id}/sources/{type}

**Update**

Update the type for which this event subscription will trigger


### Parameters

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| `` | query | string | No |  |
| `subscription_id` | path | string | Yes | The unique identifier for the Event Subscription t |
| `type` | path | string | Yes | Type of event for which an event subscription will |

### Example

```bash
curl -X PATCH \
  -H "Authorization: Bearer $TOKEN" \
  "https://api.ngrok.com/event_subscriptions/{subscription_id}/sources/{type}"
```

---
