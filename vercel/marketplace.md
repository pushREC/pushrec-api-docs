---
created: 2026-01-08
tags: [type/api-reference, api/marketplace]
api_name: Vercel API
category: marketplace
endpoint_count: 21
---

# Vercel API - Marketplace

[[README|Back to Overview]]

---

## PATCH /v1/installations/{integrationConfigurationId}

**Update Installation**

This endpoint updates an integration installation.

### Parameters

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| `integrationConfigurationId` | path | string | Yes |  |

### Example

```bash
curl -X PATCH \
  -H "Authorization: Bearer $TOKEN" \
  "https://api.vercel.com/v1/installations/{integrationConfigurationId}"
```

---

## GET /v1/installations/{integrationConfigurationId}/account

**Get Account Information**

Fetches the best account or user’s contact info

### Parameters

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| `integrationConfigurationId` | path | string | Yes |  |

### Example

```bash
curl -X GET \
  -H "Authorization: Bearer $TOKEN" \
  "https://api.vercel.com/v1/installations/{integrationConfigurationId}/account"
```

---

## GET /v1/installations/{integrationConfigurationId}/member/{memberId}

**Get Member Information**

Returns the member role and other information for a given member ID ("user_id" claim in the SSO OIDC token).

### Parameters

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| `integrationConfigurationId` | path | string | Yes |  |
| `memberId` | path | string | Yes |  |

### Example

```bash
curl -X GET \
  -H "Authorization: Bearer $TOKEN" \
  "https://api.vercel.com/v1/installations/{integrationConfigurationId}/member/{memberId}"
```

---

## POST /v1/installations/{integrationConfigurationId}/events

**Create Event**

Partner notifies Vercel of any changes made to an Installation or a Resource. Vercel is expected to use `list-resources` and other read APIs to get the new state.<br/> <br/> `resource.updated` event should be dispatched when any state of a resource linked to Vercel is modified by the partner.<br/> `installation.updated` event should be dispatched when an installation's billing plan is changed via the provider instead of Vercel.<br/> <br/> Resource update use cases: <br/> <br/> - The user renames a database in the partner’s application. The partner should dispatch a `resource.updated` event to notify Vercel to update the resource in Vercel’s datastores.<br/> - A resource has been suspended due to a lack of use. The partner should dispatch a `resource.updated` event to notify Vercel to update the resource's status in Vercel's datastores.<br/>

### Parameters

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| `integrationConfigurationId` | path | string | Yes |  |

### Example

```bash
curl -X POST \
  -H "Authorization: Bearer $TOKEN" \
  "https://api.vercel.com/v1/installations/{integrationConfigurationId}/events"
```

---

## GET /v1/installations/{integrationConfigurationId}/resources

**Get Integration Resources**

Get all resources for a given installation ID.

### Parameters

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| `integrationConfigurationId` | path | string | Yes |  |

### Example

```bash
curl -X GET \
  -H "Authorization: Bearer $TOKEN" \
  "https://api.vercel.com/v1/installations/{integrationConfigurationId}/resources"
```

---

## GET /v1/installations/{integrationConfigurationId}/resources/{resourceId}

**Get Integration Resource**

Get a resource by its partner ID.

### Parameters

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| `integrationConfigurationId` | path | string | Yes | The ID of the integration configuration (installat |
| `resourceId` | path | string | Yes | The ID provided by the 3rd party provider for the  |

### Example

```bash
curl -X GET \
  -H "Authorization: Bearer $TOKEN" \
  "https://api.vercel.com/v1/installations/{integrationConfigurationId}/resources/{resourceId}"
```

---

## DELETE /v1/installations/{integrationConfigurationId}/resources/{resourceId}

**Delete Integration Resource**

Delete a resource owned by the selected installation ID.

### Parameters

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| `integrationConfigurationId` | path | string | Yes |  |
| `resourceId` | path | string | Yes |  |

### Example

```bash
curl -X DELETE \
  -H "Authorization: Bearer $TOKEN" \
  "https://api.vercel.com/v1/installations/{integrationConfigurationId}/resources/{resourceId}"
```

---

## PUT /v1/installations/{integrationConfigurationId}/resources/{resourceId}

**Import Resource**

This endpoint imports (upserts) a resource to Vercel's installation. This may be needed if resources can be independently created on the partner's side and need to be synchronized to Vercel.

### Parameters

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| `integrationConfigurationId` | path | string | Yes |  |
| `resourceId` | path | string | Yes |  |

### Example

```bash
curl -X PUT \
  -H "Authorization: Bearer $TOKEN" \
  "https://api.vercel.com/v1/installations/{integrationConfigurationId}/resources/{resourceId}"
```

---

## PATCH /v1/installations/{integrationConfigurationId}/resources/{resourceId}

**Update Resource**

This endpoint updates an existing resource in the installation. All parameters are optional, allowing partial updates.

### Parameters

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| `integrationConfigurationId` | path | string | Yes |  |
| `resourceId` | path | string | Yes |  |

### Example

```bash
curl -X PATCH \
  -H "Authorization: Bearer $TOKEN" \
  "https://api.vercel.com/v1/installations/{integrationConfigurationId}/resources/{resourceId}"
```

---

## POST /v1/installations/{integrationConfigurationId}/billing

**Submit Billing Data**

Sends the billing and usage data. The partner should do this at least once a day and ideally once per hour. <br/> Use the `credentials.access_token` we provided in the [Upsert Installation](#upsert-installation) body to authorize this request.

### Parameters

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| `integrationConfigurationId` | path | string | Yes |  |

### Example

```bash
curl -X POST \
  -H "Authorization: Bearer $TOKEN" \
  "https://api.vercel.com/v1/installations/{integrationConfigurationId}/billing"
```

---

## POST /v1/installations/{integrationConfigurationId}/billing/invoices

**Submit Invoice**

This endpoint allows the partner to submit an invoice to Vercel. The invoice is created in Vercel's billing system and sent to the customer. Depending on the type of billing plan, the invoice can be sent at a time of signup, at the start of the billing period, or at the end of the billing period.<br/> <br/> Use the `credentials.access_token` we provided in the [Upsert Installation](#upsert-installation) body to authorize this request. <br/> There are several limitations to the invoice submission:<br/> <br/> 1. A resource can only be billed once per the billing period and the billing plan.<br/> 2. The billing plan used to bill the resource must have been active for this resource during the billing period.<br/> 3. The billing plan used must be a subscription plan.<br/> 4. The interim usage data must be sent hourly for all types of subscriptions. See [Send subscription billing and usage data](#send-subscription-billing-and-usage-data) API on how to send interim billing and usage data.<br/>

### Parameters

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| `integrationConfigurationId` | path | string | Yes |  |

### Example

```bash
curl -X POST \
  -H "Authorization: Bearer $TOKEN" \
  "https://api.vercel.com/v1/installations/{integrationConfigurationId}/billing/invoices"
```

---

## GET /v1/installations/{integrationConfigurationId}/billing/invoices/{invoiceId}

**Get Invoice**

Get Invoice details and status for a given invoice ID.<br/> <br/> See Billing Events with Webhooks documentation on how to receive invoice events. This endpoint is used to retrieve the invoice details.

### Parameters

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| `integrationConfigurationId` | path | string | Yes |  |
| `invoiceId` | path | string | Yes |  |

### Example

```bash
curl -X GET \
  -H "Authorization: Bearer $TOKEN" \
  "https://api.vercel.com/v1/installations/{integrationConfigurationId}/billing/invoices/{invoiceId}"
```

---

## POST /v1/installations/{integrationConfigurationId}/billing/invoices/{invoiceId}/actions

**Invoice Actions**

This endpoint allows the partner to request a refund for an invoice to Vercel. The invoice is created using the [Submit Invoice API](#submit-invoice-api).

### Parameters

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| `integrationConfigurationId` | path | string | Yes |  |
| `invoiceId` | path | string | Yes |  |

### Example

```bash
curl -X POST \
  -H "Authorization: Bearer $TOKEN" \
  "https://api.vercel.com/v1/installations/{integrationConfigurationId}/billing/invoices/{invoiceId}/actions"
```

---

## POST /v1/installations/{integrationConfigurationId}/billing/balance

**Submit Prepayment Balances**

Sends the prepayment balances. The partner should do this at least once a day and ideally once per hour. <br/> Use the `credentials.access_token` we provided in the [Upsert Installation](#upsert-installation) body to authorize this request.

### Parameters

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| `integrationConfigurationId` | path | string | Yes |  |

### Example

```bash
curl -X POST \
  -H "Authorization: Bearer $TOKEN" \
  "https://api.vercel.com/v1/installations/{integrationConfigurationId}/billing/balance"
```

---

## PUT /v1/installations/{integrationConfigurationId}/products/{integrationProductIdOrSlug}/resources/{resourceId}/secrets

**Update Resource Secrets (Deprecated)**

This endpoint is deprecated and replaced with the endpoint [Update Resource Secrets](#update-resource-secrets). <br/> This endpoint updates the secrets of a resource. If a resource has projects connected, the connected secrets are updated with the new secrets. The old secrets may still be used by existing connected projects because they are not automatically redeployed. Redeployment is a manual action and must be completed by the user. All new project connections will use the new secrets.<br/> <br/> Use cases for this endpoint:<br/> <br/> - Resetting the credentials of a database in the partner. If the user requests the credentials to be updated in the partner’s application, the partner post the new set of secrets to Vercel, the user should redeploy their application and the expire the old credentials.<br/>

### Parameters

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| `integrationConfigurationId` | path | string | Yes |  |
| `integrationProductIdOrSlug` | path | string | Yes |  |
| `resourceId` | path | string | Yes |  |

### Example

```bash
curl -X PUT \
  -H "Authorization: Bearer $TOKEN" \
  "https://api.vercel.com/v1/installations/{integrationConfigurationId}/products/{integrationProductIdOrSlug}/resources/{resourceId}/secrets"
```

---

## PUT /v1/installations/{integrationConfigurationId}/resources/{resourceId}/secrets

**Update Resource Secrets**

This endpoint updates the secrets of a resource. If a resource has projects connected, the connected secrets are updated with the new secrets. The old secrets may still be used by existing connected projects because they are not automatically redeployed. Redeployment is a manual action and must be completed by the user. All new project connections will use the new secrets.<br/> <br/> Use cases for this endpoint:<br/> <br/> - Resetting the credentials of a database in the partner. If the user requests the credentials to be updated in the partner’s application, the partner post the new set of secrets to Vercel, the user should redeploy their application and the expire the old credentials.<br/>

### Parameters

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| `integrationConfigurationId` | path | string | Yes |  |
| `resourceId` | path | string | Yes |  |

### Example

```bash
curl -X PUT \
  -H "Authorization: Bearer $TOKEN" \
  "https://api.vercel.com/v1/installations/{integrationConfigurationId}/resources/{resourceId}/secrets"
```

---

## POST /v1/installations/{integrationConfigurationId}/resources/{resourceId}/experimentation/items

**Create one or multiple experimentation items**

Create one or multiple experimentation items

### Parameters

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| `integrationConfigurationId` | path | string | Yes |  |
| `resourceId` | path | string | Yes |  |

### Example

```bash
curl -X POST \
  -H "Authorization: Bearer $TOKEN" \
  "https://api.vercel.com/v1/installations/{integrationConfigurationId}/resources/{resourceId}/experimentation/items"
```

---

## PATCH /v1/installations/{integrationConfigurationId}/resources/{resourceId}/experimentation/items/{itemId}

**Patch an existing experimentation item**

Patch an existing experimentation item

### Parameters

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| `integrationConfigurationId` | path | string | Yes |  |
| `resourceId` | path | string | Yes |  |
| `itemId` | path | string | Yes |  |

### Example

```bash
curl -X PATCH \
  -H "Authorization: Bearer $TOKEN" \
  "https://api.vercel.com/v1/installations/{integrationConfigurationId}/resources/{resourceId}/experimentation/items/{itemId}"
```

---

## DELETE /v1/installations/{integrationConfigurationId}/resources/{resourceId}/experimentation/items/{itemId}

**Delete an existing experimentation item**

Delete an existing experimentation item

### Parameters

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| `integrationConfigurationId` | path | string | Yes |  |
| `resourceId` | path | string | Yes |  |
| `itemId` | path | string | Yes |  |

### Example

```bash
curl -X DELETE \
  -H "Authorization: Bearer $TOKEN" \
  "https://api.vercel.com/v1/installations/{integrationConfigurationId}/resources/{resourceId}/experimentation/items/{itemId}"
```

---

## HEAD /v1/installations/{integrationConfigurationId}/resources/{resourceId}/experimentation/edge-config

**Get the data of a user-provided Edge Config**

When the user enabled Edge Config syncing, then this endpoint can be used by the partner to fetch the contents of the Edge Config.

### Parameters

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| `integrationConfigurationId` | path | string | Yes |  |
| `resourceId` | path | string | Yes |  |

### Example

```bash
curl -X HEAD \
  -H "Authorization: Bearer $TOKEN" \
  "https://api.vercel.com/v1/installations/{integrationConfigurationId}/resources/{resourceId}/experimentation/edge-config"
```

---

## PUT /v1/installations/{integrationConfigurationId}/resources/{resourceId}/experimentation/edge-config

**Push data into a user-provided Edge Config**

When the user enabled Edge Config syncing, then this endpoint can be used by the partner to push their configuration data into the relevant Edge Config.

### Parameters

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| `integrationConfigurationId` | path | string | Yes |  |
| `resourceId` | path | string | Yes |  |

### Example

```bash
curl -X PUT \
  -H "Authorization: Bearer $TOKEN" \
  "https://api.vercel.com/v1/installations/{integrationConfigurationId}/resources/{resourceId}/experimentation/edge-config"
```

---
