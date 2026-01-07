---
source: https://developers.google.com/youtube/v3/live/getting-started
scraped: 2026-01-07
api_provider: Google
discovery_tier: 3
verified: false
category: live-streaming
method: webfetch
---
 YouTube Live Streaming API Getting Started Guide

## Overview

The YouTube Live Streaming API enables developers to create, update, and manage live events on YouTube. This API combines components from the YouTube Data API and YouTube Content ID API to facilitate broadcast scheduling, stream management, and ad insertion.

## Core Concepts

### Key Resources

**Broadcasts**: "A broadcast represents an event that can be watched on YouTube as it happens." Broadcasts can be recorded and saved as YouTube videos for later viewing.

**Streams**: A stream carries the actual audio-video content transmitted to YouTube. Each broadcast links to exactly one stream resource.

**Cuepoints**: These resources represent ad breaks that can be inserted during live broadcasts to enable midroll advertising.

## Prerequisites

Before implementing the API, you'll need:

1. **Google Account**: Required to access the Google API Console and request credentials
2. **Application Registration**: Register your application with Google to submit API requests
3. **API Enablement**: Enable YouTube Data API v3 in your Cloud Console (and YouTube Content ID API if you're a Content Partner)
4. **JSON Knowledge**: Familiarity with JSON data format

## Setup Instructions

### Step 1: Register Your Application

Visit the API Console and register your application with Google to enable API request submission.

### Step 2: Enable Required APIs

In your Cloud Console project:
- Ensure YouTube Data API v3 shows status **ON**
- If participating in Content ID, enable YouTube Content ID API

### Step 3: Understand Authorization

**Data API calls** require authorization from the Google Account owning the broadcasting channel.

**Content ID API calls** require authorization from an account linked to the content owner.

## Basic Implementation Concepts

### Resource Parts

The API uses a required `part` parameter that specifies which resource properties to retrieve. For example, a `liveStream` resource includes:
- `snippet`
- `cdn`
- `status`

This approach reduces latency and bandwidth by preventing unnecessary data transfer.

### Key Operations Supported

| Operation | Function |
|-----------|----------|
| `list` | Retrieve resources via GET |
| `insert` | Create new resources via POST |
| `update` | Modify resources via PUT |
| `bind` | Link broadcasts with streams |
| `transition` | Change broadcast status |
| `delete` | Remove resources via DELETE |

## Best Practices

### Content Claiming

"If you would like to show ads during your broadcast, you need to claim the broadcast video before the event begins." This requires YouTube Content Partner status and Content ID program participation.

### Testing Your Content

Enable the monitor stream to preview and test your broadcast privately. The monitor stream allows you to verify content before it reaches your audience.

### Ad Break Insertion

When inserting cuepoints for midroll ads:
- Specify immediate insertion or scheduled time using epoch timestamps
- For delayed broadcasts, use time offset in milliseconds from the monitor stream start
- Account for a 5-second buffer at insertion boundaries where cuepoints cannot be reliably placed

## Troubleshooting

If a broadcast becomes stuck in intermediate statuses like `testStarting` or `liveStarting`, you must delete the broadcast and create a new one. Before transitioning broadcasts, verify that the bound stream's status shows as `active`.

## Additional Resources

- APIs Explorer for testing endpoints
- GitHub repository with code samples
- Stack Overflow (tag: youtube-livestreaming-api) for community support
