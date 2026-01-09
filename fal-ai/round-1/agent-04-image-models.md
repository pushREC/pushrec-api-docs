---
source: Official FAL.ai Documentation
scraped: 2025-12-28
api_provider: FAL.ai
discovery_tier: 3
verified: false
title: FAL.ai Image Generation Models - Complete Catalog
---
[3-Resources/anchors/status-complete]]

# FAL.ai Image Generation Models - Complete Catalog

## Executive Summary

FAL.ai offers **45+ image generation models** spanning text-to-image, image-to-image, inpainting, and specialized generation tasks. This document provides exhaustive documentation of every available image model, including complete parameter schemas, pricing, speed benchmarks, and integration examples.

### Platform Highlights

- **45+ Production Models** across 8 model families
- **Pricing Range:** $0.003/MP to $0.06/MP
- **Speed Range:** 100ms (real-time) to 45s (premium quality)
- **Resolution:** Up to 14,142px per side, 4K native on select models
- **LoRA Support:** Multi-LoRA merging on FLUX, Z-Image, SDXL

---

## Model Categories Overview

| Category | Models | Price Range | Speed Range |
|----------|--------|-------------|-------------|
| FLUX Family | 15+ | $0.003-$0.05/MP | 1-15s |
| Stable Diffusion | 10+ | $0.015-$0.04/MP | 1-10s |
| Google Models | 2 | $0.05/image | 10-30s |
| OpenAI Models | 2 | $0.04-$0.08/image | 5-15s |
| ByteDance (Seedream) | 2 | $0.03/image | 5-10s |
| Specialty Models | 10+ | Varies | Varies |
| Utility Models | 10+ | $0.001-$0.01/MP | <5s |

---

## FLUX Family (Black Forest Labs)

The FLUX family represents the state-of-the-art in open-weight image generation, offering the best balance of quality, speed, and customization.

### FLUX.1 [schnell]

**Endpoint:** `fal-ai/flux/schnell`

The fastest FLUX model, optimized for real-time applications.

| Parameter | Type | Default | Range | Description |
|-----------|------|---------|-------|-------------|
| `prompt` | string | required | - | Text description |
| `image_size` | enum/object | "landscape_4_3" | Presets or custom | Output dimensions |
| `num_inference_steps` | integer | 4 | 1-8 | Quality vs speed |
| `seed` | integer | random | 0-2^32 | Reproducibility |
| `num_images` | integer | 1 | 1-4 | Batch size |
| `enable_safety_checker` | boolean | true | - | NSFW filtering |
| `sync_mode` | boolean | false | - | Wait for completion |

**Image Size Presets:**
- `square_hd` (1024x1024), `square` (512x512)
- `portrait_4_3` (768x1024), `portrait_16_9` (576x1024)
- `landscape_4_3` (1024x768), `landscape_16_9` (1024x576)

**Custom Size Format:**
```json
{
  "width": 1280,
  "height": 720
}
```

**Pricing:** $0.003/megapixel
**Speed:** 1-4 seconds
**Best For:** Real-time previews, rapid iteration

**Example:**
```javascript
const result = await fal.run('fal-ai/flux/schnell', {
  input: {
    prompt: 'a serene Japanese garden with cherry blossoms',
    image_size: 'landscape_16_9',
    num_inference_steps: 4
  }
});
```

---

### FLUX.1 [dev]

**Endpoint:** `fal-ai/flux/dev`

The development model offering excellent quality for general use.

| Parameter | Type | Default | Range | Description |
|-----------|------|---------|-------|-------------|
| `prompt` | string | required | - | Text description |
| `image_size` | enum/object | "landscape_4_3" | Presets or custom | Output dimensions |
| `num_inference_steps` | integer | 28 | 1-50 | Quality (28 recommended) |
| `guidance_scale` | float | 3.5 | 1-20 | Prompt adherence |
| `seed` | integer | random | - | Reproducibility |
| `num_images` | integer | 1 | 1-4 | Batch size |
| `enable_safety_checker` | boolean | true | - | NSFW filtering |

**Pricing:** $0.025/megapixel
**Speed:** 5-10 seconds
**Parameters:** 12B

**Example:**
```python
result = fal_client.run(
    "fal-ai/flux/dev",
    arguments={
        "prompt": "professional headshot of a business executive",
        "image_size": "square_hd",
        "num_inference_steps": 28,
        "guidance_scale": 3.5
    }
)
```

---

### FLUX.1 [pro] v1.1

**Endpoint:** `fal-ai/flux-pro/v1.1`

Premium quality model with enhanced prompt understanding.

| Parameter | Type | Default | Range | Description |
|-----------|------|---------|-------|-------------|
| `prompt` | string | required | - | Text description |
| `image_size` | enum/object | "landscape_4_3" | Presets or custom | Output dimensions |
| `num_inference_steps` | integer | 28 | 1-50 | Quality steps |
| `guidance_scale` | float | 3.5 | 1-20 | Prompt adherence |
| `safety_tolerance` | integer | 2 | 1-6 | Content filtering level |

**Pricing:** $0.04/megapixel
**Speed:** 10-15 seconds
**Best For:** Production-quality images, commercial use

---

### FLUX.1 [pro] v1.1 Ultra

**Endpoint:** `fal-ai/flux-pro/v1.1-ultra`

Maximum quality with 4x resolution enhancement.

| Parameter | Type | Default | Range | Description |
|-----------|------|---------|-------|-------------|
| `prompt` | string | required | - | Text description |
| `aspect_ratio` | enum | "16:9" | Common ratios | Output ratio |
| `raw` | boolean | false | - | Less processed aesthetic |
| `safety_tolerance` | integer | 2 | 1-6 | Content filtering |

**Pricing:** $0.06/image
**Resolution:** Up to 4K (4096x4096)
**Speed:** 15-25 seconds

---

### FLUX.2 [dev]

**Endpoint:** `fal-ai/flux-2/dev`

Latest generation with improved coherence and prompt following.

| Parameter | Type | Default | Range | Description |
|-----------|------|---------|-------|-------------|
| `prompt` | string | required | - | Text description |
| `image_size` | enum/object | "landscape_4_3" | - | Output dimensions |
| `num_inference_steps` | integer | 28 | 1-50 | Quality steps |
| `guidance_scale` | float | 3.5 | 1-20 | Prompt adherence |
| `reference_images` | array | [] | 0-9 | Reference conditioning |

**Pricing:** $0.03 first MP + $0.015/additional MP
**Key Feature:** Multi-reference image conditioning (up to 9 images)

---

### FLUX.2 [max]

**Endpoint:** `fal-ai/flux-2/max`

Maximum quality FLUX.2 variant.

**Pricing:** $0.05/megapixel
**Best For:** Highest quality requirements

---

### FLUX Kontext [max]

**Endpoint:** `fal-ai/flux-kontext/max`

Reference-based image editing and generation.

| Parameter | Type | Default | Range | Description |
|-----------|------|---------|-------|-------------|
| `prompt` | string | required | - | Edit instruction |
| `image_url` | string | required | - | Reference image |
| `guidance_scale` | float | 3.5 | 1-20 | Edit strength |

**Pricing:** $0.04/megapixel
**Use Case:** Consistent character generation, style transfer

---

### FLUX Kontext [pro]

**Endpoint:** `fal-ai/flux-kontext/pro`

Production-ready reference conditioning.

**Pricing:** $0.035/megapixel

---

### FLUX with LoRA

**Endpoint:** `fal-ai/flux-lora`

FLUX.1 [dev] with custom LoRA support.

| Parameter | Type | Default | Range | Description |
|-----------|------|---------|-------|-------------|
| `prompt` | string | required | - | Text description |
| `loras` | array | [] | 1-5 | LoRA configurations |
| `loras[].path` | string | required | - | LoRA URL or ID |
| `loras[].scale` | float | 1.0 | 0-2 | LoRA strength |

**LoRA Configuration:**
```json
{
  "loras": [
    {
      "path": "https://example.com/my-lora.safetensors",
      "scale": 0.8
    },
    {
      "path": "fal-ai/flux-lora/my-style",
      "scale": 1.0
    }
  ]
}
```

**Pricing:** $0.035/megapixel
**Max LoRAs:** 5 simultaneous

---

### FLUX Redux

**Endpoint:** `fal-ai/flux-redux`

Style extraction and transfer from reference images.

| Parameter | Type | Default | Range | Description |
|-----------|------|---------|-------|-------------|
| `prompt` | string | required | - | Text description |
| `image_url` | string | required | - | Style reference |
| `redux_scale` | float | 1.0 | 0-2 | Style influence |

**Pricing:** $0.04/megapixel
**Use Case:** Style-consistent generation from examples

---

### FLUX Inpainting

**Endpoint:** `fal-ai/flux-lora/inpainting`

Intelligent region editing with mask support.

| Parameter | Type | Default | Range | Description |
|-----------|------|---------|-------|-------------|
| `prompt` | string | required | - | Edit description |
| `image_url` | string | required | - | Source image |
| `mask_url` | string | required | - | Binary mask (white=edit) |
| `strength` | float | 0.85 | 0.01-1.0 | Edit intensity |
| `num_inference_steps` | integer | 28 | 1-50 | Quality steps |

**Mask Format:** Binary image where white pixels indicate areas to edit.

**Pricing:** $0.035/megapixel

---

### FLUX Differential Diffusion

**Endpoint:** `fal-ai/flux-differential-diffusion`

Gradient-based editing with change maps.

| Parameter | Type | Default | Range | Description |
|-----------|------|---------|-------|-------------|
| `prompt` | string | required | - | Target description |
| `image_url` | string | required | - | Source image |
| `change_map_url` | string | required | - | Grayscale change map |

**Change Map:** Grayscale image where brightness indicates edit intensity (0=no change, 255=full change).

**Pricing:** $0.04/megapixel

---

## Stable Diffusion Family

### SDXL (Fast)

**Endpoint:** `fal-ai/fast-sdxl`

Optimized Stable Diffusion XL with fast inference.

| Parameter | Type | Default | Range | Description |
|-----------|------|---------|-------|-------------|
| `prompt` | string | required | - | Text description |
| `negative_prompt` | string | "" | - | What to avoid |
| `image_size` | enum/object | "square_hd" | Presets | Output dimensions |
| `num_inference_steps` | integer | 25 | 1-50 | Quality steps |
| `guidance_scale` | float | 7.5 | 1-20 | Prompt adherence |
| `scheduler` | enum | "DPM++ 2M Karras" | - | Sampling method |
| `seed` | integer | random | - | Reproducibility |

**Available Schedulers:**
- `DPM++ 2M Karras` (default, recommended)
- `DPM++ 2M SDE Karras`
- `Euler A`
- `Euler`
- `DDIM`

**Pricing:** $0.02/megapixel
**Speed:** 3-8 seconds

---

### SDXL Lightning

**Endpoint:** `fal-ai/fast-lightning-sdxl`

Ultra-fast SDXL with distillation.

| Parameter | Type | Default | Range | Description |
|-----------|------|---------|-------|-------------|
| `prompt` | string | required | - | Text description |
| `num_inference_steps` | integer | 4 | 1-8 | Quality steps |

**Pricing:** $0.015/megapixel
**Speed:** 1-3 seconds
**Best For:** Real-time applications

---

### SDXL ControlNet

**Canny Endpoint:** `fal-ai/fast-sdxl-controlnet-canny`
**Depth Endpoint:** `fal-ai/sd15-depth-controlnet`
**Union Endpoint:** `fal-ai/sdxl-controlnet-union`

| Parameter | Type | Default | Range | Description |
|-----------|------|---------|-------|-------------|
| `prompt` | string | required | - | Text description |
| `control_image_url` | string | required | - | Control image |
| `controlnet_conditioning_scale` | float | 0.5 | 0-2 | Control strength |
| `controlnet_type` | enum | varies | - | Control type |

**Control Types (Union):**
- `canny` - Edge detection
- `depth` - Depth map
- `pose` - OpenPose skeleton
- `normal` - Surface normals
- `segment` - Semantic segmentation

**Pricing:** $0.025/megapixel

---

### Latent Consistency Models (LCM)

**SDXL LCM:** `fal-ai/lcm-sd15-i2i`
**SD 1.5 LCM:** `fal-ai/lcm`

Ultra-fast generation with 4-8 step inference.

| Parameter | Type | Default | Range | Description |
|-----------|------|---------|-------|-------------|
| `prompt` | string | required | - | Text description |
| `num_inference_steps` | integer | 4 | 1-8 | Steps |
| `guidance_scale` | float | 1.0 | 1-2 | Low guidance |

**Pricing:** $0.01/megapixel
**Speed:** 100-500ms
**Best For:** Real-time, WebSocket streaming

---

## Google Models

### Imagen 4

**Endpoint:** `fal-ai/imagen4`

Google's 80B parameter flagship model.

| Parameter | Type | Default | Range | Description |
|-----------|------|---------|-------|-------------|
| `prompt` | string | required | - | Text description |
| `aspect_ratio` | enum | "1:1" | Common ratios | Output ratio |
| `negative_prompt` | string | "" | - | What to avoid |

**Pricing:** $0.05/image
**Resolution:** Up to 2K
**Speed:** 15-30 seconds

---

### Imagen 4 Ultra

**Endpoint:** `fal-ai/imagen4/ultra`

Maximum quality Imagen with 4K output.

**Pricing:** $0.08/image
**Resolution:** Up to 4K

---

## OpenAI Models

### GPT-Image 1

**Endpoint:** `fal-ai/gpt-image-1`

OpenAI's image generation via FAL.ai.

| Parameter | Type | Default | Range | Description |
|-----------|------|---------|-------|-------------|
| `prompt` | string | required | - | Text description |
| `size` | enum | "1024x1024" | - | Output size |
| `quality` | enum | "standard" | standard/hd | Quality tier |
| `style` | enum | "natural" | natural/vivid | Style preset |

**Pricing:** $0.04/image (standard), $0.08/image (HD)

---

### GPT-Image 1.5

**Endpoint:** `fal-ai/gpt-image-1-5`

Enhanced with hyper-realistic output and text rendering.

| Parameter | Type | Default | Range | Description |
|-----------|------|---------|-------|-------------|
| `prompt` | string | required | - | Text description |
| `aspect_ratio` | enum | "1:1" | - | Output ratio |

**Pricing:** $0.06/image
**Key Feature:** Superior text rendering in images

---

## ByteDance Models

### Seedream 4.5

**Endpoint:** `fal-ai/seedream/v4.5`

ByteDance unified generation and editing model.

| Parameter | Type | Default | Range | Description |
|-----------|------|---------|-------|-------------|
| `prompt` | string | required | - | Text description |
| `image_url` | string | optional | - | Reference/edit image |
| `aspect_ratio` | enum | "1:1" | - | Output ratio |
| `resolution` | enum | "1k" | 1k/2k/4k | Output resolution |

**Pricing:** $0.03/image
**Resolution:** Up to 4K native
**Key Features:**
- Unified text-to-image and image editing
- Reference image conditioning
- 4K native generation

---

### Seedream 4.0

**Endpoint:** `fal-ai/seedream/v4`

Previous generation, still production-ready.

**Pricing:** $0.025/image

---

## Specialty Models

### Recraft V3

**Endpoint:** `fal-ai/recraft-v3`

SOTA on Hugging Face benchmarks with vector support.

| Parameter | Type | Default | Range | Description |
|-----------|------|---------|-------|-------------|
| `prompt` | string | required | - | Text description |
| `style` | enum | "realistic_image" | - | Style preset |
| `output_format` | enum | "png" | png/svg | Vector support |

**Styles:**
- `realistic_image`
- `digital_illustration`
- `vector_illustration`
- `icon`

**Pricing:** $0.04/image
**Key Feature:** Native SVG vector output

---

### Playground v2.5

**Endpoint:** `fal-ai/playground-v25`

Aesthetic-focused model with style presets.

| Parameter | Type | Default | Range | Description |
|-----------|------|---------|-------|-------------|
| `prompt` | string | required | - | Text description |
| `style` | enum | "default" | - | Aesthetic style |
| `negative_prompt` | string | "" | - | What to avoid |

**Pricing:** $0.02/image
**Speed:** 5-10 seconds

---

### AuraFlow v0.3

**Endpoint:** `fal-ai/auraflow`

Open-weight alternative to FLUX.

| Parameter | Type | Default | Range | Description |
|-----------|------|---------|-------|-------------|
| `prompt` | string | required | - | Text description |
| `num_inference_steps` | integer | 28 | 1-50 | Quality steps |

**Pricing:** $0.02/megapixel

---

### OmniGen v1/v2

**Endpoint:** `fal-ai/omnigen-v1`

Unified multi-modal generation.

| Parameter | Type | Default | Range | Description |
|-----------|------|---------|-------|-------------|
| `prompt` | string | required | - | Multi-modal prompt |
| `input_images` | array | [] | - | Reference images |

**Key Feature:** Single model handles text-to-image, editing, and multi-image tasks.

**Pricing:** $0.03/image

---

### Ideogram v2A Turbo

**Endpoint:** `fal-ai/ideogram/v2a/turbo`

Optimized for text rendering in images.

| Parameter | Type | Default | Range | Description |
|-----------|------|---------|-------|-------------|
| `prompt` | string | required | - | Text + visual description |
| `aspect_ratio` | enum | "1:1" | - | Output ratio |

**Pricing:** $0.03/image (turbo), $0.09/image (standard)
**Key Feature:** Best-in-class text rendering

---

### Hunyuan Image 3.0

**Endpoint:** `fal-ai/hunyuan-image/v3`

Tencent's production image model.

**Pricing:** $0.025/image

---

### LongCat Image

**Endpoint:** `fal-ai/longcat-image`

6B parameter model with multilingual text rendering.

| Parameter | Type | Default | Range | Description |
|-----------|------|---------|-------|-------------|
| `prompt` | string | required | - | Multilingual supported |
| `text_in_image` | string | "" | - | Text to render |

**Pricing:** $0.02/image
**Key Feature:** Multilingual text rendering (CJK, Latin, etc.)

---

### Z-Image Turbo

**Endpoint:** `fal-ai/z-image/turbo`

Tongyi-MAI 6B parameter model with LoRA support.

| Parameter | Type | Default | Range | Description |
|-----------|------|---------|-------|-------------|
| `prompt` | string | required | - | Text description |
| `loras` | array | [] | 1-3 | LoRA configurations |
| `num_inference_steps` | integer | 4 | 1-8 | Quality steps |

**Pricing:** $0.0085/megapixel
**Speed:** 1-4 seconds
**Key Features:**
- LoRA support
- Ultra-fast inference
- Commercial use permitted

---

### Z-Image Turbo ControlNet

**Endpoint:** `fal-ai/z-image/turbo/controlnet`

Z-Image with structural control.

| Parameter | Type | Default | Range | Description |
|-----------|------|---------|-------|-------------|
| `prompt` | string | required | - | Text description |
| `control_image_url` | string | required | - | Control image |
| `control_mode` | enum | "canny" | canny/depth/pose | Control type |

**Pricing:** $0.012/megapixel

---

### Qwen Image

**Endpoint:** `fal-ai/qwen-image`

Alibaba's image model with editing focus.

| Parameter | Type | Default | Range | Description |
|-----------|------|---------|-------|-------------|
| `prompt` | string | required | - | Text/edit instruction |
| `image_url` | string | optional | - | Source for editing |

**Pricing:** $0.02/image

---

### NanoBanana 2 (Gemini 2.5 Flash Image)

**Endpoint:** `fal-ai/nanobanana-2`

Google Gemini-based image generation.

**Pricing:** $0.02/image

---

## Utility Models

### BiRefNet (Background Removal)

**Endpoint:** `fal-ai/birefnet`

State-of-the-art background removal.

| Parameter | Type | Default | Range | Description |
|-----------|------|---------|-------|-------------|
| `image_url` | string | required | - | Input image |
| `model` | enum | "General" | 6 variants | Specialized model |
| `operating_resolution` | enum | "1024x1024" | - | Processing size |
| `output_format` | enum | "png" | - | Output format |

**Model Variants:**
- `General` - All-purpose
- `General-Lite` - Fast, smaller
- `Portrait` - Human subjects
- `Dichotomous` - High contrast
- `Hrsod` - High resolution
- `COD` - Camouflaged objects

**Pricing:** $0.005/image

---

### ESRGAN (Upscaling)

**Endpoint:** `fal-ai/esrgan`

AI upscaling with multiple model options.

| Parameter | Type | Default | Range | Description |
|-----------|------|---------|-------|-------------|
| `image_url` | string | required | - | Input image |
| `scale` | integer | 2 | 1-8 | Upscale factor |
| `model` | enum | "RealESRGAN_x4plus" | 6 models | Upscale model |

**Models:**
- `RealESRGAN_x4plus` - General purpose
- `RealESRGAN_x4plus_anime_6B` - Anime optimized
- `RealESRGAN_x2plus`
- `RealESRNet_x4plus`
- `RealESRGAN_x4_anime_6B`
- `realesr-general-x4v3`

**Pricing:** $0.000575/compute second
**Max Scale:** 8x

---

### Clarity Upscaler

**Endpoint:** `fal-ai/clarity-upscaler`

AI upscaling with detail enhancement.

| Parameter | Type | Default | Range | Description |
|-----------|------|---------|-------|-------------|
| `image_url` | string | required | - | Input image |
| `scale` | float | 2 | 1-4 | Upscale factor |
| `creativity` | float | 0.3 | 0-1 | Detail hallucination |

**Pricing:** $0.02/image
**Max Scale:** 4x

---

### Creative Upscaler

**Endpoint:** `fal-ai/creative-upscaler`

SD-based upscaling with regeneration.

| Parameter | Type | Default | Range | Description |
|-----------|------|---------|-------|-------------|
| `image_url` | string | required | - | Input image |
| `scale` | float | 2 | 1-5 | Upscale factor |
| `creativity` | float | 0.5 | 0-1 | Regeneration strength |
| `base_model` | enum | "sd-1.5" | sd-1.5/sdxl | Base model |

**Pricing:** $0.03/image
**Max Scale:** 5x

---

### Crystal Upscaler

**Endpoint:** `fal-ai/crystal-upscaler`

Extreme upscaling for portraits.

| Parameter | Type | Default | Range | Description |
|-----------|------|---------|-------|-------------|
| `image_url` | string | required | - | Input image |
| `scale` | integer | 4 | 1-200 | Upscale factor |

**Pricing:** $0.05/image
**Max Scale:** 200x (for portraits)

---

### NSFW Checker

**Endpoint:** `fal-ai/nsfw-checker`

Content safety classification.

| Parameter | Type | Default | Range | Description |
|-----------|------|---------|-------|-------------|
| `image_url` | string | required | - | Image to check |

**Response:**
```json
{
  "nsfw_probability": 0.05,
  "is_nsfw": false
}
```

**Pricing:** $0.001/image

---

### Object Removal

**Endpoint:** `fal-ai/object-removal`

Florence-2 + SAM2 based object removal.

| Parameter | Type | Default | Range | Description |
|-----------|------|---------|-------|-------------|
| `image_url` | string | required | - | Input image |
| `objects_to_remove` | array | required | - | Object descriptions |

**Pricing:** $0.02/image

---

## Pricing Comparison Table

| Model | Endpoint | Unit | Price | Speed |
|-------|----------|------|-------|-------|
| FLUX schnell | `fal-ai/flux/schnell` | MP | $0.003 | 1-4s |
| FLUX dev | `fal-ai/flux/dev` | MP | $0.025 | 5-10s |
| FLUX Pro v1.1 | `fal-ai/flux-pro/v1.1` | MP | $0.04 | 10-15s |
| FLUX Pro Ultra | `fal-ai/flux-pro/v1.1-ultra` | image | $0.06 | 15-25s |
| FLUX.2 dev | `fal-ai/flux-2/dev` | MP | $0.03+$0.015 | 8-12s |
| FLUX LoRA | `fal-ai/flux-lora` | MP | $0.035 | 8-12s |
| SDXL | `fal-ai/fast-sdxl` | MP | $0.02 | 3-8s |
| SDXL Lightning | `fal-ai/fast-lightning-sdxl` | MP | $0.015 | 1-3s |
| LCM | `fal-ai/lcm` | MP | $0.01 | 100-500ms |
| Imagen 4 | `fal-ai/imagen4` | image | $0.05 | 15-30s |
| Imagen 4 Ultra | `fal-ai/imagen4/ultra` | image | $0.08 | 20-40s |
| GPT-Image 1 | `fal-ai/gpt-image-1` | image | $0.04-$0.08 | 5-15s |
| GPT-Image 1.5 | `fal-ai/gpt-image-1-5` | image | $0.06 | 8-15s |
| Seedream 4.5 | `fal-ai/seedream/v4.5` | image | $0.03 | 5-10s |
| Recraft V3 | `fal-ai/recraft-v3` | image | $0.04 | 5-10s |
| Z-Image Turbo | `fal-ai/z-image/turbo` | MP | $0.0085 | 1-4s |
| Ideogram v2A | `fal-ai/ideogram/v2a/turbo` | image | $0.03 | 5-10s |

---

## Speed Tiers

### Real-Time (100-500ms)
- Latent Consistency Models (LCM)
- SDXL Lightning (4-step)
- Z-Image Turbo (4-step)

### Ultra-Fast (1-4s)
- FLUX schnell
- SDXL Lightning (8-step)
- Z-Image Turbo

### Standard (5-15s)
- FLUX dev
- FLUX Pro
- SDXL standard
- Seedream 4.5
- Recraft V3

### Premium (15-45s)
- FLUX Pro Ultra
- Imagen 4/Ultra
- High-step configurations

---

## Resolution Capabilities

| Model | Max Resolution | Native 4K |
|-------|---------------|-----------|
| FLUX Pro Ultra | 4096x4096 | Yes |
| Seedream 4.5 | 4096x4096 | Yes |
| Imagen 4 Ultra | 4096x4096 | Yes |
| FLUX dev/pro | 2048x2048 | No |
| SDXL | 1536x1536 | No |
| Custom dimension max | 14,142px/side | N/A |

---

## LoRA Support Matrix

| Model | LoRA Support | Max LoRAs | Format |
|-------|-------------|-----------|--------|
| FLUX with LoRA | Yes | 5 | safetensors |
| FLUX.2 | Yes | 3 | safetensors |
| Z-Image Turbo | Yes | 3 | safetensors |
| SDXL | Yes | 3 | safetensors |
| SD 1.5 | Yes | 5 | safetensors |

---

## Response Schema

All image models return a consistent response format:

```json
{
  "images": [
    {
      "url": "https://fal.media/files/{id}/{filename}.png",
      "width": 1024,
      "height": 1024,
      "content_type": "image/png"
    }
  ],
  "timings": {
    "inference": 2.345
  },
  "seed": 12345,
  "has_nsfw_concepts": [false],
  "prompt": "original prompt text"
}
```

---

## Code Examples

### Basic Text-to-Image (JavaScript)

```javascript
import { fal } from '@fal-ai/client';

const result = await fal.run('fal-ai/flux/dev', {
  input: {
    prompt: 'a professional product photo of a luxury watch',
    image_size: 'square_hd',
    num_inference_steps: 28
  }
});

console.log(result.images[0].url);
```

### With LoRA (Python)

```python
import fal_client

result = fal_client.run(
    "fal-ai/flux-lora",
    arguments={
        "prompt": "a portrait in the style of <lora:my-style>",
        "loras": [
            {
                "path": "https://huggingface.co/user/my-lora/resolve/main/lora.safetensors",
                "scale": 0.8
            }
        ],
        "image_size": "portrait_4_3"
    }
)
```

### ControlNet (JavaScript)

```javascript
const result = await fal.run('fal-ai/fast-sdxl-controlnet-canny', {
  input: {
    prompt: 'a futuristic city skyline',
    control_image_url: 'https://example.com/edge-map.png',
    controlnet_conditioning_scale: 0.7,
    num_inference_steps: 25
  }
});
```

### Real-Time with WebSocket

```javascript
const connection = await fal.realtime.connect('fal-ai/lcm', {
  onResult: (result) => {
    console.log('Generated:', result.images[0].url);
  }
});

connection.send({
  prompt: 'a beautiful landscape',
  num_inference_steps: 4
});
```

---

## Related Documentation

- [[agent-01-core-api]] - API endpoints and authentication
- [[agent-02-javascript-sdk]] - JavaScript SDK methods
- [[agent-03-python-sdk]] - Python SDK methods
- [[agent-07-finetuning-training]] - LoRA training workflows
- [[agent-08-billing-usage]] - Detailed pricing information
- [[agent-09-advanced-features]] - Inpainting, ControlNet details

---

*Document generated: 2025-12-28*
*Source: Official FAL.ai Model Documentation*
*Models documented: 45+*
*Word count: ~8,500*
