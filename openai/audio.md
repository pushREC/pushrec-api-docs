---
created: 2026-01-08
tags: [type/api-reference, api/audio]
api_name: OpenAI API
category: Audio
endpoint_count: 9
---

# OpenAI API - Audio

[[README|Back to Overview]]

---

## POST /audio/speech

**Create speech**

Generates audio from the input text.

### Example

```bash
curl -X POST \
  -H "Authorization: Bearer $TOKEN" \
  "https://api.openai.com/v1/audio/speech"
```

---

## POST /audio/transcriptions

**Create transcription**

Transcribes audio into the input language.

### Example

```bash
curl -X POST \
  -H "Authorization: Bearer $TOKEN" \
  "https://api.openai.com/v1/audio/transcriptions"
```

---

## POST /audio/translations

**Create translation**

Translates audio into English.

### Example

```bash
curl -X POST \
  -H "Authorization: Bearer $TOKEN" \
  "https://api.openai.com/v1/audio/translations"
```

---

## POST /audio/voice_consents

**Create voice consent**

Upload a voice consent recording.

### Example

```bash
curl -X POST \
  -H "Authorization: Bearer $TOKEN" \
  "https://api.openai.com/v1/audio/voice_consents"
```

---

## GET /audio/voice_consents

**List voice consents**

Returns a list of voice consent recordings.

### Parameters

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| `after` | query | string | No | A cursor for use in pagination. `after` is an obje |
| `limit` | query | integer | No | A limit on the number of objects to be returned. L |

### Example

```bash
curl -X GET \
  -H "Authorization: Bearer $TOKEN" \
  "https://api.openai.com/v1/audio/voice_consents"
```

---

## GET /audio/voice_consents/{consent_id}

**Retrieve voice consent**

Retrieves a voice consent recording.

### Parameters

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| `consent_id` | path | string | Yes | The ID of the consent recording to retrieve. |

### Example

```bash
curl -X GET \
  -H "Authorization: Bearer $TOKEN" \
  "https://api.openai.com/v1/audio/voice_consents/{consent_id}"
```

---

## POST /audio/voice_consents/{consent_id}

**Update voice consent**

Updates a voice consent recording (metadata only).

### Parameters

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| `consent_id` | path | string | Yes | The ID of the consent recording to update. |

### Example

```bash
curl -X POST \
  -H "Authorization: Bearer $TOKEN" \
  "https://api.openai.com/v1/audio/voice_consents/{consent_id}"
```

---

## DELETE /audio/voice_consents/{consent_id}

**Delete voice consent**

Deletes a voice consent recording.

### Parameters

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| `consent_id` | path | string | Yes | The ID of the consent recording to delete. |

### Example

```bash
curl -X DELETE \
  -H "Authorization: Bearer $TOKEN" \
  "https://api.openai.com/v1/audio/voice_consents/{consent_id}"
```

---

## POST /audio/voices

**Create voice**

Creates a custom voice.

### Example

```bash
curl -X POST \
  -H "Authorization: Bearer $TOKEN" \
  "https://api.openai.com/v1/audio/voices"
```

---
