---
source: https://platform.openai.com/docs/api-reference
scraped: '2026-01-07'
api_provider: OpenAI
discovery_tier: 1
verified: true
spec_url: https://app.stainless.com/api/spec/documented/openai/openapi.documented.yml
---
# OpenAI API Documentation Sources

> **Source:** OpenAPI Spec from Stainless
> **Spec URL:** https://app.stainless.com/api/spec/documented/openai/openapi.documented.yml
> **Version:** 2.3.0
> **Total Endpoints:** 140+
> **Spec Size:** 70,979 lines
> **Discovered:** 2026-01-07
> **Coverage:** Spec Complete

---

## OpenAPI Spec (Tier 1 - Direct)

**File:** `openapi.yaml`
**Format:** OpenAPI 3.1.0
**Status:** Downloaded

---

## API Categories (from spec)

### Chat & Completions (5 endpoints)
| Path | Methods | Status |
|------|---------|--------|
| `/chat/completions` | POST | Spec |
| `/chat/completions/{completion_id}` | GET, DELETE | Spec |
| `/chat/completions/{completion_id}/messages` | GET | Spec |
| `/completions` | POST | Spec (legacy) |

### Responses API (5 endpoints)
| Path | Methods | Status |
|------|---------|--------|
| `/responses` | POST | Spec |
| `/responses/{response_id}` | GET, DELETE | Spec |
| `/responses/{response_id}/cancel` | POST | Spec |
| `/responses/{response_id}/input_items` | GET | Spec |
| `/responses/compact` | POST | Spec |
| `/responses/input_tokens` | POST | Spec |

### Audio (5 endpoints)
| Path | Methods | Status |
|------|---------|--------|
| `/audio/speech` | POST | Spec |
| `/audio/transcriptions` | POST | Spec |
| `/audio/translations` | POST | Spec |
| `/audio/voices` | GET | Spec |
| `/audio/voice_consents` | GET, POST, DELETE | Spec |

### Images (3 endpoints)
| Path | Methods | Status |
|------|---------|--------|
| `/images/generations` | POST | Spec |
| `/images/edits` | POST | Spec |
| `/images/variations` | POST | Spec |

### Videos (4 endpoints)
| Path | Methods | Status |
|------|---------|--------|
| `/videos` | GET, POST | Spec |
| `/videos/{video_id}` | GET | Spec |
| `/videos/{video_id}/content` | GET | Spec |
| `/videos/{video_id}/remix` | POST | Spec |

### Embeddings (1 endpoint)
| Path | Methods | Status |
|------|---------|--------|
| `/embeddings` | POST | Spec |

### Models (2 endpoints)
| Path | Methods | Status |
|------|---------|--------|
| `/models` | GET | Spec |
| `/models/{model}` | GET, DELETE | Spec |

### Moderations (1 endpoint)
| Path | Methods | Status |
|------|---------|--------|
| `/moderations` | POST | Spec |

### Files (3 endpoints)
| Path | Methods | Status |
|------|---------|--------|
| `/files` | GET, POST | Spec |
| `/files/{file_id}` | GET, DELETE | Spec |
| `/files/{file_id}/content` | GET | Spec |

### Uploads (4 endpoints)
| Path | Methods | Status |
|------|---------|--------|
| `/uploads` | POST | Spec |
| `/uploads/{upload_id}/parts` | POST | Spec |
| `/uploads/{upload_id}/complete` | POST | Spec |
| `/uploads/{upload_id}/cancel` | POST | Spec |

### Batch (3 endpoints)
| Path | Methods | Status |
|------|---------|--------|
| `/batches` | GET, POST | Spec |
| `/batches/{batch_id}` | GET | Spec |
| `/batches/{batch_id}/cancel` | POST | Spec |

### Fine-tuning (10+ endpoints)
| Path | Methods | Status |
|------|---------|--------|
| `/fine_tuning/jobs` | GET, POST | Spec |
| `/fine_tuning/jobs/{id}` | GET | Spec |
| `/fine_tuning/jobs/{id}/cancel` | POST | Spec |
| `/fine_tuning/jobs/{id}/pause` | POST | Spec |
| `/fine_tuning/jobs/{id}/resume` | POST | Spec |
| `/fine_tuning/jobs/{id}/events` | GET | Spec |
| `/fine_tuning/jobs/{id}/checkpoints` | GET | Spec |
| `/fine_tuning/checkpoints/{id}/permissions` | GET, POST, DELETE | Spec |
| `/fine_tuning/alpha/graders/*` | POST | Spec |

### Assistants (2 endpoints) - Deprecated
| Path | Methods | Status |
|------|---------|--------|
| `/assistants` | GET, POST | Spec |
| `/assistants/{assistant_id}` | GET, POST, DELETE | Spec |

### Threads (10+ endpoints) - Assistants
| Path | Methods | Status |
|------|---------|--------|
| `/threads` | POST | Spec |
| `/threads/{thread_id}` | GET, POST, DELETE | Spec |
| `/threads/{thread_id}/messages` | GET, POST | Spec |
| `/threads/{thread_id}/runs` | GET, POST | Spec |
| `/threads/{thread_id}/runs/{run_id}` | GET, POST | Spec |
| `/threads/{thread_id}/runs/{run_id}/cancel` | POST | Spec |
| `/threads/{thread_id}/runs/{run_id}/steps` | GET | Spec |
| `/threads/{thread_id}/runs/{run_id}/submit_tool_outputs` | POST | Spec |
| `/threads/runs` | POST | Spec |

### Vector Stores (10+ endpoints)
| Path | Methods | Status |
|------|---------|--------|
| `/vector_stores` | GET, POST | Spec |
| `/vector_stores/{id}` | GET, POST, DELETE | Spec |
| `/vector_stores/{id}/files` | GET, POST | Spec |
| `/vector_stores/{id}/files/{file_id}` | GET, DELETE | Spec |
| `/vector_stores/{id}/search` | POST | Spec |
| `/vector_stores/{id}/file_batches` | POST | Spec |
| `/vector_stores/{id}/file_batches/{batch_id}` | GET | Spec |

### Realtime (7 endpoints)
| Path | Methods | Status |
|------|---------|--------|
| `/realtime/sessions` | POST | Spec |
| `/realtime/transcription_sessions` | POST | Spec |
| `/realtime/client_secrets` | POST | Spec |
| `/realtime/calls` | POST | Spec |
| `/realtime/calls/{call_id}/*` | POST | Spec |

### Conversations (4 endpoints)
| Path | Methods | Status |
|------|---------|--------|
| `/conversations` | GET, POST | Spec |
| `/conversations/{id}` | GET, DELETE | Spec |
| `/conversations/{id}/items` | GET, POST | Spec |
| `/conversations/{id}/items/{item_id}` | GET, DELETE | Spec |

### Containers (5 endpoints)
| Path | Methods | Status |
|------|---------|--------|
| `/containers` | GET, POST | Spec |
| `/containers/{id}` | GET, DELETE | Spec |
| `/containers/{id}/files` | GET, POST | Spec |
| `/containers/{id}/files/{file_id}` | GET, DELETE | Spec |
| `/containers/{id}/files/{file_id}/content` | GET | Spec |

### Evals (6 endpoints)
| Path | Methods | Status |
|------|---------|--------|
| `/evals` | GET, POST | Spec |
| `/evals/{eval_id}` | GET, POST, DELETE | Spec |
| `/evals/{eval_id}/runs` | GET, POST | Spec |
| `/evals/{eval_id}/runs/{run_id}` | GET, DELETE | Spec |
| `/evals/{eval_id}/runs/{run_id}/output_items` | GET | Spec |

### Organization Admin (30+ endpoints)
| Category | Endpoints | Status |
|----------|-----------|--------|
| Admin API Keys | 2 | Spec |
| Audit Logs | 1 | Spec |
| Certificates | 4 | Spec |
| Costs | 1 | Spec |
| Groups | 5 | Spec |
| Invites | 2 | Spec |
| Projects | 15+ | Spec |
| Roles | 2 | Spec |
| Usage | 8 | Spec |
| Users | 4 | Spec |

### Chatkit (5 endpoints)
| Path | Methods | Status |
|------|---------|--------|
| `/chatkit/sessions` | POST | Spec |
| `/chatkit/sessions/{id}/cancel` | POST | Spec |
| `/chatkit/threads` | GET, POST | Spec |
| `/chatkit/threads/{id}` | GET, DELETE | Spec |
| `/chatkit/threads/{id}/items` | GET, POST | Spec |

---

## Additional Documentation Needed

| Resource | URL | Status |
|----------|-----|--------|
| Guides | platform.openai.com/docs/guides | Blocked (403) |
| Quickstarts | platform.openai.com/docs/quickstart | Blocked (403) |
| Cookbook | github.com/openai/openai-cookbook | Not scraped |

---

## Summary

| Source | Format | Files | Status |
|--------|--------|-------|--------|
| OpenAPI Spec | YAML | 1 | Complete |
| cURL Examples | TBD | 0 | Pending |
| Postman Collection | TBD | 0 | Pending |
| Markdown Docs | MD | 0 | Blocked by 403 |

---

*Last updated: 2026-01-07*
*Scrape method: Direct spec download from Stainless API*
*Note: Human-readable docs blocked by OpenAI (403). Spec is complete.*
