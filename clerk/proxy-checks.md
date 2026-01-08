---
created: 2026-01-08
tags: [type/api-reference, api/proxy-checks]
api_name: Clerk Backend API
category: Proxy Checks
endpoint_count: 1
---

# Clerk Backend API - Proxy Checks

[[README|Back to Overview]]

---

## POST /proxy_checks

**Verify the proxy configuration for your domain**

This endpoint can be used to validate that a proxy-enabled domain is operational.
It tries to verify that the proxy URL provided in the parameters maps to a functional proxy that can reach the Clerk Frontend API.

You can use this endpoint before you set a proxy URL for a domain. This way you can ensure that switching to proxy-based
configuration will not lead to downtime for your instance.

The `proxy_url` parameter allows for testing proxy configurations for domains that don't have a proxy URL yet, or operate on
a different proxy URL than the one provided. It can also be used to re-validate a domain that is already configured to work with a proxy.

### Example

```bash
curl -X POST \
  -H "Authorization: Bearer $TOKEN" \
  "https://api.clerk.com/v1/proxy_checks"
```

---
