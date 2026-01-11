---
source: 'FAL.ai official documentation (synthesized from https://fal.ai/docs)'
scraped: 2025-12-28
api_provider: FAL.ai
discovery_tier: 3
verified: false
title: "FAL.ai Advanced Features: Comprehensive Documentation"
---
 FAL.ai Advanced Features: Comprehensive Documentation

## Executive Summary

This document provides exhaustive documentation of FAL.ai's advanced image editing and manipulation capabilities, including inpainting, outpainting, ControlNet conditioning, image-to-image transformation, upscaling, face enhancement, background removal, object removal, and specialized editing features. All endpoints, parameters, and configurations are documented with technical specifications and code examples.

**Coverage:** 15 major feature categories, 40+ distinct endpoints, 200+ parameters
**Target Audience:** Developers integrating FAL.ai's advanced AI capabilities
**Last Updated:** 2025-12-28

---

## Table of Contents

1. [Inpainting Systems](#1-inpainting-systems)
2. [Outpainting Systems](#2-outpainting-systems)
3. [ControlNet Integration](#3-controlnet-integration)
4. [Image-to-Image Transformation](#4-image-to-image-transformation)
5. [Upscaling Solutions](#5-upscaling-solutions)
6. [Face Enhancement & Restoration](#6-face-enhancement--restoration)
7. [Background Removal Systems](#7-background-removal-systems)
8. [Object Removal & Erasure](#8-object-removal--erasure)
9. [Advanced Editing Features](#9-advanced-editing-features)
10. [Segmentation & Detection](#10-segmentation--detection)
11. [Video Editing Capabilities](#11-video-editing-capabilities)
12. [Multi-Image & Batch Processing](#12-multi-image--batch-processing)
13. [Code Examples & Integration Patterns](#13-code-examples--integration-patterns)
14. [Parameter Reference Tables](#14-parameter-reference-tables)
15. [Best Practices & Optimization](#15-best-practices--optimization)

---

## 1. Inpainting Systems

Inpainting is the process of selectively regenerating portions of an image based on a mask, allowing precise local edits while preserving the rest of the image.

### 1.1 Standard Inpainting (SDXL/SD)

**Endpoint:** `fal-ai/inpaint`

The standard inpainting endpoint supports both Stable Diffusion XL and SD 1.5 models, offering flexibility in model selection.

#### Required Parameters

| Parameter | Type | Description |
|-----------|------|-------------|
| `model_name` | string | URL or HuggingFace ID of the base model |
| `prompt` | string | Descriptive text for image generation |
| `image_url` | string | Input image for inpaint mode |
| `mask_url` | string | Mask image (black = preserve, white = inpaint) |

#### Optional Parameters

| Parameter | Type | Default | Range | Description |
|-----------|------|---------|-------|-------------|
| `negative_prompt` | string | "" | - | Details to exclude from generation |
| `num_inference_steps` | integer | 30 | 0-150 | Processing iterations |
| `guidance_scale` | float | 7.5 | 0-20 | Prompt adherence strength (CFG) |
| `seed` | integer | random | - | Ensures reproducible results |

#### Mask Format Requirements

**Critical:** The mask must be a black and white image where:
- **White areas (255):** Regions to be filled/inpainted
- **Black areas (0):** Regions to preserve unchanged
- **Dimensions:** Must match the input image exactly

#### Supported Models

```
diffusers/stable-diffusion-xl-1.0-inpainting-0.1
stabilityai/stable-diffusion-xl-base-1.0
runwayml/stable-diffusion-v1-5
SG161222/Realistic_Vision_V2.0
```

#### Code Example

```javascript
import { fal } from "@fal-ai/client";

const result = await fal.subscribe("fal-ai/inpaint", {
  input: {
    model_name: "diffusers/stable-diffusion-xl-1.0-inpainting-0.1",
    prompt: "a photo of a cat sitting on a velvet cushion",
    image_url: "https://example.com/living-room.png",
    mask_url: "https://example.com/couch-mask.png",
    negative_prompt: "blurry, low quality, distorted",
    num_inference_steps: 40,
    guidance_scale: 7.5,
    seed: 42
  }
});

console.log(result.data.image.url);
```

#### Output Schema

```json
{
  "image": {
    "url": "string",
    "content_type": "image/png",
    "file_name": "string",
    "file_size": 1234567,
    "width": 1024,
    "height": 1024
  },
  "seed": 42
}
```

### 1.2 FLUX.1 [dev] Inpainting with LoRA

**Endpoint:** `fal-ai/flux-lora/inpainting`

FLUX.1 [dev] inpainting offers next-generation quality with LoRA support for personalized styles.

#### Core Parameters

| Parameter | Type | Default | Range | Description |
|-----------|------|---------|-------|-------------|
| `prompt` | string | required | - | The prompt to generate an image from |
| `image_url` | string | required | - | URL of image to use for inpainting |
| `mask_url` | string | required | - | The mask area to inpaint |
| `strength` | float | 0.85 | 0.01-1.0 | **1.0 = complete remake, 0.0 = preserve original** |

#### Strength Parameter Behavior

The `strength` parameter is crucial for controlling inpainting intensity:

- **0.0 - 0.3:** Minimal changes, preserves most original details
- **0.3 - 0.5:** Moderate changes, blends new content with original
- **0.5 - 0.7:** Significant changes, prioritizes prompt over original
- **0.7 - 0.85:** Strong changes, default setting
- **0.85 - 1.0:** Near-complete regeneration

#### Image Configuration

**Size Options:**
- Presets: `square_hd`, `square`, `portrait_4_3`, `portrait_16_9`, `landscape_4_3`, `landscape_16_9`
- Custom: Specify `width` and `height` directly

**Output Formats:**
- JPEG (default)
- PNG

#### Generation Parameters

| Parameter | Type | Default | Range | Description |
|-----------|------|---------|-------|-------------|
| `num_inference_steps` | integer | 28 | 1-50 | Processing iterations |
| `guidance_scale` | float | 3.5 | 0-35 | CFG strength for prompt adherence |
| `num_images` | integer | 1 | 1-4 | Number of variations to generate |
| `seed` | integer | random | - | Reproducibility seed |
| `enable_safety_checker` | boolean | true | - | NSFW content filtering |

#### LoRA Support

Apply multiple LoRAs with individual scaling:

```javascript
const result = await fal.subscribe("fal-ai/flux-lora/inpainting", {
  input: {
    prompt: "beautiful watercolor painting of a garden",
    image_url: "https://example.com/photo.jpg",
    mask_url: "https://example.com/mask.png",
    strength: 0.75,
    loras: [
      {
        path: "https://example.com/watercolor-style.safetensors",
        scale: 1.2
      },
      {
        path: "https://example.com/impressionist.safetensors",
        scale: 0.8
      }
    ],
    num_inference_steps: 35,
    guidance_scale: 4.0
  }
});
```

**LoRA Scaling Range:** 0-4, default: 1

### 1.3 FLUX.1 [pro] Fill

**Endpoint:** `fal-ai/flux-pro/v1/fill`

FLUX.1 [pro] Fill is a next-generation inpainting/outpainting model offering the highest quality results.

#### Core Capabilities

- **Inpainting:** Masked region editing
- **Outpainting:** Canvas extension beyond image boundaries
- **Hybrid:** Combine both in a single operation

#### Required Parameters

| Parameter | Type | Description |
|-----------|------|-------------|
| `prompt` | string | The prompt to fill the masked part of the image |
| `image_url` | string | Original image (must match mask dimensions) |
| `mask_url` | string | Mask image (must match input image dimensions) |

#### Optional Configuration

| Parameter | Type | Default | Description |
|-----------|------|---------|-------------|
| `seed` | integer | random | Ensures reproducible outputs |
| `num_images` | integer | 1 (1-4) | Generate multiple variants |
| `output_format` | enum | JPEG | JPEG or PNG |
| `safety_tolerance` | integer | - (1-6) | Safety strictness levels |
| `enhance_prompt` | boolean | false | Automatic prompt optimization |

#### Pricing

**$0.05 per megapixel** - Partner API with commercial use approval

#### Dimension Matching Requirement

**Critical:** Input image and mask must have identical dimensions. Mismatched sizes will result in API errors.

#### Code Example

```javascript
const result = await fal.subscribe("fal-ai/flux-pro/v1/fill", {
  input: {
    prompt: "lush tropical plants in terracotta pots",
    image_url: "https://example.com/room-1024x1024.jpg",
    mask_url: "https://example.com/corner-mask-1024x1024.png",
    num_images: 2,
    output_format: "PNG",
    enhance_prompt: true,
    safety_tolerance: 3
  }
});
```

#### Terms of Service

All usage must comply with **FLUX.1 PRO Terms of Service**.

### 1.4 Fooocus Inpainting

**Endpoint:** `fal-ai/fooocus/inpaint`

Fooocus offers specialized inpainting with unique modes and mask manipulation.

#### Inpainting Modes

| Mode | Description |
|------|-------------|
| `Inpaint or Outpaint (default)` | Standard inpainting with outpainting support |
| `Improve Detail (face, hand, eyes, etc.)` | Focused detail enhancement |
| `Modify Content (add objects, change background, etc.)` | Content addition/replacement |

#### Mask Manipulation

**Mask Growth:**
- Positive values: Expand white area (inpaint more)
- Negative values: Shrink white area (inpaint less)

**Mask Inversion:**
- `invert_mask: true` - Inverts black/white regions

#### Code Example

```javascript
const result = await fal.subscribe("fal-ai/fooocus/inpaint", {
  input: {
    prompt: "detailed portrait with perfect eyes and hands",
    image_url: "https://example.com/portrait.jpg",
    mask_url: "https://example.com/face-hands-mask.png",
    inpaint_mode: "Improve Detail (face, hand, eyes, etc.)",
    mask_growth: 5,  // Expand mask slightly
    invert_mask: false
  }
});
```

### 1.5 SDXL ControlNet Union Inpainting

**Endpoint:** `fal-ai/sdxl-controlnet-union/inpainting`

Efficient SDXL multi-controlnet inpainting combining ControlNet guidance with selective editing.

#### Key Parameters

| Parameter | Type | Default | Range |
|-----------|------|---------|-------|
| `controlnet_conditioning_scale` | float | 0.5 | 0-1 |
| `num_inference_steps` | integer | 35 | 1-50 |
| `image_url` | string | required | - |
| `mask_url` | string | required | - |

#### Image Size Options

**Presets:** `square_hd`, `square`, `portrait_4_3`, `portrait_16_9`, `landscape_4_3`, `landscape_16_9`

**Custom:** Specify exact dimensions

---

## 2. Outpainting Systems

Outpainting extends image boundaries with AI-generated content, expanding the canvas while maintaining coherence.

### 2.1 Image Outpaint API

**Endpoint:** `fal-ai/image-apps-v2/outpaint`

Directional outpainting with precise edge control.

#### Directional Expansion Parameters

All measured in pixels, range: **0-700**

| Parameter | Default | Description |
|-----------|---------|-------------|
| `expand_left` | 0 | Adds black margin to left side |
| `expand_right` | 0 | Adds black margin to right side |
| `expand_top` | 0 | Adds black margin to top side |
| `expand_bottom` | 400 | Adds black margin to bottom |

#### Zoom Control

**`zoom_out_percentage`** (0-90, default: 20)

"Percentage to zoom out the image. If set, the image will be scaled down by this percentage and black margins will be added to maintain original size."

#### Additional Parameters

| Parameter | Type | Default | Description |
|-----------|------|---------|-------------|
| `image_url` | string | required | Source image |
| `prompt` | string | optional | Guide the outpainting (appended to base instruction) |
| `num_images` | integer | 1 (1-4) | Quantity to generate |
| `output_format` | enum | PNG | PNG, JPEG, JPG, or WebP |
| `enable_safety_checker` | boolean | true | NSFW filtering |
| `sync_mode` | boolean | false | Synchronous vs. asynchronous |

#### Code Example: Vertical Extension

```javascript
// Extend image downward by 600 pixels
const result = await fal.subscribe("fal-ai/image-apps-v2/outpaint", {
  input: {
    image_url: "https://example.com/landscape.jpg",
    prompt: "with a beautiful reflection in still water",
    expand_bottom: 600,
    expand_left: 0,
    expand_right: 0,
    expand_top: 0,
    zoom_out_percentage: 0,
    num_images: 2,
    output_format: "PNG"
  }
});
```

#### Code Example: Uniform Expansion with Zoom

```javascript
// Zoom out 30% and expand all sides uniformly
const result = await fal.subscribe("fal-ai/image-apps-v2/outpaint", {
  input: {
    image_url: "https://example.com/portrait.jpg",
    prompt: "in a photography studio with professional lighting",
    expand_left: 200,
    expand_right: 200,
    expand_top: 200,
    expand_bottom: 200,
    zoom_out_percentage: 30,
    output_format: "JPEG"
  }
});
```

### 2.2 Wan VACE 14B Video Outpainting

**Endpoint:** `fal-ai/wan-vace-14b/outpainting`

Video-to-video outpainting with temporal consistency.

#### Capabilities

- Depth-based outpainting
- Pose-guided outpainting
- Temporal consistency across frames
- Mask-based control

#### Core Parameters

| Parameter | Type | Description |
|-----------|------|-------------|
| `video_url` | string (required) | URL to source video file |
| `mask_url` | string (optional) | URL to source mask file |
| `temporal_downsample_factor` | integer | Frame sampling rate |

#### Editing Modes

- Depth
- Pose
- Inpainting
- Outpainting
- Reframe

---

## 3. ControlNet Integration

ControlNet enables precise structural control over image generation using edge maps, depth maps, pose skeletons, and other guidance signals.

### 3.1 SDXL ControlNet Canny

**Endpoint:** `fal-ai/fast-sdxl-controlnet-canny`

Edge-based image generation using Canny edge detection.

#### Core Input Parameters

**Required:**
- `prompt` (string): Text description for image generation
- `control_image_url` (string): URL of the control image

**Optional:**
- `controlnet_conditioning_scale` (float): 0-1, default 0.5 - "The scale of the controlnet conditioning"
- `negative_prompt` (string): Details to exclude from generation
- `image_size`: Output dimensions or preset sizes
- `num_inference_steps` (integer): 1-50, default 25
- `seed` (integer): For reproducible results
- `enable_deep_cache` (boolean): DeepCache optimization, default false
- `guidance_scale` (float): 0-20, default 7.5 - CFG strength
- `sync_mode` (boolean): Synchronous response mode
- `num_images` (integer): 1-8, default 1
- `loras` (array): Custom LoRA weights with scaling
- `enable_safety_checker` (boolean): Content filtering
- `expand_prompt` (boolean): Auto-expand prompt text

#### Image Size Options

**Presets:** `square_hd`, `square`, `portrait_4_3`, `portrait_16_9`, `landscape_4_3`, `landscape_16_9`

**Custom:** Object with `width` and `height` properties (max 14,142 pixels)

#### Code Example

```javascript
import { fal } from "@fal-ai/client";

const result = await fal.subscribe("fal-ai/fast-sdxl-controlnet-canny", {
  input: {
    prompt: "modern architectural building, glass and steel, sunset lighting",
    control_image_url: "https://example.com/building-sketch.png",
    controlnet_conditioning_scale: 0.75,
    negative_prompt: "blurry, low quality, distorted",
    num_inference_steps: 30,
    guidance_scale: 8.0,
    image_size: "landscape_16_9",
    num_images: 2,
    seed: 12345
  }
});
```

### 3.2 SD 1.5 Depth ControlNet

**Endpoint:** `fal-ai/sd15-depth-controlnet`

Depth map-based generation for spatial control.

#### Core Input Parameters

**Required:**
- `prompt` (string): "The prompt to use for generating the image. Be as descriptive as possible"
- `control_image_url` (string): URL pointing to the depth control image

**Optional Configuration:**
- `controlnet_conditioning_scale` (float): 0-1, default 0.5 - controls depth influence strength
- `negative_prompt` (string): Specifies unwanted elements
- `num_inference_steps` (integer): 1-70 steps, default 35
- `guidance_scale` (float): 0-20 range, default 7.5 - CFG intensity
- `seed` (integer): Reproducibility parameter
- `num_images` (integer): 1-8 images, default 1
- `sync_mode` (boolean): Wait for completion before response
- `enable_safety_checker` (boolean): NSFW filtering toggle
- `expand_prompt` (boolean): Auto-enhance prompt descriptors
- `loras` (array): List of LoRA weight objects for fine-tuning

#### Output Structure

Returns object containing:
- `images`: Array of generated image objects (URL, width, height)
- `seed`: Applied seed value
- `timings`: Performance metrics
- `has_nsfw_concepts`: Safety checker results
- `prompt`: Final processed prompt

### 3.3 FLUX General with ControlNet

**Endpoint:** `fal-ai/flux-general`

Versatile FLUX endpoint supporting LoRA, ControlNet, and IP-Adapter extensions.

#### Control Methods

The `controlnets` parameter supports multiple control types:

- `canny` - Edge detection
- `depth` - Depth mapping
- `hedsketch` - HED edge detection
- `inpainting` - Masked editing
- `pose` - Human pose skeleton
- `seg` - Segmentation maps
- `subject` - Subject-focused control
- `ghibli` - Studio Ghibli style

#### ControlNet Configuration

```javascript
const result = await fal.subscribe("fal-ai/flux-general", {
  input: {
    prompt: "portrait of a woman in traditional clothing",
    controlnets: [
      {
        path: "https://example.com/pose-image.png",
        control_type: "pose",
        conditioning_scale: 0.8,
        control_start_percent: 0,
        control_end_percent: 0.7
      }
    ],
    num_inference_steps: 30
  }
});
```

#### ControlNet Parameters

| Parameter | Type | Default | Description |
|-----------|------|---------|-------------|
| `conditioning_scale` | float | 1.0 | Scale control net weight before merging |
| `control_start_percent` | float | 0 | When to start applying controlnet (0-1) |
| `control_end_percent` | float | 1.0 | When to end applying controlnet (0-1) |
| `control_image_url` | string | required | URL of the control image |
| `mask_url` | string | optional | URL of mask for control image |
| `mask_threshold` | float | 0.5 | Mask threshold value |

#### Preprocessing Options

**Type of preprocessing to apply to the input image:**
- Default: `"None"`
- Automatic preprocessing based on control type

### 3.4 Z-Image Turbo ControlNet

**Endpoint:** `fal-ai/z-image/turbo/controlnet`

Ultra-fast ControlNet generation with automatic preprocessing.

#### Preprocessing Modes

The `preprocess` parameter offers four options:

| Mode | Description |
|------|-------------|
| `none` | No preprocessing (default) - Feed raw images |
| `canny` | Edge detection preprocessing - Sharp boundaries |
| `depth` | Depth map preprocessing - Spatial layering |
| `pose` | Pose estimation preprocessing - Human/character positioning |

#### Control Strength Parameters

**`control_scale`** (float, 0-1, default: 0.75)
- "The scale of the controlnet conditioning"
- Higher values = stricter adherence to control image
- Lower values = more creative freedom

**`control_start`** (float, 0-1, default: 0)
- "The start of the controlnet conditioning"
- When to begin applying control guidance

**`control_end`** (float, 0-1, default: 0.8)
- "The end of the controlnet conditioning"
- When to stop applying control guidance

#### Temporal Control Windowing

Apply ControlNet guidance only during specific diffusion steps:

```javascript
const result = await fal.subscribe("fal-ai/z-image/turbo/controlnet", {
  input: {
    prompt: "futuristic cyberpunk street scene",
    image_url: "https://example.com/depth-map.png",
    preprocess: "depth",
    control_scale: 0.85,
    control_start: 0.0,    // Apply from beginning
    control_end: 0.4,      // Stop at 40% completion
    num_inference_steps: 8
  }
});
```

**Use Case:** Lock structure early while allowing late-stage aesthetic refinement.

#### Core Configuration

| Parameter | Type | Default | Range | Description |
|-----------|------|---------|-------|-------------|
| `prompt` | string | required | - | Text description |
| `image_url` | string | required | - | Control image URL |
| `preprocess` | enum | none | - | Preprocessing mode |
| `control_scale` | float | 0.75 | 0-1 | Control strength |
| `inference_steps` | integer | 8 | 1-8 | Processing steps |
| `num_images` | integer | 1 | 1-4 | Variants to generate |

#### Pricing

**$0.0065 per megapixel** - 153 megapixels per dollar

#### Code Example: Pose Control

```javascript
const result = await fal.subscribe("fal-ai/z-image/turbo/controlnet", {
  input: {
    prompt: "professional dancer in elegant dress, studio lighting",
    image_url: "https://example.com/dance-photo.jpg",
    preprocess: "pose",  // Extract pose automatically
    control_scale: 0.9,  // Strict pose adherence
    control_start: 0,
    control_end: 0.8,
    image_size: "portrait_4_3",
    num_images: 3
  }
});
```

#### Best Practices: Combining Control Types

When using multiple control types (via Z-Image Turbo ControlNet with LoRA):

- Weight each component lower (e.g., 0.5 pose + 0.4 depth instead of 1.0 each)
- Total combined control strength should be around 0.8-1.0
- Increase inference steps at higher control strengths (15-20 instead of 8)

---

## 4. Image-to-Image Transformation

Image-to-image (img2img) transformation uses an existing image as a starting point, applying variations through controlled denoising.

### 4.1 Denoising Strength Fundamentals

**Denoising strength** determines how much noise is added to an image before sampling steps.

#### Range: 0 to 1

- **0:** No noise added - input image unchanged
- **1:** Complete noise - input image fully replaced

#### Recommended Values

| Range | Use Case | Description |
|-------|----------|-------------|
| 0.2-0.4 | Slight changes | Keep most of original image |
| 0.4-0.6 | **Balanced changes** | Ideal for most applications |
| 0.6-0.8 | Significant changes | Introduce major new elements |
| 0.8-1.0 | Extreme changes | Near-complete regeneration |

**Note:** Inpainting typically requires higher settings (0.7-1.0)

### 4.2 FLUX Image-to-Image

**Endpoint:** `fal-ai/flux/dev/image-to-image`

FLUX.1 [dev] image-to-image with advanced editing capabilities.

#### Core Parameters

| Parameter | Type | Default | Description |
|-----------|------|---------|-------------|
| `prompt` | string | required | Transformation description |
| `image_url` | string | required | Source image |
| `noise_strength` | float | 0.5 | Denoising strength (analogous to strength) |
| `num_inference_steps` | integer | 28 | Processing iterations |
| `guidance_scale` | float | 3.5 | Prompt adherence |

#### Scheduler/Sampler Options

The `scheduler` parameter supports:

- DPM++ 2M
- DPM++ 2M Karras
- DPM++ 2M SDE
- DPM++ 2M SDE Karras
- Euler
- Euler A
- Euler (trailing timesteps)
- LCM
- LCM (trailing timesteps)
- DDIM
- TCD

#### Timestep Override

Optionally override timesteps for the denoising process with the `timesteps` parameter.

#### Code Example

```javascript
const result = await fal.subscribe("fal-ai/flux/dev/image-to-image", {
  input: {
    prompt: "transform into impressionist painting style",
    image_url: "https://example.com/photo.jpg",
    noise_strength: 0.6,
    num_inference_steps: 35,
    guidance_scale: 4.5,
    scheduler: "DPM++ 2M Karras",
    seed: 98765
  }
});
```

### 4.3 Stable Diffusion with LoRA Image-to-Image

**Endpoint:** `fal-ai/lora/image-to-image`

SD 1.5/SDXL image-to-image with LoRA support.

#### Key Parameters

- `image_url`: Source image
- `prompt`: Transformation prompt
- `strength`: Denoising strength (0-1)
- `loras`: Array of LoRA configurations

#### Code Example: Style Transfer with LoRA

```javascript
const result = await fal.subscribe("fal-ai/lora/image-to-image", {
  input: {
    image_url: "https://example.com/portrait.jpg",
    prompt: "anime style illustration, vibrant colors",
    strength: 0.65,
    loras: [
      {
        path: "https://civitai.com/api/download/models/anime-style.safetensors",
        scale: 1.3
      }
    ],
    num_inference_steps: 40,
    guidance_scale: 7.0
  }
});
```

---

## 5. Upscaling Solutions

FAL.ai offers seven distinct upscaling models covering different use cases from general-purpose to specialized portrait enhancement.

### 5.1 ESRGAN (Real-ESRGAN)

**Endpoint:** `fal-ai/esrgan`

General-purpose upscaling with six model variants.

#### Available Models

| Model | Specialization | Scale Factor |
|-------|----------------|--------------|
| `RealESRGAN_x4plus` | General purpose (default) | 4x |
| `RealESRGAN_x2plus` | Lower upscaling | 2x |
| `RealESRGAN_x4plus_anime_6B` | Anime content | 4x |
| `RealESRGAN_x4_v3` | General v3 | 4x |
| `RealESRGAN_x4_wdn_v3` | Weak denoising | 4x |
| `RealESRGAN_x4_anime_v3` | Anime v3 | 4x |

#### API Parameters

| Parameter | Type | Default | Range | Description |
|-----------|------|---------|-------|-------------|
| `image_url` | string | required | - | URL to input image |
| `scale` | float | 2 | 1-8 | Rescaling factor |
| `tile` | integer | 0 | - | Tile size for GPU memory management |
| `face` | boolean | false | - | Upscaling a face |
| `model` | enum | RealESRGAN_x4plus | - | Model selection |
| `output_format` | enum | png | - | PNG or JPEG |

#### Tile Parameter

**Purpose:** GPU memory optimization

- Default: 0 (no tiling)
- When encountering out-of-GPU-memory issues, specify tile size
- Recommended values: 200 or 400

#### Code Example: Anime Upscaling

```javascript
const result = await fal.subscribe("fal-ai/esrgan", {
  input: {
    image_url: "https://example.com/anime-character.png",
    scale: 4,
    model: "RealESRGAN_x4plus_anime_6B",
    output_format: "png",
    face: false
  }
});
```

#### Code Example: Large Image with Tiling

```javascript
const result = await fal.subscribe("fal-ai/esrgan", {
  input: {
    image_url: "https://example.com/8k-wallpaper.jpg",
    scale: 2,
    model: "RealESRGAN_x4plus",
    tile: 400,  // Enable tiling to prevent OOM
    output_format: "jpeg"
  }
});
```

### 5.2 Clarity Upscaler

**Endpoint:** `fal-ai/clarity-upscaler`

High-fidelity upscaling with quality control parameters.

#### Core Upscaling Parameters

| Parameter | Type | Default | Range | Description |
|-----------|------|---------|-------|-------------|
| `upscale_factor` | integer | 2 | 1-4 | Magnification level |
| `image_url` | string | required | - | Input image URL |

#### Quality Control Parameters

**Resemblance** (0-1, default 0.6)
- Controls how closely output mirrors the original
- Higher values = stronger structural fidelity (ControlNet influence)

**Creativity** (0-1, default 0.35)
- Governs model deviation from prompts
- Adjusts denoise strength during sampling

**Guidance Scale (CFG)** (0-20, default 4)
- Determines adherence to descriptive prompts
- Higher values = stricter prompt following

#### Processing Configuration

| Parameter | Type | Default | Range |
|-----------|------|---------|-------|
| `inference_steps` | integer | 18 | 4-50 |
| `seed` | integer | random | - |
| `enable_safety_checker` | boolean | true | - |

#### Prompting

**Default Positive Prompt:** `"masterpiece, best quality, highres"`

**Default Negative Prompt:** `"(worst quality, low quality, normal quality:2)"`

#### Output Schema

Returns `Image` object with:
- URL
- MIME type
- Filename
- File size (bytes)
- Width and height (pixels)
- Seed integer
- Timings object (workflow step durations)

#### Code Example

```javascript
const result = await fal.subscribe("fal-ai/clarity-upscaler", {
  input: {
    image_url: "https://example.com/photo.jpg",
    upscale_factor: 4,
    resemblance: 0.7,    // High structural fidelity
    creativity: 0.25,    // Low deviation
    guidance_scale: 5,
    inference_steps: 25,
    seed: 54321
  }
});
```

### 5.3 Creative Upscaler

**Endpoint:** `fal-ai/creative-upscaler`

AI-enhanced upscaling with creative interpretation.

#### Scale Parameters

| Parameter | Type | Default | Range | Description |
|-----------|------|---------|-------|-------------|
| `scale` | integer | 2 | 1-5 | "Higher scale = bigger output image" |

#### Model Options

**`model_type`** (enum, default: `SD_1_5`)
- `SD_1_5` - Stable Diffusion 1.5
- `SDXL` - Stable Diffusion XL

#### Key Input Parameters

| Parameter | Type | Default | Range | Description |
|-----------|------|---------|-------|-------------|
| `image_url` | string | required | - | Input image |
| `creativity` | float | 0.5 | 0-1 | Deviation from original |
| `detail` | integer | 1 | 0-5 | Detail enhancement level |
| `shape_preservation` | float | 0.25 | 0-3 | Original structure maintenance |
| `guidance_scale` | float | 7.5 | 0-16 | CFG prompt adherence |
| `num_inference_steps` | integer | 20 | 1-200 | Quality vs. speed tradeoff |

#### Code Example: High-Detail Upscale

```javascript
const result = await fal.subscribe("fal-ai/creative-upscaler", {
  input: {
    image_url: "https://example.com/sketch.jpg",
    scale: 4,
    model_type: "SDXL",
    creativity: 0.6,
    detail: 4,
    shape_preservation: 0.5,
    guidance_scale: 8.0,
    num_inference_steps: 30
  }
});
```

### 5.4 Crystal Upscaler

**Endpoint:** `fal-ai/crystal-upscaler`

Advanced portrait enhancement with extreme scale factors.

#### Scale Factor Configuration

**Range:** 1 to **200**
**Default:** 2

**Constraint:** "Scale factor must be chosen such that upscaled video does not exceed 5K resolution"

#### Creativity Parameter

**Range:** 0 to 10
**Default:** 0

Controls enhancement intensity:
- **Low creativity (0-3):** Strict detail preservation
- **High creativity (7-10):** AI-enhanced reconstruction for damaged/low-res inputs

#### Core Input Parameters

**Image Upscaling:**
- `image_url` (required): URL to input image
- `scale_factor` (optional): Multiplier for resolution increase
- `creativity` (optional): Enhancement intensity control

**Video Upscaling:**
- `video_url` (required): URL to input video
- `scale_factor` (optional): Same range (1-200) with 5K constraint

#### Technical Constraints

- Maximum file size: 100.0MB
- Timeout: 20.0 seconds
- Commercial use permitted
- Optimized for facial details and portrait photography

#### Pricing

**$0.016 per megapixel**

Resolution-based pricing:
- Small upscaling (2x on 512px): ~$0.004
- Large restoration (10x on 1024px): Scales proportionally

#### Use Cases

- Portrait photography enhancement
- Social media content optimization
- Professional headshot restoration
- Severely degraded input recovery (low-res scans, compressed social media downloads)

#### Code Example: Extreme Upscale

```javascript
const result = await fal.subscribe("fal-ai/crystal-upscaler", {
  input: {
    image_url: "https://example.com/low-res-portrait-64x64.jpg",
    scale_factor: 50,  // 64px → 3200px
    creativity: 5      // Moderate AI enhancement
  }
});
```

#### Code Example: Conservative Enhancement

```javascript
const result = await fal.subscribe("fal-ai/crystal-upscaler", {
  input: {
    image_url: "https://example.com/headshot-512x512.jpg",
    scale_factor: 4,   // 512px → 2048px
    creativity: 0      // Preserve original detail
  }
});
```

### 5.5 AuraSR

**Endpoint:** Not explicitly documented

Open reproduction of GigaGAN upscaler with no resolution limits.

#### Key Features

- No limitations on resolution
- No limitations on upscaling factor
- Open-source model

### 5.6 Topaz Video Upscale

**Endpoint:** `fal-ai/topaz/upscale/video`

Professional video upscaling with frame interpolation.

#### Models

- **Proteus v4:** Upscaling
- **Apollo v8:** Frame interpolation (optional)

#### Capabilities

- Up to **8x upscaling**
- Up to **120 FPS** output
- Advanced deinterlacing
- Noise reduction

#### Core Parameters

| Parameter | Type | Default | Description |
|-----------|------|---------|-------------|
| `video_url` | string | required | Input video |
| `upscale_factor` | float | 2.0 | Upscale multiplier (e.g., 2.0 doubles width/height) |

#### Pricing Note

**Price changes effective Nov 30th, 2025**

### 5.7 Video Upscaler (RealESRGAN)

**Endpoint:** `fal-ai/video-upscaler`

Frame-by-frame video upscaling using RealESRGAN.

#### Approach

Applies RealESRGAN to each frame individually, then reassembles into upscaled video.

---

## 6. Face Enhancement & Restoration

Specialized models for facial detail improvement and portrait optimization.

### 6.1 Face Enhancement API

**Endpoint:** `fal-ai/image-editing/face-enhancement`

Enhances facial features while maintaining natural appearance.

#### Client Usage

```javascript
import { fal } from "@fal-ai/client";

const result = await fal.subscribe("fal-ai/image-editing/face-enhancement", {
  input: {
    image_url: "https://example.com/portrait.jpg"
  }
});
```

### 6.2 Face Retoucher

**Endpoint:** `fal-ai/retoucher`

Automatically retouches faces to smooth skin and remove blemishes.

### 6.3 Topaz Image Enhancer

**Endpoint:** `fal-ai/topaz/upscale/image`

Professional-grade enhancement with face-specific options.

#### Face Enhancement Parameters

| Parameter | Type | Default | Range | Description |
|-----------|------|---------|-------|-------------|
| `face_enhancement_creativity` | float | 0.5 | 0.0-1.0 | Creativity level for face enhancement |
| `face_enhancement_strength` | float | 0.8 | 0.0-1.0 | Face enhancement strength |

#### Pricing Note

**Price changes effective Nov 30th, 2025**

#### Code Example

```javascript
const result = await fal.subscribe("fal-ai/topaz/upscale/image", {
  input: {
    image_url: "https://example.com/group-photo.jpg",
    upscale_factor: 2,
    face_enhancement_creativity: 0.6,
    face_enhancement_strength: 0.85
  }
});
```

---

## 7. Background Removal Systems

Multiple background removal APIs optimized for different use cases.

### 7.1 Standard Background Removal (rembg)

**Endpoint:** `fal-ai/imageutils/rembg`

Basic background removal using the rembg algorithm.

#### Usage

```javascript
const result = await fal.subscribe("fal-ai/imageutils/rembg", {
  input: {
    image_url: "https://example.com/product.jpg"
  }
});
```

### 7.2 BiRefNet Background Removal

**Endpoint:** `fal-ai/birefnet`

Advanced background removal with multiple model variants.

#### Model Selection

**Available Models:**

| Model | Description | Use Case |
|-------|-------------|----------|
| `General Use (Light)` | Original BiRefNet model (default) | Most use cases |
| `General Use (Light 2K)` | 2K resolution variant | Higher resolution |
| `General Use (Heavy)` | Slower but more accurate | Precision work |
| `Matting` | Alpha matting optimization | Transparent edges |
| `Portrait` | Portrait-specific training | Human subjects |
| `General Use (Dynamic)` | Dynamic resolutions 256x256 to 2304x2304 | Variable sizes |

#### Processing Options

| Parameter | Type | Default | Options |
|-----------|------|---------|---------|
| `operating_resolution` | enum | 1024x1024 | `1024x1024`, `2048x2048` |
| `output_format` | enum | png | `webp`, `png`, `gif` |
| `refine_foreground` | boolean | true | - |
| `output_mask` | boolean | false | - |
| `sync_mode` | boolean | false | - |

#### Code Example: High-Precision Portrait

```javascript
const result = await fal.subscribe("fal-ai/birefnet", {
  input: {
    image_url: "https://example.com/portrait.jpg",
    model: "Portrait",
    operating_resolution: "2048x2048",
    output_format: "png",
    refine_foreground: true,
    output_mask: true  // Return segmentation mask
  }
});
```

#### Output

Returns object containing:
- `image`: Image with background removed (required)
- `mask_image`: Optional mask file used for background removal

### 7.3 Bria RMBG 2.0

**Endpoint:** `fal-ai/bria/background/remove`

Commercial-safe background removal trained on licensed data.

#### Key Features

- Trained exclusively on licensed data
- Safe for commercial use
- Risk-free usage

### 7.4 Video Background Removal

**Endpoint:** `bria/video/background-removal` or `veed/video-background-removal`

Removes backgrounds from videos with temporal consistency.

#### Input Constraints

- Size: Less than 14,142 x 14,142 pixels
- Duration: Less than 30 seconds

#### Background Color Options

- Transparent (default)
- Black
- White
- Gray
- Red
- Green
- Blue
- Yellow
- Cyan
- Magenta
- Orange

#### Code Example

```javascript
const result = await fal.subscribe("bria/video/background-removal", {
  input: {
    video_url: "https://example.com/presentation.mp4",
    background_color: "Green"  // Green screen replacement
  }
});
```

---

## 8. Object Removal & Erasure

Advanced object removal with context-aware inpainting.

### 8.1 Object Removal API

**Endpoint:** `fal-ai/object-removal`

Removes objects using Florence-2 for detection and SAM2 for segmentation.

#### Core Parameters

**Required:**
- `image_url` (string): The image to process
- `prompt` (string): Text description of the object to remove

**Optional:**
- `model` (enum): Quality level selection
  - `low_quality` - $0.006
  - `medium_quality` - $0.012
  - `high_quality` - $0.018
  - `best_quality` - $0.024 (default)
- `mask_expansion` (integer): Pixel expansion for removal mask (0-50, default: 15)

#### Alternative Input Methods

**1. Mask-based removal:**

```javascript
const result = await fal.subscribe("fal-ai/object-removal", {
  input: {
    image_url: "https://example.com/photo.jpg",
    mask_url: "https://example.com/object-mask.png"
  }
});
```

**Mask format:** White pixels (255) indicate areas to remove

**2. Bounding box selection:**

```javascript
const result = await fal.subscribe("fal-ai/object-removal", {
  input: {
    image_url: "https://example.com/photo.jpg",
    bounding_box: {
      x_min: 0.2,  // Normalized coordinates (0-1)
      y_min: 0.3,
      x_max: 0.6,
      y_max: 0.8
    }
  }
});
```

#### Code Example: Text-Prompted Removal

```javascript
const result = await fal.subscribe("fal-ai/object-removal", {
  input: {
    image_url: "https://example.com/street-photo.jpg",
    prompt: "trash can and electrical wires",
    model: "best_quality",
    mask_expansion: 20  // Expand mask to ensure complete removal
  }
});
```

#### Output Format

Returns `images` array containing processed image objects with metadata (URL, dimensions, file size, content type).

### 8.2 Image Editing Object Removal

**Endpoint:** `fal-ai/image-editing/object-removal`

Simplified object removal endpoint.

#### Parameters

- `image_url`: Source image
- `objects_to_remove`: Description of what to remove (default: "background people")

#### Code Example

```javascript
const result = await fal.subscribe("fal-ai/image-editing/object-removal", {
  input: {
    image_url: "https://example.com/tourist-photo.jpg",
    objects_to_remove: "tourists and signs"
  }
});
```

### 8.3 Qwen Image Edit Plus

**Endpoint:** `fal-ai/qwen-image-edit-plus-lora-gallery/remove-element`

Advanced element removal with consistency preservation.

#### Capabilities

- Remove objects, people, text, logos, visual elements
- Maintain high fidelity of remaining content
- Based on Qwen-Image-Edit-Remover-General-LoRA

#### Code Example

```javascript
const result = await fal.subscribe("fal-ai/qwen-image-edit-plus-lora-gallery/remove-element", {
  input: {
    image_url: "https://example.com/product-photo.jpg",
    element_to_remove: "watermark logo"
  }
});
```

### 8.4 Bria Eraser

**Endpoint:** `fal-ai/bria/eraser`

Precise object removal with commercial safety.

#### Mask Type Options

- **`manual`:** User-generated masks (e.g., brush tool)
- **`automatic`:** Algorithm-generated masks (e.g., SAM)

#### Features

- Trained exclusively on licensed data
- Safe for commercial use
- High-quality outputs

### 8.5 Finegrain Eraser

**Endpoint:** `fal-ai/finegrain-eraser/mask`

Comprehensive object removal including shadows, reflections, and lighting artifacts.

#### Advanced Capabilities

- Removes object AND its visual effects:
  - Shadows
  - Reflections
  - Lighting artifacts
- Contextually accurate scene reconstruction

#### Code Example

```javascript
const result = await fal.subscribe("fal-ai/finegrain-eraser/mask", {
  input: {
    image_url: "https://example.com/room.jpg",
    mask_url: "https://example.com/furniture-mask.png"
  }
});
```

---

## 9. Advanced Editing Features

Specialized editing capabilities beyond standard operations.

### 9.1 Differential Diffusion

**Endpoint:** `fal-ai/flux-differential-diffusion`

Granular region-specific control through change maps.

#### How It Works

Use a grayscale change map to control which regions are modified:
- **White regions:** Maximum change
- **Gray regions:** Moderate change (proportional to brightness)
- **Black regions:** Minimal/no change

#### Core Parameters

| Parameter | Type | Description |
|-----------|------|-------------|
| `prompt` | string | Transformation description |
| `image_url` | string | Source image |
| `change_map_image_url` | string | Grayscale map controlling modification intensity |

#### Code Example

```javascript
const result = await fal.subscribe("fal-ai/flux-differential-diffusion", {
  input: {
    prompt: "vibrant sunset colors",
    image_url: "https://example.com/landscape.jpg",
    change_map_image_url: "https://example.com/sky-only-mask.png"
    // Sky = white (full change), foreground = black (preserve)
  }
});
```

### 9.2 IP-Adapter Face ID

**Endpoint:** `fal-ai/ip-adapter-face-id`

High-quality zero-shot personalization.

#### Model Types

Six variants available:
- `1_5-v1`
- `1_5-v1-plus`
- `1_5-v2-plus`
- `SDXL-v1`
- `SDXL-v2-plus`
- `1_5-auraface-v1`

#### Face Configuration

**Single Face:**
- `face_image_url`: Single face image (auto-scaled to 640x640)

**Multiple Faces (Averaged):**
- `face_images_data_url`: ZIP archive of multiple face images for averaged embedding

#### Generation Settings

| Parameter | Type | Default | Range |
|-----------|------|---------|-------|
| `prompt` | string | required | - |
| `model_type` | enum | - | See above |
| `width` / `height` | integer | 512 | 512-1024 |
| `num_inference_steps` | integer | 50 | 1-200 |
| `guidance_scale` | float | 7.5 | 0-16 |
| `num_samples` | integer | 4 | 1-4 |
| `seed` | integer | random | - |

#### Advanced Options

- `negative_prompt`: Default addresses blur, low resolution, artifacts
- `face_id_det_size`: 64-640 detection accuracy (default: 640)
- `base_1_5_model_repo` / `base_sdxl_model_repo`: Custom model URLs

#### Code Example

```javascript
const result = await fal.subscribe("fal-ai/ip-adapter-face-id", {
  input: {
    prompt: "professional business portrait, executive headshot, studio lighting",
    face_image_url: "https://example.com/person-face.jpg",
    model_type: "SDXL-v2-plus",
    width: 1024,
    height: 1024,
    num_inference_steps: 60,
    guidance_scale: 8.0,
    num_samples: 2
  }
});
```

#### Research Use Only

This model is designated for **research use only**.

### 9.3 FLUX Redux (Style Reference)

**Endpoint:** `fal-ai/flux-pro/v1/redux` (and variants)

Style transfer and image modification with reference conditioning.

#### Available Redux Models

1. **FLUX1.1 [pro] Redux** - Latest pro model with rapid transformations
2. **FLUX1.1 [pro] ultra Redux** - Ultra-quality variant
3. **FLUX.1 [dev] Redux** - Dev model for style transfers
4. **FLUX.1 [schnell] Redux** - Fast variant
5. **FLUX.1 Krea [dev] Redux** - Krea specialization

#### How Redux Works

FLUX-Redux aligns dense (per-token) image embeddings extracted by SigLIP image encoder with the model, enabling:
- Image variation
- Prompt-driven restyling
- Style reference conditioning

#### Code Example

```javascript
const result = await fal.subscribe("fal-ai/flux-pro/v1/redux", {
  input: {
    prompt: "in the style of a 1920s art deco poster",
    image_url: "https://example.com/photo.jpg"
  }
});
```

### 9.4 FLUX Kontext (Multi-Modal Conditioning)

**Endpoint:** `fal-ai/flux-pro/kontext`

Advanced in-context generation and editing with text + reference images.

#### Capabilities

- Localized edits
- Style transfer
- Character consistency across images
- Scene consistency
- Multi-image composition

#### How It Extends Redux

While FLUX-Redux provides basic multimodal conditioning for image variation and prompt-driven restyling, FLUX-Kontext unlocks:
- Targeted local edits
- Complex scene transformations
- Multi-reference composition

#### Code Example

```javascript
const result = await fal.subscribe("fal-ai/flux-pro/kontext", {
  input: {
    prompt: "same character in a futuristic cityscape",
    reference_images: [
      "https://example.com/character-ref-1.jpg",
      "https://example.com/character-ref-2.jpg",
      "https://example.com/style-ref.jpg"
    ]
  }
});
```

### 9.5 Style Transfer

**Endpoint:** `fal-ai/image-editing/style-transfer`

Dedicated style transfer endpoint.

#### Parameters

- `image_url`: Source image
- `artistic_style`: Style to apply (default: "Van Gogh's Starry Night")

#### Code Example

```javascript
const result = await fal.subscribe("fal-ai/image-editing/style-transfer", {
  input: {
    image_url: "https://example.com/portrait.jpg",
    artistic_style: "Monet's Water Lilies"
  }
});
```

---

## 10. Segmentation & Detection

AI-powered image segmentation and object detection.

### 10.1 Segment Anything Model 2 (SAM2)

**Endpoint (Image):** `fal-ai/sam2/image`
**Endpoint (Video):** `fal-ai/sam2/video`

Real-time segmentation for images and videos.

#### Capabilities

- Image segmentation
- Video segmentation with temporal consistency
- Promptable segmentation (points, boxes, text)

#### Code Example: Image Segmentation

```javascript
const result = await fal.subscribe("fal-ai/sam2/image", {
  input: {
    image_url: "https://example.com/scene.jpg",
    prompt_points: [
      { x: 500, y: 300 },  // Click point
      { x: 520, y: 310 }
    ]
  }
});
```

### 10.2 SAM 3

**Endpoint (Standard):** `fal-ai/sam-3/image/api`
**Endpoint (RLE Format):** `fal-ai/sam-3/image-rle`
**Endpoint (Embeddings):** `fal-ai/sam-3/image/embed`

Meta's unified foundation model for promptable segmentation.

#### Prompting Methods

- Text prompts
- Points
- Bounding boxes
- Masks

#### Capabilities

- Object detection
- Segmentation
- Object tracking
- Automated workflows

#### Code Example: Text-Prompted Segmentation

```javascript
const result = await fal.subscribe("fal-ai/sam-3/image", {
  input: {
    image_url: "https://example.com/photo.jpg",
    text_prompt: "all cars in the image"
  }
});
```

### 10.3 EVF-SAM2

**Endpoint:** `fal-ai/evf-sam/api`

Combined natural language understanding with segmentation.

#### Key Features

- Positive text prompts (regions to include)
- Negative text prompts (regions to exclude)
- Precise masking via intuitive descriptions

#### Code Example

```javascript
const result = await fal.subscribe("fal-ai/evf-sam", {
  input: {
    image_url: "https://example.com/crowd.jpg",
    positive_prompt: "people wearing red shirts",
    negative_prompt: "people wearing blue shirts"
  }
});
```

### 10.4 Florence-2 Large Segmentation

**Endpoint (Region to Segmentation):** `fal-ai/florence-2-large/region-to-segmentation`
**Endpoint (Referring Expression):** `fal-ai/florence-2-large/referring-expression-segmentation`

Advanced vision foundation model with prompt-based segmentation.

#### Region to Segmentation

Segment specific areas using bounding box coordinates:

```javascript
const result = await fal.subscribe("fal-ai/florence-2-large/region-to-segmentation", {
  input: {
    image_url: "https://example.com/scene.jpg",
    region: {
      x1: 100,
      y1: 150,
      x2: 400,
      y2: 500
    }
  }
});
```

#### Referring Expression Segmentation

Segment based on text descriptions:

```javascript
const result = await fal.subscribe("fal-ai/florence-2-large/referring-expression-segmentation", {
  input: {
    image_url: "https://example.com/kitchen.jpg",
    text_input: "the red coffee mug on the counter"
  }
});
```

#### Key Advantages

- Single prompt-driven solution
- Simultaneous segmentation, attribute extraction, and text generation
- One API call, multiple deliverables
- No additional training or model orchestration

---

## 11. Video Editing Capabilities

AI-powered video editing with temporal consistency.

### 11.1 Wan VACE 14B

**Endpoint (Outpainting):** `fal-ai/wan-vace-14b/outpainting`

Video-to-video model supporting multiple editing modes.

#### Supported Modes

- Depth-based editing
- Pose-guided editing
- Inpainting
- Outpainting
- Reframe

#### Core Parameters

| Parameter | Type | Description |
|-----------|------|-------------|
| `video_url` | string (required) | URL to source video file |
| `mask_url` | string (optional) | URL to source mask file |
| `guiding_mask_url` | string (optional) | Guiding mask for salient mask tracking |
| `temporal_downsample_factor` | integer | Frame sampling rate |

#### Video Inpainting

For inpainting mode:
- Requires `video_url` and `mask_url`
- Maintains temporal consistency across frames

#### Salient Mask Tracking

Provide `guiding_mask_url` to create masked video using salient object tracking (ignored if `mask_url` provided).

### 11.2 Video Object Erasing

High-fidelity object erasure with temporal consistency.

#### Key Features

- Remove unwanted objects, people, or visual elements
- Maintain aesthetic quality
- Preserve temporal coherence across frames

### 11.3 Kandinsky 5.0 Pro

Fast, high-quality video generation.

#### Capabilities

- Image-to-video
- Text-to-video
- Fast generation
- High quality output

---

## 12. Multi-Image & Batch Processing

Efficient processing of multiple images and batch workflows.

### 12.1 Z-Image Turbo Batch Processing

**Endpoint:** `fal-ai/z-image/turbo/image-to-image`

Generate up to 4 variations per request.

#### Use Cases

- A/B testing different prompt variations
- Exploring creative options
- No separate API calls needed

#### Acceleration Levels

| Level | Description |
|-------|-------------|
| `none` | Standard processing |
| `regular` | Moderate acceleration |
| `high` | Maximum speed (trade time for cost) |

#### Pricing

**$0.005 per megapixel**

### 12.2 FLUX.2 Multi-Reference Editing

**Endpoint (Pro):** `fal-ai/flux-2-pro/edit`
**Endpoint (Dev):** `fal-ai/flux-2/edit`

Combine up to 9 reference images in a single edit.

#### Multi-Image Composition

```javascript
const result = await fal.subscribe("fal-ai/flux-2-pro/edit", {
  input: {
    prompt: "combine the foreground from image 1 with the background from image 3 and the lighting from image 5",
    reference_images: [
      "https://example.com/img-1.jpg",
      "https://example.com/img-2.jpg",
      "https://example.com/img-3.jpg",
      "https://example.com/img-4.jpg",
      "https://example.com/img-5.jpg"
    ]
  }
});
```

#### Capabilities

- Up to **9 reference images** (9 MP total input)
- Reference specific images by index
- Natural language descriptions
- Fast transformation cycles (dev model)

#### Use Cases

- E-commerce asset workflows
- Automated image processing
- High-volume editing operations
- Production editing pipelines

#### Pricing

- **FLUX.2 [pro] editing:** $0.03/first MP, $0.015/extra MP
- **FLUX.2 [dev] editing:** $0.012/megapixel

### 12.3 Queue API for Batch Processing

Integration with FAL's queue API enables efficient batch processing.

#### Benefits

- Sub-second image generation (FLUX Schnell with 4 steps)
- Real-time processing capabilities
- Seamless scaling with workflow endpoints
- Smart batching improves throughput by 10x or more

#### Code Example: Queue Submission

```javascript
import { fal } from "@fal-ai/client";

// Submit to queue
const { request_id } = await fal.queue.submit("fal-ai/flux/schnell", {
  input: {
    prompt: "product photo on white background",
    num_images: 4,
    num_inference_steps: 4
  }
});

// Poll for results
const result = await fal.queue.result("fal-ai/flux/schnell", {
  requestId: request_id
});
```

#### Webhook Support

For long-running requests (training jobs, slow inference):

```javascript
const result = await fal.subscribe("fal-ai/flux-lora-fast-training", {
  input: { /* training config */ },
  webhookUrl: "https://your-app.com/webhook",
  onQueueUpdate: (update) => {
    console.log("Queue status:", update.status);
  }
});
```

---

## 13. Code Examples & Integration Patterns

Practical integration patterns and best practices.

### 13.1 Authentication Setup

#### Environment Variable (Recommended)

```bash
export FAL_KEY="your-api-key-here"
```

```javascript
import { fal } from "@fal-ai/client";

// Automatically uses FAL_KEY environment variable
const result = await fal.subscribe("fal-ai/flux/dev", {
  input: { prompt: "test image" }
});
```

#### Manual Configuration

```javascript
import { fal } from "@fal-ai/client";

fal.config({
  credentials: "your-api-key-here"
});
```

#### Server-Side Proxy (Client-Side Apps)

**Critical:** Never expose FAL_KEY on client side.

```javascript
// Server endpoint
app.post("/api/generate", async (req, res) => {
  const result = await fal.subscribe("fal-ai/flux/dev", {
    input: req.body
  });
  res.json(result);
});

// Client code
const response = await fetch("/api/generate", {
  method: "POST",
  headers: { "Content-Type": "application/json" },
  body: JSON.stringify({ prompt: "test image" })
});
```

### 13.2 File Upload Pattern

Upload files to FAL storage for use in requests:

```javascript
import { fal } from "@fal-ai/client";

// Upload file
const file = await fetch("https://example.com/my-image.jpg");
const blob = await file.blob();

const uploadedUrl = await fal.storage.upload(blob);

// Use in request
const result = await fal.subscribe("fal-ai/inpaint", {
  input: {
    prompt: "fill with flowers",
    image_url: uploadedUrl.url,
    mask_url: "https://example.com/mask.png"
  }
});
```

### 13.3 Error Handling Pattern

```javascript
import { fal } from "@fal-ai/client";

try {
  const result = await fal.subscribe("fal-ai/flux/dev", {
    input: {
      prompt: "test image",
      num_inference_steps: 28
    },
    logs: true,
    onQueueUpdate: (update) => {
      if (update.status === "IN_PROGRESS") {
        console.log("Processing:", update.logs);
      }
    }
  });

  console.log("Success:", result.data.images[0].url);

} catch (error) {
  if (error.status === 400) {
    console.error("Bad request:", error.message);
  } else if (error.status === 429) {
    console.error("Rate limited, retry after:", error.headers["retry-after"]);
  } else if (error.status === 500) {
    console.error("Server error:", error.message);
  } else {
    console.error("Unknown error:", error);
  }
}
```

### 13.4 Polling vs. Webhooks

#### Polling (Simple)

```javascript
const { request_id } = await fal.queue.submit("fal-ai/flux/dev", {
  input: { prompt: "test" }
});

// Poll every 500ms
const result = await fal.queue.result("fal-ai/flux/dev", {
  requestId: request_id
});
```

#### Webhooks (Recommended for Long Jobs)

```javascript
const result = await fal.subscribe("fal-ai/flux-lora-fast-training", {
  input: { /* training config */ },
  webhookUrl: "https://your-app.com/webhook"
});

// Your webhook endpoint receives:
// POST /webhook
// {
//   "status": "completed",
//   "request_id": "...",
//   "data": { ... }
// }
```

### 13.5 Synchronous Mode

For immediate results (blocks until completion):

```javascript
const result = await fal.subscribe("fal-ai/image-apps-v2/outpaint", {
  input: {
    image_url: "https://example.com/img.jpg",
    expand_bottom: 400,
    sync_mode: true  // Wait for completion
  }
});

// Result available immediately
console.log(result.data.images[0].url);
```

---

## 14. Parameter Reference Tables

Quick reference for common parameters across endpoints.

### 14.1 Common Generation Parameters

| Parameter | Type | Common Default | Range | Description |
|-----------|------|----------------|-------|-------------|
| `prompt` | string | required | - | Text description for generation |
| `negative_prompt` | string | "" | - | Elements to exclude |
| `num_inference_steps` | integer | 25-35 | 1-200 | Processing iterations |
| `guidance_scale` | float | 3.5-7.5 | 0-35 | CFG strength (prompt adherence) |
| `seed` | integer | random | - | Reproducibility seed |
| `num_images` | integer | 1 | 1-8 | Number of outputs |
| `enable_safety_checker` | boolean | true | - | NSFW content filtering |

### 14.2 Image Size Presets

Available across most endpoints:

| Preset | Aspect Ratio | Typical Resolution |
|--------|--------------|-------------------|
| `square_hd` | 1:1 | 1024x1024 |
| `square` | 1:1 | 512x512 or 768x768 |
| `portrait_4_3` | 3:4 | 768x1024 |
| `portrait_16_9` | 9:16 | 576x1024 |
| `landscape_4_3` | 4:3 | 1024x768 |
| `landscape_16_9` | 16:9 | 1024x576 |

### 14.3 ControlNet Conditioning Parameters

| Parameter | Type | Default | Range | Description |
|-----------|------|---------|-------|-------------|
| `controlnet_conditioning_scale` | float | 0.5-0.75 | 0-1 | Control strength |
| `control_start_percent` | float | 0 | 0-1 | When to start applying control |
| `control_end_percent` | float | 0.8-1.0 | 0-1 | When to stop applying control |

### 14.4 Inpainting/Outpainting Parameters

| Parameter | Type | Default | Range | Description |
|-----------|------|---------|-------|-------------|
| `strength` | float | 0.85 | 0-1 | Inpainting intensity (1.0 = complete remake) |
| `mask_expansion` | integer | 15 | 0-50 | Pixels to expand mask |
| `expand_left` | integer | 0 | 0-700 | Outpaint left (pixels) |
| `expand_right` | integer | 0 | 0-700 | Outpaint right (pixels) |
| `expand_top` | integer | 0 | 0-700 | Outpaint top (pixels) |
| `expand_bottom` | integer | 400 | 0-700 | Outpaint bottom (pixels) |
| `zoom_out_percentage` | integer | 20 | 0-90 | Zoom out amount |

### 14.5 Upscaling Parameters

| Parameter | Type | Default | Range | Description |
|-----------|------|---------|-------|-------------|
| `scale` | float | 2 | 1-8 | ESRGAN scale factor |
| `upscale_factor` | integer | 2 | 1-4 | Clarity upscale factor |
| `scale` | integer | 2 | 1-5 | Creative upscale factor |
| `scale_factor` | integer | 2 | 1-200 | Crystal upscale factor |
| `creativity` | float | 0-0.5 | 0-10 | Enhancement creativity |
| `resemblance` | float | 0.6 | 0-1 | Original image fidelity |

### 14.6 Output Format Options

Available formats across most endpoints:

- `PNG` (lossless, transparency support)
- `JPEG` / `JPG` (compressed, smaller file size)
- `WebP` (modern format, good compression)
- `GIF` (animation support, limited colors)

---

## 15. Best Practices & Optimization

Expert guidance for optimal results.

### 15.1 Inpainting Best Practices

#### Mask Creation

**Do:**
- Use clean, precise boundaries
- Expand mask slightly beyond target area (mask_expansion: 10-20)
- Test with grayscale masks for soft edges
- Ensure mask dimensions exactly match image

**Don't:**
- Use blurry or low-resolution masks
- Create masks smaller than intended removal area
- Forget to check mask color (white = inpaint, black = preserve)

#### Strength Selection

| Goal | Recommended Strength |
|------|---------------------|
| Minor color adjustments | 0.3-0.5 |
| Object replacement | 0.6-0.8 |
| Complete area regeneration | 0.85-1.0 |
| Texture matching | 0.4-0.6 |

#### Prompt Engineering

```javascript
// Poor prompt
prompt: "cat"

// Better prompt
prompt: "realistic tabby cat sitting, natural lighting, sharp focus, highly detailed fur texture"

// Best prompt with negative
prompt: "realistic tabby cat sitting on velvet cushion, natural window lighting, sharp focus, highly detailed fur texture, professional photography"
negative_prompt: "blurry, low quality, distorted, cartoon, illustration, oversaturated"
```

### 15.2 ControlNet Optimization

#### Conditioning Scale Guidelines

| Control Type | Recommended Scale | Use Case |
|--------------|------------------|----------|
| Canny (edges) | 0.7-0.9 | Precise geometric control |
| Depth | 0.5-0.7 | Spatial relationships |
| Pose | 0.8-1.0 | Character positioning |
| Scribble | 0.4-0.6 | Loose composition |

#### Temporal Control Strategy

**Early Structure Lock:**
```javascript
control_start_percent: 0.0   // Apply from start
control_end_percent: 0.4     // Stop at 40%
```
Use when: You want structural guidance but creative freedom in details.

**Late Refinement:**
```javascript
control_start_percent: 0.3   // Apply later
control_end_percent: 1.0     // Continue to end
```
Use when: You want creative generation with controlled final composition.

#### Multi-ControlNet Balancing

When combining multiple controls:

```javascript
controlnets: [
  {
    control_type: "pose",
    conditioning_scale: 0.5  // Reduced from typical 0.8
  },
  {
    control_type: "depth",
    conditioning_scale: 0.4  // Reduced from typical 0.6
  }
]
// Total influence: 0.9 (ideal range 0.8-1.0)
```

### 15.3 Upscaling Strategy Selection

#### Model Selection Matrix

| Source Content | Recommended Model | Scale Factor |
|----------------|------------------|--------------|
| General photos | RealESRGAN_x4plus | 2-4x |
| Anime/illustration | RealESRGAN_x4plus_anime_6B | 4x |
| Portraits | Crystal Upscaler | 2-10x |
| Creative enhancement | Creative Upscaler | 2-4x |
| High-fidelity | Clarity Upscaler | 2-4x |
| Extreme degradation | Crystal Upscaler | 10-200x |

#### Progressive Upscaling

For extreme scales (>4x), use progressive approach:

```javascript
// Step 1: 2x upscale
const step1 = await fal.subscribe("fal-ai/clarity-upscaler", {
  input: {
    image_url: "https://example.com/image-512px.jpg",
    upscale_factor: 2  // 512 → 1024
  }
});

// Step 2: 2x upscale again
const step2 = await fal.subscribe("fal-ai/clarity-upscaler", {
  input: {
    image_url: step1.data.image.url,
    upscale_factor: 2  // 1024 → 2048
  }
});

// Total: 4x upscale with better quality than single-step 4x
```

### 15.4 Batch Processing Optimization

#### Smart Batching

**Combine similar requests:**

```javascript
const batchPrompts = [
  "product on white background",
  "product on black background",
  "product on wooden surface"
];

const requests = batchPrompts.map(prompt =>
  fal.queue.submit("fal-ai/flux/schnell", {
    input: { prompt, num_inference_steps: 4 }
  })
);

const results = await Promise.all(
  requests.map(r => fal.queue.result("fal-ai/flux/schnell", { requestId: r.request_id }))
);
```

**Throughput improvement:** 10x or more vs. sequential

#### Queue Management

```javascript
// Priority system
const highPriorityJobs = [/* urgent requests */];
const lowPriorityJobs = [/* batch background processing */];

// Process high priority first
await Promise.all(highPriorityJobs.map(job => fal.subscribe(job)));

// Then process low priority
for (const job of lowPriorityJobs) {
  await fal.queue.submit(job);  // Don't await results
}
```

### 15.5 Cost Optimization

#### Model Selection

| Goal | Recommended Model | Cost |
|------|------------------|------|
| Prototyping | FLUX Schnell | Lowest |
| Production (balanced) | FLUX Dev | Medium |
| Maximum quality | FLUX Pro | Highest |
| Fast iterations | Z-Image Turbo | $0.0065/MP |

#### Resolution Strategy

**Start small, upscale later:**

```javascript
// Generate at 512x512
const base = await fal.subscribe("fal-ai/flux/dev", {
  input: {
    prompt: "product photo",
    image_size: { width: 512, height: 512 },
    num_inference_steps: 20  // Fewer steps for draft
  }
});

// Upscale best candidate
const upscaled = await fal.subscribe("fal-ai/clarity-upscaler", {
  input: {
    image_url: base.data.images[0].url,
    upscale_factor: 4  // 512 → 2048
  }
});

// Cost: Generation at 0.25MP + upscale at 4MP
// vs. Direct generation at 4MP + higher inference steps
```

### 15.6 Quality Maximization

#### Inference Steps

| Speed | Steps | Quality |
|-------|-------|---------|
| Fastest | 4-8 | Draft |
| Balanced | 20-30 | Good |
| High Quality | 40-60 | Excellent |
| Maximum | 80-150 | Overkill (diminishing returns) |

**Recommendation:** 25-35 steps for most use cases

#### Guidance Scale (CFG)

| Value | Effect |
|-------|--------|
| 1-3 | Very loose prompt following, creative |
| 4-7 | Balanced (recommended) |
| 8-12 | Strong prompt adherence |
| 13-20 | Extremely literal, may reduce quality |

**FLUX models:** Lower CFG (3-5) often produces better results
**SDXL models:** Higher CFG (7-9) typically needed

#### Prompt Quality Hierarchy

**Level 1 - Basic:**
```
"cat"
```

**Level 2 - Descriptive:**
```
"orange tabby cat sitting on a couch"
```

**Level 3 - Detailed:**
```
"orange tabby cat with green eyes sitting on a gray velvet couch, natural window lighting, sharp focus, detailed fur texture"
```

**Level 4 - Professional:**
```
"professional studio photograph of an orange tabby cat with bright green eyes sitting on a luxurious gray velvet couch, soft natural window lighting from the left, tack sharp focus, highly detailed fur texture showing individual hairs, shallow depth of field, shot with 85mm f/1.4 lens, photorealistic"
```

**Level 5 - Expert (with negative):**
```
prompt: "professional studio photograph of an orange tabby cat with bright green eyes sitting on a luxurious gray velvet couch, soft natural window lighting from the left, tack sharp focus, highly detailed fur texture showing individual hairs, shallow depth of field, shot with 85mm f/1.4 lens, photorealistic, award-winning pet photography"

negative_prompt: "blurry, out of focus, low quality, low resolution, oversaturated, cartoon, illustration, 3d render, painting, amateur photo, motion blur, noise, grain, distorted proportions, extra limbs, watermark, signature"
```

### 15.7 Error Prevention

#### Common Mistakes

**1. Dimension Mismatch (Inpainting/Fill)**
```javascript
// ❌ Wrong - dimensions don't match
image_url: "image-1024x768.jpg"
mask_url: "mask-512x512.png"  // ERROR

// ✅ Correct - exact match
image_url: "image-1024x768.jpg"
mask_url: "mask-1024x768.png"
```

**2. Invalid Parameter Ranges**
```javascript
// ❌ Wrong - strength out of range
strength: 1.5  // ERROR: max is 1.0

// ✅ Correct
strength: 0.85
```

**3. Missing Required Parameters**
```javascript
// ❌ Wrong - missing mask_url
await fal.subscribe("fal-ai/inpaint", {
  input: {
    prompt: "fill with flowers",
    image_url: "image.jpg"
    // mask_url missing - ERROR
  }
});

// ✅ Correct
await fal.subscribe("fal-ai/inpaint", {
  input: {
    prompt: "fill with flowers",
    image_url: "image.jpg",
    mask_url: "mask.png"  // Required
  }
});
```

**4. Client-Side API Key Exposure**
```javascript
// ❌ NEVER DO THIS in browser/mobile app
fal.config({ credentials: "fal_key_xxx..." });  // SECURITY RISK

// ✅ Use server-side proxy
const response = await fetch("/api/generate", {
  method: "POST",
  body: JSON.stringify({ prompt: "..." })
});
```

---

## Conclusion

This comprehensive documentation covers FAL.ai's complete suite of advanced features for image and video editing. From precise inpainting and outpainting to sophisticated ControlNet conditioning, multi-image composition, and specialized tools for upscaling, face enhancement, and object removal, FAL.ai provides professional-grade AI capabilities through simple API calls.

### Key Takeaways

1. **40+ Specialized Endpoints** - Each optimized for specific use cases
2. **Unified API Design** - Consistent patterns across all endpoints
3. **Flexible Control** - From simple text prompts to complex multi-modal conditioning
4. **Production-Ready** - Commercial licensing, high uptime, scalable infrastructure
5. **Cost-Effective** - Per-megapixel pricing, queue optimization, smart batching

### Migration Note

**Critical:** The `@fal-ai/serverless-client` package has been deprecated in favor of `@fal-ai/client`. Update all imports:

```javascript
// Old (deprecated)
import * as fal from "@fal-ai/serverless-client";

// New (current)
import { fal } from "@fal-ai/client";
```

### Additional Resources

For the most up-to-date API documentation and examples, visit:
- Main Platform: https://fal.ai
- Model Explorer: https://fal.ai/explore/models
- FLUX Tools: https://fal.ai/flux-tools
- Blog & Tutorials: https://blog.fal.ai

---

## Sources

- [Inpainting SDXL and SD API](https://fal.ai/models/fal-ai/inpaint/api)
- [Playground v2.5 Inpainting](https://fal.ai/models/fal-ai/playground-v25/inpainting/api)
- [Fooocus Inpainting](https://fal.ai/models/fal-ai/fooocus/inpaint/api)
- [FLUX.1 [dev] Inpainting with LoRAs](https://fal.ai/models/fal-ai/flux-lora/inpainting/api)
- [FLUX.1 [pro] Fill](https://fal.ai/models/fal-ai/flux-pro/v1/fill/api)
- [Image Outpaint API](https://fal.ai/models/fal-ai/image-apps-v2/outpaint/api)
- [Wan VACE 14B Outpainting](https://fal.ai/models/fal-ai/wan-vace-14b/outpainting/api)
- [ControlNet SDXL](https://fal.ai/models/fal-ai/fast-sdxl-controlnet-canny/api)
- [SD 1.5 Depth ControlNet](https://fal.ai/models/fal-ai/sd15-depth-controlnet/api)
- [FLUX.1 [dev] with Controlnets and Loras](https://fal.ai/models/fal-ai/flux-general/image-to-image/api)
- [Z-Image Turbo ControlNet](https://fal.ai/models/fal-ai/z-image/turbo/controlnet)
- [Z-Image ControlNet Complete Guide 2025](https://apatero.com/blog/z-image-turbo-controlnet-complete-guide-2025)
- [Img2img and inpainting with Flux AI model](https://stable-diffusion-art.com/flux-img2img-inpainting/)
- [Understanding Image Denoising Strength](https://wiki.shakker.ai/en/webui-img2img-denoising-strength-guide)
- [ESRGAN Upscaling API](https://fal.ai/models/fal-ai/esrgan/api)
- [Clarity Upscaler](https://fal.ai/models/fal-ai/clarity-upscaler/api)
- [Creative Upscaler](https://fal.ai/models/fal-ai/creative-upscaler/api)
- [Crystal Upscaler](https://fal.ai/models/clarityai/crystal-upscaler)
- [Topaz Video Upscale](https://fal.ai/models/fal-ai/topaz/upscale/video/api)
- [Introducing AuraSR](https://blog.fal.ai/introducing-aurasr-an-open-reproduction-of-the-gigagan-upscaler-2/)
- [Face Enhancement API](https://fal.ai/models/fal-ai/image-editing/face-enhancement/api)
- [Face Retoucher](https://fal.ai/models/fal-ai/retoucher/api)
- [BiRefNet Background Removal](https://fal.ai/models/fal-ai/birefnet/api)
- [Bria RMBG 2.0](https://fal.ai/models/fal-ai/bria/background/remove)
- [Video Background Removal](https://fal.ai/models/bria/video/background-removal/api)
- [Object Removal API](https://fal.ai/models/fal-ai/object-removal/api)
- [Bria Eraser](https://fal.ai/models/fal-ai/bria/eraser/api)
- [Finegrain Eraser](https://fal.ai/models/fal-ai/finegrain-eraser/mask)
- [Qwen Image Edit Plus](https://fal.ai/models/fal-ai/qwen-image-edit-plus-lora-gallery/remove-element/api)
- [FLUX.1 [dev] Differential Diffusion](https://fal.ai/models/fal-ai/flux-differential-diffusion/api)
- [IP-Adapter Face ID](https://fal.ai/models/fal-ai/ip-adapter-face-id/api)
- [FLUX.1 [pro] Redux](https://fal.ai/models/fal-ai/flux-pro/v1/redux)
- [FLUX.1 Kontext [pro]](https://fal.ai/models/fal-ai/flux-pro/kontext)
- [Style Transfer API](https://fal.ai/models/fal-ai/image-editing/style-transfer/api)
- [SAM 2 Image Segmentation](https://fal.ai/models/fal-ai/sam2/image/api)
- [SAM 3 API](https://fal.ai/models/fal-ai/sam-3/image/api)
- [EVF-SAM2 Segmentation](https://fal.ai/models/fal-ai/evf-sam/api)
- [Florence-2 Large Region to Segmentation](https://fal.ai/models/fal-ai/florence-2-large/region-to-segmentation/api)
- [FLUX.2 [pro] Edit](https://fal.ai/models/fal-ai/flux-2-pro/edit)
- [Z-Image Turbo Image-to-Image](https://fal.ai/models/fal-ai/z-image/turbo/image-to-image)
- [SDXL ControlNet Union Inpainting](https://fal.ai/models/fal-ai/sdxl-controlnet-union/inpainting/api)

---

**Document Version:** 1.0
**Word Count:** ~9,200 words
**Last Updated:** 2025-12-28
**Author:** Advanced Features Documentation Specialist
