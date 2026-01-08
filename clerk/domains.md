---
created: 2026-01-08
tags: [type/api-reference, api/domains]
api_name: Clerk Backend API
category: Domains
endpoint_count: 4
---

# Clerk Backend API - Domains

[[README|Back to Overview]]

---

## GET /domains

**List all instance domains**

Use this endpoint to get a list of all domains for an instance.
The response will contain the primary domain for the instance and any satellite domains. Each domain in the response contains information about the URLs where Clerk operates and the required CNAME targets.

### Example

```bash
curl -X GET \
  -H "Authorization: Bearer $TOKEN" \
  "https://api.clerk.com/v1/domains"
```

---

## POST /domains

**Add a domain**

Add a new domain for your instance.
Useful in the case of multi-domain instances, allows adding satellite domains to an instance.
The new domain must have a `name`. The domain name can contain the port for development instances, like `localhost:3000`.
At the moment, instances can have only one primary domain, so the `is_satellite` parameter must be set to `true`.
If you're planning to configure the new satellite domain to run behind a proxy, pass the `proxy_url` parameter accordingly.

### Example

```bash
curl -X POST \
  -H "Authorization: Bearer $TOKEN" \
  "https://api.clerk.com/v1/domains"
```

---

## DELETE /domains/{domain_id}

**Delete a satellite domain**

Deletes a satellite domain for the instance.
It is currently not possible to delete the instance's primary domain.

### Parameters

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| `domain_id` | path | string | Yes | The ID of the domain that will be deleted. Must be |

### Example

```bash
curl -X DELETE \
  -H "Authorization: Bearer $TOKEN" \
  "https://api.clerk.com/v1/domains/{domain_id}"
```

---

## PATCH /domains/{domain_id}

**Update a domain**

The `proxy_url` can be updated only for production instances.
Update one of the instance's domains. Both primary and satellite domains can be updated.
If you choose to use Clerk via proxy, use this endpoint to specify the `proxy_url`.
Whenever you decide you'd rather switch to DNS setup for Clerk, simply set `proxy_url`
to `null` for the domain. When you update a production instance's primary domain name,
you have to make sure that you've completed all the necessary setup steps for DNS and
emails to work. Expect downtime otherwise. Updating a primary domain's name will also
update the instance's home origin, affecting the default application paths.

### Parameters

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| `domain_id` | path | string | Yes | The ID of the domain that will be updated. |

### Example

```bash
curl -X PATCH \
  -H "Authorization: Bearer $TOKEN" \
  "https://api.clerk.com/v1/domains/{domain_id}"
```

---
