---
source: '[unknown - KNOWLEDGE-MAP.md]'
scraped: 2025-12-29
api_provider: FAL.ai
discovery_tier: 3
verified: false
---
 FAL.ai Documentation - Knowledge Map

> **Purpose:** Visual topic dependency graph and cross-reference index
> **Created:** 2025-12-29
> **Documents:** 14 Agent Reports + 3 Synthesis Documents

---

## Visual Topic Graph

```
                            ┌─────────────────────────────────────┐
                            │     MASTER-FAL-AI-DOCUMENTATION     │
                            │        (Complete Synthesis)         │
                            └─────────────────┬───────────────────┘
                                              │
              ┌───────────────────────────────┼───────────────────────────────┐
              │                               │                               │
              ▼                               ▼                               ▼
    ┌─────────────────┐             ┌─────────────────┐             ┌─────────────────┐
    │ QUICK-REFERENCE │             │  KNOWLEDGE-MAP  │             │  (Future Docs)  │
    │  (Cheatsheet)   │             │   (This File)   │             │                 │
    └─────────────────┘             └─────────────────┘             └─────────────────┘
```

---

## Core Platform Layer

```
┌─────────────────────────────────────────────────────────────────────────────────────┐
│                              CORE PLATFORM FUNDAMENTALS                              │
├─────────────────────────────────────────────────────────────────────────────────────┤
│                                                                                      │
│   ┌─────────────────┐     ┌─────────────────┐     ┌─────────────────┐              │
│   │ agent-01        │ ──► │ agent-02        │     │ agent-03        │              │
│   │ CORE API        │     │ JAVASCRIPT SDK  │     │ PYTHON SDK      │              │
│   │                 │ ──► │                 │     │                 │              │
│   │ • REST API      │     │ • fal.run()     │     │ • fal.run()     │              │
│   │ • Authentication│     │ • fal.subscribe │     │ • async/await   │              │
│   │ • Webhooks      │     │ • fal.stream    │     │ • type hints    │              │
│   │ • Model IDs     │     │ • React hooks   │     │ • Pydantic      │              │
│   └────────┬────────┘     └────────┬────────┘     └────────┬────────┘              │
│            │                       │                       │                        │
│            └───────────────────────┼───────────────────────┘                        │
│                                    ▼                                                 │
│                     ┌─────────────────────────────┐                                 │
│                     │ agent-06 STREAMING & QUEUES │                                 │
│                     │                             │                                 │
│                     │ • Queue API                 │                                 │
│                     │ • WebSocket                 │                                 │
│                     │ • Status polling            │                                 │
│                     │ • Webhook callbacks         │                                 │
│                     └─────────────────────────────┘                                 │
│                                                                                      │
└─────────────────────────────────────────────────────────────────────────────────────┘
```

---

## Model Categories Layer

```
┌─────────────────────────────────────────────────────────────────────────────────────┐
│                                  MODEL CATEGORIES                                    │
├─────────────────────────────────────────────────────────────────────────────────────┤
│                                                                                      │
│   ┌─────────────────┐     ┌─────────────────┐     ┌─────────────────┐              │
│   │ agent-04        │     │ agent-05        │     │ agent-10        │              │
│   │ IMAGE MODELS    │     │ VIDEO MODELS    │     │ AUDIO MODELS    │              │
│   │                 │     │                 │     │                 │              │
│   │ • FLUX family   │     │ • Veo 3         │     │ • ElevenLabs    │              │
│   │ • Seedream      │ ──► │ • Kling         │     │ • Kokoro        │              │
│   │ • SDXL          │     │ • WAN           │     │ • MiniMax       │              │
│   │ • Imagen 3      │ ──► │ • Luma          │     │ • Whisper       │              │
│   │ • GPT-Image     │     │ • Hunyuan       │     │ • ACE-Step      │              │
│   └────────┬────────┘     └────────┬────────┘     └─────────────────┘              │
│            │                       │                                                 │
│            │   ┌───────────────────┘                                                │
│            ▼   ▼                                                                     │
│   ┌─────────────────┐     ┌─────────────────┐                                       │
│   │ agent-11        │     │ agent-09        │                                       │
│   │ 3D MODELS       │     │ ADVANCED        │                                       │
│   │                 │     │ FEATURES        │                                       │
│   │ • TripoSR       │     │                 │                                       │
│   │ • Trellis       │     │ • Multi-LoRA    │                                       │
│   │ • Meshy         │     │ • Inpainting    │                                       │
│   │ • SAM 3D        │     │ • Outpainting   │                                       │
│   │ • Hunyuan3D     │     │ • Prompt expand │                                       │
│   └─────────────────┘     └─────────────────┘                                       │
│                                                                                      │
└─────────────────────────────────────────────────────────────────────────────────────┘
```

---

## Training & Customization Layer

```
┌─────────────────────────────────────────────────────────────────────────────────────┐
│                           TRAINING & CUSTOMIZATION                                   │
├─────────────────────────────────────────────────────────────────────────────────────┤
│                                                                                      │
│   ┌─────────────────────────────────────────────────────────────────┐              │
│   │                agent-07 FINE-TUNING & TRAINING                  │              │
│   │                                                                  │              │
│   │  ┌──────────────┐  ┌──────────────┐  ┌──────────────┐          │              │
│   │  │ Image LoRA   │  │ Video LoRA   │  │ Specialized  │          │              │
│   │  │              │  │              │  │              │          │              │
│   │  │ • FLUX Fast  │  │ • Hunyuan    │  │ • Portrait   │          │              │
│   │  │ • FLUX.2     │  │ • WAN        │  │ • Style      │          │              │
│   │  │ • Kontext    │  │ • LTX        │  │ • Product    │          │              │
│   │  │ • Z-Image    │  │              │  │ • Logo       │          │              │
│   │  └──────────────┘  └──────────────┘  └──────────────┘          │              │
│   │                                                                  │              │
│   │  Dependencies:                                                   │              │
│   │  ├── [[agent-04-image-models]] - Base models for training       │              │
│   │  ├── [[agent-05-video-models]] - Video base models              │              │
│   │  ├── [[agent-09-advanced-features]] - LoRA inference usage      │              │
│   │  └── [[agent-08-billing-usage]] - Training pricing              │              │
│   │                                                                  │              │
│   └─────────────────────────────────────────────────────────────────┘              │
│                                                                                      │
│   ┌─────────────────────────────────────────────────────────────────┐              │
│   │                  agent-12 SERVERLESS DEPLOYMENT                  │              │
│   │                                                                  │              │
│   │  • fal.App framework                                            │              │
│   │  • Custom model hosting                                          │              │
│   │  • Docker containers                                             │              │
│   │  • GPU configuration                                             │              │
│   │  • Secrets management                                            │              │
│   │  • Auto-scaling                                                  │              │
│   │                                                                  │              │
│   │  Dependencies:                                                   │              │
│   │  ├── [[agent-01-core-api]] - API patterns                       │              │
│   │  ├── [[agent-03-python-sdk]] - Decorator syntax                 │              │
│   │  └── [[agent-14-enterprise]] - Dedicated infrastructure         │              │
│   │                                                                  │              │
│   └─────────────────────────────────────────────────────────────────┘              │
│                                                                                      │
└─────────────────────────────────────────────────────────────────────────────────────┘
```

---

## Operations Layer

```
┌─────────────────────────────────────────────────────────────────────────────────────┐
│                              OPERATIONS & ENTERPRISE                                 │
├─────────────────────────────────────────────────────────────────────────────────────┤
│                                                                                      │
│   ┌─────────────────┐     ┌─────────────────┐     ┌─────────────────┐              │
│   │ agent-08        │     │ agent-13        │     │ agent-14        │              │
│   │ BILLING & USAGE │     │ ERROR HANDLING  │     │ ENTERPRISE      │              │
│   │                 │     │                 │     │                 │              │
│   │ • Credit system │     │ • HTTP codes    │     │ • SOC 2 Type II │              │
│   │ • Usage API     │     │ • Error types   │     │ • SSO/SAML      │              │
│   │ • Pricing tiers │     │ • Retry logic   │     │ • Dedicated GPUs│              │
│   │ • Invoicing     │     │ • Debugging     │     │ • SLA 99.99%    │              │
│   │ • Quotas        │     │ • Rate limits   │     │ • Support tiers │              │
│   └─────────────────┘     └─────────────────┘     └─────────────────┘              │
│                                                                                      │
│   Cross-dependencies:                                                                │
│   • ALL documents reference → [[agent-08-billing-usage]] for pricing                │
│   • ALL documents reference → [[agent-13-errors]] for error handling                │
│   • Enterprise-scale apps  → [[agent-14-enterprise]] for compliance                 │
│                                                                                      │
└─────────────────────────────────────────────────────────────────────────────────────┘
```

---

## Topic Dependency Matrix

### Which documents to read for each use case:

| Use Case | Primary | Secondary | Tertiary |
|----------|---------|-----------|----------|
| **First API call** | [[agent-01-core-api]] | [[agent-02-javascript-sdk]] or [[agent-03-python-sdk]] | [[agent-13-errors]] |
| **Generate images** | [[agent-04-image-models]] | [[agent-01-core-api]] | [[agent-08-billing-usage]] |
| **Generate videos** | [[agent-05-video-models]] | [[agent-06-streaming-queues]] | [[agent-08-billing-usage]] |
| **Generate audio/TTS** | [[agent-10-audio-models]] | [[agent-01-core-api]] | [[agent-08-billing-usage]] |
| **Generate 3D** | [[agent-11-3d-models]] | [[agent-01-core-api]] | [[agent-08-billing-usage]] |
| **Train LoRA** | [[agent-07-finetuning-training]] | [[agent-04-image-models]] | [[agent-09-advanced-features]] |
| **Use trained LoRA** | [[agent-09-advanced-features]] | [[agent-07-finetuning-training]] | [[agent-04-image-models]] |
| **Deploy custom model** | [[agent-12-serverless]] | [[agent-03-python-sdk]] | [[agent-14-enterprise]] |
| **Handle errors** | [[agent-13-errors]] | [[agent-06-streaming-queues]] | [[agent-01-core-api]] |
| **Real-time streaming** | [[agent-06-streaming-queues]] | [[agent-02-javascript-sdk]] | [[agent-01-core-api]] |
| **Queue long jobs** | [[agent-06-streaming-queues]] | [[agent-05-video-models]] | [[agent-01-core-api]] |
| **Track usage** | [[agent-08-billing-usage]] | [[agent-01-core-api]] | [[agent-14-enterprise]] |
| **Enterprise setup** | [[agent-14-enterprise]] | [[agent-12-serverless]] | [[agent-08-billing-usage]] |

---

## Document Relationship Diagram

### agent-01-core-api (Foundation)

```
[[agent-01-core-api]]
├── Required by: ALL other documents
├── References:
│   ├── [[agent-02-javascript-sdk]]
│   ├── [[agent-03-python-sdk]]
│   ├── [[agent-06-streaming-queues]]
│   └── [[agent-08-billing-usage]]
└── Topics: REST API, Authentication, Base URLs, Model IDs, Webhooks
```

### agent-02-javascript-sdk

```
[[agent-02-javascript-sdk]]
├── Depends on: [[agent-01-core-api]]
├── References:
│   ├── [[agent-06-streaming-queues]]
│   ├── [[agent-04-image-models]]
│   └── [[agent-13-errors]]
└── Topics: npm, fal.run(), fal.subscribe(), fal.stream(), React hooks
```

### agent-03-python-sdk

```
[[agent-03-python-sdk]]
├── Depends on: [[agent-01-core-api]]
├── References:
│   ├── [[agent-06-streaming-queues]]
│   ├── [[agent-12-serverless]]
│   └── [[agent-07-finetuning-training]]
└── Topics: pip, fal.run(), async patterns, Pydantic schemas
```

### agent-04-image-models

```
[[agent-04-image-models]]
├── Depends on: [[agent-01-core-api]]
├── References:
│   ├── [[agent-07-finetuning-training]]
│   ├── [[agent-09-advanced-features]]
│   └── [[agent-08-billing-usage]]
└── Topics: FLUX, Seedream, SDXL, Imagen, GPT-Image, parameters
```

### agent-05-video-models

```
[[agent-05-video-models]]
├── Depends on: [[agent-01-core-api]], [[agent-06-streaming-queues]]
├── References:
│   ├── [[agent-04-image-models]] (image-to-video)
│   ├── [[agent-07-finetuning-training]] (video LoRAs)
│   └── [[agent-08-billing-usage]]
└── Topics: Veo 3, Kling, WAN, Luma, Hunyuan, video parameters
```

### agent-06-streaming-queues

```
[[agent-06-streaming-queues]]
├── Depends on: [[agent-01-core-api]]
├── Required by: [[agent-05-video-models]], [[agent-07-finetuning-training]]
├── References:
│   ├── [[agent-02-javascript-sdk]]
│   ├── [[agent-03-python-sdk]]
│   └── [[agent-13-errors]]
└── Topics: Queue API, WebSocket, webhooks, status polling, streaming
```

### agent-07-finetuning-training

```
[[agent-07-finetuning-training]]
├── Depends on: [[agent-04-image-models]], [[agent-06-streaming-queues]]
├── References:
│   ├── [[agent-09-advanced-features]] (using LoRAs)
│   ├── [[agent-08-billing-usage]] (training costs)
│   └── [[agent-05-video-models]] (video trainers)
└── Topics: 13 trainers, LoRA config, data requirements, auto-captioning
```

### agent-08-billing-usage

```
[[agent-08-billing-usage]]
├── Depends on: [[agent-01-core-api]]
├── Referenced by: ALL model documents
├── References:
│   ├── [[agent-14-enterprise]]
│   └── [[agent-01-core-api]]
└── Topics: Credits, Usage API, pricing tables, quotas, invoicing
```

### agent-09-advanced-features

```
[[agent-09-advanced-features]]
├── Depends on: [[agent-04-image-models]], [[agent-07-finetuning-training]]
├── References:
│   ├── [[agent-04-image-models]]
│   ├── [[agent-07-finetuning-training]]
│   └── [[agent-01-core-api]]
└── Topics: Multi-LoRA, inpainting, outpainting, prompt expansion, masks
```

### agent-10-audio-models

```
[[agent-10-audio-models]]
├── Depends on: [[agent-01-core-api]]
├── References:
│   ├── [[agent-06-streaming-queues]] (streaming TTS)
│   └── [[agent-08-billing-usage]]
└── Topics: ElevenLabs, Kokoro, MiniMax, Whisper, voice cloning, music
```

### agent-11-3d-models

```
[[agent-11-3d-models]]
├── Depends on: [[agent-01-core-api]]
├── References:
│   ├── [[agent-04-image-models]] (image-to-3D)
│   └── [[agent-08-billing-usage]]
└── Topics: TripoSR, Trellis, Meshy, SAM 3D, Hunyuan3D, output formats
```

### agent-12-serverless

```
[[agent-12-serverless]]
├── Depends on: [[agent-01-core-api]], [[agent-03-python-sdk]]
├── References:
│   ├── [[agent-14-enterprise]] (dedicated infra)
│   ├── [[agent-08-billing-usage]] (compute pricing)
│   └── [[agent-07-finetuning-training]] (hosting LoRAs)
└── Topics: fal.App, deployment, GPU config, scaling, secrets
```

### agent-13-errors

```
[[agent-13-errors]]
├── Depends on: [[agent-01-core-api]]
├── Referenced by: ALL documents
├── References:
│   ├── [[agent-06-streaming-queues]] (queue errors)
│   └── [[agent-01-core-api]]
└── Topics: HTTP codes, error types, retry logic, debugging, rate limits
```

### agent-14-enterprise

```
[[agent-14-enterprise]]
├── Depends on: [[agent-08-billing-usage]]
├── References:
│   ├── [[agent-12-serverless]] (dedicated infra)
│   ├── [[agent-08-billing-usage]]
│   └── [[agent-01-core-api]]
└── Topics: SOC 2, SSO, SLA, dedicated GPUs, support tiers, compliance
```

---

## Topic Cross-Reference Index

### Authentication & Security
- [[agent-01-core-api#authentication--security]]
- [[agent-14-enterprise#2-security--compliance]]
- [[agent-12-serverless#secrets-management]]

### API Keys
- [[agent-01-core-api#api-key-authentication]]
- [[agent-02-javascript-sdk#configuration]]
- [[agent-03-python-sdk#configuration]]

### Base URLs
- [[agent-01-core-api#base-urls--endpoint-architecture]]
- [[agent-06-streaming-queues#queue-api-endpoints]]

### Billing & Credits
- [[agent-08-billing-usage#credit-system]]
- [[agent-14-enterprise#7-billing--invoicing]]
- [[agent-01-core-api#billing-context]]

### Cold Starts
- [[agent-12-serverless#cold-start-optimization]]
- [[agent-08-billing-usage#credit-rules]] (not charged)

### Compliance
- [[agent-14-enterprise#2-security--compliance]]

### Error Handling
- [[agent-13-errors]] (comprehensive)
- [[agent-02-javascript-sdk#error-handling]]
- [[agent-03-python-sdk#error-handling]]

### Fine-Tuning
- [[agent-07-finetuning-training]] (comprehensive)
- [[agent-09-advanced-features#using-loras]]

### FLUX Models
- [[agent-04-image-models#flux-family]]
- [[agent-07-finetuning-training#flux-trainers]]

### GPU Types
- [[agent-12-serverless#machine-types]]
- [[agent-14-enterprise#4-dedicated-infrastructure]]

### Image Models
- [[agent-04-image-models]] (comprehensive)

### LoRA Configuration
- [[agent-07-finetuning-training#4-lora-configuration-options]]
- [[agent-09-advanced-features#multi-lora-stacking]]

### Model IDs
- [[agent-01-core-api#model-id-format]]

### Pricing
- [[agent-08-billing-usage]] (comprehensive)
- [[agent-04-image-models]] (image pricing)
- [[agent-05-video-models]] (video pricing)
- [[agent-10-audio-models]] (audio pricing)
- [[agent-11-3d-models]] (3D pricing)
- [[agent-07-finetuning-training#9-pricing-reference]]
- [[agent-14-enterprise#1-enterprise-plans--pricing]]

### Queue API
- [[agent-06-streaming-queues]] (comprehensive)
- [[agent-01-core-api#queue-api]]

### Rate Limits
- [[agent-13-errors#rate-limiting]]
- [[agent-14-enterprise#custom-rate-limits]]

### SDKs
- [[agent-02-javascript-sdk]] (JavaScript)
- [[agent-03-python-sdk]] (Python)

### Serverless Deployment
- [[agent-12-serverless]] (comprehensive)

### SSO
- [[agent-14-enterprise#3-sso--authentication]]

### Streaming
- [[agent-06-streaming-queues#websocket-api]]
- [[agent-02-javascript-sdk#streaming]]
- [[agent-10-audio-models#streaming-tts]]

### Training Data
- [[agent-07-finetuning-training#3-training-data-requirements]]

### Video Models
- [[agent-05-video-models]] (comprehensive)

### Voice Cloning
- [[agent-10-audio-models#voice-cloning]]

### Webhooks
- [[agent-01-core-api#webhooks]]
- [[agent-06-streaming-queues#webhook-configuration]]

### WebSocket
- [[agent-06-streaming-queues#websocket-api]]
- [[agent-02-javascript-sdk#websocket-streaming]]

---

## Reading Order Recommendations

### New to FAL.ai
1. [[agent-01-core-api]] - Understand API fundamentals
2. [[agent-02-javascript-sdk]] or [[agent-03-python-sdk]] - Your language
3. [[agent-04-image-models]] - Generate first images
4. [[agent-13-errors]] - Handle errors properly
5. [[agent-08-billing-usage]] - Understand costs

### Building Image Generation App
1. [[agent-04-image-models]] - All image models
2. [[agent-09-advanced-features]] - Advanced techniques
3. [[agent-06-streaming-queues]] - Real-time updates
4. [[agent-07-finetuning-training]] - Custom styles

### Building Video Generation App
1. [[agent-05-video-models]] - All video models
2. [[agent-06-streaming-queues]] - Queue for long jobs
3. [[agent-04-image-models]] - Image-to-video source
4. [[agent-08-billing-usage]] - Cost management

### Building Custom AI Model SaaS
1. [[agent-12-serverless]] - Deployment architecture
2. [[agent-07-finetuning-training]] - Training your model
3. [[agent-14-enterprise]] - Enterprise features
4. [[agent-08-billing-usage]] - Pricing your service

### Enterprise Implementation
1. [[agent-14-enterprise]] - Compliance & setup
2. [[agent-12-serverless]] - Dedicated infrastructure
3. [[agent-01-core-api]] - API integration
4. [[agent-08-billing-usage]] - Enterprise billing

---

## Tag Index

### By Model Family
- `#flux` → [[agent-04-image-models]], [[agent-07-finetuning-training]]
- `#seedream` → [[agent-04-image-models]]
- `#sdxl` → [[agent-04-image-models]]
- `#veo` → [[agent-05-video-models]]
- `#kling` → [[agent-05-video-models]]
- `#wan` → [[agent-05-video-models]], [[agent-07-finetuning-training]]
- `#elevenlabs` → [[agent-10-audio-models]]
- `#whisper` → [[agent-10-audio-models]]
- `#triposr` → [[agent-11-3d-models]]

### By Feature
- `#training` → [[agent-07-finetuning-training]]
- `#lora` → [[agent-07-finetuning-training]], [[agent-09-advanced-features]]
- `#streaming` → [[agent-06-streaming-queues]]
- `#queue` → [[agent-06-streaming-queues]]
- `#serverless` → [[agent-12-serverless]]
- `#enterprise` → [[agent-14-enterprise]]
- `#billing` → [[agent-08-billing-usage]]
- `#errors` → [[agent-13-errors]]

### By Media Type
- `#image` → [[agent-04-image-models]], [[agent-09-advanced-features]]
- `#video` → [[agent-05-video-models]]
- `#audio` → [[agent-10-audio-models]]
- `#tts` → [[agent-10-audio-models]]
- `#stt` → [[agent-10-audio-models]]
- `#3d` → [[agent-11-3d-models]]

---

*Generated: 2025-12-29*
*Documents Indexed: 14 Agent Reports + 3 Synthesis Documents*
