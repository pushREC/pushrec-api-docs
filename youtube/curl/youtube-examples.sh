#!/bin/bash
# YouTube Data API v3 - curl Examples
# Generated: 2026-01-07 16:55:17

# Configuration
BASE_URL="https://www.googleapis.com/youtube/v3"
API_TOKEN="${API_TOKEN:-your_token_here}"

# ============================================
# Endpoints
# ============================================

# --- ACTIVITIES ---

# Activities
curl -X GET \
  "$BASE_URL/activities"

# --- CAPTIONS ---

# Captions
curl -X GET \
  "$BASE_URL/captions"

# POST /captions
curl -X POST \
  -H "Content-Type: application/json" \
  -d '{}' \
  "$BASE_URL/captions"

# PUT /captions
curl -X PUT \
  -H "Content-Type: application/json" \
  -d '{}' \
  "$BASE_URL/captions"

# GET /captions/id
curl -X GET \
  "$BASE_URL/captions/id"

# DELETE /captions
curl -X DELETE \
  "$BASE_URL/captions"

# --- CHANNELBANNERS ---

# ChannelBanners
curl -X POST \
  -H "Content-Type: application/json" \
  -d '{}' \
  "$BASE_URL/channelBanners/insert"

# --- CHANNELSECTIONS ---

# ChannelSections
curl -X GET \
  "$BASE_URL/channelSections"

# POST /channelSections
curl -X POST \
  -H "Content-Type: application/json" \
  -d '{}' \
  "$BASE_URL/channelSections"

# PUT /channelSections
curl -X PUT \
  -H "Content-Type: application/json" \
  -d '{}' \
  "$BASE_URL/channelSections"

# DELETE /channelSections
curl -X DELETE \
  "$BASE_URL/channelSections"

# --- CHANNELS ---

# Channels
curl -X GET \
  "$BASE_URL/channels"

# PUT /channels
curl -X PUT \
  -H "Content-Type: application/json" \
  -d '{}' \
  "$BASE_URL/channels"

# --- COMMENTTHREADS ---

# CommentThreads
curl -X GET \
  "$BASE_URL/commentThreads"

# POST /commentThreads
curl -X POST \
  -H "Content-Type: application/json" \
  -d '{}' \
  "$BASE_URL/commentThreads"

# --- COMMENTS ---

# Comments
curl -X GET \
  "$BASE_URL/comments"

# POST /comments
curl -X POST \
  -H "Content-Type: application/json" \
  -d '{}' \
  "$BASE_URL/comments"

# PUT /comments
curl -X PUT \
  -H "Content-Type: application/json" \
  -d '{}' \
  "$BASE_URL/comments"

# POST /comments/setModerationStatus
curl -X POST \
  -H "Content-Type: application/json" \
  -d '{}' \
  "$BASE_URL/comments/setModerationStatus"

# DELETE /comments
curl -X DELETE \
  "$BASE_URL/comments"

# --- I18NLANGUAGES ---

# I18nLanguages
curl -X GET \
  "$BASE_URL/i18nLanguages"

# --- I18NREGIONS ---

# I18nRegions
curl -X GET \
  "$BASE_URL/i18nRegions"

# --- MEMBERS ---

# Members
curl -X GET \
  "$BASE_URL/members"

# --- MEMBERSHIPSLEVELS ---

# MembershipsLevels
curl -X GET \
  "$BASE_URL/membershipsLevels"

# --- PLAYLISTITEMS ---

# PlaylistItems
curl -X GET \
  "$BASE_URL/playlistItems"

# POST /playlistItems
curl -X POST \
  -H "Content-Type: application/json" \
  -d '{}' \
  "$BASE_URL/playlistItems"

# PUT /playlistItems
curl -X PUT \
  -H "Content-Type: application/json" \
  -d '{}' \
  "$BASE_URL/playlistItems"

# DELETE /playlistItems
curl -X DELETE \
  "$BASE_URL/playlistItems"

# --- PLAYLISTS ---

# Playlists
curl -X GET \
  "$BASE_URL/playlists"

# POST /playlists
curl -X POST \
  -H "Content-Type: application/json" \
  -d '{}' \
  "$BASE_URL/playlists"

# PUT /playlists
curl -X PUT \
  -H "Content-Type: application/json" \
  -d '{}' \
  "$BASE_URL/playlists"

# DELETE /playlists
curl -X DELETE \
  "$BASE_URL/playlists"

# --- SEARCH ---

# Search
curl -X GET \
  "$BASE_URL/search"

# --- SUBSCRIPTIONS ---

# Subscriptions
curl -X GET \
  "$BASE_URL/subscriptions"

# POST /subscriptions
curl -X POST \
  -H "Content-Type: application/json" \
  -d '{}' \
  "$BASE_URL/subscriptions"

# DELETE /subscriptions
curl -X DELETE \
  "$BASE_URL/subscriptions"

# --- THUMBNAILS ---

# Thumbnails
curl -X POST \
  -H "Content-Type: application/json" \
  -d '{}' \
  "$BASE_URL/thumbnails/set"

# --- TOKEN ---

# Token Refresh
curl -X POST \
  -H "Content-Type: application/json" \
  -d '{}' \
  "$BASE_URL/token"

# --- UPLOAD ---

# 3. Upload Videos
curl -X POST \
  -H "Content-Type: application/json" \
  -d '{}' \
  "$BASE_URL/upload/youtube/v3/videos"

# 6. Upload Custom Thumbnail
curl -X POST \
  -H "Content-Type: application/json" \
  -d '{}' \
  "$BASE_URL/upload/youtube/v3/thumbnails/set"

# 3. Upload Videos
curl -X POST \
  -H "Content-Type: application/json" \
  -d '{}' \
  "$BASE_URL/upload/youtube/v3/videos?"

# 6. Upload Custom Thumbnail
curl -X POST \
  -H "Content-Type: application/json" \
  -d '{}' \
  "$BASE_URL/upload/youtube/v3/thumbnails/set?videoId=VIDEO_ID"

# Step 1: Initiate a Resumable Session
curl -X POST \
  -H "Content-Type: application/json" \
  -d '{}' \
  "$BASE_URL/upload/youtube/v3/videos?uploadType=resumable&part=snippet,status,contentDetails"

# Step 1: Initiate a Resumable Session
curl -X POST \
  -H "Content-Type: application/json" \
  -d '{}' \
  "$BASE_URL/upload/youtube/v3/videos?uploadType=resumable"

# Playlist Images
curl -X POST \
  -H "Content-Type: application/json" \
  -d '{}' \
  "$BASE_URL/upload/youtube/v3/playlistImages"

# Playlist Images
curl -X POST \
  -H "Content-Type: application/json" \
  -d '{}' \
  "$BASE_URL/upload/youtube/v3/playlistImages?playlistId=PLAYLIST_ID"

# --- V1 ---

# POST /v1/jobs
curl -X POST \
  -H "Content-Type: application/json" \
  -d '{}' \
  "$BASE_URL/v1/jobs"

# GET /v1/jobs
curl -X GET \
  "$BASE_URL/v1/jobs"

# GET /v1/jobs/{jobId}
curl -X GET \
  "$BASE_URL/v1/jobs/${jobId}"

# DELETE /v1/jobs/{jobId}
curl -X DELETE \
  "$BASE_URL/v1/jobs/${jobId}"

# GET /v1/jobs/{jobId}/reports
curl -X GET \
  "$BASE_URL/v1/jobs/${jobId}/reports"

# GET /v1/jobs/{jobId}/reports/{reportId}
curl -X GET \
  "$BASE_URL/v1/jobs/${jobId}/reports/${reportId}"

# GET /v1/reportTypes
curl -X GET \
  "$BASE_URL/v1/reportTypes"

# --- V2 ---

# GET /v2/reports
curl -X GET \
  "$BASE_URL/v2/reports"

# --- VIDEOABUSEREPORTREASONS ---

# VideoAbuseReportReasons
curl -X GET \
  "$BASE_URL/videoAbuseReportReasons"

# --- VIDEOCATEGORIES ---

# VideoCategories
curl -X GET \
  "$BASE_URL/videoCategories"

# --- VIDEOS ---

# Videos
curl -X GET \
  "$BASE_URL/videos"

# POST /videos
curl -X POST \
  -H "Content-Type: application/json" \
  -d '{}' \
  "$BASE_URL/videos"

# PUT /videos
curl -X PUT \
  -H "Content-Type: application/json" \
  -d '{}' \
  "$BASE_URL/videos"

# DELETE /videos
curl -X DELETE \
  "$BASE_URL/videos"

# POST /videos/rate
curl -X POST \
  -H "Content-Type: application/json" \
  -d '{}' \
  "$BASE_URL/videos/rate"

# GET /videos/getRating
curl -X GET \
  "$BASE_URL/videos/getRating"

# POST /videos/reportAbuse
curl -X POST \
  -H "Content-Type: application/json" \
  -d '{}' \
  "$BASE_URL/videos/reportAbuse"

# --- WATERMARKS ---

# Watermarks
curl -X POST \
  -H "Content-Type: application/json" \
  -d '{}' \
  "$BASE_URL/watermarks/set"

# POST /watermarks/unset
curl -X POST \
  -H "Content-Type: application/json" \
  -d '{}' \
  "$BASE_URL/watermarks/unset"

# --- YOUTUBE ---

# GET /youtube/v3/videos
curl -X GET \
  "$BASE_URL/youtube/v3/videos"

# PUT /youtube/v3/videos
curl -X PUT \
  -H "Content-Type: application/json" \
  -d '{}' \
  "$BASE_URL/youtube/v3/videos"

# GET /youtube/v3/channels
curl -X GET \
  "$BASE_URL/youtube/v3/channels"

# GET /youtube/v3/videos?part=snippet&id=VIDEO_ID
curl -X GET \
  "$BASE_URL/youtube/v3/videos?part=snippet&id=VIDEO_ID"

# PUT /youtube/v3/videos?part=snippet
curl -X PUT \
  -H "Content-Type: application/json" \
  -d '{}' \
  "$BASE_URL/youtube/v3/videos?part=snippet"

# GET /youtube/v3/channels?part=snippet&mine=true
curl -X GET \
  "$BASE_URL/youtube/v3/channels?part=snippet&mine=true"

# Basic Pagination Pattern
curl -X GET \
  "$BASE_URL/youtube/v3/search"

# 1. Use Maximum Page Size
curl -X GET \
  "$BASE_URL/youtube/v3/search?maxResults=50&..."
