# LibreOffice PDF Conversion with Trigger.dev

## Overview
This guide demonstrates converting documents (.doc/.docx) to PDF using LibreOffice integrated with Trigger.dev, then uploading results to Cloudflare R2 storage.

## Prerequisites
- Trigger.dev initialized project
- LibreOffice installed locally
- Cloudflare R2 account with bucket access

## Key Setup Step

Add LibreOffice to your build configuration via the `aptGet` extension in `trigger.config.ts`:

```typescript
build: {
  extensions: [
    aptGet({
      packages: ["libreoffice"],
    }),
  ],
}
```

Also add `@trigger.dev/build` as a devDependency.

## Core Functionality

The example task:
1. **Downloads** a document from a provided URL
2. **Converts** it to PDF using LibreOffice
3. **Uploads** the result to R2 storage
4. **Returns** the storage location

## Implementation Details

The task uses:
- `libreoffice-convert` library with promisified conversion
- AWS SDK S3Client for R2 authentication (endpoint, access keys, secret key)
- Temporary file management (input/output paths)
- Environment variable configuration for R2 credentials

## Testing

Provide payload with structure:
```json
{
  "documentUrl": "<document-url>"
}
```

## Local Development

Install LibreOffice on your development machine to test before deployment.
