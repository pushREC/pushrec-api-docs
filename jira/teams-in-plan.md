---
created: 2026-01-09
tags: [type/api-reference, api/teams-in-plan]
api_name: The Jira Cloud platform REST API
category: Teams in plan
endpoint_count: 9
---

# The Jira Cloud platform REST API - Teams In Plan

[[README|Back to Overview]]

---

## GET /rest/api/3/plans/plan/{planId}/team

**Get teams in plan paginated**

Returns a [paginated](#pagination) list of plan-only and Atlassian teams in a plan.

**[Permissions](#permissions) required:** *Administer Jira* [global permission](https://confluence.atlassian.com/x/x4dKLg).

### Parameters

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| `planId` | path | integer | Yes | The ID of the plan. |
| `cursor` | query | string | No | The cursor to start from. If not provided, the fir |
| `maxResults` | query | integer | No | The maximum number of plan teams to return per pag |

### Example

```bash
curl -X GET \
  -H "Authorization: Bearer $TOKEN" \
  "https://your-domain.atlassian.net/rest/api/3/plans/plan/{planId}/team"
```

---

## POST /rest/api/3/plans/plan/{planId}/team/atlassian

**Add Atlassian team to plan**

Adds an existing Atlassian team to a plan and configures their plannning settings.

**[Permissions](#permissions) required:** *Administer Jira* [global permission](https://confluence.atlassian.com/x/x4dKLg).

### Parameters

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| `planId` | path | integer | Yes | The ID of the plan. |

### Example

```bash
curl -X POST \
  -H "Authorization: Bearer $TOKEN" \
  "https://your-domain.atlassian.net/rest/api/3/plans/plan/{planId}/team/atlassian"
```

---

## DELETE /rest/api/3/plans/plan/{planId}/team/atlassian/{atlassianTeamId}

**Remove Atlassian team from plan**

Removes an Atlassian team from a plan and deletes their planning settings.

**[Permissions](#permissions) required:** *Administer Jira* [global permission](https://confluence.atlassian.com/x/x4dKLg).

### Parameters

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| `planId` | path | integer | Yes | The ID of the plan. |
| `atlassianTeamId` | path | string | Yes | The ID of the Atlassian team. |

### Example

```bash
curl -X DELETE \
  -H "Authorization: Bearer $TOKEN" \
  "https://your-domain.atlassian.net/rest/api/3/plans/plan/{planId}/team/atlassian/{atlassianTeamId}"
```

---

## GET /rest/api/3/plans/plan/{planId}/team/atlassian/{atlassianTeamId}

**Get Atlassian team in plan**

Returns planning settings for an Atlassian team in a plan.

**[Permissions](#permissions) required:** *Administer Jira* [global permission](https://confluence.atlassian.com/x/x4dKLg).

### Parameters

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| `planId` | path | integer | Yes | The ID of the plan. |
| `atlassianTeamId` | path | string | Yes | The ID of the Atlassian team. |

### Example

```bash
curl -X GET \
  -H "Authorization: Bearer $TOKEN" \
  "https://your-domain.atlassian.net/rest/api/3/plans/plan/{planId}/team/atlassian/{atlassianTeamId}"
```

---

## PUT /rest/api/3/plans/plan/{planId}/team/atlassian/{atlassianTeamId}

**Update Atlassian team in plan**

Updates any of the following planning settings of an Atlassian team in a plan using [JSON Patch](https://datatracker.ietf.org/doc/html/rfc6902).

 *  planningStyle
 *  issueSourceId
 *  sprintLength
 *  capacity

**[Permissions](#permissions) required:** *Administer Jira* [global permission](https://confluence.atlassian.com/x/x4dKLg).

*Note that "add" operations do not respect array indexes in target locations. Call the "Get Atlassian team in plan" endpoint to find out the order of array elements.*

### Parameters

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| `planId` | path | integer | Yes | The ID of the plan. |
| `atlassianTeamId` | path | string | Yes | The ID of the Atlassian team. |

### Example

```bash
curl -X PUT \
  -H "Authorization: Bearer $TOKEN" \
  "https://your-domain.atlassian.net/rest/api/3/plans/plan/{planId}/team/atlassian/{atlassianTeamId}"
```

---

## POST /rest/api/3/plans/plan/{planId}/team/planonly

**Create plan-only team**

Creates a plan-only team and configures their planning settings.

**[Permissions](#permissions) required:** *Administer Jira* [global permission](https://confluence.atlassian.com/x/x4dKLg).

### Parameters

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| `planId` | path | integer | Yes | The ID of the plan. |

### Example

```bash
curl -X POST \
  -H "Authorization: Bearer $TOKEN" \
  "https://your-domain.atlassian.net/rest/api/3/plans/plan/{planId}/team/planonly"
```

---

## DELETE /rest/api/3/plans/plan/{planId}/team/planonly/{planOnlyTeamId}

**Delete plan-only team**

Deletes a plan-only team and their planning settings.

**[Permissions](#permissions) required:** *Administer Jira* [global permission](https://confluence.atlassian.com/x/x4dKLg).

### Parameters

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| `planId` | path | integer | Yes | The ID of the plan. |
| `planOnlyTeamId` | path | integer | Yes | The ID of the plan-only team. |

### Example

```bash
curl -X DELETE \
  -H "Authorization: Bearer $TOKEN" \
  "https://your-domain.atlassian.net/rest/api/3/plans/plan/{planId}/team/planonly/{planOnlyTeamId}"
```

---

## GET /rest/api/3/plans/plan/{planId}/team/planonly/{planOnlyTeamId}

**Get plan-only team**

Returns planning settings for a plan-only team.

**[Permissions](#permissions) required:** *Administer Jira* [global permission](https://confluence.atlassian.com/x/x4dKLg).

### Parameters

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| `planId` | path | integer | Yes | The ID of the plan. |
| `planOnlyTeamId` | path | integer | Yes | The ID of the plan-only team. |

### Example

```bash
curl -X GET \
  -H "Authorization: Bearer $TOKEN" \
  "https://your-domain.atlassian.net/rest/api/3/plans/plan/{planId}/team/planonly/{planOnlyTeamId}"
```

---

## PUT /rest/api/3/plans/plan/{planId}/team/planonly/{planOnlyTeamId}

**Update plan-only team**

Updates any of the following planning settings of a plan-only team using [JSON Patch](https://datatracker.ietf.org/doc/html/rfc6902).

 *  name
 *  planningStyle
 *  issueSourceId
 *  sprintLength
 *  capacity
 *  memberAccountIds

**[Permissions](#permissions) required:** *Administer Jira* [global permission](https://confluence.atlassian.com/x/x4dKLg).

*Note that "add" operations do not respect array indexes in target locations. Call the "Get plan-only team" endpoint to find out the order of array elements.*

### Parameters

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| `planId` | path | integer | Yes | The ID of the plan. |
| `planOnlyTeamId` | path | integer | Yes | The ID of the plan-only team. |

### Example

```bash
curl -X PUT \
  -H "Authorization: Bearer $TOKEN" \
  "https://your-domain.atlassian.net/rest/api/3/plans/plan/{planId}/team/planonly/{planOnlyTeamId}"
```

---
