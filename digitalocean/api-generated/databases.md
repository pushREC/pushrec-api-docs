---
created: 2026-01-08
tags: [type/api-reference, api/databases]
api_name: DigitalOcean API
category: Databases
endpoint_count: 69
---

# DigitalOcean API - Databases

[[README|Back to Overview]]

---

## GET /v2/databases/options

**List Database Options**

To list all of the options available for the offered database engines, send a GET request to `/v2/databases/options`.
The result will be a JSON object with an `options` key.

### Example

```bash
curl -X GET \
  -H "Authorization: Bearer $TOKEN" \
  "https://api.digitalocean.com/v2/databases/options"
```

---

## GET /v2/databases

**List All Database Clusters**

To list all of the database clusters available on your account, send a GET request to `/v2/databases`. To limit the results to database clusters with a specific tag, include the `tag_name` query parameter set to the name of the tag. For example, `/v2/databases?tag_name=$TAG_NAME`.

The result will be a JSON object with a `databases` key. This will be set to an array of database objects, each of which will contain the standard database attributes.

The embedded `connection` and `private_connection` objects will contain the information needed to access the database cluster. For multi-node clusters, the `standby_connection` and `standby_private_connection` objects will contain the information needed to connect to the cluster's standby node(s).

The embedded `maintenance_window` object will contain information about any scheduled maintenance for the database cluster.

### Parameters

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| `` | query | string | No |  |

### Example

```bash
curl -X GET \
  -H "Authorization: Bearer $TOKEN" \
  "https://api.digitalocean.com/v2/databases"
```

---

## POST /v2/databases

**Create a New Database Cluster**

To create a database cluster, send a POST request to `/v2/databases`. To see a list  of options for each engine, such as available regions, size slugs, and versions, send a GET request to the `/v2/databases/options` endpoint. The available sizes for  the `storage_size_mib` field depends on the cluster's size. To see a list of available sizes, see [Managed Database Pricing](https://www.digitalocean.com/pricing/managed-databases).

The create response returns a JSON object with a key called `database`. The value of this is an object that contains the standard attributes associated with a database cluster. The initial value of the database cluster's `status` attribute is `creating`. When the cluster is ready to receive traffic, this changes to `online`.

The embedded `connection` and `private_connection` objects contains the information needed to access the database cluster. For multi-node clusters, the `standby_connection` and `standby_private_connection` objects contain the information needed to connect to the cluster's standby node(s).

DigitalOcean managed PostgreSQL and MySQL database clusters take automated daily backups. To create a new database cluster based on a backup of an existing cluster, send a POST request to `/v2/databases`. In addition to the standard database cluster attributes, the JSON body must include a key named `backup_restore` with the name of the original database cluster and the timestamp of the backup to be restored. Creating a database from a backup is the same as forking a database in the control panel.
Note: Caching cluster creates are no longer supported as of 2025-04-30T00:00:00Z. Backups are also not supported for Caching or Valkey clusters.

### Example

```bash
curl -X POST \
  -H "Authorization: Bearer $TOKEN" \
  "https://api.digitalocean.com/v2/databases"
```

---

## GET /v2/databases/{database_cluster_uuid}

**Retrieve an Existing Database Cluster**

To show information about an existing database cluster, send a GET request to `/v2/databases/$DATABASE_ID`.

The response will be a JSON object with a database key. This will be set to an object containing the standard database cluster attributes.

The embedded `connection` and `private_connection` objects will contain the information needed to access the database cluster. For multi-node clusters, the `standby_connection` and `standby_private_connection` objects contain the information needed to connect to the cluster's standby node(s).

The embedded maintenance_window object will contain information about any scheduled maintenance for the database cluster.

### Parameters

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| `` | query | string | No |  |

### Example

```bash
curl -X GET \
  -H "Authorization: Bearer $TOKEN" \
  "https://api.digitalocean.com/v2/databases/{database_cluster_uuid}"
```

---

## DELETE /v2/databases/{database_cluster_uuid}

**Destroy a Database Cluster**

To destroy a specific database, send a DELETE request to `/v2/databases/$DATABASE_ID`.
A status of 204 will be given. This indicates that the request was processed successfully, but that no response body is needed.

### Parameters

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| `` | query | string | No |  |

### Example

```bash
curl -X DELETE \
  -H "Authorization: Bearer $TOKEN" \
  "https://api.digitalocean.com/v2/databases/{database_cluster_uuid}"
```

---

## GET /v2/databases/{database_cluster_uuid}/config

**Retrieve an Existing Database Cluster Configuration**

Shows configuration parameters for an existing database cluster by sending a GET request to
`/v2/databases/$DATABASE_ID/config`.
The response is a JSON object with a `config` key, which is set to an object
containing any database configuration parameters.


### Parameters

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| `` | query | string | No |  |

### Example

```bash
curl -X GET \
  -H "Authorization: Bearer $TOKEN" \
  "https://api.digitalocean.com/v2/databases/{database_cluster_uuid}/config"
```

---

## PATCH /v2/databases/{database_cluster_uuid}/config

**Update the Database Configuration for an Existing Database**

To update the configuration for an existing database cluster, send a PATCH request to
`/v2/databases/$DATABASE_ID/config`.


### Parameters

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| `` | query | string | No |  |

### Example

```bash
curl -X PATCH \
  -H "Authorization: Bearer $TOKEN" \
  "https://api.digitalocean.com/v2/databases/{database_cluster_uuid}/config"
```

---

## GET /v2/databases/{database_cluster_uuid}/ca

**Retrieve the Public Certificate**

To retrieve the public certificate used to secure the connection to the database cluster send a GET request to
`/v2/databases/$DATABASE_ID/ca`.

The response will be a JSON object with a `ca` key. This will be set to an object
containing the base64 encoding of the public key certificate.


### Parameters

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| `` | query | string | No |  |

### Example

```bash
curl -X GET \
  -H "Authorization: Bearer $TOKEN" \
  "https://api.digitalocean.com/v2/databases/{database_cluster_uuid}/ca"
```

---

## GET /v2/databases/{database_cluster_uuid}/online-migration

**Retrieve the Status of an Online Migration**

To retrieve the status of the most recent online migration, send a GET request to `/v2/databases/$DATABASE_ID/online-migration`. 

### Parameters

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| `` | query | string | No |  |

### Example

```bash
curl -X GET \
  -H "Authorization: Bearer $TOKEN" \
  "https://api.digitalocean.com/v2/databases/{database_cluster_uuid}/online-migration"
```

---

## PUT /v2/databases/{database_cluster_uuid}/online-migration

**Start an Online Migration**

To start an online migration, send a PUT request to `/v2/databases/$DATABASE_ID/online-migration` endpoint. Migrating a cluster establishes a connection with an existing cluster and replicates its contents to the target cluster. Online migration is only available for MySQL, PostgreSQL, Caching, and Valkey clusters.
If the existing database is continuously being written to,  the migration process will continue for up to two weeks unless it is manually stopped. Online migration is only available for [MySQL](https://docs.digitalocean.com/products/databases/mysql/how-to/migrate/#:~:text=To%20migrate%20a%20MySQL%20database,then%20select%20Set%20Up%20Migration),  [PostgreSQL](https://docs.digitalocean.com/products/databases/postgresql/how-to/migrate/),  [Caching](https://docs.digitalocean.com/products/databases/redis/how-to/migrate/), and [Valkey](https://docs.digitalocean.com/products/databases/valkey/how-to/migrate/) clusters. 

### Parameters

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| `` | query | string | No |  |

### Example

```bash
curl -X PUT \
  -H "Authorization: Bearer $TOKEN" \
  "https://api.digitalocean.com/v2/databases/{database_cluster_uuid}/online-migration"
```

---

## DELETE /v2/databases/{database_cluster_uuid}/online-migration/{migration_id}

**Stop an Online Migration**

To stop an online migration, send a DELETE request to `/v2/databases/$DATABASE_ID/online-migration/$MIGRATION_ID`.

A status of 204 will be given. This indicates that the request was processed successfully, but that no response body is needed.


### Parameters

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| `` | query | string | No |  |
| `` | query | string | No |  |

### Example

```bash
curl -X DELETE \
  -H "Authorization: Bearer $TOKEN" \
  "https://api.digitalocean.com/v2/databases/{database_cluster_uuid}/online-migration/{migration_id}"
```

---

## PUT /v2/databases/{database_cluster_uuid}/migrate

**Migrate a Database Cluster to a New Region**

To migrate a database cluster to a new region, send a `PUT` request to
`/v2/databases/$DATABASE_ID/migrate`. The body of the request must specify a
`region` attribute.

A successful request will receive a 202 Accepted status code with no body in
response. Querying the database cluster will show that its `status` attribute
will now be set to `migrating`. This will transition back to `online` when the
migration has completed.


### Parameters

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| `` | query | string | No |  |

### Example

```bash
curl -X PUT \
  -H "Authorization: Bearer $TOKEN" \
  "https://api.digitalocean.com/v2/databases/{database_cluster_uuid}/migrate"
```

---

## PUT /v2/databases/{database_cluster_uuid}/resize

**Resize a Database Cluster**

To resize a database cluster, send a PUT request to `/v2/databases/$DATABASE_ID/resize`. The body of the request must specify both the size and num_nodes attributes.
A successful request will receive a 202 Accepted status code with no body in response. Querying the database cluster will show that its status attribute will now be set to resizing. This will transition back to online when the resize operation has completed.

### Parameters

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| `` | query | string | No |  |

### Example

```bash
curl -X PUT \
  -H "Authorization: Bearer $TOKEN" \
  "https://api.digitalocean.com/v2/databases/{database_cluster_uuid}/resize"
```

---

## GET /v2/databases/{database_cluster_uuid}/firewall

**List Firewall Rules (Trusted Sources) for a Database Cluster**

To list all of a database cluster's firewall rules (known as "trusted sources" in the control panel), send a GET request to `/v2/databases/$DATABASE_ID/firewall`.
The result will be a JSON object with a `rules` key.

### Parameters

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| `` | query | string | No |  |

### Example

```bash
curl -X GET \
  -H "Authorization: Bearer $TOKEN" \
  "https://api.digitalocean.com/v2/databases/{database_cluster_uuid}/firewall"
```

---

## PUT /v2/databases/{database_cluster_uuid}/firewall

**Update Firewall Rules (Trusted Sources) for a Database**

To update a database cluster's firewall rules (known as "trusted sources" in the control panel), send a PUT request to `/v2/databases/$DATABASE_ID/firewall` specifying which resources should be able to open connections to the database. You may limit connections to specific Droplets, Kubernetes clusters, or IP addresses. When a tag is provided, any Droplet or Kubernetes node with that tag applied to it will have access. The firewall is limited to 100 rules (or trusted sources). When possible, we recommend [placing your databases into a VPC network](https://docs.digitalocean.com/products/networking/vpc/) to limit access to them instead of using a firewall.
A successful

### Parameters

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| `` | query | string | No |  |

### Example

```bash
curl -X PUT \
  -H "Authorization: Bearer $TOKEN" \
  "https://api.digitalocean.com/v2/databases/{database_cluster_uuid}/firewall"
```

---

## PUT /v2/databases/{database_cluster_uuid}/maintenance

**Configure a Database Cluster's Maintenance Window**

To configure the window when automatic maintenance should be performed for a database cluster, send a PUT request to `/v2/databases/$DATABASE_ID/maintenance`.
A successful request will receive a 204 No Content status code with no body in response.

### Parameters

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| `` | query | string | No |  |

### Example

```bash
curl -X PUT \
  -H "Authorization: Bearer $TOKEN" \
  "https://api.digitalocean.com/v2/databases/{database_cluster_uuid}/maintenance"
```

---

## PUT /v2/databases/{database_cluster_uuid}/install_update

**Start Database Maintenance**

To start the installation of updates for a database cluster, send a PUT request to `/v2/databases/$DATABASE_ID/install_update`.
A successful request will receive a 204 No Content status code with no body in response.

### Parameters

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| `` | query | string | No |  |

### Example

```bash
curl -X PUT \
  -H "Authorization: Bearer $TOKEN" \
  "https://api.digitalocean.com/v2/databases/{database_cluster_uuid}/install_update"
```

---

## GET /v2/databases/{database_cluster_uuid}/backups

**List Backups for a Database Cluster**

To list all of the available backups of a PostgreSQL or MySQL database cluster, send a GET request to `/v2/databases/$DATABASE_ID/backups`.
**Note**: Backups are not supported for Caching or Valkey clusters.
The result will be a JSON object with a `backups key`. This will be set to an array of backup objects, each of which will contain the size of the backup and the timestamp at which it was created.

### Parameters

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| `` | query | string | No |  |

### Example

```bash
curl -X GET \
  -H "Authorization: Bearer $TOKEN" \
  "https://api.digitalocean.com/v2/databases/{database_cluster_uuid}/backups"
```

---

## GET /v2/databases/{database_cluster_uuid}/replicas

**List All Read-only Replicas**

To list all of the read-only replicas associated with a database cluster, send a GET request to `/v2/databases/$DATABASE_ID/replicas`.

**Note**: Read-only replicas are not supported for Caching or Valkey clusters.

The result will be a JSON object with a `replicas` key. This will be set to an array of database replica objects, each of which will contain the standard database replica attributes.

### Parameters

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| `` | query | string | No |  |

### Example

```bash
curl -X GET \
  -H "Authorization: Bearer $TOKEN" \
  "https://api.digitalocean.com/v2/databases/{database_cluster_uuid}/replicas"
```

---

## POST /v2/databases/{database_cluster_uuid}/replicas

**Create a Read-only Replica**

To create a read-only replica for a PostgreSQL or MySQL database cluster, send a POST request to `/v2/databases/$DATABASE_ID/replicas` specifying the name it should be given, the size of the node to be used, and the region where it will be located.

**Note**: Read-only replicas are not supported for Caching or Valkey clusters.

The response will be a JSON object with a key called `replica`. The value of this will be an object that contains the standard attributes associated with a database replica. The initial value of the read-only replica's `status` attribute will be `forking`. When the replica is ready to receive traffic, this will transition to `active`.

### Parameters

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| `` | query | string | No |  |

### Example

```bash
curl -X POST \
  -H "Authorization: Bearer $TOKEN" \
  "https://api.digitalocean.com/v2/databases/{database_cluster_uuid}/replicas"
```

---

## GET /v2/databases/{database_cluster_uuid}/events

**List all Events Logs**

To list all of the cluster events, send a GET request to
`/v2/databases/$DATABASE_ID/events`.

The result will be a JSON object with a `events` key.


### Parameters

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| `` | query | string | No |  |

### Example

```bash
curl -X GET \
  -H "Authorization: Bearer $TOKEN" \
  "https://api.digitalocean.com/v2/databases/{database_cluster_uuid}/events"
```

---

## GET /v2/databases/{database_cluster_uuid}/replicas/{replica_name}

**Retrieve an Existing Read-only Replica**

To show information about an existing database replica, send a GET request to `/v2/databases/$DATABASE_ID/replicas/$REPLICA_NAME`.

**Note**: Read-only replicas are not supported for Caching or Valkey clusters.

The response will be a JSON object with a `replica key`. This will be set to an object containing the standard database replica attributes.

### Parameters

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| `` | query | string | No |  |
| `` | query | string | No |  |

### Example

```bash
curl -X GET \
  -H "Authorization: Bearer $TOKEN" \
  "https://api.digitalocean.com/v2/databases/{database_cluster_uuid}/replicas/{replica_name}"
```

---

## DELETE /v2/databases/{database_cluster_uuid}/replicas/{replica_name}

**Destroy a Read-only Replica**

To destroy a specific read-only replica, send a DELETE request to `/v2/databases/$DATABASE_ID/replicas/$REPLICA_NAME`.

**Note**: Read-only replicas are not supported for Caching or Valkey clusters.

A status of 204 will be given. This indicates that the request was processed successfully, but that no response body is needed.

### Parameters

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| `` | query | string | No |  |
| `` | query | string | No |  |

### Example

```bash
curl -X DELETE \
  -H "Authorization: Bearer $TOKEN" \
  "https://api.digitalocean.com/v2/databases/{database_cluster_uuid}/replicas/{replica_name}"
```

---

## PUT /v2/databases/{database_cluster_uuid}/replicas/{replica_name}/promote

**Promote a Read-only Replica to become a Primary Cluster**

To promote a specific read-only replica, send a PUT request to `/v2/databases/$DATABASE_ID/replicas/$REPLICA_NAME/promote`.

**Note**: Read-only replicas are not supported for Caching or Valkey clusters.

A status of 204 will be given. This indicates that the request was processed successfully, but that no response body is needed.

### Parameters

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| `` | query | string | No |  |
| `` | query | string | No |  |

### Example

```bash
curl -X PUT \
  -H "Authorization: Bearer $TOKEN" \
  "https://api.digitalocean.com/v2/databases/{database_cluster_uuid}/replicas/{replica_name}/promote"
```

---

## GET /v2/databases/{database_cluster_uuid}/users

**List all Database Users**

To list all of the users for your database cluster, send a GET request to
`/v2/databases/$DATABASE_ID/users`.

Note: User management is not supported for Caching or Valkey clusters.

The result will be a JSON object with a `users` key. This will be set to an array
of database user objects, each of which will contain the standard database user attributes.
User passwords will not show without the `database:view_credentials` scope.

For MySQL clusters, additional options will be contained in the mysql_settings object.

For MongoDB clusters, additional information will be contained in the mongo_user_settings object


### Parameters

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| `` | query | string | No |  |

### Example

```bash
curl -X GET \
  -H "Authorization: Bearer $TOKEN" \
  "https://api.digitalocean.com/v2/databases/{database_cluster_uuid}/users"
```

---

## POST /v2/databases/{database_cluster_uuid}/users

**Add a Database User**

To add a new database user, send a POST request to `/v2/databases/$DATABASE_ID/users`
with the desired username.

Note: User management is not supported for Caching or Valkey clusters.

When adding a user to a MySQL cluster, additional options can be configured in the
`mysql_settings` object.

When adding a user to a Kafka cluster, additional options can be configured in
the `settings` object.

 When adding a user to a MongoDB cluster, additional options can be configured in
the `settings.mongo_user_settings` object.

The response will be a JSON object with a key called `user`. The value of this will be an
object that contains the standard attributes associated with a database user including
its randomly generated password.


### Parameters

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| `` | query | string | No |  |

### Example

```bash
curl -X POST \
  -H "Authorization: Bearer $TOKEN" \
  "https://api.digitalocean.com/v2/databases/{database_cluster_uuid}/users"
```

---

## GET /v2/databases/{database_cluster_uuid}/users/{username}

**Retrieve an Existing Database User**

To show information about an existing database user, send a GET request to
`/v2/databases/$DATABASE_ID/users/$USERNAME`.

Note: User management is not supported for Caching or Valkey clusters.

The response will be a JSON object with a `user` key. This will be set to an object
containing the standard database user attributes. The user's password will not show
up unless the `database:view_credentials` scope is present.

For MySQL clusters, additional options will be contained in the `mysql_settings`
object.

For Kafka clusters, additional options will be contained in the `settings` object.

For MongoDB clusters, additional information will be contained in the mongo_user_settings object


### Parameters

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| `` | query | string | No |  |
| `` | query | string | No |  |

### Example

```bash
curl -X GET \
  -H "Authorization: Bearer $TOKEN" \
  "https://api.digitalocean.com/v2/databases/{database_cluster_uuid}/users/{username}"
```

---

## DELETE /v2/databases/{database_cluster_uuid}/users/{username}

**Remove a Database User**

To remove a specific database user, send a DELETE request to
`/v2/databases/$DATABASE_ID/users/$USERNAME`.

A status of 204 will be given. This indicates that the request was processed
successfully, but that no response body is needed.

Note: User management is not supported for Caching or Valkey clusters.


### Parameters

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| `` | query | string | No |  |
| `` | query | string | No |  |

### Example

```bash
curl -X DELETE \
  -H "Authorization: Bearer $TOKEN" \
  "https://api.digitalocean.com/v2/databases/{database_cluster_uuid}/users/{username}"
```

---

## PUT /v2/databases/{database_cluster_uuid}/users/{username}

**Update a Database User**

To update an existing database user, send a PUT request to `/v2/databases/$DATABASE_ID/users/$USERNAME`
with the desired settings.

**Note**: only `settings` can be updated via this type of request. If you wish to change the name of a user,
you must recreate a new user.

The response will be a JSON object with a key called `user`. The value of this will be an
object that contains the name of the update database user, along with the `settings` object that
has been updated.


### Parameters

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| `` | query | string | No |  |
| `` | query | string | No |  |

### Example

```bash
curl -X PUT \
  -H "Authorization: Bearer $TOKEN" \
  "https://api.digitalocean.com/v2/databases/{database_cluster_uuid}/users/{username}"
```

---

## POST /v2/databases/{database_cluster_uuid}/users/{username}/reset_auth

**Reset a Database User's Password or Authentication Method**

To reset the password for a database user, send a POST request to
`/v2/databases/$DATABASE_ID/users/$USERNAME/reset_auth`.

For `mysql` databases, the authentication method can be specifying by
including a key in the JSON body called `mysql_settings` with the `auth_plugin`
value specified.

The response will be a JSON object with a `user` key. This will be set to an
object containing the standard database user attributes.


### Parameters

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| `` | query | string | No |  |
| `` | query | string | No |  |

### Example

```bash
curl -X POST \
  -H "Authorization: Bearer $TOKEN" \
  "https://api.digitalocean.com/v2/databases/{database_cluster_uuid}/users/{username}/reset_auth"
```

---

## GET /v2/databases/{database_cluster_uuid}/dbs

**List All Databases**

To list all of the databases in a clusters, send a GET request to
`/v2/databases/$DATABASE_ID/dbs`.

The result will be a JSON object with a `dbs` key. This will be set to an array
of database objects, each of which will contain the standard database attributes.

Note: Database management is not supported for Caching or Valkey clusters.


### Parameters

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| `` | query | string | No |  |

### Example

```bash
curl -X GET \
  -H "Authorization: Bearer $TOKEN" \
  "https://api.digitalocean.com/v2/databases/{database_cluster_uuid}/dbs"
```

---

## POST /v2/databases/{database_cluster_uuid}/dbs

**Add a New Database**

To add a new database to an existing cluster, send a POST request to
`/v2/databases/$DATABASE_ID/dbs`.

Note: Database management is not supported for Caching or Valkey clusters.

The response will be a JSON object with a key called `db`. The value of this will be
an object that contains the standard attributes associated with a database.


### Parameters

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| `` | query | string | No |  |

### Example

```bash
curl -X POST \
  -H "Authorization: Bearer $TOKEN" \
  "https://api.digitalocean.com/v2/databases/{database_cluster_uuid}/dbs"
```

---

## GET /v2/databases/{database_cluster_uuid}/dbs/{database_name}

**Retrieve an Existing Database**

To show information about an existing database cluster, send a GET request to
`/v2/databases/$DATABASE_ID/dbs/$DB_NAME`.

Note: Database management is not supported for Caching or Valkey clusters.

The response will be a JSON object with a `db` key. This will be set to an object
containing the standard database attributes.


### Parameters

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| `` | query | string | No |  |
| `` | query | string | No |  |

### Example

```bash
curl -X GET \
  -H "Authorization: Bearer $TOKEN" \
  "https://api.digitalocean.com/v2/databases/{database_cluster_uuid}/dbs/{database_name}"
```

---

## DELETE /v2/databases/{database_cluster_uuid}/dbs/{database_name}

**Delete a Database**

To delete a specific database, send a DELETE request to
`/v2/databases/$DATABASE_ID/dbs/$DB_NAME`.

A status of 204 will be given. This indicates that the request was processed
successfully, but that no response body is needed.

Note: Database management is not supported for Caching or Valkey clusters.


### Parameters

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| `` | query | string | No |  |
| `` | query | string | No |  |

### Example

```bash
curl -X DELETE \
  -H "Authorization: Bearer $TOKEN" \
  "https://api.digitalocean.com/v2/databases/{database_cluster_uuid}/dbs/{database_name}"
```

---

## GET /v2/databases/{database_cluster_uuid}/pools

**List Connection Pools (PostgreSQL)**

To list all of the connection pools available to a PostgreSQL database cluster, send a GET request to `/v2/databases/$DATABASE_ID/pools`.
The result will be a JSON object with a `pools` key. This will be set to an array of connection pool objects.

### Parameters

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| `` | query | string | No |  |

### Example

```bash
curl -X GET \
  -H "Authorization: Bearer $TOKEN" \
  "https://api.digitalocean.com/v2/databases/{database_cluster_uuid}/pools"
```

---

## POST /v2/databases/{database_cluster_uuid}/pools

**Add a New Connection Pool (PostgreSQL)**

For PostgreSQL database clusters, connection pools can be used to allow a
database to share its idle connections. The popular PostgreSQL connection
pooling utility PgBouncer is used to provide this service. [See here for more information](https://docs.digitalocean.com/products/databases/postgresql/how-to/manage-connection-pools/)
about how and why to use PgBouncer connection pooling including
details about the available transaction modes.

To add a new connection pool to a PostgreSQL database cluster, send a POST
request to `/v2/databases/$DATABASE_ID/pools` specifying a name for the pool,
the user to connect with, the database to connect to, as well as its desired
size and transaction mode.


### Parameters

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| `` | query | string | No |  |

### Example

```bash
curl -X POST \
  -H "Authorization: Bearer $TOKEN" \
  "https://api.digitalocean.com/v2/databases/{database_cluster_uuid}/pools"
```

---

## GET /v2/databases/{database_cluster_uuid}/pools/{pool_name}

**Retrieve Existing Connection Pool (PostgreSQL)**

To show information about an existing connection pool for a PostgreSQL database cluster, send a GET request to `/v2/databases/$DATABASE_ID/pools/$POOL_NAME`.
The response will be a JSON object with a `pool` key.

### Parameters

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| `` | query | string | No |  |
| `` | query | string | No |  |

### Example

```bash
curl -X GET \
  -H "Authorization: Bearer $TOKEN" \
  "https://api.digitalocean.com/v2/databases/{database_cluster_uuid}/pools/{pool_name}"
```

---

## PUT /v2/databases/{database_cluster_uuid}/pools/{pool_name}

**Update Connection Pools (PostgreSQL)**

To update a connection pool for a PostgreSQL database cluster, send a PUT request to  `/v2/databases/$DATABASE_ID/pools/$POOL_NAME`.

### Parameters

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| `` | query | string | No |  |
| `` | query | string | No |  |

### Example

```bash
curl -X PUT \
  -H "Authorization: Bearer $TOKEN" \
  "https://api.digitalocean.com/v2/databases/{database_cluster_uuid}/pools/{pool_name}"
```

---

## DELETE /v2/databases/{database_cluster_uuid}/pools/{pool_name}

**Delete a Connection Pool (PostgreSQL)**

To delete a specific connection pool for a PostgreSQL database cluster, send
a DELETE request to `/v2/databases/$DATABASE_ID/pools/$POOL_NAME`.

A status of 204 will be given. This indicates that the request was processed
successfully, but that no response body is needed.


### Parameters

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| `` | query | string | No |  |
| `` | query | string | No |  |

### Example

```bash
curl -X DELETE \
  -H "Authorization: Bearer $TOKEN" \
  "https://api.digitalocean.com/v2/databases/{database_cluster_uuid}/pools/{pool_name}"
```

---

## GET /v2/databases/{database_cluster_uuid}/eviction_policy

**Retrieve the Eviction Policy for a Caching or Valkey Cluster**

To retrieve the configured eviction policy for an existing Caching or Valkey cluster, send a GET request to `/v2/databases/$DATABASE_ID/eviction_policy`.
The response will be a JSON object with an `eviction_policy` key. This will be set to a string representing the eviction policy.

### Parameters

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| `` | query | string | No |  |

### Example

```bash
curl -X GET \
  -H "Authorization: Bearer $TOKEN" \
  "https://api.digitalocean.com/v2/databases/{database_cluster_uuid}/eviction_policy"
```

---

## PUT /v2/databases/{database_cluster_uuid}/eviction_policy

**Configure the Eviction Policy for a Caching or Valkey Cluster**

To configure an eviction policy for an existing Caching or Valkey cluster, send a PUT request to `/v2/databases/$DATABASE_ID/eviction_policy` specifying the desired policy.

### Parameters

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| `` | query | string | No |  |

### Example

```bash
curl -X PUT \
  -H "Authorization: Bearer $TOKEN" \
  "https://api.digitalocean.com/v2/databases/{database_cluster_uuid}/eviction_policy"
```

---

## GET /v2/databases/{database_cluster_uuid}/sql_mode

**Retrieve the SQL Modes for a MySQL Cluster**

To retrieve the configured SQL modes for an existing MySQL cluster, send a GET request to `/v2/databases/$DATABASE_ID/sql_mode`.
The response will be a JSON object with a `sql_mode` key. This will be set to a string representing the configured SQL modes.

### Parameters

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| `` | query | string | No |  |

### Example

```bash
curl -X GET \
  -H "Authorization: Bearer $TOKEN" \
  "https://api.digitalocean.com/v2/databases/{database_cluster_uuid}/sql_mode"
```

---

## PUT /v2/databases/{database_cluster_uuid}/sql_mode

**Update SQL Mode for a Cluster**

To configure the SQL modes for an existing MySQL cluster, send a PUT request to `/v2/databases/$DATABASE_ID/sql_mode` specifying the desired modes. See the official MySQL 8 documentation for a [full list of supported SQL modes](https://dev.mysql.com/doc/refman/8.0/en/sql-mode.html#sql-mode-full).
A successful request will receive a 204 No Content status code with no body in response.

### Parameters

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| `` | query | string | No |  |

### Example

```bash
curl -X PUT \
  -H "Authorization: Bearer $TOKEN" \
  "https://api.digitalocean.com/v2/databases/{database_cluster_uuid}/sql_mode"
```

---

## PUT /v2/databases/{database_cluster_uuid}/upgrade

**Upgrade Major Version for a Database**

To upgrade the major version of a database, send a PUT request to `/v2/databases/$DATABASE_ID/upgrade`, specifying the target version.
A successful request will receive a 204 No Content status code with no body in response.

### Parameters

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| `` | query | string | No |  |

### Example

```bash
curl -X PUT \
  -H "Authorization: Bearer $TOKEN" \
  "https://api.digitalocean.com/v2/databases/{database_cluster_uuid}/upgrade"
```

---

## GET /v2/databases/{database_cluster_uuid}/autoscale

**Retrieve Autoscale Configuration for a Database Cluster**

To retrieve the autoscale configuration for an existing database cluster, send a GET request to `/v2/databases/$DATABASE_ID/autoscale`.
The response will be a JSON object with autoscaling configuration details.

### Parameters

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| `` | query | string | No |  |

### Example

```bash
curl -X GET \
  -H "Authorization: Bearer $TOKEN" \
  "https://api.digitalocean.com/v2/databases/{database_cluster_uuid}/autoscale"
```

---

## PUT /v2/databases/{database_cluster_uuid}/autoscale

**Configure Autoscale Settings for a Database Cluster**

To configure autoscale settings for an existing database cluster, send a PUT request to `/v2/databases/$DATABASE_ID/autoscale`, specifying the autoscale configuration.
A successful request will receive a 204 No Content status code with no body in response.

### Parameters

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| `` | query | string | No |  |

### Example

```bash
curl -X PUT \
  -H "Authorization: Bearer $TOKEN" \
  "https://api.digitalocean.com/v2/databases/{database_cluster_uuid}/autoscale"
```

---

## GET /v2/databases/{database_cluster_uuid}/topics

**List Topics for a Kafka Cluster**

To list all of a Kafka cluster's topics, send a GET request to
`/v2/databases/$DATABASE_ID/topics`.

The result will be a JSON object with a `topics` key.


### Parameters

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| `` | query | string | No |  |

### Example

```bash
curl -X GET \
  -H "Authorization: Bearer $TOKEN" \
  "https://api.digitalocean.com/v2/databases/{database_cluster_uuid}/topics"
```

---

## POST /v2/databases/{database_cluster_uuid}/topics

**Create Topic for a Kafka Cluster**

To create a topic attached to a Kafka cluster, send a POST request to
`/v2/databases/$DATABASE_ID/topics`.

The result will be a JSON object with a `topic` key.


### Parameters

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| `` | query | string | No |  |

### Example

```bash
curl -X POST \
  -H "Authorization: Bearer $TOKEN" \
  "https://api.digitalocean.com/v2/databases/{database_cluster_uuid}/topics"
```

---

## GET /v2/databases/{database_cluster_uuid}/topics/{topic_name}

**Get Topic for a Kafka Cluster**

To retrieve a given topic by name from the set of a Kafka cluster's topics,
send a GET request to `/v2/databases/$DATABASE_ID/topics/$TOPIC_NAME`.

The result will be a JSON object with a `topic` key.


### Parameters

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| `` | query | string | No |  |
| `` | query | string | No |  |

### Example

```bash
curl -X GET \
  -H "Authorization: Bearer $TOKEN" \
  "https://api.digitalocean.com/v2/databases/{database_cluster_uuid}/topics/{topic_name}"
```

---

## PUT /v2/databases/{database_cluster_uuid}/topics/{topic_name}

**Update Topic for a Kafka Cluster**

To update a topic attached to a Kafka cluster, send a PUT request to
`/v2/databases/$DATABASE_ID/topics/$TOPIC_NAME`.

The result will be a JSON object with a `topic` key.


### Parameters

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| `` | query | string | No |  |
| `` | query | string | No |  |

### Example

```bash
curl -X PUT \
  -H "Authorization: Bearer $TOKEN" \
  "https://api.digitalocean.com/v2/databases/{database_cluster_uuid}/topics/{topic_name}"
```

---

## DELETE /v2/databases/{database_cluster_uuid}/topics/{topic_name}

**Delete Topic for a Kafka Cluster**

To delete a single topic within a Kafka cluster, send a DELETE request
to `/v2/databases/$DATABASE_ID/topics/$TOPIC_NAME`.

A status of 204 will be given. This indicates that the request was
processed successfully, but that no response body is needed.


### Parameters

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| `` | query | string | No |  |
| `` | query | string | No |  |

### Example

```bash
curl -X DELETE \
  -H "Authorization: Bearer $TOKEN" \
  "https://api.digitalocean.com/v2/databases/{database_cluster_uuid}/topics/{topic_name}"
```

---

## GET /v2/databases/{database_cluster_uuid}/logsink

**List Logsinks for a Database Cluster
**

To list logsinks for a database cluster, send a GET request to
`/v2/databases/$DATABASE_ID/logsink`.


### Parameters

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| `` | query | string | No |  |

### Example

```bash
curl -X GET \
  -H "Authorization: Bearer $TOKEN" \
  "https://api.digitalocean.com/v2/databases/{database_cluster_uuid}/logsink"
```

---

## POST /v2/databases/{database_cluster_uuid}/logsink

**Create Logsink for a Database Cluster
**

To create logsink for a database cluster, send a POST request to
`/v2/databases/$DATABASE_ID/logsink`.


### Parameters

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| `` | query | string | No |  |

### Example

```bash
curl -X POST \
  -H "Authorization: Bearer $TOKEN" \
  "https://api.digitalocean.com/v2/databases/{database_cluster_uuid}/logsink"
```

---

## GET /v2/databases/{database_cluster_uuid}/logsink/{logsink_id}

**Get Logsink for a Database Cluster
**

To get a logsink for a database cluster, send a GET request to
`/v2/databases/$DATABASE_ID/logsink/$LOGSINK_ID`.


### Parameters

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| `` | query | string | No |  |
| `` | query | string | No |  |

### Example

```bash
curl -X GET \
  -H "Authorization: Bearer $TOKEN" \
  "https://api.digitalocean.com/v2/databases/{database_cluster_uuid}/logsink/{logsink_id}"
```

---

## PUT /v2/databases/{database_cluster_uuid}/logsink/{logsink_id}

**Update Logsink for a Database Cluster
**

To update a logsink for a database cluster, send a PUT request to
`/v2/databases/$DATABASE_ID/logsink/$LOGSINK_ID`.


### Parameters

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| `` | query | string | No |  |
| `` | query | string | No |  |

### Example

```bash
curl -X PUT \
  -H "Authorization: Bearer $TOKEN" \
  "https://api.digitalocean.com/v2/databases/{database_cluster_uuid}/logsink/{logsink_id}"
```

---

## DELETE /v2/databases/{database_cluster_uuid}/logsink/{logsink_id}

**Delete Logsink for a Database Cluster
**

To delete a logsink for a database cluster, send a DELETE request to
`/v2/databases/$DATABASE_ID/logsink/$LOGSINK_ID`.


### Parameters

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| `` | query | string | No |  |
| `` | query | string | No |  |

### Example

```bash
curl -X DELETE \
  -H "Authorization: Bearer $TOKEN" \
  "https://api.digitalocean.com/v2/databases/{database_cluster_uuid}/logsink/{logsink_id}"
```

---

## GET /v2/databases/{database_cluster_uuid}/schema-registry

**List Schemas for Kafka Cluster
**

To list all schemas for a Kafka cluster, send a GET request to
`/v2/databases/$DATABASE_ID/schema-registry`.


### Parameters

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| `` | query | string | No |  |

### Example

```bash
curl -X GET \
  -H "Authorization: Bearer $TOKEN" \
  "https://api.digitalocean.com/v2/databases/{database_cluster_uuid}/schema-registry"
```

---

## POST /v2/databases/{database_cluster_uuid}/schema-registry

**Create Schema Registry for Kafka Cluster
**

To create a Kafka schema for a database cluster, send a POST request to
`/v2/databases/$DATABASE_ID/schema-registry`.


### Parameters

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| `` | query | string | No |  |

### Example

```bash
curl -X POST \
  -H "Authorization: Bearer $TOKEN" \
  "https://api.digitalocean.com/v2/databases/{database_cluster_uuid}/schema-registry"
```

---

## GET /v2/databases/{database_cluster_uuid}/schema-registry/{subject_name}

**Get a Kafka Schema by Subject Name
**

To get a specific schema by subject name for a Kafka cluster, send a GET request to
`/v2/databases/$DATABASE_ID/schema-registry/$SUBJECT_NAME`.


### Parameters

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| `` | query | string | No |  |
| `` | query | string | No |  |

### Example

```bash
curl -X GET \
  -H "Authorization: Bearer $TOKEN" \
  "https://api.digitalocean.com/v2/databases/{database_cluster_uuid}/schema-registry/{subject_name}"
```

---

## DELETE /v2/databases/{database_cluster_uuid}/schema-registry/{subject_name}

**Delete a Kafka Schema by Subject Name
**

To delete a specific schema by subject name for a Kafka cluster, send a DELETE request to
`/v2/databases/$DATABASE_ID/schema-registry/$SUBJECT_NAME`.


### Parameters

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| `` | query | string | No |  |
| `` | query | string | No |  |

### Example

```bash
curl -X DELETE \
  -H "Authorization: Bearer $TOKEN" \
  "https://api.digitalocean.com/v2/databases/{database_cluster_uuid}/schema-registry/{subject_name}"
```

---

## GET /v2/databases/{database_cluster_uuid}/schema-registry/{subject_name}/versions/{version}

**Get Kafka Schema by Subject Version**

To get a specific schema by subject name for a Kafka cluster, send a GET request to
`/v2/databases/$DATABASE_ID/schema-registry/$SUBJECT_NAME/versions/$VERSION`.


### Parameters

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| `` | query | string | No |  |
| `` | query | string | No |  |
| `` | query | string | No |  |

### Example

```bash
curl -X GET \
  -H "Authorization: Bearer $TOKEN" \
  "https://api.digitalocean.com/v2/databases/{database_cluster_uuid}/schema-registry/{subject_name}/versions/{version}"
```

---

## GET /v2/databases/{database_cluster_uuid}/schema-registry/config

**Retrieve Schema Registry Configuration for a kafka Cluster**

To retrieve the Schema Registry configuration for a Kafka cluster, send a GET request to
`/v2/databases/$DATABASE_ID/schema-registry/config`.
The response is a JSON object with a `compatibility_level` key, which is set to an object
containing any database configuration parameters.


### Parameters

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| `` | query | string | No |  |

### Example

```bash
curl -X GET \
  -H "Authorization: Bearer $TOKEN" \
  "https://api.digitalocean.com/v2/databases/{database_cluster_uuid}/schema-registry/config"
```

---

## PUT /v2/databases/{database_cluster_uuid}/schema-registry/config

**Update Schema Registry Configuration for a kafka Cluster**

To update the Schema Registry configuration for a Kafka cluster, send a PUT request to
`/v2/databases/$DATABASE_ID/schema-registry/config`.
The response is a JSON object with a `compatibility_level` key, which is set to an object
containing any database configuration parameters.


### Parameters

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| `` | query | string | No |  |

### Example

```bash
curl -X PUT \
  -H "Authorization: Bearer $TOKEN" \
  "https://api.digitalocean.com/v2/databases/{database_cluster_uuid}/schema-registry/config"
```

---

## GET /v2/databases/{database_cluster_uuid}/schema-registry/config/{subject_name}

**Retrieve Schema Registry Configuration for a Subject of kafka Cluster**

To retrieve the Schema Registry configuration for a Subject of a Kafka cluster, send a GET request to
`/v2/databases/$DATABASE_ID/schema-registry/config/$SUBJECT_NAME`.
The response is a JSON object with a `compatibility_level` key, which is set to an object
containing any database configuration parameters.


### Parameters

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| `` | query | string | No |  |
| `` | query | string | No |  |

### Example

```bash
curl -X GET \
  -H "Authorization: Bearer $TOKEN" \
  "https://api.digitalocean.com/v2/databases/{database_cluster_uuid}/schema-registry/config/{subject_name}"
```

---

## PUT /v2/databases/{database_cluster_uuid}/schema-registry/config/{subject_name}

**Update Schema Registry Configuration for a Subject of kafka Cluster**

To update the Schema Registry configuration for a Subject of a Kafka cluster, send a PUT request to
`/v2/databases/$DATABASE_ID/schema-registry/config/$SUBJECT_NAME`.
The response is a JSON object with a `compatibility_level` key, which is set to an object
containing any database configuration parameters.


### Parameters

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| `` | query | string | No |  |
| `` | query | string | No |  |

### Example

```bash
curl -X PUT \
  -H "Authorization: Bearer $TOKEN" \
  "https://api.digitalocean.com/v2/databases/{database_cluster_uuid}/schema-registry/config/{subject_name}"
```

---

## GET /v2/databases/metrics/credentials

**Retrieve Database Clusters' Metrics Endpoint Credentials**

To show the credentials for all database clusters' metrics endpoints, send a GET request to `/v2/databases/metrics/credentials`. The result will be a JSON object with a `credentials` key.

### Example

```bash
curl -X GET \
  -H "Authorization: Bearer $TOKEN" \
  "https://api.digitalocean.com/v2/databases/metrics/credentials"
```

---

## PUT /v2/databases/metrics/credentials

**Update Database Clusters' Metrics Endpoint Credentials**

To update the credentials for all database clusters' metrics endpoints, send a PUT request to `/v2/databases/metrics/credentials`. A successful request will receive a 204 No Content status code  with no body in response.

### Example

```bash
curl -X PUT \
  -H "Authorization: Bearer $TOKEN" \
  "https://api.digitalocean.com/v2/databases/metrics/credentials"
```

---

## GET /v2/databases/{database_cluster_uuid}/indexes

**List Indexes for a OpenSearch Cluster**

To list all of a OpenSearch cluster's indexes, send a GET request to
`/v2/databases/$DATABASE_ID/indexes`.

The result will be a JSON object with a `indexes` key.


### Parameters

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| `` | query | string | No |  |

### Example

```bash
curl -X GET \
  -H "Authorization: Bearer $TOKEN" \
  "https://api.digitalocean.com/v2/databases/{database_cluster_uuid}/indexes"
```

---

## DELETE /v2/databases/{database_cluster_uuid}/indexes/{index_name}

**Delete Index for OpenSearch Cluster**

To delete a single index within OpenSearch cluster, send a DELETE request
to `/v2/databases/$DATABASE_ID/indexes/$INDEX_NAME`.

A status of 204 will be given. This indicates that the request was
processed successfully, but that no response body is needed.


### Parameters

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| `` | query | string | No |  |
| `` | query | string | No |  |

### Example

```bash
curl -X DELETE \
  -H "Authorization: Bearer $TOKEN" \
  "https://api.digitalocean.com/v2/databases/{database_cluster_uuid}/indexes/{index_name}"
```

---
