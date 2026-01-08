---
source: https://ai.google.dev/gemini-api/docs/api-key
scraped: 2025-01-08
---

# Gemini API Authentication

## Overview

The Gemini API supports two primary authentication methods:
1. **API Keys** - Simple, recommended for most use cases
2. **OAuth/Service Accounts** - For Vertex AI integration

---

## API Key Authentication

### Getting an API Key

1. Visit [Google AI Studio](https://aistudio.google.com/apikey)
2. Sign in with your Google account
3. Accept Terms of Service (first-time users)
4. Click "Create API Key"
5. Select or create a Google Cloud project

**Limitations:**
- Maximum 10 projects creatable from AI Studio
- Display limited to 100 keys and 50 projects per view

### Using API Keys

#### Method 1: Environment Variable (Recommended)

**macOS/Linux:**
```bash
# Add to ~/.bashrc or ~/.zshrc
export GEMINI_API_KEY="your-api-key-here"
# OR
export GOOGLE_API_KEY="your-api-key-here"
```

**Windows:**
```powershell
# PowerShell
$env:GEMINI_API_KEY = "your-api-key-here"

# Or set via System Properties > Environment Variables
```

SDK libraries automatically detect these environment variables.

#### Method 2: Request Header

Include in every API request:

```bash
curl -X POST \
  -H "x-goog-api-key: YOUR_API_KEY" \
  -H "Content-Type: application/json" \
  -d '{"contents": [...]}' \
  "https://generativelanguage.googleapis.com/v1beta/models/gemini-2.5-flash:generateContent"
```

#### Method 3: Client Initialization

**Python:**
```python
from google import genai

client = genai.Client(api_key="YOUR_API_KEY")
```

**JavaScript:**
```javascript
import { GoogleGenAI } from "@google/genai";

const ai = new GoogleGenAI({ apiKey: "YOUR_API_KEY" });
```

**Go:**
```go
import "github.com/google/generative-ai-go/genai"

client, err := genai.NewClient(ctx, option.WithAPIKey("YOUR_API_KEY"))
```

**Java:**
```java
GenerativeModel model = new GenerativeModel(
    "gemini-2.5-flash",
    "YOUR_API_KEY"
);
```

---

## Security Best Practices

### Critical Rules

| Rule | Description |
|------|-------------|
| Never commit keys | Keep out of version control (add to `.gitignore`) |
| Server-side only | Never expose keys in client-side code |
| Rotate regularly | Periodically regenerate keys |
| Restrict usage | Apply API restrictions in Google Cloud Console |

### API Key Restrictions

Configure in [Google Cloud Console](https://console.cloud.google.com/apis/credentials):

1. **IP Address Restrictions**
   - Limit to specific server IP addresses
   - Useful for production backends

2. **HTTP Referrer Restrictions**
   - Limit to specific domains
   - For web application use

3. **API Restrictions**
   - Restrict to Generative Language API only
   - Prevents misuse if key is compromised

### Secure Storage Options

| Platform | Recommended Storage |
|----------|-------------------|
| Local Dev | Environment variables |
| CI/CD | Secret managers (GitHub Secrets, GitLab CI) |
| Cloud | Google Secret Manager, AWS Secrets Manager |
| Container | Kubernetes Secrets, Docker secrets |

---

## OAuth / Service Accounts (Vertex AI)

For Vertex AI Gemini API (enterprise features):

### Service Account Setup

1. Create service account in Google Cloud Console
2. Grant "Vertex AI User" role
3. Download JSON key file

**Python (Vertex AI):**
```python
import google.auth
from google.cloud import aiplatform

# Uses Application Default Credentials
credentials, project = google.auth.default()

aiplatform.init(
    project=project,
    location="us-central1",
    credentials=credentials
)
```

### Application Default Credentials (ADC)

```bash
# Set up ADC
gcloud auth application-default login

# Or with service account
export GOOGLE_APPLICATION_CREDENTIALS="/path/to/service-account.json"
```

---

## Ephemeral Tokens (Live API)

For client-side Live API access with lower security risk:

1. Server generates short-lived token
2. Client uses token for API calls
3. Token expires automatically

**Use case:** Real-time audio/video applications where API calls must originate from client.

---

## Environment Variables Reference

| Variable | Description |
|----------|-------------|
| `GEMINI_API_KEY` | Primary API key variable |
| `GOOGLE_API_KEY` | Alternative API key variable |
| `GOOGLE_APPLICATION_CREDENTIALS` | Path to service account JSON |

Priority: `GEMINI_API_KEY` > `GOOGLE_API_KEY` > ADC

---

## Troubleshooting

### Common Errors

| Error | Cause | Solution |
|-------|-------|----------|
| 401 UNAUTHENTICATED | Missing API key | Add `x-goog-api-key` header |
| 403 PERMISSION_DENIED | Invalid/restricted key | Check key restrictions, regenerate |
| API key not found | Wrong env variable | Use `GEMINI_API_KEY` or `GOOGLE_API_KEY` |

### Verify API Key

```bash
# Test your API key
curl -H "x-goog-api-key: YOUR_API_KEY" \
  "https://generativelanguage.googleapis.com/v1beta/models"
```

Expected: List of available models

### Key Management URLs

- **Create/Manage Keys:** https://aistudio.google.com/apikey
- **Cloud Console:** https://console.cloud.google.com/apis/credentials
- **Quotas:** https://console.cloud.google.com/apis/api/generativelanguage.googleapis.com/quotas
