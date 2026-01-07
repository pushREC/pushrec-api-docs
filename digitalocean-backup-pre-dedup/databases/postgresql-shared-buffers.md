---
source: https://docs.digitalocean.com/products/databases/postgresql/concepts/shared-buffers/
scraped: 2026-01-07
api_provider: DigitalOcean
discovery_tier: 3
verified: false
---
ptimize Shared Buffers | DigitalOcean Documentation

*   [
    
    DigitalOcean | Docs](https://docs.digitalocean.com/)

*   

*   [Platform](https://docs.digitalocean.com/platform/)
*   [Products](https://docs.digitalocean.com/products/)
*   [Reference](https://docs.digitalocean.com/reference/)
*   [Support](https://docs.digitalocean.com/support/)
*   [Sign Up](https://cloud.digitalocean.com/registrations/new)

*   [![](/images/icons/postgresql.855c43f1f82e98a24a05998729b39a9937438c7f77af3dc0c22da5a5739f5eb7.svg)PostgreSQL](/products/databases/postgresql/)
*   [Getting Started](/products/databases/postgresql/getting-started/)
    *   [Quickstart](/products/databases/postgresql/getting-started/quickstart/)
*   [How-Tos](/products/databases/postgresql/how-to/)
    *   [Create PostgreSQL Clusters](/products/databases/postgresql/how-to/create/)
    *   [Connect to PostgreSQL Cluster](/products/databases/postgresql/how-to/connect/)
    *   [Resize Database Clusters](/products/databases/postgresql/how-to/resize/)
    *   [Import Databases](/products/databases/postgresql/how-to/import-databases/)
    *   [Secure PostgreSQL Clusters](/products/databases/postgresql/how-to/secure/)
    *   [Migrate External Databases](/products/databases/postgresql/how-to/migrate/)
    *   [Schedule Automatic Updates](/products/databases/postgresql/how-to/schedule-updates/)
    *   [Manage Users and Databases](/products/databases/postgresql/how-to/manage-users-and-databases/)
    *   [Modify User Privileges](/products/databases/postgresql/how-to/modify-user-privileges/)
    *   [Monitor PostgreSQL Performance](/products/databases/postgresql/how-to/monitor-databases/)
    *   [Add Standby Nodes](/products/databases/postgresql/how-to/add-standby-nodes/)
    *   [Add Read-Only Nodes](/products/databases/postgresql/how-to/add-read-only-nodes/)
    *   [Manage Connection Pools](/products/databases/postgresql/how-to/manage-connection-pools/)
    *   [Monitor Cluster Performance](/products/databases/postgresql/how-to/monitor-clusters/)
    *   [Set Up Monitoring Alerts](/products/databases/postgresql/how-to/set-up-alerts/)
    *   [Relocate Database Clusters](/products/databases/postgresql/how-to/relocate/)
    *   [Fork Database Clusters](/products/databases/postgresql/how-to/fork-clusters/)
    *   [Forward Logs](/products/databases/postgresql/how-to/forward-logs/)
    *   [Restore from Backups](/products/databases/postgresql/how-to/restore-from-backups/)
    *   [Destroy Database Clusters](/products/databases/postgresql/how-to/destroy/)
    *   [Tag Database Clusters](/products/databases/postgresql/how-to/tag/)
    *   [Upgrade PostgreSQL](/products/databases/postgresql/how-to/upgrade-version/)
    *   [Reconfigure Database Clusters](/products/databases/postgresql/how-to/reconfigure/)
*   [Reference](/products/databases/postgresql/reference/)
    *   [API Reference](https://docs.digitalocean.com/reference/api/digitalocean/#tag/Databases)
    *   [CLI Reference](/reference/doctl/reference/databases/)
    *   [MCP Reference](/reference/mcp/)
*   [Concepts](/products/databases/postgresql/concepts/)
    *   [Best Practices](/products/databases/postgresql/concepts/best-practices/)
    *   [Migration Strategies](/products/databases/postgresql/concepts/migration-strategies/)
    *   [Shared Buffers](/products/databases/postgresql/concepts/shared-buffers/)
    *   [Shared Responsibility Model](/products/databases/postgresql/concepts/responsibility-model/)
*   [Details](/products/databases/postgresql/details/)
    *   [Features](/products/databases/postgresql/details/features/)
    *   [Pricing](/products/databases/postgresql/details/pricing/)
    *   [Availability](/products/databases/postgresql/details/availability/)
    *   [Limits](/products/databases/postgresql/details/limits/)
    *   [Supported Extensions](/products/databases/postgresql/details/supported-extensions/)
    *   [Cluster Notifications](/products/databases/postgresql/details/notifications/)
    *   [Service-Level Agreement](https://www.digitalocean.com/sla/databases)
*   [Support](/products/databases/postgresql/support/)

*   [Concepts](/products/databases/postgresql/concepts/) 
*   Shared Buffers

[Give Feedback](https://ideas.digitalocean.com/documentation)

# Optimize Shared Buffers

Validated on 16 Jun 2025 • Last edited on 3 Dec 2025

PostgreSQL is an open source, object-relational database built for extensibility, data integrity, and speed. Its concurrency support makes it fully ACID-compliant, and it supports dynamic loading and catalog-driven operations to let users customize its data types, functions, and more.

In Managed PostgreSQL, you can set the `shared_buffers` parameter to determine the amount of memory allocated for disk page caching, which can increase performance and prevent locking. The cache preserves memory over multiple simultaneous sessions that may want to access the same blocks at the same time.

The `shared_buffers` parameter allocates memory on startup across all sessions and users. Its optimal setting depends on the database cluster’s available RAM, its working data set, and its workload.

## Recommendations for Shared Buffers[](#recommendations-for-shared-buffers)

For good performance on databases with 1 GB or more of RAM, we recommend setting `shared_buffers` to around 25% of the cluster’s memory. For databases with less than 1 GB of RAM, we recommend less than 25%.

Raising the value of `shared_buffers` does not always improve performance because the remaining free memory goes to queries and the filesystem cache. Setting the value to more than 40% of the cluster’s memory is unlikely to give better performance, with rare exceptions.

For best performance, aim for a `shared_buffers` cache hit rate between 97% and 99%. If the rate falls below 95%, your cluster may be affected by one of the following:

*   Too little data activity to generate accurate stats (new database).
*   `shared_buffers` set too low.
*   Working set too large to fit within the 60% maximum `shared_buffers_percentage`.

## Check Metrics[](#check-metrics)

Managed PostgreSQL automatically tracks access patterns, updates `shared_buffers` with frequently accessed data, and removes data based on the [least recently used (LRU) algorithm](https://en.wikipedia.org/wiki/Cache_replacement_policies#Least_Recently_Used_\(LRU\)) This is because, on average, around 20% of the data accounts for 80% of access reads.

### Check Shared Buffers[](#check-shared-buffers)

To check your current `shared_buffers` value, run the following command:

    SHOW shared_buffers;

## Check Cache Hit Rate[](#check-cache-hit-rate)

To check your current `shared_buffers` cache hit rate, run the following command:

    SELECT * FROM pg_statio_user_tables;

Which returns the following table which lists the different types of blocks hit and read:

    relid | schemaname | relname | heap_blks_read | heap_blks_hit | idx_blks_read | idx_blks_hit | toast_blks_read | toast_blks_hit | tidx_blks_read | tidx_blks_hit
    -------+------------+---------+----------------+---------------+---------------+--------------+-----------------+----------------+----------------+---------------
    16415 | public     | records |        1042770 |      88157826 |        184280 |     40282404 |               0 |              0 |              0 |             0
    (1 row)

Then, calculate the database cache hit rate with the following:

    SELECT
      sum(heap_blks_read) as heap_read,
      sum(heap_blks_hit)  as heap_hit,
      sum(heap_blks_hit) / (sum(heap_blks_hit) + sum(heap_blks_read)) as hit_ratio
    FROM
      pg_statio_user_tables;

Which returns the following table:

       heap_read | heap_hit |         ratio
      -----------+----------+------------------------
         6942770 | 88157826 | 0.9883098315
      (1 row)

To achieve an optimal performance, the working set needs to fit in `shared_buffers`. If the working set exceeds the size of `shared_buffers`, then Managed PostgreSQL can’t cache the excess content. While `shared_buffers_percentage` has a maximum value of 60%, exceeding a value of 40% suggests more RAM is required.

For more information on shared buffers, see [Resource Consumption](https://www.postgresql.org/docs/current/runtime-config-resource.html) in the PostgreSQL documentation.

### Buffer Cache Extension[](#buffer-cache-extension)

For a deeper examination into the contents of the `shared_buffers`, to see how your specific workload and objects are cached, enable the `pg_buffercache` extension:

    CREATE EXTENSION pg_buffercache;

Then, run the following query to view an organized table of how many database blocks from tables (`r`), indexes (`i`), sequences (`S`), and other objects are currently cached:

    SELECT c.relname, c.relkind
      , pg_size_pretty(count(*) * 8193) as buffered
      , round(100.0 * count(*) / ( SELECT setting FROM pg_settings WHERE name='shared_buffers')::integer,1) AS buffers_percent
      , round(100.0 * count(*) * 8192 / pg_relation_size(c.oid),1) AS percent_of_relation
    FROM pg_class c
    INNER JOIN pg_buffercache b ON b.relfilenode = c.relfilenode
    INNER JOIN pg_database d ON (b.reldatabase = d.oid AND d.datname = current_database())
    WHERE c.oid >= 16384
    AND pg_relation_size(c.oid) > 0
    GROUP BY c.oid, c.relname
    ORDER BY 3 DESC
    LIMIT 10;

Which returns the following table, where `relname` is the block, `relkind` is its source, and `buffered`, `buffers_percent`, and `percent_of_relation` describe how much storage its taking up:

     relname | relkind | buffered | buffers_percent | percent_of_relation
    ---------+---------+----------+-----------------+---------------------
     records | r       | 781 MB   |            99.7 |                27.2
     ...

Relations with object IDs (`oid`) values below 16,384 are reserved system objects.

You can also view queries’ cache hit performance by running the following `EXPLAIN` query:

    EXPLAIN (ANALYZE, BUFFERS, VERBOSE)
    SELECT * from records;

Which returns the following output:

                                                              QUERY PLAN
    --------------------------------------------------------------------------------------------------------------------------------
    Seq Scan on example.table  (cost=0.00..480095.20 rows=11207220 width=77) (actual time=0.158..16863.051 rows=11600000 loops=1)
      Output: id, "timestamp", data
      Buffers: shared hit=92345 read=275678 dirtied=10938
    Query Identifier: 2582883386000135492
    Planning:
      Buffers: shared hit=30 dirtied=2
    Planning Time: 1.081 ms
    Execution Time: 17467.342 ms
    (8 rows)

Using the `hit` and `read` numbers listed under `Buffers`, you can calculate the cache hit ratio using the formula `hit / (hit + read)`, which in this example shows that about 25% of this full table scan was in the `shared_buffers`.

## Manually Cache Data[](#manually-cache-data)

You may want to prepare `shared_buffers` in anticipation of a specific workload, such as a large analytical query set used for reporting. You can do this with the `pg_prewarm` extension:

    CREATE EXTENSION pg_prewarm;

After creation, call the `pg_prewarm` function and pass the name of the table of data you want to manually cache:

    SELECT * FROM pg_prewarm('example.table');

Which returns the following output:

    pg_prewarm
    ------------
         368023
    
     SELECT pg_size_pretty(pg_relation_size('example.table'));
     pg_size_pretty
     ----------------
     2875 MB

In this case, 368,023 pages have been read into the cache (or approximately 2,875 MB).

If the `shared_buffers` size is less than pre-loaded data, only the tailing end of the data is cached, as the earlier data encounters a forced ejection, terminating the session.

In this article...

*   [Recommendations for Shared Buffers](#recommendations-for-shared-buffers)
*   [Check Metrics](#check-metrics)
    *   [Check Shared Buffers](#check-shared-buffers)
*   [Check Cache Hit Rate](#check-cache-hit-rate)
    *   [Buffer Cache Extension](#buffer-cache-extension)
*   [Manually Cache Data](#manually-cache-data)

##### Company

*   [About](https://www.digitalocean.com/about)
*   [Careers](https://www.digitalocean.com/careers)
*   [Blog](https://www.digitalocean.com/blog)

##### Docs

*   [Docs Home](https://docs.digitalocean.com)
*   [API Reference](https://docs.digitalocean.com/reference/api)
*   [CLI Reference](https://docs.digitalocean.com/reference/doctl)
*   [Release Notes](https://docs.digitalocean.com/release-notes)
*   [Trust Platform](https://www.digitalocean.com/trust)

##### Community

*   [Tutorials](https://www.digitalocean.com/community/tutorials)
*   [Q&A](https://www.digitalocean.com/community/questions)
*   [Write for DOnations](https://www.digitalocean.com/community/pages/write-for-digitalocean)
*   [Currents Research](https://www.digitalocean.com/currents)
*   [Legal](https://www.digitalocean.com/legal)
*   [Code of Conduct](https://www.digitalocean.com/community/pages/code-of-conduct)

##### Support

*   [Support Center](/support)
*   [Report Abuse](https://www.digitalocean.com/company/contact/abuse)

* * *

© 2025 DigitalOcean, LLC. All rights reserved

[](https://x.com/digitalocean)[](https://www.instagram.com/thedigitalocean)[](https://www.facebook.com/DigitalOceanCloudHosting)[](https://discord.gg/digitalocean)[](https://www.youtube.com/DigitalOcean)[](https://www.linkedin.com/company/digitalocean)[](https://github.com/digitalocean)

### We can't find any results for your search.

Try using different keywords or simplifying your