---
created: 2026-01-09
tags: [type/api-reference, api/users]
api_name: Bitbucket API
category: Users
endpoint_count: 4
---

# Bitbucket API - Users

[[README|Back to Overview]]

---

## GET /user

**Get current user**

Returns the currently logged in user.

### Example

```bash
curl -X GET \
  -H "Authorization: Bearer $TOKEN" \
  "/user"
```

---

## GET /user/emails

**List email addresses for current user**

Returns all the authenticated user's email addresses. Both
confirmed and unconfirmed.

### Example

```bash
curl -X GET \
  -H "Authorization: Bearer $TOKEN" \
  "/user/emails"
```

---

## GET /user/emails/{email}

**Get an email address for current user**

Returns details about a specific one of the authenticated user's
email addresses.

Details describe whether the address has been confirmed by the user and
whether it is the user's primary address or not.

### Example

```bash
curl -X GET \
  -H "Authorization: Bearer $TOKEN" \
  "/user/emails/{email}"
```

---

## GET /users/{selected_user}

**Get a user**

Gets the public information associated with a user account.

If the user's profile is private, `location`, `website` and
`created_on` elements are omitted.

Note that the user object returned by this operation is changing significantly, due to privacy changes.
See the [announcement](https://developer.atlassian.com/cloud/bitbucket/bitbucket-api-changes-gdpr/#changes-to-bitbucket-user-objects) for details.

### Example

```bash
curl -X GET \
  -H "Authorization: Bearer $TOKEN" \
  "/users/{selected_user}"
```

---
