---
source: https://openrouter.ai/docs/guides/guides/distillation
scraped: 2026-01-08
---

# Distillation

## Overview

OpenRouter provides tools to ensure compliance when using model outputs for training smaller models through its distillation features.

## Key Concepts

**Model Distillation** involves training efficient smaller models using outputs from larger models. However, compliance with provider terms of service is essential, as some creators prohibit using their outputs for training purposes.

OpenRouter tracks permission status through the `is_trainable_text` property, marking models as "distillable" when creators explicitly permit text training use.

## Finding Distillable Models

Users can access compliant models via:

1. The Models page with the Distillable filter enabled
2. Programmatic API requests using the `enforce_distillable_text` parameter

## API Implementation

The routing parameter controls programmatic access:

| Parameter | Type | Purpose |
|-----------|------|---------|
| `enforce_distillable_text` | boolean | Restrict routing to only models that allow text distillation |

When enabled, requests route exclusively to distillation-permitted models or return an error if none are available.

## Code Examples Available

Documentation includes implementation examples in:

- TypeScript (SDK and fetch)
- Python
- cURL

## Primary Use Cases

- Building compliant training datasets
- Creating specialized model distillation pipelines
- Enforcing organizational compliance policies programmatically

**Important Note:** OpenRouter provides information on a best-effort basis; users should independently verify specific license terms for their intended use case.
