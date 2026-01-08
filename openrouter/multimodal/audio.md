---
source: https://openrouter.ai/docs/guides/overview/multimodal/audio
scraped: 2026-01-08
---

# Audio Inputs

## Overview

OpenRouter enables audio file submissions to compatible models through the `/api/v1/chat/completions` API endpoint.

**Important:** Audio files must be base64-encoded - direct URLs are not supported for audio content.

## Key Requirements

- Audio inputs require base64 encoding and format specification
- Only models with audio processing capabilities can handle these requests
- Identify compatible models by visiting the Models page and filtering for audio input modality

## Implementation Examples

### TypeScript SDK

```typescript
import OpenRouter from '@openrouter/sdk';
import fs from 'fs';

const client = new OpenRouter();

async function processAudio() {
  const audioBuffer = fs.readFileSync('audio.mp3');
  const base64Audio = audioBuffer.toString('base64');

  const response = await client.chat.completions.create({
    model: 'google/gemini-2.0-flash-001',
    messages: [
      {
        role: 'user',
        content: [
          {
            type: 'text',
            text: 'Transcribe this audio file'
          },
          {
            type: 'input_audio',
            input_audio: {
              data: base64Audio,
              format: 'mp3'
            }
          }
        ]
      }
    ]
  });

  return response;
}
```

### Python

```python
import base64
import requests

# Read and encode the audio file
with open('audio.mp3', 'rb') as audio_file:
    base64_audio = base64.b64encode(audio_file.read()).decode('utf-8')

response = requests.post(
    'https://openrouter.ai/api/v1/chat/completions',
    headers={
        'Authorization': 'Bearer YOUR_API_KEY',
        'Content-Type': 'application/json'
    },
    json={
        'model': 'google/gemini-2.0-flash-001',
        'messages': [
            {
                'role': 'user',
                'content': [
                    {
                        'type': 'text',
                        'text': 'Transcribe this audio file'
                    },
                    {
                        'type': 'input_audio',
                        'input_audio': {
                            'data': base64_audio,
                            'format': 'mp3'
                        }
                    }
                ]
            }
        ]
    }
)
```

## Supported Audio Formats

| Format | Extension |
|--------|-----------|
| WAV | `.wav` |
| MP3 | `.mp3` |
| AIFF | `.aiff` |
| AAC | `.aac` |
| OGG Vorbis | `.ogg` |
| FLAC | `.flac` |
| M4A | `.m4a` |
| PCM16 | `.pcm` |
| PCM24 | `.pcm` |

**Note:** Check your model's documentation to confirm which audio formats it supports. Not all models support all formats.
