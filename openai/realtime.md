---
created: 2026-01-08
tags: [type/api-reference, api/realtime]
api_name: OpenAI API
category: Realtime
endpoint_count: 8
---

# OpenAI API - Realtime

[[README|Back to Overview]]

---

## POST /realtime/calls

**Create call**

Create a new Realtime API call over WebRTC and receive the SDP answer needed
to complete the peer connection.

### Example

```bash
curl -X POST \
  -H "Authorization: Bearer $TOKEN" \
  "https://api.openai.com/v1/realtime/calls"
```

---

## POST /realtime/calls/{call_id}/accept

**Accept call**

Accept an incoming SIP call and configure the realtime session that will
handle it.

### Parameters

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| `call_id` | path | string | Yes | The identifier for the call provided in the
[`real |

### Example

```bash
curl -X POST \
  -H "Authorization: Bearer $TOKEN" \
  "https://api.openai.com/v1/realtime/calls/{call_id}/accept"
```

---

## POST /realtime/calls/{call_id}/hangup

**Hang up call**

End an active Realtime API call, whether it was initiated over SIP or
WebRTC.

### Parameters

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| `call_id` | path | string | Yes | The identifier for the call. For SIP calls, use th |

### Example

```bash
curl -X POST \
  -H "Authorization: Bearer $TOKEN" \
  "https://api.openai.com/v1/realtime/calls/{call_id}/hangup"
```

---

## POST /realtime/calls/{call_id}/refer

**Refer call**

Transfer an active SIP call to a new destination using the SIP REFER verb.

### Parameters

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| `call_id` | path | string | Yes | The identifier for the call provided in the
[`real |

### Example

```bash
curl -X POST \
  -H "Authorization: Bearer $TOKEN" \
  "https://api.openai.com/v1/realtime/calls/{call_id}/refer"
```

---

## POST /realtime/calls/{call_id}/reject

**Reject call**

Decline an incoming SIP call by returning a SIP status code to the caller.

### Parameters

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| `call_id` | path | string | Yes | The identifier for the call provided in the
[`real |

### Example

```bash
curl -X POST \
  -H "Authorization: Bearer $TOKEN" \
  "https://api.openai.com/v1/realtime/calls/{call_id}/reject"
```

---

## POST /realtime/client_secrets

**Create client secret**

Create a Realtime client secret with an associated session configuration.


### Example

```bash
curl -X POST \
  -H "Authorization: Bearer $TOKEN" \
  "https://api.openai.com/v1/realtime/client_secrets"
```

---

## POST /realtime/sessions

**Create session**

Create an ephemeral API token for use in client-side applications with the
Realtime API. Can be configured with the same session parameters as the
`session.update` client event.

It responds with a session object, plus a `client_secret` key which contains
a usable ephemeral API token that can be used to authenticate browser clients
for the Realtime API.


### Example

```bash
curl -X POST \
  -H "Authorization: Bearer $TOKEN" \
  "https://api.openai.com/v1/realtime/sessions"
```

---

## POST /realtime/transcription_sessions

**Create transcription session**

Create an ephemeral API token for use in client-side applications with the
Realtime API specifically for realtime transcriptions. 
Can be configured with the same session parameters as the `transcription_session.update` client event.

It responds with a session object, plus a `client_secret` key which contains
a usable ephemeral API token that can be used to authenticate browser clients
for the Realtime API.


### Example

```bash
curl -X POST \
  -H "Authorization: Bearer $TOKEN" \
  "https://api.openai.com/v1/realtime/transcription_sessions"
```

---
