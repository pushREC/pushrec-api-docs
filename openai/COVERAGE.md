---
source: https://platform.openai.com/docs/api-reference
scraped: '2026-01-07'
api_provider: OpenAI
discovery_tier: 1
verified: true
---
# OpenAI API Documentation Coverage Report

> **Last Updated**: 2026-01-07
> **Coverage**: OpenAPI Spec 100% | Markdown Docs 0%
> **Status**: Spec Complete, Docs Blocked

---

## Coverage by Category

| Category | Endpoints | Spec | Docs | Status |
|----------|-----------|------|------|--------|
| **Chat/Completions** | 5 | 100% | 0% | Spec only |
| **Responses API** | 6 | 100% | 0% | Spec only |
| **Audio** | 5 | 100% | 0% | Spec only |
| **Images** | 3 | 100% | 0% | Spec only |
| **Videos** | 4 | 100% | 0% | Spec only |
| **Embeddings** | 1 | 100% | 0% | Spec only |
| **Models** | 2 | 100% | 0% | Spec only |
| **Moderations** | 1 | 100% | 0% | Spec only |
| **Files** | 3 | 100% | 0% | Spec only |
| **Uploads** | 4 | 100% | 0% | Spec only |
| **Batch** | 3 | 100% | 0% | Spec only |
| **Fine-tuning** | 10+ | 100% | 0% | Spec only |
| **Assistants** | 2 | 100% | 0% | Spec only (deprecated) |
| **Threads** | 10+ | 100% | 0% | Spec only |
| **Vector Stores** | 10+ | 100% | 0% | Spec only |
| **Realtime** | 7 | 100% | 0% | Spec only |
| **Conversations** | 4 | 100% | 0% | Spec only |
| **Containers** | 5 | 100% | 0% | Spec only |
| **Evals** | 6 | 100% | 0% | Spec only |
| **Organization** | 30+ | 100% | 0% | Spec only |
| **Chatkit** | 5 | 100% | 0% | Spec only |
| **TOTAL** | **140+** | **100%** | **0%** | **Spec Complete** |

---

## Gap Analysis

### SPEC: ZERO GAPS

The OpenAPI 3.1.0 spec from Stainless is complete with:
- All 140+ endpoints documented
- Request/response schemas
- Parameter descriptions
- Authentication requirements
- Error responses

### DOCS: 100% GAP (Blocked)

Human-readable documentation at platform.openai.com returns HTTP 403.

**Workaround Options:**
1. Use browser automation (Playwright/Bright Data)
2. Use OpenAI Cookbook from GitHub
3. Generate docs from spec

---

## What's Included

### OpenAPI Spec (openapi.yaml)
- 70,979 lines
- OpenAPI 3.1.0 format
- Complete endpoint coverage
- Full request/response schemas
- Authentication specs (API Key)
- Error response definitions

### API Categories Covered

**Core AI:**
- Chat Completions (GPT-4, etc.)
- Responses API (new agent-friendly)
- Audio (speech, transcription, translation)
- Images (DALL-E generation, editing)
- Videos (Sora generation)
- Embeddings

**Data & Files:**
- Files API
- Uploads (multipart)
- Vector Stores
- Containers

**Automation:**
- Batch processing
- Fine-tuning
- Evals & Graders

**Real-time:**
- Realtime API (WebSocket)
- Transcription sessions

**Legacy/Deprecated:**
- Assistants API (→ Responses API)
- Threads API (→ Conversations)

**Admin:**
- Organization management
- Projects, Users, Groups
- API Keys, Certificates
- Usage tracking, Costs
- Audit logs

---

## What's Missing

| Resource | Reason | Workaround |
|----------|--------|------------|
| Quickstart guides | 403 blocked | Use spec + cookbook |
| Best practices | 403 blocked | Use cookbook |
| Code examples | 403 blocked | Generate from spec |
| Error troubleshooting | 403 blocked | Parse spec errors |

---

## Refresh Schedule

| Content Type | Refresh Frequency | Last Check |
|--------------|-------------------|------------|
| OpenAPI Spec | Weekly | 2026-01-07 |
| Markdown Docs | Blocked | N/A |

---

## Files

```
openai/
├── SOURCES.md        # This file
├── COVERAGE.md       # Coverage report
├── openapi.yaml      # Full OpenAPI 3.1.0 spec (70K lines)
├── curl/             # cURL examples (pending)
└── postman/          # Postman collection (pending)
```

---

## Notes

1. **Official spec location changed** - Now hosted by Stainless, not GitHub
2. **Assistants API sunset** - Moving to Responses API in 2026
3. **Videos API** - Sora video generation now available
4. **Realtime API** - WebSocket-based for voice/streaming
5. **403 on docs** - OpenAI blocks programmatic access to human docs

---

*Coverage validated: 2026-01-07*
*Spec source: https://app.stainless.com/api/spec/documented/openai/openapi.documented.yml*
