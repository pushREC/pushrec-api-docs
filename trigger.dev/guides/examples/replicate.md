# Image-to-Image Generation Using Replicate and Nano-Banana

## Overview

This example demonstrates integration with Replicate's image-to-image generation capabilities using the nano-banana model within Trigger.dev's framework.

## Core Implementation

The solution initializes both Replicate and S3 clients with appropriate credentials:

- **Replicate Client**: Authenticated via `REPLICATE_API_TOKEN`
- **S3/R2 Client**: Configured with endpoint, access key, and secret access key for Cloudflare R2 storage

## Key Workflow Steps

1. **Create Wait Token**: A 10-minute timeout token is generated to handle asynchronous webhook callbacks from Replicate
2. **Submit Prediction**: The task sends a prediction request with prompt and source image URL to the nano-banana model
3. **Webhook Callback**: Replicate notifies Trigger.dev upon completion through the webhook URL
4. **Process Output**: The generated image is fetched and converted to a buffer
5. **Upload to R2**: The image is stored in Cloudflare R2 with cache control headers (1-year expiration)
6. **Return Results**: Returns success status, public URL, original prompt, and source image URL

## Required Configuration

Essential environment variables needed:
- `TRIGGER_SECRET_KEY`
- `REPLICATE_API_TOKEN`
- `R2_ENDPOINT`
- `R2_ACCESS_KEY_ID`
- `R2_SECRET_ACCESS_KEY`
- `R2_BUCKET`
- `R2_PUBLIC_URL`

## Technical Details

The implementation uses TypeScript with async/await patterns. The filename is sanitized by removing special characters, and the R2 key incorporates a timestamp for uniqueness. Error handling validates prediction success before processing output.
