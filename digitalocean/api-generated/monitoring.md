---
created: 2026-01-08
tags: [type/api-reference, api/monitoring]
api_name: DigitalOcean API
category: Monitoring
endpoint_count: 61
---

# DigitalOcean API - Monitoring

[[README|Back to Overview]]

---

## GET /v2/monitoring/alerts

**List Alert Policies**

Returns all alert policies that are configured for the given account. To List all alert policies, send a GET request to `/v2/monitoring/alerts`.

### Parameters

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| `` | query | string | No |  |
| `` | query | string | No |  |

### Example

```bash
curl -X GET \
  -H "Authorization: Bearer $TOKEN" \
  "https://api.digitalocean.com/v2/monitoring/alerts"
```

---

## POST /v2/monitoring/alerts

**Create Alert Policy**

To create a new alert, send a POST request to `/v2/monitoring/alerts`.

### Example

```bash
curl -X POST \
  -H "Authorization: Bearer $TOKEN" \
  "https://api.digitalocean.com/v2/monitoring/alerts"
```

---

## GET /v2/monitoring/alerts/{alert_uuid}

**Retrieve an Existing Alert Policy**

To retrieve a given alert policy, send a GET request to `/v2/monitoring/alerts/{alert_uuid}`

### Parameters

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| `` | query | string | No |  |

### Example

```bash
curl -X GET \
  -H "Authorization: Bearer $TOKEN" \
  "https://api.digitalocean.com/v2/monitoring/alerts/{alert_uuid}"
```

---

## PUT /v2/monitoring/alerts/{alert_uuid}

**Update an Alert Policy**

To update en existing policy, send a PUT request to `v2/monitoring/alerts/{alert_uuid}`.

### Parameters

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| `` | query | string | No |  |

### Example

```bash
curl -X PUT \
  -H "Authorization: Bearer $TOKEN" \
  "https://api.digitalocean.com/v2/monitoring/alerts/{alert_uuid}"
```

---

## DELETE /v2/monitoring/alerts/{alert_uuid}

**Delete an Alert Policy**

To delete an alert policy, send a DELETE request to `/v2/monitoring/alerts/{alert_uuid}`

### Parameters

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| `` | query | string | No |  |

### Example

```bash
curl -X DELETE \
  -H "Authorization: Bearer $TOKEN" \
  "https://api.digitalocean.com/v2/monitoring/alerts/{alert_uuid}"
```

---

## GET /v2/monitoring/metrics/droplet/bandwidth

**Get Droplet Bandwidth Metrics**

To retrieve bandwidth metrics for a given Droplet, send a GET request to `/v2/monitoring/metrics/droplet/bandwidth`. Use the `interface` query parameter to specify if the results should be for the `private` or `public` interface. Use the `direction` query parameter to specify if the results should be for `inbound` or `outbound` traffic.
The metrics in the response body are in megabits per second (Mbps).

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
curl -X GET \
  -H "Authorization: Bearer $TOKEN" \
  "https://api.digitalocean.com/v2/monitoring/metrics/droplet/bandwidth"
```

---

## GET /v2/monitoring/metrics/droplet/cpu

**Get Droplet CPU Metrics**

To retrieve CPU metrics for a given droplet, send a GET request to `/v2/monitoring/metrics/droplet/cpu`.

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
  "https://api.digitalocean.com/v2/monitoring/metrics/droplet/cpu"
```

---

## GET /v2/monitoring/metrics/droplet/filesystem_free

**Get Droplet Filesystem Free Metrics**

To retrieve filesystem free metrics for a given droplet, send a GET request to `/v2/monitoring/metrics/droplet/filesystem_free`.

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
  "https://api.digitalocean.com/v2/monitoring/metrics/droplet/filesystem_free"
```

---

## GET /v2/monitoring/metrics/droplet/filesystem_size

**Get Droplet Filesystem Size Metrics**

To retrieve filesystem size metrics for a given droplet, send a GET request to `/v2/monitoring/metrics/droplet/filesystem_size`.

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
  "https://api.digitalocean.com/v2/monitoring/metrics/droplet/filesystem_size"
```

---

## GET /v2/monitoring/metrics/droplet/load_1

**Get Droplet Load1 Metrics**

To retrieve 1 minute load average metrics for a given droplet, send a GET request to `/v2/monitoring/metrics/droplet/load_1`.

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
  "https://api.digitalocean.com/v2/monitoring/metrics/droplet/load_1"
```

---

## GET /v2/monitoring/metrics/droplet/load_5

**Get Droplet Load5 Metrics**

To retrieve 5 minute load average metrics for a given droplet, send a GET request to `/v2/monitoring/metrics/droplet/load_5`.

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
  "https://api.digitalocean.com/v2/monitoring/metrics/droplet/load_5"
```

---

## GET /v2/monitoring/metrics/droplet/load_15

**Get Droplet Load15 Metrics**

To retrieve 15 minute load average metrics for a given droplet, send a GET request to `/v2/monitoring/metrics/droplet/load_15`.

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
  "https://api.digitalocean.com/v2/monitoring/metrics/droplet/load_15"
```

---

## GET /v2/monitoring/metrics/droplet/memory_cached

**Get Droplet Cached Memory Metrics**

To retrieve cached memory metrics for a given droplet, send a GET request to `/v2/monitoring/metrics/droplet/memory_cached`.

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
  "https://api.digitalocean.com/v2/monitoring/metrics/droplet/memory_cached"
```

---

## GET /v2/monitoring/metrics/droplet/memory_free

**Get Droplet Free Memory Metrics**

To retrieve free memory metrics for a given droplet, send a GET request to `/v2/monitoring/metrics/droplet/memory_free`.

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
  "https://api.digitalocean.com/v2/monitoring/metrics/droplet/memory_free"
```

---

## GET /v2/monitoring/metrics/droplet/memory_total

**Get Droplet Total Memory Metrics**

To retrieve total memory metrics for a given droplet, send a GET request to `/v2/monitoring/metrics/droplet/memory_total`.

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
  "https://api.digitalocean.com/v2/monitoring/metrics/droplet/memory_total"
```

---

## GET /v2/monitoring/metrics/droplet/memory_available

**Get Droplet Available Memory Metrics**

To retrieve available memory metrics for a given droplet, send a GET request to `/v2/monitoring/metrics/droplet/memory_available`.

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
  "https://api.digitalocean.com/v2/monitoring/metrics/droplet/memory_available"
```

---

## GET /v2/monitoring/metrics/apps/memory_percentage

**Get App Memory Percentage Metrics**

To retrieve memory percentage metrics for a given app, send a GET request to `/v2/monitoring/metrics/apps/memory_percentage`.

### Parameters

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| `` | query | string | No |  |
| `` | query | string | No |  |
| `` | query | string | No |  |
| `` | query | string | No |  |

### Example

```bash
curl -X GET \
  -H "Authorization: Bearer $TOKEN" \
  "https://api.digitalocean.com/v2/monitoring/metrics/apps/memory_percentage"
```

---

## GET /v2/monitoring/metrics/apps/cpu_percentage

**Get App CPU Percentage Metrics**

To retrieve cpu percentage metrics for a given app, send a GET request to `/v2/monitoring/metrics/apps/cpu_percentage`.

### Parameters

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| `` | query | string | No |  |
| `` | query | string | No |  |
| `` | query | string | No |  |
| `` | query | string | No |  |

### Example

```bash
curl -X GET \
  -H "Authorization: Bearer $TOKEN" \
  "https://api.digitalocean.com/v2/monitoring/metrics/apps/cpu_percentage"
```

---

## GET /v2/monitoring/metrics/apps/restart_count

**Get App Restart Count Metrics**

To retrieve restart count metrics for a given app, send a GET request to `/v2/monitoring/metrics/apps/restart_count`.

### Parameters

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| `` | query | string | No |  |
| `` | query | string | No |  |
| `` | query | string | No |  |
| `` | query | string | No |  |

### Example

```bash
curl -X GET \
  -H "Authorization: Bearer $TOKEN" \
  "https://api.digitalocean.com/v2/monitoring/metrics/apps/restart_count"
```

---

## GET /v2/monitoring/metrics/load_balancer/frontend_connections_current

**Get Load Balancer Frontend Total Current Active Connections Metrics**

To retrieve frontend total current active connections for a given load balancer, send a GET request to `/v2/monitoring/metrics/load_balancer/frontend_connections_current`.

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
  "https://api.digitalocean.com/v2/monitoring/metrics/load_balancer/frontend_connections_current"
```

---

## GET /v2/monitoring/metrics/load_balancer/frontend_connections_limit

**Get Load Balancer Frontend Max Connections Limit Metrics**

To retrieve frontend max connections limit for a given load balancer, send a GET request to `/v2/monitoring/metrics/load_balancer/frontend_connections_limit`.

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
  "https://api.digitalocean.com/v2/monitoring/metrics/load_balancer/frontend_connections_limit"
```

---

## GET /v2/monitoring/metrics/load_balancer/frontend_cpu_utilization

**Get Load Balancer Frontend Average Percentage CPU Utilization Metrics**

To retrieve frontend average percentage CPU utilization for a given load balancer, send a GET request to `/v2/monitoring/metrics/load_balancer/frontend_cpu_utilization`.

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
  "https://api.digitalocean.com/v2/monitoring/metrics/load_balancer/frontend_cpu_utilization"
```

---

## GET /v2/monitoring/metrics/load_balancer/frontend_firewall_dropped_bytes

**Get Load Balancer Frontend Firewall Dropped Bytes Metrics**

To retrieve firewall dropped bytes for a given load balancer, send a GET request to `/v2/monitoring/metrics/load_balancer/frontend_firewall_dropped_bytes`. This is currently only supported for network load balancers.

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
  "https://api.digitalocean.com/v2/monitoring/metrics/load_balancer/frontend_firewall_dropped_bytes"
```

---

## GET /v2/monitoring/metrics/load_balancer/frontend_firewall_dropped_packets

**Get Load Balancer Frontend Firewall Dropped Packets Metrics**

To retrieve firewall dropped packets per second for a given load balancer, send a GET request to `/v2/monitoring/metrics/load_balancer/frontend_firewall_dropped_packets`. This is currently only supported for network load balancers.

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
  "https://api.digitalocean.com/v2/monitoring/metrics/load_balancer/frontend_firewall_dropped_packets"
```

---

## GET /v2/monitoring/metrics/load_balancer/frontend_http_responses

**Get Load Balancer Frontend HTTP Rate Of Response Code Metrics**

To retrieve frontend HTTP rate of response code for a given load balancer, send a GET request to `/v2/monitoring/metrics/load_balancer/frontend_http_responses`.

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
  "https://api.digitalocean.com/v2/monitoring/metrics/load_balancer/frontend_http_responses"
```

---

## GET /v2/monitoring/metrics/load_balancer/frontend_http_requests_per_second

**Get Load Balancer Frontend HTTP Requests Metrics**

To retrieve frontend HTTP requests per second for a given load balancer, send a GET request to `/v2/monitoring/metrics/load_balancer/frontend_http_requests_per_second`.

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
  "https://api.digitalocean.com/v2/monitoring/metrics/load_balancer/frontend_http_requests_per_second"
```

---

## GET /v2/monitoring/metrics/load_balancer/frontend_network_throughput_http

**Get Load Balancer Frontend HTTP Throughput Metrics**

To retrieve frontend HTTP throughput in bytes per second for a given load balancer, send a GET request to `/v2/monitoring/metrics/load_balancer/frontend_network_throughput_http`.

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
  "https://api.digitalocean.com/v2/monitoring/metrics/load_balancer/frontend_network_throughput_http"
```

---

## GET /v2/monitoring/metrics/load_balancer/frontend_network_throughput_udp

**Get Load Balancer Frontend UDP Throughput Metrics**

To retrieve frontend UDP throughput in bytes per second for a given load balancer, send a GET request to `/v2/monitoring/metrics/load_balancer/frontend_network_throughput_udp`.

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
  "https://api.digitalocean.com/v2/monitoring/metrics/load_balancer/frontend_network_throughput_udp"
```

---

## GET /v2/monitoring/metrics/load_balancer/frontend_network_throughput_tcp

**Get Load Balancer Frontend TCP Throughput Metrics**

To retrieve frontend TCP throughput in bytes per second for a given load balancer, send a GET request to `/v2/monitoring/metrics/load_balancer/frontend_network_throughput_tcp`.

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
  "https://api.digitalocean.com/v2/monitoring/metrics/load_balancer/frontend_network_throughput_tcp"
```

---

## GET /v2/monitoring/metrics/load_balancer/frontend_nlb_tcp_network_throughput

**Get Network Load Balancer Frontend TCP Throughput Metrics**

To retrieve frontend TCP throughput in bytes per second for a given load balancer, send a GET request to `/v2/monitoring/metrics/load_balancer/frontend_nlb_tcp_network_throughput`.

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
  "https://api.digitalocean.com/v2/monitoring/metrics/load_balancer/frontend_nlb_tcp_network_throughput"
```

---

## GET /v2/monitoring/metrics/load_balancer/frontend_nlb_udp_network_throughput

**Get Network Load Balancer Frontend UDP Throughput Metrics**

To retrieve frontend UDP throughput in bytes per second for a given load balancer, send a GET request to `/v2/monitoring/metrics/load_balancer/frontend_nlb_udp_network_throughput`.

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
  "https://api.digitalocean.com/v2/monitoring/metrics/load_balancer/frontend_nlb_udp_network_throughput"
```

---

## GET /v2/monitoring/metrics/load_balancer/frontend_tls_connections_current

**Get Load Balancer Frontend Current TLS Connections Rate Metrics**

To retrieve frontend current TLS connections rate for a given load balancer, send a GET request to `/v2/monitoring/metrics/load_balancer/frontend_tls_connections_current`.

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
  "https://api.digitalocean.com/v2/monitoring/metrics/load_balancer/frontend_tls_connections_current"
```

---

## GET /v2/monitoring/metrics/load_balancer/frontend_tls_connections_limit

**Get Load Balancer Frontend Max TLS Connections Limit Metrics**

To retrieve frontend max TLS connections limit for a given load balancer, send a GET request to `/v2/monitoring/metrics/load_balancer/frontend_tls_connections_limit`.

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
  "https://api.digitalocean.com/v2/monitoring/metrics/load_balancer/frontend_tls_connections_limit"
```

---

## GET /v2/monitoring/metrics/load_balancer/frontend_tls_connections_exceeding_rate_limit

**Get Load Balancer Frontend Closed TLS Connections For Exceeded Rate Limit Metrics**

To retrieve frontend closed TLS connections for exceeded rate limit for a given load balancer, send a GET request to `/v2/monitoring/metrics/load_balancer/frontend_tls_connections_exceeding_rate_limit`.

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
  "https://api.digitalocean.com/v2/monitoring/metrics/load_balancer/frontend_tls_connections_exceeding_rate_limit"
```

---

## GET /v2/monitoring/metrics/load_balancer/droplets_http_session_duration_avg

**Get Load Balancer Droplets Average HTTP Session Duration Metrics**

To retrieve Droplets average HTTP session duration in seconds for a given load balancer, send a GET request to `/v2/monitoring/metrics/load_balancer/droplets_http_session_duration_avg`.

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
  "https://api.digitalocean.com/v2/monitoring/metrics/load_balancer/droplets_http_session_duration_avg"
```

---

## GET /v2/monitoring/metrics/load_balancer/droplets_http_session_duration_50p

**Get Load Balancer Droplets 50th Percentile HTTP Session Duration Metrics**

To retrieve Droplets 50th percentile HTTP session duration in seconds for a given load balancer, send a GET request to `/v2/monitoring/metrics/load_balancer/droplets_http_session_duration_50p`.

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
  "https://api.digitalocean.com/v2/monitoring/metrics/load_balancer/droplets_http_session_duration_50p"
```

---

## GET /v2/monitoring/metrics/load_balancer/droplets_http_session_duration_95p

**Get Load Balancer Droplets 95th Percentile HTTP Session Duration Metrics**

To retrieve Droplets 95th percentile HTTP session duration in seconds for a given load balancer, send a GET request to `/v2/monitoring/metrics/load_balancer/droplets_http_session_duration_95p`.

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
  "https://api.digitalocean.com/v2/monitoring/metrics/load_balancer/droplets_http_session_duration_95p"
```

---

## GET /v2/monitoring/metrics/load_balancer/droplets_http_response_time_avg

**Get Load Balancer Droplets Average HTTP Response Time Metrics**

To retrieve Droplets average HTTP response time in seconds for a given load balancer, send a GET request to `/v2/monitoring/metrics/load_balancer/droplets_http_response_time_avg`.

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
  "https://api.digitalocean.com/v2/monitoring/metrics/load_balancer/droplets_http_response_time_avg"
```

---

## GET /v2/monitoring/metrics/load_balancer/droplets_http_response_time_50p

**Get Load Balancer Droplets 50th Percentile HTTP Response Time Metrics**

To retrieve Droplets 50th percentile HTTP response time in seconds for a given load balancer, send a GET request to `/v2/monitoring/metrics/load_balancer/droplets_http_response_time_50p`.

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
  "https://api.digitalocean.com/v2/monitoring/metrics/load_balancer/droplets_http_response_time_50p"
```

---

## GET /v2/monitoring/metrics/load_balancer/droplets_http_response_time_95p

**Get Load Balancer Droplets 95th Percentile HTTP Response Time Metrics**

To retrieve Droplets 95th percentile HTTP response time in seconds for a given load balancer, send a GET request to `/v2/monitoring/metrics/load_balancer/droplets_http_response_time_95p`.

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
  "https://api.digitalocean.com/v2/monitoring/metrics/load_balancer/droplets_http_response_time_95p"
```

---

## GET /v2/monitoring/metrics/load_balancer/droplets_http_response_time_99p

**Get Load Balancer Droplets 99th Percentile HTTP Response Time Metrics**

To retrieve Droplets 99th percentile HTTP response time in seconds for a given load balancer, send a GET request to `/v2/monitoring/metrics/load_balancer/droplets_http_response_time_99p`.

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
  "https://api.digitalocean.com/v2/monitoring/metrics/load_balancer/droplets_http_response_time_99p"
```

---

## GET /v2/monitoring/metrics/load_balancer/droplets_queue_size

**Get Load Balancer Droplets Queue Size Metrics**

To retrieve Droplets queue size for a given load balancer, send a GET request to `/v2/monitoring/metrics/load_balancer/droplets_queue_size`.

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
  "https://api.digitalocean.com/v2/monitoring/metrics/load_balancer/droplets_queue_size"
```

---

## GET /v2/monitoring/metrics/load_balancer/droplets_http_responses

**Get Load Balancer Droplets HTTP Rate Of Response Code Metrics**

To retrieve Droplets HTTP rate of response code for a given load balancer, send a GET request to `/v2/monitoring/metrics/load_balancer/droplets_http_responses`.

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
  "https://api.digitalocean.com/v2/monitoring/metrics/load_balancer/droplets_http_responses"
```

---

## GET /v2/monitoring/metrics/load_balancer/droplets_connections

**Get Load Balancer Droplets Active Connections Metrics**

To retrieve Droplets active connections for a given load balancer, send a GET request to `/v2/monitoring/metrics/load_balancer/droplets_connections`.

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
  "https://api.digitalocean.com/v2/monitoring/metrics/load_balancer/droplets_connections"
```

---

## GET /v2/monitoring/metrics/load_balancer/droplets_health_checks

**Get Load Balancer Droplets Health Check Status Metrics**

To retrieve Droplets health check status for a given load balancer, send a GET request to `/v2/monitoring/metrics/load_balancer/droplets_health_checks`.

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
  "https://api.digitalocean.com/v2/monitoring/metrics/load_balancer/droplets_health_checks"
```

---

## GET /v2/monitoring/metrics/load_balancer/droplets_downtime

**Get Load Balancer Droplets Downtime Status Metrics**

To retrieve Droplets downtime status for a given load balancer, send a GET request to `/v2/monitoring/metrics/load_balancer/droplets_downtime`.

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
  "https://api.digitalocean.com/v2/monitoring/metrics/load_balancer/droplets_downtime"
```

---

## GET /v2/monitoring/metrics/droplet_autoscale/current_instances

**Get Droplet Autoscale Pool Current Size**

To retrieve the current size for a given Droplet Autoscale Pool, send a GET request to `/v2/monitoring/metrics/droplet_autoscale/current_instances`.

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
  "https://api.digitalocean.com/v2/monitoring/metrics/droplet_autoscale/current_instances"
```

---

## GET /v2/monitoring/metrics/droplet_autoscale/target_instances

**Get Droplet Autoscale Pool Target Size**

To retrieve the target size for a given Droplet Autoscale Pool, send a GET request to `/v2/monitoring/metrics/droplet_autoscale/target_instances`.

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
  "https://api.digitalocean.com/v2/monitoring/metrics/droplet_autoscale/target_instances"
```

---

## GET /v2/monitoring/metrics/droplet_autoscale/current_cpu_utilization

**Get Droplet Autoscale Pool Current Average CPU utilization**

To retrieve the current average CPU utilization for a given Droplet Autoscale Pool, send a GET request to `/v2/monitoring/metrics/droplet_autoscale/current_cpu_utilization`.

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
  "https://api.digitalocean.com/v2/monitoring/metrics/droplet_autoscale/current_cpu_utilization"
```

---

## GET /v2/monitoring/metrics/droplet_autoscale/target_cpu_utilization

**Get Droplet Autoscale Pool Target Average CPU utilization**

To retrieve the target average CPU utilization for a given Droplet Autoscale Pool, send a GET request to `/v2/monitoring/metrics/droplet_autoscale/target_cpu_utilization`.

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
  "https://api.digitalocean.com/v2/monitoring/metrics/droplet_autoscale/target_cpu_utilization"
```

---

## GET /v2/monitoring/metrics/droplet_autoscale/current_memory_utilization

**Get Droplet Autoscale Pool Current Average Memory utilization**

To retrieve the current average memory utilization for a given Droplet Autoscale Pool, send a GET request to `/v2/monitoring/metrics/droplet_autoscale/current_memory_utilization`.

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
  "https://api.digitalocean.com/v2/monitoring/metrics/droplet_autoscale/current_memory_utilization"
```

---

## GET /v2/monitoring/metrics/droplet_autoscale/target_memory_utilization

**Get Droplet Autoscale Pool Target Average Memory utilization**

To retrieve the target average memory utilization for a given Droplet Autoscale Pool, send a GET request to `/v2/monitoring/metrics/droplet_autoscale/target_memory_utilization`.

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
  "https://api.digitalocean.com/v2/monitoring/metrics/droplet_autoscale/target_memory_utilization"
```

---

## POST /v2/monitoring/sinks/destinations

**Create Logging Destination**

To create a new destination, send a POST request to `/v2/monitoring/sinks/destinations`.

### Example

```bash
curl -X POST \
  -H "Authorization: Bearer $TOKEN" \
  "https://api.digitalocean.com/v2/monitoring/sinks/destinations"
```

---

## GET /v2/monitoring/sinks/destinations

**List Logging Destinations**

To list all logging destinations, send a GET request to `/v2/monitoring/sinks/destinations`.

### Example

```bash
curl -X GET \
  -H "Authorization: Bearer $TOKEN" \
  "https://api.digitalocean.com/v2/monitoring/sinks/destinations"
```

---

## GET /v2/monitoring/sinks/destinations/{destination_uuid}

**Get Logging Destination**

To get the details of a destination, send a GET request to `/v2/monitoring/sinks/destinations/${destination_uuid}`.

### Parameters

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| `` | query | string | No |  |

### Example

```bash
curl -X GET \
  -H "Authorization: Bearer $TOKEN" \
  "https://api.digitalocean.com/v2/monitoring/sinks/destinations/{destination_uuid}"
```

---

## POST /v2/monitoring/sinks/destinations/{destination_uuid}

**Update Logging Destination**

To update the details of a destination, send a PATCH request to `/v2/monitoring/sinks/destinations/${destination_uuid}`.

### Parameters

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| `` | query | string | No |  |

### Example

```bash
curl -X POST \
  -H "Authorization: Bearer $TOKEN" \
  "https://api.digitalocean.com/v2/monitoring/sinks/destinations/{destination_uuid}"
```

---

## DELETE /v2/monitoring/sinks/destinations/{destination_uuid}

**Delete Logging Destination**

To delete a destination and all associated sinks, send a DELETE request to `/v2/monitoring/sinks/destinations/${destination_uuid}`.

### Parameters

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| `` | query | string | No |  |

### Example

```bash
curl -X DELETE \
  -H "Authorization: Bearer $TOKEN" \
  "https://api.digitalocean.com/v2/monitoring/sinks/destinations/{destination_uuid}"
```

---

## POST /v2/monitoring/sinks

**Create Sink**

To create a new sink, send a POST request to `/v2/monitoring/sinks`. Forwards logs from the 
resources identified in `resources` to the specified pre-existing destination.


### Example

```bash
curl -X POST \
  -H "Authorization: Bearer $TOKEN" \
  "https://api.digitalocean.com/v2/monitoring/sinks"
```

---

## GET /v2/monitoring/sinks

**Lists all sinks**

To list all sinks, send a GET request to `/v2/monitoring/sinks`.

### Parameters

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| `` | query | string | No |  |

### Example

```bash
curl -X GET \
  -H "Authorization: Bearer $TOKEN" \
  "https://api.digitalocean.com/v2/monitoring/sinks"
```

---

## GET /v2/monitoring/sinks/{sink_uuid}

**Get Sink**

To get the details of a sink (resources and destination), send a GET request to `/v2/monitoring/sinks/${sink_uuid}`.

### Parameters

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| `` | query | string | No |  |

### Example

```bash
curl -X GET \
  -H "Authorization: Bearer $TOKEN" \
  "https://api.digitalocean.com/v2/monitoring/sinks/{sink_uuid}"
```

---

## DELETE /v2/monitoring/sinks/{sink_uuid}

**Delete Sink**

To delete a sink, send a DELETE request to `/v2/monitoring/sinks/${sink_uuid}`.

### Parameters

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| `` | query | string | No |  |

### Example

```bash
curl -X DELETE \
  -H "Authorization: Bearer $TOKEN" \
  "https://api.digitalocean.com/v2/monitoring/sinks/{sink_uuid}"
```

---
