---
created: 2026-01-08
tags: [type/api-reference, api/kubernetes]
api_name: DigitalOcean API
category: Kubernetes
endpoint_count: 28
---

# DigitalOcean API - Kubernetes

[[README|Back to Overview]]

---

## GET /v2/kubernetes/clusters

**List All Kubernetes Clusters**

To list all of the Kubernetes clusters on your account, send a GET request
to `/v2/kubernetes/clusters`.


### Parameters

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| `` | query | string | No |  |
| `` | query | string | No |  |

### Example

```bash
curl -X GET \
  -H "Authorization: Bearer $TOKEN" \
  "https://api.digitalocean.com/v2/kubernetes/clusters"
```

---

## POST /v2/kubernetes/clusters

**Create a New Kubernetes Cluster**

To create a new Kubernetes cluster, send a POST request to
`/v2/kubernetes/clusters`. The request must contain at least one node pool
with at least one worker.

The request may contain a maintenance window policy describing a time period
when disruptive maintenance tasks may be carried out. Omitting the policy
implies that a window will be chosen automatically. See
[here](https://docs.digitalocean.com/products/kubernetes/how-to/upgrade-cluster/)
for details.


### Example

```bash
curl -X POST \
  -H "Authorization: Bearer $TOKEN" \
  "https://api.digitalocean.com/v2/kubernetes/clusters"
```

---

## GET /v2/kubernetes/clusters/{cluster_id}

**Retrieve an Existing Kubernetes Cluster**

To show information about an existing Kubernetes cluster, send a GET request
to `/v2/kubernetes/clusters/$K8S_CLUSTER_ID`.


### Parameters

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| `` | query | string | No |  |

### Example

```bash
curl -X GET \
  -H "Authorization: Bearer $TOKEN" \
  "https://api.digitalocean.com/v2/kubernetes/clusters/{cluster_id}"
```

---

## PUT /v2/kubernetes/clusters/{cluster_id}

**Update a Kubernetes Cluster**

To update a Kubernetes cluster, send a PUT request to
`/v2/kubernetes/clusters/$K8S_CLUSTER_ID` and specify one or more of the
attributes below.


### Parameters

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| `` | query | string | No |  |

### Example

```bash
curl -X PUT \
  -H "Authorization: Bearer $TOKEN" \
  "https://api.digitalocean.com/v2/kubernetes/clusters/{cluster_id}"
```

---

## DELETE /v2/kubernetes/clusters/{cluster_id}

**Delete a Kubernetes Cluster**

To delete a Kubernetes cluster and all services deployed to it, send a DELETE
request to `/v2/kubernetes/clusters/$K8S_CLUSTER_ID`.

A 204 status code with no body will be returned in response to a successful
request.


### Parameters

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| `` | query | string | No |  |

### Example

```bash
curl -X DELETE \
  -H "Authorization: Bearer $TOKEN" \
  "https://api.digitalocean.com/v2/kubernetes/clusters/{cluster_id}"
```

---

## GET /v2/kubernetes/clusters/{cluster_id}/destroy_with_associated_resources

**List Associated Resources for Cluster Deletion**

To list the associated billable resources that can be destroyed along with a cluster, send a GET request to the `/v2/kubernetes/clusters/$K8S_CLUSTER_ID/destroy_with_associated_resources` endpoint.

### Parameters

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| `` | query | string | No |  |

### Example

```bash
curl -X GET \
  -H "Authorization: Bearer $TOKEN" \
  "https://api.digitalocean.com/v2/kubernetes/clusters/{cluster_id}/destroy_with_associated_resources"
```

---

## DELETE /v2/kubernetes/clusters/{cluster_id}/destroy_with_associated_resources/selective

**Selectively Delete a Cluster and its Associated Resources**

To delete a Kubernetes cluster along with a subset of its associated resources,
send a DELETE request to `/v2/kubernetes/clusters/$K8S_CLUSTER_ID/destroy_with_associated_resources/selective`.

The JSON body of the request should include `load_balancers`, `volumes`, or
`volume_snapshots` keys each set to an array of IDs for the associated
resources to be destroyed.

The IDs can be found by querying the cluster's associated resources endpoint.
Any associated resource not included in the request will remain and continue
to accrue changes on your account.


### Parameters

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| `` | query | string | No |  |

### Example

```bash
curl -X DELETE \
  -H "Authorization: Bearer $TOKEN" \
  "https://api.digitalocean.com/v2/kubernetes/clusters/{cluster_id}/destroy_with_associated_resources/selective"
```

---

## DELETE /v2/kubernetes/clusters/{cluster_id}/destroy_with_associated_resources/dangerous

**Delete a Cluster and All of its Associated Resources (Dangerous)**

To delete a Kubernetes cluster with all of its associated resources, send a
DELETE request to `/v2/kubernetes/clusters/$K8S_CLUSTER_ID/destroy_with_associated_resources/dangerous`.
A 204 status code with no body will be returned in response to a successful request.


### Parameters

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| `` | query | string | No |  |

### Example

```bash
curl -X DELETE \
  -H "Authorization: Bearer $TOKEN" \
  "https://api.digitalocean.com/v2/kubernetes/clusters/{cluster_id}/destroy_with_associated_resources/dangerous"
```

---

## GET /v2/kubernetes/clusters/{cluster_id}/kubeconfig

**Retrieve the kubeconfig for a Kubernetes Cluster**

This endpoint returns a kubeconfig file in YAML format. It can be used to
connect to and administer the cluster using the Kubernetes command line tool,
`kubectl`, or other programs supporting kubeconfig files (e.g., client libraries).

The resulting kubeconfig file uses token-based authentication for clusters
supporting it, and certificate-based authentication otherwise. For a list of
supported versions and more information, see "[How to Connect to a DigitalOcean
Kubernetes Cluster](https://docs.digitalocean.com/products/kubernetes/how-to/connect-to-cluster/)".

To retrieve a kubeconfig file for use with a Kubernetes cluster, send a GET
request to `/v2/kubernetes/clusters/$K8S_CLUSTER_ID/kubeconfig`.

Clusters supporting token-based authentication may define an expiration by
passing a duration in seconds as a query parameter to
`/v2/kubernetes/clusters/$K8S_CLUSTER_ID/kubeconfig?expiry_seconds=$DURATION_IN_SECONDS`.
If not set or 0, then the token will have a 7 day expiry. The query parameter
has no impact in certificate-based authentication.

Kubernetes Roles granted to a user with a token-based kubeconfig are derived from that user's
DigitalOcean role. Predefined roles (Owner, Member, Modifier etc.) have an automatic mapping
to Kubernetes roles. Custom roles are not automatically mapped to any Kubernetes roles,
and require [additional configuration](https://docs.digitalocean.com/products/kubernetes/how-to/set-up-custom-rolebindings/)
by a cluster administrator.


### Parameters

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| `` | query | string | No |  |
| `` | query | string | No |  |

### Example

```bash
curl -X GET \
  -H "Authorization: Bearer $TOKEN" \
  "https://api.digitalocean.com/v2/kubernetes/clusters/{cluster_id}/kubeconfig"
```

---

## GET /v2/kubernetes/clusters/{cluster_id}/credentials

**Retrieve Credentials for a Kubernetes Cluster**

This endpoint returns a JSON object . It can be used to programmatically
construct Kubernetes clients which cannot parse kubeconfig files.

The resulting JSON object contains token-based authentication for clusters
supporting it, and certificate-based authentication otherwise. For a list of
supported versions and more information, see "[How to Connect to a DigitalOcean
Kubernetes Cluster](https://docs.digitalocean.com/products/kubernetes/how-to/connect-to-cluster/)".

To retrieve credentials for accessing a Kubernetes cluster, send a GET
request to `/v2/kubernetes/clusters/$K8S_CLUSTER_ID/credentials`.

Clusters supporting token-based authentication may define an expiration by
passing a duration in seconds as a query parameter to
`/v2/kubernetes/clusters/$K8S_CLUSTER_ID/credentials?expiry_seconds=$DURATION_IN_SECONDS`.
If not set or 0, then the token will have a 7 day expiry. The query parameter
has no impact in certificate-based authentication.


### Parameters

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| `` | query | string | No |  |
| `` | query | string | No |  |

### Example

```bash
curl -X GET \
  -H "Authorization: Bearer $TOKEN" \
  "https://api.digitalocean.com/v2/kubernetes/clusters/{cluster_id}/credentials"
```

---

## GET /v2/kubernetes/clusters/{cluster_id}/upgrades

**Retrieve Available Upgrades for an Existing Kubernetes Cluster**

To determine whether a cluster can be upgraded, and the versions to which it
can be upgraded, send a GET request to
`/v2/kubernetes/clusters/$K8S_CLUSTER_ID/upgrades`.


### Parameters

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| `` | query | string | No |  |

### Example

```bash
curl -X GET \
  -H "Authorization: Bearer $TOKEN" \
  "https://api.digitalocean.com/v2/kubernetes/clusters/{cluster_id}/upgrades"
```

---

## POST /v2/kubernetes/clusters/{cluster_id}/upgrade

**Upgrade a Kubernetes Cluster**

To immediately upgrade a Kubernetes cluster to a newer patch release of
Kubernetes, send a POST request to `/v2/kubernetes/clusters/$K8S_CLUSTER_ID/upgrade`.
The body of the request must specify a version attribute.

Available upgrade versions for a cluster can be fetched from
`/v2/kubernetes/clusters/$K8S_CLUSTER_ID/upgrades`.


### Parameters

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| `` | query | string | No |  |

### Example

```bash
curl -X POST \
  -H "Authorization: Bearer $TOKEN" \
  "https://api.digitalocean.com/v2/kubernetes/clusters/{cluster_id}/upgrade"
```

---

## GET /v2/kubernetes/clusters/{cluster_id}/node_pools

**List All Node Pools in a Kubernetes Clusters**

To list all of the node pools in a Kubernetes clusters, send a GET request to
`/v2/kubernetes/clusters/$K8S_CLUSTER_ID/node_pools`.


### Parameters

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| `` | query | string | No |  |

### Example

```bash
curl -X GET \
  -H "Authorization: Bearer $TOKEN" \
  "https://api.digitalocean.com/v2/kubernetes/clusters/{cluster_id}/node_pools"
```

---

## POST /v2/kubernetes/clusters/{cluster_id}/node_pools

**Add a Node Pool to a Kubernetes Cluster**

To add an additional node pool to a Kubernetes clusters, send a POST request
to `/v2/kubernetes/clusters/$K8S_CLUSTER_ID/node_pools` with the following
attributes.


### Parameters

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| `` | query | string | No |  |

### Example

```bash
curl -X POST \
  -H "Authorization: Bearer $TOKEN" \
  "https://api.digitalocean.com/v2/kubernetes/clusters/{cluster_id}/node_pools"
```

---

## GET /v2/kubernetes/clusters/{cluster_id}/node_pools/{node_pool_id}

**Retrieve a Node Pool for a Kubernetes Cluster**

To show information about a specific node pool in a Kubernetes cluster, send
a GET request to `/v2/kubernetes/clusters/$K8S_CLUSTER_ID/node_pools/$NODE_POOL_ID`.


### Parameters

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| `` | query | string | No |  |
| `` | query | string | No |  |

### Example

```bash
curl -X GET \
  -H "Authorization: Bearer $TOKEN" \
  "https://api.digitalocean.com/v2/kubernetes/clusters/{cluster_id}/node_pools/{node_pool_id}"
```

---

## PUT /v2/kubernetes/clusters/{cluster_id}/node_pools/{node_pool_id}

**Update a Node Pool in a Kubernetes Cluster**

To update the name of a node pool, edit the tags applied to it, or adjust its
number of nodes, send a PUT request to
`/v2/kubernetes/clusters/$K8S_CLUSTER_ID/node_pools/$NODE_POOL_ID` with the
following attributes.


### Parameters

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| `` | query | string | No |  |
| `` | query | string | No |  |

### Example

```bash
curl -X PUT \
  -H "Authorization: Bearer $TOKEN" \
  "https://api.digitalocean.com/v2/kubernetes/clusters/{cluster_id}/node_pools/{node_pool_id}"
```

---

## DELETE /v2/kubernetes/clusters/{cluster_id}/node_pools/{node_pool_id}

**Delete a Node Pool in a Kubernetes Cluster**

To delete a node pool, send a DELETE request to
`/v2/kubernetes/clusters/$K8S_CLUSTER_ID/node_pools/$NODE_POOL_ID`.

A 204 status code with no body will be returned in response to a successful
request. Nodes in the pool will subsequently be drained and deleted.


### Parameters

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| `` | query | string | No |  |
| `` | query | string | No |  |

### Example

```bash
curl -X DELETE \
  -H "Authorization: Bearer $TOKEN" \
  "https://api.digitalocean.com/v2/kubernetes/clusters/{cluster_id}/node_pools/{node_pool_id}"
```

---

## DELETE /v2/kubernetes/clusters/{cluster_id}/node_pools/{node_pool_id}/nodes/{node_id}

**Delete a Node in a Kubernetes Cluster**

To delete a single node in a pool, send a DELETE request to
`/v2/kubernetes/clusters/$K8S_CLUSTER_ID/node_pools/$NODE_POOL_ID/nodes/$NODE_ID`.

Appending the `skip_drain=1` query parameter to the request causes node
draining to be skipped. Omitting the query parameter or setting its value to
`0` carries out draining prior to deletion.

Appending the `replace=1` query parameter to the request causes the node to
be replaced by a new one after deletion. Omitting the query parameter or
setting its value to `0` deletes without replacement.


### Parameters

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| `` | query | string | No |  |
| `` | query | string | No |  |
| `` | query | string | No |  |
| `` | query | string | No |  |
| `` | query | string | No |  |

### Example

```bash
curl -X DELETE \
  -H "Authorization: Bearer $TOKEN" \
  "https://api.digitalocean.com/v2/kubernetes/clusters/{cluster_id}/node_pools/{node_pool_id}/nodes/{node_id}"
```

---

## POST /v2/kubernetes/clusters/{cluster_id}/node_pools/{node_pool_id}/recycle

**Recycle a Kubernetes Node Pool**

The endpoint has been deprecated. Please use the DELETE
`/v2/kubernetes/clusters/$K8S_CLUSTER_ID/node_pools/$NODE_POOL_ID/nodes/$NODE_ID`
method instead.


### Parameters

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| `` | query | string | No |  |
| `` | query | string | No |  |

### Example

```bash
curl -X POST \
  -H "Authorization: Bearer $TOKEN" \
  "https://api.digitalocean.com/v2/kubernetes/clusters/{cluster_id}/node_pools/{node_pool_id}/recycle"
```

---

## GET /v2/kubernetes/clusters/{cluster_id}/user

**Retrieve User Information for a Kubernetes Cluster**

To show information the user associated with a Kubernetes cluster, send a GET
request to `/v2/kubernetes/clusters/$K8S_CLUSTER_ID/user`.


### Parameters

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| `` | query | string | No |  |

### Example

```bash
curl -X GET \
  -H "Authorization: Bearer $TOKEN" \
  "https://api.digitalocean.com/v2/kubernetes/clusters/{cluster_id}/user"
```

---

## GET /v2/kubernetes/options

**List Available Regions, Node Sizes, and Versions of Kubernetes**

To list the versions of Kubernetes available for use, the regions that support Kubernetes, and the available node sizes, send a GET request to `/v2/kubernetes/options`.

### Example

```bash
curl -X GET \
  -H "Authorization: Bearer $TOKEN" \
  "https://api.digitalocean.com/v2/kubernetes/options"
```

---

## POST /v2/kubernetes/clusters/{cluster_id}/clusterlint

**Run Clusterlint Checks on a Kubernetes Cluster**

Clusterlint helps operators conform to Kubernetes best practices around
resources, security and reliability to avoid common problems while operating
or upgrading the clusters.

To request a clusterlint run on your cluster, send a POST request to
`/v2/kubernetes/clusters/$K8S_CLUSTER_ID/clusterlint`. This will run all
checks present in the `doks` group by default, if a request body is not
specified. Optionally specify the below attributes.

For information about the available checks, please refer to
[the clusterlint check documentation](https://github.com/digitalocean/clusterlint/blob/master/checks.md).


### Parameters

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| `` | query | string | No |  |

### Example

```bash
curl -X POST \
  -H "Authorization: Bearer $TOKEN" \
  "https://api.digitalocean.com/v2/kubernetes/clusters/{cluster_id}/clusterlint"
```

---

## GET /v2/kubernetes/clusters/{cluster_id}/clusterlint

**Fetch Clusterlint Diagnostics for a Kubernetes Cluster**

To request clusterlint diagnostics for your cluster, send a GET request to
`/v2/kubernetes/clusters/$K8S_CLUSTER_ID/clusterlint`. If the `run_id` query
parameter is provided, then the diagnostics for the specific run is fetched.
By default, the latest results are shown.

To find out how to address clusterlint feedback, please refer to
[the clusterlint check documentation](https://github.com/digitalocean/clusterlint/blob/master/checks.md).


### Parameters

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| `` | query | string | No |  |
| `` | query | string | No |  |

### Example

```bash
curl -X GET \
  -H "Authorization: Bearer $TOKEN" \
  "https://api.digitalocean.com/v2/kubernetes/clusters/{cluster_id}/clusterlint"
```

---

## POST /v2/kubernetes/registry

**Add Container Registry to Kubernetes Clusters**

To integrate the container registry with Kubernetes clusters, send a POST request to `/v2/kubernetes/registry`.

### Example

```bash
curl -X POST \
  -H "Authorization: Bearer $TOKEN" \
  "https://api.digitalocean.com/v2/kubernetes/registry"
```

---

## DELETE /v2/kubernetes/registry

**Remove Container Registry from Kubernetes Clusters**

To remove the container registry from Kubernetes clusters, send a DELETE request to `/v2/kubernetes/registry`.

### Example

```bash
curl -X DELETE \
  -H "Authorization: Bearer $TOKEN" \
  "https://api.digitalocean.com/v2/kubernetes/registry"
```

---

## POST /v2/kubernetes/registries

**Add Container Registries to Kubernetes Clusters**

To integrate the container registries with Kubernetes clusters, send a POST request to `/v2/kubernetes/registries`.

### Example

```bash
curl -X POST \
  -H "Authorization: Bearer $TOKEN" \
  "https://api.digitalocean.com/v2/kubernetes/registries"
```

---

## DELETE /v2/kubernetes/registries

**Remove Container Registries from Kubernetes Clusters**

To remove the container registries from Kubernetes clusters, send a DELETE request to `/v2/kubernetes/registries`.

### Example

```bash
curl -X DELETE \
  -H "Authorization: Bearer $TOKEN" \
  "https://api.digitalocean.com/v2/kubernetes/registries"
```

---

## GET /v2/kubernetes/clusters/{cluster_id}/status_messages

**Fetch Status Messages for a Kubernetes Cluster**

To retrieve status messages for a Kubernetes cluster, send a GET request to
`/v2/kubernetes/clusters/$K8S_CLUSTER_ID/status_messages`. Status messages inform users of any issues that come up during the cluster lifecycle.


### Parameters

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| `` | query | string | No |  |
| `` | query | string | No |  |

### Example

```bash
curl -X GET \
  -H "Authorization: Bearer $TOKEN" \
  "https://api.digitalocean.com/v2/kubernetes/clusters/{cluster_id}/status_messages"
```

---
