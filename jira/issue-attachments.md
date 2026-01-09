---
created: 2026-01-09
tags: [type/api-reference, api/issue-attachments]
api_name: The Jira Cloud platform REST API
category: Issue attachments
endpoint_count: 8
---

# The Jira Cloud platform REST API - Issue Attachments

[[README|Back to Overview]]

---

## GET /rest/api/3/attachment/content/{id}

**Get attachment content**

Returns the contents of an attachment. A `Range` header can be set to define a range of bytes within the attachment to download. See the [HTTP Range header standard](https://developer.mozilla.org/en-US/docs/Web/HTTP/Headers/Range) for details.

To return a thumbnail of the attachment, use [Get attachment thumbnail](#api-rest-api-3-attachment-thumbnail-id-get).

This operation can be accessed anonymously.

**[Permissions](#permissions) required:** For the issue containing the attachment:

 *  *Browse projects* [project permission](https://confluence.atlassian.com/x/yodKLg) for the project that the issue is in.
 *  If [issue-level security](https://confluence.atlassian.com/x/J4lKLg) is configured, issue-level security permission to view the issue.
 *  If attachments are added in private comments, the comment-level restriction will be applied.

### Parameters

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| `id` | path | string | Yes | The ID of the attachment. |
| `redirect` | query | boolean | No | Whether a redirect is provided for the attachment  |

### Example

```bash
curl -X GET \
  -H "Authorization: Bearer $TOKEN" \
  "https://your-domain.atlassian.net/rest/api/3/attachment/content/{id}"
```

---

## GET /rest/api/3/attachment/meta

**Get Jira attachment settings**

Returns the attachment settings, that is, whether attachments are enabled and the maximum attachment size allowed.

Note that there are also [project permissions](https://confluence.atlassian.com/x/yodKLg) that restrict whether users can create and delete attachments.

This operation can be accessed anonymously.

**[Permissions](#permissions) required:** None.

### Example

```bash
curl -X GET \
  -H "Authorization: Bearer $TOKEN" \
  "https://your-domain.atlassian.net/rest/api/3/attachment/meta"
```

---

## GET /rest/api/3/attachment/thumbnail/{id}

**Get attachment thumbnail**

Returns the thumbnail of an attachment.

To return the attachment contents, use [Get attachment content](#api-rest-api-3-attachment-content-id-get).

This operation can be accessed anonymously.

**[Permissions](#permissions) required:** For the issue containing the attachment:

 *  *Browse projects* [project permission](https://confluence.atlassian.com/x/yodKLg) for the project that the issue is in.
 *  If [issue-level security](https://confluence.atlassian.com/x/J4lKLg) is configured, issue-level security permission to view the issue.
 *  If attachments are added in private comments, the comment-level restriction will be applied.

### Parameters

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| `id` | path | string | Yes | The ID of the attachment. |
| `redirect` | query | boolean | No | Whether a redirect is provided for the attachment  |
| `fallbackToDefault` | query | boolean | No | Whether a default thumbnail is returned when the r |
| `width` | query | integer | No | The maximum width to scale the thumbnail to. |
| `height` | query | integer | No | The maximum height to scale the thumbnail to. |

### Example

```bash
curl -X GET \
  -H "Authorization: Bearer $TOKEN" \
  "https://your-domain.atlassian.net/rest/api/3/attachment/thumbnail/{id}"
```

---

## DELETE /rest/api/3/attachment/{id}

**Delete attachment**

Deletes an attachment from an issue.

This operation can be accessed anonymously.

**[Permissions](#permissions) required:** For the project holding the issue containing the attachment:

 *  *Delete own attachments* [project permission](https://confluence.atlassian.com/x/yodKLg) to delete an attachment created by the calling user.
 *  *Delete all attachments* [project permission](https://confluence.atlassian.com/x/yodKLg) to delete an attachment created by any user.

### Parameters

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| `id` | path | string | Yes | The ID of the attachment. |

### Example

```bash
curl -X DELETE \
  -H "Authorization: Bearer $TOKEN" \
  "https://your-domain.atlassian.net/rest/api/3/attachment/{id}"
```

---

## GET /rest/api/3/attachment/{id}

**Get attachment metadata**

Returns the metadata for an attachment. Note that the attachment itself is not returned.

This operation can be accessed anonymously.

**[Permissions](#permissions) required:**

 *  *Browse projects* [project permission](https://confluence.atlassian.com/x/yodKLg) for the project that the issue is in.
 *  If [issue-level security](https://confluence.atlassian.com/x/J4lKLg) is configured, issue-level security permission to view the issue.
 *  If attachments are added in private comments, the comment-level restriction will be applied.

### Parameters

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| `id` | path | string | Yes | The ID of the attachment. |

### Example

```bash
curl -X GET \
  -H "Authorization: Bearer $TOKEN" \
  "https://your-domain.atlassian.net/rest/api/3/attachment/{id}"
```

---

## GET /rest/api/3/attachment/{id}/expand/human

**Get all metadata for an expanded attachment**

Returns the metadata for the contents of an attachment, if it is an archive, and metadata for the attachment itself. For example, if the attachment is a ZIP archive, then information about the files in the archive is returned and metadata for the ZIP archive. Currently, only the ZIP archive format is supported.

Use this operation to retrieve data that is presented to the user, as this operation returns the metadata for the attachment itself, such as the attachment's ID and name. Otherwise, use [ Get contents metadata for an expanded attachment](#api-rest-api-3-attachment-id-expand-raw-get), which only returns the metadata for the attachment's contents.

This operation can be accessed anonymously.

**[Permissions](#permissions) required:** For the issue containing the attachment:

 *  *Browse projects* [project permission](https://confluence.atlassian.com/x/yodKLg) for the project that the issue is in.
 *  If [issue-level security](https://confluence.atlassian.com/x/J4lKLg) is configured, issue-level security permission to view the issue.
 *  If attachments are added in private comments, the comment-level restriction will be applied.

### Parameters

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| `id` | path | string | Yes | The ID of the attachment. |

### Example

```bash
curl -X GET \
  -H "Authorization: Bearer $TOKEN" \
  "https://your-domain.atlassian.net/rest/api/3/attachment/{id}/expand/human"
```

---

## GET /rest/api/3/attachment/{id}/expand/raw

**Get contents metadata for an expanded attachment**

Returns the metadata for the contents of an attachment, if it is an archive. For example, if the attachment is a ZIP archive, then information about the files in the archive is returned. Currently, only the ZIP archive format is supported.

Use this operation if you are processing the data without presenting it to the user, as this operation only returns the metadata for the contents of the attachment. Otherwise, to retrieve data to present to the user, use [ Get all metadata for an expanded attachment](#api-rest-api-3-attachment-id-expand-human-get) which also returns the metadata for the attachment itself, such as the attachment's ID and name.

This operation can be accessed anonymously.

**[Permissions](#permissions) required:** For the issue containing the attachment:

 *  *Browse projects* [project permission](https://confluence.atlassian.com/x/yodKLg) for the project that the issue is in.
 *  If [issue-level security](https://confluence.atlassian.com/x/J4lKLg) is configured, issue-level security permission to view the issue.
 *  If attachments are added in private comments, the comment-level restriction will be applied.

### Parameters

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| `id` | path | string | Yes | The ID of the attachment. |

### Example

```bash
curl -X GET \
  -H "Authorization: Bearer $TOKEN" \
  "https://your-domain.atlassian.net/rest/api/3/attachment/{id}/expand/raw"
```

---

## POST /rest/api/3/issue/{issueIdOrKey}/attachments

**Add attachment**

Adds one or more attachments to an issue. Attachments are posted as multipart/form-data ([RFC 1867](https://www.ietf.org/rfc/rfc1867.txt)).

Note that:

 *  The request must have a `X-Atlassian-Token: no-check` header, if not it is blocked. See [Special headers](#special-request-headers) for more information.
 *  The name of the multipart/form-data parameter that contains the attachments must be `file`.

The following examples upload a file called *myfile.txt* to the issue *TEST-123*:

#### curl ####

    curl --location --request POST 'https://your-domain.atlassian.net/rest/api/3/issue/TEST-123/attachments'
     -u 'email@example.com:<api_token>'
     -H 'X-Atlassian-Token: no-check'
     --form 'file=@"myfile.txt"'

#### Node.js ####

    // This code sample uses the 'node-fetch' and 'form-data' libraries:
     // https://www.npmjs.com/package/node-fetch
     // https://www.npmjs.com/package/form-data
     const fetch = require('node-fetch');
     const FormData = require('form-data');
     const fs = require('fs');
    
     const filePath = 'myfile.txt';
     const form = new FormData();
     const stats = fs.statSync(filePath);
     const fileSizeInBytes = stats.size;
     const fileStream = fs.createReadStream(filePath);
    
     form.append('file', fileStream, {knownLength: fileSizeInBytes});
    
     fetch('https://your-domain.atlassian.net/rest/api/3/issue/TEST-123/attachments', {
         method: 'POST',
         body: form,
         headers: {
             'Authorization': `Basic ${Buffer.from(
                 'email@example.com:'
             ).toString('base64')}`,
             'Accept': 'application/json',
             'X-Atlassian-Token': 'no-check'
         }
     })
         .then(response => {
             console.log(
                 `Response: ${response.status} ${response.statusText}`
             );
             return response.text();
         })
         .then(text => console.log(text))
         .catch(err => console.error(err));

#### Java ####

    // This code sample uses the  'Unirest' library:
     // http://unirest.io/java.html
     HttpResponse response = Unirest.post("https://your-domain.atlassian.net/rest/api/2/issue/{issueIdOrKey}/attachments")
             .basicAuth("email@example.com", "")
             .header("Accept", "application/json")
             .header("X-Atlassian-Token", "no-check")
             .field("file", new File("myfile.txt"))
             .asJson();
    
             System.out.println(response.getBody());

#### Python ####

    # This code sample uses the 'requests' library:
     # http://docs.python-requests.org
     import requests
     from requests.auth import HTTPBasicAuth
     import json
    
     url = "https://your-domain.atlassian.net/rest/api/2/issue/{issueIdOrKey}/attachments"
    
     auth = HTTPBasicAuth("email@example.com", "")
    
     headers = {
        "Accept": "application/json",
        "X-Atlassian-Token": "no-check"
     }
    
     response = requests.request(
        "POST",
        url,
        headers = headers,
        auth = auth,
        files = {
             "file": ("myfile.txt", open("myfile.txt","rb"), "application-type")
        }
     )
    
     print(json.dumps(json.loads(response.text), sort_keys=True, indent=4, separators=(",", ": ")))

#### PHP ####

    // This code sample uses the 'Unirest' library:
     // http://unirest.io/php.html
     Unirest\Request::auth('email@example.com', '');
    
     $headers = array(
       'Accept' => 'application/json',
       'X-Atlassian-Token' => 'no-check'
     );
    
     $parameters = array(
       'file' => File::add('myfile.txt')
     );
    
     $response = Unirest\Request::post(
       'https://your-domain.atlassian.net/rest/api/2/issue/{issueIdOrKey}/attachments',
       $headers,
       $parameters
     );
    
     var_dump($response)

#### Forge ####

    // This sample uses Atlassian Forge and the `form-data` library.
     // https://developer.atlassian.com/platform/forge/
     // https://www.npmjs.com/package/form-data
     import api from "@forge/api";
     import FormData from "form-data";
    
     const form = new FormData();
     form.append('file', fileStream, {knownLength: fileSizeInBytes});
    
     const response = await api.asApp().requestJira('/rest/api/2/issue/{issueIdOrKey}/attachments', {
         method: 'POST',
         body: form,
         headers: {
             'Accept': 'application/json',
             'X-Atlassian-Token': 'no-check'
         }
     });
    
     console.log(`Response: ${response.status} ${response.statusText}`);
     console.log(await response.json());

Tip: Use a client library. Many client libraries have classes for handling multipart POST operations. For example, in Java, the Apache HTTP Components library provides a [MultiPartEntity](http://hc.apache.org/httpcomponents-client-ga/httpmime/apidocs/org/apache/http/entity/mime/MultipartEntity.html) class for multipart POST operations.

This operation can be accessed anonymously.

**[Permissions](#permissions) required:** 

 *  *Browse Projects* and *Create attachments* [ project permission](https://confluence.atlassian.com/x/yodKLg) for the project that the issue is in.
 *  If [issue-level security](https://confluence.atlassian.com/x/J4lKLg) is configured, issue-level security permission to view the issue.

### Parameters

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| `issueIdOrKey` | path | string | Yes | The ID or key of the issue that attachments are ad |

### Example

```bash
curl -X POST \
  -H "Authorization: Bearer $TOKEN" \
  "https://your-domain.atlassian.net/rest/api/3/issue/{issueIdOrKey}/attachments"
```

---
