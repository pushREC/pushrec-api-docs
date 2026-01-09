---
created: 2026-01-09
tags: [type/api-reference, api/downloads]
api_name: Bitbucket API
category: Downloads
endpoint_count: 4
---

# Bitbucket API - Downloads

[[README|Back to Overview]]

---

## GET /repositories/{workspace}/{repo_slug}/downloads

**List download artifacts**

Returns a list of download links associated with the repository.

### Example

```bash
curl -X GET \
  -H "Authorization: Bearer $TOKEN" \
  "/repositories/{workspace}/{repo_slug}/downloads"
```

---

## POST /repositories/{workspace}/{repo_slug}/downloads

**Upload a download artifact**

Upload new download artifacts.

To upload files, perform a `multipart/form-data` POST containing one
or more `files` fields:

    $ echo Hello World > hello.txt
    $ curl -s -u evzijst -X POST https://api.bitbucket.org/2.0/repositories/evzijst/git-tests/downloads -F files=@hello.txt

When a file is uploaded with the same name as an existing artifact,
then the existing file will be replaced.

### Example

```bash
curl -X POST \
  -H "Authorization: Bearer $TOKEN" \
  "/repositories/{workspace}/{repo_slug}/downloads"
```

---

## DELETE /repositories/{workspace}/{repo_slug}/downloads/{filename}

**Delete a download artifact**

Deletes the specified download artifact from the repository.

### Example

```bash
curl -X DELETE \
  -H "Authorization: Bearer $TOKEN" \
  "/repositories/{workspace}/{repo_slug}/downloads/{filename}"
```

---

## GET /repositories/{workspace}/{repo_slug}/downloads/{filename}

**Get a download artifact link**

Return a redirect to the contents of a download artifact.

This endpoint returns the actual file contents and not the artifact's
metadata.

    $ curl -s -L https://api.bitbucket.org/2.0/repositories/evzijst/git-tests/downloads/hello.txt
    Hello World

### Example

```bash
curl -X GET \
  -H "Authorization: Bearer $TOKEN" \
  "/repositories/{workspace}/{repo_slug}/downloads/{filename}"
```

---
