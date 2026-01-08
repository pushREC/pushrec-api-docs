---
created: 2026-01-08
tags: [type/api-reference, api/certificates]
api_name: DigitalOcean API
category: Certificates
endpoint_count: 4
---

# DigitalOcean API - Certificates

[[README|Back to Overview]]

---

## GET /v2/certificates

**List All Certificates**

To list all of the certificates available on your account, send a GET request to `/v2/certificates`.

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
  "https://api.digitalocean.com/v2/certificates"
```

---

## POST /v2/certificates

**Create a New Certificate**

To upload new SSL certificate which you have previously generated, send a POST
request to `/v2/certificates`.

When uploading a user-generated certificate, the `private_key`,
`leaf_certificate`, and optionally the `certificate_chain` attributes should
be provided. The type must be set to `custom`.

When using Let's Encrypt to create a certificate, the `dns_names` attribute
must be provided, and the type must be set to `lets_encrypt`.


### Example

```bash
curl -X POST \
  -H "Authorization: Bearer $TOKEN" \
  "https://api.digitalocean.com/v2/certificates"
```

---

## GET /v2/certificates/{certificate_id}

**Retrieve an Existing Certificate**

To show information about an existing certificate, send a GET request to `/v2/certificates/$CERTIFICATE_ID`.

### Parameters

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| `` | query | string | No |  |

### Example

```bash
curl -X GET \
  -H "Authorization: Bearer $TOKEN" \
  "https://api.digitalocean.com/v2/certificates/{certificate_id}"
```

---

## DELETE /v2/certificates/{certificate_id}

**Delete a Certificate**

To delete a specific certificate, send a DELETE request to
`/v2/certificates/$CERTIFICATE_ID`.


### Parameters

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| `` | query | string | No |  |

### Example

```bash
curl -X DELETE \
  -H "Authorization: Bearer $TOKEN" \
  "https://api.digitalocean.com/v2/certificates/{certificate_id}"
```

---
