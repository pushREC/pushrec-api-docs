---
source: 'FAL.ai official documentation (synthesized from https://fal.ai/docs)'
scraped: 2025-12-29
api_provider: FAL.ai
discovery_tier: 3
verified: false
title: "FAL.ai Audio & TTS Models - Comprehensive API Reference"
---
 FAL.ai Audio & TTS Models - Comprehensive API Reference

> **Research Agent:** Round 2 - Gap-Filling
> **Topic:** Audio, Text-to-Speech, Speech-to-Text, Music Generation, Voice Cloning
> **Created:** 2025-12-29
> **Words:** ~7,500
> **Status:** Complete

---

## Executive Summary

FAL.ai provides a comprehensive suite of audio AI models accessible through a unified API infrastructure. This documentation covers all text-to-speech (TTS), speech-to-text (STT), audio generation, voice cloning, and streaming audio capabilities available on the platform. With 30+ audio models and enterprise-grade infrastructure, FAL.ai offers developers the tools needed to build sophisticated audio-enabled SaaS applications.

---

## Table of Contents

1. [Platform Overview](#1-platform-overview)
2. [Text-to-Speech Models](#2-text-to-speech-models)
3. [Speech-to-Text Models](#3-speech-to-text-models)
4. [Audio Generation Models](#4-audio-generation-models)
5. [Voice Cloning Capabilities](#5-voice-cloning-capabilities)
6. [Audio Processing & Enhancement](#6-audio-processing--enhancement)
7. [Streaming Audio & WebSocket Integration](#7-streaming-audio--websocket-integration)
8. [Pricing Reference](#8-pricing-reference)
9. [Code Examples](#9-code-examples)
10. [Best Practices](#10-best-practices)

---

## Related Documentation

- [[agent-01-core-api#authentication|Core API Authentication]]
- [[agent-02-javascript-sdk#streaming|JavaScript SDK Streaming]]
- [[agent-03-python-sdk#async-patterns|Python SDK Async Patterns]]
- [[agent-06-streaming-queues#websocket|WebSocket Integration]]
- [[agent-08-billing-usage#pricing|Billing & Usage]]

---

## 1. Platform Overview

### API Infrastructure

FAL.ai's audio infrastructure provides:

- **No Cold Starts:** Models remain warm for instant response
- **GPU Options:** H100, A100, L40S for audio processing
- **Global Regions:** eu-north, eu-west, us-west, us-central, us-east
- **Queue-Based Processing:** Async requests with webhook support
- **Streaming Support:** Real-time audio generation via WebSocket

### Authentication

```bash
export FAL_KEY="YOUR_API_KEY"
```

```javascript
import { fal } from "@fal-ai/client";
fal.config({ credentials: "YOUR_FAL_KEY" });
```

```python
import fal_client
import os
os.environ["FAL_KEY"] = "your-api-key"
```

---

## 2. Text-to-Speech Models

### 2.1 ElevenLabs Integration

FAL.ai has partnered with ElevenLabs to bring their complete audio AI suite to the platform.

#### ElevenLabs Eleven-v3

**Endpoint:** `fal-ai/elevenlabs/tts/eleven-v3`

**Description:** Flagship model with natural prosody and emotional expressiveness.

**Input Parameters:**

| Parameter | Type | Required | Default | Range | Description |
|-----------|------|----------|---------|-------|-------------|
| `text` | string | Yes | - | 1-5000 chars | Text to convert |
| `voice` | string | No | "Rachel" | See list | Voice selection |
| `stability` | float | No | 0.5 | 0-1 | Voice consistency |
| `similarity_boost` | float | No | 0.75 | 0-1 | Speaker similarity |
| `style` | float | No | 0 | 0-1 | Style exaggeration |
| `speed` | float | No | 1 | 0.7-1.2 | Speech rate |
| `timestamps` | boolean | No | false | - | Word-level timing |
| `language_code` | string | No | - | ISO 639-1 | Language enforcement |

**Available Voices:** Aria, Roger, Sarah, Laura, Charlie, George, Callum, River, Liam, Charlotte, Alice, Matilda, Will, Jessica, Eric, Chris, Brian, Daniel, Lily, Bill, Rachel

**Output:** MP3 audio file

**Pricing:** $0.10 per 1,000 characters

```javascript
const result = await fal.subscribe("fal-ai/elevenlabs/tts/eleven-v3", {
  input: {
    text: "Hello! This is a test of ElevenLabs text-to-speech.",
    voice: "Aria",
    stability: 0.5,
    similarity_boost: 0.75,
    speed: 1
  }
});
console.log(result.data.audio.url);
```

```python
result = fal_client.subscribe(
    "fal-ai/elevenlabs/tts/eleven-v3",
    arguments={
        "text": "Hello! This is a test.",
        "voice": "Aria",
        "stability": 0.5
    }
)
print(result["audio"]["url"])
```

```bash
curl -X POST "https://fal.run/fal-ai/elevenlabs/tts/eleven-v3" \
  -H "Authorization: Key $FAL_KEY" \
  -H "Content-Type: application/json" \
  -d '{"text": "Hello!", "voice": "Aria", "speed": 1}'
```

---

#### ElevenLabs TTS Turbo v2.5

**Endpoint:** `fal-ai/elevenlabs/tts/turbo-v2.5`

**Description:** High-quality TTS with lowest latency, optimized for real-time applications.

**Key Differences:**
- Lower latency for real-time applications
- Supports 32 languages
- Half the cost of Eleven-v3

**Pricing:** $0.05 per 1,000 characters

```javascript
const result = await fal.subscribe("fal-ai/elevenlabs/tts/turbo-v2.5", {
  input: {
    text: "Fast, low-latency speech generation.",
    voice: "Roger",
    speed: 1.1
  }
});
```

---

#### ElevenLabs TTS Multilingual v2

**Endpoint:** `fal-ai/elevenlabs/tts/multilingual-v2`

**Description:** Exceptional stability across 29 languages with remarkable accent accuracy.

**Supported Languages:** English, Spanish, French, German, Italian, Portuguese, Polish, Hindi, Arabic, Chinese, Japanese, Korean, Dutch, Swedish, Norwegian, Danish, Finnish, Greek, Turkish, Russian, Ukrainian, Czech, Romanian, Hungarian, and more.

**Pricing:** $0.10 per 1,000 characters

---

### 2.2 MiniMax TTS Models

MiniMax offers industry-leading TTS with streaming support for up to 5,000 characters real-time or 1 million characters asynchronously.

#### MiniMax Speech-02 HD

**Endpoint:** `fal-ai/minimax/speech-02-hd`

**Description:** High-definition voice synthesis with lifelike expressions across 30+ languages and 300+ voices.

**Input Parameters:**

| Parameter | Type | Required | Default | Description |
|-----------|------|----------|---------|-------------|
| `text` | string | Yes | - | Text with pause markers `<#x#>` |
| `voice_setting.voice_id` | string | No | - | Predefined voice ID |
| `voice_setting.speed` | float | No | 1 | 0.5-2.0 |
| `voice_setting.vol` | float | No | - | 0-10 |
| `voice_setting.pitch` | float | No | - | -12 to 12 |
| `voice_setting.emotion` | enum | No | neutral | happy, sad, angry, fearful, disgusted, surprised, neutral |
| `english_normalization` | boolean | No | false | Improves number reading |
| `language` | enum | No | auto | 30+ languages |

**Pause Markers:** `<#x#>` where x is pause duration in seconds (0.01-99.99)

**Pricing:** $0.10 per 1,000 characters

**Supported Languages:** Chinese, Cantonese, English, Arabic, Russian, Spanish, French, Portuguese, German, Turkish, Dutch, Ukrainian, Vietnamese, Indonesian, Japanese, Italian, Korean, Thai, Polish, Romanian, Greek, Czech, Finnish, Hindi, Bulgarian, Danish, Hebrew, Malay, Slovak, Swedish, Croatian, Hungarian, Norwegian, Slovenian, Catalan, Afrikaans

---

#### MiniMax Speech-02 Turbo

**Endpoint:** `fal-ai/minimax/speech-02-turbo`

**Description:** Optimized for real-time applications with lower latency.

---

### 2.3 Kokoro TTS

**Description:** Lightweight 82M parameter model running efficiently on CPU with quality comparable to larger models.

**Language-Specific Endpoints:**

| Language | Endpoint |
|----------|----------|
| American English | `fal-ai/kokoro/american-english` |
| British English | `fal-ai/kokoro/british-english` |
| Japanese | `fal-ai/kokoro/japanese` |
| French | `fal-ai/kokoro/french` |
| Spanish | `fal-ai/kokoro/spanish` |
| Hindi | `fal-ai/kokoro/hindi` |
| Italian | `fal-ai/kokoro/italian` |
| Mandarin Chinese | `fal-ai/kokoro/mandarin-chinese` |
| Brazilian Portuguese | `fal-ai/kokoro/brazilian-portuguese` |

**Input Parameters:**

| Parameter | Type | Required | Default | Range | Description |
|-----------|------|----------|---------|-------|-------------|
| `prompt` | string | No | "" | - | Text to convert |
| `voice` | enum | No | "af_heart" | See list | Voice ID |
| `speed` | float | No | 1.0 | 0.1-5.0 | Audio speed |

**Voice Options (American English):**

*Female:* af_heart, af_alloy, af_aoede, af_bella, af_jessica, af_kore, af_nicole, af_nova, af_river, af_sarah, af_sky

*Male:* am_adam, am_echo, am_eric, am_fenrir, am_liam, am_michael, am_onyx, am_puck, am_santa

**Output:** WAV audio file

**Pricing:** $0.02 per 1,000 characters

```javascript
const result = await fal.subscribe("fal-ai/kokoro/american-english", {
  input: {
    prompt: "The future belongs to those who believe in their dreams.",
    voice: "af_heart",
    speed: 1
  }
});
```

---

### 2.4 Dia TTS

**Endpoint:** `fal-ai/dia-tts`

**Description:** 1.6 billion parameter model for realistic dialogue synthesis with emotion control.

**Key Features:**
- Multi-speaker conversations using [S1], [S2] tags
- Natural nonverbals: laughter, throat clearing, sighing
- Audio conditioning for emotion control
- Studio-quality voice output

**Input Parameters:**

| Parameter | Type | Required | Description |
|-----------|------|----------|-------------|
| `text` | string | Yes | Text with speaker tags ([S1], [S2]) |

**Pricing:** $0.04 per 1,000 characters

```javascript
const result = await fal.subscribe("fal-ai/dia-tts", {
  input: {
    text: "[S1] Dia is an open weights model. [S2] Try it now!"
  }
});
```

---

### 2.5 Orpheus TTS

**Endpoint:** `fal-ai/orpheus-tts`

**Description:** Llama-based Speech-LLM for high-quality, empathetic TTS.

**Input Parameters:**

| Parameter | Type | Required | Default | Range | Description |
|-----------|------|----------|---------|-------|-------------|
| `text` | string | Yes | - | - | Text with optional emotive tags |
| `voice` | enum | No | "tara" | See list | Voice selection |
| `temperature` | float | No | 0.7 | 0-2 | Generation creativity |
| `repetition_penalty` | float | No | 1.2 | 1.1-2 | Prevents repetition |

**Emotive Tags:** `<laugh>`, `<chuckle>`, `<sigh>`, `<cough>`, `<sniffle>`, `<groan>`, `<yawn>`, `<gasp>`

**Voice Options:** tara, leah, jess, leo, dan, mia, zac, zoe

**Output:** WAV audio file

**Pricing:** $0.05 per 1,000 characters

```javascript
const result = await fal.subscribe("fal-ai/orpheus-tts", {
  input: {
    text: "I just found a hidden treasure! <gasp> Check it out!",
    voice: "tara",
    temperature: 0.7
  }
});
```

---

### 2.6 Maya1 TTS

**Endpoint:** `fal-ai/maya`

**Description:** 3B parameter model for expressive voice with 20+ emotions. Create voices by describing them in natural language.

**Input Parameters:**

| Parameter | Type | Required | Default | Range | Description |
|-----------|------|----------|---------|-------|-------------|
| `text` | string | Yes | - | 0-5000 chars | Text with emotion tags |
| `prompt` | string | Yes | - | 0-500 chars | Voice description |
| `temperature` | float | No | 0.4 | 0-2 | Stability vs. variation |
| `top_p` | float | No | 0.9 | 0-1 | Token diversity |
| `max_tokens` | integer | No | 2000 | 28-4000 | SNAC tokens |
| `repetition_penalty` | float | No | 1.1 | 1-2 | Reduces artifacts |
| `sample_rate` | enum | No | "48 kHz" | 24/48 kHz | Output quality |
| `output_format` | enum | No | - | wav/mp3/pcm | File format |

**Supported Emotions:** laugh, laugh_harder, sigh, chuckle, gasp, angry, excited, whisper, cry, scream, sing, snort, exhale, gulp, giggle, sarcastic, curious

**Emotion Tag Syntax:** `<excited>This is amazing!`

**Pricing:** $0.002 per generated audio second

```javascript
const result = await fal.subscribe("fal-ai/maya", {
  input: {
    text: "<excited>This is absolutely amazing news!",
    prompt: "Realistic male voice in 30s, American accent, warm timbre, enthusiastic"
  }
});
```

---

### 2.7 Chatterbox Models

#### Chatterbox Turbo

**Endpoint:** `fal-ai/chatterbox/text-to-speech/turbo`

**Description:** Ultra-fast TTS with sub-150ms time to first sound. 350M parameter model.

**Input Parameters:**

| Parameter | Type | Required | Default | Range | Description |
|-----------|------|----------|---------|-------|-------------|
| `text` | string | Yes | - | - | Text with paralinguistic tags |
| `voice` | string | No | "lucy" | See list | Preset voice |
| `audio_url` | string | No | - | - | Custom voice sample (5-10s) |
| `temperature` | float | No | 0.8 | 0.05-2.0 | Speech variation |
| `seed` | integer | No | - | - | Reproducibility |

**Paralinguistic Tags:** [clear throat], [sigh], [shush], [cough], [groan], [sniff], [gasp], [chuckle], [laugh]

**Voice Options:** aaron, abigail, anaya, andy, archer, brian, chloe, dylan, emmanuel, ethan, evelyn, gavin, gordon, ivan, laura, lucy, madison, marisol, meera, walter

**Pricing:** $0.02 per 1,000 characters

```javascript
const result = await fal.subscribe("fal-ai/chatterbox/text-to-speech/turbo", {
  input: {
    text: "Oh, that's hilarious! [chuckle] This is amazing!"
  }
});
```

---

#### Chatterbox Multilingual

**Endpoint:** `fal-ai/chatterbox/text-to-speech/multilingual`

**Description:** Multilingual TTS supporting 23 languages with paralinguistic control.

**Supported Languages:** English, Arabic, Danish, German, Greek, Spanish, Finnish, French, Hebrew, Hindi, Italian, Japanese, Korean, Malay, Dutch, Norwegian, Polish, Portuguese, Russian, Swedish, Swahili, Turkish, Chinese

**Input Parameters:**

| Parameter | Type | Required | Default | Range | Description |
|-----------|------|----------|---------|-------|-------------|
| `text` | string | Yes | - | 0-300 chars | Text to convert |
| `voice` | string | No | "english" | Language code | Language selection |
| `exaggeration` | float | No | 0.5 | 0.25-2.0 | Expressiveness |
| `temperature` | float | No | 0.8 | 0.05-5.0 | Variation |
| `cfg_scale` | float | No | 0.5 | 0-1 | Guidance |

**Pricing:** $0.025 per 1,000 characters

---

#### Chatterbox HD (Resemble AI)

**Endpoint:** `resemble-ai/chatterboxhd/text-to-speech`

**Description:** High-fidelity TTS with emotion control, instant voice cloning, and built-in watermarking.

**Input Parameters:**

| Parameter | Type | Required | Default | Range | Description |
|-----------|------|----------|---------|-------|-------------|
| `text` | string | No | Default | - | Text to synthesize |
| `voice` | enum | No | - | See list | Preset voice |
| `audio_url` | string | No | - | - | Zero-shot cloning |
| `exaggeration` | float | No | 0.5 | 0.25-2.0 | Emotion intensity |
| `cfg` | float | No | 0.5 | 0-1 | CFG guidance |
| `high_quality_audio` | boolean | No | false | - | Upscale to 48kHz |
| `temperature` | float | No | 0.8 | 0.05-5 | Variation |

**Voice Options:** Aurora, Blade, Britney, Carl, Cliff, Richard, Rico, Siobhan, Vicky

**Pricing:** $0.04 per 1,000 characters

---

### 2.8 VibeVoice (Microsoft TTS)

**Endpoint:** `fal-ai/vibevoice`

**Description:** Multi-speaker long-form speech synthesis.

**Input Parameters:**

| Parameter | Type | Required | Description |
|-----------|------|----------|-------------|
| `script` | string | Yes | Text with "Speaker X:" prefixes |
| `speakers` | array | Yes | Speaker configurations |
| `seed` | integer | No | Random seed |
| `cfg_scale` | float | No | 1-2, default 1.3 |

**Voice Presets:** Alice [EN], Carter [EN], Frank [EN], Mary [EN], Maya [EN], Anchen [ZH], Bowen [ZH], Xinran [ZH]

**Pricing:** $0.04 per generated minute (rounded to 15 seconds)

```javascript
const result = await fal.subscribe("fal-ai/vibevoice", {
  input: {
    script: "Speaker 0: VibeVoice is now available.\nSpeaker 1: That's exciting!",
    speakers: [
      { preset: "Frank [EN]" },
      { preset: "Carter [EN]" }
    ]
  }
});
```

---

### 2.9 Index TTS 2.0

**Endpoint:** `fal-ai/index-tts-2/text-to-speech`

**Description:** Emotional TTS with fine-grained control over 8 emotion parameters.

**Input Parameters:**

| Parameter | Type | Required | Default | Description |
|-----------|------|----------|---------|-------------|
| `audio_url` | string | Yes | - | Reference audio for voice |
| `prompt` | string | Yes | - | Speech text |
| `emotional_audio_url` | string | No | - | Emotional style reference |
| `strength` | float | No | 1.0 | Emotional influence (0-1) |
| `emotional_strengths` | object | No | - | Per-emotion controls |
| `should_use_prompt_for_emotion` | boolean | No | false | Use text for emotion |
| `emotion_prompt` | string | No | - | Emotional style prompt |

**Emotional Strengths Object:**

| Emotion | Type | Default | Range |
|---------|------|---------|-------|
| happy | float | 0 | 0-1 |
| angry | float | 0 | 0-1 |
| sad | float | 0 | 0-1 |
| afraid | float | 0 | 0-1 |
| disgusted | float | 0 | 0-1 |
| melancholic | float | 0 | 0-1 |
| surprised | float | 0 | 0-1 |
| calm | float | 0 | 0-1 |

**Pricing:** $0.002 per generated audio second

---

### 2.10 PlayAI Dialog TTS

**Endpoint:** `fal-ai/playai/tts/dialog`

**Description:** Multi-speaker conversational TTS with 350ms latency, 60+ voices.

**Pricing:** $0.05 per audio minute ($1 for 20 minutes)

---

## 3. Speech-to-Text Models

### 3.1 Whisper

**Endpoint:** `fal-ai/whisper`

**Description:** OpenAI's Whisper large model for speech transcription and translation.

**Input Parameters:**

| Parameter | Type | Required | Default | Description |
|-----------|------|----------|---------|-------------|
| `audio_url` | string | Yes | - | Audio URL (mp3, mp4, m4a, wav, webm) |
| `task` | enum | No | "transcribe" | transcribe or translate |
| `language` | enum | No | auto | ISO language code (80+) |
| `diarize` | boolean | No | false | Speaker identification |
| `chunk_level` | enum | No | "segment" | none, segment, or word |
| `version` | enum | No | "3" | Whisper large variant |
| `batch_size` | integer | No | 64 | 1-64 |
| `prompt` | string | No | "" | Generation prompt |
| `num_speakers` | integer | No | auto | Number of speakers |

**Output Schema:**

```json
{
  "text": "Full transcription text",
  "chunks": [
    {
      "text": "segment text",
      "timestamp": [0.0, 2.5],
      "speaker_id": "SPEAKER_00"
    }
  ],
  "inferred_languages": ["en"],
  "diarization_segments": []
}
```

**Pricing:** Compute seconds (GPU-H100)

```javascript
const result = await fal.subscribe("fal-ai/whisper", {
  input: {
    audio_url: "https://example.com/audio.mp3",
    diarize: true,
    chunk_level: "word"
  }
});
```

---

### 3.2 Wizper (Whisper v3 - FAL.ai Edition)

**Endpoint:** `fal-ai/wizper`

**Description:** Optimized Whisper v3 Large - same WER, double the performance.

**Additional Parameters:**

| Parameter | Type | Default | Description |
|-----------|------|---------|-------------|
| `max_segment_len` | integer | 29 | Max segment duration (10-29s) |
| `merge_chunks` | boolean | true | Merge consecutive chunks |

**Pricing:** Compute seconds (GPU-A100)

---

### 3.3 ElevenLabs Speech to Text

**Endpoint:** `fal-ai/elevenlabs/speech-to-text`

**Description:** High-accuracy transcription with word-level timestamps, supporting 99 languages.

**Input Parameters:**

| Parameter | Type | Required | Default | Description |
|-----------|------|----------|---------|-------------|
| `audio_url` | string | Yes | - | Audio file URL |
| `language_code` | string | No | - | Language specification |
| `tag_audio_events` | boolean | No | true | Tag laughter, applause, etc. |
| `diarize` | boolean | No | true | Speaker annotation |

**Output Schema:**

```json
{
  "text": "Full transcription",
  "language_code": "en",
  "language_probability": 0.98,
  "words": [
    {
      "text": "Hello",
      "start": 0.0,
      "end": 0.5,
      "type": "word",
      "speaker_id": "SPEAKER_01"
    }
  ]
}
```

**Pricing:** $0.03 per minute

---

## 4. Audio Generation Models

### 4.1 ElevenLabs Sound Effects

**Endpoint:** `fal-ai/elevenlabs/sound-effects`

**Description:** Text-to-sound effects for videos, games, and audio production.

**Input Parameters:**

| Parameter | Type | Required | Default | Range | Description |
|-----------|------|----------|---------|-------|-------------|
| `text` | string | Yes | - | - | Sound effect description |
| `duration_seconds` | float | No | auto | 0.5-22 | Duration |
| `prompt_influence` | float | No | 0.3 | 0-1 | Prompt adherence |
| `output_format` | enum | No | mp3_44100_128 | See list | Audio format |

**Output Formats:** mp3_22050_32, mp3_44100_32, mp3_44100_64, mp3_44100_96, mp3_44100_128, mp3_44100_192, pcm_8000, pcm_16000, pcm_22050, pcm_24000, pcm_44100, pcm_48000, ulaw_8000, alaw_8000, opus_48000_32, opus_48000_64, opus_48000_96, opus_48000_128, opus_48000_192

**Pricing:** $0.002 per second

```javascript
const result = await fal.subscribe("fal-ai/elevenlabs/sound-effects", {
  input: {
    text: "Spacious braam suitable for high-impact movie trailer moments"
  }
});
```

---

### 4.2 Stable Audio 2.5

**Endpoint:** `fal-ai/stable-audio-25/text-to-audio`

**Description:** Generate high-quality music and sound effects up to 3 minutes.

**Input Parameters (Text-to-Audio):**

| Parameter | Type | Required | Default | Range | Description |
|-----------|------|----------|---------|-------|-------------|
| `prompt` | string | Yes | - | - | Audio description |
| `seconds_total` | integer | No | 190 | 1-190 | Duration |
| `num_inference_steps` | integer | No | 8 | 4-8 | Denoising steps |
| `guidance_scale` | integer | No | 1 | 1-25 | Prompt adherence |
| `seed` | integer | No | random | - | Reproducibility |

**Additional Endpoints:**
- Audio-to-Audio: `fal-ai/stable-audio-25/audio-to-audio`
- Inpaint: `fal-ai/stable-audio-25/inpaint`

**Pricing:** $0.20 per audio generation

```javascript
const result = await fal.subscribe("fal-ai/stable-audio-25/text-to-audio", {
  input: {
    prompt: "A beautiful piano arpeggio grows into a grand orchestral climax",
    seconds_total: 60
  }
});
```

---

### 4.3 Stable Audio Open

**Endpoint:** `fal-ai/stable-audio`

**Description:** Open-source text-to-audio model for music and sounds.

**Input Parameters:**

| Parameter | Type | Default | Range | Description |
|-----------|------|---------|-------|-------------|
| `prompt` | string | - | - | Audio description |
| `seconds_start` | integer | 0 | 0-47 | Start point |
| `seconds_total` | integer | 30 | 0-47 | Duration |
| `steps` | integer | 100 | 1-1000 | Denoising steps |

**Pricing:** Free tier / compute seconds

---

### 4.4 ACE-Step Music Generation

**Endpoint:** `fal-ai/ace-step`

**Description:** Foundation model for music - generates up to 4 minutes in 20 seconds on A100 GPU.

**Input Parameters (Text-to-Audio):**

| Parameter | Type | Required | Default | Range | Description |
|-----------|------|----------|---------|-------|-------------|
| `tags` | string | Yes | - | - | Comma-separated genre tags |
| `lyrics` | string | No | "" | - | Lyrics ([inst] for instrumental) |
| `duration` | float | No | 60 | 5-240 | Duration in seconds |
| `number_of_steps` | integer | No | 27 | 3-60 | Generation steps |
| `scheduler` | enum | No | euler | euler/heun | Scheduler type |
| `guidance_type` | enum | No | apg | cfg/apg/cfg_star | Guidance type |
| `guidance_scale` | float | No | 15 | 0-200 | Guidance strength |
| `tag_guidance_scale` | float | No | 5 | 0-10 | Tag influence |
| `lyric_guidance_scale` | float | No | 1.5 | 0-10 | Lyric influence |

**Lyrics Structure Tags:** [verse], [chorus], [bridge], [inst], [instrumental]

**Pricing:** $0.0002 per second of generated audio ($1 = 83 minutes)

```javascript
const result = await fal.subscribe("fal-ai/ace-step", {
  input: {
    tags: "lofi, hiphop, chill, ambient",
    lyrics: "[verse]\nWalking through the city lights\n[chorus]\nFeeling alive tonight",
    duration: 120
  }
});
```

---

### 4.5 ACE-Step Audio-to-Audio

**Endpoint:** `fal-ai/ace-step/audio-to-audio`

**Description:** Edit and remix existing audio with lyrics and style changes.

**Additional Parameters:**

| Parameter | Type | Required | Description |
|-----------|------|----------|-------------|
| `audio_url` | string | Yes | Source audio URL |
| `original_tags` | string | Yes | Source genre tags |
| `original_lyrics` | string | No | Source lyrics |
| `edit_mode` | enum | No | "lyrics" or "remix" |

**Pricing:** $0.0002 per second

---

### 4.6 MMAudio V2

**Endpoint:** `fal-ai/mmaudio-v2/text-to-audio`

**Description:** Generate synchronized audio from text prompts.

**Input Parameters:**

| Parameter | Type | Required | Default | Range | Description |
|-----------|------|----------|---------|-------|-------------|
| `prompt` | string | Yes | - | - | Audio description |
| `negative_prompt` | string | No | "" | - | What to avoid |
| `duration` | float | No | 8 | 1-30 | Duration |
| `num_steps` | integer | No | 25 | 4-50 | Generation steps |
| `cfg_strength` | float | No | 4.5 | 0-20 | Guidance strength |
| `seed` | integer | No | random | 0-65535 | Reproducibility |

**Pricing:** $0.001 per second

---

## 5. Voice Cloning Capabilities

### 5.1 F5-TTS Voice Cloning

**Endpoint:** `fal-ai/f5-tts`

**Description:** Zero-shot voice cloning using a short reference audio clip (3-10 seconds).

**Input Parameters:**

| Parameter | Type | Required | Default | Description |
|-----------|------|----------|---------|-------------|
| `gen_text` | string | Yes | - | Text to synthesize |
| `ref_audio_url` | string | Yes | - | Reference audio URL |
| `ref_text` | string | No | auto (ASR) | Reference transcription |
| `model_type` | enum | No | F5-TTS | F5-TTS or E2-TTS |
| `remove_silence` | boolean | No | true | Remove silences |

**Output:** WAV audio file

**Pricing:** $0.05 per 1,000 characters

```javascript
const result = await fal.subscribe("fal-ai/f5-tts", {
  input: {
    gen_text: "This is my cloned voice speaking new content.",
    ref_audio_url: "https://example.com/my-voice-sample.wav",
    model_type: "F5-TTS"
  }
});
```

---

### 5.2 MiniMax Voice Cloning

**Endpoint:** `fal-ai/minimax/voice-clone`

**Description:** Clone voices with at least 10 seconds of reference audio. Voices persist for 7 days with usage.

**Input Parameters:**

| Parameter | Type | Required | Default | Description |
|-----------|------|----------|---------|-------------|
| `audio_url` | string | Yes | - | Reference audio (10s+) |
| `text` | string | No | Default preview | Preview text |
| `model` | enum | No | speech-02-hd | TTS model for preview |

**Output:**

```json
{
  "custom_voice_id": "voice_abc123",
  "audio": { "url": "..." }
}
```

**Usage:** Use `custom_voice_id` with MiniMax TTS endpoints.

---

### 5.3 Zonos Voice Cloning

**Endpoint:** `fal-ai/zonos`

**Description:** High-fidelity voice cloning with emotion control using 10-30 second samples.

**Input Parameters:**

| Parameter | Type | Required | Description |
|-----------|------|----------|-------------|
| `reference_audio_url` | string | Yes | Voice sample (10-30s) |
| `prompt` | string | Yes | Text to speak |

**Supported Languages:** English, Japanese, Chinese, French, German

**Emotion Support:** Sadness, fear, anger, happiness, surprise

**Pricing:** $0.05 per 1,000 characters

---

### 5.4 Dia TTS Voice Cloning

**Endpoint:** `fal-ai/dia-tts/voice-clone`

**Description:** Clone dialogue voices from sample audio for multi-speaker synthesis.

**Input Parameters:**

| Parameter | Type | Required | Description |
|-----------|------|----------|-------------|
| `text` | string | Yes | Dialogue text with speaker tags |
| `ref_audio_url` | string | Yes | Reference audio |
| `ref_text` | string | Yes | Reference transcription |

---

## 6. Audio Processing & Enhancement

### 6.1 ElevenLabs Audio Isolation

**Endpoint:** `fal-ai/elevenlabs/audio-isolation`

**Description:** Remove background noise and isolate vocals/speech.

**Input Parameters:**

| Parameter | Type | Required | Description |
|-----------|------|----------|-------------|
| `audio_url` | string | Yes | Input audio URL |

**Pricing:** $0.10 per minute

---

### 6.2 Chatterbox Speech-to-Speech

**Endpoint:** `fal-ai/chatterbox/speech-to-speech`

**Description:** Transform speech while preserving content.

**Pricing:** $0.015 per minute

---

### 6.3 MiniMax Voice Design

**Endpoint:** `fal-ai/minimax/voice-design`

**Description:** Design custom voices by specifying characteristics.

---

## 7. Streaming Audio & WebSocket Integration

### 7.1 Streaming Endpoints

Most TTS models support streaming via `/stream` suffix:

```javascript
// Standard request
const result = await fal.subscribe("fal-ai/elevenlabs/tts/eleven-v3", {...});

// Streaming request
const stream = await fal.stream("fal-ai/elevenlabs/tts/eleven-v3", {...});
for await (const chunk of stream) {
  // Process audio chunks in real-time
}
```

### 7.2 WebSocket Audio Streaming

**PlayAI/PlayHT WebSocket Integration:**

```javascript
// 1. Obtain session token
const authResponse = await fetch("https://api.play.ht/api/v4/websocket-auth", {
  method: "POST",
  headers: {
    "Authorization": `Bearer ${API_KEY}`,
    "Content-Type": "application/json"
  }
});
const { websocket_urls } = await authResponse.json();
```

**Available WebSocket URLs:**

| Model | URL |
|-------|-----|
| Play3.0-mini | `wss://ws.fal.run/playht-fal/playht-tts/stream` |
| PlayDialog | `wss://ws.fal.run/playht-fal/playht-tts-ldm/stream` |
| PlayDialogMultilingual | `wss://ws.fal.run/playht-fal/playht-tts-multilingual-ldm/stream` |
| PlayDialogArabic | `wss://ws.fal.run/playht-fal/playht-tts-arabic-ldm/stream` |
| PlayDialogHindi | `wss://ws.fal.run/playht-fal/playht-tts-hindi-ldm/stream` |

**Connection Example:**

```javascript
const ws = new WebSocket(
  `wss://ws.fal.run/playht-fal/playht-tts/stream?fal_jwt_token=${sessionToken}`
);

ws.onopen = () => {
  ws.send(JSON.stringify({
    text: "Hello, this is streaming audio!",
    voice: "Jennifer (English (US)/American)",
    output_format: "mp3",
    speed: 1.0,
    temperature: 0.7
  }));
};

ws.onmessage = (event) => {
  if (typeof event.data === "string") {
    const msg = JSON.parse(event.data);
    if (msg.type === "start") console.log("Audio starting");
    if (msg.type === "end") console.log("Audio complete");
  } else {
    // Binary audio data
    processAudioChunk(event.data);
  }
};
```

**WebSocket Message Flow:**

1. `{"type": "start"}` - Audio generation starting
2. Binary messages - Audio data chunks
3. `{"type": "end"}` - Audio generation complete

**Connection Duration:** 1 hour (re-authenticate after expiry)

---

## 8. Pricing Reference

### Text-to-Speech Models

| Model | Endpoint | Price | Unit |
|-------|----------|-------|------|
| ElevenLabs Eleven-v3 | fal-ai/elevenlabs/tts/eleven-v3 | $0.10 | 1,000 chars |
| ElevenLabs Turbo v2.5 | fal-ai/elevenlabs/tts/turbo-v2.5 | $0.05 | 1,000 chars |
| ElevenLabs Multilingual v2 | fal-ai/elevenlabs/tts/multilingual-v2 | $0.10 | 1,000 chars |
| MiniMax Speech-02 HD | fal-ai/minimax/speech-02-hd | $0.10 | 1,000 chars |
| Kokoro (all languages) | fal-ai/kokoro/* | $0.02 | 1,000 chars |
| Dia TTS | fal-ai/dia-tts | $0.04 | 1,000 chars |
| Orpheus TTS | fal-ai/orpheus-tts | $0.05 | 1,000 chars |
| Maya1 | fal-ai/maya | $0.002 | audio second |
| Chatterbox Turbo | fal-ai/chatterbox/text-to-speech/turbo | $0.02 | 1,000 chars |
| Chatterbox Multilingual | fal-ai/chatterbox/text-to-speech/multilingual | $0.025 | 1,000 chars |
| Chatterbox HD | resemble-ai/chatterboxhd/text-to-speech | $0.04 | 1,000 chars |
| VibeVoice | fal-ai/vibevoice | $0.04 | minute |
| Index TTS 2.0 | fal-ai/index-tts-2/text-to-speech | $0.002 | audio second |

### Speech-to-Text Models

| Model | Endpoint | Price | Unit |
|-------|----------|-------|------|
| Whisper | fal-ai/whisper | Compute | seconds |
| Wizper | fal-ai/wizper | Compute | seconds |
| ElevenLabs STT | fal-ai/elevenlabs/speech-to-text | $0.03 | minute |

### Audio Generation Models

| Model | Endpoint | Price | Unit |
|-------|----------|-------|------|
| ElevenLabs Sound Effects | fal-ai/elevenlabs/sound-effects | $0.002 | second |
| Stable Audio 2.5 | fal-ai/stable-audio-25/* | $0.20 | generation |
| ACE-Step | fal-ai/ace-step | $0.0002 | second |
| MMAudio V2 | fal-ai/mmaudio-v2/text-to-audio | $0.001 | second |

### Voice Cloning

| Model | Endpoint | Price | Unit |
|-------|----------|-------|------|
| F5-TTS | fal-ai/f5-tts | $0.05 | 1,000 chars |
| Zonos | fal-ai/zonos | $0.05 | 1,000 chars |

### Audio Processing

| Model | Endpoint | Price | Unit |
|-------|----------|-------|------|
| Audio Isolation | fal-ai/elevenlabs/audio-isolation | $0.10 | minute |
| Speech-to-Speech | fal-ai/chatterbox/speech-to-speech | $0.015 | minute |

---

## 9. Code Examples

### 9.1 Complete TTS Application (Node.js)

```javascript
import { fal } from "@fal-ai/client";
import fs from "fs";

fal.config({ credentials: process.env.FAL_KEY });

async function generateSpeech(text, options = {}) {
  const {
    model = "fal-ai/elevenlabs/tts/eleven-v3",
    voice = "Aria",
    speed = 1.0
  } = options;

  const result = await fal.subscribe(model, {
    input: { text, voice, speed },
    logs: true,
    onQueueUpdate: (update) => {
      console.log(`Status: ${update.status}`);
    }
  });

  return result.data.audio.url;
}

// Usage
const audioUrl = await generateSpeech(
  "Welcome to our application!",
  { voice: "Rachel", speed: 1.1 }
);
console.log("Audio URL:", audioUrl);
```

### 9.2 Transcription with Speaker Diarization

```javascript
async function transcribeWithSpeakers(audioUrl) {
  const result = await fal.subscribe("fal-ai/whisper", {
    input: {
      audio_url: audioUrl,
      diarize: true,
      chunk_level: "word",
      language: "en"
    }
  });

  const { text, chunks, diarization_segments } = result.data;

  // Group by speaker
  const speakers = {};
  for (const segment of diarization_segments || []) {
    const speaker = segment.speaker_id;
    if (!speakers[speaker]) speakers[speaker] = [];
    speakers[speaker].push(segment.text);
  }

  return { fullText: text, speakers };
}
```

### 9.3 Music Generation with ACE-Step

```javascript
async function generateMusic(genre, lyrics, duration = 60) {
  const result = await fal.subscribe("fal-ai/ace-step", {
    input: {
      tags: genre,
      lyrics: lyrics || "[inst]",
      duration,
      guidance_scale: 15,
      tag_guidance_scale: 5
    }
  });

  return {
    audioUrl: result.data.audio.url,
    seed: result.data.seed
  };
}

// Example: Generate a chill instrumental track
const music = await generateMusic(
  "lofi, chill, ambient, piano",
  null, // instrumental
  120   // 2 minutes
);
```

### 9.4 Voice Cloning Workflow

```javascript
// Method 1: F5-TTS (instant cloning)
async function cloneVoice(referenceAudioUrl, newText) {
  const result = await fal.subscribe("fal-ai/f5-tts", {
    input: {
      gen_text: newText,
      ref_audio_url: referenceAudioUrl,
      model_type: "F5-TTS"
    }
  });

  return result.data.audio_url.url;
}

// Method 2: MiniMax (persistent voice ID)
async function createPersistentVoice(audioUrl) {
  const cloneResult = await fal.subscribe("fal-ai/minimax/voice-clone", {
    input: { audio_url: audioUrl }
  });

  return cloneResult.data.custom_voice_id;
}

async function speakWithClonedVoice(voiceId, text) {
  const result = await fal.subscribe("fal-ai/minimax/speech-02-hd", {
    input: {
      text,
      voice_setting: { voice_id: voiceId }
    }
  });

  return result.data.audio.url;
}
```

### 9.5 Python Complete Example

```python
import fal_client
import os

os.environ["FAL_KEY"] = "your-api-key"

def generate_speech(text, voice="Aria", model="fal-ai/elevenlabs/tts/eleven-v3"):
    """Generate speech from text using FAL.ai TTS"""
    result = fal_client.subscribe(
        model,
        arguments={
            "text": text,
            "voice": voice,
            "speed": 1.0,
            "stability": 0.5,
            "similarity_boost": 0.75
        },
        with_logs=True
    )
    return result["audio"]["url"]

def transcribe_audio(audio_url, diarize=True):
    """Transcribe audio with optional speaker diarization"""
    result = fal_client.subscribe(
        "fal-ai/whisper",
        arguments={
            "audio_url": audio_url,
            "diarize": diarize,
            "chunk_level": "segment"
        }
    )
    return result["text"], result.get("chunks", [])

def generate_sound_effect(description, duration=10):
    """Generate a sound effect from text description"""
    result = fal_client.subscribe(
        "fal-ai/elevenlabs/sound-effects",
        arguments={
            "text": description,
            "duration_seconds": duration
        }
    )
    return result["audio"]["url"]

# Usage examples
if __name__ == "__main__":
    # TTS
    audio_url = generate_speech("Hello from Python!", voice="Rachel")
    print(f"Speech: {audio_url}")

    # Transcription
    text, chunks = transcribe_audio(audio_url)
    print(f"Transcription: {text}")

    # Sound effects
    sfx_url = generate_sound_effect("Thunder rolling across the sky", 5)
    print(f"Sound effect: {sfx_url}")
```

### 9.6 cURL Examples

```bash
# Text-to-Speech
curl -X POST "https://fal.run/fal-ai/elevenlabs/tts/eleven-v3" \
  -H "Authorization: Key $FAL_KEY" \
  -H "Content-Type: application/json" \
  -d '{
    "text": "Hello, world!",
    "voice": "Aria",
    "speed": 1.0
  }'

# Speech-to-Text
curl -X POST "https://fal.run/fal-ai/whisper" \
  -H "Authorization: Key $FAL_KEY" \
  -H "Content-Type: application/json" \
  -d '{
    "audio_url": "https://example.com/audio.mp3",
    "diarize": true
  }'

# Music Generation
curl -X POST "https://fal.run/fal-ai/ace-step" \
  -H "Authorization: Key $FAL_KEY" \
  -H "Content-Type: application/json" \
  -d '{
    "tags": "jazz, piano, smooth",
    "lyrics": "[inst]",
    "duration": 60
  }'

# Voice Cloning
curl -X POST "https://fal.run/fal-ai/f5-tts" \
  -H "Authorization: Key $FAL_KEY" \
  -H "Content-Type: application/json" \
  -d '{
    "gen_text": "This is my cloned voice.",
    "ref_audio_url": "https://example.com/voice-sample.wav",
    "model_type": "F5-TTS"
  }'
```

---

## 10. Best Practices

### 10.1 Model Selection Guide

| Use Case | Recommended Model | Why |
|----------|-------------------|-----|
| Real-time voice AI | Chatterbox Turbo | Sub-150ms latency |
| High-quality narration | ElevenLabs Eleven-v3 | Best prosody |
| Budget-conscious TTS | Kokoro | $0.02/1000 chars |
| Multi-language support | ElevenLabs Multilingual v2 | 29 languages |
| Dialogue/conversations | Dia TTS | Multi-speaker tags |
| Emotional control | Maya1 | 20+ emotions |
| Voice cloning | F5-TTS | Zero-shot, 3-10s sample |
| Music generation | ACE-Step | 4 min in 20 seconds |
| Transcription | Whisper | 80+ languages |

### 10.2 Voice Cloning Best Practices

1. **Sample Quality:** Use clean audio, 10-30 seconds optimal
2. **Background Noise:** Minimize or use Audio Isolation first
3. **Consistent Style:** Match source audio style to target use
4. **Multiple Samples:** Combine samples for better accuracy
5. **Transcription:** Provide ref_text for better alignment

### 10.3 Streaming Best Practices

1. **Buffer Management:** Implement 500ms-1s audio buffer
2. **Reconnection Logic:** Handle WebSocket disconnects gracefully
3. **Rate Limiting:** Respect concurrent connection limits
4. **Chunk Processing:** Process audio chunks asynchronously

### 10.4 Cost Optimization

1. Use Turbo variants for cost-sensitive applications
2. Cache frequently-used audio outputs
3. Use shorter voice samples for cloning
4. Batch transcription requests where possible
5. Use Kokoro for high-volume, lower-fidelity needs

---

## Sources

- [FAL.ai Text-to-Speech Models](https://fal.ai/explore?categories=text-to-speech)
- [ElevenLabs Audio Suite on FAL](https://blog.fal.ai/elevenlabs-audio-suite-next-generation-voice-and-audio-ai-now-on-fal/)
- [MiniMax TTS on FAL](https://blog.fal.ai/minimax-text-to-speech-models-now-available-on-fal/)
- [Whisper API Documentation](https://fal.ai/models/fal-ai/whisper/api)
- [Dia TTS Documentation](https://fal.ai/models/fal-ai/dia-tts)
- [Kokoro TTS Documentation](https://fal.ai/models/fal-ai/kokoro/american-english/api)
- [F5-TTS Voice Cloning](https://fal.ai/models/fal-ai/f5-tts/api)
- [ACE-Step Music Generation](https://fal.ai/models/fal-ai/ace-step/api)
- [Stable Audio 2.5](https://fal.ai/models/fal-ai/stable-audio-25/text-to-audio)
- [Chatterbox TTS](https://fal.ai/models/fal-ai/chatterbox/text-to-speech/turbo)
- [PlayAI WebSocket API](https://docs.play.ai/api-reference/text-to-speech/websocket)
- [Resemble AI on FAL](https://blog.fal.ai/resemble-now-available-on-fal/)
- [Maya1 TTS](https://fal.ai/models/fal-ai/maya)
- [FAL.ai Pricing](https://fal.ai/pricing)
