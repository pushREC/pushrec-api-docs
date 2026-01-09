---
created: 2026-01-09
tags: [type/api-reference, api/issue-custom-field-associations]
api_name: The Jira Cloud platform REST API
category: Issue custom field associations
endpoint_count: 2
---

# The Jira Cloud platform REST API - Issue Custom Field Associations

[[README|Back to Overview]]

---

## DELETE /rest/api/3/field/association

**Remove associations**

Unassociates a set of fields with a project and issue type context.

Fields will be unassociated with all projects/issue types that share the same field configuration which the provided project and issue types are using. This means that while the field will be unassociated with the provided project and issue types, it will also be unassociated with any other projects and issue types that share the same field configuration.

If a success response is returned it means that the field association has been removed in any applicable contexts where it was present.

Up to 50 fields and up to 100 projects and issue types can be unassociated in a single request. If more fields or projects are provided a 400 response will be returned.

**[Permissions](#permissions) required:** *Administer Jira* [global permission](https://confluence.atlassian.com/x/x4dKLg).

### Example

```bash
curl -X DELETE \
  -H "Authorization: Bearer $TOKEN" \
  "https://your-domain.atlassian.net/rest/api/3/field/association"
```

---

## PUT /rest/api/3/field/association

**Create associations**

Associates fields with projects.

Fields will be associated with each issue type on the requested projects.

Fields will be associated with all projects that share the same field configuration which the provided projects are using. This means that while the field will be associated with the requested projects, it will also be associated with any other projects that share the same field configuration.

If a success response is returned it means that the field association has been created in any applicable contexts where it wasn't already present.

Up to 50 fields and up to 100 projects can be associated in a single request. If more fields or projects are provided a 400 response will be returned.

**[Permissions](#permissions) required:** *Administer Jira* [global permission](https://confluence.atlassian.com/x/x4dKLg).

### Example

```bash
curl -X PUT \
  -H "Authorization: Bearer $TOKEN" \
  "https://your-domain.atlassian.net/rest/api/3/field/association"
```

---
