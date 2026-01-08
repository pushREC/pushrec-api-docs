---
created: 2026-01-08
tags: [type/api-reference, api/instance-settings]
api_name: Clerk Backend API
category: Instance Settings
endpoint_count: 4
---

# Clerk Backend API - Instance Settings

[[README|Back to Overview]]

---

## GET /instance

**Fetch the current instance**

Fetches the current instance

### Example

```bash
curl -X GET \
  -H "Authorization: Bearer $TOKEN" \
  "https://api.clerk.com/v1/instance"
```

---

## PATCH /instance

**Update instance settings**

Updates the settings of an instance

### Example

```bash
curl -X PATCH \
  -H "Authorization: Bearer $TOKEN" \
  "https://api.clerk.com/v1/instance"
```

---

## PATCH /instance/restrictions

**Update instance restrictions**

Updates the restriction settings of an instance

### Example

```bash
curl -X PATCH \
  -H "Authorization: Bearer $TOKEN" \
  "https://api.clerk.com/v1/instance/restrictions"
```

---

## PATCH /instance/organization_settings

**Update instance organization settings**

Updates the organization settings of the instance

### Example

```bash
curl -X PATCH \
  -H "Authorization: Bearer $TOKEN" \
  "https://api.clerk.com/v1/instance/organization_settings"
```

---
