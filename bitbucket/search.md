---
created: 2026-01-09
tags: [type/api-reference, api/search]
api_name: Bitbucket API
category: Search
endpoint_count: 3
---

# Bitbucket API - Search

[[README|Back to Overview]]

---

## GET /teams/{username}/search/code

**Search for code in a team's repositories**

Search for code in the repositories of the specified team.

Note that searches can match in the file's text (`content_matches`),
the path (`path_matches`), or both.

You can use the same syntax for the search query as in the UI.
E.g. to search for "foo" only within the repository "demo",
use the query parameter `search_query=foo+repo:demo`.

Similar to other APIs, you can request more fields using a
`fields` query parameter. E.g. to get some more information about
the repository of matched files, use the query parameter
`search_query=foo&fields=%2Bvalues.file.commit.repository`
(the `%2B` is a URL-encoded `+`).

Try `fields=%2Bvalues.*.*.*.*` to get an idea what's possible.


### Parameters

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| `username` | path | string | Yes | The account to search in; either the username or t |
| `search_query` | query | string | Yes | The search query |
| `page` | query | string | No | Which page of the search results to retrieve |
| `pagelen` | query | string | No | How many search results to retrieve per page |

### Example

```bash
curl -X GET \
  -H "Authorization: Bearer $TOKEN" \
  "/teams/{username}/search/code"
```

---

## GET /users/{selected_user}/search/code

**Search for code in a user's repositories**

Search for code in the repositories of the specified user.

Note that searches can match in the file's text (`content_matches`),
the path (`path_matches`), or both.

You can use the same syntax for the search query as in the UI.
E.g. to search for "foo" only within the repository "demo",
use the query parameter `search_query=foo+repo:demo`.

Similar to other APIs, you can request more fields using a
`fields` query parameter. E.g. to get some more information about
the repository of matched files, use the query parameter
`search_query=foo&fields=%2Bvalues.file.commit.repository`
(the `%2B` is a URL-encoded `+`).


### Parameters

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| `selected_user` | path | string | Yes | Either the UUID of the account surrounded by curly |
| `search_query` | query | string | Yes | The search query |
| `page` | query | string | No | Which page of the search results to retrieve |
| `pagelen` | query | string | No | How many search results to retrieve per page |

### Example

```bash
curl -X GET \
  -H "Authorization: Bearer $TOKEN" \
  "/users/{selected_user}/search/code"
```

---

## GET /workspaces/{workspace}/search/code

**Search for code in a workspace**

Search for code in the repositories of the specified workspace.

Note that searches can match in the file's text (`content_matches`),
the path (`path_matches`), or both.

You can use the same syntax for the search query as in the UI.
E.g. to search for "foo" only within the repository "demo",
use the query parameter `search_query=foo+repo:demo`.

Similar to other APIs, you can request more fields using a
`fields` query parameter. E.g. to get some more information about
the repository of matched files, use the query parameter
`search_query=foo&fields=%2Bvalues.file.commit.repository`
(the `%2B` is a URL-encoded `+`).

Try `fields=%2Bvalues.*.*.*.*` to get an idea what's possible.


### Parameters

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| `workspace` | path | string | Yes | The workspace to search in; either the slug or the |
| `search_query` | query | string | Yes | The search query |
| `page` | query | string | No | Which page of the search results to retrieve |
| `pagelen` | query | string | No | How many search results to retrieve per page |

### Example

```bash
curl -X GET \
  -H "Authorization: Bearer $TOKEN" \
  "/workspaces/{workspace}/search/code"
```

---
