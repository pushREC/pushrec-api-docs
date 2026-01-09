---
created: 2026-01-09
tags: [type/api-reference, api/app-properties]
api_name: The Jira Cloud platform REST API
category: App properties
endpoint_count: 8
---

# The Jira Cloud platform REST API - App Properties

[[README|Back to Overview]]

---

## GET /rest/atlassian-connect/1/addons/{addonKey}/properties

**Get app properties**

Gets all the properties of an app.

**[Permissions](#permissions) required:** Only a Connect app whose key matches `addonKey` can make this request.
Additionally, Forge apps can access Connect app properties (stored against the same `app.connect.key`).

### Parameters

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| `addonKey` | path | string | Yes | The key of the app, as defined in its descriptor. |

### Example

```bash
curl -X GET \
  -H "Authorization: Bearer $TOKEN" \
  "https://your-domain.atlassian.net/rest/atlassian-connect/1/addons/{addonKey}/properties"
```

---

## DELETE /rest/atlassian-connect/1/addons/{addonKey}/properties/{propertyKey}

**Delete app property**

Deletes an app's property.

**[Permissions](#permissions) required:** Only a Connect app whose key matches `addonKey` can make this request.
Additionally, Forge apps can access Connect app properties (stored against the same `app.connect.key`).

### Parameters

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| `addonKey` | path | string | Yes | The key of the app, as defined in its descriptor. |
| `propertyKey` | path | string | Yes | The key of the property. |

### Example

```bash
curl -X DELETE \
  -H "Authorization: Bearer $TOKEN" \
  "https://your-domain.atlassian.net/rest/atlassian-connect/1/addons/{addonKey}/properties/{propertyKey}"
```

---

## GET /rest/atlassian-connect/1/addons/{addonKey}/properties/{propertyKey}

**Get app property**

Returns the key and value of an app's property.

**[Permissions](#permissions) required:** Only a Connect app whose key matches `addonKey` can make this request.
Additionally, Forge apps can access Connect app properties (stored against the same `app.connect.key`).

### Parameters

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| `addonKey` | path | string | Yes | The key of the app, as defined in its descriptor. |
| `propertyKey` | path | string | Yes | The key of the property. |

### Example

```bash
curl -X GET \
  -H "Authorization: Bearer $TOKEN" \
  "https://your-domain.atlassian.net/rest/atlassian-connect/1/addons/{addonKey}/properties/{propertyKey}"
```

---

## PUT /rest/atlassian-connect/1/addons/{addonKey}/properties/{propertyKey}

**Set app property**

Sets the value of an app's property. Use this resource to store custom data for your app.

The value of the request body must be a [valid](http://tools.ietf.org/html/rfc4627), non-empty JSON blob. The maximum length is 32768 characters.

**[Permissions](#permissions) required:** Only a Connect app whose key matches `addonKey` can make this request.
Additionally, Forge apps can access Connect app properties (stored against the same `app.connect.key`).

### Parameters

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| `addonKey` | path | string | Yes | The key of the app, as defined in its descriptor. |
| `propertyKey` | path | string | Yes | The key of the property. |

### Example

```bash
curl -X PUT \
  -H "Authorization: Bearer $TOKEN" \
  "https://your-domain.atlassian.net/rest/atlassian-connect/1/addons/{addonKey}/properties/{propertyKey}"
```

---

## GET /rest/forge/1/app/properties

**Get app property keys (Forge)**

Returns all property keys for the Forge app.

**[Permissions](#permissions) required:** Only Forge apps can make this request. This API can only be accessed using **[asApp()](https://developer.atlassian.com/platform/forge/apis-reference/fetch-api-product.requestjira/#method-signature)** requests from Forge.

### Example

```bash
curl -X GET \
  -H "Authorization: Bearer $TOKEN" \
  "https://your-domain.atlassian.net/rest/forge/1/app/properties"
```

---

## DELETE /rest/forge/1/app/properties/{propertyKey}

**Delete app property (Forge)**

Deletes a Forge app's property.

**[Permissions](#permissions) required:** Only Forge apps can make this request. This API can only be accessed using **[asApp()](https://developer.atlassian.com/platform/forge/apis-reference/fetch-api-product.requestjira/#method-signature)** requests from Forge.

The new `write:app-data:jira` OAuth scope is 100% optional now, and not using it won't break your app. However, we recommend adding it to your app's scope list because we will eventually make it mandatory.

### Parameters

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| `propertyKey` | path | string | Yes | The key of the property. |

### Example

```bash
curl -X DELETE \
  -H "Authorization: Bearer $TOKEN" \
  "https://your-domain.atlassian.net/rest/forge/1/app/properties/{propertyKey}"
```

---

## GET /rest/forge/1/app/properties/{propertyKey}

**Get app property (Forge)**

Returns the value of a Forge app's property.

**[Permissions](#permissions) required:** Only Forge apps can make this request. This API can only be accessed using **[asApp()](https://developer.atlassian.com/platform/forge/apis-reference/fetch-api-product.requestjira/#method-signature)** requests from Forge.

### Parameters

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| `propertyKey` | path | string | Yes | The key of the property. |

### Example

```bash
curl -X GET \
  -H "Authorization: Bearer $TOKEN" \
  "https://your-domain.atlassian.net/rest/forge/1/app/properties/{propertyKey}"
```

---

## PUT /rest/forge/1/app/properties/{propertyKey}

**Set app property (Forge)**

Sets the value of a Forge app's property.
These values can be retrieved in [Jira expressions](/cloud/jira/platform/jira-expressions/)
through the `app` [context variable](/cloud/jira/platform/jira-expressions/#context-variables).
They are also available in [entity property display conditions](/platform/forge/manifest-reference/display-conditions/entity-property-conditions/).

For other use cases, use the [Storage API](/platform/forge/runtime-reference/storage-api/).

The value of the request body must be a [valid](http://tools.ietf.org/html/rfc4627), non-empty JSON blob. The maximum length is 32768 characters.

**[Permissions](#permissions) required:** Only Forge apps can make this request. This API can only be accessed using **[asApp()](https://developer.atlassian.com/platform/forge/apis-reference/fetch-api-product.requestjira/#method-signature)** requests from Forge.

The new `write:app-data:jira` OAuth scope is 100% optional now, and not using it won't break your app. However, we recommend adding it to your app's scope list because we will eventually make it mandatory.

### Parameters

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| `propertyKey` | path | string | Yes | The key of the property. |

### Example

```bash
curl -X PUT \
  -H "Authorization: Bearer $TOKEN" \
  "https://your-domain.atlassian.net/rest/forge/1/app/properties/{propertyKey}"
```

---
