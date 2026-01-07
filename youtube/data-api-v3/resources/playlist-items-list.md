---
source: https://developers.google.com/youtube/v3/docs/playlistItems/list
scraped: 2026-01-07
method: webfetch
api: youtube-data-v3
resource: playlistItems
method_name: list
---

# YouTube Data API v3 - PlaylistItems: List Method Documentation

## Overview

The PlaylistItems: list method retrieves a collection of playlist items matching the API request criteria. This encompasses all playlist items in a specified playlist or specific items by unique IDs.

## HTTP Request Format

```
GET https://www.googleapis.com/youtube/v3/playlistItems
```

## Quota Impact

A call to this method has a quota cost of **1 unit**.

## Parameters

### Required Parameters

**`part`** (string)
- Specifies a comma-separated list of one or more playlistItem resource properties to include in the response
- Acceptable values: `contentDetails`, `id`, `snippet`, `status`
- Child properties are automatically included (e.g., `part=snippet` includes title, description, position, resourceId)

### Filter Parameters (Specify Exactly One)

**`id`** (string)
- Comma-separated list of unique playlist item IDs to retrieve

**`playlistId`** (string)
- Unique identifier of the playlist for retrieving its items
- Note: Either `id` or `playlistId` must be specified in every request

### Optional Parameters

**`maxResults`** (unsigned integer)
- Maximum items to return in result set
- Range: 0-50 (inclusive)
- Default: 5

**`onBehalfOfContentOwner`** (string)
- Indicates CMS user acting on behalf of specified content owner
- Authorized requests only; intended for YouTube content partners
- Allows single authentication for accessing multiple channel data

**`pageToken`** (string)
- Identifies specific result set page to retrieve
- Use `nextPageToken` or `prevPageToken` from API response to navigate pages

**`videoId`** (string)
- Filters results to return only playlist items containing the specified video

## Request Body

Do not provide a request body when calling this method.

## Response Body Structure

```json
{
  "kind": "youtube#playlistItemListResponse",
  "etag": "etag_value",
  "nextPageToken": "string",
  "prevPageToken": "string",
  "pageInfo": {
    "totalResults": "integer",
    "resultsPerPage": "integer"
  },
  "items": [
    {
      "playlistItem": "resource"
    }
  ]
}
```

### Response Properties

| Property | Type | Description |
|----------|------|-------------|
| `kind` | string | Always `youtube#playlistItemListResponse` |
| `etag` | etag | Resource entity tag |
| `nextPageToken` | string | Token for retrieving next results page |
| `prevPageToken` | string | Token for retrieving previous results page |
| `pageInfo.totalResults` | integer | Total results in complete set |
| `pageInfo.resultsPerPage` | integer | Results included in this response |
| `items[]` | list | Matching playlist items |

## Authorization Scopes

- `https://www.googleapis.com/auth/youtube.readonly` - Read-only access to authenticated user's account

## Code Examples

### Go

```go
package main

import (
	"fmt"
	"log"
	"google.golang.org/api/youtube/v3"
)

func playlistItemsList(service *youtube.Service, part string, playlistId string, pageToken string) *youtube.PlaylistItemListResponse {
	call := service.PlaylistItems.List(part)
	call = call.PlaylistId(playlistId)
	if pageToken != "" {
		call = call.PageToken(pageToken)
	}
	response, err := call.Do()
	handleError(err, "")
	return response
}

func channelsListMine(service *youtube.Service, part string) *youtube.ChannelListResponse {
	call := service.Channels.List(part)
	call = call.Mine(true)
	response, err := call.Do()
	handleError(err, "")
	return response
}

func main() {
	client := getClient(youtube.YoutubeReadonlyScope)
	service, err := youtube.New(client)

	if err != nil {
		log.Fatalf("Error creating YouTube client: %v", err)
	}

	response := channelsListMine(service, "contentDetails")

	for _, channel := range response.Items {
		playlistId := channel.ContentDetails.RelatedPlaylists.Uploads
		fmt.Printf("Videos in list %s\r\n", playlistId)

		nextPageToken := ""
		for {
			playlistResponse := playlistItemsList(service, "snippet", playlistId, nextPageToken)

			for _, playlistItem := range playlistResponse.Items {
				title := playlistItem.Snippet.Title
				videoId := playlistItem.Snippet.ResourceId.VideoId
				fmt.Printf("%v, (%v)\r\n", title, videoId)
			}

			nextPageToken = playlistResponse.NextPageToken
			if nextPageToken == "" {
				break
			}
			fmt.Println()
		}
	}
}
```

### .NET

```csharp
using System;
using System.IO;
using System.Threading;
using System.Threading.Tasks;
using Google.Apis.Auth.OAuth2;
using Google.Apis.Services;
using Google.Apis.Util.Store;
using Google.Apis.YouTube.v3;

namespace Google.Apis.YouTube.Samples
{
  internal class MyUploads
  {
    [STAThread]
    static void Main(string[] args)
    {
      Console.WriteLine("YouTube Data API: My Uploads");
      try
      {
        new MyUploads().Run().Wait();
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
      UserCredential credential;
      using (var stream = new FileStream("client_secrets.json", FileMode.Open, FileAccess.Read))
      {
        credential = await GoogleWebAuthorizationBroker.AuthorizeAsync(
            GoogleClientSecrets.Load(stream).Secrets,
            new[] { YouTubeService.Scope.YoutubeReadonly },
            "user",
            CancellationToken.None,
            new FileDataStore(this.GetType().ToString())
        );
      }

      var youtubeService = new YouTubeService(new BaseClientService.Initializer()
      {
        HttpClientInitializer = credential,
        ApplicationName = this.GetType().ToString()
      });

      var channelsListRequest = youtubeService.Channels.List("contentDetails");
      channelsListRequest.Mine = true;

      var channelsListResponse = await channelsListRequest.ExecuteAsync();

      foreach (var channel in channelsListResponse.Items)
      {
        var uploadsListId = channel.ContentDetails.RelatedPlaylists.Uploads;
        Console.WriteLine("Videos in list {0}", uploadsListId);

        var nextPageToken = "";
        while (nextPageToken != null)
        {
          var playlistItemsListRequest = youtubeService.PlaylistItems.List("snippet");
          playlistItemsListRequest.PlaylistId = uploadsListId;
          playlistItemsListRequest.MaxResults = 50;
          playlistItemsListRequest.PageToken = nextPageToken;

          var playlistItemsListResponse = await playlistItemsListRequest.ExecuteAsync();

          foreach (var playlistItem in playlistItemsListResponse.Items)
          {
            Console.WriteLine("{0} ({1})", playlistItem.Snippet.Title, playlistItem.Snippet.ResourceId.VideoId);
          }

          nextPageToken = playlistItemsListResponse.NextPageToken;
        }
      }
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
require 'google/api_client/client_secrets'
require 'google/api_client/auth/file_storage'
require 'google/api_client/auth/installed_app'

YOUTUBE_READONLY_SCOPE = 'https://www.googleapis.com/auth/youtube.readonly'
YOUTUBE_API_SERVICE_NAME = 'youtube'
YOUTUBE_API_VERSION = 'v3'

def get_authenticated_service
  client = Google::APIClient.new(
    :application_name => $PROGRAM_NAME,
    :application_version => '1.0.0'
  )
  youtube = client.discovered_api(YOUTUBE_API_SERVICE_NAME, YOUTUBE_API_VERSION)

  file_storage = Google::APIClient::FileStorage.new("#{$PROGRAM_NAME}-oauth2.json")
  if file_storage.authorization.nil?
    client_secrets = Google::APIClient::ClientSecrets.load
    flow = Google::APIClient::InstalledAppFlow.new(
      :client_id => client_secrets.client_id,
      :client_secret => client_secrets.client_secret,
      :scope => [YOUTUBE_READONLY_SCOPE]
    )
    client.authorization = flow.authorize(file_storage)
  else
    client.authorization = file_storage.authorization
  end

  return client, youtube
end

def main
  client, youtube = get_authenticated_service

  begin
    channels_response = client.execute!(
      :api_method => youtube.channels.list,
      :parameters => {
        :mine => true,
        :part => 'contentDetails'
      }
    )

    channels_response.data.items.each do |channel|
      uploads_list_id = channel['contentDetails']['relatedPlaylists']['uploads']

      next_page_token = ''
      until next_page_token.nil?
        playlistitems_response = client.execute!(
          :api_method => youtube.playlist_items.list,
          :parameters => {
            :playlistId => uploads_list_id,
            :part => 'snippet',
            :maxResults => 50,
            :pageToken => next_page_token
          }
        )

        puts "Videos in list #{uploads_list_id}"

        playlistitems_response.data.items.each do |playlist_item|
          title = playlist_item['snippet']['title']
          video_id = playlist_item['snippet']['resourceId']['videoId']
          puts "#{title} (#{video_id})"
        end

        next_page_token = playlistitems_response.next_page_token
      end

      puts
    end
  rescue Google::APIClient::TransmissionError => e
    puts e.result.body
  end
end

main
```

## Error Codes

| HTTP Status | Error Type | Error Detail | Description |
|------------|-----------|--------------|-------------|
| 403 | Forbidden | `playlistItemsNotAccessible` | Request lacks proper authorization for specified playlist |
| 403 | Forbidden | `watchHistoryNotAccessible` | Watch history retrieval prohibited via API |
| 403 | Forbidden | `watchLaterNotAccessible` | Watch later playlist items inaccessible via API |
| 404 | Not Found | `playlistNotFound` | Specified playlist identifier cannot be located |
| 404 | Not Found | `videoNotFound` | Specified video identifier cannot be located |
| 400 | Required | `playlistIdRequired` | Request missing required playlistId property |
| 400 | Invalid | `playlistOperationUnsupported` | API doesn't support listing videos in specified playlist |
