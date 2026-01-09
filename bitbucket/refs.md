---
created: 2026-01-09
tags: [type/api-reference, api/refs]
api_name: Bitbucket API
category: Refs
endpoint_count: 9
---

# Bitbucket API - Refs

[[README|Back to Overview]]

---

## GET /repositories/{workspace}/{repo_slug}/refs

**List branches and tags**

Returns the branches and tags in the repository.

By default, results will be in the order the underlying source control system returns them and identical to
the ordering one sees when running "$ git show-ref". Note that this follows simple
lexical ordering of the ref names.

This can be undesirable as it does apply any natural sorting semantics, meaning for instance that refs are
sorted ["branch1", "branch10", "branch2", "v10", "v11", "v9"] instead of ["branch1", "branch2",
"branch10", "v9", "v10", "v11"].

Sorting can be changed using the ?sort= query parameter. When using ?sort=name to explicitly sort on ref name,
Bitbucket will apply natural sorting and interpret numerical values as numbers instead of strings.

### Parameters

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| `q` | query | string | No | 
Query string to narrow down the response as per
[ |
| `sort` | query | string | No | 
Field by which the results should be sorted as pe |

### Example

```bash
curl -X GET \
  -H "Authorization: Bearer $TOKEN" \
  "/repositories/{workspace}/{repo_slug}/refs"
```

---

## GET /repositories/{workspace}/{repo_slug}/refs/branches

**List open branches**

Returns a list of all open branches within the specified repository.
Results will be in the order the source control manager returns them.

Branches support [filtering and sorting](/cloud/bitbucket/rest/intro/#filtering)
that can be used to search for specific branches. For instance, to find
all branches that have "stab" in their name:

```
curl -s https://api.bitbucket.org/2.0/repositories/atlassian/aui/refs/branches -G --data-urlencode 'q=name ~ "stab"'
```

By default, results will be in the order the underlying source control system returns them and identical to
the ordering one sees when running "$ git branch --list". Note that this follows simple
lexical ordering of the ref names.

This can be undesirable as it does apply any natural sorting semantics, meaning for instance that tags are
sorted ["v10", "v11", "v9"] instead of ["v9", "v10", "v11"].

Sorting can be changed using the ?q= query parameter. When using ?q=name to explicitly sort on ref name,
Bitbucket will apply natural sorting and interpret numerical values as numbers instead of strings.

### Parameters

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| `q` | query | string | No | 
Query string to narrow down the response as per
[ |
| `sort` | query | string | No | 
Field by which the results should be sorted as pe |

### Example

```bash
curl -X GET \
  -H "Authorization: Bearer $TOKEN" \
  "/repositories/{workspace}/{repo_slug}/refs/branches"
```

---

## POST /repositories/{workspace}/{repo_slug}/refs/branches

**Create a branch**

Creates a new branch in the specified repository.

The payload of the POST should consist of a JSON document that
contains the name of the tag and the target hash.

```
curl https://api.bitbucket.org/2.0/repositories/seanfarley/hg/refs/branches \
-s -u seanfarley -X POST -H "Content-Type: application/json" \
-d '{
    "name" : "smf/create-feature",
    "target" : {
        "hash" : "default",
    }
}'
```

This call requires authentication. Private repositories require the
caller to authenticate with an account that has appropriate
authorization.

The branch name should not include any prefixes (e.g.
refs/heads). This endpoint does support using short hash prefixes for
the commit hash, but it may return a 400 response if the provided
prefix is ambiguous. Using a full commit hash is the preferred
approach.

### Example

```bash
curl -X POST \
  -H "Authorization: Bearer $TOKEN" \
  "/repositories/{workspace}/{repo_slug}/refs/branches"
```

---

## DELETE /repositories/{workspace}/{repo_slug}/refs/branches/{name}

**Delete a branch**

Delete a branch in the specified repository.

The main branch is not allowed to be deleted and will return a 400
response.

The branch name should not include any prefixes (e.g.
refs/heads).

### Example

```bash
curl -X DELETE \
  -H "Authorization: Bearer $TOKEN" \
  "/repositories/{workspace}/{repo_slug}/refs/branches/{name}"
```

---

## GET /repositories/{workspace}/{repo_slug}/refs/branches/{name}

**Get a branch**

Returns a branch object within the specified repository.

This call requires authentication. Private repositories require the
caller to authenticate with an account that has appropriate
authorization.

For Git, the branch name should not include any prefixes (e.g.
refs/heads).

### Example

```bash
curl -X GET \
  -H "Authorization: Bearer $TOKEN" \
  "/repositories/{workspace}/{repo_slug}/refs/branches/{name}"
```

---

## GET /repositories/{workspace}/{repo_slug}/refs/tags

**List tags**

Returns the tags in the repository.

By default, results will be in the order the underlying source control system returns them and identical to
the ordering one sees when running "$ git tag --list". Note that this follows simple
lexical ordering of the ref names.

This can be undesirable as it does apply any natural sorting semantics, meaning for instance that tags are
sorted ["v10", "v11", "v9"] instead of ["v9", "v10", "v11"].

Sorting can be changed using the ?sort= query parameter. When using ?sort=name to explicitly sort on ref name,
Bitbucket will apply natural sorting and interpret numerical values as numbers instead of strings.

### Parameters

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| `q` | query | string | No | 
Query string to narrow down the response as per
[ |
| `sort` | query | string | No | 
Field by which the results should be sorted as pe |

### Example

```bash
curl -X GET \
  -H "Authorization: Bearer $TOKEN" \
  "/repositories/{workspace}/{repo_slug}/refs/tags"
```

---

## POST /repositories/{workspace}/{repo_slug}/refs/tags

**Create a tag**

Creates a new tag in the specified repository.

The payload of the POST should consist of a JSON document that
contains the name of the tag and the target hash.

```
curl https://api.bitbucket.org/2.0/repositories/jdoe/myrepo/refs/tags \
-s -u jdoe -X POST -H "Content-Type: application/json" \
-d '{
    "name" : "new-tag-name",
    "target" : {
        "hash" : "a1b2c3d4e5f6",
    }
}'
```

This endpoint does support using short hash prefixes for the commit
hash, but it may return a 400 response if the provided prefix is
ambiguous. Using a full commit hash is the preferred approach.

### Parameters

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| `_body` | body | string | Yes |  |

### Example

```bash
curl -X POST \
  -H "Authorization: Bearer $TOKEN" \
  "/repositories/{workspace}/{repo_slug}/refs/tags"
```

---

## DELETE /repositories/{workspace}/{repo_slug}/refs/tags/{name}

**Delete a tag**

Delete a tag in the specified repository.

The tag name should not include any prefixes (e.g. refs/tags).

### Example

```bash
curl -X DELETE \
  -H "Authorization: Bearer $TOKEN" \
  "/repositories/{workspace}/{repo_slug}/refs/tags/{name}"
```

---

## GET /repositories/{workspace}/{repo_slug}/refs/tags/{name}

**Get a tag**

Returns the specified tag.

```
$ curl -s https://api.bitbucket.org/2.0/repositories/seanfarley/hg/refs/tags/3.8 -G | jq .
{
  "name": "3.8",
  "links": {
    "commits": {
      "href": "https://api.bitbucket.org/2.0/repositories/seanfarley/hg/commits/3.8"
    },
    "self": {
      "href": "https://api.bitbucket.org/2.0/repositories/seanfarley/hg/refs/tags/3.8"
    },
    "html": {
      "href": "https://bitbucket.org/seanfarley/hg/commits/tag/3.8"
    }
  },
  "tagger": {
    "raw": "Matt Mackall <mpm@selenic.com>",
    "type": "author",
    "user": {
      "username": "mpmselenic",
      "nickname": "mpmselenic",
      "display_name": "Matt Mackall",
      "type": "user",
      "uuid": "{a4934530-db4c-419c-a478-9ab4964c2ee7}",
      "links": {
        "self": {
          "href": "https://api.bitbucket.org/2.0/users/mpmselenic"
        },
        "html": {
          "href": "https://bitbucket.org/mpmselenic/"
        },
        "avatar": {
          "href": "https://bitbucket.org/account/mpmselenic/avatar/32/"
        }
      }
    }
  },
  "date": "2016-05-01T18:52:25+00:00",
  "message": "Added tag 3.8 for changeset f85de28eae32",
  "type": "tag",
  "target": {
    "hash": "f85de28eae32e7d3064b1a1321309071bbaaa069",
    "repository": {
      "links": {
        "self": {
          "href": "https://api.bitbucket.org/2.0/repositories/seanfarley/hg"
        },
        "html": {
          "href": "https://bitbucket.org/seanfarley/hg"
        },
        "avatar": {
          "href": "https://bitbucket.org/seanfarley/hg/avatar/32/"
        }
      },
      "type": "repository",
      "name": "hg",
      "full_name": "seanfarley/hg",
      "uuid": "{c75687fb-e99d-4579-9087-190dbd406d30}"
    },
    "links": {
      "self": {
        "href": "https://api.bitbucket.org/2.0/repositories/seanfarley/hg/commit/f85de28eae32e7d3064b1a1321309071bbaaa069"
      },
      "comments": {
        "href": "https://api.bitbucket.org/2.0/repositories/seanfarley/hg/commit/f85de28eae32e7d3064b1a1321309071bbaaa069/comments"
      },
      "patch": {
        "href": "https://api.bitbucket.org/2.0/repositories/seanfarley/hg/patch/f85de28eae32e7d3064b1a1321309071bbaaa069"
      },
      "html": {
        "href": "https://bitbucket.org/seanfarley/hg/commits/f85de28eae32e7d3064b1a1321309071bbaaa069"
      },
      "diff": {
        "href": "https://api.bitbucket.org/2.0/repositories/seanfarley/hg/diff/f85de28eae32e7d3064b1a1321309071bbaaa069"
      },
      "approve": {
        "href": "https://api.bitbucket.org/2.0/repositories/seanfarley/hg/commit/f85de28eae32e7d3064b1a1321309071bbaaa069/approve"
      },
      "statuses": {
        "href": "https://api.bitbucket.org/2.0/repositories/seanfarley/hg/commit/f85de28eae32e7d3064b1a1321309071bbaaa069/statuses"
      }
    },
    "author": {
      "raw": "Sean Farley <sean@farley.io>",
      "type": "author",
      "user": {
        "username": "seanfarley",
        "nickname": "seanfarley",
        "display_name": "Sean Farley",
        "type": "user",
        "uuid": "{a295f8a8-5876-4d43-89b5-3ad8c6c3c51d}",
        "links": {
          "self": {
            "href": "https://api.bitbucket.org/2.0/users/seanfarley"
          },
          "html": {
            "href": "https://bitbucket.org/seanfarley/"
          },
          "avatar": {
            "href": "https://bitbucket.org/account/seanfarley/avatar/32/"
          }
        }
      }
    },
    "parents": [
      {
        "hash": "9a98d0e5b07fc60887f9d3d34d9ac7d536f470d2",
        "type": "commit",
        "links": {
          "self": {
            "href": "https://api.bitbucket.org/2.0/repositories/seanfarley/hg/commit/9a98d0e5b07fc60887f9d3d34d9ac7d536f470d2"
          },
          "html": {
            "href": "https://bitbucket.org/seanfarley/hg/commits/9a98d0e5b07fc60887f9d3d34d9ac7d536f470d2"
          }
        }
      }
    ],
    "date": "2016-05-01T04:21:17+00:00",
    "message": "debian: alphabetize build deps",
    "type": "commit"
  }
}
```

### Example

```bash
curl -X GET \
  -H "Authorization: Bearer $TOKEN" \
  "/repositories/{workspace}/{repo_slug}/refs/tags/{name}"
```

---
