# ElevenLabs API Documentation

> **Status:** Complete
> **Last Updated:** 2026-01-07
> **Source:** api.elevenlabs.io

## Contents

| Type | Description |
|------|-------------|
| `openapi.json` | Official OpenAPI 3.0 specification (1.2 MB) |
| `SOURCES.md` | Source tracking |
| `COVERAGE.md` | Coverage report |

## Quick Start

```bash
# Set API key
export ELEVENLABS_API_KEY="your-key-here"

# Test API
curl https://api.elevenlabs.io/v1/models \
  -H "xi-api-key: $ELEVENLABS_API_KEY"
```

## Key Endpoints

| Category | Endpoint | Description |
|----------|----------|-------------|
| **Models** | `GET /v1/models` | List available models |
| **Voices** | `GET /v1/voices` | List voices |
| **TTS** | `POST /v1/text-to-speech/{voice_id}` | Generate speech |
| **STS** | `POST /v1/speech-to-speech/{voice_id}` | Voice conversion |
| **Agents** | `GET /v1/convai/agents` | Conversational AI agents |
| **Conversations** | `GET /v1/convai/conversations` | Get transcripts |

## Authentication

- **Header:** `xi-api-key`
- **Type:** API Key
- **Get key:** https://elevenlabs.io/app/settings/api-keys

## Resources

- [API Docs](https://api.elevenlabs.io/docs)
- [Developer Portal](https://elevenlabs.io/docs)
- [Python SDK](https://github.com/elevenlabs/elevenlabs-python)
