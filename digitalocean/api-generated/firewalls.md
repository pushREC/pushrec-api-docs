---
created: 2026-01-08
tags: [type/api-reference, api/firewalls]
api_name: DigitalOcean API
category: Firewalls
endpoint_count: 11
---

# DigitalOcean API - Firewalls

[[README|Back to Overview]]

---

## GET /v2/firewalls

**List All Firewalls**

To list all of the firewalls available on your account, send a GET request to `/v2/firewalls`.

### Parameters

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| `` | query | string | No |  |
| `` | query | string | No |  |

### Example

```bash
curl -X GET \
  -H "Authorization: Bearer $TOKEN" \
  "https://api.digitalocean.com/v2/firewalls"
```

---

## POST /v2/firewalls

**Create a New Firewall**

To create a new firewall, send a POST request to `/v2/firewalls`. The request
must contain at least one inbound or outbound access rule.


### Example

```bash
curl -X POST \
  -H "Authorization: Bearer $TOKEN" \
  "https://api.digitalocean.com/v2/firewalls"
```

---

## GET /v2/firewalls/{firewall_id}

**Retrieve an Existing Firewall**

To show information about an existing firewall, send a GET request to `/v2/firewalls/$FIREWALL_ID`.

### Parameters

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| `` | query | string | No |  |

### Example

```bash
curl -X GET \
  -H "Authorization: Bearer $TOKEN" \
  "https://api.digitalocean.com/v2/firewalls/{firewall_id}"
```

---

## PUT /v2/firewalls/{firewall_id}

**Update a Firewall**

To update the configuration of an existing firewall, send a PUT request to
`/v2/firewalls/$FIREWALL_ID`. The request should contain a full representation
of the firewall including existing attributes. **Note that any attributes that
are not provided will be reset to their default values.**
<br><br>You must have read access (e.g. `droplet:read`) to all resources attached
to the firewall to successfully update the firewall.


### Parameters

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| `` | query | string | No |  |

### Example

```bash
curl -X PUT \
  -H "Authorization: Bearer $TOKEN" \
  "https://api.digitalocean.com/v2/firewalls/{firewall_id}"
```

---

## DELETE /v2/firewalls/{firewall_id}

**Delete a Firewall**

To delete a firewall send a DELETE request to `/v2/firewalls/$FIREWALL_ID`.

No response body will be sent back, but the response code will indicate
success. Specifically, the response code will be a 204, which means that the
action was successful with no returned body data.


### Parameters

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| `` | query | string | No |  |

### Example

```bash
curl -X DELETE \
  -H "Authorization: Bearer $TOKEN" \
  "https://api.digitalocean.com/v2/firewalls/{firewall_id}"
```

---

## POST /v2/firewalls/{firewall_id}/droplets

**Add Droplets to a Firewall**

To assign a Droplet to a firewall, send a POST request to
`/v2/firewalls/$FIREWALL_ID/droplets`. In the body of the request, there
should be a `droplet_ids` attribute containing a list of Droplet IDs.

No response body will be sent back, but the response code will indicate
success. Specifically, the response code will be a 204, which means that the
action was successful with no returned body data.


### Parameters

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| `` | query | string | No |  |

### Example

```bash
curl -X POST \
  -H "Authorization: Bearer $TOKEN" \
  "https://api.digitalocean.com/v2/firewalls/{firewall_id}/droplets"
```

---

## DELETE /v2/firewalls/{firewall_id}/droplets

**Remove Droplets from a Firewall**

To remove a Droplet from a firewall, send a DELETE request to
`/v2/firewalls/$FIREWALL_ID/droplets`. In the body of the request, there should
be a `droplet_ids` attribute containing a list of Droplet IDs.

No response body will be sent back, but the response code will indicate
success. Specifically, the response code will be a 204, which means that the
action was successful with no returned body data.


### Parameters

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| `` | query | string | No |  |

### Example

```bash
curl -X DELETE \
  -H "Authorization: Bearer $TOKEN" \
  "https://api.digitalocean.com/v2/firewalls/{firewall_id}/droplets"
```

---

## POST /v2/firewalls/{firewall_id}/tags

**Add Tags to a Firewall**

To assign a tag representing a group of Droplets to a firewall, send a POST
request to `/v2/firewalls/$FIREWALL_ID/tags`. In the body of the request,
there should be a `tags` attribute containing a list of tag names.

No response body will be sent back, but the response code will indicate
success. Specifically, the response code will be a 204, which means that the
action was successful with no returned body data.


### Parameters

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| `` | query | string | No |  |

### Example

```bash
curl -X POST \
  -H "Authorization: Bearer $TOKEN" \
  "https://api.digitalocean.com/v2/firewalls/{firewall_id}/tags"
```

---

## DELETE /v2/firewalls/{firewall_id}/tags

**Remove Tags from a Firewall**

To remove a tag representing a group of Droplets from a firewall, send a
DELETE request to `/v2/firewalls/$FIREWALL_ID/tags`. In the body of the
request, there should be a `tags` attribute containing a list of tag names.

No response body will be sent back, but the response code will indicate
success. Specifically, the response code will be a 204, which means that the
action was successful with no returned body data.


### Parameters

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| `` | query | string | No |  |

### Example

```bash
curl -X DELETE \
  -H "Authorization: Bearer $TOKEN" \
  "https://api.digitalocean.com/v2/firewalls/{firewall_id}/tags"
```

---

## POST /v2/firewalls/{firewall_id}/rules

**Add Rules to a Firewall**

To add additional access rules to a firewall, send a POST request to
`/v2/firewalls/$FIREWALL_ID/rules`. The body of the request may include an
inbound_rules and/or outbound_rules attribute containing an array of rules to
be added.

No response body will be sent back, but the response code will indicate
success. Specifically, the response code will be a 204, which means that the
action was successful with no returned body data.


### Parameters

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| `` | query | string | No |  |

### Example

```bash
curl -X POST \
  -H "Authorization: Bearer $TOKEN" \
  "https://api.digitalocean.com/v2/firewalls/{firewall_id}/rules"
```

---

## DELETE /v2/firewalls/{firewall_id}/rules

**Remove Rules from a Firewall**

To remove access rules from a firewall, send a DELETE request to
`/v2/firewalls/$FIREWALL_ID/rules`. The body of the request may include an
`inbound_rules` and/or `outbound_rules` attribute containing an array of rules
to be removed.

No response body will be sent back, but the response code will indicate
success. Specifically, the response code will be a 204, which means that the
action was successful with no returned body data.


### Parameters

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| `` | query | string | No |  |

### Example

```bash
curl -X DELETE \
  -H "Authorization: Bearer $TOKEN" \
  "https://api.digitalocean.com/v2/firewalls/{firewall_id}/rules"
```

---
