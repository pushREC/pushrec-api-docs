# youtube-transcript-api - CLI Reference

Command-line interface documentation.

## Basic Syntax

```bash
youtube_transcript_api [OPTIONS] VIDEO_ID [VIDEO_ID...]
```

## Arguments

| Argument | Description |
|----------|-------------|
| `VIDEO_ID` | One or more YouTube video IDs (not full URLs) |

## Options

### Language Selection

| Option | Description |
|--------|-------------|
| `--languages LANG [LANG...]` | Language codes in priority order |
| `--exclude-generated` | Exclude auto-generated transcripts |
| `--exclude-manually-created` | Exclude human-created transcripts |

### Output

| Option | Description |
|--------|-------------|
| `--format FORMAT` | Output format: `json`, `text`, `srt`, `vtt` |
| `--list-transcripts` | List all available transcripts |

### Translation

| Option | Description |
|--------|-------------|
| `--translate LANG` | Translate transcript to specified language |

### Proxy Configuration

| Option | Description |
|--------|-------------|
| `--webshare-proxy-username USER` | Webshare proxy username |
| `--webshare-proxy-password PASS` | Webshare proxy password |
| `--http-proxy URL` | HTTP proxy URL |
| `--https-proxy URL` | HTTPS proxy URL |

### Authentication

| Option | Description |
|--------|-------------|
| `--cookies PATH` | Path to cookies.txt file |

## Examples

### Basic Usage

```bash
# Single video
youtube_transcript_api dQw4w9WgXcQ

# Multiple videos
youtube_transcript_api VIDEO1 VIDEO2 VIDEO3
```

### Language Options

```bash
# German preferred, English fallback
youtube_transcript_api VIDEO_ID --languages de en

# Only auto-generated transcripts
youtube_transcript_api VIDEO_ID --exclude-manually-created

# Only manual transcripts
youtube_transcript_api VIDEO_ID --exclude-generated
```

### Output Formatting

```bash
# JSON output to file
youtube_transcript_api VIDEO_ID --format json > transcript.json

# SRT subtitles
youtube_transcript_api VIDEO_ID --format srt > subtitles.srt

# WebVTT
youtube_transcript_api VIDEO_ID --format vtt > subtitles.vtt

# Plain text
youtube_transcript_api VIDEO_ID --format text
```

### List Available Transcripts

```bash
youtube_transcript_api --list-transcripts VIDEO_ID
```

Output example:
```
Available transcripts for VIDEO_ID:
 - English (en) [Manual]
 - German (de) [Generated]
 - Spanish (es) [Generated]
```

### Translation

```bash
# Translate to German
youtube_transcript_api VIDEO_ID --translate de

# Get English, translate to German
youtube_transcript_api VIDEO_ID --languages en --translate de
```

### Proxy Usage

```bash
# Webshare residential proxy
youtube_transcript_api VIDEO_ID \
    --webshare-proxy-username "your_username" \
    --webshare-proxy-password "your_password"

# Generic HTTP/HTTPS proxy
youtube_transcript_api VIDEO_ID \
    --http-proxy "http://user:pass@proxy.example.com:8080" \
    --https-proxy "https://user:pass@proxy.example.com:8080"
```

### Cookie Authentication

```bash
# Use exported cookies (when supported)
youtube_transcript_api VIDEO_ID --cookies /path/to/cookies.txt
```

### Special Characters

```bash
# Video IDs starting with hyphen need escaping
youtube_transcript_api "\-abc123"
```

## Output Format Details

### JSON Format

```json
[
  {
    "text": "Hello everyone",
    "start": 0.0,
    "duration": 2.5
  },
  {
    "text": "Welcome to the video",
    "start": 2.5,
    "duration": 3.0
  }
]
```

### SRT Format

```
1
00:00:00,000 --> 00:00:02,500
Hello everyone

2
00:00:02,500 --> 00:00:05,500
Welcome to the video
```

### WebVTT Format

```
WEBVTT

00:00:00.000 --> 00:00:02.500
Hello everyone

00:00:02.500 --> 00:00:05.500
Welcome to the video
```

### Text Format

```
Hello everyone
Welcome to the video
```

## Exit Codes

| Code | Description |
|------|-------------|
| 0 | Success |
| 1 | Error (transcript not found, network error, etc.) |

## Environment Variables

Currently no environment variables are supported. All configuration must be passed via command-line options.

## Tips

1. **Multiple Videos**: Process multiple videos in one command for efficiency

2. **Piping Output**: Use shell redirection to save output:
   ```bash
   youtube_transcript_api VIDEO_ID --format json > output.json
   ```

3. **Scripting**: Combine with other tools:
   ```bash
   # Process each line from a file
   while read video_id; do
       youtube_transcript_api "$video_id" --format json > "${video_id}.json"
       sleep 1  # Rate limiting
   done < video_ids.txt
   ```

4. **Error Handling**: Check exit code in scripts:
   ```bash
   if youtube_transcript_api VIDEO_ID > transcript.txt 2>&1; then
       echo "Success"
   else
       echo "Failed to fetch transcript"
   fi
   ```
