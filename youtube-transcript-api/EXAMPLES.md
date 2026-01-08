# youtube-transcript-api - Usage Examples

Practical examples for common use cases.

## Table of Contents

1. [Basic Operations](#basic-operations)
2. [Language Handling](#language-handling)
3. [Translation](#translation)
4. [Output Formatting](#output-formatting)
5. [Proxy Usage](#proxy-usage)
6. [CLI Examples](#cli-examples)
7. [Production Patterns](#production-patterns)

---

## Basic Operations

### Fetch Single Video Transcript

```python
from youtube_transcript_api import YouTubeTranscriptApi

ytt_api = YouTubeTranscriptApi()

# Use video ID, not full URL
transcript = ytt_api.fetch("dQw4w9WgXcQ")

# Print all text
for snippet in transcript:
    print(snippet['text'])
```

### Get Transcript with Timestamps

```python
transcript = ytt_api.fetch("VIDEO_ID")

for snippet in transcript:
    start = snippet['start']
    duration = snippet['duration']
    text = snippet['text']
    print(f"[{start:.2f}s - {start + duration:.2f}s] {text}")
```

### Convert to Raw Data

```python
transcript = ytt_api.fetch("VIDEO_ID")

# Get as list of dictionaries
data = transcript.to_raw_data()

# [
#     {'text': 'Hello', 'start': 0.0, 'duration': 1.5},
#     {'text': 'World', 'start': 1.5, 'duration': 2.0},
#     ...
# ]
```

### Preserve HTML Formatting

```python
# Keep <i>, <b>, and other HTML tags
transcript = ytt_api.fetch(
    "VIDEO_ID",
    preserve_formatting=True
)

# Text may contain: "This is <i>italicized</i> text"
```

---

## Language Handling

### Specify Language Preference

```python
# Try German first, then English
transcript = ytt_api.fetch(
    "VIDEO_ID",
    languages=['de', 'en']
)
```

### List All Available Transcripts

```python
transcript_list = ytt_api.list("VIDEO_ID")

print("Available transcripts:")
for t in transcript_list:
    status = "Auto" if t.is_generated else "Manual"
    print(f"  {t.language} ({t.language_code}) - {status}")
```

### Get Only Manual Transcripts

```python
transcript_list = ytt_api.list("VIDEO_ID")

try:
    manual = transcript_list.find_manually_created_transcript(['en'])
    data = manual.fetch()
    print("Found manual transcript")
except:
    print("No manual transcript available")
```

### Get Only Auto-Generated Transcripts

```python
transcript_list = ytt_api.list("VIDEO_ID")

try:
    generated = transcript_list.find_generated_transcript(['en'])
    data = generated.fetch()
    print("Using auto-generated transcript")
except:
    print("No auto-generated transcript available")
```

### Check Available Translation Languages

```python
transcript_list = ytt_api.list("VIDEO_ID")
transcript = transcript_list.find_transcript(['en'])

if transcript.is_translatable:
    print("Can translate to:")
    for lang in transcript.translation_languages:
        print(f"  {lang['language']} ({lang['language_code']})")
```

---

## Translation

### Translate Transcript

```python
transcript_list = ytt_api.list("VIDEO_ID")

# Find English transcript
transcript = transcript_list.find_transcript(['en'])

# Translate to German
translated = transcript.translate('de')
data = translated.fetch()

for snippet in data:
    print(snippet['text'])
```

### Check if Translation Available

```python
transcript_list = ytt_api.list("VIDEO_ID")
transcript = transcript_list.find_transcript(['en'])

if transcript.is_translatable:
    translated = transcript.translate('de').fetch()
else:
    print("Translation not available for this transcript")
```

---

## Output Formatting

### Export as JSON

```python
from youtube_transcript_api.formatters import JSONFormatter

transcript = ytt_api.fetch("VIDEO_ID")
formatter = JSONFormatter()

json_output = formatter.format_transcript(transcript, indent=2)

# Save to file
with open("transcript.json", "w") as f:
    f.write(json_output)
```

### Export as SRT Subtitles

```python
from youtube_transcript_api.formatters import SRTFormatter

transcript = ytt_api.fetch("VIDEO_ID")
formatter = SRTFormatter()

srt_output = formatter.format_transcript(transcript)

with open("subtitles.srt", "w") as f:
    f.write(srt_output)
```

### Export as WebVTT

```python
from youtube_transcript_api.formatters import WebVTTFormatter

transcript = ytt_api.fetch("VIDEO_ID")
formatter = WebVTTFormatter()

vtt_output = formatter.format_transcript(transcript)

with open("subtitles.vtt", "w") as f:
    f.write(vtt_output)
```

### Export as Plain Text

```python
from youtube_transcript_api.formatters import TextFormatter

transcript = ytt_api.fetch("VIDEO_ID")
formatter = TextFormatter()

text = formatter.format_transcript(transcript)
print(text)
```

### Create Custom Formatter

```python
from youtube_transcript_api.formatters import Formatter

class TimestampedFormatter(Formatter):
    def format_transcript(self, transcript, **kwargs):
        lines = []
        for snippet in transcript:
            mins = int(snippet['start'] // 60)
            secs = int(snippet['start'] % 60)
            lines.append(f"[{mins:02d}:{secs:02d}] {snippet['text']}")
        return "\n".join(lines)

    def format_transcripts(self, transcripts, **kwargs):
        return "\n\n---\n\n".join(
            self.format_transcript(t) for t in transcripts
        )

# Usage
transcript = ytt_api.fetch("VIDEO_ID")
formatter = TimestampedFormatter()
print(formatter.format_transcript(transcript))

# Output:
# [00:00] Hello everyone
# [00:03] Welcome to the video
# [00:07] Today we'll discuss...
```

---

## Proxy Usage

### Webshare Residential Proxies

```python
from youtube_transcript_api import YouTubeTranscriptApi
from youtube_transcript_api.proxies import WebshareProxyConfig

proxy_config = WebshareProxyConfig(
    proxy_username="your_username",
    proxy_password="your_password"
)

ytt_api = YouTubeTranscriptApi(proxy_config=proxy_config)
transcript = ytt_api.fetch("VIDEO_ID")
```

### Webshare with Location Filter

```python
from youtube_transcript_api.proxies import WebshareProxyConfig

# Only use IPs from Germany or USA
proxy_config = WebshareProxyConfig(
    proxy_username="your_username",
    proxy_password="your_password",
    filter_ip_locations=["de", "us"]
)

ytt_api = YouTubeTranscriptApi(proxy_config=proxy_config)
```

### Generic HTTP Proxy

```python
from youtube_transcript_api.proxies import GenericProxyConfig

proxy_config = GenericProxyConfig(
    http_url="http://user:pass@proxy.example.com:8080",
    https_url="https://user:pass@proxy.example.com:8080"
)

ytt_api = YouTubeTranscriptApi(proxy_config=proxy_config)
transcript = ytt_api.fetch("VIDEO_ID")
```

### Custom HTTP Session

```python
from requests import Session

# Create custom session
session = Session()
session.headers.update({
    "User-Agent": "Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36",
    "Accept-Language": "en-US,en;q=0.9"
})

# Use with API
ytt_api = YouTubeTranscriptApi(http_client=session)
transcript = ytt_api.fetch("VIDEO_ID")
```

---

## CLI Examples

### Basic Usage

```bash
# Fetch transcript
youtube_transcript_api dQw4w9WgXcQ

# Multiple videos
youtube_transcript_api VIDEO1 VIDEO2 VIDEO3
```

### Language Options

```bash
# Specify language preference
youtube_transcript_api VIDEO_ID --languages de en

# Only auto-generated
youtube_transcript_api VIDEO_ID --exclude-manually-created

# Only manual transcripts
youtube_transcript_api VIDEO_ID --exclude-generated
```

### Output Formats

```bash
# JSON output
youtube_transcript_api VIDEO_ID --format json > transcript.json

# List available transcripts
youtube_transcript_api --list-transcripts VIDEO_ID
```

### Translation

```bash
# Translate English transcript to German
youtube_transcript_api VIDEO_ID --languages en --translate de
```

### Proxy Configuration

```bash
# Webshare proxy
youtube_transcript_api VIDEO_ID \
    --webshare-proxy-username "user" \
    --webshare-proxy-password "pass"

# Generic proxy
youtube_transcript_api VIDEO_ID \
    --http-proxy http://user:pass@proxy.com:8080 \
    --https-proxy https://user:pass@proxy.com:8080

# Cookies (when supported)
youtube_transcript_api VIDEO_ID --cookies /path/to/cookies.txt
```

### Escape Special Characters

```bash
# Video IDs starting with hyphen need escaping
youtube_transcript_api "\-abc123def"
```

---

## Production Patterns

### Retry with Exponential Backoff

```python
import time
from youtube_transcript_api import YouTubeTranscriptApi

def fetch_with_retry(video_id, max_retries=3):
    ytt_api = YouTubeTranscriptApi()

    for attempt in range(max_retries):
        try:
            return ytt_api.fetch(video_id)
        except Exception as e:
            if attempt == max_retries - 1:
                raise
            wait_time = 2 ** attempt  # 1, 2, 4 seconds
            print(f"Attempt {attempt + 1} failed, retrying in {wait_time}s...")
            time.sleep(wait_time)

transcript = fetch_with_retry("VIDEO_ID")
```

### Batch Processing with Delays

```python
import time
from youtube_transcript_api import YouTubeTranscriptApi

def fetch_batch(video_ids, delay=1.5):
    ytt_api = YouTubeTranscriptApi()
    results = {}

    for i, video_id in enumerate(video_ids):
        try:
            results[video_id] = ytt_api.fetch(video_id)
            print(f"Fetched {i+1}/{len(video_ids)}: {video_id}")
        except Exception as e:
            results[video_id] = {"error": str(e)}
            print(f"Error {i+1}/{len(video_ids)}: {video_id} - {e}")

        # Delay between requests
        if i < len(video_ids) - 1:
            time.sleep(delay)

    return results

video_ids = ["VIDEO1", "VIDEO2", "VIDEO3"]
transcripts = fetch_batch(video_ids)
```

### Caching Results

```python
import json
import hashlib
from pathlib import Path
from youtube_transcript_api import YouTubeTranscriptApi

CACHE_DIR = Path("./transcript_cache")
CACHE_DIR.mkdir(exist_ok=True)

def fetch_cached(video_id, languages=['en']):
    # Generate cache key
    cache_key = hashlib.md5(
        f"{video_id}_{languages}".encode()
    ).hexdigest()
    cache_file = CACHE_DIR / f"{cache_key}.json"

    # Check cache
    if cache_file.exists():
        with open(cache_file) as f:
            return json.load(f)

    # Fetch and cache
    ytt_api = YouTubeTranscriptApi()
    transcript = ytt_api.fetch(video_id, languages=languages)
    data = transcript.to_raw_data()

    with open(cache_file, "w") as f:
        json.dump(data, f)

    return data

# Usage
transcript = fetch_cached("VIDEO_ID", languages=['de', 'en'])
```

### Full Production Example

```python
import time
import json
from pathlib import Path
from youtube_transcript_api import YouTubeTranscriptApi
from youtube_transcript_api.proxies import WebshareProxyConfig
from youtube_transcript_api.formatters import JSONFormatter

class TranscriptFetcher:
    def __init__(self, proxy_username=None, proxy_password=None):
        proxy_config = None
        if proxy_username and proxy_password:
            proxy_config = WebshareProxyConfig(
                proxy_username=proxy_username,
                proxy_password=proxy_password
            )

        self.api = YouTubeTranscriptApi(proxy_config=proxy_config)
        self.formatter = JSONFormatter()

    def fetch_one(self, video_id, languages=['en'], retries=3):
        """Fetch single transcript with retries."""
        for attempt in range(retries):
            try:
                return self.api.fetch(video_id, languages=languages)
            except Exception as e:
                if attempt == retries - 1:
                    raise
                time.sleep(2 ** attempt)
        return None

    def fetch_batch(self, video_ids, languages=['en'], delay=1.5):
        """Fetch multiple transcripts with delays."""
        results = {}
        for video_id in video_ids:
            try:
                results[video_id] = {
                    "success": True,
                    "data": self.fetch_one(video_id, languages).to_raw_data()
                }
            except Exception as e:
                results[video_id] = {
                    "success": False,
                    "error": str(e)
                }
            time.sleep(delay)
        return results

    def save_json(self, transcript, filepath):
        """Save transcript as formatted JSON."""
        output = self.formatter.format_transcript(transcript, indent=2)
        Path(filepath).write_text(output)

# Usage
fetcher = TranscriptFetcher(
    proxy_username="user",
    proxy_password="pass"
)

transcript = fetcher.fetch_one("VIDEO_ID", languages=['de', 'en'])
fetcher.save_json(transcript, "output.json")
```

### Extract Video ID from URL

```python
import re

def extract_video_id(url_or_id):
    """Extract video ID from various YouTube URL formats."""
    patterns = [
        r'(?:youtube\.com/watch\?v=|youtu\.be/)([a-zA-Z0-9_-]{11})',
        r'^([a-zA-Z0-9_-]{11})$'  # Already a video ID
    ]

    for pattern in patterns:
        match = re.search(pattern, url_or_id)
        if match:
            return match.group(1)

    raise ValueError(f"Could not extract video ID from: {url_or_id}")

# Usage
video_id = extract_video_id("https://www.youtube.com/watch?v=dQw4w9WgXcQ")
video_id = extract_video_id("https://youtu.be/dQw4w9WgXcQ")
video_id = extract_video_id("dQw4w9WgXcQ")
```
