---
created: 2026-01-09
tags: [type/api-reference, api/storage/datasets]
api_name: Apify API
category: Storage/Datasets
endpoint_count: 8
---

# Apify API - Storage/Datasets

[[README|Back to Overview]]

---

## GET /v2/datasets

**Get list of datasets**

Lists all of a user's datasets.

The response is a JSON array of objects,
where each object contains basic information about one dataset.

By default, the objects are sorted by the `createdAt` field in ascending
order, therefore you can use pagination to incrementally fetch all datasets while new
ones are still being created. To sort them in descending order, use `desc=1`
parameter. The endpoint supports pagination using `limit` and `offset`
parameters and it will not return more than 1000 array elements.


### Parameters

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| `offset` | query | number | No | Number of array elements that should be skipped at |
| `limit` | query | number | No | Maximum number of array elements to return. The de |
| `desc` | query | boolean | No | If `true` or `1` then the objects are sorted by th |
| `unnamed` | query | boolean | No | If `true` or `1` then all the datasets are returne |

### Example

```bash
curl -X GET \
  -H "Authorization: Bearer $TOKEN" \
  "https://api.apify.com/v2/datasets"
```

---

## POST /v2/datasets

**Create dataset**

Creates a dataset and returns its object.
Keep in mind that data stored under unnamed dataset follows [data retention period](https://docs.apify.com/platform/storage#data-retention).
It creates a dataset with the given name if the parameter name is used.
If a dataset with the given name already exists then returns its object.


### Parameters

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| `name` | query | string | No | Custom unique name to easily identify the dataset  |

### Example

```bash
curl -X POST \
  -H "Authorization: Bearer $TOKEN" \
  "https://api.apify.com/v2/datasets"
```

---

## GET /v2/datasets/{datasetId}

**Get dataset**

Returns dataset object for given dataset ID.

This does not return dataset items, only information about the storage itself.
To retrieve dataset items, use the [List dataset items](/api/v2/dataset-items-get) endpoint.

:::note

Keep in mind that attributes `itemCount` and `cleanItemCount` are not propagated right away after data are pushed into a dataset.

:::

There is a short period (up to 5 seconds) during which these counters may not match with exact counts in dataset items.


### Parameters

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| `datasetId` | path | string | Yes | Dataset ID or `username~dataset-name`. |
| `token` | query | string | No | API authentication token. It is required only when |

### Example

```bash
curl -X GET \
  -H "Authorization: Bearer $TOKEN" \
  "https://api.apify.com/v2/datasets/{datasetId}"
```

---

## PUT /v2/datasets/{datasetId}

**Update dataset**

Updates a dataset's name and general resource access level using a value specified by a JSON object passed in the PUT payload.
The response is the updated dataset object, as returned by the [Get dataset](#/reference/datasets/dataset-collection/get-dataset) API endpoint.


### Parameters

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| `datasetId` | path | string | Yes | Dataset ID or `username~dataset-name`. |

### Example

```bash
curl -X PUT \
  -H "Authorization: Bearer $TOKEN" \
  "https://api.apify.com/v2/datasets/{datasetId}"
```

---

## DELETE /v2/datasets/{datasetId}

**Delete dataset**

Deletes a specific dataset.

### Parameters

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| `datasetId` | path | string | Yes | Dataset ID or `username~dataset-name`. |

### Example

```bash
curl -X DELETE \
  -H "Authorization: Bearer $TOKEN" \
  "https://api.apify.com/v2/datasets/{datasetId}"
```

---

## GET /v2/datasets/{datasetId}/items

**Get dataset items**

Returns data stored in the dataset in a desired format.

### Response format

The format of the response depends on <code>format</code> query parameter.

The <code>format</code> parameter can have one of the following values:
<code>json</code>, <code>jsonl</code>, <code>xml</code>, <code>html</code>,
<code>csv</code>, <code>xlsx</code> and <code>rss</code>.

The following table describes how each format is treated.

<table>
  <tr>
    <th>Format</th>
    <th>Items</th>
  </tr>
  <tr>
    <td><code>json</code></td>
    <td rowspan="3">The response is a JSON, JSONL or XML array of raw item objects.</td>
  </tr>
  <tr>
    <td><code>jsonl</code></td>
  </tr>
  <tr>
    <td><code>xml</code></td>
  </tr>
  <tr>
    <td><code>html</code></td>
    <td rowspan="3">The response is a HTML, CSV or XLSX table, where columns correspond to the
    properties of the item and rows correspond to each dataset item.</td>
  </tr>
  <tr>
    <td><code>csv</code></td>
  </tr>
  <tr>
    <td><code>xlsx</code></td>
  </tr>
  <tr>
    <td><code>rss</code></td>
    <td colspan="2">The response is a RSS file. Each item is displayed as child elements of one
    <code>&lt;item&gt;</code>.</td>
  </tr>
</table>

Note that CSV, XLSX and HTML tables are limited to 2000 columns and the column names cannot be longer than 200 characters.
JSON, XML and RSS formats do not have such restrictions.

### Hidden fields

The top-level fields starting with the `#` character are considered hidden.
These are useful to store debugging information and can be omitted from the output by providing the `skipHidden=1` or `clean=1` query parameters.
For example, if you store the following object to the dataset:

```
{
    productName: "iPhone Xs",
    description: "Welcome to the big screens."
    #debug: {
        url: "https://www.apple.com/lae/iphone-xs/",
        crawledAt: "2019-01-21T16:06:03.683Z"
    }
}
```

The `#debug` field will be considered as hidden and can be omitted from the
results. This is useful to
provide nice cleaned data to end users, while keeping debugging info
available if needed. The Dataset object
returned by the API contains the number of such clean items in the`dataset.cleanItemCount` property.

### XML format extension

When exporting results to XML or RSS formats, the names of object properties become XML tags and the corresponding values become tag's children. For example, the following JavaScript object:

```
{
    name: "Paul Newman",
    address: [
        { type: "home", street: "21st", city: "Chicago" },
        { type: "office", street: null, city: null }
    ]
}
```

will be transformed to the following XML snippet:

```
<name>Paul Newman</name>
<address>
  <type>home</type>
  <street>21st</street>
  <city>Chicago</city>
</address>
<address>
  <type>office</type>
  <street/>
  <city/>
</address>
```

If the JavaScript object contains a property named `@` then its sub-properties are exported as attributes of the parent XML
element.
If the parent XML element does not have any child elements then its value is taken from a JavaScript object property named `#`.

For example, the following JavaScript object:

```
{
  "address": [{
    "@": {
      "type": "home"
    },
    "street": "21st",
    "city": "Chicago"
  },
  {
    "@": {
      "type": "office"
    },
    "#": 'unknown'
  }]
}
```

will be transformed to the following XML snippet:

```
<address type="home">
  <street>21st</street>
  <city>Chicago</city>
</address>
<address type="office">unknown</address>
```

This feature is also useful to customize your RSS feeds generated for various websites.

By default the whole result is wrapped in a `<items>` element and each page object is wrapped in a `<item>` element.
You can change this using <code>xmlRoot</code> and <code>xmlRow</code> url parameters.

### Pagination

The generated response supports [pagination](#/introduction/pagination).
The pagination is always performed with the granularity of a single item, regardless whether <code>unwind</code> parameter was provided.
By default, the **Items** in the response are sorted by the time they were stored to the database, therefore you can use pagination to incrementally fetch the items as they are being added.
No limit exists to how many items can be returned in one response.

If you specify `desc=1` query parameter, the results are returned in the reverse order than they were stored (i.e. from newest to oldest items).
Note that only the order of **Items** is reversed, but not the order of the `unwind` array elements.


### Parameters

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| `datasetId` | path | string | Yes | Dataset ID or `username~dataset-name`. |
| `format` | query | string | No | Format of the results, possible values are: `json` |
| `clean` | query | boolean | No | If `true` or `1` then the API endpoint returns onl |
| `offset` | query | number | No | Number of items that should be skipped at the star |
| `limit` | query | number | No | Maximum number of items to return. By default ther |
| `fields` | query | string | No | A comma-separated list of fields which should be p |
| `omit` | query | string | No | A comma-separated list of fields which should be o |
| `unwind` | query | string | No | A comma-separated list of fields which should be u |
| `flatten` | query | string | No | A comma-separated list of fields which should tran |
| `desc` | query | boolean | No | By default, results are returned in the same order |
| `attachment` | query | boolean | No | If `true` or `1` then the response will define the |
| `delimiter` | query | string | No | A delimiter character for CSV files, only used if  |
| `bom` | query | boolean | No | All text responses are encoded in UTF-8 encoding.  |
| `xmlRoot` | query | string | No | Overrides default root element name of `xml` outpu |
| `xmlRow` | query | string | No | Overrides default element name that wraps each pag |
| `skipHeaderRow` | query | boolean | No | If `true` or `1` then header row in the `csv` form |
| `skipHidden` | query | boolean | No | If `true` or `1` then hidden fields are skipped fr |
| `skipEmpty` | query | boolean | No | If `true` or `1` then empty items are skipped from |
| `simplified` | query | boolean | No | If `true` or `1` then, the endpoint applies the `f |
| `view` | query | string | No | Defines the view configuration for dataset items b |
| `skipFailedPages` | query | boolean | No | If `true` or `1` then, the all the items with erro |
| `signature` | query | string | No | Signature used to access the items. |

### Example

```bash
curl -X GET \
  -H "Authorization: Bearer $TOKEN" \
  "https://api.apify.com/v2/datasets/{datasetId}/items"
```

---

## POST /v2/datasets/{datasetId}/items

**Store items**

Appends an item or an array of items to the end of the dataset.
The POST payload is a JSON object or a JSON array of objects to save into the dataset.

If the data you attempt to store in the dataset is invalid (meaning any of the items received by the API fails the validation), the whole request is discarded and the API will return a response with status code 400.
For more information about dataset schema validation, see [Dataset schema](https://docs.apify.com/platform/actors/development/actor-definition/dataset-schema/validation).

**IMPORTANT:** The limit of request payload size for the dataset is 5 MB. If the array exceeds the size, you'll need to split it into a number of smaller arrays.


### Parameters

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| `datasetId` | path | string | Yes | Dataset ID or `username~dataset-name`. |

### Example

```bash
curl -X POST \
  -H "Authorization: Bearer $TOKEN" \
  "https://api.apify.com/v2/datasets/{datasetId}/items"
```

---

## GET /v2/datasets/{datasetId}/statistics

**Get dataset statistics**

Returns statistics for given dataset.

Provides only [field statistics](https://docs.apify.com/platform/actors/development/actor-definition/dataset-schema/validation#dataset-field-statistics).


### Parameters

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| `datasetId` | path | string | Yes | Dataset ID or `username~dataset-name`. |

### Example

```bash
curl -X GET \
  -H "Authorization: Bearer $TOKEN" \
  "https://api.apify.com/v2/datasets/{datasetId}/statistics"
```

---
