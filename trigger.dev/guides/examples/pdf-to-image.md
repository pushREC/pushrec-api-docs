# Turn a PDF into an Image Using MuPDF - Trigger.dev Documentation

## Overview
This example demonstrates converting PDFs into image series using MuPDF and uploading results to Cloudflare R2 via Trigger.dev.

## Build Configuration Setup

You must add build settings to `trigger.config.ts` to ensure required packages install during deployment:

```typescript
export default defineConfig({
  project: "<project ref>",
  build: {
    extensions: [aptGet({ packages: ["mupdf-tools", "curl"] })]
  },
});
```

The `mupdf-tools` package enables PDF conversion, while `curl` facilitates file downloads.

## Task Implementation

The task accepts a PDF URL and document identifier, then:

1. **Downloads** the PDF using curl
2. **Converts** pages to PNG images via mutool
3. **Uploads** images to Cloudflare R2
4. **Cleans up** temporary files
5. **Returns** signed S3 URLs

Key implementation details:
- Uses S3Client from AWS SDK configured for R2 endpoint
- Creates output directory for converted images
- Iterates through generated files for uploading
- Implements proper error handling and logging

## Testing

Use this payload in the dashboard:
```json
{
  "pdfUrl": "https://pdfobject.com/pdf/sample.pdf",
  "documentId": "unique-document-id"
}
```

## Local Development

Install `mupdf-tools` locally to test before deployment.
