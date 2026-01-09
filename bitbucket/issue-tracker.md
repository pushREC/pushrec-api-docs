---
created: 2026-01-09
tags: [type/api-reference, api/issue-tracker]
api_name: Bitbucket API
category: Issue tracker
endpoint_count: 33
---

# Bitbucket API - Issue Tracker

[[README|Back to Overview]]

---

## GET /repositories/{workspace}/{repo_slug}/components

**List components**

Returns the components that have been defined in the issue tracker.

This resource is only available on repositories that have the issue
tracker enabled.

### Example

```bash
curl -X GET \
  -H "Authorization: Bearer $TOKEN" \
  "/repositories/{workspace}/{repo_slug}/components"
```

---

## GET /repositories/{workspace}/{repo_slug}/components/{component_id}

**Get a component for issues**

Returns the specified issue tracker component object.

### Example

```bash
curl -X GET \
  -H "Authorization: Bearer $TOKEN" \
  "/repositories/{workspace}/{repo_slug}/components/{component_id}"
```

---

## GET /repositories/{workspace}/{repo_slug}/issues

**List issues**

Returns the issues in the issue tracker.

### Example

```bash
curl -X GET \
  -H "Authorization: Bearer $TOKEN" \
  "/repositories/{workspace}/{repo_slug}/issues"
```

---

## POST /repositories/{workspace}/{repo_slug}/issues

**Create an issue**

Creates a new issue.

This call requires authentication. Private repositories or private
issue trackers require the caller to authenticate with an account that
has appropriate authorization.

The authenticated user is used for the issue's `reporter` field.

### Parameters

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| `_body` | body | string | Yes | The new issue. The only required element is `title |

### Example

```bash
curl -X POST \
  -H "Authorization: Bearer $TOKEN" \
  "/repositories/{workspace}/{repo_slug}/issues"
```

---

## POST /repositories/{workspace}/{repo_slug}/issues/export

**Export issues**

A POST request to this endpoint initiates a new background celery task that archives the repo's issues.

When the job has been accepted, it will return a 202 (Accepted) along with a unique url to this job in the
'Location' response header. This url is the endpoint for where the user can obtain their zip files."

### Parameters

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| `_body` | body | string | No | The options to apply to the export. Available opti |

### Example

```bash
curl -X POST \
  -H "Authorization: Bearer $TOKEN" \
  "/repositories/{workspace}/{repo_slug}/issues/export"
```

---

## GET /repositories/{workspace}/{repo_slug}/issues/export/{repo_name}-issues-{task_id}.zip

**Check issue export status**

This endpoint is used to poll for the progress of an issue export
job and return the zip file after the job is complete.
As long as the job is running, this will return a 202 response
with in the response body a description of the current status.

After the job has been scheduled, but before it starts executing, the endpoint
returns a 202 response with status `ACCEPTED`.

Once it starts running, it is a 202 response with status `STARTED` and progress filled.

After it is finished, it becomes a 200 response with status `SUCCESS` or `FAILURE`.

### Example

```bash
curl -X GET \
  -H "Authorization: Bearer $TOKEN" \
  "/repositories/{workspace}/{repo_slug}/issues/export/{repo_name}-issues-{task_id}.zip"
```

---

## GET /repositories/{workspace}/{repo_slug}/issues/import

**Check issue import status**

When using GET, this endpoint reports the status of the current import task.

After the job has been scheduled, but before it starts executing, the endpoint
returns a 202 response with status `ACCEPTED`.

Once it starts running, it is a 202 response with status `STARTED` and progress filled.

After it is finished, it becomes a 200 response with status `SUCCESS` or `FAILURE`.

### Example

```bash
curl -X GET \
  -H "Authorization: Bearer $TOKEN" \
  "/repositories/{workspace}/{repo_slug}/issues/import"
```

---

## POST /repositories/{workspace}/{repo_slug}/issues/import

**Import issues**

A POST request to this endpoint will import the zip file given by the archive parameter into the repository. All
existing issues will be deleted and replaced by the contents of the imported zip file.

Imports are done through a multipart/form-data POST. There is one valid and required form field, with the name
"archive," which needs to be a file field:

```
$ curl -u <username> -X POST -F archive=@/path/to/file.zip https://api.bitbucket.org/2.0/repositories/<owner_username>/<repo_slug>/issues/import
```

### Example

```bash
curl -X POST \
  -H "Authorization: Bearer $TOKEN" \
  "/repositories/{workspace}/{repo_slug}/issues/import"
```

---

## DELETE /repositories/{workspace}/{repo_slug}/issues/{issue_id}

**Delete an issue**

Deletes the specified issue. This requires write access to the
repository.

### Example

```bash
curl -X DELETE \
  -H "Authorization: Bearer $TOKEN" \
  "/repositories/{workspace}/{repo_slug}/issues/{issue_id}"
```

---

## GET /repositories/{workspace}/{repo_slug}/issues/{issue_id}

**Get an issue**

Returns the specified issue.

### Example

```bash
curl -X GET \
  -H "Authorization: Bearer $TOKEN" \
  "/repositories/{workspace}/{repo_slug}/issues/{issue_id}"
```

---

## PUT /repositories/{workspace}/{repo_slug}/issues/{issue_id}

**Update an issue**

Modifies the issue.

```
$ curl https://api.bitbucket.org/2.0/repostories/evzijst/dogslow/issues/123 \
  -u evzijst -s -X PUT -H 'Content-Type: application/json' \
  -d '{
  "title": "Updated title",
  "assignee": {
    "account_id": "5d5355e8c6b9320d9ea5b28d"
  },
  "priority": "minor",
  "version": {
    "name": "1.0"
  },
  "component": null
}'
```

This example changes the `title`, `assignee`, `priority` and the
`version`. It also removes the value of the `component` from the issue
by setting the field to `null`. Any field not present keeps its existing
value.

Each time an issue is edited in the UI or through the API, an immutable
change record is created under the `/issues/123/changes` endpoint. It
also has a comment associated with the change.

### Example

```bash
curl -X PUT \
  -H "Authorization: Bearer $TOKEN" \
  "/repositories/{workspace}/{repo_slug}/issues/{issue_id}"
```

---

## GET /repositories/{workspace}/{repo_slug}/issues/{issue_id}/attachments

**List attachments for an issue**

Returns all attachments for this issue.

This returns the files' meta data. This does not return the files'
actual contents.

The files are always ordered by their upload date.

### Example

```bash
curl -X GET \
  -H "Authorization: Bearer $TOKEN" \
  "/repositories/{workspace}/{repo_slug}/issues/{issue_id}/attachments"
```

---

## POST /repositories/{workspace}/{repo_slug}/issues/{issue_id}/attachments

**Upload an attachment to an issue**

Upload new issue attachments.

To upload files, perform a `multipart/form-data` POST containing one
or more file fields.

When a file is uploaded with the same name as an existing attachment,
then the existing file will be replaced.

### Example

```bash
curl -X POST \
  -H "Authorization: Bearer $TOKEN" \
  "/repositories/{workspace}/{repo_slug}/issues/{issue_id}/attachments"
```

---

## DELETE /repositories/{workspace}/{repo_slug}/issues/{issue_id}/attachments/{path}

**Delete an attachment for an issue**

Deletes an attachment.

### Example

```bash
curl -X DELETE \
  -H "Authorization: Bearer $TOKEN" \
  "/repositories/{workspace}/{repo_slug}/issues/{issue_id}/attachments/{path}"
```

---

## GET /repositories/{workspace}/{repo_slug}/issues/{issue_id}/attachments/{path}

**Get attachment for an issue**

Returns the contents of the specified file attachment.

Note that this endpoint does not return a JSON response, but instead
returns a redirect pointing to the actual file that in turn will return
the raw contents.

The redirect URL contains a one-time token that has a limited lifetime.
As a result, the link should not be persisted, stored, or shared.

### Example

```bash
curl -X GET \
  -H "Authorization: Bearer $TOKEN" \
  "/repositories/{workspace}/{repo_slug}/issues/{issue_id}/attachments/{path}"
```

---

## GET /repositories/{workspace}/{repo_slug}/issues/{issue_id}/changes

**List changes on an issue**

Returns the list of all changes that have been made to the specified
issue. Changes are returned in chronological order with the oldest
change first.

Each time an issue is edited in the UI or through the API, an immutable
change record is created under the `/issues/123/changes` endpoint. It
also has a comment associated with the change.

Note that this operation is changing significantly, due to privacy changes.
See the [announcement](https://developer.atlassian.com/cloud/bitbucket/bitbucket-api-changes-gdpr/#changes-to-the-issue-changes-api)
for details.

Changes support [filtering and sorting](/cloud/bitbucket/rest/intro/#filtering) that
can be used to search for specific changes. For instance, to see
when an issue transitioned to "resolved":

```
$ curl -s https://api.bitbucket.org/2.0/repositories/site/master/issues/1/changes \
   -G --data-urlencode='q=changes.state.new = "resolved"'
```

This resource is only available on repositories that have the issue
tracker enabled.

N.B.

The `changes.assignee` and `changes.assignee_account_id` fields are not
a `user` object. Instead, they contain the raw `username` and
`account_id` of the user. This is to protect the integrity of the audit
log even after a user account gets deleted.

The `changes.assignee` field is deprecated will disappear in the
future. Use `changes.assignee_account_id` instead.

### Parameters

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| `q` | query | string | No | 
Query string to narrow down the response. See
[fi |
| `sort` | query | string | No | 
Name of a response property to sort results. See
 |

### Example

```bash
curl -X GET \
  -H "Authorization: Bearer $TOKEN" \
  "/repositories/{workspace}/{repo_slug}/issues/{issue_id}/changes"
```

---

## POST /repositories/{workspace}/{repo_slug}/issues/{issue_id}/changes

**Modify the state of an issue**

Makes a change to the specified issue.

For example, to change an issue's state and assignee, create a new
change object that modifies these fields:

```
curl https://api.bitbucket.org/2.0/site/master/issues/1234/changes \
  -s -u evzijst -X POST -H "Content-Type: application/json" \
  -d '{
    "changes": {
      "assignee_account_id": {
        "new": "557058:c0b72ad0-1cb5-4018-9cdc-0cde8492c443"
      },
      "state": {
        "new": 'resolved"
      }
    }
    "message": {
      "raw": "This is now resolved."
    }
  }'
```

The above example also includes a custom comment to go alongside the
change. This comment will also be visible on the issue page in the UI.

The fields of the `changes` object are strings, not objects. This
allows for immutable change log records, even after user accounts,
milestones, or other objects recorded in a change entry, get renamed or
deleted.

The `assignee_account_id` field stores the account id. When POSTing a
new change and changing the assignee, the client should therefore use
the user's account_id in the `changes.assignee_account_id.new` field.

This call requires authentication. Private repositories or private
issue trackers require the caller to authenticate with an account that
has appropriate authorization.

### Parameters

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| `_body` | body | string | Yes | The new issue state change. The only required elem |

### Example

```bash
curl -X POST \
  -H "Authorization: Bearer $TOKEN" \
  "/repositories/{workspace}/{repo_slug}/issues/{issue_id}/changes"
```

---

## GET /repositories/{workspace}/{repo_slug}/issues/{issue_id}/changes/{change_id}

**Get issue change object**

Returns the specified issue change object.

This resource is only available on repositories that have the issue
tracker enabled.

### Example

```bash
curl -X GET \
  -H "Authorization: Bearer $TOKEN" \
  "/repositories/{workspace}/{repo_slug}/issues/{issue_id}/changes/{change_id}"
```

---

## GET /repositories/{workspace}/{repo_slug}/issues/{issue_id}/comments

**List comments on an issue**

Returns a paginated list of all comments that were made on the
specified issue.

The default sorting is oldest to newest and can be overridden with
the `sort` query parameter.

This endpoint also supports filtering and sorting of the results. See
[filtering and sorting](/cloud/bitbucket/rest/intro/#filtering) for more details.

### Parameters

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| `q` | query | string | No | 
Query string to narrow down the response as per
[ |

### Example

```bash
curl -X GET \
  -H "Authorization: Bearer $TOKEN" \
  "/repositories/{workspace}/{repo_slug}/issues/{issue_id}/comments"
```

---

## POST /repositories/{workspace}/{repo_slug}/issues/{issue_id}/comments

**Create a comment on an issue**

Creates a new issue comment.

```
$ curl https://api.bitbucket.org/2.0/repositories/atlassian/prlinks/issues/42/comments/ \
  -X POST -u evzijst \
  -H 'Content-Type: application/json' \
  -d '{"content": {"raw": "Lorem ipsum."}}'
```

### Parameters

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| `_body` | body | string | Yes | The new issue comment object. |

### Example

```bash
curl -X POST \
  -H "Authorization: Bearer $TOKEN" \
  "/repositories/{workspace}/{repo_slug}/issues/{issue_id}/comments"
```

---

## DELETE /repositories/{workspace}/{repo_slug}/issues/{issue_id}/comments/{comment_id}

**Delete a comment on an issue**

Deletes the specified comment.

### Example

```bash
curl -X DELETE \
  -H "Authorization: Bearer $TOKEN" \
  "/repositories/{workspace}/{repo_slug}/issues/{issue_id}/comments/{comment_id}"
```

---

## GET /repositories/{workspace}/{repo_slug}/issues/{issue_id}/comments/{comment_id}

**Get a comment on an issue**

Returns the specified issue comment object.

### Example

```bash
curl -X GET \
  -H "Authorization: Bearer $TOKEN" \
  "/repositories/{workspace}/{repo_slug}/issues/{issue_id}/comments/{comment_id}"
```

---

## PUT /repositories/{workspace}/{repo_slug}/issues/{issue_id}/comments/{comment_id}

**Update a comment on an issue**

Updates the content of the specified issue comment. Note that only
the `content.raw` field can be modified.

```
$ curl https://api.bitbucket.org/2.0/repositories/atlassian/prlinks/issues/42/comments/5728901 \
  -X PUT -u evzijst \
  -H 'Content-Type: application/json' \
  -d '{"content": {"raw": "Lorem ipsum."}'
```

### Parameters

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| `_body` | body | string | Yes | The updated comment. |

### Example

```bash
curl -X PUT \
  -H "Authorization: Bearer $TOKEN" \
  "/repositories/{workspace}/{repo_slug}/issues/{issue_id}/comments/{comment_id}"
```

---

## DELETE /repositories/{workspace}/{repo_slug}/issues/{issue_id}/vote

**Remove vote for an issue**

Retract your vote.

### Example

```bash
curl -X DELETE \
  -H "Authorization: Bearer $TOKEN" \
  "/repositories/{workspace}/{repo_slug}/issues/{issue_id}/vote"
```

---

## GET /repositories/{workspace}/{repo_slug}/issues/{issue_id}/vote

**Check if current user voted for an issue**

Check whether the authenticated user has voted for this issue.
A 204 status code indicates that the user has voted, while a 404
implies they haven't.

### Example

```bash
curl -X GET \
  -H "Authorization: Bearer $TOKEN" \
  "/repositories/{workspace}/{repo_slug}/issues/{issue_id}/vote"
```

---

## PUT /repositories/{workspace}/{repo_slug}/issues/{issue_id}/vote

**Vote for an issue**

Vote for this issue.

To cast your vote, do an empty PUT. The 204 status code indicates that
the operation was successful.

### Example

```bash
curl -X PUT \
  -H "Authorization: Bearer $TOKEN" \
  "/repositories/{workspace}/{repo_slug}/issues/{issue_id}/vote"
```

---

## DELETE /repositories/{workspace}/{repo_slug}/issues/{issue_id}/watch

**Stop watching an issue**

Stop watching this issue.

### Example

```bash
curl -X DELETE \
  -H "Authorization: Bearer $TOKEN" \
  "/repositories/{workspace}/{repo_slug}/issues/{issue_id}/watch"
```

---

## GET /repositories/{workspace}/{repo_slug}/issues/{issue_id}/watch

**Check if current user is watching a issue**

Indicated whether or not the authenticated user is watching this
issue.

### Example

```bash
curl -X GET \
  -H "Authorization: Bearer $TOKEN" \
  "/repositories/{workspace}/{repo_slug}/issues/{issue_id}/watch"
```

---

## PUT /repositories/{workspace}/{repo_slug}/issues/{issue_id}/watch

**Watch an issue**

Start watching this issue.

To start watching this issue, do an empty PUT. The 204 status code
indicates that the operation was successful.

### Example

```bash
curl -X PUT \
  -H "Authorization: Bearer $TOKEN" \
  "/repositories/{workspace}/{repo_slug}/issues/{issue_id}/watch"
```

---

## GET /repositories/{workspace}/{repo_slug}/milestones

**List milestones**

Returns the milestones that have been defined in the issue tracker.

This resource is only available on repositories that have the issue
tracker enabled.

### Example

```bash
curl -X GET \
  -H "Authorization: Bearer $TOKEN" \
  "/repositories/{workspace}/{repo_slug}/milestones"
```

---

## GET /repositories/{workspace}/{repo_slug}/milestones/{milestone_id}

**Get a milestone**

Returns the specified issue tracker milestone object.

### Example

```bash
curl -X GET \
  -H "Authorization: Bearer $TOKEN" \
  "/repositories/{workspace}/{repo_slug}/milestones/{milestone_id}"
```

---

## GET /repositories/{workspace}/{repo_slug}/versions

**List defined versions for issues**

Returns the versions that have been defined in the issue tracker.

This resource is only available on repositories that have the issue
tracker enabled.

### Example

```bash
curl -X GET \
  -H "Authorization: Bearer $TOKEN" \
  "/repositories/{workspace}/{repo_slug}/versions"
```

---

## GET /repositories/{workspace}/{repo_slug}/versions/{version_id}

**Get a defined version for issues**

Returns the specified issue tracker version object.

### Example

```bash
curl -X GET \
  -H "Authorization: Bearer $TOKEN" \
  "/repositories/{workspace}/{repo_slug}/versions/{version_id}"
```

---
