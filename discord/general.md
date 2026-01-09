---
created: 2026-01-09
tags: [type/api-reference, api/general]
api_name: Discord HTTP API (Preview)
category: general
endpoint_count: 224
---

# Discord HTTP API (Preview) - General

[[README|Back to Overview]]

---

## GET /applications/@me

### Example

```bash
curl -X GET \
  -H "Authorization: Bearer $TOKEN" \
  "https://discord.com/api/v10/applications/@me"
```

---

## PATCH /applications/@me

### Example

```bash
curl -X PATCH \
  -H "Authorization: Bearer $TOKEN" \
  "https://discord.com/api/v10/applications/@me"
```

---

## GET /applications/{application_id}

### Example

```bash
curl -X GET \
  -H "Authorization: Bearer $TOKEN" \
  "https://discord.com/api/v10/applications/{application_id}"
```

---

## PATCH /applications/{application_id}

### Example

```bash
curl -X PATCH \
  -H "Authorization: Bearer $TOKEN" \
  "https://discord.com/api/v10/applications/{application_id}"
```

---

## GET /applications/{application_id}/activity-instances/{instance_id}

### Example

```bash
curl -X GET \
  -H "Authorization: Bearer $TOKEN" \
  "https://discord.com/api/v10/applications/{application_id}/activity-instances/{instance_id}"
```

---

## POST /applications/{application_id}/attachment

### Example

```bash
curl -X POST \
  -H "Authorization: Bearer $TOKEN" \
  "https://discord.com/api/v10/applications/{application_id}/attachment"
```

---

## GET /applications/{application_id}/commands

### Parameters

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| `with_localizations` | query | boolean | No |  |

### Example

```bash
curl -X GET \
  -H "Authorization: Bearer $TOKEN" \
  "https://discord.com/api/v10/applications/{application_id}/commands"
```

---

## PUT /applications/{application_id}/commands

### Example

```bash
curl -X PUT \
  -H "Authorization: Bearer $TOKEN" \
  "https://discord.com/api/v10/applications/{application_id}/commands"
```

---

## POST /applications/{application_id}/commands

### Example

```bash
curl -X POST \
  -H "Authorization: Bearer $TOKEN" \
  "https://discord.com/api/v10/applications/{application_id}/commands"
```

---

## GET /applications/{application_id}/commands/{command_id}

### Example

```bash
curl -X GET \
  -H "Authorization: Bearer $TOKEN" \
  "https://discord.com/api/v10/applications/{application_id}/commands/{command_id}"
```

---

## DELETE /applications/{application_id}/commands/{command_id}

### Example

```bash
curl -X DELETE \
  -H "Authorization: Bearer $TOKEN" \
  "https://discord.com/api/v10/applications/{application_id}/commands/{command_id}"
```

---

## PATCH /applications/{application_id}/commands/{command_id}

### Example

```bash
curl -X PATCH \
  -H "Authorization: Bearer $TOKEN" \
  "https://discord.com/api/v10/applications/{application_id}/commands/{command_id}"
```

---

## GET /applications/{application_id}/emojis

### Example

```bash
curl -X GET \
  -H "Authorization: Bearer $TOKEN" \
  "https://discord.com/api/v10/applications/{application_id}/emojis"
```

---

## POST /applications/{application_id}/emojis

### Example

```bash
curl -X POST \
  -H "Authorization: Bearer $TOKEN" \
  "https://discord.com/api/v10/applications/{application_id}/emojis"
```

---

## GET /applications/{application_id}/emojis/{emoji_id}

### Example

```bash
curl -X GET \
  -H "Authorization: Bearer $TOKEN" \
  "https://discord.com/api/v10/applications/{application_id}/emojis/{emoji_id}"
```

---

## DELETE /applications/{application_id}/emojis/{emoji_id}

### Example

```bash
curl -X DELETE \
  -H "Authorization: Bearer $TOKEN" \
  "https://discord.com/api/v10/applications/{application_id}/emojis/{emoji_id}"
```

---

## PATCH /applications/{application_id}/emojis/{emoji_id}

### Example

```bash
curl -X PATCH \
  -H "Authorization: Bearer $TOKEN" \
  "https://discord.com/api/v10/applications/{application_id}/emojis/{emoji_id}"
```

---

## GET /applications/{application_id}/entitlements

### Parameters

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| `user_id` | query | string | No |  |
| `sku_ids` | query | string | No |  |
| `guild_id` | query | string | No |  |
| `before` | query | string | No |  |
| `after` | query | string | No |  |
| `limit` | query | integer | No |  |
| `exclude_ended` | query | boolean | No |  |
| `exclude_deleted` | query | boolean | No |  |
| `only_active` | query | boolean | No |  |

### Example

```bash
curl -X GET \
  -H "Authorization: Bearer $TOKEN" \
  "https://discord.com/api/v10/applications/{application_id}/entitlements"
```

---

## POST /applications/{application_id}/entitlements

### Example

```bash
curl -X POST \
  -H "Authorization: Bearer $TOKEN" \
  "https://discord.com/api/v10/applications/{application_id}/entitlements"
```

---

## GET /applications/{application_id}/entitlements/{entitlement_id}

### Example

```bash
curl -X GET \
  -H "Authorization: Bearer $TOKEN" \
  "https://discord.com/api/v10/applications/{application_id}/entitlements/{entitlement_id}"
```

---

## DELETE /applications/{application_id}/entitlements/{entitlement_id}

### Example

```bash
curl -X DELETE \
  -H "Authorization: Bearer $TOKEN" \
  "https://discord.com/api/v10/applications/{application_id}/entitlements/{entitlement_id}"
```

---

## POST /applications/{application_id}/entitlements/{entitlement_id}/consume

### Example

```bash
curl -X POST \
  -H "Authorization: Bearer $TOKEN" \
  "https://discord.com/api/v10/applications/{application_id}/entitlements/{entitlement_id}/consume"
```

---

## GET /applications/{application_id}/guilds/{guild_id}/commands

### Parameters

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| `with_localizations` | query | boolean | No |  |

### Example

```bash
curl -X GET \
  -H "Authorization: Bearer $TOKEN" \
  "https://discord.com/api/v10/applications/{application_id}/guilds/{guild_id}/commands"
```

---

## PUT /applications/{application_id}/guilds/{guild_id}/commands

### Example

```bash
curl -X PUT \
  -H "Authorization: Bearer $TOKEN" \
  "https://discord.com/api/v10/applications/{application_id}/guilds/{guild_id}/commands"
```

---

## POST /applications/{application_id}/guilds/{guild_id}/commands

### Example

```bash
curl -X POST \
  -H "Authorization: Bearer $TOKEN" \
  "https://discord.com/api/v10/applications/{application_id}/guilds/{guild_id}/commands"
```

---

## GET /applications/{application_id}/guilds/{guild_id}/commands/permissions

### Example

```bash
curl -X GET \
  -H "Authorization: Bearer $TOKEN" \
  "https://discord.com/api/v10/applications/{application_id}/guilds/{guild_id}/commands/permissions"
```

---

## GET /applications/{application_id}/guilds/{guild_id}/commands/{command_id}

### Example

```bash
curl -X GET \
  -H "Authorization: Bearer $TOKEN" \
  "https://discord.com/api/v10/applications/{application_id}/guilds/{guild_id}/commands/{command_id}"
```

---

## DELETE /applications/{application_id}/guilds/{guild_id}/commands/{command_id}

### Example

```bash
curl -X DELETE \
  -H "Authorization: Bearer $TOKEN" \
  "https://discord.com/api/v10/applications/{application_id}/guilds/{guild_id}/commands/{command_id}"
```

---

## PATCH /applications/{application_id}/guilds/{guild_id}/commands/{command_id}

### Example

```bash
curl -X PATCH \
  -H "Authorization: Bearer $TOKEN" \
  "https://discord.com/api/v10/applications/{application_id}/guilds/{guild_id}/commands/{command_id}"
```

---

## GET /applications/{application_id}/guilds/{guild_id}/commands/{command_id}/permissions

### Example

```bash
curl -X GET \
  -H "Authorization: Bearer $TOKEN" \
  "https://discord.com/api/v10/applications/{application_id}/guilds/{guild_id}/commands/{command_id}/permissions"
```

---

## PUT /applications/{application_id}/guilds/{guild_id}/commands/{command_id}/permissions

### Example

```bash
curl -X PUT \
  -H "Authorization: Bearer $TOKEN" \
  "https://discord.com/api/v10/applications/{application_id}/guilds/{guild_id}/commands/{command_id}/permissions"
```

---

## GET /applications/{application_id}/role-connections/metadata

### Example

```bash
curl -X GET \
  -H "Authorization: Bearer $TOKEN" \
  "https://discord.com/api/v10/applications/{application_id}/role-connections/metadata"
```

---

## PUT /applications/{application_id}/role-connections/metadata

### Example

```bash
curl -X PUT \
  -H "Authorization: Bearer $TOKEN" \
  "https://discord.com/api/v10/applications/{application_id}/role-connections/metadata"
```

---

## GET /channels/{channel_id}

### Example

```bash
curl -X GET \
  -H "Authorization: Bearer $TOKEN" \
  "https://discord.com/api/v10/channels/{channel_id}"
```

---

## DELETE /channels/{channel_id}

### Example

```bash
curl -X DELETE \
  -H "Authorization: Bearer $TOKEN" \
  "https://discord.com/api/v10/channels/{channel_id}"
```

---

## PATCH /channels/{channel_id}

### Example

```bash
curl -X PATCH \
  -H "Authorization: Bearer $TOKEN" \
  "https://discord.com/api/v10/channels/{channel_id}"
```

---

## POST /channels/{channel_id}/followers

### Example

```bash
curl -X POST \
  -H "Authorization: Bearer $TOKEN" \
  "https://discord.com/api/v10/channels/{channel_id}/followers"
```

---

## GET /channels/{channel_id}/invites

### Example

```bash
curl -X GET \
  -H "Authorization: Bearer $TOKEN" \
  "https://discord.com/api/v10/channels/{channel_id}/invites"
```

---

## POST /channels/{channel_id}/invites

### Example

```bash
curl -X POST \
  -H "Authorization: Bearer $TOKEN" \
  "https://discord.com/api/v10/channels/{channel_id}/invites"
```

---

## GET /channels/{channel_id}/messages

### Parameters

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| `around` | query | string | No |  |
| `before` | query | string | No |  |
| `after` | query | string | No |  |
| `limit` | query | integer | No |  |

### Example

```bash
curl -X GET \
  -H "Authorization: Bearer $TOKEN" \
  "https://discord.com/api/v10/channels/{channel_id}/messages"
```

---

## POST /channels/{channel_id}/messages

### Example

```bash
curl -X POST \
  -H "Authorization: Bearer $TOKEN" \
  "https://discord.com/api/v10/channels/{channel_id}/messages"
```

---

## POST /channels/{channel_id}/messages/bulk-delete

### Example

```bash
curl -X POST \
  -H "Authorization: Bearer $TOKEN" \
  "https://discord.com/api/v10/channels/{channel_id}/messages/bulk-delete"
```

---

## GET /channels/{channel_id}/messages/pins

### Parameters

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| `before` | query | string | No |  |
| `limit` | query | integer | No |  |

### Example

```bash
curl -X GET \
  -H "Authorization: Bearer $TOKEN" \
  "https://discord.com/api/v10/channels/{channel_id}/messages/pins"
```

---

## PUT /channels/{channel_id}/messages/pins/{message_id}

### Example

```bash
curl -X PUT \
  -H "Authorization: Bearer $TOKEN" \
  "https://discord.com/api/v10/channels/{channel_id}/messages/pins/{message_id}"
```

---

## DELETE /channels/{channel_id}/messages/pins/{message_id}

### Example

```bash
curl -X DELETE \
  -H "Authorization: Bearer $TOKEN" \
  "https://discord.com/api/v10/channels/{channel_id}/messages/pins/{message_id}"
```

---

## GET /channels/{channel_id}/messages/{message_id}

### Example

```bash
curl -X GET \
  -H "Authorization: Bearer $TOKEN" \
  "https://discord.com/api/v10/channels/{channel_id}/messages/{message_id}"
```

---

## DELETE /channels/{channel_id}/messages/{message_id}

### Example

```bash
curl -X DELETE \
  -H "Authorization: Bearer $TOKEN" \
  "https://discord.com/api/v10/channels/{channel_id}/messages/{message_id}"
```

---

## PATCH /channels/{channel_id}/messages/{message_id}

### Example

```bash
curl -X PATCH \
  -H "Authorization: Bearer $TOKEN" \
  "https://discord.com/api/v10/channels/{channel_id}/messages/{message_id}"
```

---

## POST /channels/{channel_id}/messages/{message_id}/crosspost

### Example

```bash
curl -X POST \
  -H "Authorization: Bearer $TOKEN" \
  "https://discord.com/api/v10/channels/{channel_id}/messages/{message_id}/crosspost"
```

---

## DELETE /channels/{channel_id}/messages/{message_id}/reactions

### Example

```bash
curl -X DELETE \
  -H "Authorization: Bearer $TOKEN" \
  "https://discord.com/api/v10/channels/{channel_id}/messages/{message_id}/reactions"
```

---

## GET /channels/{channel_id}/messages/{message_id}/reactions/{emoji_name}

### Parameters

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| `after` | query | string | No |  |
| `limit` | query | integer | No |  |
| `type` | query | string | No |  |

### Example

```bash
curl -X GET \
  -H "Authorization: Bearer $TOKEN" \
  "https://discord.com/api/v10/channels/{channel_id}/messages/{message_id}/reactions/{emoji_name}"
```

---

## DELETE /channels/{channel_id}/messages/{message_id}/reactions/{emoji_name}

### Example

```bash
curl -X DELETE \
  -H "Authorization: Bearer $TOKEN" \
  "https://discord.com/api/v10/channels/{channel_id}/messages/{message_id}/reactions/{emoji_name}"
```

---

## PUT /channels/{channel_id}/messages/{message_id}/reactions/{emoji_name}/@me

### Example

```bash
curl -X PUT \
  -H "Authorization: Bearer $TOKEN" \
  "https://discord.com/api/v10/channels/{channel_id}/messages/{message_id}/reactions/{emoji_name}/@me"
```

---

## DELETE /channels/{channel_id}/messages/{message_id}/reactions/{emoji_name}/@me

### Example

```bash
curl -X DELETE \
  -H "Authorization: Bearer $TOKEN" \
  "https://discord.com/api/v10/channels/{channel_id}/messages/{message_id}/reactions/{emoji_name}/@me"
```

---

## DELETE /channels/{channel_id}/messages/{message_id}/reactions/{emoji_name}/{user_id}

### Example

```bash
curl -X DELETE \
  -H "Authorization: Bearer $TOKEN" \
  "https://discord.com/api/v10/channels/{channel_id}/messages/{message_id}/reactions/{emoji_name}/{user_id}"
```

---

## POST /channels/{channel_id}/messages/{message_id}/threads

### Example

```bash
curl -X POST \
  -H "Authorization: Bearer $TOKEN" \
  "https://discord.com/api/v10/channels/{channel_id}/messages/{message_id}/threads"
```

---

## PUT /channels/{channel_id}/permissions/{overwrite_id}

### Example

```bash
curl -X PUT \
  -H "Authorization: Bearer $TOKEN" \
  "https://discord.com/api/v10/channels/{channel_id}/permissions/{overwrite_id}"
```

---

## DELETE /channels/{channel_id}/permissions/{overwrite_id}

### Example

```bash
curl -X DELETE \
  -H "Authorization: Bearer $TOKEN" \
  "https://discord.com/api/v10/channels/{channel_id}/permissions/{overwrite_id}"
```

---

## GET /channels/{channel_id}/pins

### Example

```bash
curl -X GET \
  -H "Authorization: Bearer $TOKEN" \
  "https://discord.com/api/v10/channels/{channel_id}/pins"
```

---

## PUT /channels/{channel_id}/pins/{message_id}

### Example

```bash
curl -X PUT \
  -H "Authorization: Bearer $TOKEN" \
  "https://discord.com/api/v10/channels/{channel_id}/pins/{message_id}"
```

---

## DELETE /channels/{channel_id}/pins/{message_id}

### Example

```bash
curl -X DELETE \
  -H "Authorization: Bearer $TOKEN" \
  "https://discord.com/api/v10/channels/{channel_id}/pins/{message_id}"
```

---

## GET /channels/{channel_id}/polls/{message_id}/answers/{answer_id}

### Parameters

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| `after` | query | string | No |  |
| `limit` | query | integer | No |  |

### Example

```bash
curl -X GET \
  -H "Authorization: Bearer $TOKEN" \
  "https://discord.com/api/v10/channels/{channel_id}/polls/{message_id}/answers/{answer_id}"
```

---

## POST /channels/{channel_id}/polls/{message_id}/expire

### Example

```bash
curl -X POST \
  -H "Authorization: Bearer $TOKEN" \
  "https://discord.com/api/v10/channels/{channel_id}/polls/{message_id}/expire"
```

---

## PUT /channels/{channel_id}/recipients/{user_id}

### Example

```bash
curl -X PUT \
  -H "Authorization: Bearer $TOKEN" \
  "https://discord.com/api/v10/channels/{channel_id}/recipients/{user_id}"
```

---

## DELETE /channels/{channel_id}/recipients/{user_id}

### Example

```bash
curl -X DELETE \
  -H "Authorization: Bearer $TOKEN" \
  "https://discord.com/api/v10/channels/{channel_id}/recipients/{user_id}"
```

---

## POST /channels/{channel_id}/send-soundboard-sound

### Example

```bash
curl -X POST \
  -H "Authorization: Bearer $TOKEN" \
  "https://discord.com/api/v10/channels/{channel_id}/send-soundboard-sound"
```

---

## GET /channels/{channel_id}/thread-members

### Parameters

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| `with_member` | query | boolean | No |  |
| `limit` | query | integer | No |  |
| `after` | query | string | No |  |

### Example

```bash
curl -X GET \
  -H "Authorization: Bearer $TOKEN" \
  "https://discord.com/api/v10/channels/{channel_id}/thread-members"
```

---

## PUT /channels/{channel_id}/thread-members/@me

### Example

```bash
curl -X PUT \
  -H "Authorization: Bearer $TOKEN" \
  "https://discord.com/api/v10/channels/{channel_id}/thread-members/@me"
```

---

## DELETE /channels/{channel_id}/thread-members/@me

### Example

```bash
curl -X DELETE \
  -H "Authorization: Bearer $TOKEN" \
  "https://discord.com/api/v10/channels/{channel_id}/thread-members/@me"
```

---

## GET /channels/{channel_id}/thread-members/{user_id}

### Parameters

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| `with_member` | query | boolean | No |  |

### Example

```bash
curl -X GET \
  -H "Authorization: Bearer $TOKEN" \
  "https://discord.com/api/v10/channels/{channel_id}/thread-members/{user_id}"
```

---

## PUT /channels/{channel_id}/thread-members/{user_id}

### Example

```bash
curl -X PUT \
  -H "Authorization: Bearer $TOKEN" \
  "https://discord.com/api/v10/channels/{channel_id}/thread-members/{user_id}"
```

---

## DELETE /channels/{channel_id}/thread-members/{user_id}

### Example

```bash
curl -X DELETE \
  -H "Authorization: Bearer $TOKEN" \
  "https://discord.com/api/v10/channels/{channel_id}/thread-members/{user_id}"
```

---

## POST /channels/{channel_id}/threads

### Example

```bash
curl -X POST \
  -H "Authorization: Bearer $TOKEN" \
  "https://discord.com/api/v10/channels/{channel_id}/threads"
```

---

## GET /channels/{channel_id}/threads/archived/private

### Parameters

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| `before` | query | string | No |  |
| `limit` | query | integer | No |  |

### Example

```bash
curl -X GET \
  -H "Authorization: Bearer $TOKEN" \
  "https://discord.com/api/v10/channels/{channel_id}/threads/archived/private"
```

---

## GET /channels/{channel_id}/threads/archived/public

### Parameters

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| `before` | query | string | No |  |
| `limit` | query | integer | No |  |

### Example

```bash
curl -X GET \
  -H "Authorization: Bearer $TOKEN" \
  "https://discord.com/api/v10/channels/{channel_id}/threads/archived/public"
```

---

## GET /channels/{channel_id}/threads/search

### Parameters

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| `name` | query | string | No |  |
| `slop` | query | integer | No |  |
| `min_id` | query | string | No |  |
| `max_id` | query | string | No |  |
| `tag` | query | string | No |  |
| `tag_setting` | query | string | No |  |
| `archived` | query | boolean | No |  |
| `sort_by` | query | string | No |  |
| `sort_order` | query | string | No |  |
| `limit` | query | integer | No |  |
| `offset` | query | integer | No |  |

### Example

```bash
curl -X GET \
  -H "Authorization: Bearer $TOKEN" \
  "https://discord.com/api/v10/channels/{channel_id}/threads/search"
```

---

## POST /channels/{channel_id}/typing

### Example

```bash
curl -X POST \
  -H "Authorization: Bearer $TOKEN" \
  "https://discord.com/api/v10/channels/{channel_id}/typing"
```

---

## GET /channels/{channel_id}/users/@me/threads/archived/private

### Parameters

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| `before` | query | string | No |  |
| `limit` | query | integer | No |  |

### Example

```bash
curl -X GET \
  -H "Authorization: Bearer $TOKEN" \
  "https://discord.com/api/v10/channels/{channel_id}/users/@me/threads/archived/private"
```

---

## GET /channels/{channel_id}/webhooks

### Example

```bash
curl -X GET \
  -H "Authorization: Bearer $TOKEN" \
  "https://discord.com/api/v10/channels/{channel_id}/webhooks"
```

---

## POST /channels/{channel_id}/webhooks

### Example

```bash
curl -X POST \
  -H "Authorization: Bearer $TOKEN" \
  "https://discord.com/api/v10/channels/{channel_id}/webhooks"
```

---

## GET /gateway

### Example

```bash
curl -X GET \
  -H "Authorization: Bearer $TOKEN" \
  "https://discord.com/api/v10/gateway"
```

---

## GET /gateway/bot

### Example

```bash
curl -X GET \
  -H "Authorization: Bearer $TOKEN" \
  "https://discord.com/api/v10/gateway/bot"
```

---

## GET /guilds/templates/{code}

### Example

```bash
curl -X GET \
  -H "Authorization: Bearer $TOKEN" \
  "https://discord.com/api/v10/guilds/templates/{code}"
```

---

## GET /guilds/{guild_id}

### Parameters

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| `with_counts` | query | boolean | No |  |

### Example

```bash
curl -X GET \
  -H "Authorization: Bearer $TOKEN" \
  "https://discord.com/api/v10/guilds/{guild_id}"
```

---

## PATCH /guilds/{guild_id}

### Example

```bash
curl -X PATCH \
  -H "Authorization: Bearer $TOKEN" \
  "https://discord.com/api/v10/guilds/{guild_id}"
```

---

## GET /guilds/{guild_id}/audit-logs

### Parameters

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| `user_id` | query | string | No |  |
| `target_id` | query | string | No |  |
| `action_type` | query | string | No |  |
| `before` | query | string | No |  |
| `after` | query | string | No |  |
| `limit` | query | integer | No |  |

### Example

```bash
curl -X GET \
  -H "Authorization: Bearer $TOKEN" \
  "https://discord.com/api/v10/guilds/{guild_id}/audit-logs"
```

---

## GET /guilds/{guild_id}/auto-moderation/rules

### Example

```bash
curl -X GET \
  -H "Authorization: Bearer $TOKEN" \
  "https://discord.com/api/v10/guilds/{guild_id}/auto-moderation/rules"
```

---

## POST /guilds/{guild_id}/auto-moderation/rules

### Example

```bash
curl -X POST \
  -H "Authorization: Bearer $TOKEN" \
  "https://discord.com/api/v10/guilds/{guild_id}/auto-moderation/rules"
```

---

## GET /guilds/{guild_id}/auto-moderation/rules/{rule_id}

### Example

```bash
curl -X GET \
  -H "Authorization: Bearer $TOKEN" \
  "https://discord.com/api/v10/guilds/{guild_id}/auto-moderation/rules/{rule_id}"
```

---

## DELETE /guilds/{guild_id}/auto-moderation/rules/{rule_id}

### Example

```bash
curl -X DELETE \
  -H "Authorization: Bearer $TOKEN" \
  "https://discord.com/api/v10/guilds/{guild_id}/auto-moderation/rules/{rule_id}"
```

---

## PATCH /guilds/{guild_id}/auto-moderation/rules/{rule_id}

### Example

```bash
curl -X PATCH \
  -H "Authorization: Bearer $TOKEN" \
  "https://discord.com/api/v10/guilds/{guild_id}/auto-moderation/rules/{rule_id}"
```

---

## GET /guilds/{guild_id}/bans

### Parameters

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| `limit` | query | integer | No |  |
| `before` | query | string | No |  |
| `after` | query | string | No |  |

### Example

```bash
curl -X GET \
  -H "Authorization: Bearer $TOKEN" \
  "https://discord.com/api/v10/guilds/{guild_id}/bans"
```

---

## GET /guilds/{guild_id}/bans/{user_id}

### Example

```bash
curl -X GET \
  -H "Authorization: Bearer $TOKEN" \
  "https://discord.com/api/v10/guilds/{guild_id}/bans/{user_id}"
```

---

## PUT /guilds/{guild_id}/bans/{user_id}

### Example

```bash
curl -X PUT \
  -H "Authorization: Bearer $TOKEN" \
  "https://discord.com/api/v10/guilds/{guild_id}/bans/{user_id}"
```

---

## DELETE /guilds/{guild_id}/bans/{user_id}

### Example

```bash
curl -X DELETE \
  -H "Authorization: Bearer $TOKEN" \
  "https://discord.com/api/v10/guilds/{guild_id}/bans/{user_id}"
```

---

## POST /guilds/{guild_id}/bulk-ban

### Example

```bash
curl -X POST \
  -H "Authorization: Bearer $TOKEN" \
  "https://discord.com/api/v10/guilds/{guild_id}/bulk-ban"
```

---

## GET /guilds/{guild_id}/channels

### Example

```bash
curl -X GET \
  -H "Authorization: Bearer $TOKEN" \
  "https://discord.com/api/v10/guilds/{guild_id}/channels"
```

---

## POST /guilds/{guild_id}/channels

### Example

```bash
curl -X POST \
  -H "Authorization: Bearer $TOKEN" \
  "https://discord.com/api/v10/guilds/{guild_id}/channels"
```

---

## PATCH /guilds/{guild_id}/channels

### Example

```bash
curl -X PATCH \
  -H "Authorization: Bearer $TOKEN" \
  "https://discord.com/api/v10/guilds/{guild_id}/channels"
```

---

## GET /guilds/{guild_id}/emojis

### Example

```bash
curl -X GET \
  -H "Authorization: Bearer $TOKEN" \
  "https://discord.com/api/v10/guilds/{guild_id}/emojis"
```

---

## POST /guilds/{guild_id}/emojis

### Example

```bash
curl -X POST \
  -H "Authorization: Bearer $TOKEN" \
  "https://discord.com/api/v10/guilds/{guild_id}/emojis"
```

---

## GET /guilds/{guild_id}/emojis/{emoji_id}

### Example

```bash
curl -X GET \
  -H "Authorization: Bearer $TOKEN" \
  "https://discord.com/api/v10/guilds/{guild_id}/emojis/{emoji_id}"
```

---

## DELETE /guilds/{guild_id}/emojis/{emoji_id}

### Example

```bash
curl -X DELETE \
  -H "Authorization: Bearer $TOKEN" \
  "https://discord.com/api/v10/guilds/{guild_id}/emojis/{emoji_id}"
```

---

## PATCH /guilds/{guild_id}/emojis/{emoji_id}

### Example

```bash
curl -X PATCH \
  -H "Authorization: Bearer $TOKEN" \
  "https://discord.com/api/v10/guilds/{guild_id}/emojis/{emoji_id}"
```

---

## GET /guilds/{guild_id}/integrations

### Example

```bash
curl -X GET \
  -H "Authorization: Bearer $TOKEN" \
  "https://discord.com/api/v10/guilds/{guild_id}/integrations"
```

---

## DELETE /guilds/{guild_id}/integrations/{integration_id}

### Example

```bash
curl -X DELETE \
  -H "Authorization: Bearer $TOKEN" \
  "https://discord.com/api/v10/guilds/{guild_id}/integrations/{integration_id}"
```

---

## GET /guilds/{guild_id}/invites

### Example

```bash
curl -X GET \
  -H "Authorization: Bearer $TOKEN" \
  "https://discord.com/api/v10/guilds/{guild_id}/invites"
```

---

## GET /guilds/{guild_id}/members

### Parameters

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| `limit` | query | integer | No |  |
| `after` | query | integer | No |  |

### Example

```bash
curl -X GET \
  -H "Authorization: Bearer $TOKEN" \
  "https://discord.com/api/v10/guilds/{guild_id}/members"
```

---

## PATCH /guilds/{guild_id}/members/@me

### Example

```bash
curl -X PATCH \
  -H "Authorization: Bearer $TOKEN" \
  "https://discord.com/api/v10/guilds/{guild_id}/members/@me"
```

---

## GET /guilds/{guild_id}/members/search

### Parameters

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| `limit` | query | integer | No |  |
| `query` | query | string | Yes |  |

### Example

```bash
curl -X GET \
  -H "Authorization: Bearer $TOKEN" \
  "https://discord.com/api/v10/guilds/{guild_id}/members/search"
```

---

## GET /guilds/{guild_id}/members/{user_id}

### Example

```bash
curl -X GET \
  -H "Authorization: Bearer $TOKEN" \
  "https://discord.com/api/v10/guilds/{guild_id}/members/{user_id}"
```

---

## PUT /guilds/{guild_id}/members/{user_id}

### Example

```bash
curl -X PUT \
  -H "Authorization: Bearer $TOKEN" \
  "https://discord.com/api/v10/guilds/{guild_id}/members/{user_id}"
```

---

## DELETE /guilds/{guild_id}/members/{user_id}

### Example

```bash
curl -X DELETE \
  -H "Authorization: Bearer $TOKEN" \
  "https://discord.com/api/v10/guilds/{guild_id}/members/{user_id}"
```

---

## PATCH /guilds/{guild_id}/members/{user_id}

### Example

```bash
curl -X PATCH \
  -H "Authorization: Bearer $TOKEN" \
  "https://discord.com/api/v10/guilds/{guild_id}/members/{user_id}"
```

---

## PUT /guilds/{guild_id}/members/{user_id}/roles/{role_id}

### Example

```bash
curl -X PUT \
  -H "Authorization: Bearer $TOKEN" \
  "https://discord.com/api/v10/guilds/{guild_id}/members/{user_id}/roles/{role_id}"
```

---

## DELETE /guilds/{guild_id}/members/{user_id}/roles/{role_id}

### Example

```bash
curl -X DELETE \
  -H "Authorization: Bearer $TOKEN" \
  "https://discord.com/api/v10/guilds/{guild_id}/members/{user_id}/roles/{role_id}"
```

---

## GET /guilds/{guild_id}/new-member-welcome

### Example

```bash
curl -X GET \
  -H "Authorization: Bearer $TOKEN" \
  "https://discord.com/api/v10/guilds/{guild_id}/new-member-welcome"
```

---

## GET /guilds/{guild_id}/onboarding

### Example

```bash
curl -X GET \
  -H "Authorization: Bearer $TOKEN" \
  "https://discord.com/api/v10/guilds/{guild_id}/onboarding"
```

---

## PUT /guilds/{guild_id}/onboarding

### Example

```bash
curl -X PUT \
  -H "Authorization: Bearer $TOKEN" \
  "https://discord.com/api/v10/guilds/{guild_id}/onboarding"
```

---

## GET /guilds/{guild_id}/preview

### Example

```bash
curl -X GET \
  -H "Authorization: Bearer $TOKEN" \
  "https://discord.com/api/v10/guilds/{guild_id}/preview"
```

---

## GET /guilds/{guild_id}/prune

### Parameters

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| `days` | query | integer | No |  |
| `include_roles` | query | string | No |  |

### Example

```bash
curl -X GET \
  -H "Authorization: Bearer $TOKEN" \
  "https://discord.com/api/v10/guilds/{guild_id}/prune"
```

---

## POST /guilds/{guild_id}/prune

### Example

```bash
curl -X POST \
  -H "Authorization: Bearer $TOKEN" \
  "https://discord.com/api/v10/guilds/{guild_id}/prune"
```

---

## GET /guilds/{guild_id}/regions

### Example

```bash
curl -X GET \
  -H "Authorization: Bearer $TOKEN" \
  "https://discord.com/api/v10/guilds/{guild_id}/regions"
```

---

## GET /guilds/{guild_id}/roles

### Example

```bash
curl -X GET \
  -H "Authorization: Bearer $TOKEN" \
  "https://discord.com/api/v10/guilds/{guild_id}/roles"
```

---

## POST /guilds/{guild_id}/roles

### Example

```bash
curl -X POST \
  -H "Authorization: Bearer $TOKEN" \
  "https://discord.com/api/v10/guilds/{guild_id}/roles"
```

---

## PATCH /guilds/{guild_id}/roles

### Example

```bash
curl -X PATCH \
  -H "Authorization: Bearer $TOKEN" \
  "https://discord.com/api/v10/guilds/{guild_id}/roles"
```

---

## GET /guilds/{guild_id}/roles/member-counts

### Example

```bash
curl -X GET \
  -H "Authorization: Bearer $TOKEN" \
  "https://discord.com/api/v10/guilds/{guild_id}/roles/member-counts"
```

---

## GET /guilds/{guild_id}/roles/{role_id}

### Example

```bash
curl -X GET \
  -H "Authorization: Bearer $TOKEN" \
  "https://discord.com/api/v10/guilds/{guild_id}/roles/{role_id}"
```

---

## DELETE /guilds/{guild_id}/roles/{role_id}

### Example

```bash
curl -X DELETE \
  -H "Authorization: Bearer $TOKEN" \
  "https://discord.com/api/v10/guilds/{guild_id}/roles/{role_id}"
```

---

## PATCH /guilds/{guild_id}/roles/{role_id}

### Example

```bash
curl -X PATCH \
  -H "Authorization: Bearer $TOKEN" \
  "https://discord.com/api/v10/guilds/{guild_id}/roles/{role_id}"
```

---

## GET /guilds/{guild_id}/scheduled-events

### Parameters

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| `with_user_count` | query | boolean | No |  |

### Example

```bash
curl -X GET \
  -H "Authorization: Bearer $TOKEN" \
  "https://discord.com/api/v10/guilds/{guild_id}/scheduled-events"
```

---

## POST /guilds/{guild_id}/scheduled-events

### Example

```bash
curl -X POST \
  -H "Authorization: Bearer $TOKEN" \
  "https://discord.com/api/v10/guilds/{guild_id}/scheduled-events"
```

---

## GET /guilds/{guild_id}/scheduled-events/{guild_scheduled_event_id}

### Parameters

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| `with_user_count` | query | boolean | No |  |

### Example

```bash
curl -X GET \
  -H "Authorization: Bearer $TOKEN" \
  "https://discord.com/api/v10/guilds/{guild_id}/scheduled-events/{guild_scheduled_event_id}"
```

---

## DELETE /guilds/{guild_id}/scheduled-events/{guild_scheduled_event_id}

### Example

```bash
curl -X DELETE \
  -H "Authorization: Bearer $TOKEN" \
  "https://discord.com/api/v10/guilds/{guild_id}/scheduled-events/{guild_scheduled_event_id}"
```

---

## PATCH /guilds/{guild_id}/scheduled-events/{guild_scheduled_event_id}

### Example

```bash
curl -X PATCH \
  -H "Authorization: Bearer $TOKEN" \
  "https://discord.com/api/v10/guilds/{guild_id}/scheduled-events/{guild_scheduled_event_id}"
```

---

## GET /guilds/{guild_id}/scheduled-events/{guild_scheduled_event_id}/users

### Parameters

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| `with_member` | query | boolean | No |  |
| `limit` | query | integer | No |  |
| `before` | query | string | No |  |
| `after` | query | string | No |  |

### Example

```bash
curl -X GET \
  -H "Authorization: Bearer $TOKEN" \
  "https://discord.com/api/v10/guilds/{guild_id}/scheduled-events/{guild_scheduled_event_id}/users"
```

---

## GET /guilds/{guild_id}/soundboard-sounds

### Example

```bash
curl -X GET \
  -H "Authorization: Bearer $TOKEN" \
  "https://discord.com/api/v10/guilds/{guild_id}/soundboard-sounds"
```

---

## POST /guilds/{guild_id}/soundboard-sounds

### Example

```bash
curl -X POST \
  -H "Authorization: Bearer $TOKEN" \
  "https://discord.com/api/v10/guilds/{guild_id}/soundboard-sounds"
```

---

## GET /guilds/{guild_id}/soundboard-sounds/{sound_id}

### Example

```bash
curl -X GET \
  -H "Authorization: Bearer $TOKEN" \
  "https://discord.com/api/v10/guilds/{guild_id}/soundboard-sounds/{sound_id}"
```

---

## DELETE /guilds/{guild_id}/soundboard-sounds/{sound_id}

### Example

```bash
curl -X DELETE \
  -H "Authorization: Bearer $TOKEN" \
  "https://discord.com/api/v10/guilds/{guild_id}/soundboard-sounds/{sound_id}"
```

---

## PATCH /guilds/{guild_id}/soundboard-sounds/{sound_id}

### Example

```bash
curl -X PATCH \
  -H "Authorization: Bearer $TOKEN" \
  "https://discord.com/api/v10/guilds/{guild_id}/soundboard-sounds/{sound_id}"
```

---

## GET /guilds/{guild_id}/stickers

### Example

```bash
curl -X GET \
  -H "Authorization: Bearer $TOKEN" \
  "https://discord.com/api/v10/guilds/{guild_id}/stickers"
```

---

## POST /guilds/{guild_id}/stickers

### Example

```bash
curl -X POST \
  -H "Authorization: Bearer $TOKEN" \
  "https://discord.com/api/v10/guilds/{guild_id}/stickers"
```

---

## GET /guilds/{guild_id}/stickers/{sticker_id}

### Example

```bash
curl -X GET \
  -H "Authorization: Bearer $TOKEN" \
  "https://discord.com/api/v10/guilds/{guild_id}/stickers/{sticker_id}"
```

---

## DELETE /guilds/{guild_id}/stickers/{sticker_id}

### Example

```bash
curl -X DELETE \
  -H "Authorization: Bearer $TOKEN" \
  "https://discord.com/api/v10/guilds/{guild_id}/stickers/{sticker_id}"
```

---

## PATCH /guilds/{guild_id}/stickers/{sticker_id}

### Example

```bash
curl -X PATCH \
  -H "Authorization: Bearer $TOKEN" \
  "https://discord.com/api/v10/guilds/{guild_id}/stickers/{sticker_id}"
```

---

## GET /guilds/{guild_id}/templates

### Example

```bash
curl -X GET \
  -H "Authorization: Bearer $TOKEN" \
  "https://discord.com/api/v10/guilds/{guild_id}/templates"
```

---

## POST /guilds/{guild_id}/templates

### Example

```bash
curl -X POST \
  -H "Authorization: Bearer $TOKEN" \
  "https://discord.com/api/v10/guilds/{guild_id}/templates"
```

---

## PUT /guilds/{guild_id}/templates/{code}

### Example

```bash
curl -X PUT \
  -H "Authorization: Bearer $TOKEN" \
  "https://discord.com/api/v10/guilds/{guild_id}/templates/{code}"
```

---

## DELETE /guilds/{guild_id}/templates/{code}

### Example

```bash
curl -X DELETE \
  -H "Authorization: Bearer $TOKEN" \
  "https://discord.com/api/v10/guilds/{guild_id}/templates/{code}"
```

---

## PATCH /guilds/{guild_id}/templates/{code}

### Example

```bash
curl -X PATCH \
  -H "Authorization: Bearer $TOKEN" \
  "https://discord.com/api/v10/guilds/{guild_id}/templates/{code}"
```

---

## GET /guilds/{guild_id}/threads/active

### Example

```bash
curl -X GET \
  -H "Authorization: Bearer $TOKEN" \
  "https://discord.com/api/v10/guilds/{guild_id}/threads/active"
```

---

## GET /guilds/{guild_id}/vanity-url

### Example

```bash
curl -X GET \
  -H "Authorization: Bearer $TOKEN" \
  "https://discord.com/api/v10/guilds/{guild_id}/vanity-url"
```

---

## GET /guilds/{guild_id}/voice-states/@me

### Example

```bash
curl -X GET \
  -H "Authorization: Bearer $TOKEN" \
  "https://discord.com/api/v10/guilds/{guild_id}/voice-states/@me"
```

---

## PATCH /guilds/{guild_id}/voice-states/@me

### Example

```bash
curl -X PATCH \
  -H "Authorization: Bearer $TOKEN" \
  "https://discord.com/api/v10/guilds/{guild_id}/voice-states/@me"
```

---

## GET /guilds/{guild_id}/voice-states/{user_id}

### Example

```bash
curl -X GET \
  -H "Authorization: Bearer $TOKEN" \
  "https://discord.com/api/v10/guilds/{guild_id}/voice-states/{user_id}"
```

---

## PATCH /guilds/{guild_id}/voice-states/{user_id}

### Example

```bash
curl -X PATCH \
  -H "Authorization: Bearer $TOKEN" \
  "https://discord.com/api/v10/guilds/{guild_id}/voice-states/{user_id}"
```

---

## GET /guilds/{guild_id}/webhooks

### Example

```bash
curl -X GET \
  -H "Authorization: Bearer $TOKEN" \
  "https://discord.com/api/v10/guilds/{guild_id}/webhooks"
```

---

## GET /guilds/{guild_id}/welcome-screen

### Example

```bash
curl -X GET \
  -H "Authorization: Bearer $TOKEN" \
  "https://discord.com/api/v10/guilds/{guild_id}/welcome-screen"
```

---

## PATCH /guilds/{guild_id}/welcome-screen

### Example

```bash
curl -X PATCH \
  -H "Authorization: Bearer $TOKEN" \
  "https://discord.com/api/v10/guilds/{guild_id}/welcome-screen"
```

---

## GET /guilds/{guild_id}/widget

### Example

```bash
curl -X GET \
  -H "Authorization: Bearer $TOKEN" \
  "https://discord.com/api/v10/guilds/{guild_id}/widget"
```

---

## PATCH /guilds/{guild_id}/widget

### Example

```bash
curl -X PATCH \
  -H "Authorization: Bearer $TOKEN" \
  "https://discord.com/api/v10/guilds/{guild_id}/widget"
```

---

## GET /guilds/{guild_id}/widget.json

### Example

```bash
curl -X GET \
  -H "Authorization: Bearer $TOKEN" \
  "https://discord.com/api/v10/guilds/{guild_id}/widget.json"
```

---

## GET /guilds/{guild_id}/widget.png

### Parameters

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| `style` | query | string | No |  |

### Example

```bash
curl -X GET \
  -H "Authorization: Bearer $TOKEN" \
  "https://discord.com/api/v10/guilds/{guild_id}/widget.png"
```

---

## POST /interactions/{interaction_id}/{interaction_token}/callback

### Parameters

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| `with_response` | query | boolean | No |  |

### Example

```bash
curl -X POST \
  -H "Authorization: Bearer $TOKEN" \
  "https://discord.com/api/v10/interactions/{interaction_id}/{interaction_token}/callback"
```

---

## GET /invites/{code}

### Parameters

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| `with_counts` | query | boolean | No |  |
| `guild_scheduled_event_id` | query | string | No |  |

### Example

```bash
curl -X GET \
  -H "Authorization: Bearer $TOKEN" \
  "https://discord.com/api/v10/invites/{code}"
```

---

## DELETE /invites/{code}

### Example

```bash
curl -X DELETE \
  -H "Authorization: Bearer $TOKEN" \
  "https://discord.com/api/v10/invites/{code}"
```

---

## PUT /lobbies

### Example

```bash
curl -X PUT \
  -H "Authorization: Bearer $TOKEN" \
  "https://discord.com/api/v10/lobbies"
```

---

## POST /lobbies

### Example

```bash
curl -X POST \
  -H "Authorization: Bearer $TOKEN" \
  "https://discord.com/api/v10/lobbies"
```

---

## GET /lobbies/{lobby_id}

### Example

```bash
curl -X GET \
  -H "Authorization: Bearer $TOKEN" \
  "https://discord.com/api/v10/lobbies/{lobby_id}"
```

---

## PATCH /lobbies/{lobby_id}

### Example

```bash
curl -X PATCH \
  -H "Authorization: Bearer $TOKEN" \
  "https://discord.com/api/v10/lobbies/{lobby_id}"
```

---

## PATCH /lobbies/{lobby_id}/channel-linking

### Example

```bash
curl -X PATCH \
  -H "Authorization: Bearer $TOKEN" \
  "https://discord.com/api/v10/lobbies/{lobby_id}/channel-linking"
```

---

## DELETE /lobbies/{lobby_id}/members/@me

### Example

```bash
curl -X DELETE \
  -H "Authorization: Bearer $TOKEN" \
  "https://discord.com/api/v10/lobbies/{lobby_id}/members/@me"
```

---

## POST /lobbies/{lobby_id}/members/@me/invites

### Example

```bash
curl -X POST \
  -H "Authorization: Bearer $TOKEN" \
  "https://discord.com/api/v10/lobbies/{lobby_id}/members/@me/invites"
```

---

## POST /lobbies/{lobby_id}/members/bulk

### Example

```bash
curl -X POST \
  -H "Authorization: Bearer $TOKEN" \
  "https://discord.com/api/v10/lobbies/{lobby_id}/members/bulk"
```

---

## PUT /lobbies/{lobby_id}/members/{user_id}

### Example

```bash
curl -X PUT \
  -H "Authorization: Bearer $TOKEN" \
  "https://discord.com/api/v10/lobbies/{lobby_id}/members/{user_id}"
```

---

## DELETE /lobbies/{lobby_id}/members/{user_id}

### Example

```bash
curl -X DELETE \
  -H "Authorization: Bearer $TOKEN" \
  "https://discord.com/api/v10/lobbies/{lobby_id}/members/{user_id}"
```

---

## POST /lobbies/{lobby_id}/members/{user_id}/invites

### Example

```bash
curl -X POST \
  -H "Authorization: Bearer $TOKEN" \
  "https://discord.com/api/v10/lobbies/{lobby_id}/members/{user_id}/invites"
```

---

## GET /lobbies/{lobby_id}/messages

### Parameters

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| `limit` | query | integer | No |  |

### Example

```bash
curl -X GET \
  -H "Authorization: Bearer $TOKEN" \
  "https://discord.com/api/v10/lobbies/{lobby_id}/messages"
```

---

## POST /lobbies/{lobby_id}/messages

### Example

```bash
curl -X POST \
  -H "Authorization: Bearer $TOKEN" \
  "https://discord.com/api/v10/lobbies/{lobby_id}/messages"
```

---

## GET /oauth2/@me

### Example

```bash
curl -X GET \
  -H "Authorization: Bearer $TOKEN" \
  "https://discord.com/api/v10/oauth2/@me"
```

---

## GET /oauth2/applications/@me

### Example

```bash
curl -X GET \
  -H "Authorization: Bearer $TOKEN" \
  "https://discord.com/api/v10/oauth2/applications/@me"
```

---

## GET /oauth2/keys

### Example

```bash
curl -X GET \
  -H "Authorization: Bearer $TOKEN" \
  "https://discord.com/api/v10/oauth2/keys"
```

---

## GET /oauth2/userinfo

### Example

```bash
curl -X GET \
  -H "Authorization: Bearer $TOKEN" \
  "https://discord.com/api/v10/oauth2/userinfo"
```

---

## POST /partner-sdk/provisional-accounts/unmerge

### Example

```bash
curl -X POST \
  -H "Authorization: Bearer $TOKEN" \
  "https://discord.com/api/v10/partner-sdk/provisional-accounts/unmerge"
```

---

## POST /partner-sdk/provisional-accounts/unmerge/bot

### Example

```bash
curl -X POST \
  -H "Authorization: Bearer $TOKEN" \
  "https://discord.com/api/v10/partner-sdk/provisional-accounts/unmerge/bot"
```

---

## POST /partner-sdk/token

### Example

```bash
curl -X POST \
  -H "Authorization: Bearer $TOKEN" \
  "https://discord.com/api/v10/partner-sdk/token"
```

---

## POST /partner-sdk/token/bot

### Example

```bash
curl -X POST \
  -H "Authorization: Bearer $TOKEN" \
  "https://discord.com/api/v10/partner-sdk/token/bot"
```

---

## GET /soundboard-default-sounds

### Example

```bash
curl -X GET \
  -H "Authorization: Bearer $TOKEN" \
  "https://discord.com/api/v10/soundboard-default-sounds"
```

---

## POST /stage-instances

### Example

```bash
curl -X POST \
  -H "Authorization: Bearer $TOKEN" \
  "https://discord.com/api/v10/stage-instances"
```

---

## GET /stage-instances/{channel_id}

### Example

```bash
curl -X GET \
  -H "Authorization: Bearer $TOKEN" \
  "https://discord.com/api/v10/stage-instances/{channel_id}"
```

---

## DELETE /stage-instances/{channel_id}

### Example

```bash
curl -X DELETE \
  -H "Authorization: Bearer $TOKEN" \
  "https://discord.com/api/v10/stage-instances/{channel_id}"
```

---

## PATCH /stage-instances/{channel_id}

### Example

```bash
curl -X PATCH \
  -H "Authorization: Bearer $TOKEN" \
  "https://discord.com/api/v10/stage-instances/{channel_id}"
```

---

## GET /sticker-packs

### Example

```bash
curl -X GET \
  -H "Authorization: Bearer $TOKEN" \
  "https://discord.com/api/v10/sticker-packs"
```

---

## GET /sticker-packs/{pack_id}

### Example

```bash
curl -X GET \
  -H "Authorization: Bearer $TOKEN" \
  "https://discord.com/api/v10/sticker-packs/{pack_id}"
```

---

## GET /stickers/{sticker_id}

### Example

```bash
curl -X GET \
  -H "Authorization: Bearer $TOKEN" \
  "https://discord.com/api/v10/stickers/{sticker_id}"
```

---

## GET /users/@me

### Example

```bash
curl -X GET \
  -H "Authorization: Bearer $TOKEN" \
  "https://discord.com/api/v10/users/@me"
```

---

## PATCH /users/@me

### Example

```bash
curl -X PATCH \
  -H "Authorization: Bearer $TOKEN" \
  "https://discord.com/api/v10/users/@me"
```

---

## GET /users/@me/applications/{application_id}/entitlements

### Parameters

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| `sku_ids` | query | string | No |  |
| `exclude_consumed` | query | boolean | No |  |

### Example

```bash
curl -X GET \
  -H "Authorization: Bearer $TOKEN" \
  "https://discord.com/api/v10/users/@me/applications/{application_id}/entitlements"
```

---

## GET /users/@me/applications/{application_id}/role-connection

### Example

```bash
curl -X GET \
  -H "Authorization: Bearer $TOKEN" \
  "https://discord.com/api/v10/users/@me/applications/{application_id}/role-connection"
```

---

## PUT /users/@me/applications/{application_id}/role-connection

### Example

```bash
curl -X PUT \
  -H "Authorization: Bearer $TOKEN" \
  "https://discord.com/api/v10/users/@me/applications/{application_id}/role-connection"
```

---

## DELETE /users/@me/applications/{application_id}/role-connection

### Example

```bash
curl -X DELETE \
  -H "Authorization: Bearer $TOKEN" \
  "https://discord.com/api/v10/users/@me/applications/{application_id}/role-connection"
```

---

## POST /users/@me/channels

### Example

```bash
curl -X POST \
  -H "Authorization: Bearer $TOKEN" \
  "https://discord.com/api/v10/users/@me/channels"
```

---

## GET /users/@me/connections

### Example

```bash
curl -X GET \
  -H "Authorization: Bearer $TOKEN" \
  "https://discord.com/api/v10/users/@me/connections"
```

---

## GET /users/@me/guilds

### Parameters

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| `before` | query | string | No |  |
| `after` | query | string | No |  |
| `limit` | query | integer | No |  |
| `with_counts` | query | boolean | No |  |

### Example

```bash
curl -X GET \
  -H "Authorization: Bearer $TOKEN" \
  "https://discord.com/api/v10/users/@me/guilds"
```

---

## DELETE /users/@me/guilds/{guild_id}

### Example

```bash
curl -X DELETE \
  -H "Authorization: Bearer $TOKEN" \
  "https://discord.com/api/v10/users/@me/guilds/{guild_id}"
```

---

## GET /users/@me/guilds/{guild_id}/member

### Example

```bash
curl -X GET \
  -H "Authorization: Bearer $TOKEN" \
  "https://discord.com/api/v10/users/@me/guilds/{guild_id}/member"
```

---

## GET /users/{user_id}

### Example

```bash
curl -X GET \
  -H "Authorization: Bearer $TOKEN" \
  "https://discord.com/api/v10/users/{user_id}"
```

---

## GET /voice/regions

### Example

```bash
curl -X GET \
  -H "Authorization: Bearer $TOKEN" \
  "https://discord.com/api/v10/voice/regions"
```

---

## GET /webhooks/{webhook_id}

### Example

```bash
curl -X GET \
  -H "Authorization: Bearer $TOKEN" \
  "https://discord.com/api/v10/webhooks/{webhook_id}"
```

---

## DELETE /webhooks/{webhook_id}

### Example

```bash
curl -X DELETE \
  -H "Authorization: Bearer $TOKEN" \
  "https://discord.com/api/v10/webhooks/{webhook_id}"
```

---

## PATCH /webhooks/{webhook_id}

### Example

```bash
curl -X PATCH \
  -H "Authorization: Bearer $TOKEN" \
  "https://discord.com/api/v10/webhooks/{webhook_id}"
```

---

## GET /webhooks/{webhook_id}/{webhook_token}

### Example

```bash
curl -X GET \
  -H "Authorization: Bearer $TOKEN" \
  "https://discord.com/api/v10/webhooks/{webhook_id}/{webhook_token}"
```

---

## POST /webhooks/{webhook_id}/{webhook_token}

### Parameters

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| `wait` | query | boolean | No |  |
| `thread_id` | query | string | No |  |
| `with_components` | query | boolean | No |  |

### Example

```bash
curl -X POST \
  -H "Authorization: Bearer $TOKEN" \
  "https://discord.com/api/v10/webhooks/{webhook_id}/{webhook_token}"
```

---

## DELETE /webhooks/{webhook_id}/{webhook_token}

### Example

```bash
curl -X DELETE \
  -H "Authorization: Bearer $TOKEN" \
  "https://discord.com/api/v10/webhooks/{webhook_id}/{webhook_token}"
```

---

## PATCH /webhooks/{webhook_id}/{webhook_token}

### Example

```bash
curl -X PATCH \
  -H "Authorization: Bearer $TOKEN" \
  "https://discord.com/api/v10/webhooks/{webhook_id}/{webhook_token}"
```

---

## POST /webhooks/{webhook_id}/{webhook_token}/github

### Parameters

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| `wait` | query | boolean | No |  |
| `thread_id` | query | string | No |  |

### Example

```bash
curl -X POST \
  -H "Authorization: Bearer $TOKEN" \
  "https://discord.com/api/v10/webhooks/{webhook_id}/{webhook_token}/github"
```

---

## GET /webhooks/{webhook_id}/{webhook_token}/messages/@original

### Parameters

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| `thread_id` | query | string | No |  |

### Example

```bash
curl -X GET \
  -H "Authorization: Bearer $TOKEN" \
  "https://discord.com/api/v10/webhooks/{webhook_id}/{webhook_token}/messages/@original"
```

---

## DELETE /webhooks/{webhook_id}/{webhook_token}/messages/@original

### Parameters

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| `thread_id` | query | string | No |  |

### Example

```bash
curl -X DELETE \
  -H "Authorization: Bearer $TOKEN" \
  "https://discord.com/api/v10/webhooks/{webhook_id}/{webhook_token}/messages/@original"
```

---

## PATCH /webhooks/{webhook_id}/{webhook_token}/messages/@original

### Parameters

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| `thread_id` | query | string | No |  |
| `with_components` | query | boolean | No |  |

### Example

```bash
curl -X PATCH \
  -H "Authorization: Bearer $TOKEN" \
  "https://discord.com/api/v10/webhooks/{webhook_id}/{webhook_token}/messages/@original"
```

---

## GET /webhooks/{webhook_id}/{webhook_token}/messages/{message_id}

### Parameters

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| `thread_id` | query | string | No |  |

### Example

```bash
curl -X GET \
  -H "Authorization: Bearer $TOKEN" \
  "https://discord.com/api/v10/webhooks/{webhook_id}/{webhook_token}/messages/{message_id}"
```

---

## DELETE /webhooks/{webhook_id}/{webhook_token}/messages/{message_id}

### Parameters

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| `thread_id` | query | string | No |  |

### Example

```bash
curl -X DELETE \
  -H "Authorization: Bearer $TOKEN" \
  "https://discord.com/api/v10/webhooks/{webhook_id}/{webhook_token}/messages/{message_id}"
```

---

## PATCH /webhooks/{webhook_id}/{webhook_token}/messages/{message_id}

### Parameters

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| `thread_id` | query | string | No |  |
| `with_components` | query | boolean | No |  |

### Example

```bash
curl -X PATCH \
  -H "Authorization: Bearer $TOKEN" \
  "https://discord.com/api/v10/webhooks/{webhook_id}/{webhook_token}/messages/{message_id}"
```

---

## POST /webhooks/{webhook_id}/{webhook_token}/slack

### Parameters

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| `wait` | query | boolean | No |  |
| `thread_id` | query | string | No |  |

### Example

```bash
curl -X POST \
  -H "Authorization: Bearer $TOKEN" \
  "https://discord.com/api/v10/webhooks/{webhook_id}/{webhook_token}/slack"
```

---
