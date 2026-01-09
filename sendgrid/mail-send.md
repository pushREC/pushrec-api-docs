---
created: 2026-01-09
tags: [type/api-reference, api/mail-send]
api_name: Twilio SendGrid Mail API
category: Mail Send
endpoint_count: 1
---

# Twilio SendGrid Mail API - Mail Send

[[README|Back to Overview]]

---

## POST /v3/mail/send

**Send Email with Twilio SendGrid.**

*The Mail Send operation allows you to send email over SendGrid's v3 Web API*

For an overview of this API, including its features and limitations, please see the [Mail Send API overview page](https://www.twilio.com/docs/sendgrid/api-reference/mail-send)

The overview page also includes links to SendGrid's Email API quickstarts and helper libraries to get you working with this endpoint even faster.


### Parameters

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| `` | query | string | No |  |

### Example

```bash
curl -X POST \
  -H "Authorization: Bearer $TOKEN" \
  "https://api.sendgrid.com/v3/mail/send"
```

---
