# Convert an Image to a Cartoon Using Fal.ai

## Overview

This example demonstrates how to create a Trigger.dev task that transforms images into cartoon-style artwork using Fal.ai's image-to-image API, then uploads the result to Cloudflare R2 storage.

## Prerequisites

- An existing project with Trigger.dev initialized
- A Fal.ai account with API credentials
- Cloudflare account with an R2 bucket configured
- AWS SDK and Fal.ai client libraries installed

## Key Implementation Details

### Client Setup

The task initializes two clients:

1. **Fal.ai Client**: Configured with your API key from environment variables to access Fal.ai's image transformation capabilities
2. **S3-Compatible Client**: Configured for Cloudflare R2 with region set to "auto" and appropriate credentials for your bucket

### Task Workflow

The implementation follows these steps:

1. **Image Transformation**: Calls Fal.ai's flux/dev/image-to-image endpoint with a prompt requesting Pixar-style cartoon conversion
2. **Progress Tracking**: Logs queue updates during processing via the onQueueUpdate callback
3. **Result Validation**: Uses Zod schema to parse and validate the response structure
4. **Download**: Retrieves the generated cartoon image from the returned URL
5. **Upload**: Stores the image in Cloudflare R2 with appropriate metadata

### Code Structure

The task accepts a payload containing:
- `imageUrl`: Source image URL for processing
- `fileName`: Desired filename for R2 storage

Returns an object with the original URL and confirmation of successful R2 upload.

## Testing

Trigger the task from the Trigger.dev dashboard using test JSON:
```
{"imageUrl": "<your-image-url>", "fileName": "<desired-filename>"}
```

Replace placeholders with actual image URL and your preferred storage filename.
