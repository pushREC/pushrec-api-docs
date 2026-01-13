# Next.js Realtime CSV Importer - Trigger.dev

## Overview

This example demonstrates building a CSV uploader with real-time progress updates. The frontend is a Next.js application allowing users to upload CSV files, which are processed in the background using Trigger.dev tasks. Progress streams back to the frontend via Trigger.dev Realtime.

## Technology Stack

The project combines:
- **Next.js** for the frontend application
- **Trigger.dev** for background task processing
- **UploadThing** for handling CSV file uploads
- **Trigger.dev Realtime** for streaming updates to the frontend

## Architecture

The system operates through a parent-child task structure:

**Parent Task (`csvValidator`):**
- Downloads the CSV file from the upload service
- Parses the CSV data
- Divides rows into batches for parallel processing
- Uses `batch.triggerAndWait` to distribute work across child tasks

**Child Task (`handleCSVRow`):**
- Validates individual rows (simulating email address verification)
- Updates parent task progress using `metadata.parent`
- Reports validation results back to the orchestrating task

## Frontend Integration

The `useRealtimeCSVValidator` hook manages real-time connections by calling `useRealtimeRun` to subscribe to parent task updates. The `CSVProcessor` component handles file uploads and displays a progress indicator, leveraging the custom hook for live status updates.

## Key Features

- Real-time progress visibility
- Batch processing for scalability
- Parent-child task coordination
- Live frontend updates without polling

## Resources

For deeper understanding, explore: [Trigger.dev Realtime documentation](/realtime), [batch triggering details](/triggering#tasks-batchtrigger), and [React hooks guide](/realtime/react-hooks).
