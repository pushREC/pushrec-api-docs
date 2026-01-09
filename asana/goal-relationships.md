---
created: 2026-01-09
tags: [type/api-reference, api/goal-relationships]
api_name: Asana
category: Goal relationships
endpoint_count: 5
---

# Asana - Goal Relationships

[[README|Back to Overview]]

---

## GET /goal_relationships/{goal_relationship_gid}

**Get a goal relationship**

Returns the complete updated goal relationship record for a single goal relationship.

### Parameters

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| `opt_fields` | query | array | No | This endpoint returns a resource which excludes so |

### Example

```bash
curl -X GET \
  -H "Authorization: Bearer $TOKEN" \
  "https://app.asana.com/api/1.0/goal_relationships/{goal_relationship_gid}"
```

---

## PUT /goal_relationships/{goal_relationship_gid}

**Update a goal relationship**

An existing goal relationship can be updated by making a PUT request on the URL for
that goal relationship. Only the fields provided in the `data` block will be updated;
any unspecified fields will remain unchanged.

Returns the complete updated goal relationship record.

### Parameters

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| `opt_fields` | query | array | No | This endpoint returns a resource which excludes so |

### Example

```bash
curl -X PUT \
  -H "Authorization: Bearer $TOKEN" \
  "https://app.asana.com/api/1.0/goal_relationships/{goal_relationship_gid}"
```

---

## GET /goal_relationships

**Get goal relationships**

Returns compact goal relationship records.

### Parameters

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| `` | query | string | No |  |
| `` | query | string | No |  |
| `` | query | string | No |  |
| `supported_goal` | query | string | Yes | Globally unique identifier for the supported goal  |
| `resource_subtype` | query | string | No | If provided, filter to goal relationships with a g |
| `opt_fields` | query | array | No | This endpoint returns a resource which excludes so |

### Example

```bash
curl -X GET \
  -H "Authorization: Bearer $TOKEN" \
  "https://app.asana.com/api/1.0/goal_relationships"
```

---

## POST /goals/{goal_gid}/addSupportingRelationship

**Add a supporting goal relationship**

Creates a goal relationship by adding a supporting resource to a given goal.

Returns the newly created goal relationship record.

### Parameters

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| `opt_fields` | query | array | No | This endpoint returns a resource which excludes so |

### Example

```bash
curl -X POST \
  -H "Authorization: Bearer $TOKEN" \
  "https://app.asana.com/api/1.0/goals/{goal_gid}/addSupportingRelationship"
```

---

## POST /goals/{goal_gid}/removeSupportingRelationship

**Removes a supporting goal relationship**

Removes a goal relationship for a given parent goal.

### Example

```bash
curl -X POST \
  -H "Authorization: Bearer $TOKEN" \
  "https://app.asana.com/api/1.0/goals/{goal_gid}/removeSupportingRelationship"
```

---
