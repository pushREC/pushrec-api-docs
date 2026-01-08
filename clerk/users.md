---
created: 2026-01-08
tags: [type/api-reference, api/users]
api_name: Clerk Backend API
category: Users
endpoint_count: 24
---

# Clerk Backend API - Users

[[README|Back to Overview]]

---

## GET /users

**List all users**

Returns a list of all users.
The users are returned sorted by creation date, with the newest users appearing first.

### Parameters

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| `email_address` | query | array | No | Returns users with the specified email addresses.
 |
| `phone_number` | query | array | No | Returns users with the specified phone numbers.
Ac |
| `external_id` | query | array | No | Returns users with the specified external ids.
For |
| `username` | query | array | No | Returns users with the specified usernames.
Accept |
| `web3_wallet` | query | array | No | Returns users with the specified web3 wallet addre |
| `user_id` | query | array | No | Returns users with the user ids specified.
For eac |
| `organization_id` | query | array | No | Returns users that have memberships to the
given o |
| `query` | query | string | No | Returns users that match the given query.
For poss |
| `email_address_query` | query | string | No | Returns users with emails that match the given que |
| `phone_number_query` | query | string | No | Returns users with phone numbers that match the gi |
| `username_query` | query | string | No | Returns users with usernames that match the given  |
| `name_query` | query | string | No | Returns users with names that match the given quer |
| `banned` | query | boolean | No | Returns users which are either banned (`banned=tru |
| `last_active_at_before` | query | integer | No | Returns users whose last session activity was befo |
| `last_active_at_after` | query | integer | No | Returns users whose last session activity was afte |
| `last_active_at_since` | query | integer | No | Returns users that had session activity since the  |
| `created_at_before` | query | integer | No | Returns users who have been created before the giv |
| `created_at_after` | query | integer | No | Returns users who have been created after the give |
| `` | query | string | No |  |
| `` | query | string | No |  |
| `order_by` | query | string | No | Allows to return users in a particular order.
At t |

### Example

```bash
curl -X GET \
  -H "Authorization: Bearer $TOKEN" \
  "https://api.clerk.com/v1/users"
```

---

## POST /users

**Create a new user**

Creates a new user. Your user management settings determine how you should setup your user model.

Any email address and phone number created using this method will be marked as verified.

Note: If you are performing a migration, check out our guide on [zero downtime migrations](https://clerk.com/docs/deployments/migrate-overview).

A rate limit rule of 20 requests per 10 seconds is applied to this endpoint.

### Example

```bash
curl -X POST \
  -H "Authorization: Bearer $TOKEN" \
  "https://api.clerk.com/v1/users"
```

---

## GET /users/count

**Count users**

Returns a total count of all users that match the given filtering criteria.

### Parameters

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| `email_address` | query | array | No | Counts users with the specified email addresses.
A |
| `phone_number` | query | array | No | Counts users with the specified phone numbers.
Acc |
| `external_id` | query | array | No | Counts users with the specified external ids.
Acce |
| `username` | query | array | No | Counts users with the specified usernames.
Accepts |
| `web3_wallet` | query | array | No | Counts users with the specified web3 wallet addres |
| `user_id` | query | array | No | Counts users with the user ids specified.
Accepts  |
| `organization_id` | query | array | No | Returns users that have memberships to the given o |
| `query` | query | string | No | Counts users that match the given query.
For possi |
| `email_address_query` | query | string | No | Counts users with emails that match the given quer |
| `phone_number_query` | query | string | No | Counts users with phone numbers that match the giv |
| `username_query` | query | string | No | Counts users with usernames that match the given q |
| `name_query` | query | string | No | Returns users with names that match the given quer |
| `banned` | query | boolean | No | Counts users which are either banned (`banned=true |
| `last_active_at_before` | query | integer | No | Returns users whose last session activity was befo |
| `last_active_at_after` | query | integer | No | Returns users whose last session activity was afte |
| `last_active_at_since` | query | integer | No | Returns users that had session activity since the  |
| `created_at_before` | query | integer | No | Returns users who have been created before the giv |
| `created_at_after` | query | integer | No | Returns users who have been created after the give |

### Example

```bash
curl -X GET \
  -H "Authorization: Bearer $TOKEN" \
  "https://api.clerk.com/v1/users/count"
```

---

## GET /users/{user_id}

**Retrieve a user**

Retrieve the details of a user

### Parameters

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| `user_id` | path | string | Yes | The ID of the user to retrieve |

### Example

```bash
curl -X GET \
  -H "Authorization: Bearer $TOKEN" \
  "https://api.clerk.com/v1/users/{user_id}"
```

---

## PATCH /users/{user_id}

**Update a user**

Update a user's attributes.

You can set the user's primary contact identifiers (email address and phone numbers) by updating the `primary_email_address_id` and `primary_phone_number_id` attributes respectively.
Both IDs should correspond to verified identifications that belong to the user.

You can remove a user's username by setting the username attribute to null or the blank string "".
This is a destructive action; the identification will be deleted forever.
Usernames can be removed only if they are optional in your instance settings and there's at least one other identifier which can be used for authentication.

This endpoint allows changing a user's password. When passing the `password` parameter directly you have two further options.
You can ignore the password policy checks for your instance by setting the `skip_password_checks` parameter to `true`.
You can also choose to sign the user out of all their active sessions on any device once the password is updated. Just set `sign_out_of_other_sessions` to `true`.

### Parameters

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| `user_id` | path | string | Yes | The ID of the user to update |

### Example

```bash
curl -X PATCH \
  -H "Authorization: Bearer $TOKEN" \
  "https://api.clerk.com/v1/users/{user_id}"
```

---

## DELETE /users/{user_id}

**Delete a user**

Delete the specified user

### Parameters

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| `user_id` | path | string | Yes | The ID of the user to delete |

### Example

```bash
curl -X DELETE \
  -H "Authorization: Bearer $TOKEN" \
  "https://api.clerk.com/v1/users/{user_id}"
```

---

## POST /users/{user_id}/ban

**Ban a user**

Marks the given user as banned, which means that all their sessions are revoked and they are not allowed to sign in again.

### Parameters

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| `user_id` | path | string | Yes | The ID of the user to ban |

### Example

```bash
curl -X POST \
  -H "Authorization: Bearer $TOKEN" \
  "https://api.clerk.com/v1/users/{user_id}/ban"
```

---

## POST /users/{user_id}/unban

**Unban a user**

Removes the ban mark from the given user.

### Parameters

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| `user_id` | path | string | Yes | The ID of the user to unban |

### Example

```bash
curl -X POST \
  -H "Authorization: Bearer $TOKEN" \
  "https://api.clerk.com/v1/users/{user_id}/unban"
```

---

## POST /users/{user_id}/lock

**Lock a user**

Marks the given user as locked, which means they are not allowed to sign in again until the lock expires.
Lock duration can be configured in the instance's restrictions settings.

### Parameters

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| `user_id` | path | string | Yes | The ID of the user to lock |

### Example

```bash
curl -X POST \
  -H "Authorization: Bearer $TOKEN" \
  "https://api.clerk.com/v1/users/{user_id}/lock"
```

---

## POST /users/{user_id}/unlock

**Unlock a user**

Removes the lock from the given user.

### Parameters

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| `user_id` | path | string | Yes | The ID of the user to unlock |

### Example

```bash
curl -X POST \
  -H "Authorization: Bearer $TOKEN" \
  "https://api.clerk.com/v1/users/{user_id}/unlock"
```

---

## POST /users/{user_id}/profile_image

**Set user profile image**

Update a user's profile image

### Parameters

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| `user_id` | path | string | Yes | The ID of the user to update the profile image for |

### Example

```bash
curl -X POST \
  -H "Authorization: Bearer $TOKEN" \
  "https://api.clerk.com/v1/users/{user_id}/profile_image"
```

---

## DELETE /users/{user_id}/profile_image

**Delete user profile image**

Delete a user's profile image

### Parameters

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| `user_id` | path | string | Yes | The ID of the user to delete the profile image for |

### Example

```bash
curl -X DELETE \
  -H "Authorization: Bearer $TOKEN" \
  "https://api.clerk.com/v1/users/{user_id}/profile_image"
```

---

## PATCH /users/{user_id}/metadata

**Merge and update a user's metadata**

Update a user's metadata attributes by merging existing values with the provided parameters.

This endpoint behaves differently than the *Update a user* endpoint.
Metadata values will not be replaced entirely.
Instead, a deep merge will be performed.
Deep means that any nested JSON objects will be merged as well.

You can remove metadata keys at any level by setting their value to `null`.

### Parameters

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| `user_id` | path | string | Yes | The ID of the user whose metadata will be updated  |

### Example

```bash
curl -X PATCH \
  -H "Authorization: Bearer $TOKEN" \
  "https://api.clerk.com/v1/users/{user_id}/metadata"
```

---

## GET /users/{user_id}/oauth_access_tokens/{provider}

**Retrieve the OAuth access token of a user**

Fetch the corresponding OAuth access token for a user that has previously authenticated with a particular OAuth provider.
For OAuth 2.0, if the access token has expired and we have a corresponding refresh token, the access token will be refreshed transparently the new one will be returned.

### Parameters

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| `user_id` | path | string | Yes | The ID of the user for which to retrieve the OAuth |
| `provider` | path | string | Yes | The ID of the OAuth provider (e.g. `oauth_google`) |
| `` | query | string | No |  |
| `` | query | string | No |  |
| `` | query | string | No |  |

### Example

```bash
curl -X GET \
  -H "Authorization: Bearer $TOKEN" \
  "https://api.clerk.com/v1/users/{user_id}/oauth_access_tokens/{provider}"
```

---

## GET /users/{user_id}/organization_memberships

**Retrieve all memberships for a user**

Retrieve a paginated list of the user's organization memberships

### Parameters

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| `user_id` | path | string | Yes | The ID of the user whose organization memberships  |
| `` | query | string | No |  |
| `` | query | string | No |  |

### Example

```bash
curl -X GET \
  -H "Authorization: Bearer $TOKEN" \
  "https://api.clerk.com/v1/users/{user_id}/organization_memberships"
```

---

## GET /users/{user_id}/organization_invitations

**Retrieve all invitations for a user**

Retrieve a paginated list of the user's organization invitations

### Parameters

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| `user_id` | path | string | Yes | The ID of the user whose organization invitations  |
| `` | query | string | No |  |
| `` | query | string | No |  |
| `status` | query | string | No | Filter organization invitations based on their sta |

### Example

```bash
curl -X GET \
  -H "Authorization: Bearer $TOKEN" \
  "https://api.clerk.com/v1/users/{user_id}/organization_invitations"
```

---

## POST /users/{user_id}/verify_password

**Verify the password of a user**

Check that the user's password matches the supplied input.
Useful for custom auth flows and re-verification.

### Parameters

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| `user_id` | path | string | Yes | The ID of the user for whom to verify the password |

### Example

```bash
curl -X POST \
  -H "Authorization: Bearer $TOKEN" \
  "https://api.clerk.com/v1/users/{user_id}/verify_password"
```

---

## POST /users/{user_id}/verify_totp

**Verify a TOTP or backup code for a user**

Verify that the provided TOTP or backup code is valid for the user.
Verifying a backup code will result it in being consumed (i.e. it will
become invalid).
Useful for custom auth flows and re-verification.

### Parameters

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| `user_id` | path | string | Yes | The ID of the user for whom to verify the TOTP |

### Example

```bash
curl -X POST \
  -H "Authorization: Bearer $TOKEN" \
  "https://api.clerk.com/v1/users/{user_id}/verify_totp"
```

---

## DELETE /users/{user_id}/mfa

**Disable a user's MFA methods**

Disable all of a user's MFA methods (e.g. OTP sent via SMS, TOTP on their authenticator app) at once.

### Parameters

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| `user_id` | path | string | Yes | The ID of the user whose MFA methods are to be dis |

### Example

```bash
curl -X DELETE \
  -H "Authorization: Bearer $TOKEN" \
  "https://api.clerk.com/v1/users/{user_id}/mfa"
```

---

## DELETE /users/{user_id}/backup_code

**Disable all user's Backup codes**

Disable all of a user's backup codes.

### Parameters

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| `user_id` | path | string | Yes | The ID of the user whose backup codes are to be de |

### Example

```bash
curl -X DELETE \
  -H "Authorization: Bearer $TOKEN" \
  "https://api.clerk.com/v1/users/{user_id}/backup_code"
```

---

## DELETE /users/{user_id}/passkeys/{passkey_identification_id}

**Delete a user passkey**

Delete the passkey identification for a given user and notify them through email.

### Parameters

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| `user_id` | path | string | Yes | The ID of the user that owns the passkey identity |
| `passkey_identification_id` | path | string | Yes | The ID of the passkey identity to be deleted |

### Example

```bash
curl -X DELETE \
  -H "Authorization: Bearer $TOKEN" \
  "https://api.clerk.com/v1/users/{user_id}/passkeys/{passkey_identification_id}"
```

---

## DELETE /users/{user_id}/web3_wallets/{web3_wallet_identification_id}

**Delete a user web3 wallet**

Delete the web3 wallet identification for a given user.

### Parameters

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| `user_id` | path | string | Yes | The ID of the user that owns the web3 wallet |
| `web3_wallet_identification_id` | path | string | Yes | The ID of the web3 wallet identity to be deleted |

### Example

```bash
curl -X DELETE \
  -H "Authorization: Bearer $TOKEN" \
  "https://api.clerk.com/v1/users/{user_id}/web3_wallets/{web3_wallet_identification_id}"
```

---

## DELETE /users/{user_id}/totp

**Delete all the user's TOTPs**

Deletes all of the user's TOTPs.

### Parameters

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| `user_id` | path | string | Yes | The ID of the user whose TOTPs are to be deleted |

### Example

```bash
curl -X DELETE \
  -H "Authorization: Bearer $TOKEN" \
  "https://api.clerk.com/v1/users/{user_id}/totp"
```

---

## DELETE /users/{user_id}/external_accounts/{external_account_id}

**Delete External Account**

Delete an external account by ID.

### Parameters

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| `user_id` | path | string | Yes | The ID of the user's external account |
| `external_account_id` | path | string | Yes | The ID of the external account to delete |

### Example

```bash
curl -X DELETE \
  -H "Authorization: Bearer $TOKEN" \
  "https://api.clerk.com/v1/users/{user_id}/external_accounts/{external_account_id}"
```

---
