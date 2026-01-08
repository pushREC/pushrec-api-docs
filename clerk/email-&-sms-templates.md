---
created: 2026-01-08
tags: [type/api-reference, api/email-&-sms-templates]
api_name: Clerk Backend API
category: Email & SMS Templates
endpoint_count: 6
---

# Clerk Backend API - Email & Sms Templates

[[README|Back to Overview]]

---

## GET /templates/{template_type}

**List all templates**

Returns a list of all templates.
The templates are returned sorted by position.

### Parameters

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| `template_type` | path | string | Yes | The type of templates to list (email or SMS) |
| `` | query | string | No |  |
| `` | query | string | No |  |
| `` | query | string | No |  |

### Example

```bash
curl -X GET \
  -H "Authorization: Bearer $TOKEN" \
  "https://api.clerk.com/v1/templates/{template_type}"
```

---

## GET /templates/{template_type}/{slug}

**Retrieve a template**

Returns the details of a template

### Parameters

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| `template_type` | path | string | Yes | The type of templates to retrieve (email or SMS) |
| `slug` | path | string | Yes | The slug (i.e. machine-friendly name) of the templ |

### Example

```bash
curl -X GET \
  -H "Authorization: Bearer $TOKEN" \
  "https://api.clerk.com/v1/templates/{template_type}/{slug}"
```

---

## PUT /templates/{template_type}/{slug}

**Update a template for a given type and slug**

Updates the existing template of the given type and slug

### Parameters

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| `template_type` | path | string | Yes | The type of template to update |
| `slug` | path | string | Yes | The slug of the template to update |

### Example

```bash
curl -X PUT \
  -H "Authorization: Bearer $TOKEN" \
  "https://api.clerk.com/v1/templates/{template_type}/{slug}"
```

---

## POST /templates/{template_type}/{slug}/revert

**Revert a template**

Reverts an updated template to its default state

### Parameters

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| `template_type` | path | string | Yes | The type of template to revert |
| `slug` | path | string | Yes | The slug of the template to revert |

### Example

```bash
curl -X POST \
  -H "Authorization: Bearer $TOKEN" \
  "https://api.clerk.com/v1/templates/{template_type}/{slug}/revert"
```

---

## POST /templates/{template_type}/{slug}/preview

**Preview changes to a template**

Returns a preview of a template for a given template_type, slug and body

### Parameters

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| `template_type` | path | string | Yes | The type of template to preview |
| `slug` | path | string | Yes | The slug of the template to preview |

### Example

```bash
curl -X POST \
  -H "Authorization: Bearer $TOKEN" \
  "https://api.clerk.com/v1/templates/{template_type}/{slug}/preview"
```

---

## POST /templates/{template_type}/{slug}/toggle_delivery

**Toggle the delivery by Clerk for a template of a given type and slug**

Toggles the delivery by Clerk for a template of a given type and slug.
If disabled, Clerk will not deliver the resulting email or SMS.
The app developer will need to listen to the `email.created` or `sms.created` webhooks in order to handle delivery themselves.

### Parameters

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| `template_type` | path | string | Yes | The type of template to toggle delivery for |
| `slug` | path | string | Yes | The slug of the template for which to toggle deliv |

### Example

```bash
curl -X POST \
  -H "Authorization: Bearer $TOKEN" \
  "https://api.clerk.com/v1/templates/{template_type}/{slug}/toggle_delivery"
```

---
