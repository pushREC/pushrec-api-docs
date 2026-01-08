---
created: 2026-01-08
tags: [type/api-reference, api/oauth-applications]
api_name: Clerk Backend API
category: OAuth Applications
endpoint_count: 6
---

# Clerk Backend API - Oauth Applications

[[README|Back to Overview]]

---

## GET /oauth_applications

**Get a list of OAuth applications for an instance**

This request returns the list of OAuth applications for an instance.
Results can be paginated using the optional `limit` and `offset` query parameters.
The OAuth applications are ordered by descending creation date.
Most recent OAuth applications will be returned first.

### Parameters

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| `` | query | string | No |  |
| `` | query | string | No |  |

### Example

```bash
curl -X GET \
  -H "Authorization: Bearer $TOKEN" \
  "https://api.clerk.com/v1/oauth_applications"
```

---

## POST /oauth_applications

**Create an OAuth application**

Creates a new OAuth application with the given name and callback URL for an instance.
The callback URL must be a valid url.
All URL schemes are allowed such as `http://`, `https://`, `myapp://`, etc...

### Example

```bash
curl -X POST \
  -H "Authorization: Bearer $TOKEN" \
  "https://api.clerk.com/v1/oauth_applications"
```

---

## GET /oauth_applications/{oauth_application_id}

**Retrieve an OAuth application by ID**

Fetches the OAuth application whose ID matches the provided `id` in the path.

### Parameters

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| `oauth_application_id` | path | string | Yes | The ID of the OAuth application |

### Example

```bash
curl -X GET \
  -H "Authorization: Bearer $TOKEN" \
  "https://api.clerk.com/v1/oauth_applications/{oauth_application_id}"
```

---

## PATCH /oauth_applications/{oauth_application_id}

**Update an OAuth application**

Updates an existing OAuth application

### Parameters

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| `oauth_application_id` | path | string | Yes | The ID of the OAuth application to update |

### Example

```bash
curl -X PATCH \
  -H "Authorization: Bearer $TOKEN" \
  "https://api.clerk.com/v1/oauth_applications/{oauth_application_id}"
```

---

## DELETE /oauth_applications/{oauth_application_id}

**Delete an OAuth application**

Deletes the given OAuth application.
This is not reversible.

### Parameters

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| `oauth_application_id` | path | string | Yes | The ID of the OAuth application to delete |

### Example

```bash
curl -X DELETE \
  -H "Authorization: Bearer $TOKEN" \
  "https://api.clerk.com/v1/oauth_applications/{oauth_application_id}"
```

---

## POST /oauth_applications/{oauth_application_id}/rotate_secret

**Rotate the client secret of the given OAuth application**

Rotates the OAuth application's client secret.
When the client secret is rotated, make sure to update it in authorized OAuth clients.

### Parameters

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| `oauth_application_id` | path | string | Yes | The ID of the OAuth application for which to rotat |

### Example

```bash
curl -X POST \
  -H "Authorization: Bearer $TOKEN" \
  "https://api.clerk.com/v1/oauth_applications/{oauth_application_id}/rotate_secret"
```

---
