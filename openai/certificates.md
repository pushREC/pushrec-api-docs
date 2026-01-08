---
created: 2026-01-08
tags: [type/api-reference, api/certificates]
api_name: OpenAI API
category: Certificates
endpoint_count: 10
---

# OpenAI API - Certificates

[[README|Back to Overview]]

---

## GET /organization/certificates

**List organization certificates**

List uploaded certificates for this organization.

### Parameters

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| `limit` | query | integer | No | A limit on the number of objects to be returned. L |
| `after` | query | string | No | A cursor for use in pagination. `after` is an obje |
| `order` | query | string | No | Sort order by the `created_at` timestamp of the ob |

### Example

```bash
curl -X GET \
  -H "Authorization: Bearer $TOKEN" \
  "https://api.openai.com/v1/organization/certificates"
```

---

## POST /organization/certificates

**Upload certificate**

Upload a certificate to the organization. This does **not** automatically activate the certificate.

Organizations can upload up to 50 certificates.


### Example

```bash
curl -X POST \
  -H "Authorization: Bearer $TOKEN" \
  "https://api.openai.com/v1/organization/certificates"
```

---

## POST /organization/certificates/activate

**Activate certificates for organization**

Activate certificates at the organization level.

You can atomically and idempotently activate up to 10 certificates at a time.


### Example

```bash
curl -X POST \
  -H "Authorization: Bearer $TOKEN" \
  "https://api.openai.com/v1/organization/certificates/activate"
```

---

## POST /organization/certificates/deactivate

**Deactivate certificates for organization**

Deactivate certificates at the organization level.

You can atomically and idempotently deactivate up to 10 certificates at a time.


### Example

```bash
curl -X POST \
  -H "Authorization: Bearer $TOKEN" \
  "https://api.openai.com/v1/organization/certificates/deactivate"
```

---

## GET /organization/certificates/{certificate_id}

**Get certificate**

Get a certificate that has been uploaded to the organization.

You can get a certificate regardless of whether it is active or not.


### Parameters

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| `certificate_id` | path | string | Yes | Unique ID of the certificate to retrieve. |
| `include` | query | array | No | A list of additional fields to include in the resp |

### Example

```bash
curl -X GET \
  -H "Authorization: Bearer $TOKEN" \
  "https://api.openai.com/v1/organization/certificates/{certificate_id}"
```

---

## POST /organization/certificates/{certificate_id}

**Modify certificate**

Modify a certificate. Note that only the name can be modified.


### Example

```bash
curl -X POST \
  -H "Authorization: Bearer $TOKEN" \
  "https://api.openai.com/v1/organization/certificates/{certificate_id}"
```

---

## DELETE /organization/certificates/{certificate_id}

**Delete certificate**

Delete a certificate from the organization.

The certificate must be inactive for the organization and all projects.


### Example

```bash
curl -X DELETE \
  -H "Authorization: Bearer $TOKEN" \
  "https://api.openai.com/v1/organization/certificates/{certificate_id}"
```

---

## GET /organization/projects/{project_id}/certificates

**List project certificates**

List certificates for this project.

### Parameters

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| `project_id` | path | string | Yes | The ID of the project. |
| `limit` | query | integer | No | A limit on the number of objects to be returned. L |
| `after` | query | string | No | A cursor for use in pagination. `after` is an obje |
| `order` | query | string | No | Sort order by the `created_at` timestamp of the ob |

### Example

```bash
curl -X GET \
  -H "Authorization: Bearer $TOKEN" \
  "https://api.openai.com/v1/organization/projects/{project_id}/certificates"
```

---

## POST /organization/projects/{project_id}/certificates/activate

**Activate certificates for project**

Activate certificates at the project level.

You can atomically and idempotently activate up to 10 certificates at a time.


### Parameters

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| `project_id` | path | string | Yes | The ID of the project. |

### Example

```bash
curl -X POST \
  -H "Authorization: Bearer $TOKEN" \
  "https://api.openai.com/v1/organization/projects/{project_id}/certificates/activate"
```

---

## POST /organization/projects/{project_id}/certificates/deactivate

**Deactivate certificates for project**

Deactivate certificates at the project level. You can atomically and 
idempotently deactivate up to 10 certificates at a time.


### Parameters

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| `project_id` | path | string | Yes | The ID of the project. |

### Example

```bash
curl -X POST \
  -H "Authorization: Bearer $TOKEN" \
  "https://api.openai.com/v1/organization/projects/{project_id}/certificates/deactivate"
```

---
