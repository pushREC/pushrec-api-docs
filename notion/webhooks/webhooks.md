---
source: https://developers.notion.com/reference/webhooks
scraped: 2026-01-08
---

# Notion Webhooks

## Overview

Webhooks enable integrations to receive real-time updates from Notion. When pages or databases change, Notion sends secure HTTP POST requests to configured endpoints, allowing applications to respond immediately to workspace activity.

## Getting Started

### Step 1: Create a Webhook Subscription

1. Visit integration settings at notion.so/profile/integrations
2. Select or create an integration
3. Navigate to the Webhooks tab
4. Click "+ Create a subscription"
5. Enter a public, SSL-secured webhook URL (localhost endpoints won't work)
6. Select desired event types
7. Click "Create subscription"

### Step 2: Verify the Subscription

Notion sends a POST request containing a `verification_token` to confirm endpoint accessibility. The payload structure:

```json
{
  "verification_token": "YOUR_VERIFICATION_TOKEN_HERE"
}
```

To complete verification:
1. Extract the token from the incoming request
2. Return to the Webhooks tab
3. Click "⚠️ Verify"
4. Paste the token and confirm

**Important**: Webhook URLs can only be changed before verification. After verification, you must delete and recreate the subscription to modify the URL.

### Step 3: Validate Event Payloads (Recommended)

Every webhook event includes an `X-Notion-Signature` header containing an HMAC-SHA256 hash. Validate requests by recomputing the signature using your `verification_token`:

**JavaScript Implementation:**

```javascript
import { createHmac, timingSafeEqual } from "crypto"

const verificationToken = "YOUR_VERIFICATION_TOKEN_HERE"
const body = {"verification_token":"YOUR_VERIFICATION_TOKEN_HERE"}

const calculatedSignature = `sha256=${createHmac("sha256", verificationToken)
  .update(JSON.stringify(body))
  .digest("hex")}`

const isTrustedPayload = timingSafeEqual(
  Buffer.from(calculatedSignature),
  Buffer.from(headers["X-Notion-Signature"])
)
```

**Python Implementation:**

```python
import hmac
import hashlib
import json

verification_token = "YOUR_VERIFICATION_TOKEN_HERE"
body = {"verification_token": "YOUR_VERIFICATION_TOKEN_HERE"}

body_json = json.dumps(body, separators=(",", ":"))
hmac_obj = hmac.new(
  verification_token.encode("utf-8"),
  body_json.encode("utf-8"),
  hashlib.sha256
)
calculated_signature = "sha256=" + hmac_obj.hexdigest()

is_trusted_payload = hmac.compare_digest(
  calculated_signature,
  headers["X-Notion-Signature"]
)
```

## Testing Your Subscription

### Test 1: Page Title Changes
- Add integration to a page
- Modify the page title
- Wait 1-2 minutes for aggregated event delivery
- Verify `page.content_updated` event receipt
- Use the `entity.id` to retrieve updated page details

### Test 2: Comment Creation
- Add a comment to an accessible page
- Expect `comment.created` event within seconds
- Requires "comment read" capability enabled

### Test 3: Database Schema Modifications
- Make structural changes to a database (add/rename/delete properties)
- Expect `data_source.schema_updated` event delivery

## Troubleshooting

| Issue | Solution |
|-------|----------|
| **Access Permissions** | Confirm integration has appropriate access to objects triggering events |
| **Capabilities** | Some events require specific capabilities enabled (e.g., "comment read" for comment events) |
| **Event Timing** | Events like `page.content_updated` are aggregated to reduce redundancy from rapid edits |
| **Subscription Status** | Verify the subscription shows as "active" in the Webhooks tab |
