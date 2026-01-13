# Generate an Image from a Prompt Using Fal.ai and Trigger.dev Realtime

## Overview

This example demonstrates how to create a task that generates images using Fal.ai's image generation models while displaying real-time progress updates on the frontend through Trigger.dev's Realtime API.

## Key Components

**Task Purpose**: The task accepts an image URL and text prompt, then uses Fal.ai's `flux/dev/image-to-image` model to generate transformed images with live progress tracking.

## Prerequisites

- Existing project setup
- Active Trigger.dev account with initialized integration
- Fal.ai account credentials

## Implementation Details

### Imports Required
```typescript
import * as fal from "@fal-ai/serverless-client";
import { logger, schemaTask } from "@trigger.dev/sdk";
import { z } from "zod";
```

### Schema Definitions

**Output Schema**: Defines the expected Fal.ai response structure containing an images array with URL objects.

**Input Schema**: Requires two fields:
- `imageUrl`: A valid URL pointing to the source image
- `prompt`: Text description for the transformation

### Task Configuration

The `realtimeImageGeneration` task:
- Uses `schemaTask` for type-safe payload handling
- Subscribes to Fal.ai's image-to-image endpoint
- Implements `onQueueUpdate` callback for progress logging
- Parses and validates the response
- Returns the generated image URL

### Progress Tracking

The `onQueueUpdate` handler logs processing updates from Fal.ai, allowing real-time monitoring of image generation progress.

## Testing

The dashboard accepts this example payload:
```json
{
  "imageUrl": "https://static.vecteezy.com/system/resources/previews/005/857/332/non_2x/funny-portrait-of-cute-corgi-dog-outdoors-free-photo.jpg",
  "prompt": "Dress this dog for Christmas"
}
```

## Resources

Full implementation available on [GitHub](https://github.com/triggerdotdev/examples/tree/main/realtime-fal-ai-image-generation). Video walkthrough demonstrates integration within a Next.js project.
