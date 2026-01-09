---
created: 2026-01-09
tags: [type/api-reference, api/users]
api_name: Apify API
category: Users
endpoint_count: 5
---

# Apify API - Users

[[README|Back to Overview]]

---

## GET /v2/users/{userId}

**Get public user data**

Returns public information about a specific user account, similar to what
can be seen on public profile pages (e.g. https://apify.com/apify).

This operation requires no authentication token.


### Parameters

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| `userId` | path | string | Yes | User ID or username. |

### Example

```bash
curl -X GET \
  -H "Authorization: Bearer $TOKEN" \
  "https://api.apify.com/v2/users/{userId}"
```

---

## GET /v2/users/me

**Get private user data**

Returns information about the current user account, including both public
and private information.

The user account is identified by the provided authentication token.

The fields `plan`, `email` and `profile` are omitted when this endpoint is accessed from Actor run.


### Example

```bash
curl -X GET \
  -H "Authorization: Bearer $TOKEN" \
  "https://api.apify.com/v2/users/me"
```

---

## GET /v2/users/me/usage/monthly

**Get monthly usage**

Returns a complete summary of your usage for the current usage cycle,
an overall sum, as well as a daily breakdown of usage. It is the same
information you will see on your account's [Billing page](https://console.apify.com/billing#/usage). The information
includes your use of storage, data transfer, and request queue usage.

Using the `date` parameter will show your usage in the usage cycle that
includes that date.


### Parameters

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| `date` | query | string | No | Date in the YYYY-MM-DD format. |

### Example

```bash
curl -X GET \
  -H "Authorization: Bearer $TOKEN" \
  "https://api.apify.com/v2/users/me/usage/monthly"
```

---

## GET /v2/users/me/limits

**Get limits**

Returns a complete summary of your account's limits. It is the same
information you will see on your account's [Limits page](https://console.apify.com/billing#/limits). The returned data
includes the current usage cycle, a summary of your limits, and your current usage.


### Example

```bash
curl -X GET \
  -H "Authorization: Bearer $TOKEN" \
  "https://api.apify.com/v2/users/me/limits"
```

---

## PUT /v2/users/me/limits

**Update limits**

Updates the account's limits manageable on your account's [Limits page](https://console.apify.com/billing#/limits).
Specifically the: `maxMonthlyUsageUsd` and `dataRetentionDays` limits (see request body schema for more details).


### Example

```bash
curl -X PUT \
  -H "Authorization: Bearer $TOKEN" \
  "https://api.apify.com/v2/users/me/limits"
```

---
