# Deepgram Audio Transcription with Trigger.dev

## Overview

This guide demonstrates audio transcription using Deepgram's speech recognition API integrated with Trigger.dev's task framework.

## Key Features

- Transcribe audio files from URLs
- Utilizes the Nova 2 model for transcription
- Supports smart formatting and speaker diarization

## Implementation Details

### Setup Requirements

The implementation requires the Deepgram SDK and Trigger.dev SDK. Initialize the Deepgram client using your API key from environment variables.

### Core Task Structure

The task accepts a payload containing an audio URL and performs the following operations:

1. **Initialization**: Creates a Deepgram client instance authenticated with your secret key
2. **Transcription Request**: Calls the prerecorded transcription endpoint with the audio URL
3. **Configuration Options**:
   - `model`: "nova-2" for optimal speech recognition
   - `smart_format`: Automatically enhances transcription readability
   - `diarize`: Identifies and labels different speakers in the audio

### Error Handling

The implementation includes error checking after the transcription attempt. If an error occurs, it logs the failure and throws the error for handling by the Trigger.dev framework.

### Data Extraction

The transcription result is extracted from nested response structures: `result.results.channels[0].alternatives[0].paragraphs?.transcript`

## Testing

To test functionality in the dashboard, use this payload:

```json
{
  "audioUrl": "https://dpgr.am/spacewalk.wav"
}
```

This example references a public audio file suitable for testing the transcription pipeline without requiring your own audio resources.
