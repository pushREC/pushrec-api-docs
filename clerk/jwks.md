---
created: 2026-01-08
tags: [type/api-reference, api/jwks]
api_name: Clerk Backend API
category: JWKS
endpoint_count: 1
---

# Clerk Backend API - Jwks

[[README|Back to Overview]]

---

## GET /jwks

**Retrieve the JSON Web Key Set of the instance**

Retrieve the JSON Web Key Set of the instance

### Example

```bash
curl -X GET \
  -H "Authorization: Bearer $TOKEN" \
  "https://api.clerk.com/v1/jwks"
```

---
