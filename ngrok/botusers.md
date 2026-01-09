---
created: 2026-01-09
tags: [type/api-reference, api/botusers]
api_name: ngrok OpenAPI
category: BotUsers
endpoint_count: 5
---

# ngrok OpenAPI - Botusers

[[README|Back to Overview]]

---

## POST /bot_users

**Create**

Create a new bot user


### Parameters

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| `` | query | string | No |  |

### Example

```bash
curl -X POST \
  -H "Authorization: Bearer $TOKEN" \
  "https://api.ngrok.com/bot_users"
```

---

## GET /bot_users

**List**

List all bot users in this account.


### Parameters

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| `` | query | string | No |  |
| `before_id` | query | string | No |  |
| `limit` | query | string | No |  |

### Example

```bash
curl -X GET \
  -H "Authorization: Bearer $TOKEN" \
  "https://api.ngrok.com/bot_users"
```

---

## DELETE /bot_users/{id}

**Delete**

Delete a bot user by ID


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
  "https://api.ngrok.com/bot_users/{id}"
```

---

## GET /bot_users/{id}

**Get**

Get the details of a Bot User by ID.


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
  "https://api.ngrok.com/bot_users/{id}"
```

---

## PATCH /bot_users/{id}

**Update**

Update attributes of a bot user by ID.


### Parameters

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| `` | query | string | No |  |
| `id` | path | string | Yes |  |

### Example

```bash
curl -X PATCH \
  -H "Authorization: Bearer $TOKEN" \
  "https://api.ngrok.com/bot_users/{id}"
```

---
