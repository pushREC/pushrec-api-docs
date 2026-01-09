---
created: 2026-01-09
tags: [type/api-reference, api/custom-field-settings]
api_name: Asana
category: Custom field settings
endpoint_count: 4
---

# Asana - Custom Field Settings

[[README|Back to Overview]]

---

## GET /projects/{project_gid}/custom_field_settings

**Get a project's custom fields**

Returns a list of all of the custom fields settings on a project, in compact form. Note that, as in all queries to collections which return compact representation, `opt_fields` can be used to include more data than is returned in the compact representation. See the [documentation for input/output options](https://developers.asana.com/docs/inputoutput-options) for more information.

### Parameters

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| `opt_fields` | query | array | No | This endpoint returns a resource which excludes so |

### Example

```bash
curl -X GET \
  -H "Authorization: Bearer $TOKEN" \
  "https://app.asana.com/api/1.0/projects/{project_gid}/custom_field_settings"
```

---

## GET /portfolios/{portfolio_gid}/custom_field_settings

**Get a portfolio's custom fields**

Returns a list of all of the custom fields settings on a portfolio, in compact form.

### Parameters

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| `opt_fields` | query | array | No | This endpoint returns a resource which excludes so |

### Example

```bash
curl -X GET \
  -H "Authorization: Bearer $TOKEN" \
  "https://app.asana.com/api/1.0/portfolios/{portfolio_gid}/custom_field_settings"
```

---

## GET /goals/{goal_gid}/custom_field_settings

**Get a goal's custom fields**

Returns a list of all of the custom fields settings on a goal, in compact form. Note that, as in all queries to collections which return compact representation, `opt_fields` can be used to include more data than is returned in the compact representation. See the [documentation for input/output options](https://developers.asana.com/docs/inputoutput-options) for more information.

### Parameters

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| `opt_fields` | query | array | No | This endpoint returns a resource which excludes so |

### Example

```bash
curl -X GET \
  -H "Authorization: Bearer $TOKEN" \
  "https://app.asana.com/api/1.0/goals/{goal_gid}/custom_field_settings"
```

---

## GET /teams/{team_gid}/custom_field_settings

**Get a team's custom fields**

Returns a list of all of the custom fields settings on a team, in compact form. Note that, as in all queries to collections which return compact representation, `opt_fields` can be used to include more data than is returned in the compact representation. See the [documentation for input/output options](https://developers.asana.com/docs/inputoutput-options) for more information.

### Parameters

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| `opt_fields` | query | array | No | This endpoint returns a resource which excludes so |

### Example

```bash
curl -X GET \
  -H "Authorization: Bearer $TOKEN" \
  "https://app.asana.com/api/1.0/teams/{team_gid}/custom_field_settings"
```

---
