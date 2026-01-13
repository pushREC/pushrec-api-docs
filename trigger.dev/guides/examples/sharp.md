# Process Images Using Sharp - Trigger.dev Documentation

## Overview

This example demonstrates image processing using the Sharp library with Trigger.dev, including resizing JPEG images to 800x800 pixels, adding watermarks in the bottom-right corner using PNG images, and uploading results to R2 storage.

## Prerequisites

- A Trigger.dev initialized project
- The Sharp library installed locally
- An R2-compatible object storage service (such as Cloudflare R2)

## Build Configuration

Add these settings to your `trigger.config.ts` file:

```typescript
import { defineConfig } from "@trigger.dev/sdk";

export default defineConfig({
  project: "<project ref>",
  // Your other config settings...
  build: {
    // This is required to use the Sharp library
    external: ["sharp"],
  },
});
```

**Important:** Packages installing native binaries cannot be bundled and must be added to the external array.

## Key Features

- Resizes JPEG images to 800x800 pixels
- Adds watermarks positioned in bottom-right corner using PNG images
- Uploads processed images to R2 storage

## Task Implementation

The task imports necessary AWS SDK modules, initializes an R2 client with credentials from environment variables, fetches both image and watermark from URLs, processes them using Sharp's resize and composite methods, converts to JPEG format, uploads to R2, and cleans up temporary files.

## Testing

Use this payload structure in the dashboard:

```json
{
  "imageUrl": "<an-image-url.jpg>",
  "watermarkUrl": "<an-image-url.png>"
}
```

Replace URLs with actual JPEG image and PNG watermark image locations.

## Local Development

Install the Sharp library on your local machine to test this example before deployment.
