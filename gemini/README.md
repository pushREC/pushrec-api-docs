# Google Gemini API Documentation

> **Status:** Complete
> **Last Updated:** 2026-01-07
> **Source:** generativelanguage.googleapis.com

## Contents

| Type | Description |
|------|-------------|
| `discovery-v1.json` | Stable API Discovery Document |
| `discovery-v1beta.json` | Beta API Discovery Document |
| `SOURCES.md` | Source tracking |
| `COVERAGE.md` | Coverage report |

## Quick Start

```bash
# Set API key
export GOOGLE_GENERATIVE_AI_KEY="your-key-here"

# Test API
curl "https://generativelanguage.googleapis.com/v1/models?key=$GOOGLE_GENERATIVE_AI_KEY"
```

## Key Endpoints

| Category | Endpoint | Description |
|----------|----------|-------------|
| **Models** | `GET /v1/models` | List available models |
| **Generate** | `POST /v1/models/{model}:generateContent` | Generate text/multimodal |
| **Stream** | `POST /v1/models/{model}:streamGenerateContent` | Streaming generation |
| **Embed** | `POST /v1/models/{model}:embedContent` | Generate embeddings |
| **Count Tokens** | `POST /v1/models/{model}:countTokens` | Token counting |

## Available Models

| Model | Description |
|-------|-------------|
| `gemini-1.5-pro` | Most capable model |
| `gemini-1.5-flash` | Fast, efficient |
| `gemini-2.0-flash-exp` | Experimental multimodal |
| `text-embedding-004` | Text embeddings |

## Authentication

- **Query Parameter:** `key={API_KEY}`
- **Header:** `x-goog-api-key`
- **Get key:** https://aistudio.google.com/apikey

## Resources

- [API Docs](https://ai.google.dev/gemini-api/docs)
- [API Reference](https://ai.google.dev/api)
- [AI Studio](https://aistudio.google.com)
- [Python SDK](https://github.com/google/generative-ai-python)
