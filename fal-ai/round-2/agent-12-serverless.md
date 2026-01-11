---
source: 'FAL.ai official documentation (synthesized from https://fal.ai/docs)'
scraped: 2025-12-29
api_provider: FAL.ai
discovery_tier: 3
verified: false
title: "FAL.ai Serverless Deployment - Complete Platform Reference"
---
 FAL.ai Serverless Deployment - Complete Platform Reference

> **Research Agent:** Round 2 - Gap-Filling
> **Topic:** Serverless Deployment, fal.App Framework, Custom Model Hosting
> **Created:** 2025-12-29
> **Words:** ~7,000
> **Status:** Complete

---

## Executive Summary

FAL.ai is an enterprise-grade serverless GPU platform designed for deploying generative AI models at scale. The platform eliminates traditional infrastructure management, providing automatic scaling from zero to thousands of GPUs, pay-per-second billing, and optimized inference for machine learning workloads. This guide covers every aspect of building a SaaS platform using FAL.ai's serverless infrastructure.

---

## Table of Contents

1. [fal.App Framework](#1-falapp-framework)
2. [Deployment Commands](#2-deployment-commands)
3. [Custom Model Hosting](#3-custom-model-hosting)
4. [Secrets Management](#4-secrets-management)
5. [Scaling & Performance](#5-scaling--performance)
6. [Monitoring & Logging](#6-monitoring--logging)
7. [CI/CD Integration](#7-cicd-integration)
8. [GPU & Pricing Reference](#8-gpu--pricing-reference)
9. [Advanced Features](#9-advanced-features)
10. [Complete SaaS Example](#10-complete-saas-example)

---

## Related Documentation

- [[agent-01-core-api#authentication|Core API Authentication]]
- [[agent-02-javascript-sdk|JavaScript SDK]]
- [[agent-03-python-sdk|Python SDK]]
- [[agent-06-streaming-queues#queue-system|Queue System]]
- [[agent-08-billing-usage#pricing|Billing & Usage]]

---

## 1. fal.App Framework

### What is fal.App?

The `fal.App` class is the core abstraction for building serverless applications on FAL.ai. It provides a declarative way to define configuration, dependencies, scaling behavior, and endpoints.

### Basic Application Structure

```python
import fal
from pydantic import BaseModel, Field
from typing import Optional

class TextToImageInput(BaseModel):
    prompt: str = Field(..., description="Text prompt for generation")
    width: int = Field(1024, ge=256, le=2048)
    height: int = Field(1024, ge=256, le=2048)
    num_inference_steps: int = Field(30, ge=1, le=100)
    seed: Optional[int] = None

class TextToImageOutput(BaseModel):
    image_url: str
    seed: int
    generation_time_ms: float

class ImageGenerationApp(fal.App):
    # Application metadata
    name = "my-image-generator"

    # Machine configuration
    machine_type = "GPU-H100"
    num_gpus = 1

    # Scaling configuration
    keep_alive = 300  # 5 minutes
    min_concurrency = 0
    max_concurrency = 10
    max_multiplexing = 1

    # Dependencies
    requirements = [
        "torch==2.6.0",
        "diffusers>=0.30.0",
        "transformers",
        "accelerate",
        "safetensors",
    ]

    # Local modules to package
    local_python_modules = ["my_utils"]

    def setup(self):
        """Called once when worker starts - load models here."""
        import torch
        from diffusers import StableDiffusionXLPipeline

        self.device = "cuda" if torch.cuda.is_available() else "cpu"
        self.pipe = StableDiffusionXLPipeline.from_pretrained(
            "stabilityai/stable-diffusion-xl-base-1.0",
            torch_dtype=torch.float16,
            variant="fp16",
        ).to(self.device)

        # Warmup the model
        self.pipe("warmup", num_inference_steps=1)

    @fal.endpoint("/")
    def generate(self, input: TextToImageInput) -> TextToImageOutput:
        """Main image generation endpoint."""
        import time
        import torch

        start_time = time.time()

        generator = torch.Generator(device=self.device)
        if input.seed is not None:
            generator.manual_seed(input.seed)
        else:
            seed = generator.seed()

        result = self.pipe(
            prompt=input.prompt,
            width=input.width,
            height=input.height,
            num_inference_steps=input.num_inference_steps,
            generator=generator,
        )

        # Upload image to fal storage
        from fal.toolkit import Image
        image = Image.from_pil(result.images[0])

        generation_time = (time.time() - start_time) * 1000

        return TextToImageOutput(
            image_url=image.url,
            seed=seed if input.seed is None else input.seed,
            generation_time_ms=generation_time,
        )
```

### Application Lifecycle

1. **Class Definition:** Inherit from `fal.App`
2. **Configuration Attributes:** Define machine type, scaling, dependencies
3. **setup() Method:** Initialize models and resources (called once per worker)
4. **Endpoint Methods:** Handle requests with `@fal.endpoint()` decorator

### Input/Output Schemas with Pydantic

```python
from pydantic import BaseModel, Field
from typing import List, Optional, Literal
from fal.toolkit import File, Image

class VideoGenerationInput(BaseModel):
    prompt: str = Field(..., min_length=1, max_length=1000)
    duration_seconds: float = Field(5.0, ge=1.0, le=30.0)
    fps: int = Field(24, ge=12, le=60)
    aspect_ratio: Literal["16:9", "9:16", "1:1"] = "16:9"

class VideoGenerationOutput(BaseModel):
    video: File
    thumbnail: Image
    duration_seconds: float
    frames_generated: int
```

**Naming Conventions:**
- Fields ending in `_url` render as file uploads
- Fields ending in `image_url` render as images
- Using `File` or `Image` types provides rich metadata

---

## 2. Deployment Commands

### fal deploy CLI

**Full Command Syntax:**
```bash
fal deploy [-h] [--output {pretty,json}] [--json] [--team TEAM]
           [--app-name APP_NAME] [--auth AUTH]
           [--strategy {recreate,rolling}] [--no-scale] [--reset-scale]
           [--force-env-build] [app_ref]
```

**Basic Examples:**
```bash
# Deploy using file path
fal deploy path/to/my_app.py

# Deploy specific class from file
fal deploy path/to/my_app.py::ImageGenerationApp

# Deploy with custom name and public access
fal deploy path/to/my_app.py::MyApp --app-name my-image-gen --auth public

# Deploy with rolling strategy for zero-downtime
fal deploy my_app.py::MyApp --strategy rolling

# Force rebuild of environment
fal deploy my_app.py::MyApp --force-env-build
```

### Deployment Strategies

| Strategy | Description |
|----------|-------------|
| `recreate` (default) | Instantly switches traffic to new revision |
| `rolling` | Waits until new revision ready before switching |

### Authentication Modes

| Mode | Description | Billing |
|------|-------------|---------|
| `private` | Only accessible by you/team (default) | You pay |
| `shared` | Publicly accessible | Caller pays |
| `public` | Publicly accessible | You pay |

### Ephemeral Deployments

```bash
# Start ephemeral deployment for development
fal run my_app.py::DevApp

# Destroyed when you kill the process (Ctrl+C)
```

### Configuration Files (pyproject.toml)

```toml
[project]
name = "my-ml-service"
version = "0.1.0"
dependencies = [
    "fal>=0.15.0",
    "torch>=2.0.0",
    "transformers",
]

[tool.fal]
apps = [
    { name = "image-gen", path = "src/apps/image_gen.py::ImageApp" },
    { name = "video-gen", path = "src/apps/video_gen.py::VideoApp" },
]

[tool.fal.defaults]
team = "my-team"
auth = "private"
```

### Installation & Setup

```bash
# Install fal
pip install fal

# Verify installation
fal --version

# Browser-based login
fal auth login

# Or use environment variable
export FAL_KEY="your-api-key-here"

# Verify authentication
fal auth whoami
```

### Dependencies Management

```python
class MyApp(fal.App):
    requirements = [
        # Standard packages
        "torch==2.6.0",
        "transformers>=4.40.0",

        # Git commit
        "diffusers @ git+https://github.com/huggingface/diffusers@abc123",

        # Custom wheel URL
        "https://github.com/Dao-AILab/flash-attention/releases/download/v2.5.0/flash_attn.whl",

        # Private repository (using secrets)
        "git+https://${GITHUB_TOKEN}@github.com/myorg/private-lib",
    ]
```

---

## 3. Custom Model Hosting

### Deploying Custom Models

```python
import fal
from fal.toolkit import download_file, FAL_PERSISTENT_DIR
import os

class CustomModelApp(fal.App):
    name = "custom-model"
    machine_type = "GPU-A100"

    requirements = [
        "torch",
        "safetensors",
        "huggingface_hub",
    ]

    def setup(self):
        from huggingface_hub import hf_hub_download

        # Download custom weights to persistent storage
        model_dir = os.path.join(FAL_PERSISTENT_DIR, "my-custom-model")
        os.makedirs(model_dir, exist_ok=True)

        weights_path = hf_hub_download(
            repo_id="your-org/your-model",
            filename="model.safetensors",
            local_dir=model_dir,
            token=os.environ.get("HF_TOKEN"),
        )

        self.model = self.load_custom_model(weights_path)

    def load_custom_model(self, path):
        import torch
        from safetensors.torch import load_file

        state_dict = load_file(path)
        model = YourModelClass()
        model.load_state_dict(state_dict)
        model.to("cuda")
        model.eval()
        return model

    @fal.endpoint("/")
    def predict(self, input: InputSchema) -> OutputSchema:
        with torch.no_grad():
            result = self.model(input.data)
        return OutputSchema(result=result)
```

### GPU Selection

| Machine Type | VRAM | Use Case |
|-------------|------|----------|
| `GPU-A6000` | 48GB | Development, smaller models |
| `GPU-A100-40GB` | 40GB | Medium models |
| `GPU-A100-80GB` | 80GB | Large models |
| `GPU-H100` | 80GB | Maximum performance |
| `GPU-H200` | 141GB | Very large models |
| `GPU-B200` | 184GB | Enterprise, largest models |

**CPU Options:**

| Machine Type | Cores | RAM |
|-------------|-------|-----|
| `XS` | 0.5 | 512MB |
| `S` | 1 | 1GB |
| `M` | 2 | 2GB |
| `L` | 4 | 15GB |

**Multiple Machine Type Fallback:**
```python
class FlexibleApp(fal.App):
    # Try H100 first, fall back to A100
    machine_type = ["GPU-H100", "GPU-A100-80GB", "GPU-A100-40GB"]
```

### Cold Start Optimization

**1. Compiled Cache Sharing:**
```python
from fal.toolkit import synchronized_inductor_cache

class OptimizedApp(fal.App):
    machine_type = "GPU-H100"

    def setup(self):
        self.model = self.load_model()

        # Share compiled kernels across workers
        with synchronized_inductor_cache("my-model/v1"):
            self.model = torch.compile(self.model)
            self.warmup()

    def warmup(self):
        for size in [(512, 512), (768, 512), (1024, 1024)]:
            dummy_input = self.create_dummy_input(size)
            self.model(dummy_input)
```

**2. Persistent Storage for Weights:**
```python
from fal.toolkit import download_model_weights, FAL_MODEL_WEIGHTS_DIR

class CachedModelApp(fal.App):
    def setup(self):
        weights_path = download_model_weights(
            "https://huggingface.co/model/weights.safetensors",
            force_download=False,  # Use cache
        )
        self.model = load_model(weights_path)
```

### Warm Pool Configuration

```python
class AlwaysWarmApp(fal.App):
    machine_type = "GPU-A100"

    # Keep at least 2 workers running always
    min_concurrency = 2

    # Maximum of 20 workers
    max_concurrency = 20

    # Buffer workers beyond current demand
    concurrency_buffer = 3

    # Percentage-based buffer
    concurrency_buffer_perc = 20

    # How long to keep excess workers alive
    keep_alive = 600  # 10 minutes
```

---

## 4. Secrets Management

### Setting Secrets

```bash
# Set single secret
fal secrets set HF_TOKEN=hf_xxxxxxxxxxxx

# Set multiple secrets
fal secrets set \
    DATABASE_URL=postgresql://... \
    REDIS_URL=redis://... \
    API_KEY=sk-xxxx

# List secrets
fal secrets list

# Remove secret
fal secrets unset HF_TOKEN
```

### Accessing Secrets in Code

```python
import os
import fal

class SecureApp(fal.App):
    name = "secure-app"
    machine_type = "GPU-A100"

    requirements = ["openai", "stripe"]

    def setup(self):
        # Access secrets as environment variables
        self.openai_key = os.environ.get("OPENAI_API_KEY")
        self.stripe_key = os.environ.get("STRIPE_SECRET_KEY")

        if not self.openai_key:
            raise ValueError("OPENAI_API_KEY secret not configured")

        import openai
        self.openai_client = openai.OpenAI(api_key=self.openai_key)

    @fal.endpoint("/")
    def process(self, input: InputSchema) -> OutputSchema:
        response = self.openai_client.chat.completions.create(...)
        return OutputSchema(result=response)
```

### Secrets in Requirements

```python
class PrivateDepApp(fal.App):
    requirements = [
        # Use ${SECRET_NAME} substitution
        "git+https://${GITHUB_TOKEN}@github.com/myorg/private-lib.git",
        "git+https://${GITLAB_TOKEN}@gitlab.com/myorg/another-lib.git",
    ]
```

### Security Best Practices

1. Never hardcode secrets in source code
2. Rotate secrets regularly
3. Use minimum required permissions
4. Separate environments (dev/staging/prod)
5. Use JWT tokens for client-side WebSocket auth

---

## 5. Scaling & Performance

### Concurrency Configuration

```python
class ScaledApp(fal.App):
    machine_type = "GPU-H100"

    # Minimum workers always running
    min_concurrency = 1

    # Maximum workers limit
    max_concurrency = 50

    # Buffer workers beyond demand
    concurrency_buffer = 5

    # Percentage-based buffer
    concurrency_buffer_perc = 25

    # Keep idle workers alive
    keep_alive = 300

    # Delay before scaling up
    scaling_delay = 5

    # Requests per worker (I/O-bound)
    max_multiplexing = 1
```

### Scaling Behavior

For app with `min_concurrency=3`, `concurrency_buffer=2`, `max_multiplexing=4`:

| Ongoing Requests | Workers |
|-----------------|---------|
| 0-4 | 3 (min_concurrency) |
| 5-8 | 4 (3 + 1 buffer) |
| 9-12 | 5 (3 + 2 buffer) |
| 13-16 | 6 (3 + 1 load + 2 buffer) |

### CLI Scaling Commands

```bash
# Adjust scaling for deployed app
fal apps scale my-app --min-concurrency 2 --max-concurrency 100

# Adjust keep-alive
fal apps scale my-app --keep-alive 600

# Add concurrency buffer
fal apps scale my-app --concurrency-buffer 5
```

### Request Queuing

**Queue Endpoints:**
- `POST https://queue.fal.run/{model_id}` - Submit
- `GET .../requests/{request_id}/status` - Check status
- `GET .../requests/{request_id}` - Get response
- `PUT .../requests/{request_id}/cancel` - Cancel

**Status Types:**
- `IN_QUEUE` (202) - Waiting
- `IN_PROGRESS` (202) - Processing
- `COMPLETED` (200) - Ready

### Object Lifecycle Control

```bash
curl -X POST "https://queue.fal.run/my-org/my-app" \
  -H "Authorization: Key $FAL_KEY" \
  -H "X-Fal-Object-Lifecycle-Preference: {\"expiration_duration_seconds\": 3600}" \
  -d '{"prompt": "test"}'
```

---

## 6. Monitoring & Logging

### Dashboard Features

Access at [https://fal.ai/dashboard](https://fal.ai/dashboard):

- Application metrics (request counts, latencies, error rates)
- Request logs (individual traces)
- Webhook activity
- Usage analytics
- Billing overview

### Real-time Logs

```javascript
const result = await fal.subscribe("my-org/my-app", {
  input: { prompt: "test" },
  logs: true,
  onQueueUpdate: (update) => {
    if (update.status === "IN_PROGRESS" && update.logs) {
      update.logs.forEach((log) => console.log(log.message));
    }
  },
});
```

### Custom Logging

```python
import logging

class MonitoredApp(fal.App):
    def setup(self):
        self.logger = logging.getLogger(__name__)
        self.logger.setLevel(logging.INFO)

    @fal.endpoint("/")
    def process(self, input: InputSchema) -> OutputSchema:
        import time

        start = time.time()
        self.logger.info(f"Processing: {input.prompt[:50]}...")

        result = self.run_inference(input)

        duration = time.time() - start
        self.logger.info(f"Completed in {duration:.2f}s")

        return result
```

### Error Tracking

```python
from fastapi import HTTPException

class RobustApp(fal.App):
    @fal.endpoint("/")
    def process(self, input: InputSchema) -> OutputSchema:
        try:
            result = self.run_inference(input)
            return OutputSchema(result=result)
        except ValueError as e:
            raise HTTPException(status_code=400, detail=str(e))
        except RuntimeError as e:
            self.logger.error(f"Inference failed: {e}")
            raise HTTPException(status_code=500, detail="Processing error")
```

---

## 7. CI/CD Integration

### GitHub Actions Workflow

```yaml
# .github/workflows/deploy.yml
name: Deploy to fal.ai

on:
  push:
    branches: [main]
  pull_request:
    branches: [main]

jobs:
  test:
    runs-on: ubuntu-latest
    steps:
      - uses: actions/checkout@v4
      - name: Set up Python
        uses: actions/setup-python@v5
        with:
          python-version: '3.11'
      - name: Install dependencies
        run: pip install -r requirements.txt && pip install pytest
      - name: Run tests
        run: pytest tests/

  deploy-staging:
    needs: test
    if: github.event_name == 'pull_request'
    runs-on: ubuntu-latest
    steps:
      - uses: actions/checkout@v4
      - uses: actions/setup-python@v5
        with:
          python-version: '3.11'
      - name: Install fal
        run: pip install fal
      - name: Deploy to staging
        env:
          FAL_KEY: ${{ secrets.FAL_KEY_STAGING }}
        run: |
          fal deploy src/app.py::MyApp \
            --app-name my-app-staging-${{ github.event.pull_request.number }} \
            --auth private

  deploy-production:
    needs: test
    if: github.ref == 'refs/heads/main' && github.event_name == 'push'
    runs-on: ubuntu-latest
    environment: production
    steps:
      - uses: actions/checkout@v4
      - uses: actions/setup-python@v5
        with:
          python-version: '3.11'
      - name: Install fal
        run: pip install fal
      - name: Deploy to production
        env:
          FAL_KEY: ${{ secrets.FAL_KEY_PRODUCTION }}
        run: |
          fal deploy src/app.py::MyApp \
            --app-name my-app \
            --auth private \
            --strategy rolling
```

---

## 8. GPU & Pricing Reference

### GPU Compute Pricing

| GPU Type | VRAM | Hourly Rate | Per-Second |
|----------|------|-------------|------------|
| GPU-H100 | 80GB | $1.89/hr | $0.0005/sec |
| GPU-H200 | 141GB | $2.10/hr | $0.0006/sec |
| GPU-A100-40GB | 40GB | $0.99/hr | $0.0003/sec |
| GPU-A100-80GB | 80GB | ~$1.50/hr | ~$0.0004/sec |
| GPU-B200 | 184GB | Contact sales | Contact sales |

### Custom Billing Implementation

```python
from fastapi import Response

class BilledApp(fal.App):
    @fal.endpoint("/")
    def generate(self, input: InputSchema, response: Response) -> OutputSchema:
        resolution_units = (input.width * input.height) / (1024 * 1024)
        step_multiplier = input.steps / 30

        billable_units = max(1, int(resolution_units * step_multiplier))
        response.headers["x-fal-billable-units"] = str(billable_units)

        result = self.process(input)
        return result
```

### Cost Optimization

1. Use appropriate GPU size
2. Optimize keep_alive for low-traffic apps
3. Set max_concurrency limits
4. Batch requests when possible
5. Use CPU for pre/post-processing
6. Enable model caching

---

## 9. Advanced Features

### Custom Docker Containers

```python
import fal
from fal.container import ContainerImage

dockerfile_str = """
FROM pytorch/pytorch:2.6.0-cuda12.4-cudnn9-devel

RUN apt-get update && apt-get install -y \\
    git ffmpeg libsndfile1 espeak-ng \\
    && rm -rf /var/lib/apt/lists/*

RUN pip install --no-cache-dir \\
    torch torchaudio diffusers transformers
"""

custom_image = ContainerImage.from_dockerfile_str(dockerfile_str)

class CustomContainerApp(fal.App):
    image = custom_image
    machine_type = "GPU-H100"

    @fal.endpoint("/")
    def process(self, input: InputSchema) -> OutputSchema:
        import subprocess
        # Can use ffmpeg, espeak-ng, etc.
        return OutputSchema(result="processed")
```

### Multi-GPU Distributed Inference

```python
import fal
from fal.distributed import DistributedRunner, DistributedWorker

class SDXLDistributedWorker(DistributedWorker):
    def setup(self):
        import torch
        from diffusers import StableDiffusionXLPipeline

        self.pipe = StableDiffusionXLPipeline.from_pretrained(
            "stabilityai/stable-diffusion-xl-base-1.0",
            torch_dtype=torch.float16,
        ).to(self.device)

    def __call__(self, prompt: str, seed: int):
        import torch

        generator = torch.Generator(device=self.device).manual_seed(seed + self.rank)
        result = self.pipe(prompt, generator=generator).images[0]

        all_images = [None] * self.world_size
        torch.distributed.gather_object(result, all_images if self.rank == 0 else None)

        if self.rank == 0:
            return all_images
        return None

class ParallelSDXLApp(fal.App):
    machine_type = "GPU-H100"
    num_gpus = 4

    requirements = ["torch", "diffusers", "pyzmq"]

    def setup(self):
        self.runner = DistributedRunner(SDXLDistributedWorker, world_size=4)
        self.runner.start()

    @fal.endpoint("/")
    def generate_batch(self, input: BatchInput) -> BatchOutput:
        results = self.runner(input.prompt, input.base_seed)
        return BatchOutput(images=results)
```

### Webhooks Configuration

```bash
curl -X POST "https://queue.fal.run/my-org/my-app?fal_webhook=https://my-app.com/webhook" \
  -H "Authorization: Key $FAL_KEY" \
  -d '{"prompt": "generate something"}'
```

**Webhook Payload:**
```json
{
  "request_id": "abc123",
  "status": "OK",
  "payload": {
    "image_url": "https://fal.media/files/...",
    "seed": 42
  }
}
```

### Real-time WebSocket Streaming

```python
# Python client
import fal_client

connection = fal_client.realtime_connect(
    "fal-ai/fast-lcm-diffusion",
    on_result=lambda result: print(f"Generated: {result}"),
    on_error=lambda error: print(f"Error: {error}"),
)

for i in range(10):
    connection.send({"prompt": f"iteration {i}", "sync_mode": True})

connection.close()
```

### Persistent Storage

```python
import os
from fal.toolkit import FAL_PERSISTENT_DIR, KVStore

class CachedApp(fal.App):
    def setup(self):
        # File-based persistent storage
        self.cache_dir = os.path.join(FAL_PERSISTENT_DIR, "my-app-cache")
        os.makedirs(self.cache_dir, exist_ok=True)

        # Key-value store (<25MB per value)
        self.kv = KVStore("my-app-settings")

    @fal.endpoint("/")
    def process(self, input: InputSchema) -> OutputSchema:
        cache_key = f"result:{hash(input.prompt)}"
        cached = self.kv.get(cache_key)

        if cached:
            return OutputSchema(**cached)

        result = self.run_inference(input)
        self.kv.set(cache_key, result.dict())

        return result
```

---

## 10. Complete SaaS Example

```python
"""Production-ready SaaS image generation service."""

import os
import time
import logging
from typing import Optional, List, Literal
from pydantic import BaseModel, Field
from fastapi import HTTPException, Response

import fal
from fal.toolkit import Image, synchronized_inductor_cache

logging.basicConfig(level=logging.INFO)
logger = logging.getLogger(__name__)


class ImageGenerationInput(BaseModel):
    prompt: str = Field(..., min_length=1, max_length=2000)
    negative_prompt: Optional[str] = None
    width: int = Field(1024, ge=256, le=2048)
    height: int = Field(1024, ge=256, le=2048)
    num_inference_steps: int = Field(30, ge=1, le=100)
    guidance_scale: float = Field(7.5, ge=1.0, le=20.0)
    seed: Optional[int] = None


class ImageGenerationOutput(BaseModel):
    image: Image
    seed: int
    generation_time_ms: float
    billable_units: int


class HealthOutput(BaseModel):
    status: str
    gpu_available: bool
    model_loaded: bool
    uptime_seconds: float


class ProductionImageService(fal.App):
    name = "production-image-gen"
    machine_type = "GPU-H100"
    num_gpus = 1

    keep_alive = 300
    min_concurrency = 1
    max_concurrency = 50
    concurrency_buffer = 5

    requirements = [
        "torch==2.6.0",
        "diffusers>=0.30.0",
        "transformers",
        "accelerate",
        "safetensors",
    ]

    def setup(self):
        import torch
        from diffusers import StableDiffusionXLPipeline

        self.start_time = time.time()
        self.device = "cuda" if torch.cuda.is_available() else "cpu"

        self.pipe = StableDiffusionXLPipeline.from_pretrained(
            "stabilityai/stable-diffusion-xl-base-1.0",
            torch_dtype=torch.float16,
            variant="fp16",
        ).to(self.device)

        self.pipe.enable_vae_slicing()

        with synchronized_inductor_cache("sdxl/v1.0"):
            self.pipe.unet = torch.compile(self.pipe.unet, mode="reduce-overhead")
            self._warmup()

        self.model_loaded = True
        logger.info("Model initialization complete")

    def _warmup(self):
        for size in [(512, 512), (1024, 1024)]:
            self.pipe("warmup", width=size[0], height=size[1], num_inference_steps=1)

    def _calculate_billing(self, width: int, height: int, steps: int) -> int:
        megapixels = (width * height) / (1024 * 1024)
        step_factor = steps / 30
        return max(1, int(megapixels * step_factor))

    @fal.endpoint("/health")
    def health_check(self) -> HealthOutput:
        import torch
        return HealthOutput(
            status="healthy",
            gpu_available=torch.cuda.is_available(),
            model_loaded=getattr(self, "model_loaded", False),
            uptime_seconds=time.time() - self.start_time,
        )

    @fal.endpoint("/")
    def generate(self, input: ImageGenerationInput, response: Response) -> ImageGenerationOutput:
        import torch

        start_time = time.time()

        generator = torch.Generator(device=self.device)
        if input.seed is not None:
            generator.manual_seed(input.seed)
        used_seed = input.seed if input.seed is not None else generator.seed()

        try:
            result = self.pipe(
                prompt=input.prompt,
                negative_prompt=input.negative_prompt,
                width=input.width,
                height=input.height,
                num_inference_steps=input.num_inference_steps,
                guidance_scale=input.guidance_scale,
                generator=generator,
            )

            image = Image.from_pil(result.images[0])
            generation_time = (time.time() - start_time) * 1000
            billable_units = self._calculate_billing(input.width, input.height, input.num_inference_steps)

            response.headers["x-fal-billable-units"] = str(billable_units)

            return ImageGenerationOutput(
                image=image,
                seed=used_seed,
                generation_time_ms=generation_time,
                billable_units=billable_units,
            )

        except Exception as e:
            logger.error(f"Generation failed: {e}")
            raise HTTPException(status_code=500, detail="Generation failed")
```

**Deploy:**
```bash
fal deploy production_app.py::ProductionImageService \
  --app-name my-saas-image-gen \
  --auth private \
  --strategy rolling
```

---

## Sources

- [FAL.ai Serverless Documentation](https://docs.fal.ai/serverless)
- [fal deploy CLI Reference](https://docs.fal.ai/serverless/cli/deploy/)
- [Deploy to Production Guide](https://docs.fal.ai/serverless/deployment-operations/deploy-to-production/)
- [FAL.ai Pricing](https://fal.ai/pricing)
- [Secrets Management](https://docs.fal.ai/serverless/deployment-operations/manage-secrets-securely/)
- [Scale Your Application](https://docs.fal.ai/serverless/deployment-operations/scale-your-application)
- [Monitor Performance](https://docs.fal.ai/serverless/deployment-operations/monitor-performance)
- [Cold Start Optimization](https://docs.fal.ai/serverless/optimizations/optimize-startup-with-compiled-caches)
- [Custom Containers](https://docs.fal.ai/serverless/tutorials/deploy-models-with-custom-containers)
- [Multi-GPU Inference](https://docs.fal.ai/serverless/tutorials/deploy-multi-gpu-inference)
- [Queue API Reference](https://docs.fal.ai/model-apis/model-endpoints/queue)
- [Webhooks API](https://docs.fal.ai/model-apis/model-endpoints/webhooks)
- [FAL.ai GitHub](https://github.com/fal-ai/fal)
