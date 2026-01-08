---
created: 2026-01-08
tags: [type/api-reference, api/organization-domains]
api_name: Clerk Backend API
category: Organization Domains
endpoint_count: 4
---

# Clerk Backend API - Organization Domains

[[README|Back to Overview]]

---

## POST /organizations/{organization_id}/domains

**Create a new organization domain.**

Creates a new organization domain. By default the domain is verified, but can be optionally set to unverified.

### Parameters

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| `organization_id` | path | string | Yes | The ID of the organization where the new domain wi |

### Example

```bash
curl -X POST \
  -H "Authorization: Bearer $TOKEN" \
  "https://api.clerk.com/v1/organizations/{organization_id}/domains"
```

---

## GET /organizations/{organization_id}/domains

**Get a list of all domains of an organization.**

Get a list of all domains of an organization.

### Parameters

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| `organization_id` | path | string | Yes | The organization ID. |
| `verified` | query | string | No | Filter domains by their verification status. `true |
| `enrollment_mode` | query | string | No | Filter domains by their enrollment mode |
| `` | query | string | No |  |
| `` | query | string | No |  |

### Example

```bash
curl -X GET \
  -H "Authorization: Bearer $TOKEN" \
  "https://api.clerk.com/v1/organizations/{organization_id}/domains"
```

---

## PATCH /organizations/{organization_id}/domains/{domain_id}

**Update an organization domain.**

Updates the properties of an existing organization domain.

### Parameters

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| `organization_id` | path | string | Yes | The ID of the organization the domain belongs to |
| `domain_id` | path | string | Yes | The ID of the domain |

### Example

```bash
curl -X PATCH \
  -H "Authorization: Bearer $TOKEN" \
  "https://api.clerk.com/v1/organizations/{organization_id}/domains/{domain_id}"
```

---

## DELETE /organizations/{organization_id}/domains/{domain_id}

**Remove a domain from an organization.**

Removes the given domain from the organization.

### Parameters

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| `organization_id` | path | string | Yes | The ID of the organization the domain belongs to |
| `domain_id` | path | string | Yes | The ID of the domain |

### Example

```bash
curl -X DELETE \
  -H "Authorization: Bearer $TOKEN" \
  "https://api.clerk.com/v1/organizations/{organization_id}/domains/{domain_id}"
```

---
