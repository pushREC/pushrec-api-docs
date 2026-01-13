# Uploading Files to Supabase Storage - Trigger.dev

## Overview

The documentation demonstrates "how to upload a video file to Supabase Storage using two different methods."

## Method 1: Supabase Client Upload

This approach uses the Supabase JavaScript client library to handle file uploads directly.

**Key Setup Steps:**
- Initialize a Supabase client with project URL and service role key
- Fetch video content from a provided URL as a buffer
- Upload using the storage API with metadata options

**Code Structure:**
The implementation downloads video data, validates the HTTP response, and uploads with content-type specification. The task returns the object key and bucket name upon successful completion.

**Testing:**
Users can test via the dashboard using a payload with a videoUrl parameter pointing to their source file.

## Method 2: AWS S3 Client Upload

This alternative uses the AWS SDK S3 client configured for Supabase's S3-compatible storage endpoint.

**Configuration Details:**
- S3Client initialization requires region, endpoint URL, and access credentials
- Credentials sourced from Supabase storage S3 access key settings
- Endpoint targets Supabase's S3-compatible API

**Process:**
Fetches video as ArrayBuffer, converts to Buffer, and uploads via PutObjectCommand with bucket and key parameters.

## Additional Resources

The guide references a "Supabase Authentication guide" demonstrating JWT authentication for row-level security and service role key usage.

Related examples include Supabase database operations and other storage integration patterns within the Trigger.dev ecosystem.
