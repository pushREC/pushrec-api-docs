---
created: 2026-01-08
tags: [type/api-reference, api/ssh-keys]
api_name: DigitalOcean API
category: SSH Keys
endpoint_count: 5
---

# DigitalOcean API - Ssh Keys

[[README|Back to Overview]]

---

## GET /v2/account/keys

**List All SSH Keys**

To list all of the keys in your account, send a GET request to `/v2/account/keys`. The response will be a JSON object with a key set to `ssh_keys`. The value of this will be an array of ssh_key objects, each of which contains the standard ssh_key attributes.

### Parameters

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| `` | query | string | No |  |
| `` | query | string | No |  |

### Example

```bash
curl -X GET \
  -H "Authorization: Bearer $TOKEN" \
  "https://api.digitalocean.com/v2/account/keys"
```

---

## POST /v2/account/keys

**Create a New SSH Key**

To add a new SSH public key to your DigitalOcean account, send a POST request to `/v2/account/keys`. Set the `name` attribute to the name you wish to use and the `public_key` attribute to the full public key you are adding.

### Example

```bash
curl -X POST \
  -H "Authorization: Bearer $TOKEN" \
  "https://api.digitalocean.com/v2/account/keys"
```

---

## GET /v2/account/keys/{ssh_key_identifier}

**Retrieve an Existing SSH Key**

To get information about a key, send a GET request to `/v2/account/keys/$KEY_ID` or `/v2/account/keys/$KEY_FINGERPRINT`.
The response will be a JSON object with the key `ssh_key` and value an ssh_key object which contains the standard ssh_key attributes.

### Parameters

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| `` | query | string | No |  |

### Example

```bash
curl -X GET \
  -H "Authorization: Bearer $TOKEN" \
  "https://api.digitalocean.com/v2/account/keys/{ssh_key_identifier}"
```

---

## PUT /v2/account/keys/{ssh_key_identifier}

**Update an SSH Key's Name**

To update the name of an SSH key, send a PUT request to either `/v2/account/keys/$SSH_KEY_ID` or `/v2/account/keys/$SSH_KEY_FINGERPRINT`. Set the `name` attribute to the new name you want to use.

### Parameters

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| `` | query | string | No |  |

### Example

```bash
curl -X PUT \
  -H "Authorization: Bearer $TOKEN" \
  "https://api.digitalocean.com/v2/account/keys/{ssh_key_identifier}"
```

---

## DELETE /v2/account/keys/{ssh_key_identifier}

**Delete an SSH Key**

To destroy a public SSH key that you have in your account, send a DELETE request to `/v2/account/keys/$KEY_ID` or `/v2/account/keys/$KEY_FINGERPRINT`.
A 204 status will be returned, indicating that the action was successful and that the response body is empty.

### Parameters

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| `` | query | string | No |  |

### Example

```bash
curl -X DELETE \
  -H "Authorization: Bearer $TOKEN" \
  "https://api.digitalocean.com/v2/account/keys/{ssh_key_identifier}"
```

---
