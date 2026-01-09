---
created: 2026-01-09
tags: [type/api-reference, api/plans]
api_name: The Jira Cloud platform REST API
category: Plans
endpoint_count: 7
---

# The Jira Cloud platform REST API - Plans

[[README|Back to Overview]]

---

## GET /rest/api/3/plans/plan

**Get plans paginated**

Returns a [paginated](#pagination) list of plans.

**[Permissions](#permissions) required:** *Administer Jira* [global permission](https://confluence.atlassian.com/x/x4dKLg).

### Parameters

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| `includeTrashed` | query | boolean | No | Whether to include trashed plans in the results. |
| `includeArchived` | query | boolean | No | Whether to include archived plans in the results. |
| `cursor` | query | string | No | The cursor to start from. If not provided, the fir |
| `maxResults` | query | integer | No | The maximum number of plans to return per page. Th |

### Example

```bash
curl -X GET \
  -H "Authorization: Bearer $TOKEN" \
  "https://your-domain.atlassian.net/rest/api/3/plans/plan"
```

---

## POST /rest/api/3/plans/plan

**Create plan**

Creates a plan.

**[Permissions](#permissions) required:** *Administer Jira* [global permission](https://confluence.atlassian.com/x/x4dKLg).

### Parameters

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| `useGroupId` | query | boolean | No | Whether to accept group IDs instead of group names |

### Example

```bash
curl -X POST \
  -H "Authorization: Bearer $TOKEN" \
  "https://your-domain.atlassian.net/rest/api/3/plans/plan"
```

---

## GET /rest/api/3/plans/plan/{planId}

**Get plan**

Returns a plan.

**[Permissions](#permissions) required:** *Administer Jira* [global permission](https://confluence.atlassian.com/x/x4dKLg).

### Parameters

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| `planId` | path | integer | Yes | The ID of the plan. |
| `useGroupId` | query | boolean | No | Whether to return group IDs instead of group names |

### Example

```bash
curl -X GET \
  -H "Authorization: Bearer $TOKEN" \
  "https://your-domain.atlassian.net/rest/api/3/plans/plan/{planId}"
```

---

## PUT /rest/api/3/plans/plan/{planId}

**Update plan**

Updates any of the following details of a plan using [JSON Patch](https://datatracker.ietf.org/doc/html/rfc6902).

 *  name
 *  leadAccountId
 *  scheduling
    
     *  estimation with StoryPoints, Days or Hours as possible values
     *  startDate
        
         *  type with DueDate, TargetStartDate, TargetEndDate or DateCustomField as possible values
         *  dateCustomFieldId
     *  endDate
        
         *  type with DueDate, TargetStartDate, TargetEndDate or DateCustomField as possible values
         *  dateCustomFieldId
     *  inferredDates with None, SprintDates or ReleaseDates as possible values
     *  dependencies with Sequential or Concurrent as possible values
 *  issueSources
    
     *  type with Board, Project or Filter as possible values
     *  value
 *  exclusionRules
    
     *  numberOfDaysToShowCompletedIssues
     *  issueIds
     *  workStatusIds
     *  workStatusCategoryIds
     *  issueTypeIds
     *  releaseIds
 *  crossProjectReleases
    
     *  name
     *  releaseIds
 *  customFields
    
     *  customFieldId
     *  filter
 *  permissions
    
     *  type with View or Edit as possible values
     *  holder
        
         *  type with Group or AccountId as possible values
         *  value

**[Permissions](#permissions) required:** *Administer Jira* [global permission](https://confluence.atlassian.com/x/x4dKLg).

*Note that "add" operations do not respect array indexes in target locations. Call the "Get plan" endpoint to find out the order of array elements.*

### Parameters

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| `planId` | path | integer | Yes | The ID of the plan. |
| `useGroupId` | query | boolean | No | Whether to accept group IDs instead of group names |

### Example

```bash
curl -X PUT \
  -H "Authorization: Bearer $TOKEN" \
  "https://your-domain.atlassian.net/rest/api/3/plans/plan/{planId}"
```

---

## PUT /rest/api/3/plans/plan/{planId}/archive

**Archive plan**

Archives a plan.

**[Permissions](#permissions) required:** *Administer Jira* [global permission](https://confluence.atlassian.com/x/x4dKLg).

### Parameters

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| `planId` | path | integer | Yes | The ID of the plan. |

### Example

```bash
curl -X PUT \
  -H "Authorization: Bearer $TOKEN" \
  "https://your-domain.atlassian.net/rest/api/3/plans/plan/{planId}/archive"
```

---

## POST /rest/api/3/plans/plan/{planId}/duplicate

**Duplicate plan**

Duplicates a plan.

**[Permissions](#permissions) required:** *Administer Jira* [global permission](https://confluence.atlassian.com/x/x4dKLg).

### Parameters

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| `planId` | path | integer | Yes | The ID of the plan. |

### Example

```bash
curl -X POST \
  -H "Authorization: Bearer $TOKEN" \
  "https://your-domain.atlassian.net/rest/api/3/plans/plan/{planId}/duplicate"
```

---

## PUT /rest/api/3/plans/plan/{planId}/trash

**Trash plan**

Moves a plan to trash.

**[Permissions](#permissions) required:** *Administer Jira* [global permission](https://confluence.atlassian.com/x/x4dKLg).

### Parameters

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| `planId` | path | integer | Yes | The ID of the plan. |

### Example

```bash
curl -X PUT \
  -H "Authorization: Bearer $TOKEN" \
  "https://your-domain.atlassian.net/rest/api/3/plans/plan/{planId}/trash"
```

---
