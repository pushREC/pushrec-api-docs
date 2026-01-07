---
source: https://developers.google.com/youtube/v3/docs/videos/insert
scraped: 2026-01-07
method: webfetch
api: youtube-data-v3
resource: videos
method_name: insert
---

# YouTube Data API v3 - Videos: Insert Method Documentation

## HTTP Request Format

```
POST https://www.googleapis.com/upload/youtube/v3/videos
```

## Authorization

This endpoint requires OAuth 2.0 authentication with one of these scopes:

- `https://www.googleapis.com/auth/youtube.upload`
- `https://www.googleapis.com/auth/youtube`
- `https://www.googleapis.com/auth/youtubepartner`
- `https://www.googleapis.com/auth/youtube.force-ssl`

## Quota Impact

A call to this method has a quota cost of **100 units**.

## Required Parameters

### `part` (string)

The part parameter identifies properties the write operation will set and properties included in the API response. Mutable parts include:

- `contentDetails`
- `fileDetails`
- `id`
- `liveStreamingDetails`
- `localizations`
- `paidProductPlacementDetails`
- `player`
- `processingDetails`
- `recordingDetails`
- `snippet`
- `statistics`
- `status`
- `suggestions`
- `topicDetails`

## Optional Query Parameters

### `notifySubscribers` (boolean)

Indicates whether YouTube should notify channel subscribers about the new video. Default: `True`. Set to `False` when uploading multiple videos to avoid excessive notifications.

### `onBehalfOfContentOwner` (string)

Reserved for YouTube content partners. Identifies a CMS user acting on behalf of a content owner for managing multiple channels.

### `onBehalfOfContentOwnerChannel` (string)

Required when using `onBehalfOfContentOwner`. Specifies the YouTube channel ID receiving the video upload.

## Request Body

Provide a video resource with settable properties:

**Snippet properties:**
- `snippet.title`
- `snippet.description`
- `snippet.tags[]`
- `snippet.categoryId`
- `snippet.defaultLanguage`

**Localization:**
- `localizations.(key)`
- `localizations.(key).title`
- `localizations.(key).description`

**Status properties:**
- `status.embeddable`
- `status.license`
- `status.privacyStatus`
- `status.publicStatsViewable`
- `status.publishAt`
- `status.selfDeclaredMadeForKids`
- `status.containsSyntheticMedia`

**Recording details:**
- `recordingDetails.recordingDate`

## Media Upload Requirements

- **Maximum file size:** 256GB
- **Accepted Media MIME types:** `video/*`, `application/octet-stream`

## Response

Returns a video resource containing the uploaded video's metadata and assigned ID.

## Code Examples

### Go Example

```go
package main

import (
	"flag"
	"fmt"
	"log"
	"os"
	"strings"
	"google.golang.org/api/youtube/v3"
)

var (
	filename    = flag.String("filename", "", "Name of video file to upload")
	title       = flag.String("title", "Test Title", "Video title")
	description = flag.String("description", "Test Description", "Video description")
	category    = flag.String("category", "22", "Video category")
	keywords    = flag.String("keywords", "", "Comma separated list of video keywords")
	privacy     = flag.String("privacy", "unlisted", "Video privacy status")
)

func main() {
	flag.Parse()

	if *filename == "" {
		log.Fatalf("You must provide a filename of a video file to upload")
	}

	client := getClient(youtube.YoutubeUploadScope)
	service, err := youtube.New(client)
	if err != nil {
		log.Fatalf("Error creating YouTube client: %v", err)
	}

	upload := &youtube.Video{
		Snippet: &youtube.VideoSnippet{
			Title:       *title,
			Description: *description,
			CategoryId:  *category,
		},
		Status: &youtube.VideoStatus{PrivacyStatus: *privacy},
	}

	if strings.Trim(*keywords, "") != "" {
		upload.Snippet.Tags = strings.Split(*keywords, ",")
	}

	call := service.Videos.Insert("snippet,status", upload)
	file, err := os.Open(*filename)
	defer file.Close()
	if err != nil {
		log.Fatalf("Error opening %v: %v", *filename, err)
	}

	response, err := call.Media(file).Do()
	handleError(err, "")
	fmt.Printf("Upload successful! Video ID: %v\n", response.Id)
}
```

### .NET Example

```csharp
using System;
using System.IO;
using System.Reflection;
using System.Threading;
using System.Threading.Tasks;
using Google.Apis.Auth.OAuth2;
using Google.Apis.Services;
using Google.Apis.Upload;
using Google.Apis.Util.Store;
using Google.Apis.YouTube.v3;
using Google.Apis.YouTube.v3.Data;

namespace Google.Apis.YouTube.Samples
{
  internal class UploadVideo
  {
    [STAThread]
    static void Main(string[] args)
    {
      Console.WriteLine("YouTube Data API: Upload Video");
      Console.WriteLine("==============================");

      try
      {
        new UploadVideo().Run().Wait();
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
            new[] { YouTubeService.Scope.YoutubeUpload },
            "user",
            CancellationToken.None
        );
      }

      var youtubeService = new YouTubeService(new BaseClientService.Initializer()
      {
        HttpClientInitializer = credential,
        ApplicationName = Assembly.GetExecutingAssembly().GetName().Name
      });

      var video = new Video();
      video.Snippet = new VideoSnippet();
      video.Snippet.Title = "Default Video Title";
      video.Snippet.Description = "Default Video Description";
      video.Snippet.Tags = new string[] { "tag1", "tag2" };
      video.Snippet.CategoryId = "22";
      video.Status = new VideoStatus();
      video.Status.PrivacyStatus = "unlisted";
      var filePath = @"REPLACE_ME.mp4";

      using (var fileStream = new FileStream(filePath, FileMode.Open))
      {
        var videosInsertRequest = youtubeService.Videos.Insert(video, "snippet,status", fileStream, "video/*");
        videosInsertRequest.ProgressChanged += videosInsertRequest_ProgressChanged;
        videosInsertRequest.ResponseReceived += videosInsertRequest_ResponseReceived;

        await videosInsertRequest.UploadAsync();
      }
    }

    void videosInsertRequest_ProgressChanged(Google.Apis.Upload.IUploadProgress progress)
    {
      switch (progress.Status)
      {
        case UploadStatus.Uploading:
          Console.WriteLine("{0} bytes sent.", progress.BytesSent);
          break;
        case UploadStatus.Failed:
          Console.WriteLine("An error prevented the upload from completing.\n{0}", progress.Exception);
          break;
      }
    }

    void videosInsertRequest_ResponseReceived(Video video)
    {
      Console.WriteLine("Video id '{0}' was successfully uploaded.", video.Id);
    }
  }
}
```

### Ruby Example

```ruby
#!/usr/bin/ruby

require 'rubygems'
gem 'google-api-client', '>0.7'
require 'google/api_client'
require 'google/api_client/client_secrets'
require 'google/api_client/auth/file_storage'
require 'google/api_client/auth/installed_app'
require 'trollop'

YOUTUBE_UPLOAD_SCOPE = 'https://www.googleapis.com/auth/youtube.upload'
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
      :scope => [YOUTUBE_UPLOAD_SCOPE]
    )
    client.authorization = flow.authorize(file_storage)
  else
    client.authorization = file_storage.authorization
  end

  return client, youtube
end

def main
  opts = Trollop::options do
    opt :file, 'Video file to upload', :type => String
    opt :title, 'Video title', :default => 'Test Title', :type => String
    opt :description, 'Video description', :default => 'Test Description', :type => String
    opt :category_id, 'Numeric video category', :default => 22, :type => :int
    opt :keywords, 'Video keywords, comma-separated', :default => '', :type => String
    opt :privacy_status, 'Video privacy status: public, private, or unlisted', :default => 'public', :type => String
  end

  if opts[:file].nil? or not File.file?(opts[:file])
    Trollop::die :file, 'does not exist'
  end

  client, youtube = get_authenticated_service

  begin
    body = {
      :snippet => {
        :title => opts[:title],
        :description => opts[:description],
        :tags => opts[:keywords].split(','),
        :categoryId => opts[:category_id],
      },
      :status => {
        :privacyStatus => opts[:privacy_status]
      }
    }

    videos_insert_response = client.execute!(
      :api_method => youtube.videos.insert,
      :body_object => body,
      :media => Google::APIClient::UploadIO.new(opts[:file], 'video/*'),
      :parameters => {
        :uploadType => 'resumable',
        :part => body.keys.join(',')
      }
    )

    videos_insert_response.resumable_upload.send_all(client)

    puts "Video id '#{videos_insert_response.data.id}' was successfully uploaded."
  rescue Google::APIClient::TransmissionError => e
    puts e.result.body
  end
end

main
```

## Error Codes

| Error Type | Error Detail | Description |
|-----------|--------------|-------------|
| 400 | `defaultLanguageNotSet` | Missing default language in localized video details |
| 400 | `invalidCategoryId` | Invalid category ID; use videoCategories.list for valid options |
| 400 | `invalidDescription` | Invalid video description metadata |
| 400 | `invalidFilename` | Invalid video filename in Slug header |
| 400 | `invalidPublishAt` | Invalid scheduled publishing time |
| 400 | `invalidRecordingDetails` | Invalid recording details object |
| 400 | `invalidTags` | Invalid video keywords |
| 400 | `invalidTitle` | Invalid or empty video title |
| 400 | `invalidVideoGameRating` | Invalid video game rating |
| 400 | `invalidVideoMetadata` | Invalid request metadata |
| 400 | `mediaBodyRequired` | Video content missing from request |
| 400 | `uploadLimitExceeded` | User has exceeded upload quota |
| 403 | `forbidden` | General permission denied |
| 403 | `forbiddenLicenseSetting` | Invalid license setting attempted |
| 403 | `forbiddenPrivacySetting` | Invalid privacy setting attempted |

## Important Notes

All videos uploaded via the videos.insert endpoint from unverified API projects created after 28 July 2020 will be restricted to private viewing mode.
