---
created: 2026-01-09
tags: [type/api-reference, api/memberships]
api_name: Asana
category: Memberships
endpoint_count: 5
---

# Asana - Memberships

[[README|Back to Overview]]

---

## GET /memberships

**Get multiple memberships**

Returns compact `goal_membership`, `project_membership`, `portfolio_membership`, or `custom_field_membership` records. The possible types for `parent` in this request are `goal`, `project`, `portfolio`, or `custom_field`. An additional member (user GID or team GID) can be passed in to filter to a specific membership.

### Parameters

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| `parent` | query | string | No | Globally unique identifier for `goal`, `project`,  |
| `member` | query | string | No | Globally unique identifier for `team` or `user`. |
| `` | query | string | No |  |
| `` | query | string | No |  |
| `opt_fields` | query | array | No | This endpoint returns a resource which excludes so |

### Example

```bash
curl -X GET \
  -H "Authorization: Bearer $TOKEN" \
  "https://app.asana.com/api/1.0/memberships"
```

---

## POST /memberships

**Create a membership**

Creates a new membership in a `goal`, `project`, `portfolio`, or `custom_field`, where members can be Teams or Users.

Returns the full record of the newly created membership.

### Example

```bash
curl -X POST \
  -H "Authorization: Bearer $TOKEN" \
  "https://app.asana.com/api/1.0/memberships"
```

---

## GET /memberships/{membership_gid}

**Get a membership**

Returns a `project_membership`, `goal_membership`, `portfolio_membership`, or `custom_field_membership` record for a membership id.

### Example

```bash
curl -X GET \
  -H "Authorization: Bearer $TOKEN" \
  "https://app.asana.com/api/1.0/memberships/{membership_gid}"
```

---

## PUT /memberships/{membership_gid}

**Update a membership**

An existing membership can be updated by making a `PUT` request on the membership. Only the fields provided in the `data` block will be updated;
any unspecified fields will remain unchanged. Memberships on `goals`, `projects`, `portfolios`, and `custom_fields` can be updated.

Returns the full record of the updated membership.

### Example

```bash
curl -X PUT \
  -H "Authorization: Bearer $TOKEN" \
  "https://app.asana.com/api/1.0/memberships/{membership_gid}"
```

---

## DELETE /memberships/{membership_gid}

**Delete a membership**

A specific, existing membership for a `goal`, `project`, `portfolio` or `custom_field` can be deleted by making a `DELETE` request
on the URL for that membership.

Returns an empty data record.

### Example

```bash
curl -X DELETE \
  -H "Authorization: Bearer $TOKEN" \
  "https://app.asana.com/api/1.0/memberships/{membership_gid}"
```

---
