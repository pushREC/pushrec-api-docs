# youtube-transcript-api Documentation

A Python API for retrieving YouTube video transcripts and subtitles without requiring API keys or headless browsers.

**Version:** 1.2.3 (October 2025)
**License:** MIT
**Python:** 3.8 - 3.14
**Author:** Jonas Depoix

## Features

- Retrieve transcripts from any YouTube video
- Works with automatically generated subtitles
- Supports manual (human-created) transcripts
- Translate transcripts to other languages
- No API key required
- No headless browser required
- CLI interface included
- Multiple output formats (JSON, SRT, WebVTT, Text)

## Installation

```bash
pip install youtube-transcript-api
```

## Quick Start

```python
from youtube_transcript_api import YouTubeTranscriptApi

# Create API instance
ytt_api = YouTubeTranscriptApi()

# Fetch transcript (use video ID, not full URL)
transcript = ytt_api.fetch("dQw4w9WgXcQ")

# Access transcript data
for snippet in transcript:
    print(f"{snippet['start']}: {snippet['text']}")

# Get raw data as list of dicts
raw_data = transcript.to_raw_data()
```

## Documentation

- [API Reference](./API-REFERENCE.md) - Complete method documentation
- [Examples](./EXAMPLES.md) - Usage examples and patterns

## Basic Usage Examples

### Fetch with Language Preference

```python
# Try German first, fall back to English
transcript = ytt_api.fetch("VIDEO_ID", languages=['de', 'en'])
```

### List Available Transcripts

```python
transcript_list = ytt_api.list("VIDEO_ID")

for transcript in transcript_list:
    print(f"{transcript.language} ({transcript.language_code})")
    print(f"  Generated: {transcript.is_generated}")
    print(f"  Translatable: {transcript.is_translatable}")
```

### Translate a Transcript

```python
transcript_list = ytt_api.list("VIDEO_ID")
transcript = transcript_list.find_transcript(['en'])

# Translate to German
translated = transcript.translate('de')
data = translated.fetch()
```

### Format Output

```python
from youtube_transcript_api.formatters import JSONFormatter, SRTFormatter

transcript = ytt_api.fetch("VIDEO_ID")

# As JSON
json_formatter = JSONFormatter()
json_output = json_formatter.format_transcript(transcript, indent=2)

# As SRT subtitles
srt_formatter = SRTFormatter()
srt_output = srt_formatter.format_transcript(transcript)
```

## CLI Usage

```bash
# Basic usage
youtube_transcript_api VIDEO_ID

# Multiple videos
youtube_transcript_api VIDEO_ID1 VIDEO_ID2

# With language preference
youtube_transcript_api VIDEO_ID --languages de en

# Output as JSON
youtube_transcript_api VIDEO_ID --format json > transcript.json

# Translate to German
youtube_transcript_api VIDEO_ID --translate de

# List available transcripts
youtube_transcript_api --list-transcripts VIDEO_ID
```

## Known Limitations

1. **IP Blocking:** YouTube may block requests from cloud provider IPs. Use proxy configuration for production deployments.

2. **Cookie Authentication:** Currently broken due to YouTube API changes. Age-restricted video access is temporarily unavailable.

3. **Undocumented API:** This library uses undocumented YouTube endpoints. Breaking changes may occur without notice.

## Error Handling

Common exceptions to handle:

- `RequestBlocked` - YouTube is blocking the request
- `IpBlocked` - Your IP has been banned by YouTube
- `TranscriptsDisabled` - Video has no transcripts available
- `NoTranscriptFound` - No transcript matches your language criteria

## Links

- [PyPI Package](https://pypi.org/project/youtube-transcript-api/)
- [GitHub Repository](https://github.com/jdepoix/youtube-transcript-api)
