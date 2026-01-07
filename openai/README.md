# OpenAI API Documentation

> **Status:** Spec Complete | Docs Blocked
> **Last Updated:** 2026-01-07

## Quick Start

```bash
# View available endpoints
grep "operationId:" openapi.yaml | head -20

# Search for specific endpoint
grep -A 20 "/chat/completions:" openapi.yaml

# List all paths
grep -E "^  /[a-z]" openapi.yaml
```

## Contents

| File | Description |
|------|-------------|
| `openapi.yaml` | Full OpenAPI 3.1.0 spec (70K lines, 140+ endpoints) |
| `SOURCES.md` | Source URLs and scrape history |
| `COVERAGE.md` | Coverage report and gap analysis |

## API Categories

| Category | Description | Key Endpoints |
|----------|-------------|---------------|
| **Chat** | GPT-4/4o completions | `/chat/completions` |
| **Responses** | Agent-friendly API (new) | `/responses` |
| **Audio** | Speech, transcription | `/audio/speech`, `/audio/transcriptions` |
| **Images** | DALL-E generation | `/images/generations` |
| **Videos** | Sora generation | `/videos` |
| **Embeddings** | Vector embeddings | `/embeddings` |
| **Files** | File upload/management | `/files` |
| **Fine-tuning** | Custom model training | `/fine_tuning/jobs` |
| **Batch** | Async batch processing | `/batches` |
| **Realtime** | WebSocket streaming | `/realtime/sessions` |
| **Vector Stores** | RAG storage | `/vector_stores` |
| **Admin** | Org management | `/organization/*` |

## Known Limitations

1. **Human-readable docs blocked** - OpenAI returns 403 on platform.openai.com
2. **Spec is complete** - All endpoints documented in OpenAPI format
3. **No examples scraped** - Use spec schemas or OpenAI Cookbook

## Alternative Resources

- [OpenAI Cookbook](https://github.com/openai/openai-cookbook) - Code examples
- [OpenAI Python SDK](https://github.com/openai/openai-python) - Python client
- [OpenAI Node SDK](https://github.com/openai/openai-node) - Node.js client

## Spec Source

The OpenAPI spec is maintained by Stainless and hosted at:
```
https://app.stainless.com/api/spec/documented/openai/openapi.documented.yml
```

To refresh:
```bash
curl -s "https://app.stainless.com/api/spec/documented/openai/openapi.documented.yml" -o openapi.yaml
```
