---
created: 2026-01-08
tags: [type/api-reference, api/miscellaneous]
api_name: Clerk Backend API
category: Miscellaneous
endpoint_count: 1
---

# Clerk Backend API - Miscellaneous

[[README|Back to Overview]]

---

## GET /public/interstitial

**Returns the markup for the interstitial page**

The Clerk interstitial endpoint serves an html page that loads clerk.js in order to check the user's authentication state.
It is used by Clerk SDKs when the user's authentication state cannot be immediately determined.

### Parameters

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| `frontendApi` | query | string | No | Please use `frontend_api` instead |
| `frontend_api` | query | string | No | The Frontend API key of your instance |
| `publishable_key` | query | string | No | The publishable key of your instance |
| `proxy_url` | query | string | No | The proxy URL of your instance |
| `domain` | query | string | No | The domain of your instance |
| `sign_in_url` | query | string | No | The sign in URL of your instance |
| `use_domain_for_script` | query | boolean | No | Whether to use the domain for the script URL |

### Example

```bash
curl -X GET \
  -H "Authorization: Bearer $TOKEN" \
  "https://api.clerk.com/v1/public/interstitial"
```

---
