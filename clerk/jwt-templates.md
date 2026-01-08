---
created: 2026-01-08
tags: [type/api-reference, api/jwt-templates]
api_name: Clerk Backend API
category: JWT Templates
endpoint_count: 5
---

# Clerk Backend API - Jwt Templates

[[README|Back to Overview]]

---

## GET /jwt_templates

**List all templates**

### Parameters

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| `` | query | string | No |  |
| `` | query | string | No |  |
| `` | query | string | No |  |

### Example

```bash
curl -X GET \
  -H "Authorization: Bearer $TOKEN" \
  "https://api.clerk.com/v1/jwt_templates"
```

---

## POST /jwt_templates

**Create a JWT template**

Create a new JWT template

### Example

```bash
curl -X POST \
  -H "Authorization: Bearer $TOKEN" \
  "https://api.clerk.com/v1/jwt_templates"
```

---

## GET /jwt_templates/{template_id}

**Retrieve a template**

Retrieve the details of a given JWT template

### Parameters

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| `template_id` | path | string | Yes | JWT Template ID |

### Example

```bash
curl -X GET \
  -H "Authorization: Bearer $TOKEN" \
  "https://api.clerk.com/v1/jwt_templates/{template_id}"
```

---

## PATCH /jwt_templates/{template_id}

**Update a JWT template**

Updates an existing JWT template

### Parameters

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| `template_id` | path | string | Yes | The ID of the JWT template to update |

### Example

```bash
curl -X PATCH \
  -H "Authorization: Bearer $TOKEN" \
  "https://api.clerk.com/v1/jwt_templates/{template_id}"
```

---

## DELETE /jwt_templates/{template_id}

**Delete a Template**

### Parameters

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| `template_id` | path | string | Yes | JWT Template ID |

### Example

```bash
curl -X DELETE \
  -H "Authorization: Bearer $TOKEN" \
  "https://api.clerk.com/v1/jwt_templates/{template_id}"
```

---
