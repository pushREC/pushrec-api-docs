# Product Image Generator using Replicate and Trigger.dev

## Overview
This project demonstrates building an AI-powered product image generator that transforms basic product photos into professional marketing shots. Users upload a product image and receive three professionally styled variations: clean product shots, lifestyle scenes, and hero shots with dramatic lighting.

## Tech Stack
- **Next.js** – frontend React framework
- **Replicate** – AI image generation using the `google/nano-banana` image-to-image model
- **UploadThing** – file upload management and server callbacks
- **Cloudflare R2** – scalable image storage with public URLs

## How It Works
The application uses two main tasks: `generateImages` coordinates batch processing, while `generateImage` handles individual style generation.

Each generation task:
- Enhances prompts with style-specific instructions
- Calls Replicate's `google/nano-banana` image-to-image model
- Creates waitpoint tokens for async webhook handling
- Uploads results to Cloudflare R2
- Displays real-time progress updates via React hooks

Style presets include clean product shots (white background), lifestyle scenes (person holding product), and hero shots (dramatic lighting).

## Key Files
- **Image generation tasks** – `app/trigger/generate-images.ts` (batch processing with waitpoints)
- **Upload handler** – `app/api/uploadthing/core.ts` (triggers batch generation)
- **Real-time progress UI** – `app/components/GeneratedCard.tsx` (live task updates)
- **Custom prompt interface** – `app/components/CustomPromptCard.tsx` (user-defined styles)
- **Main app component** – `app/ProductImageGenerator.tsx` (layout and state management)

## Learning Resources
- Waitpoints for pausing tasks during async webhook callbacks
- React hooks for real-time task updates and frontend integration
- Batch operations for parallel task execution patterns
- Replicate API documentation for AI model integration
- UploadThing documentation for file upload handling
