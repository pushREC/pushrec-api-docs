---
created: 2026-01-08
tags: [type/api-reference, api/add-ons]
api_name: DigitalOcean API
category: Add-Ons
endpoint_count: 8
---

# DigitalOcean API - Add-Ons

[[README|Back to Overview]]

---

## GET /v2/add-ons/apps

**List Available Add-On Applications**

To fetch details of all available Add-On Applications, send a GET request to `/v2/add-ons/apps`.


### Example

```bash
curl -X GET \
  -H "Authorization: Bearer $TOKEN" \
  "https://api.digitalocean.com/v2/add-ons/apps"
```

---

## GET /v2/add-ons/apps/{app_slug}/metadata

**Get Metadata for an Add-On Application**

To find out what metadata is required for a specific add-on, send a GET request to `/v2/add-ons/apps/{app_slug}/metadata`.
Metadata varies by application.


### Parameters

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| `app_slug` | path | string | Yes | The slug identifier for the application whose meta |

### Example

```bash
curl -X GET \
  -H "Authorization: Bearer $TOKEN" \
  "https://api.digitalocean.com/v2/add-ons/apps/{app_slug}/metadata"
```

---

## GET /v2/add-ons/saas

**List all Add-On Resources**

To fetch all Add-On Resources under your team, send a GET request to `/v2/add-ons/saas`.


### Example

```bash
curl -X GET \
  -H "Authorization: Bearer $TOKEN" \
  "https://api.digitalocean.com/v2/add-ons/saas"
```

---

## POST /v2/add-ons/saas

**Create/Provision a New Add-on Resource**

To create an add-on resource, send a POST request to `/v2/add-ons/saas` with required parameters.
Some add-ons require additional metadata to be provided in the request body. To find out
what metadata is required for a specific add-on, send a GET request to `/v2/add-ons/apps/{app_slug}/metadata`.


### Example

```bash
curl -X POST \
  -H "Authorization: Bearer $TOKEN" \
  "https://api.digitalocean.com/v2/add-ons/saas"
```

---

## GET /v2/add-ons/saas/{resource_uuid}

**Get details on an Add-On Resource**

To fetch details of a specific Add-On Resource, send a GET request to `/v2/add-ons/saas/{resource_uuid}`.
Replace `{resource_uuid}` with the UUID of the resource you want to retrieve.


### Parameters

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| `resource_uuid` | path | string | Yes | The UUID of the add-on resource to retrieve. |

### Example

```bash
curl -X GET \
  -H "Authorization: Bearer $TOKEN" \
  "https://api.digitalocean.com/v2/add-ons/saas/{resource_uuid}"
```

---

## DELETE /v2/add-ons/saas/{resource_uuid}

**Delete/Deprovision an Add-on Resource**

To delete an add-on resource, send a DELETE request to `/v2/add-ons/saas/{resource_uuid}` with the UUID of the resource to delete. 
You cannot retrieve the resource after it has been deleted. The response indicates a request was sent to the 3rd party add-on provider to delete the resource.
You will no longer be billed for this resource.


### Parameters

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| `` | query | string | No |  |

### Example

```bash
curl -X DELETE \
  -H "Authorization: Bearer $TOKEN" \
  "https://api.digitalocean.com/v2/add-ons/saas/{resource_uuid}"
```

---

## PATCH /v2/add-ons/saas/{resource_uuid}

**Update the name for an Add-On Resource**

To change the name of an Add-On Resource, send a PATCH request to `/v2/add-ons/saas/{resource_uuid}`.
Replace `{resource_uuid}` with the UUID of the resource for which you want to change the name.


### Parameters

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| `resource_uuid` | path | string | Yes | The UUID of the add-on resource to rename. |

### Example

```bash
curl -X PATCH \
  -H "Authorization: Bearer $TOKEN" \
  "https://api.digitalocean.com/v2/add-ons/saas/{resource_uuid}"
```

---

## PATCH /v2/add-ons/saas/{resource_uuid}/plan

**Update the plan for an Add-On Resource**

To change the plan associated with an Add-On Resource, send a PATCH request to `/v2/add-ons/saas/{resource_uuid}/plan`.
Replace `{resource_uuid}` with the UUID of the resource for which you want to change the plan.


### Parameters

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| `resource_uuid` | path | string | Yes | The UUID of the add-on resource to update. |

### Example

```bash
curl -X PATCH \
  -H "Authorization: Bearer $TOKEN" \
  "https://api.digitalocean.com/v2/add-ons/saas/{resource_uuid}/plan"
```

---
