---
created: 2026-01-09
tags: [type/api-reference, api/ssh]
api_name: Bitbucket API
category: SSH
endpoint_count: 5
---

# Bitbucket API - Ssh

[[README|Back to Overview]]

---

## GET /users/{selected_user}/ssh-keys

**List SSH keys**

Returns a paginated list of the user's SSH public keys.

### Example

```bash
curl -X GET \
  -H "Authorization: Bearer $TOKEN" \
  "/users/{selected_user}/ssh-keys"
```

---

## POST /users/{selected_user}/ssh-keys

**Add a new SSH key**

Adds a new SSH public key to the specified user account and returns the resulting key.

Example:

```
$ curl -X POST -H "Content-Type: application/json" -d '{"key": "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIKqP3Cr632C2dNhhgKVcon4ldUSAeKiku2yP9O9/bDtY user@myhost"}' https://api.bitbucket.org/2.0/users/{ed08f5e1-605b-4f4a-aee4-6c97628a673e}/ssh-keys
```

### Parameters

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| `_body` | body | string | No | The new SSH key object. Note that the username pro |
| `expires_on` | query | string | No | The date or date-time of when the key will expire, |

### Example

```bash
curl -X POST \
  -H "Authorization: Bearer $TOKEN" \
  "/users/{selected_user}/ssh-keys"
```

---

## DELETE /users/{selected_user}/ssh-keys/{key_id}

**Delete a SSH key**

Deletes a specific SSH public key from a user's account.

### Example

```bash
curl -X DELETE \
  -H "Authorization: Bearer $TOKEN" \
  "/users/{selected_user}/ssh-keys/{key_id}"
```

---

## GET /users/{selected_user}/ssh-keys/{key_id}

**Get a SSH key**

Returns a specific SSH public key belonging to a user.

### Example

```bash
curl -X GET \
  -H "Authorization: Bearer $TOKEN" \
  "/users/{selected_user}/ssh-keys/{key_id}"
```

---

## PUT /users/{selected_user}/ssh-keys/{key_id}

**Update a SSH key**

Updates a specific SSH public key on a user's account

Note: Only the 'comment' field can be updated using this API. To modify the key or comment values, you must delete and add the key again.

Example:

```
$ curl -X PUT -H "Content-Type: application/json" -d '{"label": "Work key"}' https://api.bitbucket.org/2.0/users/{ed08f5e1-605b-4f4a-aee4-6c97628a673e}/ssh-keys/{b15b6026-9c02-4626-b4ad-b905f99f763a}
```

### Parameters

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| `_body` | body | string | No | The updated SSH key object |

### Example

```bash
curl -X PUT \
  -H "Authorization: Bearer $TOKEN" \
  "/users/{selected_user}/ssh-keys/{key_id}"
```

---
