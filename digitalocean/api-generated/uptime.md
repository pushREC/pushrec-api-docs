---
created: 2026-01-08
tags: [type/api-reference, api/uptime]
api_name: DigitalOcean API
category: Uptime
endpoint_count: 11
---

# DigitalOcean API - Uptime

[[README|Back to Overview]]

---

## GET /v2/uptime/checks

**List All Checks**

To list all of the Uptime checks on your account, send a GET request to `/v2/uptime/checks`.

### Parameters

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| `` | query | string | No |  |
| `` | query | string | No |  |

### Example

```bash
curl -X GET \
  -H "Authorization: Bearer $TOKEN" \
  "https://api.digitalocean.com/v2/uptime/checks"
```

---

## POST /v2/uptime/checks

**Create a New Check**

To create an Uptime check, send a POST request to `/v2/uptime/checks` specifying the attributes
in the table below in the JSON body.


### Example

```bash
curl -X POST \
  -H "Authorization: Bearer $TOKEN" \
  "https://api.digitalocean.com/v2/uptime/checks"
```

---

## GET /v2/uptime/checks/{check_id}

**Retrieve an Existing Check**

To show information about an existing check, send a GET request to `/v2/uptime/checks/$CHECK_ID`.

### Parameters

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| `` | query | string | No |  |

### Example

```bash
curl -X GET \
  -H "Authorization: Bearer $TOKEN" \
  "https://api.digitalocean.com/v2/uptime/checks/{check_id}"
```

---

## PUT /v2/uptime/checks/{check_id}

**Update a Check**

To update the settings of an Uptime check, send a PUT request to `/v2/uptime/checks/$CHECK_ID`.


### Parameters

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| `` | query | string | No |  |

### Example

```bash
curl -X PUT \
  -H "Authorization: Bearer $TOKEN" \
  "https://api.digitalocean.com/v2/uptime/checks/{check_id}"
```

---

## DELETE /v2/uptime/checks/{check_id}

**Delete a Check**

To delete an Uptime check, send a DELETE request to `/v2/uptime/checks/$CHECK_ID`. A 204 status
code with no body will be returned in response to a successful request.


Deleting a check will also delete alerts associated with the check.


### Parameters

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| `` | query | string | No |  |

### Example

```bash
curl -X DELETE \
  -H "Authorization: Bearer $TOKEN" \
  "https://api.digitalocean.com/v2/uptime/checks/{check_id}"
```

---

## GET /v2/uptime/checks/{check_id}/state

**Retrieve Check State**

To show information about an existing check's state, send a GET request to `/v2/uptime/checks/$CHECK_ID/state`.

### Parameters

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| `` | query | string | No |  |

### Example

```bash
curl -X GET \
  -H "Authorization: Bearer $TOKEN" \
  "https://api.digitalocean.com/v2/uptime/checks/{check_id}/state"
```

---

## GET /v2/uptime/checks/{check_id}/alerts

**List All Alerts**

To list all of the alerts for an Uptime check, send a GET request to `/v2/uptime/checks/$CHECK_ID/alerts`.

### Parameters

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| `` | query | string | No |  |
| `` | query | string | No |  |
| `` | query | string | No |  |

### Example

```bash
curl -X GET \
  -H "Authorization: Bearer $TOKEN" \
  "https://api.digitalocean.com/v2/uptime/checks/{check_id}/alerts"
```

---

## POST /v2/uptime/checks/{check_id}/alerts

**Create a New Alert**

To create an Uptime alert, send a POST request to `/v2/uptime/checks/$CHECK_ID/alerts` specifying the attributes
in the table below in the JSON body.


### Parameters

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| `` | query | string | No |  |

### Example

```bash
curl -X POST \
  -H "Authorization: Bearer $TOKEN" \
  "https://api.digitalocean.com/v2/uptime/checks/{check_id}/alerts"
```

---

## GET /v2/uptime/checks/{check_id}/alerts/{alert_id}

**Retrieve an Existing Alert**

To show information about an existing alert, send a GET request to `/v2/uptime/checks/$CHECK_ID/alerts/$ALERT_ID`.

### Parameters

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| `` | query | string | No |  |
| `` | query | string | No |  |

### Example

```bash
curl -X GET \
  -H "Authorization: Bearer $TOKEN" \
  "https://api.digitalocean.com/v2/uptime/checks/{check_id}/alerts/{alert_id}"
```

---

## PUT /v2/uptime/checks/{check_id}/alerts/{alert_id}

**Update an Alert**

To update the settings of an Uptime alert, send a PUT request to `/v2/uptime/checks/$CHECK_ID/alerts/$ALERT_ID`.


### Parameters

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| `` | query | string | No |  |
| `` | query | string | No |  |

### Example

```bash
curl -X PUT \
  -H "Authorization: Bearer $TOKEN" \
  "https://api.digitalocean.com/v2/uptime/checks/{check_id}/alerts/{alert_id}"
```

---

## DELETE /v2/uptime/checks/{check_id}/alerts/{alert_id}

**Delete an Alert**

To delete an Uptime alert, send a DELETE request to `/v2/uptime/checks/$CHECK_ID/alerts/$ALERT_ID`. A 204 status
code with no body will be returned in response to a successful request.


### Parameters

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| `` | query | string | No |  |
| `` | query | string | No |  |

### Example

```bash
curl -X DELETE \
  -H "Authorization: Bearer $TOKEN" \
  "https://api.digitalocean.com/v2/uptime/checks/{check_id}/alerts/{alert_id}"
```

---
