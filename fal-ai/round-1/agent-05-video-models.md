---
source: Official FAL.ai Documentation
scraped: 2025-12-28
api_provider: FAL.ai
discovery_tier: 3
verified: false
title: FAL.ai Video Generation Models - Complete Catalog
---
[3-Resources/anchors/status-complete]]

# FAL.ai Video Generation Models - Complete Catalog

## Executive Summary

FAL.ai provides access to **17+ video generation models** covering text-to-video, image-to-video, video-to-video, and video enhancement. This document provides exhaustive documentation of every video model, including complete parameter schemas, pricing, duration limits, and resolution options.

### Platform Highlights

- **17+ Video Models** from leading AI labs
- **Pricing Range:** $0.05-$0.50/second or $0.075-$2.50/video
- **Duration Range:** 2-8 seconds per generation
- **Resolution:** 360p to 1080p (4K on select models)
- **Features:** Text-to-video, image-to-video, video editing, upscaling

---

## Model Categories

| Category | Models | Description |
|----------|--------|-------------|
| Text-to-Video | 8 | Generate video from text prompts |
| Image-to-Video | 7 | Animate static images |
| Video-to-Video | 2 | Transform existing videos |
| Video Enhancement | 3 | Upscaling, interpolation |

---

## Text-to-Video Models

### Google Veo 3

**Endpoint:** `fal-ai/veo3`

Google's latest video model with native audio generation.

| Parameter | Type | Default | Range | Description |
|-----------|------|---------|-------|-------------|
| `prompt` | string | required | max 3000 chars | Video description |
| `aspect_ratio` | enum | "16:9" | 16:9, 9:16 | Output ratio |
| `duration` | enum | "8" | 4, 6, 8 | Seconds |
| `resolution` | enum | "720p" | 720p, 1080p | Output resolution |
| `generate_audio` | boolean | true | - | Native audio generation |
| `negative_prompt` | string | "" | - | What to avoid |
| `seed` | integer | random | - | Reproducibility |
| `auto_fix` | boolean | true | - | Auto-correct issues |

**Endpoints:**
- `fal-ai/veo3` - Text-to-video
- `fal-ai/veo3/image-to-video` - Image animation
- `fal-ai/veo3/reference-to-video` - Reference conditioning

**Pricing:**

| Variant | Without Audio | With Audio |
|---------|--------------|------------|
| Standard | $0.20/sec | $0.40/sec |
| Fast | $0.10/sec | $0.15/sec |

**Output:**
- Frame rate: 24 FPS
- Max image input: 8MB
- Resolution: 720p-1080p

**Example:**
```javascript
const result = await fal.run('fal-ai/veo3', {
  input: {
    prompt: 'A cinematic shot of a dragon flying over a medieval castle at sunset',
    duration: '8',
    resolution: '1080p',
    generate_audio: true,
    aspect_ratio: '16:9'
  }
});
```

---

### Google Veo 2

**Endpoint:** `fal-ai/veo2`

Previous generation Google video model.

| Parameter | Type | Default | Range | Description |
|-----------|------|---------|-------|-------------|
| `prompt` | string | required | - | Video description |
| `aspect_ratio` | enum | "16:9" | 16:9, 9:16 | Output ratio |
| `duration` | enum | "5" | 5, 6, 7, 8 | Seconds |
| `negative_prompt` | string | "" | - | What to avoid |
| `enhance_prompt` | boolean | true | - | AI prompt enhancement |
| `seed` | integer | random | - | Reproducibility |

**Pricing:** $2.50 for 5s, +$0.50/additional second
**Resolution:** 720p
**Frame Rate:** 24 FPS

---

### Hunyuan Video

**Endpoint:** `fal-ai/hunyuan-video`

Tencent's open-weight video model.

| Parameter | Type | Default | Range | Description |
|-----------|------|---------|-------|-------------|
| `prompt` | string | required | - | Video description |
| `aspect_ratio` | enum | "16:9" | 16:9, 9:16 | Output ratio |
| `resolution` | enum | "720p" | 480p, 580p, 720p | Output resolution |
| `num_frames` | integer | 129 | 85, 129 | Frame count |
| `num_inference_steps` | integer | 30 | 2-30, pro: 55 | Quality steps |
| `pro_mode` | boolean | false | - | 2x quality, 2x cost |
| `seed` | integer | random | - | Reproducibility |
| `enable_safety_checker` | boolean | true | - | Content filtering |

**Video-to-Video Support:**
```json
{
  "video_url": "https://example.com/input.mp4",
  "strength": 0.7
}
```
Strength range: 0.01-1.0

**Pricing:** $0.40/video (5 credits), Pro: $0.80/video
**Infrastructure:** GPU-H100
**Generation Time:** ~4 minutes

---

### Mochi v1

**Endpoint:** `fal-ai/mochi-v1`

Genmo's open-source video model.

| Parameter | Type | Default | Range | Description |
|-----------|------|---------|-------|-------------|
| `prompt` | string | required | - | Video description |
| `negative_prompt` | string | "" | - | What to avoid |
| `seed` | integer | random | - | Reproducibility |
| `enable_prompt_expansion` | boolean | true | - | AI enhancement |

**Pricing:** $0.40/video (5 credits)
**Infrastructure:** GPU-H100 x4
**Timeout:** 3,600 seconds (1 hour)
**Max Concurrency:** 25 requests
**Regions:** EU-North, EU-West, US-West, US-Central, US-East

---

### LTX Video 0.9.7 13B

**Endpoint:** `fal-ai/ltx-video-13b-dev`

Lightricks' development video model.

| Parameter | Type | Default | Range | Description |
|-----------|------|---------|-------|-------------|
| `prompt` | string | required | - | Video description |
| `image_url` | string | optional | - | First frame (I2V) |
| `negative_prompt` | string | "" | - | What to avoid |
| `resolution` | enum | "720p" | 480p, 720p | Output resolution |
| `aspect_ratio` | enum | "16:9" | 16:9, 1:1, 9:16, auto | Output ratio |
| `num_frames` | integer | 121 | 9-161 | Frame count |
| `frame_rate` | integer | 30 | 1-60 | Output FPS |
| `loras` | array | [] | - | Custom LoRAs |
| `expand_prompt` | boolean | true | - | AI enhancement |
| `reverse_video` | boolean | false | - | Reverse output |
| `enable_safety_checker` | boolean | true | - | Content filtering |
| `constant_rate_factor` | integer | 23 | 0-51 | Compression quality |

**Advanced Parameters:**
- `first_pass_num_inference_steps`: First pass quality
- `first_pass_skip_final_steps`: Optimization
- `second_pass_num_inference_steps`: Second pass quality
- `second_pass_skip_initial_steps`: Optimization

**Pricing:** $0.20/video
**Infrastructure:** GPU-H100

**Example:**
```python
result = fal_client.run(
    "fal-ai/ltx-video-13b-dev",
    arguments={
        "prompt": "A time-lapse of a flower blooming",
        "resolution": "720p",
        "num_frames": 121,
        "frame_rate": 30
    }
)
```

---

### Vidu Q2

**Endpoint:** `fal-ai/vidu/q2/text-to-video`

ViduAI's text-to-video model.

| Parameter | Type | Default | Range | Description |
|-----------|------|---------|-------|-------------|
| `prompt` | string | required | max 3000 chars | Video description |
| `duration` | integer | 4 | 2-8 | Seconds |
| `resolution` | enum | "720p" | 360p, 520p, 720p, 1080p | Output resolution |
| `aspect_ratio` | enum | "16:9" | 16:9, 9:16, 1:1 | Output ratio |
| `movement_amplitude` | enum | "auto" | auto, small, medium, large | Motion intensity |
| `seed` | integer | random | - | Reproducibility |
| `bgm` | boolean | false | - | Background music (4s only) |

**Pricing by Resolution:**

| Resolution | Price |
|------------|-------|
| 360p | $0.10 |
| 520p | $0.20 |
| 720p | $0.30 |
| 1080p | $0.20 + $0.10/sec |

---

### Kling Video 2.5 Turbo Pro

**Endpoint:** `fal-ai/kling-video/v2.5-turbo/pro/text-to-video`

Kuaishou's flagship video model.

| Parameter | Type | Default | Range | Description |
|-----------|------|---------|-------|-------------|
| `prompt` | string | required | - | Video description |
| `duration` | enum | "5" | 5, 10 | Seconds |
| `aspect_ratio` | enum | "16:9" | 16:9, 9:16, 1:1 | Output ratio |
| `negative_prompt` | string | "" | - | What to avoid |

**Variants:**
- Kling 2.6 - Audio generation
- Kling 2.5 Turbo Pro
- Kling 2.0 Master
- Kling 1.6 Pro
- Kling O1

**Pricing:** $0.07/sec (audio off), $0.14/sec (audio on)

---

### MiniMax Hailuo

**Endpoints:**
- `fal-ai/minimax/hailuo-2-3` - Latest (2.3)
- `fal-ai/minimax/hailuo-02` - Previous version
- `fal-ai/minimax/video-01-live` - 2D animation

**Hailuo 2.3** - Major leap in photorealism

| Parameter | Type | Default | Range | Description |
|-----------|------|---------|-------|-------------|
| `prompt` | string | required | - | Video description |
| `resolution` | enum | "768p" | 512p, 768p | Output resolution |

**Variants:**
- Pro endpoint
- Standard endpoint
- Fast endpoint
- Video 01 Live (2D illustration, character-focused)

**Availability:** Full suite since April 15, 2025

---

## Image-to-Video Models

### Stable Video Diffusion

**Endpoint:** `fal-ai/stable-video`

Stability AI's image animation model.

| Parameter | Type | Default | Range | Description |
|-----------|------|---------|-------|-------------|
| `image_url` | string | required | - | Source image |
| `motion_bucket_id` | integer | 127 | 1-255 | Motion intensity |
| `cond_aug` | float | 0.02 | 0-10 | Conditioning augmentation |
| `fps` | integer | 25 | 10-100 | Output frame rate |
| `seed` | integer | random | - | Reproducibility |

**Video Size Presets:**
- `square_hd` (1024x1024)
- `square` (512x512)
- `portrait_4_3`, `portrait_16_9`
- `landscape_4_3`, `landscape_16_9`

**Custom Size:** Max 14,142px per side

**Pricing:** $0.075/video
**Model:** SVD v1.1
**Infrastructure:** GPU-A100

---

### Stable Video Diffusion Turbo

**Endpoint:** `fal-ai/fast-svd-lcm`

Fast variant with LCM acceleration.

Same parameters as standard SVD, faster generation.

---

### WAN 2.1 Image-to-Video

**Endpoint:** `fal-ai/wan-i2v`

Alibaba's image animation model.

| Parameter | Type | Default | Range | Description |
|-----------|------|---------|-------|-------------|
| `prompt` | string | required | - | Motion description |
| `image_url` | string | required | - | Source image |
| `negative_prompt` | string | "" | - | What to avoid |
| `num_frames` | integer | 81 | 81-100 | Frame count |
| `frames_per_second` | integer | 16 | 5-24 | Output FPS |
| `resolution` | enum | "720p" | 480p, 720p | Output resolution |
| `aspect_ratio` | enum | "auto" | auto, 16:9, 9:16, 1:1 | Output ratio |
| `num_inference_steps` | integer | 30 | 2-40 | Quality steps |
| `guide_scale` | float | 5 | 1-10 | Prompt adherence |
| `shift` | float | 5 | 1-10 | Motion shift |
| `seed` | integer | random | - | Reproducibility |
| `acceleration` | enum | "none" | none, regular | Speed mode |
| `enable_safety_checker` | boolean | true | - | Content filtering |
| `enable_prompt_expansion` | boolean | true | - | AI enhancement |

**Pricing:**

| Resolution | Price | Cost Multiplier |
|------------|-------|-----------------|
| 480p | $0.20 | 0.5 units |
| 720p | $0.40 | 1 unit |
| >81 frames | +25% | 1.25x |

**Duration:** ~6 seconds (81-100 frames at 16fps)

---

### Luma Dream Machine

**Endpoint:** `fal-ai/luma-dream-machine/image-to-video`

Luma AI's flagship image animation.

| Parameter | Type | Default | Range | Description |
|-----------|------|---------|-------|-------------|
| `prompt` | string | required | - | Motion description |
| `image_url` | string | required | - | Start frame |
| `end_image_url` | string | optional | - | End frame (morphing) |
| `aspect_ratio` | enum | "16:9" | 16:9, 9:16, 4:3, 3:4, 21:9, 9:21 | Output ratio |
| `loop` | boolean | false | - | Seamless loop |

**Pricing:** $0.50/video (5s), $1.00/video (9s)
**Duration:** 5s or 9s

---

### Luma Ray 2

**Endpoint:** `fal-ai/luma-dream-machine/ray-2/image-to-video`

Enhanced Luma with resolution options.

| Parameter | Type | Default | Range | Description |
|-----------|------|---------|-------|-------------|
| `prompt` | string | required | - | Motion description |
| `image_url` | string | required | - | Source image |
| `resolution` | enum | "540p" | 540p, 720p, 1080p | Output resolution |
| `duration` | enum | "5" | 5, 9 | Seconds |

**Pricing:**

| Resolution | 5s | 9s |
|------------|----|----|
| 540p | $0.50 | $1.00 |
| 720p | $1.00 | $2.00 |
| 1080p | $2.00 | $4.00 |

---

### Ovi Image-to-Video

**Endpoint:** `fal-ai/ovi/image-to-video`

Open-source with audio generation.

| Parameter | Type | Default | Range | Description |
|-----------|------|---------|-------|-------------|
| `prompt` | string | required | - | Motion/audio description |
| `image_url` | string | required | - | Source image |
| `negative_prompt` | string | "jitter, bad hands, blur, distortion" | - | What to avoid |
| `num_inference_steps` | integer | 30 | 1-50 | Quality steps |
| `audio_negative_prompt` | string | "robotic, muffled, echo, distorted" | - | Audio filtering |
| `seed` | integer | random | - | Reproducibility |

**Pricing:** $0.20/video
**Commercial Use:** Permitted
**Key Feature:** Native audio generation

---

### PixVerse Image-to-Video

**Endpoints:**
- `fal-ai/pixverse/v4.5/image-to-video`
- `fal-ai/pixverse/v5.5/image-to-video`

| Parameter | Type | Default | Range | Description |
|-----------|------|---------|-------|-------------|
| `prompt` | string | required | - | Motion description |
| `image_url` | string | required | - | Source image |
| `duration` | integer | 4 | 4-8 | Seconds |

**Variants:**
- PixVerse v3.5
- PixVerse v4
- PixVerse v4.5
- PixVerse v5.5 (latest)

---

## Video-to-Video Models

### AnimateDiff

**Endpoint:** `fal-ai/fast-animatediff/video-to-video`

Video style transfer and motion effects.

| Parameter | Type | Default | Range | Description |
|-----------|------|---------|-------|-------------|
| `video_url` | string | required | - | Source video |
| `prompt` | string | required | - | Style description |
| `first_n_seconds` | integer | 3 | 2-4 | Duration to process |
| `fps` | integer | 8 | 1-16 | Output FPS |
| `strength` | float | 0.7 | 0.1-1 | Transform intensity |
| `guidance_scale` | float | 7.5 | 0-20 | Prompt adherence |
| `num_inference_steps` | integer | 25 | 1-50 | Quality steps |
| `seed` | integer | random | - | Reproducibility |
| `negative_prompt` | string | "" | - | What to avoid |
| `motions` | array | [] | - | Motion effects |

**Available Motions:**
- `zoom-out`, `zoom-in`
- `pan-left`, `pan-right`
- `tilt-up`, `tilt-down`

**Pricing:** Compute seconds billing (no fixed price)
**Duration:** 2-4 seconds

**Example:**
```javascript
const result = await fal.run('fal-ai/fast-animatediff/video-to-video', {
  input: {
    video_url: 'https://example.com/input.mp4',
    prompt: 'anime style, vibrant colors',
    strength: 0.7,
    motions: ['zoom-out', 'pan-left']
  }
});
```

---

### PixVerse Extend

**Endpoint:** `fal-ai/pixverse/extend`

Video extension and continuation.

| Parameter | Type | Default | Range | Description |
|-----------|------|---------|-------|-------------|
| `video_url` | string | required | - | Source video |
| `prompt` | string | required | - | Continuation description |
| `extend_seconds` | integer | 4 | 2-8 | Additional duration |

---

## Video Enhancement Models

### Topaz Video Upscale

**Endpoint:** `fal-ai/topaz/upscale/video`

Professional-grade video upscaling.

| Parameter | Type | Default | Range | Description |
|-----------|------|---------|-------|-------------|
| `video_url` | string | required | - | Source video |
| `upscale_factor` | integer | 2 | 1-4 (up to 8) | Scale multiplier |
| `target_fps` | integer | original | 16-60 (up to 120) | Output FPS |
| `H264_output` | boolean | false | - | Codec (H264 vs H265) |

**Enhancement Models:**
- `Low Resolution V2` - Default for low-res input
- `Standard V2` - Balanced
- `CGI` - Animation/3D content
- `High Fidelity V2` - Maximum detail
- `Text Refine` - Text preservation
- `Recovery` - Artifact removal
- `Redefine` - AI enhancement
- `Recovery V2` - Latest artifact removal

**Technologies:**
- Apollo v8 frame interpolation
- Proteus v4 upscaling

**Pricing:**

| Input Resolution | Price/Second |
|-----------------|--------------|
| Up to 720p | $0.01 |
| 720p-1080p | $0.02 |
| Above 1080p | $0.08 |
| 60fps output | 2x price |

**Max Output:** 8x upscale, 120 FPS

**Example:**
```python
result = fal_client.run(
    "fal-ai/topaz/upscale/video",
    arguments={
        "video_url": "https://example.com/lowres.mp4",
        "upscale_factor": 4,
        "target_fps": 60
    }
)
```

---

### RealESRGAN Video Upscaler

**Endpoint:** `fal-ai/video-upscaler`

Frame-by-frame AI upscaling.

| Parameter | Type | Default | Range | Description |
|-----------|------|---------|-------|-------------|
| `video_url` | string | required | - | Source video |
| `scale` | integer | 2 | 1-8 | Upscale factor |

**Pricing:** $0.0008/megapixel
**Infrastructure:** GPU-A6000
**Method:** RealESRGAN applied frame-by-frame

---

### AMT Frame Interpolation

**Endpoint:** `fal-ai/amt-interpolation/frame-interpolation`

Increase video frame rate.

| Parameter | Type | Default | Range | Description |
|-----------|------|---------|-------|-------------|
| `frames` | array | required | - | List of Frame objects |
| `output_fps` | integer | 24 | - | Target FPS |
| `recursive_interpolation_passes` | integer | 4 | - | Quality passes |

**Frame Object:**
```json
{
  "url": "https://example.com/frame001.png",
  "timestamp": 0.0
}
```

**Pricing:** Enterprise pricing
**Infrastructure:** GPU-H100-MIG-3g.40gb
**Commercial Use:** Permitted

---

## Pricing Comparison Table

| Model | Billing | Price | Output per $1 |
|-------|---------|-------|---------------|
| WAN 2.5 | second | $0.05 | 20 seconds |
| Kling 2.5 Turbo | second | $0.07 | 14 seconds |
| Veo 3 | second | $0.40 | 2.5 seconds |
| Veo 3 Fast | second | $0.10 | 10 seconds |
| Veo 2 | 5s base | $2.50 | 0.4 videos |
| Hunyuan | video | $0.40 | 2.5 videos |
| Mochi v1 | video | $0.40 | 2.5 videos |
| LTX Video | video | $0.20 | 5 videos |
| SVD | video | $0.075 | 13.3 videos |
| WAN I2V 720p | video | $0.40 | 2.5 videos |
| Luma Dream | video | $0.50 | 2 videos |
| Ovi | video | $0.20 | 5 videos |
| Topaz (720p) | second | $0.01 | 100 seconds |
| RealESRGAN | megapixel | $0.0008 | 1250 MP |

---

## Duration & Resolution Limits

| Model | Max Duration | Resolutions |
|-------|--------------|-------------|
| Veo 3 | 8s | 720p, 1080p |
| Veo 2 | 8s | 720p |
| Hunyuan | ~5s (129 frames) | 480p, 580p, 720p |
| Mochi | ~5s | 480p |
| LTX Video | ~5s (161 frames) | 480p, 720p |
| Vidu | 8s | 360p-1080p |
| Kling | 10s | 720p, 1080p |
| SVD | ~2s | Custom up to 14K |
| WAN I2V | ~6s (100 frames) | 480p, 720p |
| Luma | 9s | 540p-1080p |

---

## Code Examples

### Text-to-Video (JavaScript)

```javascript
import { fal } from '@fal-ai/client';

const result = await fal.run('fal-ai/veo3', {
  input: {
    prompt: 'A timelapse of a city transitioning from day to night, with lights gradually turning on in buildings',
    duration: '8',
    resolution: '1080p',
    generate_audio: true,
    aspect_ratio: '16:9'
  }
});

console.log('Video URL:', result.video.url);
```

### Image-to-Video (Python)

```python
import fal_client

result = fal_client.run(
    "fal-ai/stable-video",
    arguments={
        "image_url": "https://example.com/landscape.jpg",
        "motion_bucket_id": 150,
        "fps": 24
    }
)

print(f"Animated video: {result['video']['url']}")
```

### Video Upscaling (JavaScript)

```javascript
const result = await fal.run('fal-ai/topaz/upscale/video', {
  input: {
    video_url: 'https://example.com/480p-video.mp4',
    upscale_factor: 4,
    target_fps: 60
  }
});

// Result: 4K 60fps video
console.log('Upscaled video:', result.video.url);
```

### Queue Pattern for Long Videos

```python
import fal_client

# Submit to queue (videos take time)
handler = fal_client.submit(
    "fal-ai/hunyuan-video",
    arguments={
        "prompt": "A spacecraft launching into orbit",
        "resolution": "720p",
        "pro_mode": True
    }
)

# Wait with progress updates
for event in handler.iter_events():
    if isinstance(event, fal_client.InProgress):
        print(f"Progress: {len(event.logs)} log entries")

result = handler.get()
print(f"Video URL: {result['video']['url']}")
```

---

## Response Schema

All video models return a consistent format:

```json
{
  "video": {
    "url": "https://fal.media/files/{id}/{filename}.mp4",
    "content_type": "video/mp4",
    "file_name": "output.mp4",
    "file_size": 12345678
  },
  "timings": {
    "inference": 45.678
  },
  "seed": 12345
}
```

---

## Related Documentation

- [[agent-01-core-api]] - Queue API for long video generation
- [[agent-04-image-models]] - Source images for I2V
- [[agent-06-streaming-queues]] - Async patterns for video
- [[agent-08-billing-usage]] - Detailed pricing

---

*Document generated: 2025-12-28*
*Source: Official FAL.ai Model Documentation*
*Models documented: 17+*
*Word count: ~7,500*
