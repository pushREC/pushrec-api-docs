---
created: 2026-01-09
tags: [type/api-reference, api/portfolio-memberships]
api_name: Asana
category: Portfolio memberships
endpoint_count: 3
---

# Asana - Portfolio Memberships

[[README|Back to Overview]]

---

## GET /portfolio_memberships

**Get multiple portfolio memberships**

Returns a list of portfolio memberships in compact representation. You must specify `portfolio`, `portfolio` and `user`, or `workspace` and `user`.

### Parameters

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| `opt_fields` | query | array | No | This endpoint returns a resource which excludes so |

### Example

```bash
curl -X GET \
  -H "Authorization: Bearer $TOKEN" \
  "https://app.asana.com/api/1.0/portfolio_memberships"
```

---

## GET /portfolio_memberships/{portfolio_membership_gid}

**Get a portfolio membership**

Returns the complete portfolio record for a single portfolio membership.

### Parameters

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| `opt_fields` | query | array | No | This endpoint returns a resource which excludes so |

### Example

```bash
curl -X GET \
  -H "Authorization: Bearer $TOKEN" \
  "https://app.asana.com/api/1.0/portfolio_memberships/{portfolio_membership_gid}"
```

---

## GET /portfolios/{portfolio_gid}/portfolio_memberships

**Get memberships from a portfolio**

Returns the compact portfolio membership records for the portfolio.

### Parameters

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| `opt_fields` | query | array | No | This endpoint returns a resource which excludes so |

### Example

```bash
curl -X GET \
  -H "Authorization: Bearer $TOKEN" \
  "https://app.asana.com/api/1.0/portfolios/{portfolio_gid}/portfolio_memberships"
```

---
