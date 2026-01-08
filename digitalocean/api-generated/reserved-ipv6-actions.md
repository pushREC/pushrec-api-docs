---
created: 2026-01-08
tags: [type/api-reference, api/reserved-ipv6-actions]
api_name: DigitalOcean API
category: Reserved IPv6 Actions
endpoint_count: 1
---

# DigitalOcean API - Reserved Ipv6 Actions

[[README|Back to Overview]]

---

## POST /v2/reserved_ipv6/{reserved_ipv6}/actions

**Initiate a Reserved IPv6 Action**

To initiate an action on a reserved IPv6 send a POST request to
`/v2/reserved_ipv6/$RESERVED_IPV6/actions`. In the JSON body to the request,
set the `type` attribute to on of the supported action types:

| Action     | Details
|------------|--------
| `assign`   | Assigns a reserved IPv6 to a Droplet
| `unassign` | Unassign a reserved IPv6 from a Droplet


### Parameters

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| `` | query | string | No |  |

### Example

```bash
curl -X POST \
  -H "Authorization: Bearer $TOKEN" \
  "https://api.digitalocean.com/v2/reserved_ipv6/{reserved_ipv6}/actions"
```

---
