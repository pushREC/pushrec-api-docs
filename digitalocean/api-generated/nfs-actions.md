---
created: 2026-01-08
tags: [type/api-reference, api/nfs-actions]
api_name: DigitalOcean API
category: NFS Actions
endpoint_count: 1
---

# DigitalOcean API - Nfs Actions

[[README|Back to Overview]]

---

## POST /v2/nfs/{nfs_id}/actions

**Initiate an NFS action**

To execute an action (such as resize) on a specified NFS share, 
send a POST request to `/v2/nfs/{nfs_id}/actions`. In the JSON body 
to the request, set the `type` attribute to on of the supported action types:

| Action                           | Details |
| -------------------------------- | ----------- |
| <nobr>`resize`</nobr>            | Resizes an NFS share. Set the size_gib attribute to a desired value in GiB |
| <nobr>`snapshot`</nobr>          | Takes a snapshot of an NFS share |
| <nobr>`attach`</nobr>            | Attaches an NFS share to a VPC. Set the vpc_id attribute to the desired VPC ID |
| <nobr>`detach`</nobr>            | Detaches an NFS share from a VPC. Set the vpc_id attribute to the desired VPC ID |


### Parameters

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| `` | query | string | No |  |

### Example

```bash
curl -X POST \
  -H "Authorization: Bearer $TOKEN" \
  "https://api.digitalocean.com/v2/nfs/{nfs_id}/actions"
```

---
