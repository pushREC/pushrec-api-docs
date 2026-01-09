---
created: 2026-01-09
tags: [type/api-reference, api/plaid]
api_name: The Plaid API
category: plaid
endpoint_count: 321
---

# The Plaid API - Plaid

[[README|Back to Overview]]

---

## POST /asset_report/create

**Create an Asset Report**

The `/asset_report/create` endpoint initiates the process of creating an Asset Report, which can then be retrieved by passing the `asset_report_token` return value to the `/asset_report/get` or `/asset_report/pdf/get` endpoints.

The Asset Report takes some time to be created and is not available immediately after calling `/asset_report/create`. The exact amount of time to create the report will vary depending on how many days of history are requested and will typically range from a few seconds to about one minute. When the Asset Report is ready to be retrieved using `/asset_report/get` or `/asset_report/pdf/get`, Plaid will fire a `PRODUCT_READY` webhook. For full details of the webhook schema, see [Asset Report webhooks](https://plaid.com/docs/api/products/assets/#webhooks).

The `/asset_report/create` endpoint creates an Asset Report at a moment in time. Asset Reports are immutable. To get an updated Asset Report, use the `/asset_report/refresh` endpoint.

### Example

```bash
curl -X POST \
  -H "Authorization: Bearer $TOKEN" \
  "https://production.plaid.com/asset_report/create"
```

---

## POST /asset_report/get

**Retrieve an Asset Report**

The `/asset_report/get` endpoint retrieves the Asset Report in JSON format. Before calling `/asset_report/get`, you must first create the Asset Report using `/asset_report/create` (or filter an Asset Report using `/asset_report/filter`) and then wait for the [`PRODUCT_READY`](https://plaid.com/docs/api/products/assets/#product_ready) webhook to fire, indicating that the Report is ready to be retrieved.

By default, an Asset Report includes transaction descriptions as returned by the bank, as opposed to parsed and categorized by Plaid. You can also receive cleaned and categorized transactions, as well as additional insights like merchant name or location information. We call this an Asset Report with Insights. An Asset Report with Insights provides transaction category, location, and merchant information in addition to the transaction strings provided in a standard Asset Report. To retrieve an Asset Report with Insights, call `/asset_report/get` endpoint with `include_insights` set to `true`.

For latency-sensitive applications, you can optionally call `/asset_report/create` with `options.add_ons` set to `["fast_assets"]`. This will cause Plaid to create two versions of the Asset Report: one with only current and available balance and identity information, and then later on the complete Asset Report. You will receive separate webhooks for each version of the Asset Report.

### Example

```bash
curl -X POST \
  -H "Authorization: Bearer $TOKEN" \
  "https://production.plaid.com/asset_report/get"
```

---

## POST /asset_report/pdf/get

**Retrieve a PDF Asset Report**

The `/asset_report/pdf/get` endpoint retrieves the Asset Report in PDF format. Before calling `/asset_report/pdf/get`, you must first create the Asset Report using `/asset_report/create` (or filter an Asset Report using `/asset_report/filter`) and then wait for the [`PRODUCT_READY`](https://plaid.com/docs/api/products/assets/#product_ready) webhook to fire, indicating that the Report is ready to be retrieved.

The response to `/asset_report/pdf/get` is the PDF binary data. The `request_id`  is returned in the `Plaid-Request-ID` header.

[View a sample PDF Asset Report](https://plaid.com/documents/sample-asset-report.pdf).

### Example

```bash
curl -X POST \
  -H "Authorization: Bearer $TOKEN" \
  "https://production.plaid.com/asset_report/pdf/get"
```

---

## POST /asset_report/refresh

**Refresh an Asset Report**

An Asset Report is an immutable snapshot of a user's assets. In order to "refresh" an Asset Report you created previously, you can use the `/asset_report/refresh` endpoint to create a new Asset Report based on the old one, but with the most recent data available.

The new Asset Report will contain the same Items as the original Report, as well as the same filters applied by any call to `/asset_report/filter`. By default, the new Asset Report will also use the same parameters you submitted with your original `/asset_report/create` request, but the original `days_requested` value and the values of any parameters in the `options` object can be overridden with new values. To change these arguments, simply supply new values for them in your request to `/asset_report/refresh`. Submit an empty string ("") for any previously-populated fields you would like set as empty.

### Example

```bash
curl -X POST \
  -H "Authorization: Bearer $TOKEN" \
  "https://production.plaid.com/asset_report/refresh"
```

---

## POST /asset_report/filter

**Filter Asset Report**

By default, an Asset Report will contain all of the accounts on a given Item. In some cases, you may not want the Asset Report to contain all accounts. For example, you might have the end user choose which accounts are relevant in Link using the Account Select view, which you can enable in the dashboard. Or, you might always exclude certain account types or subtypes, which you can identify by using the `/accounts/get` endpoint. To narrow an Asset Report to only a subset of accounts, use the `/asset_report/filter` endpoint.

To exclude certain Accounts from an Asset Report, first use the `/asset_report/create` endpoint to create the report, then send the `asset_report_token` along with a list of `account_ids` to exclude to the `/asset_report/filter` endpoint, to create a new Asset Report which contains only a subset of the original Asset Report's data.

Because Asset Reports are immutable, calling `/asset_report/filter` does not alter the original Asset Report in any way; rather, `/asset_report/filter` creates a new Asset Report with a new token and id. Asset Reports created via `/asset_report/filter` do not contain new Asset data, and are not billed.

Plaid will fire a [`PRODUCT_READY`](https://plaid.com/docs/api/products/assets/#product_ready) webhook once generation of the filtered Asset Report has completed.

### Example

```bash
curl -X POST \
  -H "Authorization: Bearer $TOKEN" \
  "https://production.plaid.com/asset_report/filter"
```

---

## POST /asset_report/remove

**Delete an Asset Report**

The `/item/remove` endpoint allows you to invalidate an `access_token`, meaning you will not be able to create new Asset Reports with it. Removing an Item does not affect any Asset Reports or Audit Copies you have already created, which will remain accessible until you remove them specifically.

The `/asset_report/remove` endpoint allows you to remove access to an Asset Report. Removing an Asset Report invalidates its `asset_report_token`, meaning you will no longer be able to use it to access Report data or create new Audit Copies. Removing an Asset Report does not affect the underlying Items, but does invalidate any `audit_copy_tokens` associated with the Asset Report.

### Example

```bash
curl -X POST \
  -H "Authorization: Bearer $TOKEN" \
  "https://production.plaid.com/asset_report/remove"
```

---

## POST /asset_report/audit_copy/create

**Create Asset Report Audit Copy**

Plaid can provide an Audit Copy of any Asset Report directly to a participating third party on your behalf. For example, Plaid can supply an Audit Copy directly to Fannie Mae on your behalf if you participate in the Day 1 Certainty™ program. An Audit Copy contains the same underlying data as the Asset Report.

To grant access to an Audit Copy, use the `/asset_report/audit_copy/create` endpoint to create an `audit_copy_token` and then pass that token to the third party who needs access. Each third party has its own `auditor_id`, for example `fannie_mae`. You’ll need to create a separate Audit Copy for each third party to whom you want to grant access to the Report.

### Example

```bash
curl -X POST \
  -H "Authorization: Bearer $TOKEN" \
  "https://production.plaid.com/asset_report/audit_copy/create"
```

---

## POST /asset_report/audit_copy/get

**Retrieve an Asset Report Audit Copy**

`/asset_report/audit_copy/get` allows auditors to get a copy of an Asset Report that was previously shared via the `/asset_report/audit_copy/create` endpoint.  The caller of `/asset_report/audit_copy/create` must provide the `audit_copy_token` to the auditor.  This token can then be used to call `/asset_report/audit_copy/create`.

### Example

```bash
curl -X POST \
  -H "Authorization: Bearer $TOKEN" \
  "https://production.plaid.com/asset_report/audit_copy/get"
```

---

## POST /asset_report/audit_copy/pdf/get

**Retrieve a PDF Asset Report Audit Copy**

The `/asset_report/audit_copy/pdf/get` endpoint retrieves an Asset Report Audit Copy in PDF format. The caller must provide the `audit_copy_token` that was shared via the `/asset_report/audit_copy/create` endpoint.

The response to `/asset_report/audit_copy/pdf/get` is the PDF binary data. The `request_id` is returned in the `Plaid-Request-ID` header.

[View a sample PDF Asset Report](https://plaid.com/documents/sample-asset-report.pdf).

### Example

```bash
curl -X POST \
  -H "Authorization: Bearer $TOKEN" \
  "https://production.plaid.com/asset_report/audit_copy/pdf/get"
```

---

## POST /asset_report/audit_copy/remove

**Remove Asset Report Audit Copy**

The `/asset_report/audit_copy/remove` endpoint allows you to remove an Audit Copy. Removing an Audit Copy invalidates the `audit_copy_token` associated with it, meaning both you and any third parties holding the token will no longer be able to use it to access Report data. Items associated with the Asset Report, the Asset Report itself and other Audit Copies of it are not affected and will remain accessible after removing the given Audit Copy.

### Example

```bash
curl -X POST \
  -H "Authorization: Bearer $TOKEN" \
  "https://production.plaid.com/asset_report/audit_copy/remove"
```

---

## POST /cra/monitoring_insights/subscribe

**Subscribe to Monitoring Insights**

This endpoint allows you to subscribe to insights for a user's linked CRA items, which are updated between one and four times per day (best-effort).

### Example

```bash
curl -X POST \
  -H "Authorization: Bearer $TOKEN" \
  "https://production.plaid.com/cra/monitoring_insights/subscribe"
```

---

## POST /cra/monitoring_insights/unsubscribe

**Unsubscribe from Monitoring Insights**

This endpoint allows you to unsubscribe from previously subscribed Monitoring Insights.

### Example

```bash
curl -X POST \
  -H "Authorization: Bearer $TOKEN" \
  "https://production.plaid.com/cra/monitoring_insights/unsubscribe"
```

---

## POST /cra/monitoring_insights/get

**Retrieve a Monitoring Insights Report**

This endpoint allows you to retrieve a Cash Flow Updates report by passing in the `user_id` referred to in the webhook you received.

### Example

```bash
curl -X POST \
  -H "Authorization: Bearer $TOKEN" \
  "https://production.plaid.com/cra/monitoring_insights/get"
```

---

## POST /credit/audit_copy_token/update

**Update an Audit Copy Token**

The `/credit/audit_copy_token/update` endpoint updates an existing  Audit Copy Token by adding the report tokens in the `report_tokens` field to the `audit_copy_token`. If the Audit Copy Token already contains a report of a certain type, it will be replaced with the token provided in the `report_tokens` field.

### Example

```bash
curl -X POST \
  -H "Authorization: Bearer $TOKEN" \
  "https://production.plaid.com/credit/audit_copy_token/update"
```

---

## POST /cra/partner_insights/get

**Retrieve cash flow insights from the bank accounts used for income verification**

`/cra/partner_insights/get` returns cash flow insights for a specified user.

### Example

```bash
curl -X POST \
  -H "Authorization: Bearer $TOKEN" \
  "https://production.plaid.com/cra/partner_insights/get"
```

---

## POST /cra/check_report/income_insights/get

**Retrieve cash flow information from your user's banks**

This endpoint allows you to retrieve the Income Insights report for your user. You should call this endpoint after you've received a `CHECK_REPORT_READY` or a `USER_CHECK_REPORT_READY` webhook, either after the Link session for the user or after calling `/cra/check_report/create`. If the most recent consumer report for the user doesn’t have sufficient data to generate the base report, or the consumer report has expired, you will receive an error indicating that you should create a new consumer report by calling `/cra/check_report/create`.

### Example

```bash
curl -X POST \
  -H "Authorization: Bearer $TOKEN" \
  "https://production.plaid.com/cra/check_report/income_insights/get"
```

---

## POST /cra/check_report/base_report/get

**Retrieve a Base Report**

This endpoint allows you to retrieve the Base Report for your user, allowing you to receive comprehensive bank account and cash flow data. You should call this endpoint after you've received a `CHECK_REPORT_READY` or a `USER_CHECK_REPORT_READY` webhook, either after the Link session for the user or after calling `/cra/check_report/create`. If the most recent consumer report for the user doesn't have sufficient data to generate the base report, or the consumer report has expired, you will receive an error indicating that you should create a new consumer report by calling `/cra/check_report/create`.

### Example

```bash
curl -X POST \
  -H "Authorization: Bearer $TOKEN" \
  "https://production.plaid.com/cra/check_report/base_report/get"
```

---

## POST /cra/check_report/pdf/get

**Retrieve Consumer Reports as a PDF**

`/cra/check_report/pdf/get` retrieves the most recent Consumer Report in PDF format. By default, the most recent Base Report (if it exists) for the user will be returned. To request that the most recent Partner Insights or Income Insights report be included in the PDF as well, use the `add-ons` field.

### Example

```bash
curl -X POST \
  -H "Authorization: Bearer $TOKEN" \
  "https://production.plaid.com/cra/check_report/pdf/get"
```

---

## POST /cra/check_report/create

**Refresh or create a Consumer Report**

The primary purpose of `/cra/check_report/create` is to refresh data in an existing report. A Consumer Report will last for 24 hours before expiring; you should call any `/get` endpoints on the report before it expires. If a report expires, you can call `/cra/check_report/create` again to re-generate it and refresh the data in the report.

`/cra/check_report/create` can also be used to create a new report if `consumer_report_permissible_purpose` was omitted during Link token creation. However, using the endpoint in this way is not recommended. Instead, `consumer_report_permissible_purpose` should always be specified when calling `/link/token/create` for Plaid CRA products; this will reduce latency and simplify the integration process. If you provide a `consumer_report_permissible_purpose` during Link token creation, then Plaid Check will automatically begin creating a Consumer Report once the user completes the Link process, and it is not necessary to call `/cra/check_report/create` before retrieving the report.

### Example

```bash
curl -X POST \
  -H "Authorization: Bearer $TOKEN" \
  "https://production.plaid.com/cra/check_report/create"
```

---

## POST /cra/check_report/partner_insights/get

**Retrieve cash flow insights from partners**

This endpoint allows you to retrieve the Partner Insights report for your user. You should call this endpoint after you've received a `CHECK_REPORT_READY` or a `USER_CHECK_REPORT_READY` webhook, either after the Link session for the user or after calling `/cra/check_report/create`. If the most recent consumer report for the user doesn’t have sufficient data to generate the base report, or the consumer report has expired, you will receive an error indicating that you should create a new consumer report by calling `/cra/check_report/create`.

If you did not initialize Link with the `credit_partner_insights` product or have generated a report using `/cra/check_report/create`, we will call our partners to generate the insights when you call this endpoint. In this case, you may optionally provide parameters under `options` to configure which insights you want to receive.

### Example

```bash
curl -X POST \
  -H "Authorization: Bearer $TOKEN" \
  "https://production.plaid.com/cra/check_report/partner_insights/get"
```

---

## POST /cra/check_report/cashflow_insights/get

**Retrieve cash flow insights from your user's banking data**

This endpoint allows you to retrieve the Cashflow Insights report for your user. You should call this endpoint after you've received a `CHECK_REPORT_READY` or a `USER_CHECK_REPORT_READY` webhook, either after the Link session for the user or after calling `/cra/check_report/create`. If the most recent consumer report for the user doesn’t have sufficient data to generate the insights, or the consumer report has expired, you will receive an error indicating that you should create a new consumer report by calling `/cra/check_report/create`.

If you did not initialize Link with the `cra_cashflow_insights` product or have generated a report using `/cra/check_report/create`, we will generate the insights when you call this endpoint. In this case, you may optionally provide parameters under `options` to configure which insights you want to receive.

### Example

```bash
curl -X POST \
  -H "Authorization: Bearer $TOKEN" \
  "https://production.plaid.com/cra/check_report/cashflow_insights/get"
```

---

## POST /cra/check_report/lend_score/get

**Retrieve the LendScore from your user's banking data**

This endpoint allows you to retrieve the LendScore report for your user. You should call this endpoint after you've received a `CHECK_REPORT_READY` or a `USER_CHECK_REPORT_READY` webhook, either after the Link session for the user or after calling `/cra/check_report/create`. If the most recent consumer report for the user doesn’t have sufficient data to generate the insights, or the consumer report has expired, you will receive an error indicating that you should create a new consumer report by calling `/cra/check_report/create`.

If you did not initialize Link with the `cra_lend_score` product or call `/cra/check_report/create` with the `cra_lend_score` product, Plaid will generate the insights when you call this endpoint. In this case, you may optionally provide parameters under `options` to configure which insights you want to receive.

### Example

```bash
curl -X POST \
  -H "Authorization: Bearer $TOKEN" \
  "https://production.plaid.com/cra/check_report/lend_score/get"
```

---

## POST /cra/check_report/network_insights/get

**Retrieve network attributes for the user**

This endpoint allows you to retrieve the Network Insights product for your user. You should call this endpoint after you've received a `CHECK_REPORT_READY` or a `USER_CHECK_REPORT_READY` webhook, either after the Link session for the user or after calling `/cra/check_report/create`. If the most recent consumer report for the user doesn’t have sufficient data to generate the report, or the consumer report has expired, you will receive an error indicating that you should create a new consumer report by calling `/cra/check_report/create`.

If you did not initialize Link with the `cra_network_attributes` product or have generated a report using `/cra/check_report/create`, Plaid will generate the attributes when you call this endpoint.

### Example

```bash
curl -X POST \
  -H "Authorization: Bearer $TOKEN" \
  "https://production.plaid.com/cra/check_report/network_insights/get"
```

---

## POST /cra/check_report/verification/get

**Retrieve various verification reports for a user.**

This endpoint allows you to retrieve verification reports for a user. To obtain a VoA or Employment Refresh report, you need to make sure that `cra_base_report` is included in the `products` parameter when calling `/link/token/create` or `/cra/check_report/create`. 

You should call this endpoint after you've received a `CHECK_REPORT_READY` or a `USER_CHECK_REPORT_READY` webhook, either after the Link session for the user or after calling `/cra/check_report/create`.

If the most recent consumer report for the user doesn’t have sufficient data to generate the report, or the consumer report has expired, you will receive an error indicating that you should create a new consumer report by calling `/cra/check_report/create`."

### Example

```bash
curl -X POST \
  -H "Authorization: Bearer $TOKEN" \
  "https://production.plaid.com/cra/check_report/verification/get"
```

---

## POST /cra/check_report/verification/pdf/get

**Retrieve Consumer Reports as a Verification PDF**

The `/cra/check_report/verification/pdf/get` endpoint retrieves the most recent Consumer Report in PDF format,
specifically formatted for Home Lending verification use cases. Before calling this endpoint, ensure that you've created a
VOA report through Link or the `/cra/check_report/create` endpoint, and have received a `CHECK_REPORT_READY` or a `USER_CHECK_REPORT_READY` webhook.

The response to `/cra/check_report/verification/pdf/get` is the PDF binary data. The `request_id`  is returned in the `Plaid-Request-ID` header.

### Example

```bash
curl -X POST \
  -H "Authorization: Bearer $TOKEN" \
  "https://production.plaid.com/cra/check_report/verification/pdf/get"
```

---

## POST /cra/loans/applications/register

**Register loan applications and decisions.**

`/cra/loans/applications/register` registers loan applications and decisions.

### Example

```bash
curl -X POST \
  -H "Authorization: Bearer $TOKEN" \
  "https://production.plaid.com/cra/loans/applications/register"
```

---

## POST /cra/loans/register

**Register a list of loans to their applicants.**

`/cra/loans/register` registers a list of loans to their applicants.

### Example

```bash
curl -X POST \
  -H "Authorization: Bearer $TOKEN" \
  "https://production.plaid.com/cra/loans/register"
```

---

## POST /cra/loans/update

**Updates loan data.**

`/cra/loans/update` updates loan information such as the status and payment history.

### Example

```bash
curl -X POST \
  -H "Authorization: Bearer $TOKEN" \
  "https://production.plaid.com/cra/loans/update"
```

---

## POST /cra/loans/unregister

**Unregister a list of loans.**

`/cra/loans/unregister` indicates the loans have reached a final status and no further updates are expected.

### Example

```bash
curl -X POST \
  -H "Authorization: Bearer $TOKEN" \
  "https://production.plaid.com/cra/loans/unregister"
```

---

## POST /consumer_report/pdf/get

**Retrieve a PDF Reports**

Retrieves all existing CRB Bank Income and Base reports for the consumer in PDF format.

Response is PDF binary data. The `request_id` is returned in the `Plaid-Request-ID` header.

### Example

```bash
curl -X POST \
  -H "Authorization: Bearer $TOKEN" \
  "https://production.plaid.com/consumer_report/pdf/get"
```

---

## POST /oauth/token

**Create or refresh an OAuth access token**

`/oauth/token` issues an access token and refresh token depending on the `grant_type` provided. This endpoint supports `Content-Type: application/x-www-form-urlencoded` as well as JSON. The fields for the form are equivalent to the fields for JSON and conform to the OAuth 2.0 specification.

### Example

```bash
curl -X POST \
  -H "Authorization: Bearer $TOKEN" \
  "https://production.plaid.com/oauth/token"
```

---

## POST /oauth/introspect

**Get metadata about an OAuth token**

`/oauth/introspect` returns metadata about an access token or refresh token.

Note: This endpoint supports `Content-Type: application/x-www-form-urlencoded` as well as JSON. The fields for the form are equivalent to the fields for JSON and conform to the OAuth 2.0 specification.

### Example

```bash
curl -X POST \
  -H "Authorization: Bearer $TOKEN" \
  "https://production.plaid.com/oauth/introspect"
```

---

## POST /oauth/revoke

**Revoke an OAuth token**

`/oauth/revoke` revokes an access or refresh token, preventing any further use. If a refresh token is revoked, all access and refresh tokens derived from it are also revoked, including exchanged tokens.

Note: This endpoint supports `Content-Type: application/x-www-form-urlencoded` as well as JSON. The fields for the form are equivalent to the fields for JSON and conform to the OAuth 2.0 specification.

### Example

```bash
curl -X POST \
  -H "Authorization: Bearer $TOKEN" \
  "https://production.plaid.com/oauth/revoke"
```

---

## POST /statements/list

**Retrieve a list of all statements associated with an item.**

The `/statements/list` endpoint retrieves a list of all statements associated with an item.

### Example

```bash
curl -X POST \
  -H "Authorization: Bearer $TOKEN" \
  "https://production.plaid.com/statements/list"
```

---

## POST /statements/download

**Retrieve a single statement.**

The `/statements/download` endpoint retrieves a single statement PDF in binary format.  The response will contain a `Plaid-Content-Hash` header containing a SHA 256 checksum of the statement. This can be used to verify that the file being sent by Plaid is the same file that was downloaded to your system.

### Example

```bash
curl -X POST \
  -H "Authorization: Bearer $TOKEN" \
  "https://production.plaid.com/statements/download"
```

---

## POST /statements/refresh

**Refresh statements data.**

`/statements/refresh` initiates an on-demand extraction to fetch the statements for the provided dates.

### Example

```bash
curl -X POST \
  -H "Authorization: Bearer $TOKEN" \
  "https://production.plaid.com/statements/refresh"
```

---

## POST /consent/events/get

**List a historical log of item consent events**

List a historical log of Item consent events. Consent logs are only available for events occurring on or after November 7, 2024. Extremely recent events (occurring within the past 12 hours) may not be available via this endpoint. Up to three years of consent logs will be available via the endpoint.

### Example

```bash
curl -X POST \
  -H "Authorization: Bearer $TOKEN" \
  "https://production.plaid.com/consent/events/get"
```

---

## POST /item/activity/list

**List a historical log of user consent events**

List a historical log of user consent events

### Example

```bash
curl -X POST \
  -H "Authorization: Bearer $TOKEN" \
  "https://production.plaid.com/item/activity/list"
```

---

## POST /item/application/list

**List a user’s connected applications**

List a user’s connected applications

### Example

```bash
curl -X POST \
  -H "Authorization: Bearer $TOKEN" \
  "https://production.plaid.com/item/application/list"
```

---

## POST /item/application/unlink

**Unlink a user’s connected application**

Unlink a user’s connected application. On an unlink request, Plaid will immediately revoke the Application’s access to the User’s data.  The User will have to redo the OAuth authentication process in order to restore functionality.

This endpoint only removes ongoing data access permissions, therefore the User will need to reach out to the Application itself in order to disable and delete their account and delete any data that the Application already received (if the Application does not do so by default).

This endpoint should be called in real time as the User is unlinking an Application, and should not be batched in order to ensure that the change is reflected as soon as possible.

### Example

```bash
curl -X POST \
  -H "Authorization: Bearer $TOKEN" \
  "https://production.plaid.com/item/application/unlink"
```

---

## POST /item/application/scopes/update

**Update the scopes of access for a particular application**

Enable consumers to update product access on selected accounts for an application.

### Example

```bash
curl -X POST \
  -H "Authorization: Bearer $TOKEN" \
  "https://production.plaid.com/item/application/scopes/update"
```

---

## POST /application/get

**Retrieve information about a Plaid application**

Allows financial institutions to retrieve information about Plaid clients for the purpose of building control-tower experiences

### Example

```bash
curl -X POST \
  -H "Authorization: Bearer $TOKEN" \
  "https://production.plaid.com/application/get"
```

---

## POST /item/get

**Retrieve an Item**

Returns information about the status of an Item.

### Example

```bash
curl -X POST \
  -H "Authorization: Bearer $TOKEN" \
  "https://production.plaid.com/item/get"
```

---

## POST /user_account/session/get

**Retrieve User Account**

This endpoint returns user permissioned account data, including identity and Item access tokens, for use with [Plaid Layer](https://plaid.com/docs/layer). Note that end users are permitted to edit the prefilled identity data in the Link flow before sharing it with you; you should treat any identity data returned by this endpoint as user-submitted, unverified data. For a verification layer, you can add [Identity Verification](https://plaid.com/docs/identity-verification/) to your flow, or check the submitted identity data against bank account data from linked accounts using [Identity Match](https://plaid.com/docs/identity/#identity-match).

### Example

```bash
curl -X POST \
  -H "Authorization: Bearer $TOKEN" \
  "https://production.plaid.com/user_account/session/get"
```

---

## POST /profile/network_status/get

**Check a user's Plaid Network status**

The `/profile/network_status/get` endpoint can be used to check whether Plaid has a matching profile
for the user.

### Example

```bash
curl -X POST \
  -H "Authorization: Bearer $TOKEN" \
  "https://production.plaid.com/profile/network_status/get"
```

---

## POST /network/status/get

**Check a user's Plaid Network status**

The `/network/status/get` endpoint can be used to check whether Plaid has a matching profile for the user.
This is useful for determining if a user is eligible for a streamlined experience, such as Layer.

Note: it is strongly recommended to check for Layer eligibility in the frontend. `/network/status/get` should only be used for checking Layer eligibility if a frontend check is not possible for your use case.
For instructions on performing a frontend eligibility check, see the [Layer documentation](https://plaid.com/docs/layer/#integration-overview).

### Example

```bash
curl -X POST \
  -H "Authorization: Bearer $TOKEN" \
  "https://production.plaid.com/network/status/get"
```

---

## POST /auth/get

**Retrieve auth data**

The `/auth/get` endpoint returns the bank account and bank identification numbers (such as routing numbers, for US accounts) associated with an Item's checking, savings, and cash management accounts, along with high-level account data and balances when available.

Versioning note: In API version 2017-03-08, the schema of the `numbers` object returned by this endpoint is substantially different. For details, see [Plaid API versioning](https://plaid.com/docs/api/versioning/#version-2018-05-22).

### Example

```bash
curl -X POST \
  -H "Authorization: Bearer $TOKEN" \
  "https://production.plaid.com/auth/get"
```

---

## POST /auth/verify

**Verify auth data**

The `/auth/verify` endpoint verifies bank account numbers against Plaid's database via Database Auth.

### Example

```bash
curl -X POST \
  -H "Authorization: Bearer $TOKEN" \
  "https://production.plaid.com/auth/verify"
```

---

## POST /transactions/get

**Get transaction data**

Note: All new implementations are encouraged to use `/transactions/sync` rather than `/transactions/get`. `/transactions/sync` provides the same functionality as `/transactions/get` and improves developer ease-of-use for handling transactions updates.

The `/transactions/get` endpoint allows developers to receive user-authorized transaction data for credit, depository, and some loan-type accounts (only those with account subtype `student`; coverage may be limited). For transaction history from investments accounts, use the [Investments endpoint](https://plaid.com/docs/api/products/investments/) instead. Transaction data is standardized across financial institutions, and in many cases transactions are linked to a clean name, entity type, location, and category. Similarly, account data is standardized and returned with a clean name, number, balance, and other meta information where available.

Transactions are returned in reverse-chronological order, and the sequence of transaction ordering is stable and will not shift.  Transactions are not immutable and can also be removed altogether by the institution; a removed transaction will no longer appear in `/transactions/get`.  For more details, see [Pending and posted transactions](https://plaid.com/docs/transactions/transactions-data/#pending-and-posted-transactions).

Due to the potentially large number of transactions associated with an Item, results are paginated. Manipulate the `count` and `offset` parameters in conjunction with the `total_transactions` response body field to fetch all available transactions.

Data returned by `/transactions/get` will be the data available for the Item as of the most recent successful check for new transactions. Plaid typically checks for new data multiple times a day, but these checks may occur less frequently, such as once a day, depending on the institution. To find out when the Item was last updated, use the [Item Debugger](https://plaid.com/docs/account/activity/#troubleshooting-with-item-debugger) or call `/item/get`; the `item.status.transactions.last_successful_update` field will show the timestamp of the most recent successful update. To force Plaid to check for new transactions, you can use the `/transactions/refresh` endpoint.

Note that data may not be immediately available to `/transactions/get`. Plaid will begin to prepare transactions data upon Item link, if Link was initialized with `transactions`, or upon the first call to `/transactions/get`, if it wasn't. To be alerted when transaction data is ready to be fetched, listen for the [`INITIAL_UPDATE`](https://plaid.com/docs/api/products/transactions/#initial_update) and [`HISTORICAL_UPDATE`](https://plaid.com/docs/api/products/transactions/#historical_update) webhooks. If no transaction history is ready when `/transactions/get` is called, it will return a `PRODUCT_NOT_READY` error.

### Example

```bash
curl -X POST \
  -H "Authorization: Bearer $TOKEN" \
  "https://production.plaid.com/transactions/get"
```

---

## POST /transactions/refresh

**Refresh transaction data**

`/transactions/refresh` is an optional endpoint that initiates an on-demand extraction to fetch the newest transactions for an Item. The on-demand extraction takes place in addition to the periodic extractions that automatically occur one or more times per day for any Transactions-enabled Item. The Item must already have Transactions added as a product in order to call `/transactions/refresh`.

If changes to transactions are discovered after calling `/transactions/refresh`, Plaid will fire a webhook: for `/transactions/sync` users, [`SYNC_UPDATES_AVAILABLE`](https://plaid.com/docs/api/products/transactions/#sync_updates_available) will be fired if there are any transactions updated, added, or removed. For users of both `/transactions/sync` and `/transactions/get`, [`TRANSACTIONS_REMOVED`](https://plaid.com/docs/api/products/transactions/#transactions_removed) will be fired if any removed transactions are detected, and [`DEFAULT_UPDATE`](https://plaid.com/docs/api/products/transactions/#default_update) will be fired if any new transactions are detected. New transactions can be fetched by calling `/transactions/get` or `/transactions/sync`.

Note that the `/transactions/refresh` endpoint is not supported for Capital One (`ins_128026`) non-depository accounts and will result in a `PRODUCTS_NOT_SUPPORTED` error if called on an Item that contains only non-depository accounts from that institution.

As this endpoint triggers a synchronous request for fresh data, latency may be higher than for other Plaid endpoints (typically less than 10 seconds, but occasionally up to 30 seconds or more); if you encounter errors, you may find it necessary to adjust your timeout period when making requests.

`/transactions/refresh` is offered as an optional add-on to Transactions and has a separate [fee model](https://plaid.com/docs/account/billing/#per-request-flat-fee). To request access to this endpoint, submit a [product access request](https://dashboard.plaid.com/team/products) or contact your Plaid account manager.

### Example

```bash
curl -X POST \
  -H "Authorization: Bearer $TOKEN" \
  "https://production.plaid.com/transactions/refresh"
```

---

## POST /sandbox/transactions/create

**Create sandbox transactions**

Use the `/sandbox/transactions/create` endpoint to create new transactions for an existing Item. This endpoint can be used to add up to 10 transactions to any Item at a time.

This endpoint can only be used with Items that were created in the Sandbox environment using the `user_transactions_dynamic` test user. You can use this to add transactions to test the `/transactions/get` and `/transactions/sync` endpoints.

### Example

```bash
curl -X POST \
  -H "Authorization: Bearer $TOKEN" \
  "https://production.plaid.com/sandbox/transactions/create"
```

---

## POST /cashflow_report/refresh

**Refresh transaction data in `cashflow_report`**

`/cashflow_report/refresh` is an endpoint that initiates an on-demand extraction to fetch the newest transactions for an item (given an `item_id`). The item must already have Cashflow Report added as a product in order to call `/cashflow_report/refresh`.

After calling `/cashflow_report/refresh`, Plaid will fire a webhook `CASHFLOW_REPORT_READY` alerting clients that new transactions data can then be ingested via `/cashflow_report/get` or the webhook will contain an error code informing there was an error in refreshing transactions data.

Note that the `/cashflow_report/refresh` endpoint is not supported for Capital One (`ins_128026`) non-depository accounts and will result in a `PRODUCTS_NOT_SUPPORTED` error if called on an Item that contains only non-depository accounts from that institution.

As this endpoint triggers a synchronous request for fresh data, latency may be higher than for other Plaid endpoints (typically less than 10 seconds, but up to 30 seconds or more). If you encounter errors, you may find it necessary to adjust your timeout period for requests.

### Example

```bash
curl -X POST \
  -H "Authorization: Bearer $TOKEN" \
  "https://production.plaid.com/cashflow_report/refresh"
```

---

## POST /cashflow_report/get

**Gets transaction data in `cashflow_report`**

The `/cashflow_report/get` endpoint retrieves transactions data associated with an item. Transactions data is standardized across financial institutions.
Transactions are returned in reverse-chronological order, and the sequence of transaction ordering is stable and will not shift. Transactions are not immutable and can also be removed altogether by the institution; a removed transaction will no longer appear in `/transactions/get`.  For more details, see [Pending and posted transactions](https://plaid.com/docs/transactions/transactions-data/#pending-and-posted-transactions).
Due to the potentially large number of transactions associated with an Item, results are paginated. Manipulate the `count` and `cursor` parameters in conjunction with the `has_more` response body field to fetch all available transactions.
Note that data isn't likely to be immediately available to `/cashflow_report/get`. Plaid will begin to prepare transactions data upon Item link, if Link was initialized with `cashflow_report`, or if it wasn't, upon the first call to `/cashflow_report/refresh`. To be alerted when transaction data is ready to be fetched, listen for the `CASHFLOW_REPORT_READY` webhook.

### Example

```bash
curl -X POST \
  -H "Authorization: Bearer $TOKEN" \
  "https://production.plaid.com/cashflow_report/get"
```

---

## POST /cashflow_report/transactions/get

**Gets transaction data in cashflow_report**

The `/cashflow_report/transactions/get` endpoint retrieves transactions data associated with an item. Transactions data is standardized across financial institutions.
Transactions are returned in reverse-chronological order, and the sequence of transaction ordering is stable and will not shift. Transactions are not immutable and can also be removed altogether by the institution; a removed transaction will no longer appear in `/transactions/get`.  For more details, see [Pending and posted transactions](https://plaid.com/docs/transactions/transactions-data/#pending-and-posted-transactions).
Due to the potentially large number of transactions associated with an Item, results are paginated. Manipulate the `count` and `cursor` parameters in conjunction with the `has_more` response body field to fetch all available transactions.
Note that data isn't likely to be immediately available to `/cashflow_report/transactions/get`. Plaid will begin to prepare transactions data upon Item link, if Link was initialized with `cashflow_report`, or if it wasn't, upon the first call to `/cashflow_report/refresh`. To be alerted when transaction data is ready to be fetched, listen for the `CASHFLOW_REPORT_READY` webhook.

### Example

```bash
curl -X POST \
  -H "Authorization: Bearer $TOKEN" \
  "https://production.plaid.com/cashflow_report/transactions/get"
```

---

## POST /cashflow_report/insights/get

**Gets insights data in Cashflow Report**

The `/cashflow_report/insights/get` endpoint retrieves insights data associated with an item. Insights are only calculated on credit and depository accounts.

### Example

```bash
curl -X POST \
  -H "Authorization: Bearer $TOKEN" \
  "https://production.plaid.com/cashflow_report/insights/get"
```

---

## POST /transactions/recurring/get

**Fetch recurring transaction streams**

The `/transactions/recurring/get` endpoint allows developers to receive a summary of the recurring outflow and inflow streams (expenses and deposits) from a user’s checking, savings or credit card accounts. Additionally, Plaid provides key insights about each recurring stream including the category, merchant, last amount, and more. Developers can use these insights to build tools and experiences that help their users better manage cash flow, monitor subscriptions, reduce spend, and stay on track with bill payments.

This endpoint is offered as an add-on to Transactions. To request access to this endpoint, submit a [product access request](https://dashboard.plaid.com/team/products) or contact your Plaid account manager.

This endpoint can only be called on an Item that has already been initialized with Transactions (either during Link, by specifying it in `/link/token/create`; or after Link, by calling `/transactions/get` or `/transactions/sync`).

When using Recurring Transactions, for best results, make sure to use the [`days_requested`](https://plaid.com/docs/api/link/#link-token-create-request-transactions-days-requested) parameter to request at least 180 days of history when initializing Items with Transactions. Once all historical transactions have been fetched, call `/transactions/recurring/get` to receive the Recurring Transactions streams and subscribe to the [`RECURRING_TRANSACTIONS_UPDATE`](https://plaid.com/docs/api/products/transactions/#recurring_transactions_update) webhook. To know when historical transactions have been fetched, if you are using `/transactions/sync` listen for the [`SYNC_UPDATES_AVAILABLE`](https://plaid.com/docs/api/products/transactions/#SyncUpdatesAvailableWebhook-historical-update-complete) webhook and check that the `historical_update_complete` field in the payload is `true`. If using `/transactions/get`, listen for the [`HISTORICAL_UPDATE`](https://plaid.com/docs/api/products/transactions/#historical_update) webhook.

After the initial call, you can call `/transactions/recurring/get` endpoint at any point in the future to retrieve the latest summary of recurring streams. Listen to the [`RECURRING_TRANSACTIONS_UPDATE`](https://plaid.com/docs/api/products/transactions/#recurring_transactions_update) webhook to be notified when new updates are available.

### Example

```bash
curl -X POST \
  -H "Authorization: Bearer $TOKEN" \
  "https://production.plaid.com/transactions/recurring/get"
```

---

## POST /transactions/sync

**Get incremental transaction updates on an Item**

The `/transactions/sync` endpoint retrieves transactions associated with an Item and can fetch updates using a cursor to track which updates have already been seen.

For important instructions on integrating with `/transactions/sync`, see the [Transactions integration overview](https://plaid.com/docs/transactions/#integration-overview). If you are migrating from an existing integration using `/transactions/get`, see the [Transactions Sync migration guide](https://plaid.com/docs/transactions/sync-migration/).

This endpoint supports `credit`, `depository`, and some `loan`-type accounts (only those with account subtype `student`). For `investments` accounts, use `/investments/transactions/get` instead.

When retrieving paginated updates, track both the `next_cursor` from the latest response and the original cursor from the first call in which `has_more` was `true`; if a call to `/transactions/sync` fails when retrieving a paginated update (e.g due to the [`TRANSACTIONS_SYNC_MUTATION_DURING_PAGINATION`](https://plaid.com/docs/errors/transactions/#transactions_sync_mutation_during_pagination) error), the entire pagination request loop must be restarted beginning with the cursor for the first page of the update, rather than retrying only the single request that failed.

If transactions data is not yet available for the Item, which can happen if the Item was not initialized with transactions during the `/link/token/create` call or if `/transactions/sync` was called within a few seconds of Item creation, `/transactions/sync` will return empty transactions arrays.

Plaid typically checks for new transactions data between one and four times per day, depending on the institution. To find out when transactions were last updated for an Item, use the [Item Debugger](https://plaid.com/docs/account/activity/#troubleshooting-with-item-debugger) or call `/item/get`; the `item.status.transactions.last_successful_update` field will show the timestamp of the most recent successful update. To force Plaid to check for new transactions, use the `/transactions/refresh` endpoint.

To be alerted when new transactions are available, listen for the [`SYNC_UPDATES_AVAILABLE`](https://plaid.com/docs/api/products/transactions/#sync_updates_available) webhook.

### Example

```bash
curl -X POST \
  -H "Authorization: Bearer $TOKEN" \
  "https://production.plaid.com/transactions/sync"
```

---

## POST /transactions/enrich

**Enrich locally-held transaction data**

The `/transactions/enrich` endpoint enriches raw transaction data generated by your own banking products or retrieved from other non-Plaid sources.

### Example

```bash
curl -X POST \
  -H "Authorization: Bearer $TOKEN" \
  "https://production.plaid.com/transactions/enrich"
```

---

## POST /user/transactions/refresh

**Refresh user items for Transactions bundle**

`/user/transactions/refresh` is an optional endpoint that initiates an on-demand extraction to fetch the newest transactions for a User using the Transactions bundle.
This bundle refreshes only the Transactions product data.
This endpoint is for clients who use the Transactions Insights bundle and want to proactively update all linked Items under a user.
The refresh may succeed or fail on a per-Item basis. Use the `results` array in the response to understand the outcome for each Item.

This endpoint is distinct from `/transactions/refresh`, which triggers a refresh for a single Item. Use `/user/transactions/refresh` to target all Items for a user instead.

### Example

```bash
curl -X POST \
  -H "Authorization: Bearer $TOKEN" \
  "https://production.plaid.com/user/transactions/refresh"
```

---

## POST /user/financial_data/refresh

**Refresh user items for Financial-Insights bundle**

`/user/financial_data/refresh` is an optional endpoint that initiates an on-demand extraction to fetch the newest transactions for a User using the Financial Insights bundle.
This bundle refreshes the Transactions, Investments, and Liabilities product data.
This endpoint is for clients who use the Transactions Insights bundle and want to proactively update all linked Items under a user.
The refresh may succeed or fail on a per-Item basis. Use the `results` array in the response to understand the outcome for each Item.

This endpoint is distinct from `/transactions/refresh`, which triggers a refresh for a single Item. Use `/user/financial_data/refresh` to target all Items for a user instead.

### Example

```bash
curl -X POST \
  -H "Authorization: Bearer $TOKEN" \
  "https://production.plaid.com/user/financial_data/refresh"
```

---

## POST /institutions/get

**Get details of all supported institutions**

Returns a JSON response containing details on all financial institutions currently supported by Plaid. Because Plaid supports thousands of institutions, results are paginated.

If there is no overlap between an institution’s enabled products and a client’s enabled products, then the institution will be filtered out from the response. As a result, the number of institutions returned may not match the count specified in the call.

### Example

```bash
curl -X POST \
  -H "Authorization: Bearer $TOKEN" \
  "https://production.plaid.com/institutions/get"
```

---

## POST /institutions/search

**Search institutions**

Returns a JSON response containing details for institutions that match the query parameters, up to a maximum of ten institutions per query.

Versioning note: API versions 2019-05-29 and earlier allow use of the `public_key` parameter instead of the `client_id` and `secret` parameters to authenticate to this endpoint. The `public_key` parameter has since been deprecated; all customers are encouraged to use `client_id` and `secret` instead.


### Example

```bash
curl -X POST \
  -H "Authorization: Bearer $TOKEN" \
  "https://production.plaid.com/institutions/search"
```

---

## POST /institutions/get_by_id

**Get details of an institution**

Returns a JSON response containing details on a specified financial institution currently supported by Plaid.

Versioning note: API versions 2019-05-29 and earlier allow use of the `public_key` parameter instead of the `client_id` and `secret` to authenticate to this endpoint. The `public_key` has been deprecated; all customers are encouraged to use `client_id` and `secret` instead.


### Example

```bash
curl -X POST \
  -H "Authorization: Bearer $TOKEN" \
  "https://production.plaid.com/institutions/get_by_id"
```

---

## POST /item/remove

**Remove an Item**

The `/item/remove` endpoint allows you to remove an Item. Once removed, the `access_token`, as well as any processor tokens or bank account tokens associated with the Item, is no longer valid and cannot be used to access any data that was associated with the Item.

Calling `/item/remove` is a recommended best practice when offboarding users or if a user chooses to disconnect an account linked via Plaid. For subscription products, such as Transactions, Liabilities, and Investments, calling `/item/remove` is required to end subscription billing for the Item, unless the end user revoked permission (e.g. via [https://my.plaid.com/](https://my.plaid.com/)). For more details, see [Subscription fee model](https://plaid.com/docs/account/billing/#subscription-fee).

In Limited Production, calling `/item/remove` does not impact the number of remaining Limited Production Items you have available.

Removing an Item does not affect any Asset Reports or Audit Copies you have already created, which will remain accessible until you remove access to them specifically using the `/asset_report/remove` endpoint.

Also note that for certain OAuth-based institutions, an Item removed via `/item/remove` may still show as an active connection in the institution's OAuth permission manager.

API versions 2019-05-29 and earlier return a `removed` boolean as part of the response.

### Example

```bash
curl -X POST \
  -H "Authorization: Bearer $TOKEN" \
  "https://production.plaid.com/item/remove"
```

---

## POST /accounts/get

**Retrieve accounts**

The `/accounts/get` endpoint can be used to retrieve a list of accounts associated with any linked Item. Plaid will only return active bank accounts — that is, accounts that are not closed and are capable of carrying a balance.
To return new accounts that were created after the user linked their Item, you can listen for the [`NEW_ACCOUNTS_AVAILABLE`](https://plaid.com/docs/api/items/#new_accounts_available) webhook and then use Link's [update mode](https://plaid.com/docs/link/update-mode/) to request that the user share this new account with you.

`/accounts/get` is free to use and retrieves cached information, rather than extracting fresh information from the institution. The balance returned will reflect the balance at the time of the last successful Item update. If the Item is enabled for a regularly updating product, such as Transactions, Investments, or Liabilities, the balance will typically update about once a day, as long as the Item is healthy. If the Item is enabled only for products that do not frequently update, such as Auth or Identity, balance data may be much older.

For realtime balance information, use the paid endpoints `/accounts/balance/get` or `/signal/evaluate` instead.

### Example

```bash
curl -X POST \
  -H "Authorization: Bearer $TOKEN" \
  "https://production.plaid.com/accounts/get"
```

---

## POST /categories/get

**(Deprecated) Get legacy categories**

Send a request to the `/categories/get` endpoint to get detailed information on legacy categories returned by Plaid. This endpoint does not require authentication.

All implementations are recommended to [use the newer `personal_finance_category` taxonomy](https://plaid.com/docs/transactions/pfc-migration/) instead of the legacy `category` taxonomy supported by this endpoint.

### Example

```bash
curl -X POST \
  -H "Authorization: Bearer $TOKEN" \
  "https://production.plaid.com/categories/get"
```

---

## POST /sandbox/processor_token/create

**Create a test Item and processor token**

Use the `/sandbox/processor_token/create` endpoint to create a valid `processor_token` for an arbitrary institution ID and test credentials. The created `processor_token` corresponds to a new Sandbox Item. You can then use this `processor_token` with the `/processor/` API endpoints in Sandbox. You can also use `/sandbox/processor_token/create` with the [`user_custom` test username](https://plaid.com/docs/sandbox/user-custom) to generate a test account with custom data.

### Example

```bash
curl -X POST \
  -H "Authorization: Bearer $TOKEN" \
  "https://production.plaid.com/sandbox/processor_token/create"
```

---

## POST /sandbox/public_token/create

**Create a test Item**

Use the `/sandbox/public_token/create` endpoint to create a valid `public_token`  for an arbitrary institution ID, initial products, and test credentials. The created `public_token` maps to a new Sandbox Item. You can then call `/item/public_token/exchange` to exchange the `public_token` for an `access_token` and perform all API actions. `/sandbox/public_token/create` can also be used with the [`user_custom` test username](https://plaid.com/docs/sandbox/user-custom) to generate a test account with custom data, or with Plaid's [pre-populated Sandbox test accounts](https://plaid.com/docs/sandbox/test-credentials/).

### Example

```bash
curl -X POST \
  -H "Authorization: Bearer $TOKEN" \
  "https://production.plaid.com/sandbox/public_token/create"
```

---

## POST /sandbox/item/fire_webhook

**Fire a test webhook**

The `/sandbox/item/fire_webhook` endpoint is used to test that code correctly handles webhooks. This endpoint can trigger the following webhooks:

`DEFAULT_UPDATE`: Webhook to be fired for a given Sandbox Item simulating a default update event for the respective product as specified with the `webhook_type` in the request body. Valid Sandbox `DEFAULT_UPDATE` webhook types include: `AUTH`, `IDENTITY`, `TRANSACTIONS`, `INVESTMENTS_TRANSACTIONS`, `LIABILITIES`, `HOLDINGS`. If the Item does not support the product, a `SANDBOX_PRODUCT_NOT_ENABLED` error will result.

`NEW_ACCOUNTS_AVAILABLE`: Fired to indicate that a new account is available on the Item and you can launch update mode to request access to it.

`SMS_MICRODEPOSITS_VERIFICATION`: Fired when a given same day micro-deposit item is verified via SMS verification.

`LOGIN_REPAIRED`: Fired when an Item recovers from the `ITEM_LOGIN_REQUIRED` without the user going through update mode in your app.

`PENDING_DISCONNECT`: Fired when an Item will stop working in the near future (e.g. due to a planned bank migration) and must be sent through update mode to continue working.

`RECURRING_TRANSACTIONS_UPDATE`: Recurring Transactions webhook to be fired for a given Sandbox Item. If the Item does not support Recurring Transactions, a `SANDBOX_PRODUCT_NOT_ENABLED` error will result.

`SYNC_UPDATES_AVAILABLE`: Transactions webhook to be fired for a given Sandbox Item.  If the Item does not support Transactions, a `SANDBOX_PRODUCT_NOT_ENABLED` error will result.

`PRODUCT_READY`: Assets webhook to be fired when a given asset report has been successfully generated. If the Item does not support Assets, a `SANDBOX_PRODUCT_NOT_ENABLED` error will result.

`ERROR`: Assets webhook to be fired when asset report generation has failed. If the Item does not support Assets, a `SANDBOX_PRODUCT_NOT_ENABLED` error will result.

`USER_PERMISSION_REVOKED`: Indicates an end user has revoked the permission that they previously granted to access an Item. May not always fire upon revocation, as some institutions’ consent portals do not trigger this webhook. Upon receiving this webhook, it is recommended to delete any stored data from Plaid associated with the account or Item.

`USER_ACCOUNT_REVOKED`: Fired when an end user has revoked access to their account on the Data Provider's portal. This webhook is currently sent only for PNC Items, but may be sent in the future for other financial institutions. Upon receiving this webhook, it is recommended to delete any stored data from Plaid associated with the account or Item.

Note that this endpoint is provided for developer ease-of-use and is not required for testing webhooks; webhooks will also fire in Sandbox under the same conditions that they would in Production (except for webhooks of type `TRANSFER`).

### Example

```bash
curl -X POST \
  -H "Authorization: Bearer $TOKEN" \
  "https://production.plaid.com/sandbox/item/fire_webhook"
```

---

## POST /accounts/balance/get

**Retrieve real-time balance data**

The `/accounts/balance/get` endpoint returns the real-time balance for each of an Item's accounts. While other endpoints, such as `/accounts/get`, return a balance object,  `/accounts/balance/get` forces the available and current balance fields to be refreshed rather than cached. This endpoint can be used for existing Items that were added via any of Plaid’s other products. This endpoint can be used as long as Link has been initialized with any other product, `balance` itself is not a product that can be used to initialize Link. As this endpoint triggers a synchronous request for fresh data, latency may be higher than for other Plaid endpoints (typically less than 10 seconds, but occasionally up to 30 seconds or more); if you encounter errors, you may find it necessary to adjust your timeout period when making requests.

Note: If you are getting real-time balance for the purpose of assessing the return risk of a proposed ACH transaction, it is recommended to use `/signal/evaluate` instead of `/accounts/balance/get`. `/signal/evaluate` returns the same real-time balance information and also provides access to Signal Rules, which provides no-code transaction business logic configuration, backtesting and recommendations for tuning your transaction acceptance logic, and the ability to easily switch between Balance and Signal Transaction Scores as needed for ultra-low-latency, ML-powered risk assessments. For more details, see the [Balance documentation](/docs/balance/#balance-integration-options).

### Example

```bash
curl -X POST \
  -H "Authorization: Bearer $TOKEN" \
  "https://production.plaid.com/accounts/balance/get"
```

---

## POST /identity/get

**Retrieve identity data**

The `/identity/get` endpoint allows you to retrieve various account holder information on file with the financial institution, including names, emails, phone numbers, and addresses. Only name data is guaranteed to be returned; other fields will be empty arrays if not provided by the institution.

Note: In API versions 2018-05-22 and earlier, the `owners` object is not returned, and instead identity information is returned in the top level `identity` object. For more details, see [Plaid API versioning](https://plaid.com/docs/api/versioning/#version-2019-05-29).

### Example

```bash
curl -X POST \
  -H "Authorization: Bearer $TOKEN" \
  "https://production.plaid.com/identity/get"
```

---

## POST /identity/documents/uploads/get

**Returns uploaded document identity**

Use `/identity/documents/uploads/get` to retrieve identity details when using [Identity Document Upload](https://plaid.com/docs/identity/identity-document-upload/).

### Example

```bash
curl -X POST \
  -H "Authorization: Bearer $TOKEN" \
  "https://production.plaid.com/identity/documents/uploads/get"
```

---

## POST /identity/match

**Retrieve identity match score**

The `/identity/match` endpoint generates a match score, which indicates how well the provided identity data matches the identity information on file with the account holder's financial institution.

Fields within the `balances` object will always be null when retrieved by `/identity/match`. Instead, use the free `/accounts/get` endpoint to request balance cached data, or `/accounts/balance/get` or `/signal/evaluate` for real-time data.

### Example

```bash
curl -X POST \
  -H "Authorization: Bearer $TOKEN" \
  "https://production.plaid.com/identity/match"
```

---

## POST /identity/refresh

**Refresh identity data**

`/identity/refresh` is an optional endpoint for users of the Identity product. It initiates an on-demand extraction to fetch the most up to date Identity information from the Financial Institution. This on-demand extraction takes place in addition to the periodic extractions that automatically occur for any Identity-enabled Item. If changes to Identity are discovered after calling `/identity/refresh`, Plaid will fire a webhook [`DEFAULT_UPDATE`](https://plaid.com/docs/api/products/identity/#default_update).

As this endpoint triggers a synchronous request for fresh data, latency may be higher than for other Plaid endpoints (typically less than 10 seconds, but occasionally up to 30 seconds or more); if you encounter errors, you may find it necessary to adjust your timeout period when making requests.

`/identity/refresh` is offered as an add-on to Identity and has a separate [fee model](https://plaid.com/docs/account/billing/#per-request-flat-fee). To request access to this endpoint, submit a [product access request](https://dashboard.plaid.com/team/products) or contact your Plaid account manager.

### Example

```bash
curl -X POST \
  -H "Authorization: Bearer $TOKEN" \
  "https://production.plaid.com/identity/refresh"
```

---

## POST /dashboard_user/get

**Retrieve a dashboard user**

The `/dashboard_user/get` endpoint provides details (such as email address) about a specific Dashboard user based on the `dashboard_user_id` field, which is returned in the `audit_trail` object of certain Monitor and Beacon endpoints. This can be used to identify the specific reviewer who performed a Dashboard action.

### Example

```bash
curl -X POST \
  -H "Authorization: Bearer $TOKEN" \
  "https://production.plaid.com/dashboard_user/get"
```

---

## POST /dashboard_user/list

**List dashboard users**

The `/dashboard_user/list` endpoint provides details (such as email address) all Dashboard users associated with your account. This can use used to audit or track the list of reviewers for Monitor, Beacon, and Identity Verification products.

### Example

```bash
curl -X POST \
  -H "Authorization: Bearer $TOKEN" \
  "https://production.plaid.com/dashboard_user/list"
```

---

## POST /identity_verification/create

**Create a new Identity Verification**

Create a new Identity Verification for the user specified by the `client_user_id` and/or `user_id` field. At least one of these two fields must be provided. The requirements and behavior of the verification are determined by the `template_id` provided. If `user_id` is provided, there must be an associated user otherwise an error will be returned.
If you don't know whether an active Identity Verification exists for a given `client_user_id` and/or `user_id`, you can specify `"is_idempotent": true` in the request body. With idempotency enabled, a new Identity Verification will only be created if one does not already exist for the associated `client_user_id` and/or `user_id`, and `template_id`. If an Identity Verification is found, it will be returned unmodified with a `200 OK` HTTP status code.
If `user_id` is not provided, you can also use this endpoint to supply information you already have collected about the user; if any of these fields are specified, the screens prompting the user to enter them will be skipped during the Link flow. If `user_id` is provided, user information can not be included in the request body. Please use the `/user/update` endpoint to update user data instead.


### Example

```bash
curl -X POST \
  -H "Authorization: Bearer $TOKEN" \
  "https://production.plaid.com/identity_verification/create"
```

---

## POST /identity_verification/get

**Retrieve Identity Verification**

Retrieve a previously created Identity Verification.

### Example

```bash
curl -X POST \
  -H "Authorization: Bearer $TOKEN" \
  "https://production.plaid.com/identity_verification/get"
```

---

## POST /identity_verification/list

**List Identity Verifications**

Filter and list Identity Verifications created by your account

### Example

```bash
curl -X POST \
  -H "Authorization: Bearer $TOKEN" \
  "https://production.plaid.com/identity_verification/list"
```

---

## POST /identity_verification/retry

**Retry an Identity Verification**

Allow a customer to retry their Identity Verification

### Example

```bash
curl -X POST \
  -H "Authorization: Bearer $TOKEN" \
  "https://production.plaid.com/identity_verification/retry"
```

---

## POST /watchlist_screening/entity/create

**Create a watchlist screening for an entity**

Create a new entity watchlist screening to check your customer against watchlists defined in the associated entity watchlist program. If your associated program has ongoing screening enabled, this is the profile information that will be used to monitor your customer over time.

### Example

```bash
curl -X POST \
  -H "Authorization: Bearer $TOKEN" \
  "https://production.plaid.com/watchlist_screening/entity/create"
```

---

## POST /watchlist_screening/entity/get

**Get an entity screening**

Retrieve an entity watchlist screening.

### Example

```bash
curl -X POST \
  -H "Authorization: Bearer $TOKEN" \
  "https://production.plaid.com/watchlist_screening/entity/get"
```

---

## POST /watchlist_screening/entity/history/list

**List history for entity watchlist screenings**

List all changes to the entity watchlist screening in reverse-chronological order. If the watchlist screening has not been edited, no history will be returned.

### Example

```bash
curl -X POST \
  -H "Authorization: Bearer $TOKEN" \
  "https://production.plaid.com/watchlist_screening/entity/history/list"
```

---

## POST /watchlist_screening/entity/hit/list

**List hits for entity watchlist screenings**

List all hits for the entity watchlist screening.

### Example

```bash
curl -X POST \
  -H "Authorization: Bearer $TOKEN" \
  "https://production.plaid.com/watchlist_screening/entity/hit/list"
```

---

## POST /watchlist_screening/entity/list

**List entity watchlist screenings**

List all entity screenings.

### Example

```bash
curl -X POST \
  -H "Authorization: Bearer $TOKEN" \
  "https://production.plaid.com/watchlist_screening/entity/list"
```

---

## POST /watchlist_screening/entity/program/get

**Get entity watchlist screening program**

Get an entity watchlist screening program

### Example

```bash
curl -X POST \
  -H "Authorization: Bearer $TOKEN" \
  "https://production.plaid.com/watchlist_screening/entity/program/get"
```

---

## POST /watchlist_screening/entity/program/list

**List entity watchlist screening programs**

List all entity watchlist screening programs

### Example

```bash
curl -X POST \
  -H "Authorization: Bearer $TOKEN" \
  "https://production.plaid.com/watchlist_screening/entity/program/list"
```

---

## POST /watchlist_screening/entity/review/create

**Create a review for an entity watchlist screening**

Create a review for an entity watchlist screening. Reviews are compliance reports created by users in your organization regarding the relevance of potential hits found by Plaid.

### Example

```bash
curl -X POST \
  -H "Authorization: Bearer $TOKEN" \
  "https://production.plaid.com/watchlist_screening/entity/review/create"
```

---

## POST /watchlist_screening/entity/review/list

**List reviews for entity watchlist screenings**

List all reviews for a particular entity watchlist screening. Reviews are compliance reports created by users in your organization regarding the relevance of potential hits found by Plaid.

### Example

```bash
curl -X POST \
  -H "Authorization: Bearer $TOKEN" \
  "https://production.plaid.com/watchlist_screening/entity/review/list"
```

---

## POST /watchlist_screening/entity/update

**Update an entity screening**

Update an entity watchlist screening.

### Example

```bash
curl -X POST \
  -H "Authorization: Bearer $TOKEN" \
  "https://production.plaid.com/watchlist_screening/entity/update"
```

---

## POST /watchlist_screening/individual/create

**Create a watchlist screening for a person**

Create a new Watchlist Screening to check your customer against watchlists defined in the associated Watchlist Program. If your associated program has ongoing screening enabled, this is the profile information that will be used to monitor your customer over time.

### Example

```bash
curl -X POST \
  -H "Authorization: Bearer $TOKEN" \
  "https://production.plaid.com/watchlist_screening/individual/create"
```

---

## POST /watchlist_screening/individual/get

**Retrieve an individual watchlist screening**

Retrieve a previously created individual watchlist screening

### Example

```bash
curl -X POST \
  -H "Authorization: Bearer $TOKEN" \
  "https://production.plaid.com/watchlist_screening/individual/get"
```

---

## POST /watchlist_screening/individual/history/list

**List history for individual watchlist screenings**

List all changes to the individual watchlist screening in reverse-chronological order. If the watchlist screening has not been edited, no history will be returned.

### Example

```bash
curl -X POST \
  -H "Authorization: Bearer $TOKEN" \
  "https://production.plaid.com/watchlist_screening/individual/history/list"
```

---

## POST /watchlist_screening/individual/hit/list

**List hits for individual watchlist screening**

List all hits found by Plaid for a particular individual watchlist screening.

### Example

```bash
curl -X POST \
  -H "Authorization: Bearer $TOKEN" \
  "https://production.plaid.com/watchlist_screening/individual/hit/list"
```

---

## POST /watchlist_screening/individual/list

**List Individual Watchlist Screenings**

List previously created watchlist screenings for individuals

### Example

```bash
curl -X POST \
  -H "Authorization: Bearer $TOKEN" \
  "https://production.plaid.com/watchlist_screening/individual/list"
```

---

## POST /watchlist_screening/individual/program/get

**Get individual watchlist screening program**

Get an individual watchlist screening program

### Example

```bash
curl -X POST \
  -H "Authorization: Bearer $TOKEN" \
  "https://production.plaid.com/watchlist_screening/individual/program/get"
```

---

## POST /watchlist_screening/individual/program/list

**List individual watchlist screening programs**

List all individual watchlist screening programs

### Example

```bash
curl -X POST \
  -H "Authorization: Bearer $TOKEN" \
  "https://production.plaid.com/watchlist_screening/individual/program/list"
```

---

## POST /watchlist_screening/individual/review/create

**Create a review for an individual watchlist screening**

Create a review for the individual watchlist screening. Reviews are compliance reports created by users in your organization regarding the relevance of potential hits found by Plaid.

### Example

```bash
curl -X POST \
  -H "Authorization: Bearer $TOKEN" \
  "https://production.plaid.com/watchlist_screening/individual/review/create"
```

---

## POST /watchlist_screening/individual/review/list

**List reviews for individual watchlist screenings**

List all reviews for the individual watchlist screening.

### Example

```bash
curl -X POST \
  -H "Authorization: Bearer $TOKEN" \
  "https://production.plaid.com/watchlist_screening/individual/review/list"
```

---

## POST /watchlist_screening/individual/update

**Update individual watchlist screening**

Update a specific individual watchlist screening. This endpoint can be used to add additional customer information, correct outdated information, add a reference id, assign the individual to a reviewer, and update which program it is associated with. Please note that you may not update `search_terms` and `status` at the same time since editing `search_terms` may trigger an automatic `status` change.

### Example

```bash
curl -X POST \
  -H "Authorization: Bearer $TOKEN" \
  "https://production.plaid.com/watchlist_screening/individual/update"
```

---

## POST /beacon/account_risk/v1/evaluate

**Evaluate risk of a bank account**

Use `/beacon/account_risk/v1/evaluate` to get risk insights for a linked account.

### Example

```bash
curl -X POST \
  -H "Authorization: Bearer $TOKEN" \
  "https://production.plaid.com/beacon/account_risk/v1/evaluate"
```

---

## POST /beacon/user/create

**Create a Beacon User**

Create and scan a Beacon User against your Beacon Program, according to your program's settings.

When you submit a new user to `/beacon/user/create`, several checks are performed immediately:

  - The user's PII (provided within the `user` object) is searched against all other users within the Beacon Program you specified. If a match is found that violates your program's "Duplicate Information Filtering" settings, the user will be returned with a status of `pending_review`.

  - The user's PII is also searched against all fraud reports created by your organization across all of your Beacon Programs. If the user's data matches a fraud report that your team created, the user will be returned with a status of `rejected`.

  - Finally, the user's PII is searched against all fraud report shared with the Beacon Network by other companies. If a matching fraud report is found, the user will be returned with a `pending_review` status if your program has enabled automatic flagging based on network fraud.

### Example

```bash
curl -X POST \
  -H "Authorization: Bearer $TOKEN" \
  "https://production.plaid.com/beacon/user/create"
```

---

## POST /beacon/user/get

**Get a Beacon User**

Fetch a Beacon User.

The Beacon User is returned with all of their associated information and a `status` based on the Beacon Network duplicate record and fraud checks.


### Example

```bash
curl -X POST \
  -H "Authorization: Bearer $TOKEN" \
  "https://production.plaid.com/beacon/user/get"
```

---

## POST /beacon/user/review

**Review a Beacon User**

Update the status of a Beacon User.

When updating a Beacon User's status via this endpoint, Plaid validates that the status change is consistent with the related state for this Beacon User. Specifically, we will check:

1. Whether there are any associated Beacon Reports connected to the Beacon User, and
2. Whether there are any confirmed Beacon Report Syndications connected to the Beacon User.

When updating a Beacon User's status to `rejected`, we enforce that either a Beacon Report has been created for the Beacon User or a Beacon Report Syndication has been confirmed.
When updating a Beacon User's status to `cleared`, we enforce that there are no active Beacon Reports or confirmed Beacon Report Syndications associated with the user. If you previously created a Beacon Report for this user, you must delete it before updating the Beacon User's status to `cleared`.
There are no restrictions on updating a Beacon User's status to `pending_review`.

If these conditions are not met, the request will be rejected with an error explaining the issue.

### Example

```bash
curl -X POST \
  -H "Authorization: Bearer $TOKEN" \
  "https://production.plaid.com/beacon/user/review"
```

---

## POST /beacon/report/create

**Create a Beacon Report**

Create a fraud report for a given Beacon User.

### Example

```bash
curl -X POST \
  -H "Authorization: Bearer $TOKEN" \
  "https://production.plaid.com/beacon/report/create"
```

---

## POST /beacon/report/list

**List Beacon Reports for a Beacon User**

Use the `/beacon/report/list` endpoint to view all Beacon Reports you created for a specific Beacon User. The reports returned by this endpoint are exclusively reports you created for a specific user. A Beacon User can only have one active report at a time, but a new report can be created if a previous report has been deleted. The results from this endpoint are paginated; the `next_cursor` field will be populated if there is another page of results that can be retrieved. To fetch the next page, pass the `next_cursor` value as the `cursor` parameter in the next request.

### Example

```bash
curl -X POST \
  -H "Authorization: Bearer $TOKEN" \
  "https://production.plaid.com/beacon/report/list"
```

---

## POST /beacon/report_syndication/list

**List Beacon Report Syndications for a Beacon User**

Use the `/beacon/report_syndication/list` endpoint to view all Beacon Reports that have been syndicated to a specific Beacon User. This endpoint returns Beacon Report Syndications which are references to Beacon Reports created either by you, or another Beacon customer, that matched the specified Beacon User. A Beacon User can have multiple active Beacon Report Syndications at once. The results from this endpoint are paginated; the `next_cursor` field will be populated if there is another page of results that can be retrieved. To fetch the next page, pass the `next_cursor` value as the `cursor` parameter in the next request.

### Example

```bash
curl -X POST \
  -H "Authorization: Bearer $TOKEN" \
  "https://production.plaid.com/beacon/report_syndication/list"
```

---

## POST /beacon/report/get

**Get a Beacon Report**

Returns a Beacon report for a given Beacon report id.

### Example

```bash
curl -X POST \
  -H "Authorization: Bearer $TOKEN" \
  "https://production.plaid.com/beacon/report/get"
```

---

## POST /beacon/report_syndication/get

**Get a Beacon Report Syndication**

Returns a Beacon Report Syndication for a given Beacon Report Syndication id.

### Example

```bash
curl -X POST \
  -H "Authorization: Bearer $TOKEN" \
  "https://production.plaid.com/beacon/report_syndication/get"
```

---

## POST /beacon/user/update

**Update the identity data of a Beacon User**

Update the identity data for a Beacon User in your Beacon Program or add new accounts to the Beacon User.

Similar to `/beacon/user/create`, several checks are performed immediately when you submit an identity data change to `/beacon/user/update`:

  - The user's updated PII is searched against all other users within the Beacon Program you specified. If a match is found that violates your program's "Duplicate Information Filtering" settings, the user will be returned with a status of `pending_review`.

  - The user's updated PII is also searched against all fraud reports created by your organization across all of your Beacon Programs. If the user's data matches a fraud report that your team created, the user will be returned with a status of `rejected`.

  - Finally, the user's PII is searched against all fraud report shared with the Beacon Network by other companies. If a matching fraud report is found, the user will be returned with a `pending_review` status if your program has enabled automatic flagging based on network fraud.

Plaid maintains a version history for each Beacon User, so the Beacon User's identity data before and after the update is retained as separate versions.

### Example

```bash
curl -X POST \
  -H "Authorization: Bearer $TOKEN" \
  "https://production.plaid.com/beacon/user/update"
```

---

## POST /beacon/duplicate/get

**Get a Beacon Duplicate**

Returns a Beacon Duplicate for a given Beacon Duplicate id.

A Beacon Duplicate represents a pair of similar Beacon Users within your organization.

Two Beacon User revisions are returned for each Duplicate record in either the `beacon_user1` or `beacon_user2` response fields.

The `analysis` field in the response indicates which fields matched between `beacon_user1` and `beacon_user2`.


### Example

```bash
curl -X POST \
  -H "Authorization: Bearer $TOKEN" \
  "https://production.plaid.com/beacon/duplicate/get"
```

---

## POST /identity_verification/autofill/create

**Create autofill for an Identity Verification**

Try to autofill an Identity Verification based of the provided phone number, date of birth and country of residence.

### Example

```bash
curl -X POST \
  -H "Authorization: Bearer $TOKEN" \
  "https://production.plaid.com/identity_verification/autofill/create"
```

---

## POST /beacon/user/history/list

**List a Beacon User's history**

List all changes to the Beacon User in reverse-chronological order.

### Example

```bash
curl -X POST \
  -H "Authorization: Bearer $TOKEN" \
  "https://production.plaid.com/beacon/user/history/list"
```

---

## POST /beacon/user/account_insights/get

**Get Account Insights for a Beacon User**

Get Account Insights for all Accounts linked to this Beacon User. The insights for each account are computed based on the information that was last retrieved from the financial institution.

### Example

```bash
curl -X POST \
  -H "Authorization: Bearer $TOKEN" \
  "https://production.plaid.com/beacon/user/account_insights/get"
```

---

## POST /protect/user/insights/get

**Get Protect user insights**

Use this endpoint to get basic information about a user as it relates to their fraud profile with Protect.

### Example

```bash
curl -X POST \
  -H "Authorization: Bearer $TOKEN" \
  "https://production.plaid.com/protect/user/insights/get"
```

---

## POST /protect/report/create

**Create a Protect report**

Use this endpoint to create a Protect report to document fraud incidents, investigation outcomes, or other risk events.
This endpoint allows you to report various types of incidents including account takeovers, identity fraud, unauthorized transactions, and other security events. 
The reported data helps improve fraud detection models and provides valuable feedback to enhance the overall security of the Plaid network.
Reports can be created for confirmed incidents that have been fully investigated, or for suspected incidents that require further review. 
You can associate reports with specific users, sessions, or transactions to provide comprehensive context about the incident.

### Example

```bash
curl -X POST \
  -H "Authorization: Bearer $TOKEN" \
  "https://production.plaid.com/protect/report/create"
```

---

## POST /protect/event/send

**Send a new event to enrich user data**

Send a new event to enrich user data and optionally get a Trust Index score for the event.

### Example

```bash
curl -X POST \
  -H "Authorization: Bearer $TOKEN" \
  "https://production.plaid.com/protect/event/send"
```

---

## POST /protect/event/get

**Get information about a user event**

Get information about a user event including Trust Index score and fraud attributes.

### Example

```bash
curl -X POST \
  -H "Authorization: Bearer $TOKEN" \
  "https://production.plaid.com/protect/event/get"
```

---

## POST /business_verification/get

**Get a business verification**

Retrieve the current state of a specific business verification.

### Example

```bash
curl -X POST \
  -H "Authorization: Bearer $TOKEN" \
  "https://production.plaid.com/business_verification/get"
```

---

## POST /business_verification/create

**Create a business verification**

Create a new business verification to check a business's identity and risk profile.

### Example

```bash
curl -X POST \
  -H "Authorization: Bearer $TOKEN" \
  "https://production.plaid.com/business_verification/create"
```

---

## POST /processor/auth/get

**Retrieve Auth data**

The `/processor/auth/get` endpoint returns the bank account and bank identification number (such as the routing number, for US accounts), for a checking, savings, or cash management account that''s associated with a given `processor_token`. The endpoint also returns high-level account data and balances when available.

Versioning note: API versions 2019-05-29 and earlier use a different schema for the `numbers` object returned by this endpoint. For details, see [Plaid API versioning](https://plaid.com/docs/api/versioning/#version-2020-09-14).


### Example

```bash
curl -X POST \
  -H "Authorization: Bearer $TOKEN" \
  "https://production.plaid.com/processor/auth/get"
```

---

## POST /processor/account/get

**Retrieve the account associated with a processor token**

This endpoint returns the account associated with a given processor token.

This endpoint retrieves cached information, rather than extracting fresh information from the institution. As a result, the account balance returned may not be up-to-date; for realtime balance information, use `/processor/balance/get` instead. Note that some information is nullable.


### Example

```bash
curl -X POST \
  -H "Authorization: Bearer $TOKEN" \
  "https://production.plaid.com/processor/account/get"
```

---

## POST /processor/investments/holdings/get

**Retrieve Investment Holdings**

This endpoint returns the stock position data of the account associated with a given processor token.


### Example

```bash
curl -X POST \
  -H "Authorization: Bearer $TOKEN" \
  "https://production.plaid.com/processor/investments/holdings/get"
```

---

## POST /processor/investments/transactions/get

**Get investment transactions data**

The `/processor/investments/transactions/get` endpoint allows developers to retrieve up to 24 months of user-authorized transaction data for the investment account associated with the processor token.

Transactions are returned in reverse-chronological order, and the sequence of transaction ordering is stable and will not shift.

Due to the potentially large number of investment transactions associated with the account, results are paginated. Manipulate the count and offset parameters in conjunction with the `total_investment_transactions` response body field to fetch all available investment transactions.

Note that Investments does not have a webhook to indicate when initial transaction data has loaded (unless you use the `async_update` option). Instead, if transactions data is not ready when `/processor/investments/transactions/get` is first called, Plaid will wait for the data. For this reason, calling `/processor/investments/transactions/get` immediately after Link may take up to one to two minutes to return.

Data returned by the asynchronous investments extraction flow (when `async_update` is set to true) may not be immediately available to `/processor/investments/transactions/get`. To be alerted when the data is ready to be fetched, listen for the `HISTORICAL_UPDATE` webhook. If no investments history is ready when `/processor/investments/transactions/get` is called, it will return a `PRODUCT_NOT_READY` error.

To receive Investments Transactions webhooks for a processor token, set its webhook URL via the [`/processor/token/webhook/update`](https://plaid.com/docs/api/processor-partners/#processortokenwebhookupdate) endpoint.

### Example

```bash
curl -X POST \
  -H "Authorization: Bearer $TOKEN" \
  "https://production.plaid.com/processor/investments/transactions/get"
```

---

## POST /processor/transactions/get

**Get transaction data**

The `/processor/transactions/get` endpoint allows developers to receive user-authorized transaction data for credit, depository, and some loan-type accounts (only those with account subtype `student`; coverage may be limited). Transaction data is standardized across financial institutions, and in many cases transactions are linked to a clean name, entity type, location, and category. Similarly, account data is standardized and returned with a clean name, number, balance, and other meta information where available.

Transactions are returned in reverse-chronological order, and the sequence of transaction ordering is stable and will not shift.  Transactions are not immutable and can also be removed altogether by the institution; a removed transaction will no longer appear in `/processor/transactions/get`.  For more details, see [Pending and posted transactions](https://plaid.com/docs/transactions/transactions-data/#pending-and-posted-transactions).

Due to the potentially large number of transactions associated with a processor token, results are paginated. Manipulate the `count` and `offset` parameters in conjunction with the `total_transactions` response body field to fetch all available transactions.

Data returned by `/processor/transactions/get` will be the data available for the processor token as of the most recent successful check for new transactions. Plaid typically checks for new data multiple times a day, but these checks may occur less frequently, such as once a day, depending on the institution. To force Plaid to check for new transactions, you can use the `/processor/transactions/refresh` endpoint.

Note that data may not be immediately available to `/processor/transactions/get`. Plaid will begin to prepare transactions data upon Item link, if Link was initialized with `transactions`, or upon the first call to `/processor/transactions/get`, if it wasn't. If no transaction history is ready when `/processor/transactions/get` is called, it will return a `PRODUCT_NOT_READY` error.

To receive Transactions webhooks for a processor token, set its webhook URL via the [`/processor/token/webhook/update`](https://plaid.com/docs/api/processor-partners/#processortokenwebhookupdate) endpoint.

### Example

```bash
curl -X POST \
  -H "Authorization: Bearer $TOKEN" \
  "https://production.plaid.com/processor/transactions/get"
```

---

## POST /processor/transactions/sync

**Get incremental transaction updates on a processor token**


The `/processor/transactions/sync` endpoint retrieves transactions associated with an Item and can fetch updates using a cursor to track which updates have already been seen.

For important instructions on integrating with `/processor/transactions/sync`, see the [Transactions integration overview](https://plaid.com/docs/transactions/#integration-overview). If you are migrating from an existing integration using `/processor/transactions/get`, see the [Transactions Sync migration guide](https://plaid.com/docs/transactions/sync-migration/).

This endpoint supports `credit`, `depository`, and some `loan`-type accounts (only those with account subtype `student`). For `investments` accounts, use `/investments/transactions/get` instead.

When retrieving paginated updates, track both the `next_cursor` from the latest response and the original cursor from the first call in which `has_more` was `true`; if a call to `/processor/transactions/sync` fails when retrieving a paginated update (e.g due to the [`TRANSACTIONS_SYNC_MUTATION_DURING_PAGINATION`](https://plaid.com/docs/errors/transactions/#transactions_sync_mutation_during_pagination) error), the entire pagination request loop must be restarted beginning with the cursor for the first page of the update, rather than retrying only the single request that failed.

If transactions data is not yet available for the Item, which can happen if the Item was not initialized with transactions during the `/link/token/create` call or if `/processor/transactions/sync` was called within a few seconds of Item creation, `/processor/transactions/sync` will return empty transactions arrays.

Plaid typically checks for new transactions data between one and four times per day, depending on the institution. To find out when transactions were last updated for an Item, use the [Item Debugger](https://plaid.com/docs/account/activity/#troubleshooting-with-item-debugger) or call `/item/get`; the `item.status.transactions.last_successful_update` field will show the timestamp of the most recent successful update. To force Plaid to check for new transactions, use the `/processor/transactions/refresh` endpoint.

To be alerted when new transactions are available, listen for the [`SYNC_UPDATES_AVAILABLE`](https://plaid.com/docs/api/products/transactions/#sync_updates_available) webhook.

To receive Transactions webhooks for a processor token, set its webhook URL via the [`/processor/token/webhook/update`](https://plaid.com/docs/api/processor-partners/#processortokenwebhookupdate) endpoint.

### Example

```bash
curl -X POST \
  -H "Authorization: Bearer $TOKEN" \
  "https://production.plaid.com/processor/transactions/sync"
```

---

## POST /processor/transactions/refresh

**Refresh transaction data**

`/processor/transactions/refresh` is an optional endpoint for users of the Transactions product. It initiates an on-demand extraction to fetch the newest transactions for a processor token. This on-demand extraction takes place in addition to the periodic extractions that automatically occur one or more times per day for any Transactions-enabled processor token. If changes to transactions are discovered after calling `/processor/transactions/refresh`, Plaid will fire a webhook: for `/transactions/sync` users, [`SYNC_UPDATES_AVAILABLE`](https://plaid.com/docs/api/products/transactions/#sync_updates_available) will be fired if there are any transactions updated, added, or removed. For users of both `/processor/transactions/sync` and `/processor/transactions/get`, [`TRANSACTIONS_REMOVED`](https://plaid.com/docs/api/products/transactions/#transactions_removed) will be fired if any removed transactions are detected, and [`DEFAULT_UPDATE`](https://plaid.com/docs/api/products/transactions/#default_update) will be fired if any new transactions are detected. New transactions can be fetched by calling `/processor/transactions/get` or `/processor/transactions/sync`. Note that the `/transactions/refresh` endpoint is not supported for Capital One (`ins_128026`) non-depository accounts and will result in a `PRODUCTS_NOT_SUPPORTED` error if called on an Item that contains only non-depository accounts from that institution.

As this endpoint triggers a synchronous request for fresh data, latency may be higher than for other Plaid endpoints (typically less than 10 seconds, but occasionally up to 30 seconds or more); if you encounter errors, you may find it necessary to adjust your timeout period when making requests.

`/processor/transactions/refresh` is offered as an add-on to Transactions and has a separate [fee model](https://plaid.com/docs/account/billing/#per-request-flat-fee). To request access to this endpoint, submit a [product access request](https://dashboard.plaid.com/team/products) or contact your Plaid account manager.

### Example

```bash
curl -X POST \
  -H "Authorization: Bearer $TOKEN" \
  "https://production.plaid.com/processor/transactions/refresh"
```

---

## POST /processor/transactions/recurring/get

**Fetch recurring transaction streams**

The `/processor/transactions/recurring/get` endpoint allows developers to receive a summary of the recurring outflow and inflow streams (expenses and deposits) from a user’s checking, savings or credit card accounts. Additionally, Plaid provides key insights about each recurring stream including the category, merchant, last amount, and more. Developers can use these insights to build tools and experiences that help their users better manage cash flow, monitor subscriptions, reduce spend, and stay on track with bill payments.

This endpoint is offered as an add-on to Transactions. To request access to this endpoint, submit a [product access request](https://dashboard.plaid.com/team/products) or contact your Plaid account manager.

This endpoint can only be called on a processor token that has already been initialized with Transactions (either during Link, by specifying it in `/link/token/create`; or after Link, by calling `/processor/transactions/get` or `/processor/transactions/sync`). Once all historical transactions have been fetched, call `/processor/transactions/recurring/get` to receive the Recurring Transactions streams and subscribe to the [`RECURRING_TRANSACTIONS_UPDATE`](https://plaid.com/docs/api/products/transactions/#recurring_transactions_update) webhook. To know when historical transactions have been fetched, if you are using `/processor/transactions/sync` listen for the [`SYNC_UPDATES_AVAILABLE`](https://plaid.com/docs/api/products/transactions/#SyncUpdatesAvailableWebhook-historical-update-complete) webhook and check that the `historical_update_complete` field in the payload is `true`. If using `/processor/transactions/get`, listen for the [`HISTORICAL_UPDATE`](https://plaid.com/docs/api/products/transactions/#historical_update) webhook.

After the initial call, you can call `/processor/transactions/recurring/get` endpoint at any point in the future to retrieve the latest summary of recurring streams. Listen to the [`RECURRING_TRANSACTIONS_UPDATE`](https://plaid.com/docs/api/products/transactions/#recurring_transactions_update) webhook to be notified when new updates are available.

To receive Transactions webhooks for a processor token, set its webhook URL via the [`/processor/token/webhook/update`](https://plaid.com/docs/api/processor-partners/#processortokenwebhookupdate) endpoint.

### Example

```bash
curl -X POST \
  -H "Authorization: Bearer $TOKEN" \
  "https://production.plaid.com/processor/transactions/recurring/get"
```

---

## POST /processor/signal/evaluate

**Evaluate a planned ACH transaction**

Use `/signal/evaluate` to evaluate a planned ACH transaction to get a return risk assessment and additional risk signals.

`/signal/evaluate` is used with Rulesets that are configured on the end customer Dashboard can can be used with either the Signal Transaction Scores product or the Balance product. Which product is used will be determined by the `ruleset_key` that you provide. For more details, see [Signal Rules](https://plaid.com/docs/signal/signal-rules/).

Note: This request may have higher latency if Signal Transaction Scores is being added to an existing Item for the first time, or when using a Balance-only ruleset. This is because Plaid must communicate directly with the institution to request data. 

### Example

```bash
curl -X POST \
  -H "Authorization: Bearer $TOKEN" \
  "https://production.plaid.com/processor/signal/evaluate"
```

---

## POST /processor/signal/decision/report

**Report whether you initiated an ACH transaction**

After you call `/processor/signal/evaluate`, Plaid will normally infer the outcome from your Signal Rules. However, if you are not using Signal Rules, if the Signal Rules outcome was `REVIEW`, or if you take a different action than the one determined by the Signal Rules, you will need to call `/processor/signal/decision/report`. This helps improve Signal Transaction Score accuracy for your account and is necessary for proper functioning of the rule performance and rule tuning capabilities in the Dashboard. If your effective decision changes after calling `/processor/signal/decision/report` (for example, you indicated that you accepted a transaction, but later on, your payment processor rejected it, so it was never initiated), call `/processor/signal/decision/report` again for the transaction to correct Plaid's records.  

If you are using Plaid Transfer as your payment processor, you also do not need to call `/processor/signal/decision/report`, as Plaid can infer outcomes from your Transfer activity.

If using a Balance-only ruleset, this endpoint will not impact scores (Balance does not use scores), but is necessary to view accurate transaction outcomes and tune rule logic in the Dashboard.      

### Example

```bash
curl -X POST \
  -H "Authorization: Bearer $TOKEN" \
  "https://production.plaid.com/processor/signal/decision/report"
```

---

## POST /processor/signal/return/report

**Report a return for an ACH transaction**

Call the `/processor/signal/return/report` endpoint to report a returned transaction that was previously sent to the `/processor/signal/evaluate` endpoint. Your feedback will be used by the model to incorporate the latest risk trend in your portfolio.

If you are using the [Plaid Transfer product](https://plaid.com/docs/transfer) to create transfers, it is not necessary to use this endpoint, as Plaid already knows whether the transfer was returned.

### Example

```bash
curl -X POST \
  -H "Authorization: Bearer $TOKEN" \
  "https://production.plaid.com/processor/signal/return/report"
```

---

## POST /processor/signal/prepare

**Opt-in a processor token to Signal**

When a processor token is not initialized with `signal`, call `/processor/signal/prepare` to opt-in that processor token to the data collection process, which will improve the accuracy of the Signal Transaction Score.

If this endpoint is called with a processor token that is already initialized with `signal`, it will return a 200 response and will not modify the processor token.

### Example

```bash
curl -X POST \
  -H "Authorization: Bearer $TOKEN" \
  "https://production.plaid.com/processor/signal/prepare"
```

---

## POST /processor/bank_transfer/create

**Create a bank transfer as a processor**

Use the `/processor/bank_transfer/create` endpoint to initiate a new bank transfer as a processor

### Example

```bash
curl -X POST \
  -H "Authorization: Bearer $TOKEN" \
  "https://production.plaid.com/processor/bank_transfer/create"
```

---

## POST /processor/liabilities/get

**Retrieve Liabilities data**

The `/processor/liabilities/get` endpoint returns various details about a loan or credit account. Liabilities data is available primarily for US financial institutions, with some limited coverage of Canadian institutions. Currently supported account types are account type `credit` with account subtype `credit card` or `paypal`, and account type `loan` with account subtype `student` or `mortgage`.

The types of information returned by Liabilities can include balances and due dates, loan terms, and account details such as original loan amount and guarantor. Data is refreshed approximately once per day; the latest data can be retrieved by calling `/processor/liabilities/get`.

Note: This request may take some time to complete if `liabilities` was not specified as an initial product when creating the processor token. This is because Plaid must communicate directly with the institution to retrieve the additional data.

### Example

```bash
curl -X POST \
  -H "Authorization: Bearer $TOKEN" \
  "https://production.plaid.com/processor/liabilities/get"
```

---

## POST /processor/identity/get

**Retrieve Identity data**

The `/processor/identity/get` endpoint allows you to retrieve various account holder information on file with the financial institution, including names, emails, phone numbers, and addresses.

### Example

```bash
curl -X POST \
  -H "Authorization: Bearer $TOKEN" \
  "https://production.plaid.com/processor/identity/get"
```

---

## POST /processor/identity/match

**Retrieve identity match score**

The `/processor/identity/match` endpoint generates a match score, which indicates how well the provided identity data matches the identity information on file with the account holder's financial institution.

Fields within the `balances` object will always be null when retrieved by `/identity/match`. Instead, use the free `/accounts/get` endpoint to request balance cached data, or `/accounts/balance/get` for real-time data.

### Example

```bash
curl -X POST \
  -H "Authorization: Bearer $TOKEN" \
  "https://production.plaid.com/processor/identity/match"
```

---

## POST /processor/balance/get

**Retrieve Balance data**

The `/processor/balance/get` endpoint returns the real-time balance for each of an Item's accounts. While other endpoints may return a balance object, only `/processor/balance/get` forces the available and current balance fields to be refreshed rather than cached. 

### Example

```bash
curl -X POST \
  -H "Authorization: Bearer $TOKEN" \
  "https://production.plaid.com/processor/balance/get"
```

---

## POST /item/webhook/update

**Update Webhook URL**

The POST `/item/webhook/update` allows you to update the webhook URL associated with an Item. This request triggers a [`WEBHOOK_UPDATE_ACKNOWLEDGED`](https://plaid.com/docs/api/items/#webhook_update_acknowledged) webhook to the newly specified webhook URL.

### Example

```bash
curl -X POST \
  -H "Authorization: Bearer $TOKEN" \
  "https://production.plaid.com/item/webhook/update"
```

---

## POST /item/access_token/invalidate

**Invalidate access_token**

By default, the `access_token` associated with an Item does not expire and should be stored in a persistent, secure manner.

You can use the `/item/access_token/invalidate` endpoint to rotate the `access_token` associated with an Item. The endpoint returns a new `access_token` and immediately invalidates the previous `access_token`.


### Example

```bash
curl -X POST \
  -H "Authorization: Bearer $TOKEN" \
  "https://production.plaid.com/item/access_token/invalidate"
```

---

## POST /webhook_verification_key/get

**Get webhook verification key**

Plaid signs all outgoing webhooks and provides JSON Web Tokens (JWTs) so that you can verify the authenticity of any incoming webhooks to your application. A message signature is included in the `Plaid-Verification` header.

The `/webhook_verification_key/get` endpoint provides a JSON Web Key (JWK) that can be used to verify a JWT.

### Example

```bash
curl -X POST \
  -H "Authorization: Bearer $TOKEN" \
  "https://production.plaid.com/webhook_verification_key/get"
```

---

## POST /liabilities/get

**Retrieve Liabilities data**

The `/liabilities/get` endpoint returns various details about an Item with loan or credit accounts. Liabilities data is available primarily for US financial institutions, with some limited coverage of Canadian institutions. Currently supported account types are account type `credit` with account subtype `credit card` or `paypal`, and account type `loan` with account subtype `student` or `mortgage`. To limit accounts listed in Link to types and subtypes supported by Liabilities, you can use the `account_filters` parameter when [creating a Link token](https://plaid.com/docs/api/link/#linktokencreate).

The types of information returned by Liabilities can include balances and due dates, loan terms, and account details such as original loan amount and guarantor. Data is refreshed approximately once per day; the latest data can be retrieved by calling `/liabilities/get`.

### Example

```bash
curl -X POST \
  -H "Authorization: Bearer $TOKEN" \
  "https://production.plaid.com/liabilities/get"
```

---

## POST /payment_initiation/recipient/create

**Create payment recipient**

Create a payment recipient for payment initiation.  The recipient must be in Europe, within a country that is a member of the Single Euro Payment Area (SEPA) or a non-Eurozone country [supported](https://plaid.com/global) by Plaid. For a standing order (recurring) payment, the recipient must be in the UK.

It is recommended to use `bacs` in the UK and `iban` in EU.

The endpoint is idempotent: if a developer has already made a request with the same payment details, Plaid will return the same `recipient_id`.


### Example

```bash
curl -X POST \
  -H "Authorization: Bearer $TOKEN" \
  "https://production.plaid.com/payment_initiation/recipient/create"
```

---

## POST /payment_initiation/payment/reverse

**Reverse an existing payment**

Reverse a settled payment from a Plaid virtual account.

The original payment must be in a settled state to be refunded.
To refund partially, specify the amount as part of the request.
If the amount is not specified, the refund amount will be equal to all
of the remaining payment amount that has not been refunded yet.

The refund will go back to the source account that initiated the payment.
The original payment must have been initiated to a Plaid virtual account
so that this account can be used to initiate the refund.

Providing counterparty information such as date of birth and address increases
the likelihood of refund being successful without human intervention.


### Example

```bash
curl -X POST \
  -H "Authorization: Bearer $TOKEN" \
  "https://production.plaid.com/payment_initiation/payment/reverse"
```

---

## POST /payment_initiation/recipient/get

**Get payment recipient**

Get details about a payment recipient you have previously created.

### Example

```bash
curl -X POST \
  -H "Authorization: Bearer $TOKEN" \
  "https://production.plaid.com/payment_initiation/recipient/get"
```

---

## POST /payment_initiation/recipient/list

**List payment recipients**

The `/payment_initiation/recipient/list` endpoint list the payment recipients that you have previously created.

### Example

```bash
curl -X POST \
  -H "Authorization: Bearer $TOKEN" \
  "https://production.plaid.com/payment_initiation/recipient/list"
```

---

## POST /payment_initiation/payment/create

**Create a payment**

After creating a payment recipient, you can use the `/payment_initiation/payment/create` endpoint to create a payment to that recipient.  Payments can be one-time or standing order (recurring) and can be denominated in either EUR, GBP or other chosen [currency](https://plaid.com/docs/api/products/payment-initiation/#payment_initiation-payment-create-request-amount-currency).  If making domestic GBP-denominated payments, your recipient must have been created with BACS numbers. In general, EUR-denominated payments will be sent via SEPA Credit Transfer, GBP-denominated payments will be sent via the Faster Payments network and for non-Eurozone markets typically via the local payment scheme, but the payment network used will be determined by the institution. Payments sent via Faster Payments will typically arrive immediately, while payments sent via SEPA Credit Transfer or other local payment schemes will typically arrive in one business day.

Standing orders (recurring payments) must be denominated in GBP and can only be sent to recipients in the UK. Once created, standing order payments cannot be modified or canceled via the API. An end user can cancel or modify a standing order directly on their banking application or website, or by contacting the bank. Standing orders will follow the payment rules of the underlying rails (Faster Payments in UK). Payments can be sent Monday to Friday, excluding bank holidays. If the pre-arranged date falls on a weekend or bank holiday, the payment is made on the next working day. It is not possible to guarantee the exact time the payment will reach the recipient’s account, although at least 90% of standing order payments are sent by 6am.

In Limited Production, payments must be below 5 GBP or other chosen [currency](https://plaid.com/docs/api/products/payment-initiation/#payment_initiation-payment-create-request-amount-currency), and standing orders, variable recurring payments, and Virtual Accounts are not supported.

### Example

```bash
curl -X POST \
  -H "Authorization: Bearer $TOKEN" \
  "https://production.plaid.com/payment_initiation/payment/create"
```

---

## POST /payment_initiation/payment/token/create

**Create payment token**

The `/payment_initiation/payment/token/create` endpoint has been deprecated. New Plaid customers will be unable to use this endpoint, and existing customers are encouraged to migrate to the newer, `link_token`-based flow. The recommended flow is to provide the `payment_id` to `/link/token/create`, which returns a `link_token` used to initialize Link.

The `/payment_initiation/payment/token/create` is used to create a `payment_token`, which can then be used in Link initialization to enter a payment initiation flow. You can only use a `payment_token` once. If this attempt fails, the end user aborts the flow, or the token expires, you will need to create a new payment token. Creating a new payment token does not require end user input.

### Example

```bash
curl -X POST \
  -H "Authorization: Bearer $TOKEN" \
  "https://production.plaid.com/payment_initiation/payment/token/create"
```

---

## POST /payment_initiation/consent/create

**Create payment consent**

The `/payment_initiation/consent/create` endpoint is used to create a payment consent, which can be used to initiate payments on behalf of the user. Payment consents are created with `UNAUTHORISED` status by default and must be authorised by the user before payments can be initiated.

Consents can be limited in time and scope, and have constraints that describe limitations for payments.

### Example

```bash
curl -X POST \
  -H "Authorization: Bearer $TOKEN" \
  "https://production.plaid.com/payment_initiation/consent/create"
```

---

## POST /payment_initiation/consent/get

**Get payment consent**

The `/payment_initiation/consent/get` endpoint can be used to check the status of a payment consent, as well as to receive basic information such as recipient and constraints.

### Example

```bash
curl -X POST \
  -H "Authorization: Bearer $TOKEN" \
  "https://production.plaid.com/payment_initiation/consent/get"
```

---

## POST /payment_initiation/consent/revoke

**Revoke payment consent**

The `/payment_initiation/consent/revoke` endpoint can be used to revoke the payment consent. Once the consent is revoked, it is not possible to initiate payments using it.

### Example

```bash
curl -X POST \
  -H "Authorization: Bearer $TOKEN" \
  "https://production.plaid.com/payment_initiation/consent/revoke"
```

---

## POST /payment_initiation/consent/payment/execute

**Execute a single payment using consent**

The `/payment_initiation/consent/payment/execute` endpoint can be used to execute payments using payment consent.

### Example

```bash
curl -X POST \
  -H "Authorization: Bearer $TOKEN" \
  "https://production.plaid.com/payment_initiation/consent/payment/execute"
```

---

## POST /sandbox/item/reset_login

**Force a Sandbox Item into an error state**

`/sandbox/item/reset_login/` forces an Item into an `ITEM_LOGIN_REQUIRED` state in order to simulate an Item whose login is no longer valid. This makes it easy to test Link's [update mode](https://plaid.com/docs/link/update-mode) flow in the Sandbox environment.  After calling `/sandbox/item/reset_login`, You can then use Plaid Link update mode to restore the Item to a good state. An `ITEM_LOGIN_REQUIRED` webhook will also be fired after a call to this endpoint, if one is associated with the Item.


In the Sandbox, Items will transition to an `ITEM_LOGIN_REQUIRED` error state automatically after 30 days, even if this endpoint is not called.

### Example

```bash
curl -X POST \
  -H "Authorization: Bearer $TOKEN" \
  "https://production.plaid.com/sandbox/item/reset_login"
```

---

## POST /sandbox/item/set_verification_status

**Set verification status for Sandbox account**

The `/sandbox/item/set_verification_status` endpoint can be used to change the verification status of an Item in in the Sandbox in order to simulate the Automated Micro-deposit flow.

For more information on testing Automated Micro-deposits in Sandbox, see [Auth full coverage testing](https://plaid.com/docs/auth/coverage/testing#).

### Example

```bash
curl -X POST \
  -H "Authorization: Bearer $TOKEN" \
  "https://production.plaid.com/sandbox/item/set_verification_status"
```

---

## POST /sandbox/user/reset_login

**Force item(s) for a Sandbox User into an error state**

`/sandbox/user/reset_login/` functions the same as `/sandbox/item/reset_login`, but will modify Items related to a User. This endpoint forces each Item into an `ITEM_LOGIN_REQUIRED` state in order to simulate an Item whose login is no longer valid. This makes it easy to test Link's [update mode](https://plaid.com/docs/link/update-mode) flow in the Sandbox environment.  After calling `/sandbox/user/reset_login`, You can then use Plaid Link update mode to restore Items associated with the User to a good state. An `ITEM_LOGIN_REQUIRED` webhook will also be fired after a call to this endpoint, if one is associated with the Item.


In the Sandbox, Items will transition to an `ITEM_LOGIN_REQUIRED` error state automatically after 30 days, even if this endpoint is not called.

### Example

```bash
curl -X POST \
  -H "Authorization: Bearer $TOKEN" \
  "https://production.plaid.com/sandbox/user/reset_login"
```

---

## POST /item/public_token/exchange

**Exchange public token for an access token**

Exchange a Link `public_token` for an API `access_token`. Link hands off the `public_token` client-side via the `onSuccess` callback once a user has successfully created an Item. The `public_token` is ephemeral and expires after 30 minutes. An `access_token` does not expire, but can be revoked by calling `/item/remove`.

The response also includes an `item_id` that should be stored with the `access_token`. The `item_id` is used to identify an Item in a webhook. The `item_id` can also be retrieved by making an `/item/get` request.

### Example

```bash
curl -X POST \
  -H "Authorization: Bearer $TOKEN" \
  "https://production.plaid.com/item/public_token/exchange"
```

---

## POST /item/public_token/create

**Create public token**

Note: As of July 2020, the `/item/public_token/create` endpoint is deprecated. Instead, use `/link/token/create` with an `access_token` to create a Link token for use with [update mode](https://plaid.com/docs/link/update-mode).

If you need your user to take action to restore or resolve an error associated with an Item, generate a public token with the `/item/public_token/create` endpoint and then initialize Link with that `public_token`.

A `public_token` is one-time use and expires after 30 minutes. You use a `public_token` to initialize Link in [update mode](https://plaid.com/docs/link/update-mode) for a particular Item. You can generate a `public_token` for an Item even if you did not use Link to create the Item originally.

The `/item/public_token/create` endpoint is **not** used to create your initial `public_token`. If you have not already received an `access_token` for a specific Item, use Link to obtain your `public_token` instead. See the [Quickstart](https://plaid.com/docs/quickstart) for more information.

### Example

```bash
curl -X POST \
  -H "Authorization: Bearer $TOKEN" \
  "https://production.plaid.com/item/public_token/create"
```

---

## POST /user/create

**Create user**

For Plaid products and flows that use the user object, `/user/create` provides you a single token to access all data associated with the user. You must call this endpoint before calling `/link/token/create` if you are using any of the following: Plaid Check, Income Verification, Multi-Item Link, or Plaid Protect.

For customers who began using this endpoint on or after December 10, 2025, this endpoint takes a `client_user_id` and an `identity` object and will return a `user_id`. For customers who began using it before that date, the endpoint takes a `client_user_id` and a `consumer_report_user_identity` object and will return a `user_token` and `user_id`. For more details, see [New User APIs](https://plaid.com/docs/api/users/user-apis).

In order to create a Plaid Check Consumer Report for a user, the `identity` (new) or `consumer_report_user_identity` (legacy) object must be present. If it is not provided during the `/user/create` call, it can be added later by calling `/user/update`. 

In order to generate a Plaid Check Consumer Report, the following `identity` fields, at minimum, are required and must be non-empty: `name`, `date_of_birth`, `emails`, `phone_numbers`, and `addresses`, (with at least one email, phone number, and address designated as `primary`). Plaid Check Consumer Reports can only be created for US-based users; the user's address country must be `US`. If creating a report for sharing with a GSE such as Fannie or Freddie, the user's full SSN must be provided via the `id_numbers` field. Providing at least a partial SSN is also strongly recommended for all use cases, since it improves the accuracy of matching user records during compliance processes such as file disclosure, dispute, or security freeze requests.

When using Plaid Protect, it is highly recommended that you provide an `identity` object to better identify and block fraud across your Link sessions. 

Plaid will normalize identity fields before storing them and utilize the same identity across different user-based products.

### Parameters

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| `` | query | string | No |  |

### Example

```bash
curl -X POST \
  -H "Authorization: Bearer $TOKEN" \
  "https://production.plaid.com/user/create"
```

---

## POST /user/get

**Retrieve user identity and information**

Get user details using a `user_id`. This endpoint only supports users that were created on the new user API flow, without a `user_token`. For more details, see [New User APIs](https://plaid.com/docs/api/users/user-apis).

### Parameters

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| `` | query | string | No |  |

### Example

```bash
curl -X POST \
  -H "Authorization: Bearer $TOKEN" \
  "https://production.plaid.com/user/get"
```

---

## POST /user/update

**Update user information**

This endpoint updates user information for an existing `user_id` or `user_token`. If an existing `user_id` or `user_token` is missing fields required for a given use case (e.g. creating a Consumer Report) use `/user/update` to add values for those fields. 

Identity updates use merge semantics: provided fields overwrite existing ones; omitted fields remain unchanged.

### Parameters

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| `` | query | string | No |  |

### Example

```bash
curl -X POST \
  -H "Authorization: Bearer $TOKEN" \
  "https://production.plaid.com/user/update"
```

---

## POST /user/remove

**Remove user**

`/user/remove` deletes a `user_id` or `user_token` and and associated information, including any Items associated with the user.

### Parameters

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| `` | query | string | No |  |

### Example

```bash
curl -X POST \
  -H "Authorization: Bearer $TOKEN" \
  "https://production.plaid.com/user/remove"
```

---

## POST /user/products/terminate

**Terminate user-based products**

`/user/products/terminate` terminates user-based recurring subscriptions for a given client user. This will remove user-based products (Financial Management, Protect, and CRA products) from all items associated with the user.

### Example

```bash
curl -X POST \
  -H "Authorization: Bearer $TOKEN" \
  "https://production.plaid.com/user/products/terminate"
```

---

## POST /user/items/get

**Get Items associated with a User**

Returns Items associated with a `user_id`, along with their corresponding statuses. Plaid associates an Item with a User when it has been successfully connected within a Link session initialized with that `user_id`.

### Example

```bash
curl -X POST \
  -H "Authorization: Bearer $TOKEN" \
  "https://production.plaid.com/user/items/get"
```

---

## POST /user/items/associate

**Associate Items to a User**

Associates Items to the target user. If an Item is already associated to another user, the Item will be disassociated with the existing user and associated to the target user. This operation supports a max of 100 Items.

### Example

```bash
curl -X POST \
  -H "Authorization: Bearer $TOKEN" \
  "https://production.plaid.com/user/items/associate"
```

---

## POST /user/third_party_token/create

**Create a third-party user token**

This endpoint is used to create a third-party user token. This token can be shared with and used by a specified third-party client to access data associated with the user through supported endpoints.

Ensure you store the `third_party_user_token` along with the `user_token` and `third_party_client_id`, as it is not possible to retrieve a previously created `third_party_user_token`.

### Example

```bash
curl -X POST \
  -H "Authorization: Bearer $TOKEN" \
  "https://production.plaid.com/user/third_party_token/create"
```

---

## POST /user/third_party_token/remove

**Remove a third-party user token**

This endpoint is used to delete a third-party user token. Once removed, the token can longer be used to access data associated with the user.

Any subsequent calls to retrieve information using the same third-party user token will result in an error stating the third-party user token does not exist.

### Example

```bash
curl -X POST \
  -H "Authorization: Bearer $TOKEN" \
  "https://production.plaid.com/user/third_party_token/remove"
```

---

## POST /credit/sessions/get

**Retrieve Link sessions for your user**

This endpoint can be used for your end users after they complete the Link flow. This endpoint returns a list of Link sessions that your user completed, where each session includes the results from the Link flow.

These results include details about the Item that was created and some product related metadata (showing, for example, whether the user finished the bank income verification step).

### Example

```bash
curl -X POST \
  -H "Authorization: Bearer $TOKEN" \
  "https://production.plaid.com/credit/sessions/get"
```

---

## POST /payment_initiation/payment/get

**Get payment details**

The `/payment_initiation/payment/get` endpoint can be used to check the status of a payment, as well as to receive basic information such as recipient and payment amount. In the case of standing orders, the `/payment_initiation/payment/get` endpoint will provide information about the status of the overall standing order itself; the API cannot be used to retrieve payment status for individual payments within a standing order.

Polling for status updates in Production is highly discouraged. Repeatedly calling `/payment_initiation/payment/get` to check a payment's status is unreliable and may trigger API rate limits. Only the `payment_status_update` webhook should be used to receive real-time status updates in Production.

In the case of standing orders, the `/payment_initiation/payment/get` endpoint will provide information about the status of the overall standing order itself; the API cannot be used to retrieve payment status for individual payments within a standing order.

### Example

```bash
curl -X POST \
  -H "Authorization: Bearer $TOKEN" \
  "https://production.plaid.com/payment_initiation/payment/get"
```

---

## POST /payment_initiation/payment/list

**List payments**

The `/payment_initiation/payment/list` endpoint can be used to retrieve all created payments. By default, the 10 most recent payments are returned. You can request more payments and paginate through the results using the optional `count` and `cursor` parameters.

### Example

```bash
curl -X POST \
  -H "Authorization: Bearer $TOKEN" \
  "https://production.plaid.com/payment_initiation/payment/list"
```

---

## POST /investments/holdings/get

**Get Investment holdings**

The `/investments/holdings/get` endpoint allows developers to receive user-authorized stock position data for `investment`-type accounts.

### Example

```bash
curl -X POST \
  -H "Authorization: Bearer $TOKEN" \
  "https://production.plaid.com/investments/holdings/get"
```

---

## POST /investments/transactions/get

**Get investment transactions**

The `/investments/transactions/get` endpoint allows developers to retrieve up to 24 months of user-authorized transaction data for investment accounts.

Transactions are returned in reverse-chronological order, and the sequence of transaction ordering is stable and will not shift.

Due to the potentially large number of investment transactions associated with an Item, results are paginated. Manipulate the count and offset parameters in conjunction with the `total_investment_transactions` response body field to fetch all available investment transactions.

Note that Investments does not have a webhook to indicate when initial transaction data has loaded (unless you use the `async_update` option). Instead, if transactions data is not ready when `/investments/transactions/get` is first called, Plaid will wait for the data. For this reason, calling `/investments/transactions/get` immediately after Link may take up to one to two minutes to return.

Data returned by the asynchronous investments extraction flow (when `async_update` is set to true) may not be immediately available to `/investments/transactions/get`. To be alerted when the data is ready to be fetched, listen for the `HISTORICAL_UPDATE` webhook. If no investments history is ready when `/investments/transactions/get` is called, it will return a `PRODUCT_NOT_READY` error.

### Example

```bash
curl -X POST \
  -H "Authorization: Bearer $TOKEN" \
  "https://production.plaid.com/investments/transactions/get"
```

---

## POST /investments/refresh

**Refresh investment data**

`/investments/refresh` is an optional endpoint for users of the Investments product. It initiates an on-demand extraction to fetch the newest investment holdings and transactions for an Item. This on-demand extraction takes place in addition to the periodic extractions that automatically occur one or more times per day for any Investments-enabled Item. If changes to investments are discovered after calling `/investments/refresh`, Plaid will fire webhooks: [`HOLDINGS: DEFAULT_UPDATE`](https://plaid.com/docs/api/products/investments/#holdings-default_update) if any new holdings are detected, and [`INVESTMENTS_TRANSACTIONS: DEFAULT_UPDATE`](https://plaid.com/docs/api/products/investments/#investments_transactions-default_update) if any new investment transactions are detected. This webhook will typically not fire in the Sandbox environment, due to the lack of dynamic investment transactions and holdings data. To test this webhook in Sandbox, call `/sandbox/item/fire_webhook`. Updated holdings and investment transactions can be fetched by calling `/investments/holdings/get` and `/investments/transactions/get`. Note that the `/investments/refresh` endpoint is not supported by all institutions. If called on an Item from an institution that does not support this functionality, it will return a `PRODUCT_NOT_SUPPORTED` error.

As this endpoint triggers a synchronous request for fresh data, latency may be higher than for other Plaid endpoints (typically less than 10 seconds, but occasionally up to 30 seconds or more); if you encounter errors, you may find it necessary to adjust your timeout period when making requests.

`/investments/refresh` is offered as an add-on to Investments and has a separate [fee model](https://plaid.com/docs/account/billing/#per-request-flat-fee). To request access to this endpoint, submit a [product access request](https://dashboard.plaid.com/team/products) or contact your Plaid account manager.

### Example

```bash
curl -X POST \
  -H "Authorization: Bearer $TOKEN" \
  "https://production.plaid.com/investments/refresh"
```

---

## POST /investments/auth/get

**Get data needed to authorize an investments transfer**

The `/investments/auth/get` endpoint allows developers to receive user-authorized data to facilitate the transfer of holdings

### Example

```bash
curl -X POST \
  -H "Authorization: Bearer $TOKEN" \
  "https://production.plaid.com/investments/auth/get"
```

---

## POST /processor/token/create

**Create processor token**

Used to create a token suitable for sending to one of Plaid's partners to enable integrations. Note that Stripe partnerships use bank account tokens instead; see `/processor/stripe/bank_account_token/create` for creating tokens for use with Stripe integrations. If using multiple processors, multiple different processor tokens can be created for a single access token. Once created, a processor token for a given Item can be modified by calling `/processor/token/permissions/set`. To revoke the processor's access, the entire Item must be deleted by calling `/item/remove`.

### Example

```bash
curl -X POST \
  -H "Authorization: Bearer $TOKEN" \
  "https://production.plaid.com/processor/token/create"
```

---

## POST /processor/token/permissions/set

**Control a processor's access to products**

Used to control a processor's access to products on the given processor token. By default, a processor will have access to all available products on the corresponding item. To restrict access to a particular set of products, call this endpoint with the desired products. To restore access to all available products, call this endpoint with an empty list. This endpoint can be called multiple times as your needs and your processor's needs change.

### Example

```bash
curl -X POST \
  -H "Authorization: Bearer $TOKEN" \
  "https://production.plaid.com/processor/token/permissions/set"
```

---

## POST /processor/token/permissions/get

**Get a processor token's product permissions**

Used to get a processor token's product permissions. The `products` field will be an empty list if the processor can access all available products.

### Example

```bash
curl -X POST \
  -H "Authorization: Bearer $TOKEN" \
  "https://production.plaid.com/processor/token/permissions/get"
```

---

## POST /processor/token/webhook/update

**Update a processor token's webhook URL**

This endpoint allows you, the processor, to update the webhook URL associated with a processor token. This request triggers a `WEBHOOK_UPDATE_ACKNOWLEDGED` webhook to the newly specified webhook URL.

### Example

```bash
curl -X POST \
  -H "Authorization: Bearer $TOKEN" \
  "https://production.plaid.com/processor/token/webhook/update"
```

---

## POST /processor/stripe/bank_account_token/create

**Create Stripe bank account token**


Used to create a token suitable for sending to Stripe to enable Plaid-Stripe integrations. For a detailed guide on integrating Stripe, see [Add Stripe to your app](https://plaid.com/docs/auth/partnerships/stripe/).

Note that the Stripe bank account token is a one-time use token. To store bank account information for later use, you can use a Stripe customer object and create an associated bank account from the token, or you can use a Stripe Custom account and create an associated external bank account from the token. This bank account information should work indefinitely, unless the user's bank account information changes or they revoke Plaid's permissions to access their account. Stripe bank account information cannot be modified once the bank account token has been created. If you ever need to change the bank account details used by Stripe for a specific customer, have the user go through Link again and create a new bank account token from the new `access_token`.

To revoke a bank account token, the entire underlying access token must be revoked using `/item/remove`.

### Example

```bash
curl -X POST \
  -H "Authorization: Bearer $TOKEN" \
  "https://production.plaid.com/processor/stripe/bank_account_token/create"
```

---

## POST /processor/apex/processor_token/create

**Create Apex bank account token**

Used to create a token suitable for sending to Apex to enable Plaid-Apex integrations.

### Example

```bash
curl -X POST \
  -H "Authorization: Bearer $TOKEN" \
  "https://production.plaid.com/processor/apex/processor_token/create"
```

---

## POST /item/import

**Import Item**

`/item/import` creates an Item via your Plaid Exchange Integration and returns an `access_token`. As part of an `/item/import` request, you will include a User ID (`user_auth.user_id`) and Authentication Token (`user_auth.auth_token`) that enable data aggregation through your Plaid Exchange API endpoints. These authentication principals are to be chosen by you.

Upon creating an Item via `/item/import`, Plaid will automatically begin an extraction of that Item through the Plaid Exchange infrastructure you have already integrated.

### Example

```bash
curl -X POST \
  -H "Authorization: Bearer $TOKEN" \
  "https://production.plaid.com/item/import"
```

---

## POST /link/token/create

**Create Link Token**

The `/link/token/create` endpoint creates a `link_token`, which is required as a parameter when initializing Link. Once Link has been initialized, it returns a `public_token`. For most Plaid products, the `public_token` is saved and exchanged for an `access_token` via `/item/public_token/exchange` as part of the main Link flow. For more details, see the [Link flow overview](https://plaid.com/docs/link/#link-flow-overview).

A `link_token` generated by `/link/token/create` is also used to initialize other Link flows, such as the [update mode](https://plaid.com/docs/link/update-mode) flow for tokens with expired credentials, or the Identity Verification flow.

### Example

```bash
curl -X POST \
  -H "Authorization: Bearer $TOKEN" \
  "https://production.plaid.com/link/token/create"
```

---

## POST /link/token/get

**Get Link Token**

The `/link/token/get` endpoint gets information about a Link session, including all callbacks fired during the session along with their metadata, including the public token. This endpoint is used with Link flows that don't provide a public token via frontend callbacks, such as the [Hosted Link flow](https://plaid.com/docs/link/hosted-link/) and the [Multi-Item Link flow](https://plaid.com/docs/link/multi-item-link/). It also can be useful for debugging purposes.

By default, this endpoint will only return complete event data for Hosted Link sessions. To use `/link/token/get` to retrieve event data for non-Hosted-Link sessions, contact your account manager to request that your account be enabled for Link events. If you do not have an account manager, you can submit this request via a support ticket. Enablement for Link events will also cause you to receive additional webhooks related to Link events, such as the `SESSION_FINISHED` and `EVENTS` webhook.

### Example

```bash
curl -X POST \
  -H "Authorization: Bearer $TOKEN" \
  "https://production.plaid.com/link/token/get"
```

---

## POST /link/oauth/correlation_id/exchange

**Exchange the Link Correlation Id for a Link Token**

Exchange an OAuth `link_correlation_id` for the corresponding `link_token`. The `link_correlation_id` is only available for `payment_initiation` products and is provided to the client via the OAuth `redirect_uri` as a query parameter.
The `link_correlation_id` is ephemeral and expires in a brief period, after which it can no longer be exchanged for the `link_token`.

### Example

```bash
curl -X POST \
  -H "Authorization: Bearer $TOKEN" \
  "https://production.plaid.com/link/oauth/correlation_id/exchange"
```

---

## POST /session/token/create

**Create a Session Token**

`/session/token/create` is used to create a Link token for Layer. The returned Link token is used as an parameter when initializing the Link SDK. For more details, see the [Link flow overview](https://plaid.com/docs/link/#link-flow-overview).

### Example

```bash
curl -X POST \
  -H "Authorization: Bearer $TOKEN" \
  "https://production.plaid.com/session/token/create"
```

---

## POST /transfer/get

**Retrieve a transfer**

The `/transfer/get` endpoint fetches information about the transfer corresponding to the given `transfer_id` or `authorization_id`. One of `transfer_id` or `authorization_id` must be populated but not both.

### Example

```bash
curl -X POST \
  -H "Authorization: Bearer $TOKEN" \
  "https://production.plaid.com/transfer/get"
```

---

## POST /transfer/recurring/get

**Retrieve a recurring transfer**

The `/transfer/recurring/get` fetches information about the recurring transfer corresponding to the given `recurring_transfer_id`.

### Example

```bash
curl -X POST \
  -H "Authorization: Bearer $TOKEN" \
  "https://production.plaid.com/transfer/recurring/get"
```

---

## POST /bank_transfer/get

**Retrieve a bank transfer**

The `/bank_transfer/get` fetches information about the bank transfer corresponding to the given `bank_transfer_id`.

### Example

```bash
curl -X POST \
  -H "Authorization: Bearer $TOKEN" \
  "https://production.plaid.com/bank_transfer/get"
```

---

## POST /transfer/authorization/create

**Create a transfer authorization**

Use the `/transfer/authorization/create` endpoint to authorize a transfer. This endpoint must be called prior to calling `/transfer/create`. The transfer authorization will expire if not used after one hour. (You can contact your account manager to change the default authorization lifetime.)

There are four possible outcomes to calling this endpoint:

  - If the `authorization.decision` in the response is `declined`, the proposed transfer has failed the risk check and you cannot proceed with the transfer.

  - If the `authorization.decision` is `user_action_required`, additional user input is needed, usually to fix a broken bank connection, before Plaid can properly assess the risk. You need to launch Link in update mode to complete the required user action. When calling `/link/token/create` to get a new Link token, instead of providing `access_token` in the request, you should set [`transfer.authorization_id`](https://plaid.com/docs/api/link/#link-token-create-request-transfer-authorization-id) as the `authorization.id`. After the Link flow is completed, you may re-attempt the authorization.

  - If the `authorization.decision` is `approved`, and the `authorization.rationale_code` is `null`, the transfer has passed the risk check and you can proceed to call `/transfer/create`.

  - If the `authorization.decision` is `approved` and the `authorization.rationale_code` is non-`null`, the risk check could not be run: you may proceed with the transfer, but should perform your own risk evaluation. For more details, see the response schema.

In Plaid's Sandbox environment the decisions will be returned as follows:

  - To approve a transfer with `null` rationale code, make an authorization request with an `amount` less than the available balance in the account.

  - To approve a transfer with the rationale code `MANUALLY_VERIFIED_ITEM`, create an Item in Link through the [Same Day Micro-deposits flow](https://plaid.com/docs/auth/coverage/testing/#testing-same-day-micro-deposits).

  - To get an authorization decision of `user_action_required`, [reset the login for an Item](https://plaid.com/docs/sandbox/#item_login_required).

  - To decline a transfer with the rationale code `NSF`, the available balance on the account must be less than the authorization `amount`. See [Create Sandbox test data](https://plaid.com/docs/sandbox/user-custom/) for details on how to customize data in Sandbox.

  - To decline a transfer with the rationale code `RISK`, the available balance on the account must be exactly $0. See [Create Sandbox test data](https://plaid.com/docs/sandbox/user-custom/) for details on how to customize data in Sandbox.

### Example

```bash
curl -X POST \
  -H "Authorization: Bearer $TOKEN" \
  "https://production.plaid.com/transfer/authorization/create"
```

---

## POST /transfer/authorization/cancel

**Cancel a transfer authorization**

Use the `/transfer/authorization/cancel` endpoint to cancel a transfer authorization. A transfer authorization is eligible for cancellation if it has not yet been used to create a transfer.

### Example

```bash
curl -X POST \
  -H "Authorization: Bearer $TOKEN" \
  "https://production.plaid.com/transfer/authorization/cancel"
```

---

## POST /transfer/balance/get

**(Deprecated) Retrieve a balance held with Plaid**

(Deprecated) Use the `/transfer/balance/get` endpoint to view a balance held with Plaid.

### Example

```bash
curl -X POST \
  -H "Authorization: Bearer $TOKEN" \
  "https://production.plaid.com/transfer/balance/get"
```

---

## POST /transfer/capabilities/get

**Get RTP eligibility information of a transfer**

Use the `/transfer/capabilities/get` endpoint to determine the RTP eligibility information of an account to be used with Transfer. This endpoint works on all Transfer-capable Items, including those created by `/transfer/migrate_account`.

### Example

```bash
curl -X POST \
  -H "Authorization: Bearer $TOKEN" \
  "https://production.plaid.com/transfer/capabilities/get"
```

---

## POST /transfer/configuration/get

**Get transfer product configuration**

Use the `/transfer/configuration/get` endpoint to view your transfer product configurations.

### Example

```bash
curl -X POST \
  -H "Authorization: Bearer $TOKEN" \
  "https://production.plaid.com/transfer/configuration/get"
```

---

## POST /transfer/ledger/get

**Retrieve Plaid Ledger balance**

Use the `/transfer/ledger/get` endpoint to view a balance on the ledger held with Plaid.

### Example

```bash
curl -X POST \
  -H "Authorization: Bearer $TOKEN" \
  "https://production.plaid.com/transfer/ledger/get"
```

---

## POST /transfer/ledger/distribute

**Move available balance between ledgers**

Use the `/transfer/ledger/distribute` endpoint to move available balance between ledgers, if you have multiple. If you’re a platform, you can move funds between one of your ledgers and one of your customer’s ledger.

### Example

```bash
curl -X POST \
  -H "Authorization: Bearer $TOKEN" \
  "https://production.plaid.com/transfer/ledger/distribute"
```

---

## POST /transfer/ledger/deposit

**Deposit funds into a Plaid Ledger balance**

Use the `/transfer/ledger/deposit` endpoint to deposit funds into Plaid Ledger.

### Example

```bash
curl -X POST \
  -H "Authorization: Bearer $TOKEN" \
  "https://production.plaid.com/transfer/ledger/deposit"
```

---

## POST /transfer/ledger/withdraw

**Withdraw funds from a Plaid Ledger balance**

Use the `/transfer/ledger/withdraw` endpoint to withdraw funds from a Plaid Ledger balance.

### Example

```bash
curl -X POST \
  -H "Authorization: Bearer $TOKEN" \
  "https://production.plaid.com/transfer/ledger/withdraw"
```

---

## POST /transfer/originator/funding_account/update

**Update the funding account associated with the originator**

Use the `/transfer/originator/funding_account/update` endpoint to update the funding account associated with the originator.

### Example

```bash
curl -X POST \
  -H "Authorization: Bearer $TOKEN" \
  "https://production.plaid.com/transfer/originator/funding_account/update"
```

---

## POST /transfer/originator/funding_account/create

**Create a new funding account for an originator**

Use the `/transfer/originator/funding_account/create` endpoint to create a new funding account for the originator.

### Example

```bash
curl -X POST \
  -H "Authorization: Bearer $TOKEN" \
  "https://production.plaid.com/transfer/originator/funding_account/create"
```

---

## POST /transfer/metrics/get

**Get transfer product usage metrics**

Use the `/transfer/metrics/get` endpoint to view your transfer product usage metrics.

### Example

```bash
curl -X POST \
  -H "Authorization: Bearer $TOKEN" \
  "https://production.plaid.com/transfer/metrics/get"
```

---

## POST /transfer/create

**Create a transfer**

Use the `/transfer/create` endpoint to initiate a new transfer. This endpoint is retryable and idempotent; if a transfer with the provided `transfer_id` has already been created, it will return the transfer details without creating a new transfer. A transfer may still be created if a 500 error is returned; to detect this scenario, use [Transfer events](https://plaid.com/docs/transfer/reconciling-transfers/).

### Example

```bash
curl -X POST \
  -H "Authorization: Bearer $TOKEN" \
  "https://production.plaid.com/transfer/create"
```

---

## POST /transfer/recurring/create

**Create a recurring transfer**

Use the `/transfer/recurring/create` endpoint to initiate a new recurring transfer. This capability is not currently supported for Transfer UI or Transfer for Platforms (beta) customers.

### Example

```bash
curl -X POST \
  -H "Authorization: Bearer $TOKEN" \
  "https://production.plaid.com/transfer/recurring/create"
```

---

## POST /bank_transfer/create

**Create a bank transfer**

Use the `/bank_transfer/create` endpoint to initiate a new bank transfer.

### Example

```bash
curl -X POST \
  -H "Authorization: Bearer $TOKEN" \
  "https://production.plaid.com/bank_transfer/create"
```

---

## POST /transfer/list

**List transfers**

Use the `/transfer/list` endpoint to see a list of all your transfers and their statuses. Results are paginated; use the `count` and `offset` query parameters to retrieve the desired transfers.


### Example

```bash
curl -X POST \
  -H "Authorization: Bearer $TOKEN" \
  "https://production.plaid.com/transfer/list"
```

---

## POST /transfer/recurring/list

**List recurring transfers**

Use the `/transfer/recurring/list` endpoint to see a list of all your recurring transfers and their statuses. Results are paginated; use the `count` and `offset` query parameters to retrieve the desired recurring transfers.


### Example

```bash
curl -X POST \
  -H "Authorization: Bearer $TOKEN" \
  "https://production.plaid.com/transfer/recurring/list"
```

---

## POST /bank_transfer/list

**List bank transfers**

Use the `/bank_transfer/list` endpoint to see a list of all your bank transfers and their statuses. Results are paginated; use the `count` and `offset` query parameters to retrieve the desired bank transfers.


### Example

```bash
curl -X POST \
  -H "Authorization: Bearer $TOKEN" \
  "https://production.plaid.com/bank_transfer/list"
```

---

## POST /transfer/cancel

**Cancel a transfer**

Use the `/transfer/cancel` endpoint to cancel a transfer.  A transfer is eligible for cancellation if the `cancellable` property returned by `/transfer/get` is `true`.

### Example

```bash
curl -X POST \
  -H "Authorization: Bearer $TOKEN" \
  "https://production.plaid.com/transfer/cancel"
```

---

## POST /transfer/recurring/cancel

**Cancel a recurring transfer.**

Use the `/transfer/recurring/cancel` endpoint to cancel a recurring transfer.  Scheduled transfer that hasn't been submitted to bank will be cancelled.

### Example

```bash
curl -X POST \
  -H "Authorization: Bearer $TOKEN" \
  "https://production.plaid.com/transfer/recurring/cancel"
```

---

## POST /bank_transfer/cancel

**Cancel a bank transfer**

Use the `/bank_transfer/cancel` endpoint to cancel a bank transfer.  A transfer is eligible for cancelation if the `cancellable` property returned by `/bank_transfer/get` is `true`.

### Example

```bash
curl -X POST \
  -H "Authorization: Bearer $TOKEN" \
  "https://production.plaid.com/bank_transfer/cancel"
```

---

## POST /transfer/event/list

**List transfer events**

Use the `/transfer/event/list` endpoint to get a list of transfer events based on specified filter criteria.

### Example

```bash
curl -X POST \
  -H "Authorization: Bearer $TOKEN" \
  "https://production.plaid.com/transfer/event/list"
```

---

## POST /transfer/ledger/event/list

**List transfer ledger events**

Use the `/transfer/ledger/event/list` endpoint to get a list of ledger events for a specific ledger based on specified filter criteria.

### Example

```bash
curl -X POST \
  -H "Authorization: Bearer $TOKEN" \
  "https://production.plaid.com/transfer/ledger/event/list"
```

---

## POST /bank_transfer/event/list

**List bank transfer events**

Use the `/bank_transfer/event/list` endpoint to get a list of Plaid-initiated ACH or bank transfer events based on specified filter criteria. When using Auth with micro-deposit verification enabled, this endpoint can be used to fetch status updates on ACH micro-deposits. For more details, see [micro-deposit events](https://plaid.com/docs/auth/coverage/microdeposit-events/).

### Example

```bash
curl -X POST \
  -H "Authorization: Bearer $TOKEN" \
  "https://production.plaid.com/bank_transfer/event/list"
```

---

## POST /transfer/event/sync

**Sync transfer events**

`/transfer/event/sync` allows you to request up to the next 500 transfer events that happened after a specific `event_id`. Use the `/transfer/event/sync` endpoint to guarantee you have seen all transfer events.

### Example

```bash
curl -X POST \
  -H "Authorization: Bearer $TOKEN" \
  "https://production.plaid.com/transfer/event/sync"
```

---

## POST /bank_transfer/event/sync

**Sync bank transfer events**

`/bank_transfer/event/sync` allows you to request up to the next 25 Plaid-initiated bank transfer events that happened after a specific `event_id`. When using Auth with micro-deposit verification enabled, this endpoint can be used to fetch status updates on ACH micro-deposits. For more details, see [micro-deposit events](https://plaid.com/docs/auth/coverage/microdeposit-events/).

### Example

```bash
curl -X POST \
  -H "Authorization: Bearer $TOKEN" \
  "https://production.plaid.com/bank_transfer/event/sync"
```

---

## POST /transfer/sweep/get

**Retrieve a sweep**

The `/transfer/sweep/get` endpoint fetches a sweep corresponding to the given `sweep_id`.

### Example

```bash
curl -X POST \
  -H "Authorization: Bearer $TOKEN" \
  "https://production.plaid.com/transfer/sweep/get"
```

---

## POST /bank_transfer/sweep/get

**Retrieve a sweep**

The `/bank_transfer/sweep/get` endpoint fetches information about the sweep corresponding to the given `sweep_id`.

### Example

```bash
curl -X POST \
  -H "Authorization: Bearer $TOKEN" \
  "https://production.plaid.com/bank_transfer/sweep/get"
```

---

## POST /transfer/sweep/list

**List sweeps**

The `/transfer/sweep/list` endpoint fetches sweeps matching the given filters.

### Example

```bash
curl -X POST \
  -H "Authorization: Bearer $TOKEN" \
  "https://production.plaid.com/transfer/sweep/list"
```

---

## POST /bank_transfer/sweep/list

**List sweeps**

The `/bank_transfer/sweep/list` endpoint fetches information about the sweeps matching the given filters.

### Example

```bash
curl -X POST \
  -H "Authorization: Bearer $TOKEN" \
  "https://production.plaid.com/bank_transfer/sweep/list"
```

---

## POST /bank_transfer/balance/get

**Get balance of your Bank Transfer account**

Use the `/bank_transfer/balance/get` endpoint to see the available balance in your bank transfer account. Debit transfers increase this balance once their status is posted. Credit transfers decrease this balance when they are created.

The transactable balance shows the amount in your account that you are able to use for transfers, and is essentially your available balance minus your minimum balance.

Note that this endpoint can only be used with FBO accounts, when using Bank Transfers in the Full Service configuration. It cannot be used on your own account when using Bank Transfers in the BTS Platform configuration.

### Example

```bash
curl -X POST \
  -H "Authorization: Bearer $TOKEN" \
  "https://production.plaid.com/bank_transfer/balance/get"
```

---

## POST /bank_transfer/migrate_account

**Migrate account into Bank Transfers**

As an alternative to adding Items via Link, you can also use the `/bank_transfer/migrate_account` endpoint to migrate known account and routing numbers to Plaid Items.  Note that Items created in this way are not compatible with endpoints for other products, such as `/accounts/balance/get`, and can only be used with Bank Transfer endpoints.  If you require access to other endpoints, create the Item through Link instead.  Access to `/bank_transfer/migrate_account` is not enabled by default; to obtain access, contact your Plaid Account Manager.

### Example

```bash
curl -X POST \
  -H "Authorization: Bearer $TOKEN" \
  "https://production.plaid.com/bank_transfer/migrate_account"
```

---

## POST /transfer/migrate_account

**Migrate account into Transfers**

As an alternative to adding Items via Link, you can also use the `/transfer/migrate_account` endpoint to migrate previously-verified account and routing numbers to Plaid Items. This endpoint is also required when adding an Item for use with wire transfers; if you intend to create wire transfers on this account, you must provide `wire_routing_number`. Note that Items created in this way are not compatible with endpoints for other products, such as `/accounts/balance/get`, and can only be used with Transfer endpoints.  If you require access to other endpoints, create the Item through Link instead.  Access to `/transfer/migrate_account` is not enabled by default; to obtain access, contact your Plaid Account Manager or [Support](https://dashboard.plaid.com/support).

### Example

```bash
curl -X POST \
  -H "Authorization: Bearer $TOKEN" \
  "https://production.plaid.com/transfer/migrate_account"
```

---

## POST /transfer/intent/create

**Create a transfer intent object to invoke the Transfer UI**

Use the `/transfer/intent/create` endpoint to generate a transfer intent object and invoke the Transfer UI.

### Example

```bash
curl -X POST \
  -H "Authorization: Bearer $TOKEN" \
  "https://production.plaid.com/transfer/intent/create"
```

---

## POST /transfer/intent/get

**Retrieve more information about a transfer intent**

Use the `/transfer/intent/get` endpoint to retrieve more information about a transfer intent.

### Example

```bash
curl -X POST \
  -H "Authorization: Bearer $TOKEN" \
  "https://production.plaid.com/transfer/intent/get"
```

---

## POST /transfer/repayment/list

**Lists historical repayments**

The `/transfer/repayment/list` endpoint fetches repayments matching the given filters. Repayments are returned in reverse-chronological order (most recent first) starting at the given `start_time`.

### Example

```bash
curl -X POST \
  -H "Authorization: Bearer $TOKEN" \
  "https://production.plaid.com/transfer/repayment/list"
```

---

## POST /transfer/repayment/return/list

**List the returns included in a repayment**

The `/transfer/repayment/return/list` endpoint retrieves the set of returns that were batched together into the specified repayment. The sum of amounts of returns retrieved by this request equals the amount of the repayment.

### Example

```bash
curl -X POST \
  -H "Authorization: Bearer $TOKEN" \
  "https://production.plaid.com/transfer/repayment/return/list"
```

---

## POST /transfer/platform/requirement/submit

**Submit additional onboarding information on behalf of an originator**

Use the `/transfer/platform/requirement/submit` endpoint to submit additional onboarding information that is needed by Plaid to approve or decline the originator. See [Requirement type schema documentation](https://docs.google.com/document/d/1NEQkTD0sVK50iAQi6xHigrexDUxZ4QxXqSEfV_FFTiU/) for a list of requirement types and possible values.

### Example

```bash
curl -X POST \
  -H "Authorization: Bearer $TOKEN" \
  "https://production.plaid.com/transfer/platform/requirement/submit"
```

---

## POST /transfer/originator/create

**Create a new originator**

Use the `/transfer/originator/create` endpoint to create a new originator and return an `originator_client_id`.

### Example

```bash
curl -X POST \
  -H "Authorization: Bearer $TOKEN" \
  "https://production.plaid.com/transfer/originator/create"
```

---

## POST /transfer/questionnaire/create

**Generate a Plaid-hosted onboarding UI URL.**

The `/transfer/questionnaire/create` endpoint generates a Plaid-hosted onboarding UI URL. Redirect the originator to this URL to provide their due diligence information and agree to Plaid’s terms for ACH money movement.

### Example

```bash
curl -X POST \
  -H "Authorization: Bearer $TOKEN" \
  "https://production.plaid.com/transfer/questionnaire/create"
```

---

## POST /transfer/diligence/submit

**Submit transfer diligence on behalf of the originator**

Use the `/transfer/diligence/submit` endpoint to submit transfer diligence on behalf of the originator (i.e., the end customer).

### Example

```bash
curl -X POST \
  -H "Authorization: Bearer $TOKEN" \
  "https://production.plaid.com/transfer/diligence/submit"
```

---

## POST /transfer/diligence/document/upload

**Upload transfer diligence document on behalf of the originator**

Third-party sender customers can use `/transfer/diligence/document/upload` endpoint to upload a document on behalf of its end customer (i.e. originator) to Plaid. You’ll need to send a request of type multipart/form-data.
You must provide the `client_id` in the `PLAID-CLIENT-ID` header and `secret` in the `PLAID-SECRET` header.

### Example

```bash
curl -X POST \
  -H "Authorization: Bearer $TOKEN" \
  "https://production.plaid.com/transfer/diligence/document/upload"
```

---

## POST /transfer/originator/get

**Get status of an originator's onboarding**

The `/transfer/originator/get` endpoint gets status updates for an originator's onboarding process. This information is also available via the Transfer page on the Plaid dashboard.

### Example

```bash
curl -X POST \
  -H "Authorization: Bearer $TOKEN" \
  "https://production.plaid.com/transfer/originator/get"
```

---

## POST /transfer/originator/list

**Get status of all originators' onboarding**

The `/transfer/originator/list` endpoint gets status updates for all of your originators' onboarding. This information is also available via the Plaid dashboard.

### Example

```bash
curl -X POST \
  -H "Authorization: Bearer $TOKEN" \
  "https://production.plaid.com/transfer/originator/list"
```

---

## POST /transfer/refund/create

**Create a refund**

Use the `/transfer/refund/create` endpoint to create a refund for a transfer. A transfer can be refunded if the transfer was initiated in the past 180 days.

Refunds come out of the available balance of the ledger used for the original debit transfer. If there are not enough funds in the available balance to cover the refund amount, the refund will be rejected. You can create a refund at any time. Plaid does not impose any hold time on refunds.

A refund can still be issued even if the Item's `access_token` is no longer valid (e.g. if the user revoked OAuth consent or the Item was deleted via `/item/remove`), as long as the account and routing number pair used to make the original transaction is still valid. A refund cannot be issued if the Item has an [invalidated TAN](https://plaid.com/docs/auth/#tokenized-account-numbers), which can occur at Chase or PNC.

### Example

```bash
curl -X POST \
  -H "Authorization: Bearer $TOKEN" \
  "https://production.plaid.com/transfer/refund/create"
```

---

## POST /transfer/refund/get

**Retrieve a refund**

The `/transfer/refund/get` endpoint fetches information about the refund corresponding to the given `refund_id`.

### Example

```bash
curl -X POST \
  -H "Authorization: Bearer $TOKEN" \
  "https://production.plaid.com/transfer/refund/get"
```

---

## POST /transfer/refund/cancel

**Cancel a refund**

Use the `/transfer/refund/cancel` endpoint to cancel a refund.  A refund is eligible for cancellation if it has not yet been submitted to the payment network.

### Example

```bash
curl -X POST \
  -H "Authorization: Bearer $TOKEN" \
  "https://production.plaid.com/transfer/refund/cancel"
```

---

## POST /transfer/platform/originator/create

**Create an originator for Transfer for Platforms customers**

Use the `/transfer/platform/originator/create` endpoint to submit information about the originator you are onboarding, including the originator's agreement to the required legal terms.

### Example

```bash
curl -X POST \
  -H "Authorization: Bearer $TOKEN" \
  "https://production.plaid.com/transfer/platform/originator/create"
```

---

## POST /transfer/platform/person/create

**Create a person associated with an originator**

Use the `/transfer/platform/person/create` endpoint to create a person associated with an originator (e.g. beneficial owner or control person) and optionally submit personal identification information for them.

### Example

```bash
curl -X POST \
  -H "Authorization: Bearer $TOKEN" \
  "https://production.plaid.com/transfer/platform/person/create"
```

---

## POST /sandbox/bank_transfer/simulate

**Simulate a bank transfer event in Sandbox**

Use the `/sandbox/bank_transfer/simulate` endpoint to simulate a bank transfer event in the Sandbox environment.  Note that while an event will be simulated and will appear when using endpoints such as `/bank_transfer/event/sync` or `/bank_transfer/event/list`, no transactions will actually take place and funds will not move between accounts, even within the Sandbox.

### Example

```bash
curl -X POST \
  -H "Authorization: Bearer $TOKEN" \
  "https://production.plaid.com/sandbox/bank_transfer/simulate"
```

---

## POST /sandbox/transfer/sweep/simulate

**Simulate creating a sweep**

Use the `/sandbox/transfer/sweep/simulate` endpoint to create a sweep and associated events in the Sandbox environment. Upon calling this endpoint, all transfers with a sweep status of `swept` will become `swept_settled`, all `posted` or `pending` transfers with a sweep status of `unswept` will become `swept`, and all `returned` transfers with a sweep status of `swept` will become `return_swept`.

### Example

```bash
curl -X POST \
  -H "Authorization: Bearer $TOKEN" \
  "https://production.plaid.com/sandbox/transfer/sweep/simulate"
```

---

## POST /sandbox/transfer/simulate

**Simulate a transfer event in Sandbox**

Use the `/sandbox/transfer/simulate` endpoint to simulate a transfer event in the Sandbox environment.  Note that while an event will be simulated and will appear when using endpoints such as `/transfer/event/sync` or `/transfer/event/list`, no transactions will actually take place and funds will not move between accounts, even within the Sandbox.

### Example

```bash
curl -X POST \
  -H "Authorization: Bearer $TOKEN" \
  "https://production.plaid.com/sandbox/transfer/simulate"
```

---

## POST /sandbox/transfer/refund/simulate

**Simulate a refund event in Sandbox**

Use the `/sandbox/transfer/refund/simulate` endpoint to simulate a refund event in the Sandbox environment.  Note that while an event will be simulated and will appear when using endpoints such as `/transfer/event/sync` or `/transfer/event/list`, no transactions will actually take place and funds will not move between accounts, even within the Sandbox.

### Example

```bash
curl -X POST \
  -H "Authorization: Bearer $TOKEN" \
  "https://production.plaid.com/sandbox/transfer/refund/simulate"
```

---

## POST /sandbox/transfer/ledger/simulate_available

**Simulate converting pending balance to available balance**

Use the `/sandbox/transfer/ledger/simulate_available` endpoint to simulate converting pending balance to available balance for all originators in the Sandbox environment.

### Example

```bash
curl -X POST \
  -H "Authorization: Bearer $TOKEN" \
  "https://production.plaid.com/sandbox/transfer/ledger/simulate_available"
```

---

## POST /sandbox/transfer/ledger/deposit/simulate

**Simulate a ledger deposit event in Sandbox**

Use the `/sandbox/transfer/ledger/deposit/simulate` endpoint to simulate a ledger deposit event in the Sandbox environment.

### Example

```bash
curl -X POST \
  -H "Authorization: Bearer $TOKEN" \
  "https://production.plaid.com/sandbox/transfer/ledger/deposit/simulate"
```

---

## POST /sandbox/transfer/ledger/withdraw/simulate

**Simulate a ledger withdraw event in Sandbox**

Use the `/sandbox/transfer/ledger/withdraw/simulate` endpoint to simulate a ledger withdraw event in the Sandbox environment.

### Example

```bash
curl -X POST \
  -H "Authorization: Bearer $TOKEN" \
  "https://production.plaid.com/sandbox/transfer/ledger/withdraw/simulate"
```

---

## POST /sandbox/transfer/repayment/simulate

**Trigger the creation of a repayment**

Use the `/sandbox/transfer/repayment/simulate` endpoint to trigger the creation of a repayment. As a side effect of calling this route, a repayment is created that includes all unreimbursed returns of guaranteed transfers. If there are no such returns, an 400 error is returned.

### Example

```bash
curl -X POST \
  -H "Authorization: Bearer $TOKEN" \
  "https://production.plaid.com/sandbox/transfer/repayment/simulate"
```

---

## POST /sandbox/transfer/fire_webhook

**Manually fire a Transfer webhook**

Use the `/sandbox/transfer/fire_webhook` endpoint to manually trigger a `TRANSFER_EVENTS_UPDATE` webhook in the Sandbox environment.

### Example

```bash
curl -X POST \
  -H "Authorization: Bearer $TOKEN" \
  "https://production.plaid.com/sandbox/transfer/fire_webhook"
```

---

## POST /sandbox/transfer/test_clock/create

**Create a test clock**

Use the `/sandbox/transfer/test_clock/create` endpoint to create a `test_clock` in the Sandbox environment.

A test clock object represents an independent timeline and has a `virtual_time` field indicating the current timestamp of the timeline. Test clocks are used for testing recurring transfers in Sandbox.

A test clock can be associated with up to 5 recurring transfers.

### Example

```bash
curl -X POST \
  -H "Authorization: Bearer $TOKEN" \
  "https://production.plaid.com/sandbox/transfer/test_clock/create"
```

---

## POST /sandbox/transfer/test_clock/advance

**Advance a test clock**

Use the `/sandbox/transfer/test_clock/advance` endpoint to advance a `test_clock` in the Sandbox environment.

A test clock object represents an independent timeline and has a `virtual_time` field indicating the current timestamp of the timeline. A test clock can be advanced by incrementing `virtual_time`, but may never go back to a lower `virtual_time`.

If a test clock is advanced, we will simulate the changes that ought to occur during the time that elapsed.

For example, a client creates a weekly recurring transfer with a test clock set at t. When the client advances the test clock by setting `virtual_time` = t + 15 days, 2 new originations should be created, along with the webhook events.

The advancement of the test clock from its current `virtual_time` should be limited such that there are no more than 20 originations resulting from the advance operation on each `recurring_transfer` associated with the `test_clock`.

For example, if the recurring transfer associated with this test clock originates once every 4 weeks, you can advance the `virtual_time` up to 80 weeks on each API call.

### Example

```bash
curl -X POST \
  -H "Authorization: Bearer $TOKEN" \
  "https://production.plaid.com/sandbox/transfer/test_clock/advance"
```

---

## POST /sandbox/transfer/test_clock/get

**Get a test clock**

Use the `/sandbox/transfer/test_clock/get` endpoint to get a `test_clock` in the Sandbox environment.

### Example

```bash
curl -X POST \
  -H "Authorization: Bearer $TOKEN" \
  "https://production.plaid.com/sandbox/transfer/test_clock/get"
```

---

## POST /sandbox/transfer/test_clock/list

**List test clocks**

Use the `/sandbox/transfer/test_clock/list` endpoint to see a list of all your test clocks in the Sandbox environment, by ascending `virtual_time`. Results are paginated; use the `count` and `offset` query parameters to retrieve the desired test clocks.

### Example

```bash
curl -X POST \
  -H "Authorization: Bearer $TOKEN" \
  "https://production.plaid.com/sandbox/transfer/test_clock/list"
```

---

## POST /sandbox/payment_profile/reset_login

**Reset the login of a Payment Profile**

`/sandbox/payment_profile/reset_login/` forces a Payment Profile into a state where the login is no longer valid. This makes it easy to test update mode for Payment Profile in the Sandbox environment.

 After calling `/sandbox/payment_profile/reset_login`, calls to the `/transfer/authorization/create` with the Payment Profile will result in a `decision_rationale` `PAYMENT_PROFILE_LOGIN_REQUIRED`. You can then use update mode for Payment Profile to restore it into a good state.

 In order to invoke this endpoint, you must first [create a Payment Profile](https://plaid.com/docs/transfer/add-to-app/#create-a-payment-profile-optional) and [go through the Link flow](https://plaid.com/docs/transfer/add-to-app/#create-a-link-token).

### Example

```bash
curl -X POST \
  -H "Authorization: Bearer $TOKEN" \
  "https://production.plaid.com/sandbox/payment_profile/reset_login"
```

---

## POST /sandbox/payment/simulate

**Simulate a payment event in Sandbox**

Use the `/sandbox/payment/simulate` endpoint to simulate various payment events in the Sandbox environment. This endpoint will trigger the corresponding payment status webhook.

### Example

```bash
curl -X POST \
  -H "Authorization: Bearer $TOKEN" \
  "https://production.plaid.com/sandbox/payment/simulate"
```

---

## POST /employers/search

**Search employer database**

`/employers/search` allows you the ability to search Plaid’s database of known employers, for use with Deposit Switch. You can use this endpoint to look up a user's employer in order to confirm that they are supported. Users with non-supported employers can then be routed out of the Deposit Switch flow.

The data in the employer database is currently limited. As the Deposit Switch and Income products progress through their respective beta periods, more employers are being regularly added. Because the employer database is frequently updated, we recommend that you do not cache or store data from this endpoint for more than a day.

### Example

```bash
curl -X POST \
  -H "Authorization: Bearer $TOKEN" \
  "https://production.plaid.com/employers/search"
```

---

## POST /income/verification/create

**(Deprecated) Create an income verification instance**

`/income/verification/create` begins the income verification process by returning an `income_verification_id`. You can then provide the `income_verification_id` to `/link/token/create` under the `income_verification` parameter in order to create a Link instance that will prompt the user to go through the income verification flow. Plaid will fire an `INCOME` webhook once the user completes the Payroll Income flow, or when the uploaded documents in the Document Income flow have finished processing. 

### Example

```bash
curl -X POST \
  -H "Authorization: Bearer $TOKEN" \
  "https://production.plaid.com/income/verification/create"
```

---

## POST /income/verification/paystubs/get

**(Deprecated) Retrieve information from the paystubs used for income verification**

`/income/verification/paystubs/get` returns the information collected from the paystubs that were used to verify an end user's income. It can be called once the status of the verification has been set to `VERIFICATION_STATUS_PROCESSING_COMPLETE`, as reported by the `INCOME: verification_status` webhook. Attempting to call the endpoint before verification has been completed will result in an error.

This endpoint has been deprecated; new integrations should use `/credit/payroll_income/get` instead.

### Example

```bash
curl -X POST \
  -H "Authorization: Bearer $TOKEN" \
  "https://production.plaid.com/income/verification/paystubs/get"
```

---

## POST /income/verification/documents/download

**(Deprecated) Download the original documents used for income verification**

`/income/verification/documents/download` provides the ability to download the source documents associated with the verification.

If Document Income was used, the documents will be those the user provided in Link. For Payroll Income, the most recent files available
for download from the payroll provider will be available from this endpoint.

The response to `/income/verification/documents/download` is a ZIP file in binary data. If a `document_id` is passed, a single document will be contained in this file.
If not, the response will contain all documents associated with the verification.

The `request_id` is returned in the `Plaid-Request-ID` header.

### Example

```bash
curl -X POST \
  -H "Authorization: Bearer $TOKEN" \
  "https://production.plaid.com/income/verification/documents/download"
```

---

## POST /income/verification/taxforms/get

**(Deprecated) Retrieve information from the tax documents used for income verification**

`/income/verification/taxforms/get` returns the information collected from forms that were used to verify an end user''s income. It can be called once the status of the verification has been set to `VERIFICATION_STATUS_PROCESSING_COMPLETE`, as reported by the `INCOME: verification_status` webhook. Attempting to call the endpoint before verification has been completed will result in an error.

This endpoint has been deprecated; new integrations should use `/credit/payroll_income/get` instead.

### Example

```bash
curl -X POST \
  -H "Authorization: Bearer $TOKEN" \
  "https://production.plaid.com/income/verification/taxforms/get"
```

---

## POST /income/verification/precheck

**(Deprecated) Check digital income verification eligibility and optimize conversion**

`/income/verification/precheck` is an optional endpoint that can be called before initializing a Link session for income verification. It evaluates whether a given user is supportable by digital income verification and returns a `precheck_id` that can be provided to `/link/token/create`. If the user is eligible for digital verification, providing the `precheck_id` in this way will generate a Link UI optimized for the end user and their specific employer. If the user cannot be confirmed as eligible, the `precheck_id` can still be provided to `/link/token/create` and the user can still use the income verification flow, but they may be required to manually upload a paystub to verify their income.

While all request fields are optional, providing either `employer` or `transactions_access_tokens` data will increase the chance of receiving a useful result.

This endpoint has been deprecated; new integrations should use `/credit/payroll_income/precheck` instead.

### Example

```bash
curl -X POST \
  -H "Authorization: Bearer $TOKEN" \
  "https://production.plaid.com/income/verification/precheck"
```

---

## POST /employment/verification/get

**(Deprecated) Retrieve a summary of an individual's employment information**

`/employment/verification/get` returns a list of employments through a user payroll that was verified by an end user.

This endpoint has been deprecated; new integrations should use `/credit/employment/get` instead.

### Example

```bash
curl -X POST \
  -H "Authorization: Bearer $TOKEN" \
  "https://production.plaid.com/employment/verification/get"
```

---

## POST /credit/audit_copy_token/create

**Create Asset or Income Report Audit Copy Token**

Plaid can create an Audit Copy token of an Asset Report and/or Income Report to share with participating Government Sponsored Entity (GSE). If you participate in the Day 1 Certainty™ program, Plaid can supply an Audit Copy token directly to Fannie Mae on your behalf. An Audit Copy token contains the same underlying data as the Asset Report and/or Income Report (result of `/credit/payroll_income/get`).

Use the `/credit/audit_copy_token/create` endpoint to create an `audit_copy_token` and then pass that token to the GSE who needs access.

### Example

```bash
curl -X POST \
  -H "Authorization: Bearer $TOKEN" \
  "https://production.plaid.com/credit/audit_copy_token/create"
```

---

## POST /credit/audit_copy_token/remove

**Remove an Audit Copy token**

The `/credit/audit_copy_token/remove` endpoint allows you to remove an Audit Copy. Removing an Audit Copy invalidates the `audit_copy_token` associated with it, meaning both you and any third parties holding the token will no longer be able to use it to access Report data. Items associated with the Report data and other Audit Copies of it are not affected and will remain accessible after removing the given Audit Copy.

### Example

```bash
curl -X POST \
  -H "Authorization: Bearer $TOKEN" \
  "https://production.plaid.com/credit/audit_copy_token/remove"
```

---

## POST /credit/asset_report/freddie_mac/get

**Retrieve an Asset Report with Freddie Mac format. Only Freddie Mac can use this endpoint.**

The `credit/asset_report/freddie_mac/get` endpoint retrieves the Asset Report in Freddie Mac's JSON format.

### Example

```bash
curl -X POST \
  -H "Authorization: Bearer $TOKEN" \
  "https://production.plaid.com/credit/asset_report/freddie_mac/get"
```

---

## POST /credit/freddie_mac/reports/get

**Retrieve an Asset Report with Freddie Mac format (aka VOA - Verification Of Assets), and a Verification Of Employment (VOE) report if this one is available. Only Freddie Mac can use this endpoint.**

The `credit/asset_report/freddie_mac/get` endpoint retrieves the Verification of Assets and Verification of Employment reports.

### Example

```bash
curl -X POST \
  -H "Authorization: Bearer $TOKEN" \
  "https://production.plaid.com/credit/freddie_mac/reports/get"
```

---

## POST /beta/credit/v1/bank_employment/get

**Retrieve information from the bank accounts used for employment verification**

`/credit/bank_employment/get` returns the employment report(s) derived from bank transaction data for a specified user.

### Example

```bash
curl -X POST \
  -H "Authorization: Bearer $TOKEN" \
  "https://production.plaid.com/beta/credit/v1/bank_employment/get"
```

---

## POST /credit/bank_income/get

**Retrieve information from the bank accounts used for income verification**

`/credit/bank_income/get` returns the bank income report(s) for a specified user. A single report corresponds to all institutions linked in a single Link session. To include multiple institutions in a single report, use [Multi-Item Link](https://plaid.com/docs/link/multi-item-link). To return older reports, use the `options.count` field.

### Example

```bash
curl -X POST \
  -H "Authorization: Bearer $TOKEN" \
  "https://production.plaid.com/credit/bank_income/get"
```

---

## POST /credit/bank_income/pdf/get

**Retrieve information from the bank accounts used for income verification in PDF format**

`/credit/bank_income/pdf/get` returns the most recent bank income report for a specified user in PDF format.  A single report corresponds to all institutions linked in a single Link session. To include multiple institutions in a single report, use [Multi-Item Link](https://plaid.com/docs/link/multi-item-link).

### Example

```bash
curl -X POST \
  -H "Authorization: Bearer $TOKEN" \
  "https://production.plaid.com/credit/bank_income/pdf/get"
```

---

## POST /credit/bank_income/refresh

**Refresh a user's bank income information**

`/credit/bank_income/refresh` refreshes the most recent bank income report data for a specific user. If the most recent bank income report is no longer valid (i.e. deleted), the endpoint will refresh the most recent valid report instead.

### Example

```bash
curl -X POST \
  -H "Authorization: Bearer $TOKEN" \
  "https://production.plaid.com/credit/bank_income/refresh"
```

---

## POST /credit/bank_income/webhook/update

**Subscribe and unsubscribe to proactive notifications for a user's income profile**

`/credit/bank_income/webhook/update` allows you to subscribe or unsubscribe a user for income webhook notifications. By default, all users start out unsubscribed.

If a user is subscribed, on significant changes to the user's income profile, you will receive a `BANK_INCOME_REFRESH_UPDATE` webhook, prompting you to refresh bank income data for the user.

### Example

```bash
curl -X POST \
  -H "Authorization: Bearer $TOKEN" \
  "https://production.plaid.com/credit/bank_income/webhook/update"
```

---

## POST /credit/payroll_income/parsing_config/update

**Update the parsing configuration for a document income verification**

`/credit/payroll_income/parsing_config/update` updates the parsing configuration for a document income verification.

### Example

```bash
curl -X POST \
  -H "Authorization: Bearer $TOKEN" \
  "https://production.plaid.com/credit/payroll_income/parsing_config/update"
```

---

## POST /credit/bank_statements/uploads/get

**Retrieve data for a user's uploaded bank statements**

`/credit/bank_statements/uploads/get` returns parsed data from bank statements uploaded by users as part of the Document Income flow. If your account is not enabled for Document Parsing, contact your account manager to request access.

### Example

```bash
curl -X POST \
  -H "Authorization: Bearer $TOKEN" \
  "https://production.plaid.com/credit/bank_statements/uploads/get"
```

---

## POST /credit/payroll_income/get

**Retrieve a user's payroll information**

This endpoint gets payroll income information for a specific user, either as a result of the user connecting to their payroll provider or uploading a pay related document.

### Example

```bash
curl -X POST \
  -H "Authorization: Bearer $TOKEN" \
  "https://production.plaid.com/credit/payroll_income/get"
```

---

## POST /credit/payroll_income/risk_signals/get

**Retrieve fraud insights for a user's manually uploaded document(s).**

`/credit/payroll_income/risk_signals/get` can be used as part of the Document Income flow to assess a user-uploaded document for signs of potential fraud or tampering. It returns a risk score for each uploaded document that indicates the likelihood of the document being fraudulent, in addition to details on the individual risk signals contributing to the score.

To trigger risk signal generation for an Item, call `/link/token/create` with `parsing_config` set to include `risk_signals`, or call `/credit/payroll_income/parsing_config/update`. Once risk signal generation has been triggered, `/credit/payroll_income/risk_signals/get` can be called at any time after the `INCOME_VERIFICATION_RISK_SIGNALS` webhook has been fired.

`/credit/payroll_income/risk_signals/get` is offered as an add-on to Document Income and is billed separately. To request access to this endpoint, submit a product access request or contact your Plaid account manager.

### Example

```bash
curl -X POST \
  -H "Authorization: Bearer $TOKEN" \
  "https://production.plaid.com/credit/payroll_income/risk_signals/get"
```

---

## POST /credit/payroll_income/precheck

**Check income verification eligibility and optimize conversion**

`/credit/payroll_income/precheck` is an optional endpoint that can be called before initializing a Link session for income verification. It evaluates whether a given user is supportable by digital income verification. If the user is eligible for digital verification, that information will be associated with the user token, and in this way will generate a Link UI optimized for the end user and their specific employer. If the user cannot be confirmed as eligible, the user can still use the income verification flow, but they may be required to manually upload a paystub to verify their income.

While all request fields are optional, providing `employer` data will increase the chance of receiving a useful result.

When testing in Sandbox, you can control the results by providing special test values in the `employer` and `access_tokens` fields. `employer_good` and `employer_bad` will result in `HIGH` and `LOW` confidence values, respectively. `employer_multi` will result in a `HIGH` confidence with multiple payroll options. Likewise, `access_good` and `access_bad` will result in `HIGH` and `LOW` confidence values, respectively. Any other value for `employer` and `access_tokens` in Sandbox will result in `UNKNOWN` confidence.

### Example

```bash
curl -X POST \
  -H "Authorization: Bearer $TOKEN" \
  "https://production.plaid.com/credit/payroll_income/precheck"
```

---

## POST /credit/employment/get

**Retrieve a summary of an individual's employment information**

`/credit/employment/get` returns a list of items with employment information from a user's payroll provider that was verified by an end user.

### Example

```bash
curl -X POST \
  -H "Authorization: Bearer $TOKEN" \
  "https://production.plaid.com/credit/employment/get"
```

---

## POST /credit/payroll_income/refresh

**Refresh a digital payroll income verification**

`/credit/payroll_income/refresh` refreshes a given digital payroll income verification.

### Example

```bash
curl -X POST \
  -H "Authorization: Bearer $TOKEN" \
  "https://production.plaid.com/credit/payroll_income/refresh"
```

---

## POST /credit/relay/create

**Create a relay token to share an Asset Report with a partner client**

Plaid can share an Asset Report directly with a participating third party on your behalf. The shared Asset Report is the exact same Asset Report originally created in `/asset_report/create`.

To grant a third party access to an Asset Report, use the `/credit/relay/create` endpoint to create a `relay_token` and then pass that token to your third party. Each third party has its own `secondary_client_id`; for example, `ce5bd328dcd34123456`. You'll need to create a separate `relay_token` for each third party that needs access to the report on your behalf.

### Example

```bash
curl -X POST \
  -H "Authorization: Bearer $TOKEN" \
  "https://production.plaid.com/credit/relay/create"
```

---

## POST /credit/relay/get

**Retrieve the reports associated with a relay token that was shared with you**

`/credit/relay/get` allows third parties to receive a report that was shared with them, using a `relay_token` that was created by the report owner.

### Example

```bash
curl -X POST \
  -H "Authorization: Bearer $TOKEN" \
  "https://production.plaid.com/credit/relay/get"
```

---

## POST /credit/relay/pdf/get

**Retrieve the pdf reports associated with a relay token that was shared with you (beta)**

`/credit/relay/pdf/get` allows third parties to receive a pdf report that was shared with them, using a `relay_token` that was created by the report owner.

The `/credit/relay/pdf/get` endpoint retrieves the Asset Report in PDF format. Before calling `/credit/relay/pdf/get`, you must first create the Asset Report using `/credit/relay/create` and then wait for the [`PRODUCT_READY`](https://plaid.com/docs/api/products/assets/#product_ready) webhook to fire, indicating that the Report is ready to be retrieved.

The response to `/credit/relay/pdf/get` is the PDF binary data. The `request_id` is returned in the `Plaid-Request-ID` header.

[View a sample PDF Asset Report](https://plaid.com/documents/sample-asset-report.pdf).

### Example

```bash
curl -X POST \
  -H "Authorization: Bearer $TOKEN" \
  "https://production.plaid.com/credit/relay/pdf/get"
```

---

## POST /credit/relay/refresh

**Refresh a report of a relay token**

The `/credit/relay/refresh` endpoint allows third parties to refresh a report that was relayed to them, using a `relay_token` that was created by the report owner. A new report will be created with the original report parameters, but with the most recent data available based on the `days_requested` value of the original report.

### Example

```bash
curl -X POST \
  -H "Authorization: Bearer $TOKEN" \
  "https://production.plaid.com/credit/relay/refresh"
```

---

## POST /credit/relay/remove

**Remove relay token**

The `/credit/relay/remove` endpoint allows you to invalidate a `relay_token`. The third party holding the token will no longer be able to access or refresh the reports which the `relay_token` gives access to. The original report, associated Items, and other relay tokens that provide access to the same report are not affected and will remain accessible after removing the given `relay_token`.

### Example

```bash
curl -X POST \
  -H "Authorization: Bearer $TOKEN" \
  "https://production.plaid.com/credit/relay/remove"
```

---

## POST /sandbox/bank_transfer/fire_webhook

**Manually fire a Bank Transfer webhook**

Use the `/sandbox/bank_transfer/fire_webhook` endpoint to manually trigger a Bank Transfers webhook in the Sandbox environment.

### Example

```bash
curl -X POST \
  -H "Authorization: Bearer $TOKEN" \
  "https://production.plaid.com/sandbox/bank_transfer/fire_webhook"
```

---

## POST /sandbox/income/fire_webhook

**Manually fire an Income webhook**

Use the `/sandbox/income/fire_webhook` endpoint to manually trigger a Payroll or Document Income webhook in the Sandbox environment.

### Example

```bash
curl -X POST \
  -H "Authorization: Bearer $TOKEN" \
  "https://production.plaid.com/sandbox/income/fire_webhook"
```

---

## POST /sandbox/bank_income/fire_webhook

**Manually fire a bank income webhook in sandbox**

Use the `/sandbox/bank_income/fire_webhook` endpoint to manually trigger a Bank Income webhook in the Sandbox environment.

### Example

```bash
curl -X POST \
  -H "Authorization: Bearer $TOKEN" \
  "https://production.plaid.com/sandbox/bank_income/fire_webhook"
```

---

## POST /sandbox/cra/cashflow_updates/update

**Trigger an update for Cash Flow Updates**

Use the `/sandbox/cra/cashflow_updates/update` endpoint to manually trigger an update for Cash Flow Updates (Monitoring) in the Sandbox environment.

### Example

```bash
curl -X POST \
  -H "Authorization: Bearer $TOKEN" \
  "https://production.plaid.com/sandbox/cra/cashflow_updates/update"
```

---

## POST /sandbox/oauth/select_accounts

**Save the selected accounts when connecting to the Platypus Oauth institution**

Save the selected accounts when connecting to the Platypus Oauth institution

### Example

```bash
curl -X POST \
  -H "Authorization: Bearer $TOKEN" \
  "https://production.plaid.com/sandbox/oauth/select_accounts"
```

---

## POST /signal/evaluate

**Evaluate a planned ACH transaction**

Use `/signal/evaluate` to evaluate a planned ACH transaction to get a return risk assessment and additional risk signals.

Before using `/signal/evaluate`, you must first [create a ruleset](https://plaid.com/docs/signal/signal-rules/) in the Dashboard under [**Signal->Rules**](https://dashboard.plaid.com/signal/risk-profiles). 

`/signal/evaluate` can be used with either Signal Transaction Scores or the Balance product. Which product is used will be determined by the `ruleset_key` that you provide. For more details, see [Signal Rules](https://plaid.com/docs/signal/signal-rules/).

Note: This request may have higher latency when using a Balance-only ruleset. This is because Plaid must communicate directly with the institution to request data. Balance-only rulesets may have latency of up to 30 seconds or more; if you encounter errors, you may find it necessary to adjust your timeout period when making requests.

### Example

```bash
curl -X POST \
  -H "Authorization: Bearer $TOKEN" \
  "https://production.plaid.com/signal/evaluate"
```

---

## POST /signal/schedule

**Schedule a planned ACH transaction**

Use `/signal/schedule` to schedule a planned ACH transaction.

### Example

```bash
curl -X POST \
  -H "Authorization: Bearer $TOKEN" \
  "https://production.plaid.com/signal/schedule"
```

---

## POST /signal/decision/report

**Report whether you initiated an ACH transaction**

After you call `/signal/evaluate`, Plaid will normally infer the outcome from your Signal Rules. However, if you are not using Signal Rules, if the Signal Rules outcome was `REVIEW`, or if you take a different action than the one determined by the Signal Rules, you will need to call `/signal/decision/report`. This helps improve Signal Transaction Score accuracy for your account and is necessary for proper functioning of the rule performance and rule tuning capabilities in the Dashboard. If your effective decision changes after calling `/signal/decision/report` (for example, you indicated that you accepted a transaction, but later on, your payment processor rejected it, so it was never initiated), call `/signal/decision/report` again for the transaction to correct Plaid's records.  

If you are using Plaid Transfer as your payment processor, you also do not need to call `/signal/decision/report`, as Plaid can infer outcomes from your Transfer activity.

If using a Balance-only ruleset, this endpoint will not impact scores (Balance does not use scores), but is necessary to view accurate transaction outcomes and tune rule logic in the Dashboard.

### Example

```bash
curl -X POST \
  -H "Authorization: Bearer $TOKEN" \
  "https://production.plaid.com/signal/decision/report"
```

---

## POST /signal/return/report

**Report a return for an ACH transaction**

Call the `/signal/return/report` endpoint to report a returned transaction that was previously sent to the `/signal/evaluate` endpoint. Your feedback will be used by the model to incorporate the latest risk trends into your scores and tune rule logic. If using a Balance-only ruleset, this endpoint will not impact scores (as Balance does not use scores), but is necessary to view accurate transaction outcomes and tune rule logic in the Dashboard.

### Example

```bash
curl -X POST \
  -H "Authorization: Bearer $TOKEN" \
  "https://production.plaid.com/signal/return/report"
```

---

## POST /signal/prepare

**Opt-in an Item to Signal Transaction Scores**

When an Item is not initialized with `signal`, call `/signal/prepare` to opt-in that Item to the data collection process used to develop a Signal Transaction Score. This should be done on Items where `signal` was added in the `additional_consented_products` array but not in the `products`, `optional_products`, or `required_if_supported_products` array. If `/signal/prepare` is skipped on an Item that is not initialized with `signal`, the initial call to `/signal/evaluate` on that Item will be less accurate, because Plaid will have access to less data for computing the Signal Transaction Score.

If your integration is purely Balance-only, this endpoint will have no effect, as Balance-only rulesets do not calculate a Signal Transaction Score. 

If run on an Item that is already initialized with `signal`, this endpoint will return a 200 response and will not modify the Item.

### Example

```bash
curl -X POST \
  -H "Authorization: Bearer $TOKEN" \
  "https://production.plaid.com/signal/prepare"
```

---

## POST /wallet/create

**Create an e-wallet**

Create an e-wallet. The response is the newly created e-wallet object.

### Example

```bash
curl -X POST \
  -H "Authorization: Bearer $TOKEN" \
  "https://production.plaid.com/wallet/create"
```

---

## POST /wallet/get

**Fetch an e-wallet**

Fetch an e-wallet. The response includes the current balance.

### Example

```bash
curl -X POST \
  -H "Authorization: Bearer $TOKEN" \
  "https://production.plaid.com/wallet/get"
```

---

## POST /wallet/list

**Fetch a list of e-wallets**

This endpoint lists all e-wallets in descending order of creation.

### Example

```bash
curl -X POST \
  -H "Authorization: Bearer $TOKEN" \
  "https://production.plaid.com/wallet/list"
```

---

## POST /wallet/transaction/execute

**Execute a transaction using an e-wallet**

Execute a transaction using the specified e-wallet.
Specify the e-wallet to debit from, the counterparty to credit to, the idempotency key to prevent duplicate transactions, the amount and reference for the transaction.
Transactions will settle in seconds to several days, depending on the underlying payment rail.

### Example

```bash
curl -X POST \
  -H "Authorization: Bearer $TOKEN" \
  "https://production.plaid.com/wallet/transaction/execute"
```

---

## POST /wallet/transaction/get

**Fetch an e-wallet transaction**

Fetch a specific e-wallet transaction

### Example

```bash
curl -X POST \
  -H "Authorization: Bearer $TOKEN" \
  "https://production.plaid.com/wallet/transaction/get"
```

---

## POST /wallet/transaction/list

**List e-wallet transactions**

This endpoint lists the latest transactions of the specified e-wallet. Transactions are returned in descending order by the `created_at` time.

### Example

```bash
curl -X POST \
  -H "Authorization: Bearer $TOKEN" \
  "https://production.plaid.com/wallet/transaction/list"
```

---

## POST /beta/transactions/v1/enhance

**enhance locally-held transaction data**

The `/beta/transactions/v1/enhance` endpoint enriches raw transaction data provided directly by clients.

The product is currently in beta.

### Example

```bash
curl -X POST \
  -H "Authorization: Bearer $TOKEN" \
  "https://production.plaid.com/beta/transactions/v1/enhance"
```

---

## POST /beta/transactions/rules/v1/create

**Create transaction category rule**

The `/transactions/rules/v1/create` endpoint creates transaction categorization rules.

Rules will be applied on the Item's transactions returned in `/transactions/get` response.

The product is currently in beta. To request access, contact transactions-feedback@plaid.com.

### Example

```bash
curl -X POST \
  -H "Authorization: Bearer $TOKEN" \
  "https://production.plaid.com/beta/transactions/rules/v1/create"
```

---

## POST /beta/transactions/rules/v1/list

**Return a list of rules created for the Item associated with the access token.**

The `/transactions/rules/v1/list` returns a list of transaction rules created for the Item associated with the access token.

### Example

```bash
curl -X POST \
  -H "Authorization: Bearer $TOKEN" \
  "https://production.plaid.com/beta/transactions/rules/v1/list"
```

---

## POST /beta/transactions/rules/v1/remove

**Remove transaction rule**

The `/transactions/rules/v1/remove` endpoint is used to remove a transaction rule.

### Example

```bash
curl -X POST \
  -H "Authorization: Bearer $TOKEN" \
  "https://production.plaid.com/beta/transactions/rules/v1/remove"
```

---

## POST /beta/transactions/user_insights/v1/get

**Obtain user insights based on transactions sent through /transactions/enrich**

The `/beta/transactions/user_insights/v1/get` gets user insights for clients who have enriched data with `/transactions/enrich`.

The product is currently in beta.

### Example

```bash
curl -X POST \
  -H "Authorization: Bearer $TOKEN" \
  "https://production.plaid.com/beta/transactions/user_insights/v1/get"
```

---

## POST /beta/ewa_report/v1/get

**Get EWA Score Report**

The `/beta/ewa_report/v1/get` endpoint provides an Earned Wage Access (EWA) score that quantifies the delinquency risk associated with a given item. The score is derived from a combination of cashflow patterns and network-based behavioral features.

The response returns a list of EWA scores, where each score corresponds to a potential advance amount range. These scores estimate the likelihood of repayment for advances within that range.

Score range: 1–99

Interpretation: Higher scores indicate a greater likelihood of repayment.

This endpoint enables clients to assess repayment risk and make data-driven decisions when determining eligibility or limits for earned wage advances.

### Example

```bash
curl -X POST \
  -H "Authorization: Bearer $TOKEN" \
  "https://production.plaid.com/beta/ewa_report/v1/get"
```

---

## POST /issues/search

**Search for an Issue**

Search for an issue associated with one of the following identifiers:  `item_id`, `link_session_id` or Link session `request_id`.
This endpoint returns a list of `Issue` objects, with an empty list indicating that no issues are associated with the
provided identifier. At least one of the identifiers must be provided to perform the search.

### Example

```bash
curl -X POST \
  -H "Authorization: Bearer $TOKEN" \
  "https://production.plaid.com/issues/search"
```

---

## POST /issues/get

**Get an Issue**

Retrieve detailed information about a specific `Issue`. This endpoint returns a single `Issue` object.

### Example

```bash
curl -X POST \
  -H "Authorization: Bearer $TOKEN" \
  "https://production.plaid.com/issues/get"
```

---

## POST /issues/subscribe

**Subscribe to an Issue**

Allows a user to subscribe to updates on a specific `Issue` using a POST method. Subscribers will receive webhook notifications when the issue status changes, particularly when resolved.

### Example

```bash
curl -X POST \
  -H "Authorization: Bearer $TOKEN" \
  "https://production.plaid.com/issues/subscribe"
```

---

## POST /payment_profile/create

**Create payment profile**

Use `/payment_profile/create` endpoint to create a new payment profile.
To initiate the account linking experience, call `/link/token/create` and provide the `payment_profile_token` in the `transfer.payment_profile_token` field.
You can then use the `payment_profile_token` when creating transfers using `/transfer/authorization/create` and `/transfer/create`.

### Example

```bash
curl -X POST \
  -H "Authorization: Bearer $TOKEN" \
  "https://production.plaid.com/payment_profile/create"
```

---

## POST /payment_profile/get

**Get payment profile**

Use `/payment_profile/get` endpoint to get the status of a given Payment Profile.

### Example

```bash
curl -X POST \
  -H "Authorization: Bearer $TOKEN" \
  "https://production.plaid.com/payment_profile/get"
```

---

## POST /payment_profile/remove

**Remove payment profile**

Use the `/payment_profile/remove` endpoint to remove a given Payment Profile. Once it’s removed, it can no longer be used to create transfers.

### Example

```bash
curl -X POST \
  -H "Authorization: Bearer $TOKEN" \
  "https://production.plaid.com/payment_profile/remove"
```

---

## POST /partner/customer/create

**Creates a new end customer for a Plaid reseller.**

The `/partner/customer/create` endpoint is used by reseller partners to create end customers. To create end customers, it should be called in the Production environment only, even when creating Sandbox API keys. If called in the Sandbox environment, it will return a sample response, but no customer will be created and the API keys will not be valid.

### Example

```bash
curl -X POST \
  -H "Authorization: Bearer $TOKEN" \
  "https://production.plaid.com/partner/customer/create"
```

---

## POST /partner/customer/get

**Returns a Plaid reseller's end customer.**

The `/partner/customer/get` endpoint is used by reseller partners to retrieve data about a single end customer.

### Example

```bash
curl -X POST \
  -H "Authorization: Bearer $TOKEN" \
  "https://production.plaid.com/partner/customer/get"
```

---

## POST /partner/customer/enable

**Enables a Plaid reseller's end customer in the Production environment.**

The `/partner/customer/enable` endpoint is used by reseller partners to enable an end customer in the full Production environment.

### Example

```bash
curl -X POST \
  -H "Authorization: Bearer $TOKEN" \
  "https://production.plaid.com/partner/customer/enable"
```

---

## POST /partner/customer/remove

**Removes a Plaid reseller's end customer.**

The `/partner/customer/remove` endpoint is used by reseller partners to remove an end customer. Removing an end customer will remove it from view in the Plaid Dashboard and deactivate its API keys. This endpoint can only be used to remove an end customer that has not yet been enabled in full Production.

### Example

```bash
curl -X POST \
  -H "Authorization: Bearer $TOKEN" \
  "https://production.plaid.com/partner/customer/remove"
```

---

## POST /partner/customer/oauth_institutions/get

**Returns OAuth-institution registration information for a given end customer.**

The `/partner/customer/oauth_institutions/get` endpoint is used by reseller partners to retrieve OAuth-institution registration information about a single end customer. To learn how to set up a webhook to listen to status update events, visit the [reseller documentation](https://plaid.com/docs/account/resellers/#enabling-end-customers).

### Example

```bash
curl -X POST \
  -H "Authorization: Bearer $TOKEN" \
  "https://production.plaid.com/partner/customer/oauth_institutions/get"
```

---

## POST /beta/partner/customer/v1/create

**Creates a new end customer for a Plaid reseller.**

The `/beta/partner/customer/v1/create` endpoint creates a new end customer record. You can provide as much information as you have available. If any required information is missing for the products you intend to use, it will be listed in the `requirements_due` field of the response.

### Example

```bash
curl -X POST \
  -H "Authorization: Bearer $TOKEN" \
  "https://production.plaid.com/beta/partner/customer/v1/create"
```

---

## POST /beta/partner/customer/v1/get

**Retrieves the details of a Plaid reseller's end customer.**

The `/beta/partner/customer/v1/get` endpoint is used by reseller partners to retrieve data about a single end customer.

### Example

```bash
curl -X POST \
  -H "Authorization: Bearer $TOKEN" \
  "https://production.plaid.com/beta/partner/customer/v1/get"
```

---

## POST /beta/partner/customer/v1/update

**Updates an existing end customer.**

The `/beta/partner/customer/v1/update` endpoint updates an existing end customer record.

### Example

```bash
curl -X POST \
  -H "Authorization: Bearer $TOKEN" \
  "https://production.plaid.com/beta/partner/customer/v1/update"
```

---

## POST /beta/partner/customer/v1/enable

**Enables a Plaid reseller's end customer in the Production environment.**

The `/beta/partner/customer/v1/enable` endpoint is used by reseller partners to enable an end customer in the full Production environment.

### Example

```bash
curl -X POST \
  -H "Authorization: Bearer $TOKEN" \
  "https://production.plaid.com/beta/partner/customer/v1/enable"
```

---

## POST /link_delivery/create

**Create Hosted Link session**

Use the `/link_delivery/create` endpoint to create a Hosted Link session.

### Example

```bash
curl -X POST \
  -H "Authorization: Bearer $TOKEN" \
  "https://production.plaid.com/link_delivery/create"
```

---

## POST /link_delivery/get

**Get Hosted Link session**

Use the `/link_delivery/get` endpoint to get the status of a Hosted Link session.

### Example

```bash
curl -X POST \
  -H "Authorization: Bearer $TOKEN" \
  "https://production.plaid.com/link_delivery/get"
```

---

## POST /fdx/notifications

**Webhook receiver for fdx notifications**

A generic webhook receiver endpoint for FDX Event Notifications

### Example

```bash
curl -X POST \
  -H "Authorization: Bearer $TOKEN" \
  "https://production.plaid.com/fdx/notifications"
```

---

## GET /fdx/recipients

**Get Recipients**

Returns a list of Recipients

### Example

```bash
curl -X GET \
  -H "Authorization: Bearer $TOKEN" \
  "https://production.plaid.com/fdx/recipients"
```

---

## GET /fdx/recipient/{recipientId}

**Get Recipient**

Get a specific recipient

### Parameters

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| `recipientId` | path | string | Yes | Recipient Identifier. Uniquely identifies the reci |
| `OAUTH-STATE-ID` | header | string | No | The value that is passed into the OAuth URI 'state |

### Example

```bash
curl -X GET \
  -H "Authorization: Bearer $TOKEN" \
  "https://production.plaid.com/fdx/recipient/{recipientId}"
```

---

## POST /network_insights/report/get

**Retrieve network insights for the provided `access_tokens`**

This endpoint allows you to retrieve the Network Insights from a list of `access_tokens`.

### Example

```bash
curl -X POST \
  -H "Authorization: Bearer $TOKEN" \
  "https://production.plaid.com/network_insights/report/get"
```

---
