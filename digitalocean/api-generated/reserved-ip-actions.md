---
created: 2026-01-08
tags: [type/api-reference, api/reserved-ip-actions]
api_name: DigitalOcean API
category: Reserved IP Actions
endpoint_count: 3
---

# DigitalOcean API - Reserved Ip Actions

[[README|Back to Overview]]

---

## GET /v2/reserved_ips/{reserved_ip}/actions

**List All Actions for a Reserved IP**

To retrieve all actions that have been executed on a reserved IP, send a GET request to `/v2/reserved_ips/$RESERVED_IP/actions`.

### Parameters

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| `` | query | string | No |  |

### Example

```bash
curl -X GET \
  -H "Authorization: Bearer $TOKEN" \
  "https://api.digitalocean.com/v2/reserved_ips/{reserved_ip}/actions"
```

---

## POST /v2/reserved_ips/{reserved_ip}/actions

**Initiate a Reserved IP Action**

To initiate an action on a reserved IP send a POST request to
`/v2/reserved_ips/$RESERVED_IP/actions`. In the JSON body to the request,
set the `type` attribute to on of the supported action types:

| Action     | Details
|------------|--------
| `assign`   | Assigns a reserved IP to a Droplet
| `unassign` | Unassign a reserved IP from a Droplet


### Parameters

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| `` | query | string | No |  |

### Example

```bash
curl -X POST \
  -H "Authorization: Bearer $TOKEN" \
  "https://api.digitalocean.com/v2/reserved_ips/{reserved_ip}/actions"
```

---

## GET /v2/reserved_ips/{reserved_ip}/actions/{action_id}

**Retrieve an Existing Reserved IP Action**

To retrieve the status of a reserved IP action, send a GET request to `/v2/reserved_ips/$RESERVED_IP/actions/$ACTION_ID`.

### Parameters

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| `` | query | string | No |  |
| `` | query | string | No |  |

### Example

```bash
curl -X GET \
  -H "Authorization: Bearer $TOKEN" \
  "https://api.digitalocean.com/v2/reserved_ips/{reserved_ip}/actions/{action_id}"
```

---
