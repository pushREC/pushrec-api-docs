---
created: 2026-01-09
tags: [type/api-reference, api/pullrequests]
api_name: Bitbucket API
category: Pullrequests
endpoint_count: 36
---

# Bitbucket API - Pullrequests

[[README|Back to Overview]]

---

## GET /repositories/{workspace}/{repo_slug}/commit/{commit}/pullrequests

**List pull requests that contain a commit**

Returns a paginated list of all pull requests as part of which this commit was reviewed. Pull Request Commit Links app must be installed first before using this API; installation automatically occurs when 'Go to pull request' is clicked from the web interface for a commit's details.

### Parameters

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| `workspace` | path | string | Yes | This can either be the workspace ID (slug) or the  |
| `repo_slug` | path | string | Yes | The repository; either the UUID in curly braces, o |
| `commit` | path | string | Yes | The SHA1 of the commit |
| `page` | query | string | No | Which page to retrieve |
| `pagelen` | query | string | No | How many pull requests to retrieve per page |

### Example

```bash
curl -X GET \
  -H "Authorization: Bearer $TOKEN" \
  "/repositories/{workspace}/{repo_slug}/commit/{commit}/pullrequests"
```

---

## GET /repositories/{workspace}/{repo_slug}/default-reviewers

**List default reviewers**

Returns the repository's default reviewers.

These are the users that are automatically added as reviewers on every
new pull request that is created. To obtain the repository's default reviewers
as well as the default reviewers inherited from the project, use the
[effective-default-reveiwers](#api-repositories-workspace-repo-slug-effective-default-reviewers-get) endpoint.

### Example

```bash
curl -X GET \
  -H "Authorization: Bearer $TOKEN" \
  "/repositories/{workspace}/{repo_slug}/default-reviewers"
```

---

## DELETE /repositories/{workspace}/{repo_slug}/default-reviewers/{target_username}

**Remove a user from the default reviewers**

Removes a default reviewer from the repository.

### Example

```bash
curl -X DELETE \
  -H "Authorization: Bearer $TOKEN" \
  "/repositories/{workspace}/{repo_slug}/default-reviewers/{target_username}"
```

---

## GET /repositories/{workspace}/{repo_slug}/default-reviewers/{target_username}

**Get a default reviewer**

Returns the specified reviewer.

This can be used to test whether a user is among the repository's
default reviewers list. A 404 indicates that that specified user is not
a default reviewer.

### Example

```bash
curl -X GET \
  -H "Authorization: Bearer $TOKEN" \
  "/repositories/{workspace}/{repo_slug}/default-reviewers/{target_username}"
```

---

## PUT /repositories/{workspace}/{repo_slug}/default-reviewers/{target_username}

**Add a user to the default reviewers**

Adds the specified user to the repository's list of default
reviewers.

This method is idempotent. Adding a user a second time has no effect.

### Example

```bash
curl -X PUT \
  -H "Authorization: Bearer $TOKEN" \
  "/repositories/{workspace}/{repo_slug}/default-reviewers/{target_username}"
```

---

## GET /repositories/{workspace}/{repo_slug}/effective-default-reviewers

**List effective default reviewers**

Returns the repository's effective default reviewers. This includes both default
reviewers defined at the repository level as well as those inherited from its project.

These are the users that are automatically added as reviewers on every
new pull request that is created.

### Example

```bash
curl -X GET \
  -H "Authorization: Bearer $TOKEN" \
  "/repositories/{workspace}/{repo_slug}/effective-default-reviewers"
```

---

## GET /repositories/{workspace}/{repo_slug}/pullrequests

**List pull requests**

Returns all pull requests on the specified repository.

By default only open pull requests are returned. This can be controlled
using the `state` query parameter. To retrieve pull requests that are
in one of multiple states, repeat the `state` parameter for each
individual state.

This endpoint also supports filtering and sorting of the results. See
[filtering and sorting](/cloud/bitbucket/rest/intro/#filtering) for more details.

### Parameters

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| `state` | query | string | No | Only return pull requests that are in this state.  |

### Example

```bash
curl -X GET \
  -H "Authorization: Bearer $TOKEN" \
  "/repositories/{workspace}/{repo_slug}/pullrequests"
```

---

## POST /repositories/{workspace}/{repo_slug}/pullrequests

**Create a pull request**

Creates a new pull request where the destination repository is
this repository and the author is the authenticated user.

The minimum required fields to create a pull request are `title` and
`source`, specified by a branch name.

```
curl https://api.bitbucket.org/2.0/repositories/my-workspace/my-repository/pullrequests \
    -u my-username:my-password \
    --request POST \
    --header 'Content-Type: application/json' \
    --data '{
        "title": "My Title",
        "source": {
            "branch": {
                "name": "staging"
            }
        }
    }'
```

If the pull request's `destination` is not specified, it will default
to the `repository.mainbranch`. To open a pull request to a
different branch, say from a feature branch to a staging branch,
specify a `destination` (same format as the `source`):

```
{
    "title": "My Title",
    "source": {
        "branch": {
            "name": "my-feature-branch"
        }
    },
    "destination": {
        "branch": {
            "name": "staging"
        }
    }
}
```

Reviewers can be specified by adding an array of user objects as the
`reviewers` property.

```
{
    "title": "My Title",
    "source": {
        "branch": {
            "name": "my-feature-branch"
        }
    },
    "reviewers": [
        {
            "uuid": "{504c3b62-8120-4f0c-a7bc-87800b9d6f70}"
        }
    ]
}
```

Other fields:

* `description` - a string
* `close_source_branch` - boolean that specifies if the source branch should be closed upon merging
* `draft` - boolean that specifies whether the pull request is a draft

### Parameters

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| `_body` | body | string | No | The new pull request.

The request URL you POST to |

### Example

```bash
curl -X POST \
  -H "Authorization: Bearer $TOKEN" \
  "/repositories/{workspace}/{repo_slug}/pullrequests"
```

---

## GET /repositories/{workspace}/{repo_slug}/pullrequests/activity

**List a pull request activity log**

Returns a paginated list of the pull request's activity log.

This handler serves both a v20 and internal endpoint. The v20 endpoint
returns reviewer comments, updates, approvals and request changes. The internal
endpoint includes those plus tasks and attachments.

Comments created on a file or a line of code have an inline property.

Comment example:
```
{
    "pagelen": 20,
    "values": [
        {
            "comment": {
                "links": {
                    "self": {
                        "href": "https://api.bitbucket.org/2.0/repositories/atlassian/atlaskit-mk-2/pullrequests/5695/comments/118571088"
                    },
                    "html": {
                        "href": "https://bitbucket.org/atlassian/atlaskit-mk-2/pull-requests/5695/_/diff#comment-118571088"
                    }
                },
                "deleted": false,
                "pullrequest": {
                    "type": "pullrequest",
                    "id": 5695,
                    "links": {
                        "self": {
                            "href": "https://api.bitbucket.org/2.0/repositories/atlassian/atlaskit-mk-2/pullrequests/5695"
                        },
                        "html": {
                            "href": "https://bitbucket.org/atlassian/atlaskit-mk-2/pull-requests/5695"
                        }
                    },
                    "title": "username/NONE: small change from onFocus to onClick to handle tabbing through the page and not expand the editor unless a click event triggers it"
                },
                "content": {
                    "raw": "inline with to a dn from lines",
                    "markup": "markdown",
                    "html": "<p>inline with to a dn from lines</p>",
                    "type": "rendered"
                },
                "created_on": "2019-09-27T00:33:46.039178+00:00",
                "user": {
                    "display_name": "Name Lastname",
                    "uuid": "{}",
                    "links": {
                        "self": {
                            "href": "https://api.bitbucket.org/2.0/users/%7B%7D"
                        },
                        "html": {
                            "href": "https://bitbucket.org/%7B%7D/"
                        },
                        "avatar": {
                            "href": "https://avatar-management--avatars.us-west-2.prod.public.atl-paas.net/:/128"
                        }
                    },
                    "type": "user",
                    "nickname": "Name",
                    "account_id": ""
                },
                "created_on": "2019-09-27T00:33:46.039178+00:00",
                "user": {
                    "display_name": "Name Lastname",
                    "uuid": "{}",
                    "links": {
                        "self": {
                            "href": "https://api.bitbucket.org/2.0/users/%7B%7D"
                        },
                        "html": {
                            "href": "https://bitbucket.org/%7B%7D/"
                        },
                        "avatar": {
                            "href": "https://avatar-management--avatars.us-west-2.prod.public.atl-paas.net/:/128"
                        }
                    },
                    "type": "user",
                    "nickname": "Name",
                    "account_id": ""
                },
                "updated_on": "2019-09-27T00:33:46.055384+00:00",
                "inline": {
                    "context_lines": "",
                    "to": null,
                    "path": "",
                    "outdated": false,
                    "from": 211
                },
                "type": "pullrequest_comment",
                "id": 118571088
            },
            "pull_request": {
                "type": "pullrequest",
                "id": 5695,
                "links": {
                    "self": {
                        "href": "https://api.bitbucket.org/2.0/repositories/atlassian/atlaskit-mk-2/pullrequests/5695"
                    },
                    "html": {
                        "href": "https://bitbucket.org/atlassian/atlaskit-mk-2/pull-requests/5695"
                    }
                },
                "title": "username/NONE: small change from onFocus to onClick to handle tabbing through the page and not expand the editor unless a click event triggers it"
            }
        }
    ]
}
```

Updates include a state property of OPEN, MERGED, or DECLINED.

Update example:
```
{
    "pagelen": 20,
    "values": [
        {
            "update": {
                "description": "",
                "title": "username/NONE: small change from onFocus to onClick to handle tabbing through the page and not expand the editor unless a click event triggers it",
                "destination": {
                    "commit": {
                        "type": "commit",
                        "hash": "6a2c16e4a152",
                        "links": {
                            "self": {
                                "href": "https://api.bitbucket.org/2.0/repositories/atlassian/atlaskit-mk-2/commit/6a2c16e4a152"
                            },
                            "html": {
                                "href": "https://bitbucket.org/atlassian/atlaskit-mk-2/commits/6a2c16e4a152"
                            }
                        }
                    },
                    "branch": {
                        "name": "master"
                    },
                    "repository": {
                        "name": "Atlaskit-MK-2",
                        "type": "repository",
                        "full_name": "atlassian/atlaskit-mk-2",
                        "links": {
                            "self": {
                                "href": "https://api.bitbucket.org/2.0/repositories/atlassian/atlaskit-mk-2"
                            },
                            "html": {
                                "href": "https://bitbucket.org/atlassian/atlaskit-mk-2"
                            },
                            "avatar": {
                                "href": "https://bytebucket.org/ravatar/%7B%7D?ts=js"
                            }
                        },
                        "uuid": "{}"
                    }
                },
                "reason": "",
                "source": {
                    "commit": {
                        "type": "commit",
                        "hash": "728c8bad1813",
                        "links": {
                            "self": {
                                "href": "https://api.bitbucket.org/2.0/repositories/atlassian/atlaskit-mk-2/commit/728c8bad1813"
                            },
                            "html": {
                                "href": "https://bitbucket.org/atlassian/atlaskit-mk-2/commits/728c8bad1813"
                            }
                        }
                    },
                    "branch": {
                        "name": "username/NONE-add-onClick-prop-for-accessibility"
                    },
                    "repository": {
                        "name": "Atlaskit-MK-2",
                        "type": "repository",
                        "full_name": "atlassian/atlaskit-mk-2",
                        "links": {
                            "self": {
                                "href": "https://api.bitbucket.org/2.0/repositories/atlassian/atlaskit-mk-2"
                            },
                            "html": {
                                "href": "https://bitbucket.org/atlassian/atlaskit-mk-2"
                            },
                            "avatar": {
                                "href": "https://bytebucket.org/ravatar/%7B%7D?ts=js"
                            }
                        },
                        "uuid": "{}"
                    }
                },
                "state": "OPEN",
                "author": {
                    "display_name": "Name Lastname",
                    "uuid": "{}",
                    "links": {
                        "self": {
                            "href": "https://api.bitbucket.org/2.0/users/%7B%7D"
                        },
                        "html": {
                            "href": "https://bitbucket.org/%7B%7D/"
                        },
                        "avatar": {
                            "href": "https://avatar-management--avatars.us-west-2.prod.public.atl-paas.net/:/128"
                        }
                    },
                    "type": "user",
                    "nickname": "Name",
                    "account_id": ""
                },
                "date": "2019-05-10T06:48:25.305565+00:00"
            },
            "pull_request": {
                "type": "pullrequest",
                "id": 5695,
                "links": {
                    "self": {
                        "href": "https://api.bitbucket.org/2.0/repositories/atlassian/atlaskit-mk-2/pullrequests/5695"
                    },
                    "html": {
                        "href": "https://bitbucket.org/atlassian/atlaskit-mk-2/pull-requests/5695"
                    }
                },
                "title": "username/NONE: small change from onFocus to onClick to handle tabbing through the page and not expand the editor unless a click event triggers it"
            }
        }
    ]
}
```

Approval example:
```
{
    "pagelen": 20,
    "values": [
        {
            "approval": {
                "date": "2019-09-27T00:37:19.849534+00:00",
                "pullrequest": {
                    "type": "pullrequest",
                    "id": 5695,
                    "links": {
                        "self": {
                            "href": "https://api.bitbucket.org/2.0/repositories/atlassian/atlaskit-mk-2/pullrequests/5695"
                        },
                        "html": {
                            "href": "https://bitbucket.org/atlassian/atlaskit-mk-2/pull-requests/5695"
                        }
                    },
                    "title": "username/NONE: small change from onFocus to onClick to handle tabbing through the page and not expand the editor unless a click event triggers it"
                },
                "user": {
                    "display_name": "Name Lastname",
                    "uuid": "{}",
                    "links": {
                        "self": {
                            "href": "https://api.bitbucket.org/2.0/users/%7B%7D"
                        },
                        "html": {
                            "href": "https://bitbucket.org/%7B%7D/"
                        },
                        "avatar": {
                            "href": "https://avatar-management--avatars.us-west-2.prod.public.atl-paas.net/:/128"
                        }
                    },
                    "type": "user",
                    "nickname": "Name",
                    "account_id": ""
                }
            },
            "pull_request": {
                "type": "pullrequest",
                "id": 5695,
                "links": {
                    "self": {
                        "href": "https://api.bitbucket.org/2.0/repositories/atlassian/atlaskit-mk-2/pullrequests/5695"
                    },
                    "html": {
                        "href": "https://bitbucket.org/atlassian/atlaskit-mk-2/pull-requests/5695"
                    }
                },
                "title": "username/NONE: small change from onFocus to onClick to handle tabbing through the page and not expand the editor unless a click event triggers it"
            }
        }
    ]
}
```

### Example

```bash
curl -X GET \
  -H "Authorization: Bearer $TOKEN" \
  "/repositories/{workspace}/{repo_slug}/pullrequests/activity"
```

---

## GET /repositories/{workspace}/{repo_slug}/pullrequests/{pull_request_id}

**Get a pull request**

Returns the specified pull request.

### Example

```bash
curl -X GET \
  -H "Authorization: Bearer $TOKEN" \
  "/repositories/{workspace}/{repo_slug}/pullrequests/{pull_request_id}"
```

---

## PUT /repositories/{workspace}/{repo_slug}/pullrequests/{pull_request_id}

**Update a pull request**

Mutates the specified pull request.

This can be used to change the pull request's branches or description.

Only open pull requests can be mutated.

### Parameters

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| `_body` | body | string | No | The pull request that is to be updated. |

### Example

```bash
curl -X PUT \
  -H "Authorization: Bearer $TOKEN" \
  "/repositories/{workspace}/{repo_slug}/pullrequests/{pull_request_id}"
```

---

## GET /repositories/{workspace}/{repo_slug}/pullrequests/{pull_request_id}/activity

**List a pull request activity log**

Returns a paginated list of the pull request's activity log.

This handler serves both a v20 and internal endpoint. The v20 endpoint
returns reviewer comments, updates, approvals and request changes. The internal
endpoint includes those plus tasks and attachments.

Comments created on a file or a line of code have an inline property.

Comment example:
```
{
    "pagelen": 20,
    "values": [
        {
            "comment": {
                "links": {
                    "self": {
                        "href": "https://api.bitbucket.org/2.0/repositories/atlassian/atlaskit-mk-2/pullrequests/5695/comments/118571088"
                    },
                    "html": {
                        "href": "https://bitbucket.org/atlassian/atlaskit-mk-2/pull-requests/5695/_/diff#comment-118571088"
                    }
                },
                "deleted": false,
                "pullrequest": {
                    "type": "pullrequest",
                    "id": 5695,
                    "links": {
                        "self": {
                            "href": "https://api.bitbucket.org/2.0/repositories/atlassian/atlaskit-mk-2/pullrequests/5695"
                        },
                        "html": {
                            "href": "https://bitbucket.org/atlassian/atlaskit-mk-2/pull-requests/5695"
                        }
                    },
                    "title": "username/NONE: small change from onFocus to onClick to handle tabbing through the page and not expand the editor unless a click event triggers it"
                },
                "content": {
                    "raw": "inline with to a dn from lines",
                    "markup": "markdown",
                    "html": "<p>inline with to a dn from lines</p>",
                    "type": "rendered"
                },
                "created_on": "2019-09-27T00:33:46.039178+00:00",
                "user": {
                    "display_name": "Name Lastname",
                    "uuid": "{}",
                    "links": {
                        "self": {
                            "href": "https://api.bitbucket.org/2.0/users/%7B%7D"
                        },
                        "html": {
                            "href": "https://bitbucket.org/%7B%7D/"
                        },
                        "avatar": {
                            "href": "https://avatar-management--avatars.us-west-2.prod.public.atl-paas.net/:/128"
                        }
                    },
                    "type": "user",
                    "nickname": "Name",
                    "account_id": ""
                },
                "created_on": "2019-09-27T00:33:46.039178+00:00",
                "user": {
                    "display_name": "Name Lastname",
                    "uuid": "{}",
                    "links": {
                        "self": {
                            "href": "https://api.bitbucket.org/2.0/users/%7B%7D"
                        },
                        "html": {
                            "href": "https://bitbucket.org/%7B%7D/"
                        },
                        "avatar": {
                            "href": "https://avatar-management--avatars.us-west-2.prod.public.atl-paas.net/:/128"
                        }
                    },
                    "type": "user",
                    "nickname": "Name",
                    "account_id": ""
                },
                "updated_on": "2019-09-27T00:33:46.055384+00:00",
                "inline": {
                    "context_lines": "",
                    "to": null,
                    "path": "",
                    "outdated": false,
                    "from": 211
                },
                "type": "pullrequest_comment",
                "id": 118571088
            },
            "pull_request": {
                "type": "pullrequest",
                "id": 5695,
                "links": {
                    "self": {
                        "href": "https://api.bitbucket.org/2.0/repositories/atlassian/atlaskit-mk-2/pullrequests/5695"
                    },
                    "html": {
                        "href": "https://bitbucket.org/atlassian/atlaskit-mk-2/pull-requests/5695"
                    }
                },
                "title": "username/NONE: small change from onFocus to onClick to handle tabbing through the page and not expand the editor unless a click event triggers it"
            }
        }
    ]
}
```

Updates include a state property of OPEN, MERGED, or DECLINED.

Update example:
```
{
    "pagelen": 20,
    "values": [
        {
            "update": {
                "description": "",
                "title": "username/NONE: small change from onFocus to onClick to handle tabbing through the page and not expand the editor unless a click event triggers it",
                "destination": {
                    "commit": {
                        "type": "commit",
                        "hash": "6a2c16e4a152",
                        "links": {
                            "self": {
                                "href": "https://api.bitbucket.org/2.0/repositories/atlassian/atlaskit-mk-2/commit/6a2c16e4a152"
                            },
                            "html": {
                                "href": "https://bitbucket.org/atlassian/atlaskit-mk-2/commits/6a2c16e4a152"
                            }
                        }
                    },
                    "branch": {
                        "name": "master"
                    },
                    "repository": {
                        "name": "Atlaskit-MK-2",
                        "type": "repository",
                        "full_name": "atlassian/atlaskit-mk-2",
                        "links": {
                            "self": {
                                "href": "https://api.bitbucket.org/2.0/repositories/atlassian/atlaskit-mk-2"
                            },
                            "html": {
                                "href": "https://bitbucket.org/atlassian/atlaskit-mk-2"
                            },
                            "avatar": {
                                "href": "https://bytebucket.org/ravatar/%7B%7D?ts=js"
                            }
                        },
                        "uuid": "{}"
                    }
                },
                "reason": "",
                "source": {
                    "commit": {
                        "type": "commit",
                        "hash": "728c8bad1813",
                        "links": {
                            "self": {
                                "href": "https://api.bitbucket.org/2.0/repositories/atlassian/atlaskit-mk-2/commit/728c8bad1813"
                            },
                            "html": {
                                "href": "https://bitbucket.org/atlassian/atlaskit-mk-2/commits/728c8bad1813"
                            }
                        }
                    },
                    "branch": {
                        "name": "username/NONE-add-onClick-prop-for-accessibility"
                    },
                    "repository": {
                        "name": "Atlaskit-MK-2",
                        "type": "repository",
                        "full_name": "atlassian/atlaskit-mk-2",
                        "links": {
                            "self": {
                                "href": "https://api.bitbucket.org/2.0/repositories/atlassian/atlaskit-mk-2"
                            },
                            "html": {
                                "href": "https://bitbucket.org/atlassian/atlaskit-mk-2"
                            },
                            "avatar": {
                                "href": "https://bytebucket.org/ravatar/%7B%7D?ts=js"
                            }
                        },
                        "uuid": "{}"
                    }
                },
                "state": "OPEN",
                "author": {
                    "display_name": "Name Lastname",
                    "uuid": "{}",
                    "links": {
                        "self": {
                            "href": "https://api.bitbucket.org/2.0/users/%7B%7D"
                        },
                        "html": {
                            "href": "https://bitbucket.org/%7B%7D/"
                        },
                        "avatar": {
                            "href": "https://avatar-management--avatars.us-west-2.prod.public.atl-paas.net/:/128"
                        }
                    },
                    "type": "user",
                    "nickname": "Name",
                    "account_id": ""
                },
                "date": "2019-05-10T06:48:25.305565+00:00"
            },
            "pull_request": {
                "type": "pullrequest",
                "id": 5695,
                "links": {
                    "self": {
                        "href": "https://api.bitbucket.org/2.0/repositories/atlassian/atlaskit-mk-2/pullrequests/5695"
                    },
                    "html": {
                        "href": "https://bitbucket.org/atlassian/atlaskit-mk-2/pull-requests/5695"
                    }
                },
                "title": "username/NONE: small change from onFocus to onClick to handle tabbing through the page and not expand the editor unless a click event triggers it"
            }
        }
    ]
}
```

Approval example:
```
{
    "pagelen": 20,
    "values": [
        {
            "approval": {
                "date": "2019-09-27T00:37:19.849534+00:00",
                "pullrequest": {
                    "type": "pullrequest",
                    "id": 5695,
                    "links": {
                        "self": {
                            "href": "https://api.bitbucket.org/2.0/repositories/atlassian/atlaskit-mk-2/pullrequests/5695"
                        },
                        "html": {
                            "href": "https://bitbucket.org/atlassian/atlaskit-mk-2/pull-requests/5695"
                        }
                    },
                    "title": "username/NONE: small change from onFocus to onClick to handle tabbing through the page and not expand the editor unless a click event triggers it"
                },
                "user": {
                    "display_name": "Name Lastname",
                    "uuid": "{}",
                    "links": {
                        "self": {
                            "href": "https://api.bitbucket.org/2.0/users/%7B%7D"
                        },
                        "html": {
                            "href": "https://bitbucket.org/%7B%7D/"
                        },
                        "avatar": {
                            "href": "https://avatar-management--avatars.us-west-2.prod.public.atl-paas.net/:/128"
                        }
                    },
                    "type": "user",
                    "nickname": "Name",
                    "account_id": ""
                }
            },
            "pull_request": {
                "type": "pullrequest",
                "id": 5695,
                "links": {
                    "self": {
                        "href": "https://api.bitbucket.org/2.0/repositories/atlassian/atlaskit-mk-2/pullrequests/5695"
                    },
                    "html": {
                        "href": "https://bitbucket.org/atlassian/atlaskit-mk-2/pull-requests/5695"
                    }
                },
                "title": "username/NONE: small change from onFocus to onClick to handle tabbing through the page and not expand the editor unless a click event triggers it"
            }
        }
    ]
}
```

### Example

```bash
curl -X GET \
  -H "Authorization: Bearer $TOKEN" \
  "/repositories/{workspace}/{repo_slug}/pullrequests/{pull_request_id}/activity"
```

---

## DELETE /repositories/{workspace}/{repo_slug}/pullrequests/{pull_request_id}/approve

**Unapprove a pull request**

Redact the authenticated user's approval of the specified pull
request.

### Example

```bash
curl -X DELETE \
  -H "Authorization: Bearer $TOKEN" \
  "/repositories/{workspace}/{repo_slug}/pullrequests/{pull_request_id}/approve"
```

---

## POST /repositories/{workspace}/{repo_slug}/pullrequests/{pull_request_id}/approve

**Approve a pull request**

Approve the specified pull request as the authenticated user.

### Example

```bash
curl -X POST \
  -H "Authorization: Bearer $TOKEN" \
  "/repositories/{workspace}/{repo_slug}/pullrequests/{pull_request_id}/approve"
```

---

## GET /repositories/{workspace}/{repo_slug}/pullrequests/{pull_request_id}/comments

**List comments on a pull request**

Returns a paginated list of the pull request's comments.

This includes both global, inline comments and replies.

The default sorting is oldest to newest and can be overridden with
the `sort` query parameter.

This endpoint also supports filtering and sorting of the results. See
[filtering and sorting](/cloud/bitbucket/rest/intro/#filtering) for more
details.

### Example

```bash
curl -X GET \
  -H "Authorization: Bearer $TOKEN" \
  "/repositories/{workspace}/{repo_slug}/pullrequests/{pull_request_id}/comments"
```

---

## POST /repositories/{workspace}/{repo_slug}/pullrequests/{pull_request_id}/comments

**Create a comment on a pull request**

Creates a new pull request comment.

Returns the newly created pull request comment.

### Parameters

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| `_body` | body | string | Yes | The comment object. |

### Example

```bash
curl -X POST \
  -H "Authorization: Bearer $TOKEN" \
  "/repositories/{workspace}/{repo_slug}/pullrequests/{pull_request_id}/comments"
```

---

## DELETE /repositories/{workspace}/{repo_slug}/pullrequests/{pull_request_id}/comments/{comment_id}

**Delete a comment on a pull request**

Deletes a specific pull request comment.

### Example

```bash
curl -X DELETE \
  -H "Authorization: Bearer $TOKEN" \
  "/repositories/{workspace}/{repo_slug}/pullrequests/{pull_request_id}/comments/{comment_id}"
```

---

## GET /repositories/{workspace}/{repo_slug}/pullrequests/{pull_request_id}/comments/{comment_id}

**Get a comment on a pull request**

Returns a specific pull request comment.

### Example

```bash
curl -X GET \
  -H "Authorization: Bearer $TOKEN" \
  "/repositories/{workspace}/{repo_slug}/pullrequests/{pull_request_id}/comments/{comment_id}"
```

---

## PUT /repositories/{workspace}/{repo_slug}/pullrequests/{pull_request_id}/comments/{comment_id}

**Update a comment on a pull request**

Updates a specific pull request comment.

### Parameters

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| `_body` | body | string | Yes | The contents of the updated comment. |

### Example

```bash
curl -X PUT \
  -H "Authorization: Bearer $TOKEN" \
  "/repositories/{workspace}/{repo_slug}/pullrequests/{pull_request_id}/comments/{comment_id}"
```

---

## DELETE /repositories/{workspace}/{repo_slug}/pullrequests/{pull_request_id}/comments/{comment_id}/resolve

**Reopen a comment thread**

### Example

```bash
curl -X DELETE \
  -H "Authorization: Bearer $TOKEN" \
  "/repositories/{workspace}/{repo_slug}/pullrequests/{pull_request_id}/comments/{comment_id}/resolve"
```

---

## POST /repositories/{workspace}/{repo_slug}/pullrequests/{pull_request_id}/comments/{comment_id}/resolve

**Resolve a comment thread**

### Example

```bash
curl -X POST \
  -H "Authorization: Bearer $TOKEN" \
  "/repositories/{workspace}/{repo_slug}/pullrequests/{pull_request_id}/comments/{comment_id}/resolve"
```

---

## GET /repositories/{workspace}/{repo_slug}/pullrequests/{pull_request_id}/commits

**List commits on a pull request**

Returns a paginated list of the pull request's commits.

These are the commits that are being merged into the destination
branch when the pull requests gets accepted.

### Example

```bash
curl -X GET \
  -H "Authorization: Bearer $TOKEN" \
  "/repositories/{workspace}/{repo_slug}/pullrequests/{pull_request_id}/commits"
```

---

## POST /repositories/{workspace}/{repo_slug}/pullrequests/{pull_request_id}/decline

**Decline a pull request**

Declines the pull request.

### Example

```bash
curl -X POST \
  -H "Authorization: Bearer $TOKEN" \
  "/repositories/{workspace}/{repo_slug}/pullrequests/{pull_request_id}/decline"
```

---

## GET /repositories/{workspace}/{repo_slug}/pullrequests/{pull_request_id}/diff

**List changes in a pull request**

Redirects to the [repository diff](/cloud/bitbucket/rest/api-group-commits/#api-repositories-workspace-repo-slug-diff-spec-get)
with the revspec that corresponds to the pull request.

### Example

```bash
curl -X GET \
  -H "Authorization: Bearer $TOKEN" \
  "/repositories/{workspace}/{repo_slug}/pullrequests/{pull_request_id}/diff"
```

---

## GET /repositories/{workspace}/{repo_slug}/pullrequests/{pull_request_id}/diffstat

**Get the diff stat for a pull request**

Redirects to the [repository diffstat](/cloud/bitbucket/rest/api-group-commits/#api-repositories-workspace-repo-slug-diffstat-spec-get)
with the revspec that corresponds to the pull request.

### Example

```bash
curl -X GET \
  -H "Authorization: Bearer $TOKEN" \
  "/repositories/{workspace}/{repo_slug}/pullrequests/{pull_request_id}/diffstat"
```

---

## POST /repositories/{workspace}/{repo_slug}/pullrequests/{pull_request_id}/merge

**Merge a pull request**

Merges the pull request.

### Parameters

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| `_body` | body | string | No |  |
| `async` | query | string | No | Default value is false.


When set to true, runs m |

### Example

```bash
curl -X POST \
  -H "Authorization: Bearer $TOKEN" \
  "/repositories/{workspace}/{repo_slug}/pullrequests/{pull_request_id}/merge"
```

---

## GET /repositories/{workspace}/{repo_slug}/pullrequests/{pull_request_id}/merge/task-status/{task_id}

**Get the merge task status for a pull request**

When merging a pull request takes too long, the client receives a
task ID along with a 202 status code. The task ID can be used in a call
to this endpoint to check the status of a merge task.

```
curl -X GET https://api.bitbucket.org/2.0/repositories/atlassian/bitbucket/pullrequests/2286/merge/task-status/<task_id>
```

If the merge task is not yet finished, a PENDING status will be returned.

```
HTTP/2 200
{
    "task_status": "PENDING",
    "links": {
        "self": {
            "href": "https://api.bitbucket.org/2.0/repositories/atlassian/bitbucket/pullrequests/2286/merge/task-status/<task_id>"
        }
    }
}
```

If the merge was successful, a SUCCESS status will be returned.

```
HTTP/2 200
{
    "task_status": "SUCCESS",
    "links": {
        "self": {
            "href": "https://api.bitbucket.org/2.0/repositories/atlassian/bitbucket/pullrequests/2286/merge/task-status/<task_id>"
        }
    },
    "merge_result": <the merged pull request object>
}
```

If the merge task failed, an error will be returned.

```
{
    "type": "error",
    "error": {
        "message": "<error message>"
    }
}
```

### Example

```bash
curl -X GET \
  -H "Authorization: Bearer $TOKEN" \
  "/repositories/{workspace}/{repo_slug}/pullrequests/{pull_request_id}/merge/task-status/{task_id}"
```

---

## GET /repositories/{workspace}/{repo_slug}/pullrequests/{pull_request_id}/patch

**Get the patch for a pull request**

Redirects to the [repository patch](/cloud/bitbucket/rest/api-group-commits/#api-repositories-workspace-repo-slug-patch-spec-get)
with the revspec that corresponds to pull request.

### Example

```bash
curl -X GET \
  -H "Authorization: Bearer $TOKEN" \
  "/repositories/{workspace}/{repo_slug}/pullrequests/{pull_request_id}/patch"
```

---

## DELETE /repositories/{workspace}/{repo_slug}/pullrequests/{pull_request_id}/request-changes

**Remove change request for a pull request**

### Example

```bash
curl -X DELETE \
  -H "Authorization: Bearer $TOKEN" \
  "/repositories/{workspace}/{repo_slug}/pullrequests/{pull_request_id}/request-changes"
```

---

## POST /repositories/{workspace}/{repo_slug}/pullrequests/{pull_request_id}/request-changes

**Request changes for a pull request**

### Example

```bash
curl -X POST \
  -H "Authorization: Bearer $TOKEN" \
  "/repositories/{workspace}/{repo_slug}/pullrequests/{pull_request_id}/request-changes"
```

---

## GET /repositories/{workspace}/{repo_slug}/pullrequests/{pull_request_id}/statuses

**List commit statuses for a pull request**

Returns all statuses (e.g. build results) for the given pull
request.

### Parameters

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| `q` | query | string | No | Query string to narrow down the response as per
[f |
| `sort` | query | string | No | Field by which the results should be sorted as per |

### Example

```bash
curl -X GET \
  -H "Authorization: Bearer $TOKEN" \
  "/repositories/{workspace}/{repo_slug}/pullrequests/{pull_request_id}/statuses"
```

---

## GET /repositories/{workspace}/{repo_slug}/pullrequests/{pull_request_id}/tasks

**List tasks on a pull request**

Returns a paginated list of the pull request's tasks.

This endpoint supports filtering and sorting of the results by the 'task' field.
See [filtering and sorting](/cloud/bitbucket/rest/intro/#filtering) for more details.

### Parameters

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| `q` | query | string | No | 
Query string to narrow down the response. See
[fi |
| `sort` | query | string | No | 
Field by which the results should be sorted as pe |
| `pagelen` | query | string | No | 
Current number of objects on the existing page.
T |

### Example

```bash
curl -X GET \
  -H "Authorization: Bearer $TOKEN" \
  "/repositories/{workspace}/{repo_slug}/pullrequests/{pull_request_id}/tasks"
```

---

## POST /repositories/{workspace}/{repo_slug}/pullrequests/{pull_request_id}/tasks

**Create a task on a pull request**

Creates a new pull request task.

Returns the newly created pull request task.

Tasks can optionally be created in relation to a comment specified by the comment's ID which
will cause the task to appear below the comment on a pull request when viewed in Bitbucket.

### Parameters

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| `_body` | body | string | Yes | The contents of the task |

### Example

```bash
curl -X POST \
  -H "Authorization: Bearer $TOKEN" \
  "/repositories/{workspace}/{repo_slug}/pullrequests/{pull_request_id}/tasks"
```

---

## DELETE /repositories/{workspace}/{repo_slug}/pullrequests/{pull_request_id}/tasks/{task_id}

**Delete a task on a pull request**

Deletes a specific pull request task.

### Example

```bash
curl -X DELETE \
  -H "Authorization: Bearer $TOKEN" \
  "/repositories/{workspace}/{repo_slug}/pullrequests/{pull_request_id}/tasks/{task_id}"
```

---

## GET /repositories/{workspace}/{repo_slug}/pullrequests/{pull_request_id}/tasks/{task_id}

**Get a task on a pull request**

Returns a specific pull request task.

### Example

```bash
curl -X GET \
  -H "Authorization: Bearer $TOKEN" \
  "/repositories/{workspace}/{repo_slug}/pullrequests/{pull_request_id}/tasks/{task_id}"
```

---

## PUT /repositories/{workspace}/{repo_slug}/pullrequests/{pull_request_id}/tasks/{task_id}

**Update a task on a pull request**

Updates a specific pull request task.

### Parameters

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| `_body` | body | string | Yes | The updated state and content of the task. |

### Example

```bash
curl -X PUT \
  -H "Authorization: Bearer $TOKEN" \
  "/repositories/{workspace}/{repo_slug}/pullrequests/{pull_request_id}/tasks/{task_id}"
```

---
