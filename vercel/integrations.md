---
created: 2026-01-08
tags: [type/api-reference, api/integrations]
api_name: Vercel API
category: integrations
endpoint_count: 9
---

# Vercel API - Integrations

[[README|Back to Overview]]

---

## GET /v1/integrations/git-namespaces

**List git namespaces by provider**

Lists git namespaces for a supported provider. Supported providers are `github`, `gitlab` and `bitbucket`. If the provider is not provided, it will try to obtain it from the user that authenticated the request.

### Parameters

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| `host` | query | string | No | The custom Git host if using a custom Git provider |
| `provider` | query | string | No |  |

### Example

```bash
curl -X GET \
  -H "Authorization: Bearer $TOKEN" \
  "https://api.vercel.com/v1/integrations/git-namespaces"
```

---

## GET /v1/integrations/search-repo

**List git repositories linked to namespace by provider**

Lists git repositories linked to a namespace `id` for a supported provider. A specific namespace `id` can be obtained via the `git-namespaces`  endpoint. Supported providers are `github`, `gitlab` and `bitbucket`. If the provider or namespace is not provided, it will try to obtain it from the user that authenticated the request.

### Parameters

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| `query` | query | string | No |  |
| `namespaceId` | query | ['string', 'number'] | No |  |
| `provider` | query | string | No |  |
| `installationId` | query | string | No |  |
| `host` | query | string | No | The custom Git host if using a custom Git provider |
| `teamId` | query | string | No | The Team identifier to perform the request on beha |
| `slug` | query | string | No | The Team slug to perform the request on behalf of. |

### Example

```bash
curl -X GET \
  -H "Authorization: Bearer $TOKEN" \
  "https://api.vercel.com/v1/integrations/search-repo"
```

---

## GET /v1/integrations/integration/{integrationIdOrSlug}/products/{productIdOrSlug}/plans

**List integration billing plans**

Get a list of billing plans for an integration and product.

### Parameters

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| `integrationIdOrSlug` | path | string | Yes |  |
| `integrationConfigurationId` | query | string | No |  |
| `productIdOrSlug` | path | string | Yes |  |
| `metadata` | query | string | No |  |
| `source` | query | string | No |  |
| `teamId` | query | string | No | The Team identifier to perform the request on beha |
| `slug` | query | string | No | The Team slug to perform the request on behalf of. |

### Example

```bash
curl -X GET \
  -H "Authorization: Bearer $TOKEN" \
  "https://api.vercel.com/v1/integrations/integration/{integrationIdOrSlug}/products/{productIdOrSlug}/plans"
```

---

## POST /v1/integrations/installations/{integrationConfigurationId}/resources/{resourceId}/connections

**Connect integration resource to project**

Connects an integration resource to a Vercel project. This endpoint establishes a connection between a provisioned integration resource (from storage APIs like `POST /v1/storage/stores/integration/direct`) and a specific Vercel project.

### Parameters

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| `integrationConfigurationId` | path | string | Yes |  |
| `resourceId` | path | string | Yes |  |
| `teamId` | query | string | No | The Team identifier to perform the request on beha |
| `slug` | query | string | No | The Team slug to perform the request on behalf of. |

### Example

```bash
curl -X POST \
  -H "Authorization: Bearer $TOKEN" \
  "https://api.vercel.com/v1/integrations/installations/{integrationConfigurationId}/resources/{resourceId}/connections"
```

---

## GET /v1/integrations/configurations

**Get configurations for the authenticated user or team**

Allows to retrieve all configurations for an authenticated integration. When the `project` view is used, configurations generated for the authorization flow will be filtered out of the results.

### Parameters

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| `view` | query | string | Yes |  |
| `installationType` | query | string | No |  |
| `integrationIdOrSlug` | query | string | No | ID of the integration |
| `teamId` | query | string | No | The Team identifier to perform the request on beha |
| `slug` | query | string | No | The Team slug to perform the request on behalf of. |

### Example

```bash
curl -X GET \
  -H "Authorization: Bearer $TOKEN" \
  "https://api.vercel.com/v1/integrations/configurations"
```

---

## GET /v1/integrations/configuration/{id}

**Retrieve an integration configuration**

Allows to retrieve a the configuration with the provided id in case it exists. The authenticated user or team must be the owner of the config in order to access it.

### Parameters

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| `id` | path | string | Yes | ID of the configuration to check |
| `teamId` | query | string | No | The Team identifier to perform the request on beha |
| `slug` | query | string | No | The Team slug to perform the request on behalf of. |

### Example

```bash
curl -X GET \
  -H "Authorization: Bearer $TOKEN" \
  "https://api.vercel.com/v1/integrations/configuration/{id}"
```

---

## DELETE /v1/integrations/configuration/{id}

**Delete an integration configuration**

Allows to remove the configuration with the `id` provided in the parameters. The configuration and all of its resources will be removed. This includes Webhooks, LogDrains and Project Env variables.

### Parameters

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| `id` | path | string | Yes |  |
| `teamId` | query | string | No | The Team identifier to perform the request on beha |
| `slug` | query | string | No | The Team slug to perform the request on behalf of. |

### Example

```bash
curl -X DELETE \
  -H "Authorization: Bearer $TOKEN" \
  "https://api.vercel.com/v1/integrations/configuration/{id}"
```

---

## GET /v1/integrations/configuration/{id}/products

**List products for integration configuration**

Lists all products available for an integration configuration. Use this endpoint to discover what integration products are available for your integration configuration. The returned product IDs or slugs can then be used with storage provisioning endpoints like `POST /v1/storage/stores/integration/direct`. ## Workflow 1. Get your integration configurations: `GET /v1/integrations/configurations` 2. **Use this endpoint**: Get products for a configuration: `GET /v1/integrations/configuration/{id}/products` 3. Create storage resource: `POST /v1/storage/stores/integration/direct` ## Response Returns an array of products with their IDs, slugs, names, supported protocols, and metadata requirements. Each product represents a different type of resource you can provision. The `metadataSchema` field contains a JSON Schema that defines: - **Required metadata**: Fields that must be provided during storage creation - **Optional metadata**: Fields that can be provided but are not mandatory - **Field validation**: Data types, allowed values, and constraints Use this schema to validate metadata before calling the storage creation endpoint.

### Parameters

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| `id` | path | string | Yes | ID of the integration configuration |
| `teamId` | query | string | No | The Team identifier to perform the request on beha |
| `slug` | query | string | No | The Team slug to perform the request on behalf of. |

### Example

```bash
curl -X GET \
  -H "Authorization: Bearer $TOKEN" \
  "https://api.vercel.com/v1/integrations/configuration/{id}/products"
```

---

## POST /v1/storage/stores/integration/direct

**Create integration store (free and paid plans)**

Creates an integration store for both FREE and PAID billing plans. This simplified endpoint automatically provisions real integration storage resources while handling billing complexity behind the scenes. It supports both free and paid billing plans with automatic authorization creation for paid resources. ## How it works 1. Validates the integration configuration and product 2. For free resources: Auto-discovers available free billing plans 3. For paid resources: Creates billing authorization inline using provided billingPlanId 4. Provisions real resources through the Vercel Marketplace 5. Returns the created store with connection details ## Workflow Before using this endpoint, discover available products and billing plans: 1. List your configurations: `GET /v1/integrations/configurations` 2. Get products for a configuration: `GET /v1/integrations/configuration/{id}/products` 3. Get billing plans for a product: `GET /integrations/integration/{integrationId}/products/{productId}/plans` 4. Review the `metadataSchema` for each product to understand required metadata 5. Create storage with discovered product: `POST /v1/storage/stores/integration/direct` ## Usage Patterns - **Free resources**: Omit `billingPlanId` - endpoint will auto-discover free plans - **Paid resources**: Provide `billingPlanId` from billing plans discovery - **Prepayment plans**: Also provide `prepaymentAmountCents` for variable amount plans ## Limitations - **Admin access required**: Only integration configuration admins can create stores - **Storage limits apply**: Subject to your team's storage quotas - **Payment method required**: For paid plans, ensure valid payment method is configured ## Error Responses - `400 Bad Request`: Invalid input, no plans available, or billing issues - `403 Forbidden`: Insufficient permissions (non-admin users) - `404 Not Found`: Integration configuration or product not found - `429 Too Many Requests`: Rate limit exceeded

### Parameters

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| `teamId` | query | string | No | The Team identifier to perform the request on beha |
| `slug` | query | string | No | The Team slug to perform the request on behalf of. |

### Example

```bash
curl -X POST \
  -H "Authorization: Bearer $TOKEN" \
  "https://api.vercel.com/v1/storage/stores/integration/direct"
```

---
