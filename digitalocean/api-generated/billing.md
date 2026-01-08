---
created: 2026-01-08
tags: [type/api-reference, api/billing]
api_name: DigitalOcean API
category: Billing
endpoint_count: 8
---

# DigitalOcean API - Billing

[[README|Back to Overview]]

---

## GET /v2/customers/my/balance

**Get Customer Balance**

To retrieve the balances on a customer's account, send a GET request to `/v2/customers/my/balance`.

### Example

```bash
curl -X GET \
  -H "Authorization: Bearer $TOKEN" \
  "https://api.digitalocean.com/v2/customers/my/balance"
```

---

## GET /v2/customers/my/billing_history

**List Billing History**

To retrieve a list of all billing history entries, send a GET request to `/v2/customers/my/billing_history`.

### Example

```bash
curl -X GET \
  -H "Authorization: Bearer $TOKEN" \
  "https://api.digitalocean.com/v2/customers/my/billing_history"
```

---

## GET /v2/customers/my/invoices

**List All Invoices**

To retrieve a list of all invoices, send a GET request to `/v2/customers/my/invoices`.

### Parameters

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| `` | query | string | No |  |
| `` | query | string | No |  |

### Example

```bash
curl -X GET \
  -H "Authorization: Bearer $TOKEN" \
  "https://api.digitalocean.com/v2/customers/my/invoices"
```

---

## GET /v2/customers/my/invoices/{invoice_uuid}

**Retrieve an Invoice by UUID**

To retrieve the invoice items for an invoice, send a GET request to `/v2/customers/my/invoices/$INVOICE_UUID`.

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
  "https://api.digitalocean.com/v2/customers/my/invoices/{invoice_uuid}"
```

---

## GET /v2/customers/my/invoices/{invoice_uuid}/csv

**Retrieve an Invoice CSV by UUID**

To retrieve a CSV for an invoice, send a GET request to `/v2/customers/my/invoices/$INVOICE_UUID/csv`.

### Parameters

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| `` | query | string | No |  |

### Example

```bash
curl -X GET \
  -H "Authorization: Bearer $TOKEN" \
  "https://api.digitalocean.com/v2/customers/my/invoices/{invoice_uuid}/csv"
```

---

## GET /v2/customers/my/invoices/{invoice_uuid}/pdf

**Retrieve an Invoice PDF by UUID**

To retrieve a PDF for an invoice, send a GET request to `/v2/customers/my/invoices/$INVOICE_UUID/pdf`.

### Parameters

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| `` | query | string | No |  |

### Example

```bash
curl -X GET \
  -H "Authorization: Bearer $TOKEN" \
  "https://api.digitalocean.com/v2/customers/my/invoices/{invoice_uuid}/pdf"
```

---

## GET /v2/customers/my/invoices/{invoice_uuid}/summary

**Retrieve an Invoice Summary by UUID**

To retrieve a summary for an invoice, send a GET request to `/v2/customers/my/invoices/$INVOICE_UUID/summary`.

### Parameters

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| `` | query | string | No |  |

### Example

```bash
curl -X GET \
  -H "Authorization: Bearer $TOKEN" \
  "https://api.digitalocean.com/v2/customers/my/invoices/{invoice_uuid}/summary"
```

---

## GET /v2/billing/{account_urn}/insights/{start_date}/{end_date}

**List Billing Insights**


This endpoint returns day-over-day changes in billing resource usage based on nightly invoice items, including total amount, region, SKU, and description for a specified date range. It is important to note that the daily resource usage may not reflect month-end billing totals when totaled for a given month as nightly invoice item estimates do not necessarily encompass all invoicing factors for the entire month.

### Parameters

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| `` | query | string | No |  |
| `` | query | string | No |  |
| `` | query | string | No |  |
| `` | query | string | No |  |
| `` | query | string | No |  |

### Example

```bash
curl -X GET \
  -H "Authorization: Bearer $TOKEN" \
  "https://api.digitalocean.com/v2/billing/{account_urn}/insights/{start_date}/{end_date}"
```

---
