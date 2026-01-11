---
source: 'FAL.ai official documentation (synthesized from https://fal.ai/docs)'
scraped: 2025-12-29
api_provider: FAL.ai
discovery_tier: 3
verified: false
title: "FAL.ai Fine-Tuning & Training API - Complete Reference"
---
 FAL.ai Fine-Tuning & Training API - Complete Reference

> **Agent 07 | Round 1 | FAL.ai Documentation Project**
> *Exhaustive documentation for LoRA training, fine-tuning workflows, and custom model creation on FAL.ai*

---

## Table of Contents

1. [Overview & Training Philosophy](#1-overview--training-philosophy)
2. [Training Endpoints Reference](#2-training-endpoints-reference)
3. [Training Data Requirements](#3-training-data-requirements)
4. [LoRA Configuration Options](#4-lora-configuration-options)
5. [Training Workflow](#5-training-workflow)
6. [Auto-Captioning Features](#6-auto-captioning-features)
7. [Using Trained LoRAs with Inference](#7-using-trained-loras-with-inference)
8. [Specialized Training Types](#8-specialized-training-types)
9. [Pricing Reference](#9-pricing-reference)
10. [Best Practices & Troubleshooting](#10-best-practices--troubleshooting)

---

## 1. Overview & Training Philosophy

### What is LoRA Training?

LoRA (Low-Rank Adaptation) is a parameter-efficient fine-tuning technique that trains small adapter weights on top of a frozen base model. Instead of updating all model parameters, LoRA learns low-rank decompositions that capture concept-specific knowledge while preserving the base model's capabilities.

### FAL.ai Training Philosophy

FAL.ai abstracts the complexity of distributed training infrastructure, providing:

- **Queue-based async execution** - Submit jobs and retrieve results when ready
- **Optimized defaults** - Sensible parameters for most use cases
- **Multiple trainer variants** - Specialized endpoints for different needs
- **Pay-per-step pricing** - Only pay for compute used

### Training Capabilities

| Capability | Support |
|------------|---------|
| Text-to-Image LoRAs | FLUX.1, FLUX.2, Z-Image, Qwen |
| Image-to-Image LoRAs | FLUX Kontext, FLUX.2 Edit |
| Video LoRAs | Hunyuan Video, WAN, LTX Video |
| Portrait Optimization | Dedicated portrait trainer |
| Style Transfer | is_style mode |
| Auto-captioning | Built-in for subject training |
| Segmentation Masks | Auto-generated for subjects |

---

## 2. Training Endpoints Reference

### 2.1 FLUX LoRA Fast Training

**Endpoint:** `fal-ai/flux-lora-fast-training`
**Base Model:** FLUX.1 [dev]
**Best For:** Quick subject/style training with auto-preprocessing

#### Input Parameters

| Parameter | Type | Default | Range | Description |
|-----------|------|---------|-------|-------------|
| `images_data_url` | string | **Required** | - | URL to ZIP archive with training images (min 4 images) |
| `trigger_word` | string | null | - | Custom word for captions; used when no captions provided |
| `steps` | integer | 1000 | 1-10,000 | Number of training iterations |
| `is_style` | boolean | false | - | Style training mode (disables captioning/segmentation) |
| `create_masks` | boolean | true | - | Generate segmentation masks for training loss weighting |
| `is_input_format_already_preprocessed` | boolean | false | - | Skip preprocessing if data already prepared |
| `data_archive_format` | string | null | - | Archive format; auto-inferred if unspecified |

#### Output Response

```json
{
  "diffusers_lora_file": {
    "url": "https://v3b.fal.media/files/.../trained-lora.safetensors",
    "content_type": "application/octet-stream",
    "file_name": "trained-lora.safetensors",
    "file_size": 4404019
  },
  "config_file": {
    "url": "https://v3b.fal.media/files/.../config.json",
    "content_type": "application/json",
    "file_name": "config.json",
    "file_size": 2048
  },
  "debug_preprocessed_output": {
    "url": "https://v3b.fal.media/files/.../preprocessed.zip"
  }
}
```

**Pricing:** $0.002/step ($2.00 per 1,000 steps)
**Machine Type:** GPU-H100/H200

---

### 2.2 FLUX.2 [dev] Trainer

**Endpoint:** `fal-ai/flux-2-trainer`
**Base Model:** FLUX.2 [dev]
**Best For:** Latest generation training with commercial use rights

#### Input Parameters (Text-to-Image)

| Parameter | Type | Default | Range | Description |
|-----------|------|---------|-------|-------------|
| `image_data_url` | string | **Required** | - | URL to ZIP archive (min 10 images recommended) |
| `steps` | integer | 1000 | 100-10,000 | Total training steps |
| `learning_rate` | float | 0.00005 | - | Learning rate for trainable parameters |
| `default_caption` | string | **Required** | - | Default caption when caption files missing |
| `output_lora_format` | enum | "fal" | fal, comfy | Output format for LoRA weights |

#### Image Editing Mode

For training image-to-image transformation LoRAs:
- Name pairs as `ROOT_start.EXT` and `ROOT_end.EXT`
- Include `ROOT.txt` with transformation instructions

**Pricing (Text-to-Image):** $0.008/step ($8.00 per 1,000 steps)

**Pricing (Image Editing):** `$0.009 × steps × reference_multiplier`
- 1 reference: multiplier 2.11 (~$18.99/1k steps)
- 2 references: multiplier 3.44
- 3 references: multiplier 5.09
- 4 references: multiplier 6.95

---

### 2.3 FLUX LoRA Portrait Trainer

**Endpoint:** `fal-ai/flux-lora-portrait-trainer`
**Base Model:** FLUX.1 (optimized for portraits)
**Best For:** Face-focused training with multi-resolution support

#### Input Parameters

| Parameter | Type | Default | Range | Description |
|-----------|------|---------|-------|-------------|
| `images_data_url` | string | **Required** | - | URL to ZIP archive (min 10 images) |
| `trigger_phrase` | string | null | - | Phrase for captions; replaces `[trigger]` placeholder |
| `learning_rate` | float | 0.00009 | 1e-6 to 1e-3 | Training learning rate |
| `steps` | integer | 2500 | 1-10,000 | Training duration |
| `multiresolution_training` | boolean | true | - | Multi-resolution training approach |
| `subject_crop` | boolean | true | - | Auto-crop subject from images |
| `create_masks` | boolean | false | - | Generate masks for subject isolation |
| `resume_from_checkpoint` | string | "" | - | URL to continue from checkpoint |

**Pricing:** $0.0024/step ($2.40 per 1,000 steps)
**Minimum Billing:** 1,000 steps
**Machine Type:** GPU-H100

---

### 2.4 Flux Kontext Trainer

**Endpoint:** `fal-ai/flux-kontext-trainer`
**Base Model:** FLUX.1 Kontext [dev]
**Best For:** Image editing/transformation LoRAs (before/after pairs)

#### Input Parameters

| Parameter | Type | Default | Range | Description |
|-----------|------|---------|-------|-------------|
| `image_data_url` | string | **Required** | - | URL to ZIP with paired images |
| `steps` | integer | 1000 | 2-10,000 | Training steps |
| `learning_rate` | float | 0.0001 | - | Training learning rate |
| `default_caption` | string | **Required** | - | Default caption when .txt files missing |
| `output_lora_format` | enum | "fal" | fal, comfy | Output format |

#### Dataset Format

```
training-data.zip
├── 01_start.jpg       # Input image
├── 01_end.jpg         # Desired output
├── 01.txt             # Edit instruction (e.g., "Furnish this room")
├── 02_start.jpg
├── 02_end.jpg
├── 02.txt
└── ...
```

**Pricing:** $0.0025/step ($2.50 per 1,000 steps)
**Minimum:** 500 steps ($1.25)

---

### 2.5 Z-Image Trainer

**Endpoint:** `fal-ai/z-image-trainer`
**Base Model:** Z-Image Turbo (6B parameter)
**Best For:** Z-Image model fine-tuning with training type modes

#### Input Parameters

| Parameter | Type | Default | Range | Description |
|-----------|------|---------|-------|-------------|
| `image_data_url` | string | **Required** | - | URL to ZIP archive (min 10 images) |
| `steps` | integer | 1000 | 100-10,000 | Training steps (increments of 100) |
| `learning_rate` | float | 0.0001 | - | Learning rate |
| `default_caption` | string | **Required** | - | Default caption when missing |
| `training_type` | enum | "balanced" | content, style, balanced | Training mode |

**Pricing:** $0.00226/step ($2.26 per 1,000 steps)
**Minimum:** 100 steps ($0.226)

---

### 2.6 Turbo Flux Trainer

**Endpoint:** `fal-ai/turbo-flux-trainer`
**Best For:** Fast subject/style training with face detection

#### Input Parameters

| Parameter | Type | Default | Range | Description |
|-----------|------|---------|-------|-------------|
| `images_data_url` | string | **Required** | - | URL to ZIP archive (min 10 images) |
| `trigger_phrase` | string | "ohwx" | - | Trigger phrase for model |
| `steps` | integer | 1000 | 1-10,000 | Training iterations |
| `learning_rate` | float | 0.00115 | 1e-7 to 0.01 | Optimization rate |
| `training_style` | enum | "subject" | subject, style | Training mode |
| `face_crop` | boolean | true | - | Auto-detect and crop face |

**Pricing:** $0.0024/step ($2.40 per 1,000 steps)

---

### 2.7 Flux Krea Trainer

**Endpoint:** `fal-ai/flux-krea-trainer`
**Base Model:** FLUX.1 Krea [dev]
**Best For:** Quick blazing-fast training

Same parameters as flux-lora-fast-training.

**Pricing:** $0.002/step ($2.00 per 1,000 steps)
**Machine Type:** GPU-H100

---

### 2.8 Video LoRA Trainers

#### Hunyuan Video LoRA Training

**Endpoint:** `fal-ai/hunyuan-video-lora-training`

| Parameter | Type | Default | Range | Description |
|-----------|------|---------|-------|-------------|
| `images_data_url` | string | **Required** | - | URL to ZIP archive (min 4 images) |
| `steps` | integer | **Required** | 1-5,000 | Training duration |
| `trigger_word` | string | "" | - | Custom activation keyword |
| `learning_rate` | float | 0.0001 | - | Optimization rate |
| `do_caption` | boolean | true | - | Auto-generate captions |

**Pricing:** ~$0.005/step ($5.00 per 1,000 steps)
**Machine Type:** GPU-A100

#### WAN-2.1 LoRA Trainer

**Endpoint:** `fal-ai/wan-trainer`

| Parameter | Type | Default | Range | Description |
|-----------|------|---------|-------|-------------|
| `training_data_url` | string | **Required** | - | URL to ZIP (min 10 images) |
| `number_of_steps` | integer | 400 | 1-20,000 | Training steps |
| `learning_rate` | float | 0.0002 | 1e-6 to 1 | Learning rate |
| `trigger_phrase` | string | "" | - | Trigger phrase |
| `auto_scale_input` | boolean | false | - | Auto-scale to 81 frames at 16fps |

**Pricing:** $0.005/step ($2.00 for 400 steps)

#### WAN 2.2 14B Image Trainer

**Endpoint:** `fal-ai/wan-22-image-trainer`

Advanced parameters include multi-stage training configuration, face detection, and synthetic captions.

**Pricing:** $0.0045/step ($4.50 per 1,000 steps)

#### LTX Video Trainer

**Endpoint:** `fal-ai/ltx-video-trainer`

| Parameter | Type | Default | Range | Description |
|-----------|------|---------|-------|-------------|
| `training_data_url` | string | **Required** | - | URL to ZIP with videos (min 10) |
| `rank` | enum | 128 | 8, 16, 32, 64, 128 | LoRA rank |
| `number_of_steps` | integer | 1000 | 100-20,000 | Training steps |
| `number_of_frames` | integer | 81 | 25-121 | Frames for training |
| `frame_rate` | integer | 25 | 8-60 | Target FPS |
| `resolution` | enum | "medium" | low, medium, high | Resolution |
| `aspect_ratio` | enum | "1:1" | 16:9, 1:1, 9:16 | Aspect ratio |
| `split_input_into_scenes` | boolean | true | - | Split long videos |

**Pricing:** $0.002/step ($2.00 per 1,000 steps)

#### Qwen Image Trainer

**Endpoint:** `fal-ai/qwen-image-trainer`

| Parameter | Type | Default | Range | Description |
|-----------|------|---------|-------|-------------|
| `image_data_url` | string | **Required** | - | URL to ZIP with images |
| `steps` | integer | 1000 | 1-8,000 | Training steps |
| `learning_rate` | float | 0.0005 | 1e-6 to 0.01 | Learning rate |
| `trigger_phrase` | string | "" | - | Default caption |

**Pricing:** $0.002/step ($2.00 per 1,000 steps)
**Minimum:** 250 steps (~$0.50)

---

## 3. Training Data Requirements

### 3.1 Image Formats

| Format | Supported | Notes |
|--------|-----------|-------|
| **JPG/JPEG** | Yes | Most common format |
| **PNG** | Yes | Recommended for quality |
| **WEBP** | Yes | Efficient compression |
| **GIF** | Yes | For inference; training support varies |

**Color Space:** RGB (3 channels), sRGB recommended
**Transparency:** Alpha channels not used in training - flattened during preprocessing

### 3.2 Resolution Requirements

| Requirement | Specification |
|-------------|---------------|
| **Minimum** | 1024 x 1024 pixels |
| **Recommended** | 1024 x 1024 or greater |
| **Optimal** | 4K source images (resized during training) |
| **Aspect Ratio** | 1:1 (square) required for training |

### 3.3 Image Count

| Training Type | Minimum | Recommended | Maximum |
|---------------|---------|-------------|---------|
| **Fast Training** | 4 | 15-25 | ~100 |
| **Subject LoRA** | 10 | 20-30 | 50 |
| **Style LoRA** | 9 | 15-30 | 50 |
| **Portrait Training** | 10 | 15-25 | 50 |
| **Kontext Pairs** | 10 | 15-20 | 50 |
| **FLUX.2** | 10 | 25-30 | 1,000 |

**Quality vs Quantity:** 10 excellent images consistently outperform 50 mediocre ones.

### 3.4 ZIP Archive Structure

#### Text-to-Image (Subject)
```
subject-training.zip
├── image_01.jpg
├── image_01.txt     # Caption: "A photo of sks person smiling"
├── image_02.jpg
├── image_02.txt
└── ...
```

#### Style Training
```
style-training.zip
├── painting_01.png
├── painting_01.txt  # "landscape in txcl painting style"
├── painting_02.png
├── painting_02.txt
└── ...
```

#### Kontext/Edit Training (Paired)
```
edit-training.zip
├── 01_start.jpg     # Before image
├── 01_end.jpg       # After image
├── 01.txt           # "Furnish this room"
├── 02_start.jpg
├── 02_end.jpg
├── 02.txt
└── ...
```

#### With Custom Masks
```
training.zip
├── photo.jpg
├── photo.txt
├── photo_mask.jpg   # White=subject, Black=background
└── ...
```

### 3.5 Data Upload Methods

#### Direct URL Reference
```python
input = {"images_data_url": "https://your-domain.com/training-data.zip"}
```

#### FAL Storage Upload
```python
import fal_client

url = fal_client.upload_file("./training-data.zip")
result = fal_client.subscribe("fal-ai/flux-lora-fast-training", {
    "images_data_url": url
})
```

```javascript
import { fal } from "@fal-ai/client";

const file = new File([zipBuffer], "training-data.zip");
const url = await fal.storage.upload(file);
```

#### Base64 Encoding
```python
input = {"images_data_url": "data:application/zip;base64,UEsDBBQAAAA..."}
```
**Warning:** Large files impact request performance.

---

## 4. LoRA Configuration Options

### 4.1 Rank (Network Dimension)

| Rank | File Size | Quality | Use Case |
|------|-----------|---------|----------|
| 8 | Small | Acceptable | Quick experiments, simple styles |
| 16 | Medium | Good | Standard subjects |
| 32 | Large | Excellent | Complex concepts (recommended default) |
| 64 | Very Large | Excellent | Complex characters, intricate details |
| 128 | Maximum | Marginal gains | Rarely needed |

**FAL.ai Handling:** Rank is automatically optimized on most endpoints. Only `flux-pro-trainer` exposes rank selection (16 or 32).

### 4.2 Learning Rate

| Trainer | Default | Range |
|---------|---------|-------|
| FLUX.2 Trainer | 0.00005 (5e-5) | Conservative |
| Portrait Trainer | 0.00009 (9e-5) | Face-optimized |
| Turbo Flux Trainer | 0.00115 (1.15e-3) | Aggressive |
| Kontext Trainer | 0.0001 (1e-4) | Standard |

**Recommendations by Type:**
- Subject LoRAs: 0.0001-0.0003 (1e-4 to 3e-4)
- Style LoRAs: 0.0003-0.0008 (3e-4 to 8e-4)
- Photorealistic Characters: 1e-4
- Anime/Cartoon: 3e-4

### 4.3 Training Steps

| Use Case | Minimum | Recommended | Maximum |
|----------|---------|-------------|---------|
| Simple style | 500 | 1,000 | 2,000 |
| Person/character | 800 | 1,200 | 5,000 |
| Complex concept | 1,000 | 1,500 | 8,000 |
| Quick prototype | 500 | 500 | 800 |

**Overfitting Indicators:**
- Saturated images with artifacts
- Objects look "cut out"
- Cannot follow creative prompts
- Reproduces exact training poses

### 4.4 Training Modes

#### Subject Mode (Default)
```json
{"is_style": false, "create_masks": true}
```
- Auto-captioning enabled
- Segmentation masks generated
- Focuses on specific identity

#### Style Mode
```json
{"is_style": true}
```
- Auto-captioning disabled
- Segmentation masks disabled
- Focuses on artistic patterns

---

## 5. Training Workflow

### 5.1 Queue Submission

**JavaScript SDK:**
```javascript
import { fal } from "@fal-ai/client";

const { request_id } = await fal.queue.submit("fal-ai/flux-lora-fast-training", {
  input: {
    images_data_url: "https://example.com/training-images.zip",
    trigger_word: "mysubject",
    steps: 1000,
    create_masks: true,
    is_style: false
  },
  webhookUrl: "https://your-server.com/webhook/fal"
});
```

**Python SDK:**
```python
import fal_client

response = await fal_client.submit_async(
    "fal-ai/flux-lora-fast-training",
    arguments={
        "images_data_url": "https://example.com/training-images.zip",
        "trigger_word": "mysubject",
        "steps": 1000,
        "create_masks": True
    }
)
request_id = response.request_id
```

### 5.2 Status Tracking

| State | HTTP Code | Description |
|-------|-----------|-------------|
| `IN_QUEUE` | 202 | Waiting to process |
| `IN_PROGRESS` | 202 | Currently executing |
| `COMPLETED` | 200 | Finished processing |

**Using Subscribe (Recommended):**
```javascript
const result = await fal.subscribe("fal-ai/flux-lora-fast-training", {
  input: {
    images_data_url: "https://example.com/images.zip",
    steps: 1000
  },
  logs: true,
  onQueueUpdate: (update) => {
    if (update.status === "IN_QUEUE") {
      console.log(`Queue position: ${update.position}`);
    }
    if (update.status === "IN_PROGRESS") {
      update.logs.map((log) => log.message).forEach(console.log);
    }
  }
});
```

### 5.3 Webhook Configuration

Add `fal_webhook` query parameter:
```bash
curl -X POST "https://queue.fal.run/fal-ai/flux-lora-fast-training?fal_webhook=https://your-server.com/webhook" \
  -H "Authorization: Key $FAL_KEY" \
  -H "Content-Type: application/json" \
  -d '{"images_data_url": "..."}'
```

**Webhook Payload (Success):**
```json
{
  "request_id": "80e732af-660e-45cd-bd63-580e4f2a94cc",
  "status": "OK",
  "payload": {
    "diffusers_lora_file": {...},
    "config_file": {...}
  }
}
```

### 5.4 Cancellation

```javascript
await fal.queue.cancel("fal-ai/flux-lora-fast-training", {
  requestId: request_id
});
```

**Note:** Requests can only be cancelled while in `IN_QUEUE` state.

---

## 6. Auto-Captioning Features

### 6.1 Built-in Auto-Captioning

| Endpoint | Auto-Caption | Model Used |
|----------|--------------|------------|
| flux-lora-fast-training | Yes (default) | Internal |
| flux-lora-portrait-trainer | No | - |
| flux-2-trainer | No | - |
| flux-krea-trainer | Yes (default) | Internal |
| turbo-flux-trainer | No | - |

**Enable:** `is_style: false` (default)
**Disable:** `is_style: true`

### 6.2 Standalone Captioning Endpoints

#### Florence-2 (Free)

| Endpoint | Detail Level |
|----------|--------------|
| `fal-ai/florence-2-large/caption` | Brief |
| `fal-ai/florence-2-large/detailed-caption` | Extended |
| `fal-ai/florence-2-large/more-detailed-caption` | Maximum |

```python
result = fal_client.subscribe(
    "fal-ai/florence-2-large/detailed-caption",
    arguments={"image_url": "https://example.com/image.jpg"}
)
print(result["results"])
```

**Pricing:** Free ($0 per compute second)

#### MoonDream Next

```python
result = fal_client.subscribe(
    "fal-ai/moondream-next",
    arguments={
        "image_url": "https://example.com/image.jpg",
        "task_type": "caption",
        "max_tokens": 64
    }
)
```

**Pricing:** $0.0011 per second

#### Any VLM

```python
result = fal_client.subscribe(
    "fal-ai/any-llm/vision",
    arguments={
        "prompt": "Caption this image for a text-to-image model.",
        "model": "google/gemini-2.5-flash",
        "image_urls": ["https://example.com/image.jpg"]
    }
)
```

**Pricing:** $0.01 per request

### 6.3 Caption Best Practices

**Trigger Word Format:**
```
{unique_token} {class_description}
```
Examples: `txcl painting`, `sks person`, `ohwx portrait`

**Caption Content Guidelines:**

| Type | Caption Style |
|------|---------------|
| Subject | "A photo of sks person wearing blue shirt, outdoor setting" |
| Style | "landscape painting in txcl watercolor style, soft colors" |
| Product | "ceramic coffee mug, product photography, white background" |
| Edit | "Furnish this room with modern furniture" |

---

## 7. Using Trained LoRAs with Inference

### 7.1 Compatible Endpoints

| Endpoint | Model ID | Use Case |
|----------|----------|----------|
| FLUX.1 with LoRAs | `fal-ai/flux-lora` | Text-to-image |
| FLUX.2 LoRA | `fal-ai/flux-2/lora` | Latest FLUX |
| FLUX General | `fal-ai/flux-general` | LoRA + ControlNet |
| FLUX Kontext LoRA | `fal-ai/flux-kontext-lora` | Image editing |
| FLUX LoRA Inpainting | `fal-ai/flux-lora/inpainting` | Inpainting |

### 7.2 LoRAs Array Structure

```javascript
{
  loras: [
    {
      path: "https://v3b.fal.media/files/.../trained-lora.safetensors",
      scale: 1.0  // Range: 0-4, default 1.0
    }
  ]
}
```

### 7.3 Scale Parameter

| Scale Value | Effect |
|-------------|--------|
| 0.0-0.3 | Subtle influence |
| 0.4-0.7 | Moderate influence |
| 0.8-1.2 | Strong influence (typical) |
| 1.3-2.0 | Very strong |
| 2.0-4.0 | Extreme, risk of artifacts |

### 7.4 Multiple LoRAs

```javascript
loras: [
  { path: "https://example.com/style-lora.safetensors", scale: 0.7 },
  { path: "https://example.com/character-lora.safetensors", scale: 0.8 },
  { path: "https://example.com/product-lora.safetensors", scale: 0.6 }
]
```

**Limits:** FLUX.2 LoRA supports maximum 3 LoRAs per request.

### 7.5 Complete Example

```python
import fal_client

result = fal_client.subscribe(
    "fal-ai/flux-lora",
    arguments={
        "prompt": "A portrait of sks person in a garden, golden hour lighting",
        "loras": [
            {
                "path": "https://v3b.fal.media/files/.../my-portrait-lora.safetensors",
                "scale": 1.0
            }
        ],
        "image_size": "portrait_4_3",
        "num_inference_steps": 28,
        "guidance_scale": 3.5,
        "seed": 42
    }
)

print(f"Generated image: {result['images'][0]['url']}")
```

---

## 8. Specialized Training Types

### 8.1 Portrait/Face Training

**Recommended Endpoint:** `flux-lora-portrait-trainer`

**Key Features:**
- Multi-resolution training
- Face segmentation masks
- Bright highlights in eyes
- Fine detail preservation

**Settings:**
| Setting | Value |
|---------|-------|
| Images | 10-20 |
| Steps | 2,500 (default) |
| Learning Rate | 0.00009 |
| multiresolution_training | true |
| subject_crop | true |

**Dataset Requirements:**
- Front, 3/4, profile views
- Varied expressions
- Different lighting conditions
- Mix of framing (headshot, half-body, full-body)

### 8.2 Style Transfer

**Key Parameter:** `is_style: true`

**Settings:**
| Setting | Value |
|---------|-------|
| Images | 9-30 |
| Steps | 1,000-2,000 |
| is_style | true |
| Trigger | "[token] [class]" (e.g., "txcl painting") |

**Dataset Quality:**
- High resolution (1024x1024+)
- No compression artifacts
- Diverse subjects in same style

### 8.3 Character Consistency

**Core Principle:** Keep consistency in what you want to train, diversity in everything else.

**Dataset Composition:**
| Angle Type | Count |
|------------|-------|
| Front-facing | 3-5 |
| 3/4 view | 2-4 |
| Profile | 2-3 |
| Back (optional) | 1-2 |

**Include varied expressions and poses for flexibility.**

### 8.4 Product Photography

**Dataset Requirements:**
- 15-30 images
- Consistent lighting
- Multiple angles
- Background options: consistent OR removed

**Captioning Template:**
```
[product name], [material], [color], [angle], [background], [lighting], product photography
```

### 8.5 Logo/Brand Training

**Approach:**
1. Start with clean logo at 512x512+
2. Create variations (backgrounds, mockups, sizes)
3. Replace logo description with trigger word in captions

**Settings:**
| Setting | Value |
|---------|-------|
| Images | 15-30 with variations |
| Steps | 800-1,500 |
| Trigger | "mycompanylogo" |

### 8.6 Kontext Training (Edit LoRAs)

**Use Cases:**
- Brand-consistent editing pipelines
- Custom style transfers
- Product-specific modifications
- Industry-specific transformations

**Dataset Format:** Paired before/after images with edit instructions.

---

## 9. Pricing Reference

### 9.1 Per-Endpoint Pricing

| Endpoint | Cost/Step | Cost/1k Steps | Min Steps |
|----------|-----------|---------------|-----------|
| flux-lora-fast-training | $0.002 | $2.00 | 1 |
| flux-2-trainer (T2I) | $0.008 | $8.00 | 100 |
| flux-2-trainer (Edit) | $0.009×mult | ~$18.99 | 100 |
| flux-lora-portrait-trainer | $0.0024 | $2.40 | 1,000 |
| turbo-flux-trainer | $0.0024 | $2.40 | 1 |
| flux-kontext-trainer | $0.0025 | $2.50 | 500 |
| flux-krea-trainer | $0.002 | $2.00 | 1 |
| z-image-trainer | $0.00226 | $2.26 | 100 |
| wan-22-image-trainer | $0.0045 | $4.50 | 100 |
| qwen-image-trainer | $0.002 | $2.00 | 250 |
| hunyuan-video-lora-training | $0.005 | $5.00 | 1 |
| wan-trainer | $0.005 | $2.00 (400) | 1 |
| ltx-video-trainer | $0.002 | $2.00 | 100 |

### 9.2 Cost Calculation

```
Total Cost = Steps × Cost per Step
```

**Examples:**
- flux-lora-fast-training @ 1,500 steps: $3.00
- flux-2-trainer @ 2,000 steps: $16.00
- portrait-trainer @ 2,500 steps: $6.00

### 9.3 Storage Costs

| Type | Retention | Cost |
|------|-----------|------|
| Generated files | 7 days guaranteed | Free |
| LoRA weights | 7 days guaranteed | Free |
| After 7 days | May be deleted | N/A |

**Recommendation:** Download immediately after training.

### 9.4 Budget Planning

| Monthly Volume | Flux Fast | Flux 2 |
|----------------|-----------|--------|
| 5 LoRAs | $10 | $40 |
| 10 LoRAs | $20 | $80 |
| 25 LoRAs | $50 | $200 |
| 50 LoRAs | $100 | $400 |

---

## 10. Best Practices & Troubleshooting

### 10.1 Image Count by Type

| Type | Minimum | Recommended |
|------|---------|-------------|
| Portrait | 10 | 15-25 |
| Style | 9 | 15-30 |
| Character | 15 | 25-30 |
| Product | 5 | 15-30 |
| Logo | 10 | 15-30 |
| Kontext | 10 pairs | 15-20 pairs |

### 10.2 Step Count by Type

| Type | Minimum | Starting | Maximum |
|------|---------|----------|---------|
| Portrait | 1,000 | 2,500 | 5,000 |
| Style | 500 | 1,000 | 2,000 |
| Character | 800 | 1,200 | 8,000 |
| Product | 500 | 1,000 | 2,000 |

### 10.3 Common Issues

| Issue | Cause | Solution |
|-------|-------|----------|
| Doesn't look like subject | Underfitting | Increase steps; use higher-res images |
| Identical outputs | Overfitting | Add diverse images; reduce steps |
| Poor prompt following | Overtrained | Reduce steps; use varied captions |
| Artifacts | Bad training data | Replace problematic images |
| Inconsistent style | Caption issues | Use consistent trigger words |

### 10.4 Trigger Word Best Practices

**Use unique/rare tokens:**
- `txcl`, `sks`, `ohwx`, `frung`
- Avoid common English words

**Format:** `[unique_token] [class_descriptor]`
- `txcl painting` (style)
- `sks person` (character)
- `ohwx portrait` (face)

### 10.5 Universal Best Practices

1. **Quality over quantity** - 10 excellent images > 50 mediocre
2. **Resolution matters** - Minimum 1024x1024
3. **Test multiple checkpoints** - Train at 500, 1,000, 2,000 steps
4. **Use unique trigger words** - Prevent conflicts with other LoRAs
5. **Monitor for overfitting** - If prompts stop working, reduce steps
6. **Caption thoughtfully** - Describe what should vary, not what LoRA learns
7. **Maintain consistency** - Same style/lighting within dataset

---

## Related Documentation

- [[agent-01-core-api|Core API Reference]] - Authentication, endpoints
- [[agent-02-javascript-sdk|JavaScript SDK]] - Client library usage
- [[agent-03-python-sdk|Python SDK]] - Python integration
- [[agent-04-image-models|Image Models]] - Inference endpoints
- [[agent-06-streaming-queues|Streaming & Queues]] - Queue workflow
- [[agent-08-billing-usage|Billing & Usage]] - Pricing details
- [[agent-09-advanced-features|Advanced Features]] - ControlNet, inpainting

---

## Sources

- [FLUX LoRA Fast Training](https://fal.ai/models/fal-ai/flux-lora-fast-training)
- [FLUX.2 Trainer](https://fal.ai/models/fal-ai/flux-2-trainer)
- [FLUX Portrait Trainer](https://fal.ai/models/fal-ai/flux-lora-portrait-trainer)
- [Flux Kontext Trainer](https://fal.ai/models/fal-ai/flux-kontext-trainer)
- [Z-Image Trainer](https://fal.ai/models/fal-ai/z-image-trainer)
- [Training FLUX Style LoRA](https://blog.fal.ai/training-flux-style-lora-on-fal-ai/)
- [Training FLUX.2 LoRAs](https://blog.fal.ai/training-flux-2-loras/)
- [FLUX Portrait Trainer Guide](https://blog.fal.ai/introducing-the-flux-portrait-trainer/)
- [Announcing FLUX.1 Kontext Training](https://blog.fal.ai/announcing-flux-1-kontext-dev-inference-training/)
- [Flux 2 Developer Guide](https://fal.ai/learn/devs/flux-2-developer-guide)
- [Florence-2 Captioning](https://fal.ai/models/fal-ai/florence-2-large/caption)
- [FAL.ai Pricing](https://fal.ai/pricing)
- [Queue API Documentation](https://docs.fal.ai/model-apis/model-endpoints/queue)
- [Webhooks Documentation](https://docs.fal.ai/model-apis/model-endpoints/webhooks)

---

*Document Version: 1.0.0*
*Generated: 2025-12-29*
*Word Count: ~7,500 words*
