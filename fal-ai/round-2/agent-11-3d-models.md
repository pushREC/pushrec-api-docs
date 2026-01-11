---
source: 'FAL.ai official documentation (synthesized from https://fal.ai/docs)'
scraped: 2025-12-29
api_provider: FAL.ai
discovery_tier: 3
verified: false
title: "FAL.ai 3D Generation Models - Complete API Reference"
---
 FAL.ai 3D Generation Models - Complete API Reference

> **Research Agent:** Round 2 - Gap-Filling
> **Topic:** 3D Generation, Text-to-3D, Image-to-3D, Mesh Processing
> **Created:** 2025-12-29
> **Words:** ~7,000
> **Status:** Complete

---

## Executive Summary

FAL.ai provides a comprehensive suite of AI-powered 3D generation APIs, offering developers enterprise-ready endpoints for creating production-quality 3D assets from text, images, and multi-view inputs. This documentation covers all available 3D generation models, their parameters, pricing, integration patterns, and code examples for building a SaaS platform.

---

## Table of Contents

1. [Platform Overview](#1-platform-overview)
2. [Text-to-3D Models](#2-text-to-3d-models)
3. [Image-to-3D Models](#3-image-to-3d-models)
4. [Multi-View to 3D Models](#4-multi-view-to-3d-models)
5. [3D Editing and Enhancement](#5-3d-editing-and-enhancement)
6. [Scene Reconstruction (SAM 3D)](#6-scene-reconstruction-sam-3d)
7. [Depth Estimation](#7-depth-estimation)
8. [Output Formats](#8-output-formats)
9. [Queue API and Webhooks](#9-queue-api-and-webhooks)
10. [Integration Patterns](#10-integration-patterns)
11. [Pricing Summary](#11-pricing-summary)

---

## Related Documentation

- [[agent-01-core-api#queue-system|Core API Queue System]]
- [[agent-02-javascript-sdk#subscribe|JavaScript SDK Subscribe Method]]
- [[agent-03-python-sdk#async-patterns|Python SDK Async Patterns]]
- [[agent-06-streaming-queues#webhooks|Webhook Configuration]]
- [[agent-08-billing-usage#pricing|Billing & Usage]]

---

## 1. Platform Overview

### API Infrastructure

FAL.ai offers 15+ specialized 3D generation models with:

- **Sub-second inference** for fast models (TripoSR)
- **Queue-based processing** for complex operations
- **Multiple output formats** (GLB, FBX, OBJ, USDZ, STL, PLY)
- **PBR material generation** for production-ready assets
- **Commercial licensing** for enterprise use

### Base URLs

| Service | URL |
|---------|-----|
| API Execution | `https://fal.run/{model_id}` |
| Queue API | `https://queue.fal.run/{model_id}` |

### Authentication

```bash
export FAL_KEY="YOUR_API_KEY"
```

```javascript
import { fal } from "@fal-ai/client";
fal.config({ credentials: "YOUR_FAL_KEY" });
```

```python
import fal_client
import os
os.environ["FAL_KEY"] = "YOUR_FAL_KEY"
```

---

## 2. Text-to-3D Models

### 2.1 Meshy 6 Preview Text-to-3D

**Endpoint:** `fal-ai/meshy/v6-preview/text-to-3d`

**Description:** Latest and most advanced text-to-3D with superior geometry and texture quality.

#### Input Parameters

| Parameter | Type | Required | Default | Description |
|-----------|------|----------|---------|-------------|
| `prompt` | string | Yes | - | Description (max 600 chars) |
| `mode` | enum | No | "full" | "preview" or "full" |
| `art_style` | enum | No | "realistic" | "realistic" or "sculpture" |
| `seed` | integer | No | - | Reproducibility seed |
| `topology` | enum | No | "triangle" | "quad" or "triangle" |
| `target_polycount` | integer | No | 30000 | 100-300,000 |
| `should_remesh` | boolean | No | true | Enable remesh processing |
| `symmetry_mode` | enum | No | "auto" | "off", "auto", "on" |
| `is_a_t_pose` | boolean | No | false | T/A pose for characters |
| `enable_pbr` | boolean | No | false | Generate PBR maps |
| `enable_prompt_expansion` | boolean | No | false | LLM prompt expansion |
| `texture_prompt` | string | No | - | Additional texture guidance |
| `texture_image_url` | string | No | - | Image texture guidance |
| `enable_safety_checker` | boolean | No | true | Content safety validation |

#### Output Schema

```javascript
{
  model_glb: File,           // GLB format 3D model
  thumbnail: File,           // Preview PNG image
  model_urls: {              // Multiple format URLs
    glb: File,
    fbx: File,
    obj: File,
    usdz: File,
    blend: File,
    stl: File
  },
  texture_urls: [{           // PBR texture files
    base_color: string,
    metallic: string,
    normal: string,
    roughness: string
  }],
  seed: integer,
  prompt: string,
  actual_prompt: string      // Expanded prompt if enabled
}
```

#### Code Examples

**JavaScript:**
```javascript
import { fal } from "@fal-ai/client";

const result = await fal.subscribe("fal-ai/meshy/v6-preview/text-to-3d", {
  input: {
    prompt: "A rustic wooden treasure chest with ornate metal bands",
    mode: "full",
    art_style: "realistic",
    enable_pbr: true,
    topology: "triangle",
    target_polycount: 30000
  },
  logs: true,
  onQueueUpdate: (update) => {
    if (update.status === "IN_PROGRESS") {
      update.logs.forEach(log => console.log(log.message));
    }
  }
});

console.log(result.data.model_glb.url);
console.log(result.data.model_urls.fbx.url);
```

**Python:**
```python
import fal_client

result = fal_client.subscribe("fal-ai/meshy/v6-preview/text-to-3d", {
    "prompt": "A rustic wooden treasure chest with ornate metal bands",
    "mode": "full",
    "art_style": "realistic",
    "enable_pbr": True
})

print(result["model_glb"]["url"])
```

**Pricing:** 20 credits (preview) / 30 credits (full)
**Processing Time:** 5-10 minutes

---

### 2.2 Tripo3D v2.5 Text-to-3D

**Endpoint:** `tripo3d/tripo/v2.5/text-to-3d`

**Description:** Professional-grade text-to-3D with clean topology.

#### Input Parameters

| Parameter | Type | Required | Default | Description |
|-----------|------|----------|---------|-------------|
| `prompt` | string | Yes | - | Text description (max 1024 chars) |
| `negative_prompt` | string | No | - | Reverse guidance (max 255 chars) |
| `seed` | integer | No | - | Geometry seed |
| `texture_seed` | integer | No | - | Texture generation seed |
| `image_seed` | integer | No | - | Prompt processing seed |
| `texture` | enum | No | "standard" | "no", "standard", "HD" |
| `face_limit` | integer | No | auto | Polygon count limit |
| `auto_size` | boolean | No | false | Scale to real-world meters |
| `quad` | boolean | No | false | Quad mesh (+$0.05) |
| `pbr` | boolean | No | false | PBR materials |
| `style` | enum | No | - | Artistic style (+$0.05) |

**Available Styles:** `person:person2cartoon`, `object:clay`, `object:steampunk`, `animal:venom`, `object:barbie`, `object:christmas`, `gold`, `ancient_bronze`

#### Output Schema

```javascript
{
  task_id: string,
  model_mesh: File,          // Primary GLB model
  rendered_image: File,      // WebP preview
  base_model: File,          // Untextured geometry
  pbr_model: File            // PBR-textured model
}
```

**Pricing:** $0.20-$0.40 + $0.05 per add-on

---

### 2.3 Hyper3D Rodin Text-to-3D

**Endpoint:** `fal-ai/hyper3d/rodin/v2/text-to-3d`

**Description:** DeemosTech's state-of-the-art model for realistic 3D generation.

#### Input Parameters

| Parameter | Type | Required | Default | Description |
|-----------|------|----------|---------|-------------|
| `prompt` | string | Yes | - | Text description |
| `seed` | integer | No | - | Random seed (0-65535) |
| `geometry_file_format` | enum | No | "glb" | glb, usdz, fbx, obj, stl |
| `material` | enum | No | "PBR" | PBR or Shaded |
| `quality` | enum | No | "medium" | high, medium, low, extra-low |
| `use_hyper` | boolean | No | false | Enable hyper mode |
| `tier` | enum | No | "Regular" | Regular or Sketch |
| `TAPose` | boolean | No | false | T/A pose for characters |
| `quality_mesh_option` | enum | No | "18K Quad" | Polygon/quad options |
| `addons` | enum | No | - | "HighPack" for 4K textures (3x cost) |

**Pricing:** $0.40 per generation (HighPack: $1.20)

---

## 3. Image-to-3D Models

### 3.1 TripoSR (Fastest)

**Endpoint:** `fal-ai/triposr`

**Description:** Open-source, MIT-licensed model for ultra-fast 3D reconstruction. Sub-0.5 second generation.

#### Input Parameters

| Parameter | Type | Required | Default | Range | Description |
|-----------|------|----------|---------|-------|-------------|
| `image_url` | string | Yes | - | - | Image file path/URL |
| `output_format` | enum | No | "glb" | - | "glb" or "obj" |
| `do_remove_background` | boolean | No | true | - | Remove background |
| `foreground_ratio` | float | No | 0.9 | 0.5-1.0 | Foreground scaling |
| `mc_resolution` | integer | No | 256 | 32-1024 | Marching cubes resolution |

#### Remeshing Endpoint

**Endpoint:** `fal-ai/triposr/remeshing`

| Parameter | Type | Required | Default | Description |
|-----------|------|----------|---------|-------------|
| `object_url` | string | Yes | - | Object file to remesh |
| `output_format` | enum | No | "glb" | glb, fbx, obj, stl, usdc |
| `faces` | integer | No | 5000 | Target face count |
| `merge` | boolean | No | true | Merge duplicate vertices |
| `preserve_uvs` | boolean | No | true | Preserve UV mapping |

#### Code Examples

**JavaScript:**
```javascript
const result = await fal.subscribe("fal-ai/triposr", {
  input: {
    image_url: "https://example.com/product.png",
    output_format: "glb",
    do_remove_background: true,
    mc_resolution: 256
  },
  logs: true
});

console.log(result.data.model_mesh.url);
console.log(result.data.timings);
```

**Python:**
```python
result = fal_client.subscribe("fal-ai/triposr", {
    "image_url": "https://example.com/product.png",
    "output_format": "glb",
    "do_remove_background": True
})

print(result["model_mesh"]["url"])
```

**cURL:**
```bash
curl -X POST "https://fal.run/fal-ai/triposr" \
  -H "Authorization: Key $FAL_KEY" \
  -H "Content-Type: application/json" \
  -d '{"image_url": "https://example.com/product.png"}'
```

**Pricing:** $0.07 per generation
**Processing Time:** <0.5 seconds on A100 GPU

---

### 3.2 Trellis (Microsoft SLAT)

**Endpoint:** `fal-ai/trellis`

**Description:** Based on Microsoft's Structured LATents (SLAT) representation with up to 2 billion parameters.

#### Input Parameters

| Parameter | Type | Required | Default | Range | Description |
|-----------|------|----------|---------|-------|-------------|
| `image_url` | string | Yes | - | - | Input image URL |
| `seed` | integer | No | - | - | Reproducibility seed |
| `ss_guidance_strength` | float | No | 7.5 | 0-10 | Sparse structure guidance |
| `ss_sampling_steps` | integer | No | 12 | 1-50 | SS sampling steps |
| `slat_guidance_strength` | float | No | 3.0 | 0-10 | Structured latent guidance |
| `slat_sampling_steps` | integer | No | 12 | 1-50 | SLAT sampling steps |
| `mesh_simplify` | float | No | 0.95 | 0.9-0.98 | Mesh simplification |
| `texture_size` | integer | No | 1024 | 512, 1024, 2048 | Texture resolution |

**Pricing:** $0.02 per generation

---

### 3.3 Trellis 2 (Advanced)

**Endpoint:** `fal-ai/trellis-2`

**Description:** Enhanced version with resolution tiers and advanced parameter control.

#### Input Parameters

| Parameter | Type | Required | Default | Description |
|-----------|------|----------|---------|-------------|
| `image_url` | string | Yes | - | Input image URL |
| `resolution` | enum | No | 1024 | 512, 1024, 1536 pixels |
| `seed` | integer | No | - | Reproducibility seed |
| `remesh` | boolean | No | true | Improve topology |
| `texture_size` | enum | No | 2048 | 1024, 2048, 4096 |
| `decimation_target` | integer | No | 500000 | Target vertex count |
| `ss_guidance_strength` | float | No | 7.5 | 0-10 |
| `ss_guidance_rescale` | float | No | 0.7 | 0-1 |
| `ss_sampling_steps` | integer | No | 12 | 1-50 |
| `ss_rescale_t` | integer | No | 5 | 1-6 |
| `shape_slat_guidance_strength` | float | No | 7.5 | 0-10 |
| `shape_slat_guidance_rescale` | float | No | 0.5 | 0-1 |
| `shape_slat_sampling_steps` | integer | No | 12 | 1-50 |
| `tex_slat_guidance_strength` | float | No | 1.0 | 0-10 |
| `tex_slat_sampling_steps` | integer | No | 12 | 1-50 |

**Pricing:** $0.25 (512p) / $0.30 (1024p) / $0.35 (1536p)

---

### 3.4 Tripo3D v2.5 Image-to-3D

**Endpoint:** `tripo3d/tripo/v2.5/image-to-3d`

**Description:** Professional image-to-3D with PBR texturing and production-ready output.

#### Input Parameters

| Parameter | Type | Required | Default | Description |
|-----------|------|----------|---------|-------------|
| `image_url` | string | Yes | - | Source image URL |
| `seed` | integer | No | - | Geometry seed |
| `face_limit` | integer | No | auto | Polygon count limit |
| `pbr` | boolean | No | false | Enable PBR materials |
| `texture` | enum | No | "standard" | "no", "standard", "HD" |
| `texture_seed` | integer | No | - | Texture generation seed |
| `auto_size` | boolean | No | false | Scale to meters |
| `quad` | boolean | No | false | Quad mesh (+$0.05) |
| `texture_alignment` | enum | No | "original_image" | Texture priority |
| `orientation` | enum | No | "default" | Model orientation |

**Pricing:** $0.20-$0.40 depending on texture quality

---

### 3.5 Meshy 6 Preview Image-to-3D

**Endpoint:** `fal-ai/meshy/v6-preview/image-to-3d`

**Description:** Best quality image-to-3D with comprehensive output formats.

#### Input Parameters

| Parameter | Type | Required | Default | Description |
|-----------|------|----------|---------|-------------|
| `image_url` | string | Yes | - | Input image (max 20MB) |
| `topology` | enum | No | "triangle" | "quad" or "triangle" |
| `target_polycount` | integer | No | 30000 | 100-300,000 |
| `symmetry_mode` | enum | No | "auto" | Symmetry control |
| `should_remesh` | boolean | No | true | Enable remeshing |
| `should_texture` | boolean | No | true | Generate textures |
| `enable_pbr` | boolean | No | false | PBR maps |
| `is_a_t_pose` | boolean | No | false | A/T pose |
| `texture_prompt` | string | No | - | Texture guidance |

**Pricing:** $0.80 per generation
**Processing Time:** 5-10 minutes

---

### 3.6 Hunyuan3D 2.1

**Endpoint:** `fal-ai/hunyuan3d-v21`

**Description:** Tencent's scalable 3D asset creation with advanced PBR support.

#### Input Parameters

| Parameter | Type | Required | Default | Range | Description |
|-----------|------|----------|---------|-------|-------------|
| `input_image_url` | string | Yes | - | - | Source image URL |
| `seed` | integer | No | - | - | Reproducibility seed |
| `num_inference_steps` | integer | No | 50 | 1-50 | Denoising steps |
| `guidance_scale` | float | No | 7.5 | 0-20 | CFG scale |
| `octree_resolution` | integer | No | 256 | 1-1024 | Geometry resolution |
| `textured_mesh` | boolean | No | false | - | Generate textures (3x cost) |

#### Output Schema

```javascript
{
  model_glb: File,           // Base 3D model
  model_glb_pbr: File,       // PBR-textured model
  model_mesh: File,          // Assets ZIP
  seed: integer
}
```

**Pricing:** $0.30 per generation (textured: $0.90)

---

### 3.7 Hyper3D Rodin Image-to-3D

**Endpoint:** `fal-ai/hyper3d/rodin`

**Description:** Professional image-to-3D with multiple quality tiers.

#### Input Parameters

| Parameter | Type | Required | Default | Description |
|-----------|------|----------|---------|-------------|
| `input_image_urls` | array | Yes | - | Up to 5 images |
| `prompt` | string | No | "" | Optional text guidance |
| `condition_mode` | enum | No | "concat" | "concat" or "fuse" |
| `seed` | integer | No | - | Random seed (0-65535) |
| `geometry_file_format` | enum | No | "glb" | glb, usdz, fbx, obj, stl |
| `material` | enum | No | "PBR" | PBR or Shaded |
| `quality` | enum | No | "medium" | high, medium, low, extra-low |
| `use_hyper` | boolean | No | false | Hyper mode export |
| `tier` | enum | No | "Regular" | Regular or Sketch |
| `TAPose` | boolean | No | false | T/A pose for characters |
| `addons` | enum | No | - | "HighPack" (3x cost) |

**Pricing:** $0.40 per generation

---

## 4. Multi-View to 3D Models

### 4.1 Tripo3D v2.5 Multiview-to-3D

**Endpoint:** `tripo3d/tripo/v2.5/multiview-to-3d`

**Description:** Higher geometric accuracy from multiple reference angles.

#### Input Parameters

| Parameter | Type | Required | Default | Description |
|-----------|------|----------|---------|-------------|
| `front_image_url` | string | Yes | - | Front view image |
| `left_image_url` | string | No | - | Left perspective |
| `back_image_url` | string | No | - | Rear perspective |
| `right_image_url` | string | No | - | Right perspective |
| `seed` | integer | No | - | Geometry seed |
| `face_limit` | integer | No | auto | Polygon limit |
| `texture` | enum | No | "standard" | "no", "standard", "HD" |
| `pbr` | boolean | No | false | PBR materials |
| `auto_size` | boolean | No | false | Real-world scaling |
| `quad` | boolean | No | false | Quad mesh (+$0.05) |

```javascript
const result = await fal.subscribe("tripo3d/tripo/v2.5/multiview-to-3d", {
  input: {
    front_image_url: "https://example.com/front.jpg",
    left_image_url: "https://example.com/left.jpg",
    back_image_url: "https://example.com/back.jpg",
    right_image_url: "https://example.com/right.jpg",
    texture: "HD",
    pbr: true
  }
});
```

**Pricing:** $0.20-$0.40 + add-ons

---

### 4.2 Meshy 5 Multi-Image-to-3D

**Endpoint:** `fal-ai/meshy/v5/multi-image-to-3d`

**Description:** Production-ready 3D from 1-4 images of the same object.

#### Input Parameters

| Parameter | Type | Required | Default | Description |
|-----------|------|----------|---------|-------------|
| `image_urls` | array | Yes | - | 1-4 images (max 4 used) |
| `topology` | enum | No | "triangle" | "quad" or "triangle" |
| `target_polycount` | integer | No | 30000 | 100-300,000 |
| `should_remesh` | boolean | No | true | Enable remeshing |
| `should_texture` | boolean | No | true | Generate textures |
| `enable_pbr` | boolean | No | false | PBR maps |

**Pricing:** $0.40 per generation
**Processing Time:** 3-7 minutes

---

### 4.3 Trellis Multi-Image

**Endpoint:** `fal-ai/trellis/multi`

**Description:** Multi-view generation using SLAT representation.

| Parameter | Type | Required | Description |
|-----------|------|----------|-------------|
| `image_urls` | array | Yes | Multiple views |
| `multiimage_algo` | enum | No | "stochastic" or "multidiffusion" |

---

## 5. 3D Editing and Enhancement

### 5.1 Meshy 5 Retexture

**Endpoint:** `fal-ai/meshy/v5/retexture`

**Description:** Apply new textures to existing 3D models.

#### Input Parameters

| Parameter | Type | Required | Default | Description |
|-----------|------|----------|---------|-------------|
| `model_url` | string | Yes | - | 3D model (.glb, .gltf, .obj, .fbx, .stl) |
| `text_style_prompt` | string | Conditional | - | Texture description (max 600 chars) |
| `image_style_url` | string | Conditional | - | 2D image for texture guidance |
| `enable_original_uv` | boolean | No | true | Use original UV mapping |
| `enable_pbr` | boolean | No | false | PBR map generation |

*Note: Either `text_style_prompt` or `image_style_url` required.*

```javascript
const result = await fal.subscribe("fal-ai/meshy/v5/retexture", {
  input: {
    model_url: "https://example.com/model.glb",
    text_style_prompt: "realistic wood grain with metal accents",
    enable_pbr: true
  }
});
```

**Pricing:** $0.30 per generation

---

### 5.2 Meshy 5 Remesh

**Endpoint:** `fal-ai/meshy/v5/remesh`

**Description:** Optimize mesh topology and export to multiple formats.

#### Input Parameters

| Parameter | Type | Required | Default | Description |
|-----------|------|----------|---------|-------------|
| `model_url` | string | Yes | - | Source 3D model |
| `target_formats` | array | No | ["glb"] | Output formats |
| `topology` | enum | No | "triangle" | "quad" or "triangle" |
| `target_polycount` | integer | No | 30000 | 100-300,000 |
| `resize_height` | float | No | 0 | Height in meters |
| `origin_at` | enum | No | - | "bottom" or "center" |

```javascript
const result = await fal.subscribe("fal-ai/meshy/v5/remesh", {
  input: {
    model_url: "https://example.com/model.glb",
    target_formats: ["glb", "fbx", "usdz"],
    topology: "quad",
    target_polycount: 50000
  }
});

console.log(result.data.model_urls.glb.url);
console.log(result.data.model_urls.fbx.url);
console.log(result.data.model_urls.usdz.url);
```

**Pricing:** $0.20 per generation

---

## 6. Scene Reconstruction (SAM 3D)

### 6.1 SAM 3D Objects

**Endpoint:** `fal-ai/sam-3/3d-objects`

**Description:** Precise 3D reconstruction from single images with context-aware segmentation.

#### Input Parameters

| Parameter | Type | Required | Default | Description |
|-----------|------|----------|---------|-------------|
| `image_url` | string | Yes | - | Source image URL |
| `mask_urls` | array | No | - | Mask URLs for objects |
| `prompt` | string | No | "car" | Auto-segmentation prompt |
| `point_prompts` | array | No | - | Point-based segmentation |
| `box_prompts` | array | No | - | Bounding box prompts |
| `seed` | integer | No | - | Reproducibility seed |
| `pointmap_url` | string | No | - | External depth (NPY/NPZ) |
| `export_textured_glb` | boolean | No | false | Baked texture GLB |

#### Output Schema

```javascript
{
  gaussian_splat: File,      // Combined .ply splat
  model_glb: File,           // GLB mesh
  metadata: [{               // Per-object transforms
    object_index: integer,
    scale: [sx, sy, sz],
    rotation: [x, y, z, w],  // Quaternion
    translation: [tx, ty, tz],
    camera_pose: array
  }],
  individual_splats: [File], // Per-object splats
  individual_glbs: [File],   // Per-object meshes
  artifacts_zip: File        // Bundled outputs
}
```

```javascript
const result = await fal.subscribe("fal-ai/sam-3/3d-objects", {
  input: {
    image_url: "https://example.com/scene.jpg",
    prompt: "furniture",
    export_textured_glb: true
  }
});

console.log(result.data.model_glb.url);
console.log(result.data.gaussian_splat.url);
```

**Pricing:** $0.02 per generation

---

### 6.2 SAM 3D Body

**Endpoint:** `fal-ai/sam-3/3d-body`

**Description:** Human body 3D reconstruction with skeletal keypoints.

#### Input Parameters

| Parameter | Type | Required | Default | Description |
|-----------|------|----------|---------|-------------|
| `image_url` | string | Yes | - | Image with humans |
| `mask_url` | string | No | - | Binary mask |
| `export_meshes` | boolean | No | true | Individual PLY files |
| `include_3d_keypoints` | boolean | No | true | Keypoint markers in GLB |

#### Output Schema

```javascript
{
  model_glb: File,           // Body mesh with keypoints
  visualization: File,       // Combined preview image
  meshes: [File],            // Individual PLY per person
  metadata: {
    num_people: integer,
    people: [{
      person_id: integer,
      bounding_box: [...],
      focal_length: float,
      keypoints_2d: [[x, y], ...],  // 70 points
      keypoints_3d: [[x, y, z], ...], // 70 points
      camera_translation: [tx, ty, tz]
    }]
  }
}
```

**Pricing:** $0.02 per generation

---

### 6.3 SAM 3D Align

**Endpoint:** `fal-ai/sam-3/3d-align`

**Description:** Align body meshes to object/scene coordinate frames.

| Parameter | Type | Required | Description |
|-----------|------|----------|-------------|
| `image_url` | string | Yes | Original image |
| `body_mesh_url` | string | Yes | SAM-3D Body mesh |
| `body_mask_url` | string | No | Human mask image |
| `object_mesh_url` | string | No | SAM-3D Object mesh |
| `focal_length` | float | No | Camera focal length |

**Pricing:** $0.02 per generation

---

## 7. Depth Estimation

### Marigold Depth Estimation

**Endpoint:** `fal-ai/imageutils/marigold-depth`

**Description:** High-quality monocular depth estimation.

#### Input Parameters

| Parameter | Type | Required | Default | Range | Description |
|-----------|------|----------|---------|-------|-------------|
| `image_url` | string | Yes | - | - | Input image URL |
| `num_inference_steps` | integer | No | 10 | 2-50 | Denoising iterations |
| `ensemble_size` | integer | No | 10 | 2-50 | Prediction averaging |
| `processing_res` | integer | No | 0 | 0-2048 | Max processing resolution |

```javascript
const result = await fal.subscribe("fal-ai/imageutils/marigold-depth", {
  input: {
    image_url: "https://example.com/scene.jpg",
    num_inference_steps: 15,
    ensemble_size: 10
  }
});

console.log(result.data.image.url);
```

**Pricing:** Compute-based

---

## 8. Output Formats

### Supported 3D Formats

| Format | Extension | Description | Best For |
|--------|-----------|-------------|----------|
| **GLB** | .glb | GL Transmission Format Binary | Web, Three.js |
| **GLTF** | .gltf | GL Transmission Format (JSON) | Web development |
| **FBX** | .fbx | Autodesk FilmBox | Unity, Unreal Engine |
| **OBJ** | .obj | Wavefront OBJ | Legacy software |
| **USDZ** | .usdz | Universal Scene Description | Apple AR, iOS |
| **STL** | .stl | Stereolithography | 3D printing |
| **PLY** | .ply | Polygon File Format | Point clouds, Gaussian splats |
| **Blend** | .blend | Blender native | Blender workflows |

### PBR Texture Maps

| Map Type | Description |
|----------|-------------|
| **Base Color** | Albedo/diffuse texture |
| **Metallic** | Metal vs. dielectric |
| **Roughness** | Surface smoothness |
| **Normal** | Surface detail bumps |

---

## 9. Queue API and Webhooks

### Queue Endpoints

| Endpoint | Method | Purpose |
|----------|--------|---------|
| `/{model_id}` | POST | Submit to queue |
| `/{model_id}/requests/{request_id}/status` | GET | Check status |
| `/{model_id}/requests/{request_id}/status/stream` | GET | Stream status (SSE) |
| `/{model_id}/requests/{request_id}` | GET | Get result |
| `/{model_id}/requests/{request_id}/cancel` | PUT | Cancel request |

### Status Types

| Status | HTTP Code | Description |
|--------|-----------|-------------|
| `IN_QUEUE` | 202 | Waiting, includes `queue_position` |
| `IN_PROGRESS` | 202 | Processing, includes `logs` |
| `COMPLETED` | 200 | Finished, includes `response` |

### Queue-Based Request

```javascript
// Submit to queue
const { request_id } = await fal.queue.submit("fal-ai/triposr", {
  input: { image_url: "https://example.com/image.png" },
  webhookUrl: "https://your-server.com/webhook"
});

// Check status
const status = await fal.queue.status("fal-ai/triposr", {
  requestId: request_id,
  logs: true
});

// Get result when complete
const result = await fal.queue.result("fal-ai/triposr", {
  requestId: request_id
});
```

### Webhook Payload

```javascript
{
  request_id: "abc123",
  status: "COMPLETED",
  response: {
    model_mesh: { url: "...", file_size: 1234567 }
  }
}
```

---

## 10. Integration Patterns

### Three.js Integration

```javascript
import * as THREE from 'three';
import { GLTFLoader } from 'three/examples/jsm/loaders/GLTFLoader';
import { fal } from "@fal-ai/client";

async function generate3DModel(imageUrl) {
  const result = await fal.subscribe("fal-ai/triposr", {
    input: { image_url: imageUrl }
  });

  const loader = new GLTFLoader();
  const gltf = await loader.loadAsync(result.data.model_mesh.url);

  scene.add(gltf.scene);
  return gltf.scene;
}
```

### React/Next.js Component

```jsx
import { useState } from 'react';
import { Canvas } from '@react-three/fiber';
import { useGLTF, OrbitControls } from '@react-three/drei';
import { fal } from "@fal-ai/client";

function Model({ url }) {
  const { scene } = useGLTF(url);
  return <primitive object={scene} />;
}

export default function ModelGenerator() {
  const [modelUrl, setModelUrl] = useState(null);
  const [loading, setLoading] = useState(false);

  async function generateModel(imageUrl) {
    setLoading(true);
    const result = await fal.subscribe("fal-ai/triposr", {
      input: { image_url: imageUrl }
    });
    setModelUrl(result.data.model_mesh.url);
    setLoading(false);
  }

  return (
    <div>
      <input type="file" onChange={handleUpload} />
      {loading && <p>Generating 3D model...</p>}
      {modelUrl && (
        <Canvas>
          <ambientLight />
          <Model url={modelUrl} />
          <OrbitControls />
        </Canvas>
      )}
    </div>
  );
}
```

### AR Quick Look (iOS)

```html
<a rel="ar" href="model.usdz">
  <img src="preview.png" />
</a>
```

---

## 11. Pricing Summary

### Complete Pricing Table

| Model | Endpoint | Base Price | Notes |
|-------|----------|------------|-------|
| **TripoSR** | fal-ai/triposr | $0.07 | Fastest, open-source |
| **Trellis** | fal-ai/trellis | $0.02 | Microsoft SLAT |
| **Trellis 2** | fal-ai/trellis-2 | $0.25-$0.35 | Resolution-based |
| **Tripo3D v2.5** | tripo3d/tripo/v2.5/* | $0.20-$0.40 | Texture quality tiers |
| **Hyper3D Rodin** | fal-ai/hyper3d/rodin | $0.40 | +3x for HighPack |
| **Hunyuan3D 2.1** | fal-ai/hunyuan3d-v21 | $0.30 | +3x for textures |
| **Meshy 6 Text-to-3D** | fal-ai/meshy/v6-preview/text-to-3d | 20-30 credits | Preview/Full |
| **Meshy 6 Image-to-3D** | fal-ai/meshy/v6-preview/image-to-3d | $0.80 | Best quality |
| **Meshy 5 Multi-Image** | fal-ai/meshy/v5/multi-image-to-3d | $0.40 | 1-4 images |
| **Meshy 5 Retexture** | fal-ai/meshy/v5/retexture | $0.30 | Texture replacement |
| **Meshy 5 Remesh** | fal-ai/meshy/v5/remesh | $0.20 | Format conversion |
| **SAM 3D Objects** | fal-ai/sam-3/3d-objects | $0.02 | Scene reconstruction |
| **SAM 3D Body** | fal-ai/sam-3/3d-body | $0.02 | Human reconstruction |
| **SAM 3D Align** | fal-ai/sam-3/3d-align | $0.02 | Scene alignment |
| **Marigold Depth** | fal-ai/imageutils/marigold-depth | Compute | Depth estimation |

### Processing Times

| Model | Typical Time |
|-------|--------------|
| TripoSR | <0.5 seconds |
| Trellis/Trellis 2 | 15-30 seconds |
| Tripo3D v2.5 | 15-30 seconds |
| Hyper3D Rodin | 1-3 minutes |
| Hunyuan3D 2.1 | 1-2 minutes |
| Meshy 6 | 5-10 minutes |
| Meshy 5 Multi-Image | 3-7 minutes |
| SAM 3D | 5-30 seconds |

---

## Sources

- [FAL.ai 3D Models](https://fal.ai/3d-models)
- [Tripo3D v2.5 Image-to-3D](https://fal.ai/models/tripo3d/tripo/v2.5/image-to-3d)
- [TripoSR](https://fal.ai/models/fal-ai/triposr)
- [Trellis](https://fal.ai/models/fal-ai/trellis)
- [Trellis 2](https://fal.ai/models/fal-ai/trellis-2)
- [Meshy 6 Preview](https://fal.ai/models/fal-ai/meshy/v6-preview/text-to-3d/api)
- [Hyper3D Rodin](https://fal.ai/models/fal-ai/hyper3d/rodin)
- [Hunyuan3D 2.1](https://fal.ai/models/fal-ai/hunyuan3d-v21/api)
- [SAM 3D](https://fal.ai/models/fal-ai/sam-3/3d-objects/api)
- [Queue API Documentation](https://docs.fal.ai/model-apis/model-endpoints/queue)
- [FAL.ai Documentation](https://docs.fal.ai/)
