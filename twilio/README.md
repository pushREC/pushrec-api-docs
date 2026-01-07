# Twilio API Documentation

> **Status:** Complete
> **Last Updated:** 2026-01-08
> **Source:** api.twilio.com

## Contents

| Type | Description |
|------|-------------|
| `twilio_api_v2010.json` | Main Twilio API OpenAPI spec |
| `SOURCES.md` | Source tracking |
| `COVERAGE.md` | Coverage report |

## Quick Start

```bash
# Set credentials
export TWILIO_ACCOUNT_SID="ACxxxxxxxxxx"
export TWILIO_AUTH_TOKEN="your-auth-token"

# Send SMS
curl -X POST "https://api.twilio.com/2010-04-01/Accounts/$TWILIO_ACCOUNT_SID/Messages.json" \
  -u "$TWILIO_ACCOUNT_SID:$TWILIO_AUTH_TOKEN" \
  -d "From=+15551234567" \
  -d "To=+15559876543" \
  -d "Body=Hello from Twilio!"
```

## Key Endpoints

| Category | Endpoint | Description |
|----------|----------|-------------|
| **Messages** | `POST /2010-04-01/Accounts/{sid}/Messages.json` | Send SMS/MMS |
| **Calls** | `POST /2010-04-01/Accounts/{sid}/Calls.json` | Make voice call |
| **Numbers** | `GET /2010-04-01/Accounts/{sid}/IncomingPhoneNumbers.json` | List phone numbers |
| **Recordings** | `GET /2010-04-01/Accounts/{sid}/Recordings.json` | List recordings |

## Authentication

- **Type:** HTTP Basic Auth
- **Username:** Account SID
- **Password:** Auth Token
- **Console:** https://console.twilio.com

## Resources

- [API Docs](https://www.twilio.com/docs)
- [API Reference](https://www.twilio.com/docs/api)
- [OpenAPI Specs](https://github.com/twilio/twilio-oai)
- [Python Client](https://github.com/twilio/twilio-python)
