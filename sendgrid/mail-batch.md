---
created: 2026-01-09
tags: [type/api-reference, api/mail-batch]
api_name: Twilio SendGrid Mail API
category: Mail Batch
endpoint_count: 2
---

# Twilio SendGrid Mail API - Mail Batch

[[README|Back to Overview]]

---

## POST /v3/mail/batch

**Create a batch ID.**

**This operation allows you to generate a new mail batch ID.**


Once a batch ID is created, you can associate it with a mail send by passing
it in the request body of the [Mail Send operation](https://docs.sendgrid.com/api-reference/mail-send/mail-send).
This makes it possible to group multiple requests to the Mail Send operation
by assigning them the same batch ID.


A batch ID that's associated with a mail send can be used to access and modify the associated send. For example, you can pause or cancel a send using its batch ID. See the [Scheduled Sends API](https://www.twilio.com/docs/sendgrid/api-reference/cancel-scheduled-sends) for more information about pausing and cancelling a mail send.


### Parameters

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| `` | query | string | No |  |

### Example

```bash
curl -X POST \
  -H "Authorization: Bearer $TOKEN" \
  "https://api.sendgrid.com/v3/mail/batch"
```

---

## GET /v3/mail/batch/{batch_id}

**Validate a batch ID.**

**This operation allows you to validate a mail batch ID.**

If you provide a valid batch ID, this operation will return a `200` status code and the batch ID itself.
If you provide an invalid batch ID, you will receive a `400` level status code and an error message.
A batch ID does not need to be assigned to a send to be considered valid. A successful response means only that the batch ID has been created, but it does not indicate that the ID has been assigned to a send.

### Parameters

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| `` | query | string | No |  |

### Example

```bash
curl -X GET \
  -H "Authorization: Bearer $TOKEN" \
  "https://api.sendgrid.com/v3/mail/batch/{batch_id}"
```

---
