---
source: '[unknown - README.md]'
scraped: 2025-12-29
api_provider: FAL.ai
discovery_tier: 3
verified: false
title: FAL.ai Documentation Index
---
[3-Resources/anchors/status-complete]]

# FAL.ai Documentation

Complete reference documentation for building SaaS platforms on FAL.ai's generative AI infrastructure.

**Total:** ~75,000+ words across 17 documents covering 600+ model endpoints.

---

## Quick Links

| Document | Purpose |
|----------|---------|
| [[MASTER-FAL-AI-DOCUMENTATION]] | Complete platform synthesis |
| [[KNOWLEDGE-MAP]] | Topic dependency graph |
| [[QUICK-REFERENCE]] | Developer cheatsheet |

---

## Document Index

### Round 1 - Core Platform

| File | Topic | Location |
|------|-------|----------|
| [[agent-01-core-api]] | REST API, Authentication, Webhooks | `round-1/` |
| [[agent-02-javascript-sdk]] | JavaScript/TypeScript SDK | `round-1/` |
| [[agent-03-python-sdk]] | Python SDK | `round-1/` |
| [[agent-04-image-models]] | FLUX, Seedream, SDXL, Imagen | `round-1/` |
| [[agent-05-video-models]] | Veo 3, Kling, WAN, Luma | `round-1/` |
| [[agent-06-streaming-queues]] | Queue API, WebSocket, Streaming | `round-1/` |
| [[agent-07-finetuning-training]] | LoRA Training, 13 Trainers | `round-1/` |
| [[agent-08-billing-usage]] | Credits, Usage API, Pricing | `round-1/` |
| [[agent-09-advanced-features]] | Multi-LoRA, Masks, Expansion | `round-1/` |

### Round 2 - Gap Filling

| File | Topic | Location |
|------|-------|----------|
| [[agent-10-audio-models]] | TTS, STT, Music, Voice Cloning | `round-2/` |
| [[agent-11-3d-models]] | TripoSR, Trellis, Meshy | `round-2/` |
| [[agent-12-serverless]] | fal.App, Deployment, Scaling | `round-2/` |
| [[agent-13-errors]] | HTTP Codes, Error Types, Retry | `round-2/` |
| [[agent-14-enterprise]] | SOC2, SSO, SLA, Dedicated | `round-2/` |

### Briefings - Synthesis

| File | Purpose | Location |
|------|---------|----------|
| [[MASTER-FAL-AI-DOCUMENTATION]] | Executive synthesis | `briefings/` |
| [[KNOWLEDGE-MAP]] | Cross-reference index | `briefings/` |
| [[QUICK-REFERENCE]] | Developer cheatsheet | `briefings/` |

---

## Folder Structure

```
3-Resources/fal-ai-documentation/
├── README.md                    # This index
├── round-1/                     # Core platform docs
│   ├── agent-01-core-api.md
│   ├── agent-02-javascript-sdk.md
│   ├── agent-03-python-sdk.md
│   ├── agent-04-image-models.md
│   ├── agent-05-video-models.md
│   ├── agent-06-streaming-queues.md
│   ├── agent-07-finetuning-training.md
│   ├── agent-08-billing-usage.md
│   └── agent-09-advanced-features.md
├── round-2/                     # Gap-filling docs
│   ├── agent-10-audio-models.md
│   ├── agent-11-3d-models.md
│   ├── agent-12-serverless.md
│   ├── agent-13-errors.md
│   └── agent-14-enterprise.md
└── briefings/                   # Synthesis docs
    ├── MASTER-FAL-AI-DOCUMENTATION.md
    ├── KNOWLEDGE-MAP.md
    └── QUICK-REFERENCE.md
```

---

## For Future Agents

### Reading This Documentation

1. **Start with:** [[MASTER-FAL-AI-DOCUMENTATION]] for complete overview
2. **Navigate via:** [[KNOWLEDGE-MAP]] for topic dependencies
3. **Quick lookups:** [[QUICK-REFERENCE]] for code snippets

### File Naming Convention

All agent files follow: `agent-{NN}-{topic}.md`
- Numbers 01-09: Round 1 (core platform)
- Numbers 10-14: Round 2 (gap filling)

### Wikilink Resolution

All internal links use short format: `[[agent-01-core-api]]`
- Obsidian resolves these by unique filename
- No path prefix needed
- Works from any location in vault

### Key Endpoints for Integration

| Task | Endpoint | Doc |
|------|----------|-----|
| Generate images | `fal-ai/flux/schnell` | [[agent-04-image-models]] |
| Generate videos | `fal-ai/veo3` | [[agent-05-video-models]] |
| Train LoRA | `fal-ai/flux-lora-fast-training` | [[agent-07-finetuning-training]] |
| TTS | `fal-ai/elevenlabs` | [[agent-10-audio-models]] |
| 3D models | `fal-ai/triposr` | [[agent-11-3d-models]] |

---

## Research Metadata

| Property | Value |
|----------|-------|
| Created | 2025-12-29 |
| Research Method | Deep Research (14 parallel agents) |
| Total Words | ~75,000+ |
| Model Endpoints | 600+ documented |
| SDKs | JavaScript, Python, cURL |
| Pricing | Current as of Dec 2025 |

---

*Location: `3-Resources/fal-ai-documentation/`*
