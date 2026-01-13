# Generate a PDF using react-pdf and save it to R2

## Overview

This example demonstrates using Trigger.dev to generate a PDF with `react-pdf` and save it to Cloudflare R2.

## Task Implementation

The task must use a `.tsx` file to support React components.

**File: `trigger/generateResumePDF.tsx`**

### Key Components:

1. **R2 Client Setup**
   - Initialize S3Client with R2 credentials from environment variables
   - Required env vars: `R2_ENDPOINT`, `R2_ACCESS_KEY_ID`, `R2_SECRET_ACCESS_KEY`
   - Region set to "auto" for R2 compatibility

2. **PDF Generation**
   - Use `renderToBuffer()` from `@react-pdf/renderer`
   - Create Document with Page and View components
   - Render text payload into the PDF structure

3. **File Management**
   - Generate unique filename combining text and timestamp
   - Convert spaces to hyphens, lowercase formatting
   - Store in `resumes/` directory within R2 bucket

4. **Upload Process**
   - Create upload parameters with Bucket, Key, Body, and ContentType
   - Use `PutObjectCommand` to send to R2
   - Return bucket and key for reference

### Required Dependencies:
- `@trigger.dev/sdk`
- `@react-pdf/renderer`
- `@aws-sdk/client-s3`

## Testing

Use this payload in the dashboard:
```json
{
  "text": "Hello, world!"
}
```

The task processes the input text, renders it as a PDF, generates a timestamped filename, and uploads to R2, returning the storage location details.
