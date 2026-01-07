---
source: https://developers.google.com/youtube/v3/docs/search/list
scraped: 2026-01-07
api_provider: Google
discovery_tier: 3
verified: false
method: webfetch
---
 YouTube Data API v3 - Search.list Method Documentation

## Overview

The search.list method retrieves a collection of search results matching specified query parameters. By default, it identifies matching videos, channels, and playlists, though you can configure it to return specific resource types only.

## HTTP Request

```
GET https://www.googleapis.com/youtube/v3/search
```

## Quota Impact

**100 units per call**

## Required Parameters

### `part`
- **Type:** string
- **Description:** Comma-separated list of search resource properties for the API response. Must be set to `snippet`.

## Filter Parameters (0 or 1 allowed)

### `forContentOwner`
- **Type:** boolean
- **Authorization:** Required; YouTube content partners only
- **Description:** Restricts search to videos owned by the content owner in `onBehalfOfContentOwner` parameter. Requires: `onBehalfOfContentOwner` parameter, linked account, `type=video`, and excludes video-specific parameters like `videoDefinition`, `videoDuration`, `videoEmbeddable`, `videoLicense`, `videoPaidProductPlacement`, `videoSyndicated`, `videoType`.

### `forDeveloper`
- **Type:** boolean
- **Authorization:** Required
- **Description:** Restricts results to videos uploaded via the developer's application. API identifies developers using request authorization credentials. Videos automatically tagged with project number.

### `forMine`
- **Type:** boolean
- **Authorization:** Required
- **Description:** Restricts search to authenticated user's videos only. Requires `type=video` and excludes `videoDefinition`, `videoDimension`, `videoDuration`, `videoEmbeddable`, `videoLicense`, `videoPaidProductPlacement`, `videoSyndicated`, `videoType` parameters.

## Optional Parameters

### `channelId`
- **Type:** string
- **Description:** Limits response to resources created by specified channel. Maximum 500 video results when combined with `type=video` without `forContentOwner`, `forDeveloper`, or `forMine` filters.

### `channelType`
- **Type:** string
- **Acceptable values:** `any` (all channels), `show` (shows only)

### `eventType`
- **Type:** string
- **Requires:** `type=video`
- **Acceptable values:** `completed`, `live`, `upcoming`

### `location`
- **Type:** string
- **Format:** Latitude/longitude coordinates (e.g., `37.42307,-122.08427`)
- **Requires:** `locationRadius` parameter; `type=video`
- **Description:** Defines circular geographic area center point for location-based video search.

### `locationRadius`
- **Type:** string
- **Format:** Floating point with unit (m, km, ft, mi). Examples: `1500m`, `5km`, `10000ft`, `0.75mi`
- **Maximum:** 1000 kilometers
- **Requires:** `location` parameter

### `maxResults`
- **Type:** unsigned integer
- **Range:** 0-50
- **Default:** 5

### `onBehalfOfContentOwner`
- **Type:** string
- **Authorization:** Required; YouTube content partners only
- **Description:** Indicates authorization credentials identify a CMS user acting on behalf of specified content owner. Allows single authentication for multiple YouTube channels.

### `order`
- **Type:** string
- **Default:** `relevance`
- **Acceptable values:** `date`, `rating`, `relevance`, `title`, `videoCount`, `viewCount`

### `pageToken`
- **Type:** string
- **Description:** Identifies specific result page to retrieve. Use `nextPageToken` and `prevPageToken` from responses for pagination.

### `publishedAfter`
- **Type:** datetime
- **Format:** RFC 3339 (e.g., `1970-01-01T00:00:00Z`)

### `publishedBefore`
- **Type:** datetime
- **Format:** RFC 3339

### `q`
- **Type:** string
- **Description:** Search query term. Supports Boolean NOT (`-`) and OR (`|`) operators. Example: `boating|sailing -fishing`. Pipe character must be URL-escaped as `%7C`.

### `regionCode`
- **Type:** string
- **Format:** ISO 3166-1 alpha-2 country code
- **Default:** US

### `relevanceLanguage`
- **Type:** string
- **Format:** ISO 639-1 two-letter code (use `zh-Hans` for simplified Chinese, `zh-Hant` for traditional)
- **Note:** Results in other languages included if highly relevant.

### `safeSearch`
- **Type:** string
- **Default:** `moderate`
- **Acceptable values:** `moderate` (filters restricted content), `none` (no filtering), `strict` (excludes restricted content)

### `topicId`
- **Type:** string
- **Description:** Limits response to resources associated with specified Freebase topic ID. Supports curated topic set only (as of February 27, 2017).

**Supported Topics Include:**

**Music:** Music (parent), Christian, Classical, Country, Electronic, Hip hop, Independent, Jazz, Asian, Latin American, Pop, Reggae, Rhythm & blues, Rock, Soul

**Gaming:** Gaming (parent), Action, Action-adventure, Casual, Music video game, Puzzle, Racing, Role-playing, Simulation, Sports, Strategy

**Sports:** Sports (parent), American football, Baseball, Basketball, Boxing, Cricket, Football, Golf, Ice hockey, Mixed martial arts, Motorsport, Tennis, Volleyball

**Entertainment:** Entertainment (parent), Humor, Movies, Performing arts, Professional wrestling, TV shows

**Lifestyle:** Lifestyle (parent), Fashion, Fitness, Food, Hobby, Pets, Physical attractiveness, Technology, Tourism, Vehicles

**Society:** Society (parent), Business, Health, Military, Politics, Religion

**Other:** Knowledge

### `type`
- **Type:** string
- **Default:** `video,channel,playlist`
- **Acceptable values:** `channel`, `playlist`, `video`

### `videoCaption`
- **Type:** string
- **Requires:** `type=video`
- **Acceptable values:** `any`, `closedCaption`, `none`

### `videoCategoryId`
- **Type:** string
- **Requires:** `type=video`
- **Description:** Filters results by video category.

### `videoDefinition`
- **Type:** string
- **Requires:** `type=video`
- **Acceptable values:** `any`, `high` (720p+), `standard`

### `videoDimension`
- **Type:** string
- **Default:** `any`
- **Requires:** `type=video`
- **Acceptable values:** `2d`, `3d`, `any`

### `videoDuration`
- **Type:** string
- **Default:** `any`
- **Requires:** `type=video`
- **Acceptable values:** `any`, `long` (20+ minutes), `medium` (4-20 minutes), `short` (under 4 minutes)

### `videoEmbeddable`
- **Type:** string
- **Requires:** `type=video`
- **Acceptable values:** `any`, `true`

### `videoLicense`
- **Type:** string
- **Requires:** `type=video`
- **Acceptable values:** `any`, `creativeCommon`, `youtube`

### `videoPaidProductPlacement`
- **Type:** string
- **Requires:** `type=video`
- **Acceptable values:** `any`, `true`

### `videoSyndicated`
- **Type:** string
- **Requires:** `type=video`
- **Acceptable values:** `any`, `true`

### `videoType`
- **Type:** string
- **Requires:** `type=video`
- **Acceptable values:** `any`, `episode`, `movie`

## Request Body

No request body required.

## Response Body Structure

```json
{
  "kind": "youtube#searchListResponse",
  "etag": "string",
  "nextPageToken": "string",
  "prevPageToken": "string",
  "regionCode": "string",
  "pageInfo": {
    "totalResults": "integer",
    "resultsPerPage": "integer"
  },
  "items": [
    {
      // search Resource objects
    }
  ]
}
```

### Response Properties

| Property | Type | Description |
|----------|------|-------------|
| `kind` | string | API resource type: `youtube#searchListResponse` |
| `etag` | etag | Resource ETag |
| `nextPageToken` | string | Token for retrieving next result page |
| `prevPageToken` | string | Token for retrieving previous result page |
| `regionCode` | string | Two-letter ISO country code used for search |
| `pageInfo.totalResults` | integer | Approximation of total results (max 1,000,000). Do not use for pagination links. |
| `pageInfo.resultsPerPage` | integer | Number of results in API response |
| `items[]` | list | Results matching search criteria |

## Code Examples

### Apps Script

```javascript
function searchByKeyword() {
  var results = YouTube.Search.list('id,snippet', {q: 'dogs', maxResults: 25});

  for(var i in results.items) {
    var item = results.items[i];
    Logger.log('[%s] Title: %s', item.id.videoId, item.snippet.title);
  }
}
```

### Go

```go
package main

import (
	"flag"
	"fmt"
	"log"
	"net/http"

	"google.golang.org/api/googleapi/transport"
	"google.golang.org/api/youtube/v3"
)

var (
	query      = flag.String("query", "Google", "Search term")
	maxResults = flag.Int64("max-results", 25, "Max YouTube results")
)

const developerKey = "YOUR DEVELOPER KEY"

func main() {
	flag.Parse()

	client := &http.Client{
		Transport: &transport.APIKey{Key: developerKey},
	}

	service, err := youtube.New(client)
	if err != nil {
		log.Fatalf("Error creating new YouTube client: %v", err)
	}

	call := service.Search.List("id,snippet").
		Q(*query).
		MaxResults(*maxResults)
	response, err := call.Do()
	handleError(err, "")

	videos := make(map[string]string)
	channels := make(map[string]string)
	playlists := make(map[string]string)

	for _, item := range response.Items {
		switch item.Id.Kind {
		case "youtube#video":
			videos[item.Id.VideoId] = item.Snippet.Title
		case "youtube#channel":
			channels[item.Id.ChannelId] = item.Snippet.Title
		case "youtube#playlist":
			playlists[item.Id.PlaylistId] = item.Snippet.Title
		}
	}

	printIDs("Videos", videos)
	printIDs("Channels", channels)
	printIDs("Playlists", playlists)
}

func printIDs(sectionName string, matches map[string]string) {
	fmt.Printf("%v:\n", sectionName)
	for id, title := range matches {
		fmt.Printf("[%v] %v\n", id, title)
	}
	fmt.Printf("\n\n")
}
```

### .NET

```csharp
using System;
using System.Collections.Generic;
using Google.Apis.Services;
using Google.Apis.YouTube.v3;

namespace Google.Apis.YouTube.Samples
{
  internal class Search
  {
    static void Main(string[] args)
    {
      Console.WriteLine("YouTube Data API: Search");
      Console.WriteLine("========================");

      try
      {
        new Search().Run().Wait();
      }
      catch (AggregateException ex)
      {
        foreach (var e in ex.InnerExceptions)
        {
          Console.WriteLine("Error: " + e.Message);
        }
      }

      Console.WriteLine("Press any key to continue...");
      Console.ReadKey();
    }

    private async Task Run()
    {
      var youtubeService = new YouTubeService(new BaseClientService.Initializer()
      {
        ApiKey = "REPLACE_ME",
        ApplicationName = this.GetType().ToString()
      });

      var searchListRequest = youtubeService.Search.List("snippet");
      searchListRequest.Q = "Google";
      searchListRequest.MaxResults = 50;

      var searchListResponse = await searchListRequest.ExecuteAsync();

      List<string> videos = new List<string>();
      List<string> channels = new List<string>();
      List<string> playlists = new List<string>();

      foreach (var searchResult in searchListResponse.Items)
      {
        switch (searchResult.Id.Kind)
        {
          case "youtube#video":
            videos.Add(String.Format("{0} ({1})", searchResult.Snippet.Title, searchResult.Id.VideoId));
            break;

          case "youtube#channel":
            channels.Add(String.Format("{0} ({1})", searchResult.Snippet.Title, searchResult.Id.ChannelId));
            break;

          case "youtube#playlist":
            playlists.Add(String.Format("{0} ({1})", searchResult.Snippet.Title, searchResult.Id.PlaylistId));
            break;
        }
      }

      Console.WriteLine(String.Format("Videos:\n{0}\n", string.Join("\n", videos)));
      Console.WriteLine(String.Format("Channels:\n{0}\n", string.Join("\n", channels)));
      Console.WriteLine(String.Format("Playlists:\n{0}\n", string.Join("\n", playlists)));
    }
  }
}
```

### Ruby

```ruby
#!/usr/bin/ruby

require 'rubygems'
gem 'google-api-client', '>0.7'
require 'google/api_client'
require 'trollop'

DEVELOPER_KEY = 'REPLACE_ME'
YOUTUBE_API_SERVICE_NAME = 'youtube'
YOUTUBE_API_VERSION = 'v3'

def get_service
  client = Google::APIClient.new(
    :key => DEVELOPER_KEY,
    :authorization => nil,
    :application_name => $PROGRAM_NAME,
    :application_version => '1.0.0'
  )
  youtube = client.discovered_api(YOUTUBE_API_SERVICE_NAME, YOUTUBE_API_VERSION)

  return client, youtube
end

def main
  opts = Trollop::options do
    opt :q, 'Search term', :type => String, :default => 'Google'
    opt :max_results, 'Max results', :type => :int, :default => 25
  end

  client, youtube = get_service

  begin
    search_response = client.execute!(
      :api_method => youtube.search.list,
      :parameters => {
        :part => 'snippet',
        :q => opts[:q],
        :maxResults => opts[:max_results]
      }
    )

    videos = []
    channels = []
    playlists = []

    search_response.data.items.each do |search_result|
      case search_result.id.kind
        when 'youtube#video'
          videos << "#{search_result.snippet.title} (#{search_result.id.videoId})"
        when 'youtube#channel'
          channels << "#{search_result.snippet.title} (#{search_result.id.channelId})"
        when 'youtube#playlist'
          playlists << "#{search_result.snippet.title} (#{search_result.id.playlistId})"
      end
    end

    puts "Videos:\n", videos, "\n"
    puts "Channels:\n", channels, "\n"
    puts "Playlists:\n", playlists, "\n"
  rescue Google::APIClient::TransmissionError => e
    puts e.result.body
  end
end

main
```

## Error Codes

| Error Type | Error Detail | Description |
|-----------|--------------|-------------|
| `badRequest (400)` | `invalidChannelId` | The channelId parameter specified an invalid channel ID. |
| `badRequest (400)` | `invalidLocation` | The location and/or locationRadius parameter was formatted incorrectly. |
| `badRequest (400)` | `invalidRelevanceLanguage` | The relevanceLanguage parameter was formatted incorrectly. |
| `badRequest (400)` | `invalidSearchFilter` | Request contains invalid combination of search filters. Type must be video when using forContentOwner or forMine. Type must be video when using eventType, videoCaption, videoCategoryId, videoDefinition, videoDimension, videoDuration, videoEmbeddable, videoLicense, videoSyndicated, or videoType. |

## Authorization

This method requires proper authorization. Content owner-specific parameters require YouTube content partner authentication.
