---
created: 2026-01-08
tags: [type/api-reference, api/floating-ip-actions]
api_name: DigitalOcean API
category: Floating IP Actions
endpoint_count: 3
---

# DigitalOcean API - Floating Ip Actions

[[README|Back to Overview]]

---

## GET /v2/floating_ips/{floating_ip}/actions

**List All Actions for a Floating IP**

To retrieve all actions that have been executed on a floating IP, send a GET request to `/v2/floating_ips/$FLOATING_IP/actions`.

### Parameters

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| `` | query | string | No |  |

### Example

```bash
curl -X GET \
  -H "Authorization: Bearer $TOKEN" \
  "https://api.digitalocean.com/v2/floating_ips/{floating_ip}/actions"
```

---

## POST /v2/floating_ips/{floating_ip}/actions

**Initiate a Floating IP Action**

To initiate an action on a floating IP send a POST request to
`/v2/floating_ips/$FLOATING_IP/actions`. In the JSON body to the request,
set the `type` attribute to on of the supported action types:

| Action     | Details
|------------|--------
| `assign`   | Assigns a floating IP to a Droplet
| `unassign` | Unassign a floating IP from a Droplet


### Parameters

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| `` | query | string | No |  |

### Example

```bash
curl -X POST \
  -H "Authorization: Bearer $TOKEN" \
  "https://api.digitalocean.com/v2/floating_ips/{floating_ip}/actions"
```

---

## GET /v2/floating_ips/{floating_ip}/actions/{action_id}

**Retrieve an Existing Floating IP Action**

To retrieve the status of a floating IP action, send a GET request to `/v2/floating_ips/$FLOATING_IP/actions/$ACTION_ID`.

### Parameters

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| `` | query | string | No |  |
| `` | query | string | No |  |

### Example

```bash
curl -X GET \
  -H "Authorization: Bearer $TOKEN" \
  "https://api.digitalocean.com/v2/floating_ips/{floating_ip}/actions/{action_id}"
```

---
