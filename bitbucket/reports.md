---
created: 2026-01-09
tags: [type/api-reference, api/reports]
api_name: Bitbucket API
category: Reports
endpoint_count: 9
---

# Bitbucket API - Reports

[[README|Back to Overview]]

---

## GET /repositories/{workspace}/{repo_slug}/commit/{commit}/reports

**List reports**

Returns a paginated list of Reports linked to this commit.

### Parameters

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| `workspace` | path | string | Yes | This can either be the workspace ID (slug) or the  |
| `repo_slug` | path | string | Yes | The repository. |
| `commit` | path | string | Yes | The commit for which to retrieve reports. |

### Example

```bash
curl -X GET \
  -H "Authorization: Bearer $TOKEN" \
  "/repositories/{workspace}/{repo_slug}/commit/{commit}/reports"
```

---

## PUT /repositories/{workspace}/{repo_slug}/commit/{commit}/reports/{reportId}

**Create or update a report**

Creates or updates a report for the specified commit.
To upload a report, make sure to generate an ID that is unique across all reports for that commit. If you want to use an existing id from your own system, we recommend prefixing it with your system's name to avoid collisions, for example, mySystem-001.

### Sample cURL request:
```
curl --request PUT 'https://api.bitbucket.org/2.0/repositories/<username>/<reposity-name>/commit/<commit-hash>/reports/mysystem-001' \
--header 'Content-Type: application/json' \
--data-raw '{
    "title": "Security scan report",
    "details": "This pull request introduces 10 new dependency vulnerabilities.",
    "report_type": "SECURITY",
    "reporter": "mySystem",
    "link": "http://www.mysystem.com/reports/001",
    "result": "FAILED",
    "data": [
        {
            "title": "Duration (seconds)",
            "type": "DURATION",
            "value": 14
        },
        {
            "title": "Safe to merge?",
            "type": "BOOLEAN",
            "value": false
        }
    ]
}'
```

### Possible field values:
report_type: SECURITY, COVERAGE, TEST, BUG
result: PASSED, FAILED, PENDING
data.type: BOOLEAN, DATE, DURATION, LINK, NUMBER, PERCENTAGE, TEXT

#### Data field formats
| Type  Field   | Value Field Type  | Value Field Display |
|:--------------|:------------------|:--------------------|
| None/ Omitted | Number, String or Boolean (not an array or object) | Plain text |
| BOOLEAN	| Boolean | The value will be read as a JSON boolean and displayed as 'Yes' or 'No'. |
| DATE  | Number | The value will be read as a JSON number in the form of a Unix timestamp (milliseconds) and will be displayed as a relative date if the date is less than one week ago, otherwise  it will be displayed as an absolute date. |
| DURATION | Number | The value will be read as a JSON number in milliseconds and will be displayed in a human readable duration format. |
| LINK | Object: `{"text": "Link text here", "href": "https://link.to.annotation/in/external/tool"}` | The value will be read as a JSON object containing the fields "text" and "href" and will be displayed as a clickable link on the report. |
| NUMBER | Number | The value will be read as a JSON number and large numbers will be  displayed in a human readable format (e.g. 14.3k). |
| PERCENTAGE | Number (between 0 and 100) | The value will be read as a JSON number between 0 and 100 and will be displayed with a percentage sign. |
| TEXT | String | The value will be read as a JSON string and will be displayed as-is |

Please refer to the [Code Insights documentation](https://confluence.atlassian.com/bitbucket/code-insights-994316785.html) for more information.


### Parameters

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| `workspace` | path | string | Yes | This can either be the workspace ID (slug) or the  |
| `repo_slug` | path | string | Yes | The repository. |
| `commit` | path | string | Yes | The commit the report belongs to. |
| `reportId` | path | string | Yes | Either the uuid or external-id of the report. |
| `_body` | body | string | Yes | The report to create or update |

### Example

```bash
curl -X PUT \
  -H "Authorization: Bearer $TOKEN" \
  "/repositories/{workspace}/{repo_slug}/commit/{commit}/reports/{reportId}"
```

---

## GET /repositories/{workspace}/{repo_slug}/commit/{commit}/reports/{reportId}

**Get a report**

Returns a single Report matching the provided ID.

### Parameters

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| `workspace` | path | string | Yes | This can either be the workspace ID (slug) or the  |
| `repo_slug` | path | string | Yes | The repository. |
| `commit` | path | string | Yes | The commit the report belongs to. |
| `reportId` | path | string | Yes | Either the uuid or external-id of the report. |

### Example

```bash
curl -X GET \
  -H "Authorization: Bearer $TOKEN" \
  "/repositories/{workspace}/{repo_slug}/commit/{commit}/reports/{reportId}"
```

---

## DELETE /repositories/{workspace}/{repo_slug}/commit/{commit}/reports/{reportId}

**Delete a report**

Deletes a single Report matching the provided ID.

### Parameters

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| `workspace` | path | string | Yes | This can either be the workspace ID (slug) or the  |
| `repo_slug` | path | string | Yes | The repository. |
| `commit` | path | string | Yes | The commit the report belongs to. |
| `reportId` | path | string | Yes | Either the uuid or external-id of the report. |

### Example

```bash
curl -X DELETE \
  -H "Authorization: Bearer $TOKEN" \
  "/repositories/{workspace}/{repo_slug}/commit/{commit}/reports/{reportId}"
```

---

## GET /repositories/{workspace}/{repo_slug}/commit/{commit}/reports/{reportId}/annotations

**List annotations**

Returns a paginated list of Annotations for a specified report.

### Parameters

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| `workspace` | path | string | Yes | This can either be the workspace ID (slug) or the  |
| `repo_slug` | path | string | Yes | The repository. |
| `commit` | path | string | Yes | The commit for which to retrieve reports. |
| `reportId` | path | string | Yes | Uuid or external-if of the report for which to get |

### Example

```bash
curl -X GET \
  -H "Authorization: Bearer $TOKEN" \
  "/repositories/{workspace}/{repo_slug}/commit/{commit}/reports/{reportId}/annotations"
```

---

## POST /repositories/{workspace}/{repo_slug}/commit/{commit}/reports/{reportId}/annotations

**Bulk create or update annotations**

Bulk upload of annotations.
Annotations are individual findings that have been identified as part of a report, for example, a line of code that represents a vulnerability. These annotations can be attached to a specific file and even a specific line in that file, however, that is optional. Annotations are not mandatory and a report can contain up to 1000 annotations.

Add the annotations you want to upload as objects in a JSON array and make sure each annotation has the external_id field set to a unique value. If you want to use an existing id from your own system, we recommend prefixing it with your system's name to avoid collisions, for example, mySystem-annotation001. The external id can later be used to identify the report as an alternative to the generated [UUID](https://developer.atlassian.com/bitbucket/api/2/reference/meta/uri-uuid#uuid). You can upload up to 100 annotations per POST request.

### Sample cURL request:
```
curl --location 'https://api.bitbucket.org/2.0/repositories/<username>/<reposity-name>/commit/<commit-hash>/reports/mysystem-001/annotations' \
--header 'Content-Type: application/json' \
--data-raw '[
  {
        "external_id": "mysystem-annotation001",
        "title": "Security scan report",
        "annotation_type": "VULNERABILITY",
        "summary": "This line represents a security threat.",
        "severity": "HIGH",
      "path": "my-service/src/main/java/com/myCompany/mysystem/logic/Main.java",
        "line": 42
  },
  {
        "external_id": "mySystem-annotation002",
        "title": "Bug report",
        "annotation_type": "BUG",
        "result": "FAILED",
        "summary": "This line might introduce a bug.",
        "severity": "MEDIUM",
      "path": "my-service/src/main/java/com/myCompany/mysystem/logic/Helper.java",
        "line": 13
  }
]'
```

### Possible field values:
annotation_type: VULNERABILITY, CODE_SMELL, BUG
result: PASSED, FAILED, IGNORED, SKIPPED
severity: HIGH, MEDIUM, LOW, CRITICAL

Please refer to the [Code Insights documentation](https://confluence.atlassian.com/bitbucket/code-insights-994316785.html) for more information.


### Parameters

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| `workspace` | path | string | Yes | This can either be the workspace ID (slug) or the  |
| `repo_slug` | path | string | Yes | The repository. |
| `commit` | path | string | Yes | The commit for which to retrieve reports. |
| `reportId` | path | string | Yes | Uuid or external-if of the report for which to get |
| `_body` | body | array | Yes | The annotations to create or update |

### Example

```bash
curl -X POST \
  -H "Authorization: Bearer $TOKEN" \
  "/repositories/{workspace}/{repo_slug}/commit/{commit}/reports/{reportId}/annotations"
```

---

## GET /repositories/{workspace}/{repo_slug}/commit/{commit}/reports/{reportId}/annotations/{annotationId}

**Get an annotation**

Returns a single Annotation matching the provided ID.

### Parameters

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| `workspace` | path | string | Yes | This can either be the workspace ID (slug) or the  |
| `repo_slug` | path | string | Yes | The repository. |
| `commit` | path | string | Yes | The commit the report belongs to. |
| `reportId` | path | string | Yes | Either the uuid or external-id of the report. |
| `annotationId` | path | string | Yes | Either the uuid or external-id of the annotation. |

### Example

```bash
curl -X GET \
  -H "Authorization: Bearer $TOKEN" \
  "/repositories/{workspace}/{repo_slug}/commit/{commit}/reports/{reportId}/annotations/{annotationId}"
```

---

## PUT /repositories/{workspace}/{repo_slug}/commit/{commit}/reports/{reportId}/annotations/{annotationId}

**Create or update an annotation**

Creates or updates an individual annotation for the specified report.
Annotations are individual findings that have been identified as part of a report, for example, a line of code that represents a vulnerability. These annotations can be attached to a specific file and even a specific line in that file, however, that is optional. Annotations are not mandatory and a report can contain up to 1000 annotations.

Just as reports, annotation needs to be uploaded with a unique ID that can later be used to identify the report as an alternative to the generated [UUID](https://developer.atlassian.com/bitbucket/api/2/reference/meta/uri-uuid#uuid). If you want to use an existing id from your own system, we recommend prefixing it with your system's name to avoid collisions, for example, mySystem-annotation001.

### Sample cURL request:
```
curl --request PUT 'https://api.bitbucket.org/2.0/repositories/<username>/<reposity-name>/commit/<commit-hash>/reports/mySystem-001/annotations/mysystem-annotation001' \
--header 'Content-Type: application/json' \
--data-raw '{
    "title": "Security scan report",
    "annotation_type": "VULNERABILITY",
    "summary": "This line represents a security thread.",
    "severity": "HIGH",
    "path": "my-service/src/main/java/com/myCompany/mysystem/logic/Main.java",
    "line": 42
}'
```

### Possible field values:
annotation_type: VULNERABILITY, CODE_SMELL, BUG
result: PASSED, FAILED, IGNORED, SKIPPED
severity: HIGH, MEDIUM, LOW, CRITICAL

Please refer to the [Code Insights documentation](https://confluence.atlassian.com/bitbucket/code-insights-994316785.html) for more information.


### Parameters

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| `workspace` | path | string | Yes | This can either be the workspace ID (slug) or the  |
| `repo_slug` | path | string | Yes | The repository. |
| `commit` | path | string | Yes | The commit the report belongs to. |
| `reportId` | path | string | Yes | Either the uuid or external-id of the report. |
| `annotationId` | path | string | Yes | Either the uuid or external-id of the annotation. |
| `_body` | body | string | Yes | The annotation to create or update |

### Example

```bash
curl -X PUT \
  -H "Authorization: Bearer $TOKEN" \
  "/repositories/{workspace}/{repo_slug}/commit/{commit}/reports/{reportId}/annotations/{annotationId}"
```

---

## DELETE /repositories/{workspace}/{repo_slug}/commit/{commit}/reports/{reportId}/annotations/{annotationId}

**Delete an annotation**

Deletes a single Annotation matching the provided ID.

### Parameters

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| `workspace` | path | string | Yes | This can either be the workspace ID (slug) or the  |
| `repo_slug` | path | string | Yes | The repository. |
| `commit` | path | string | Yes | The commit the annotation belongs to. |
| `reportId` | path | string | Yes | Either the uuid or external-id of the annotation. |
| `annotationId` | path | string | Yes | Either the uuid or external-id of the annotation. |

### Example

```bash
curl -X DELETE \
  -H "Authorization: Bearer $TOKEN" \
  "/repositories/{workspace}/{repo_slug}/commit/{commit}/reports/{reportId}/annotations/{annotationId}"
```

---
