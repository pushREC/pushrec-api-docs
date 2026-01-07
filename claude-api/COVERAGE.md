---
source: https://docs.anthropic.com
scraped: '2026-01-07'
api_provider: Anthropic
discovery_tier: 3
verified: true
---
# Claude API Documentation Coverage Report

> **Last Updated**: 2026-01-07
> **Coverage**: 209 files (100%)
> **Status**: Complete

---

## Coverage by Category

| Category | Files | Coverage | Status |
|----------|-------|----------|--------|
| **API Reference** | 60 | 100% | Done |
| **About Claude** | 12 | 100% | Done |
| **Build with Claude** | 42 | 100% | Done |
| **Agents & Tools** | 17 | 100% | Done |
| **Test & Evaluate** | 8 | 100% | Done |
| **Prompt Library** | 66 | 100% | Done |
| **Other (intro, release notes)** | 4 | 100% | Done |
| **TOTAL** | **209** | **100%** | **Complete** |

---

## Gap Analysis

### ZERO CRITICAL GAPS

All production-critical documentation is complete:

**API Reference:** Done
- Messages API (create, count_tokens, batches)
- Models API (list, retrieve)
- Admin API (workspaces, users, invites, API keys, usage reports)
- Beta APIs (files, skills)
- Error handling, versioning, rate limits

**Build Guides:** Done
- Prompt engineering (14 guides)
- Vision, PDF, streaming, batch processing
- Platform integrations (Bedrock, Vertex, Foundry)
- Extended thinking, context windows, citations

**Tool Use:** Done
- All 12 tool types documented
- Computer use, code execution, web search, bash, text editor
- MCP connector, remote servers

**Prompt Library:** Done
- 65 prompt examples across categories
- Code, writing, analysis, creative tasks

---

## What's Included

### Core APIs
- `/v1/messages` - Full documentation
- `/v1/models` - List and retrieve
- `/v1/complete` - Legacy completions (deprecated)
- `/v1/admin/*` - Full admin API suite
- `/v1/beta/*` - Files and skills APIs

### SDK Support
- Python SDK documentation
- TypeScript SDK documentation
- OpenAI SDK compatibility layer
- cURL examples

### Platform Integrations
- Amazon Bedrock setup
- Google Vertex AI setup
- Microsoft Foundry setup

---

## Refresh Schedule

| Content Type | Refresh Frequency | Last Check |
|--------------|-------------------|------------|
| API Reference | Monthly | 2026-01-07 |
| Model Info | On release | 2026-01-07 |
| Prompt Library | Quarterly | 2026-01-07 |
| Platform Guides | Monthly | 2026-01-07 |

---

## Notes

- No official OpenAPI spec published by Anthropic
- Documentation scraped via HARVEST mode
- Prompt library contains 65 example prompts
- Admin API requires organization-level access
- Beta APIs may change without notice

---

*Coverage validated: 2026-01-07*
