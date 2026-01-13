# Generate OG Images using Satori - Trigger.dev

## Overview

This example demonstrates using Trigger.dev to create dynamic Open Graph images with Vercel's Satori library. The task accepts a title and image URL, then produces a stylized OG image with text overlay. The implementation is fully customizable, with comprehensive options available in the Satori documentation.

## Task Implementation

The core task uses `schemaTask` to define input parameters:

- **width**: Optional number (defaults to 1200)
- **height**: Optional number (defaults to 630)
- **title**: Required string for the overlay text
- **imageUrl**: Required URL string for the background image

### Key Steps

1. **Font Loading**: Downloads Roboto font from Google Fonts repository
2. **Image Processing**: Fetches the background image and converts it to base64 format
3. **Markup Generation**: Creates JSX markup with positioned text overlay on the image
4. **SVG Rendering**: Uses Satori to convert the markup to SVG
5. **Image Conversion**: Converts SVG to JPEG using Sharp with 90% quality and MozJPEG compression
6. **File Storage**: Saves the generated image to a temporary directory

### Technical Stack

- `@trigger.dev/sdk` for task definition
- `satori` for converting JSX to SVG
- `sharp` for image format conversion
- Standard Node.js file system operations

## Testing Payload

To test in the Trigger.dev dashboard, use this payload structure:

```json
{
  "title": "My Awesome OG image",
  "imageUrl": "<your-image-url>",
  "width": 1200,
  "height": 630
}
```

The width and height parameters are optional and will default to standard OG image dimensions if omitted.

## Output

The task returns an object containing:
- **filePath**: Location of the generated JPEG file
- **width**: Dimensions used for generation
- **height**: Dimensions used for generation
