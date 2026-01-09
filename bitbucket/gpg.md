---
created: 2026-01-09
tags: [type/api-reference, api/gpg]
api_name: Bitbucket API
category: GPG
endpoint_count: 4
---

# Bitbucket API - Gpg

[[README|Back to Overview]]

---

## GET /users/{selected_user}/gpg-keys

**List GPG keys**

Returns a paginated list of the user's GPG public keys.
The `key` and `subkeys` fields can also be requested from the endpoint.
See [Partial Responses](/cloud/bitbucket/rest/intro/#partial-response) for more details.

### Example

```bash
curl -X GET \
  -H "Authorization: Bearer $TOKEN" \
  "/users/{selected_user}/gpg-keys"
```

---

## POST /users/{selected_user}/gpg-keys

**Add a new GPG key**

Adds a new GPG public key to the specified user account and returns the resulting key.

Example:

```
$ curl -X POST -H "Content-Type: application/json" -d
'{"key": "<insert GPG Key>"}'
https://api.bitbucket.org/2.0/users/{d7dd0e2d-3994-4a50-a9ee-d260b6cefdab}/gpg-keys
```

### Parameters

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| `_body` | body | string | No | The new GPG key object. |

### Example

```bash
curl -X POST \
  -H "Authorization: Bearer $TOKEN" \
  "/users/{selected_user}/gpg-keys"
```

---

## DELETE /users/{selected_user}/gpg-keys/{fingerprint}

**Delete a GPG key**

Deletes a specific GPG public key from a user's account.

### Example

```bash
curl -X DELETE \
  -H "Authorization: Bearer $TOKEN" \
  "/users/{selected_user}/gpg-keys/{fingerprint}"
```

---

## GET /users/{selected_user}/gpg-keys/{fingerprint}

**Get a GPG key**

Returns a specific GPG public key belonging to a user.
The `key` and `subkeys` fields can also be requested from the endpoint.
See [Partial Responses](/cloud/bitbucket/rest/intro/#partial-response) for more details.

### Example

```bash
curl -X GET \
  -H "Authorization: Bearer $TOKEN" \
  "/users/{selected_user}/gpg-keys/{fingerprint}"
```

---
