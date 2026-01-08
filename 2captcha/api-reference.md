---
source: https://2captcha.com/2captcha-api
scraped: 2026-01-08
method: webfetch
duration_ms: 85488
---

<!DOCTYPE html>
<html lang="en" >
  <head>
    <meta charset="UTF-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge" />
    <meta name="viewport" content="width=device-width, initial-scale=1" />
    <meta name="yandex-verification" content="301de5880a523d63" /><meta name="baidu-site-verification" content="codeva-pQYHEf9HaN" /><title data-rh="true">2Captcha API - Captcha solver API</title><meta data-rh="true" name="description" content="Fast API. Easy inegration. Code examples - PHP, Python, C++, Java, Go, Ruby. Human-powered recognition service, which main purpose is solving your tasks in a quick and accurate way by human employees. You can convert to text any image that a human can recognize"/><meta data-rh="true" name="keywords" content="API, captcha, 2Captcha, rates, solving, ERROR_NO_SLOT_AVAILABLE"/><link data-rh="true" rel="alternate" hrefLang="en" href="https://2captcha.com/2captcha-api"/><link data-rh="true" rel="alternate" hrefLang="ru" href="https://2captcha.com/ru/2captcha-api"/><link data-rh="true" rel="alternate" hrefLang="x-default" href="https://2captcha.com/2captcha-api"/><link data-rh="true" rel="canonical" href="https://2captcha.com/2captcha-api"/><script>
            window.initialGlobalState = {"globalApi":{"queries":{"getApiDocsArticle({\"params\":{\"hostname\":\"2captcha.com\",\"language\":\"en\",\"version\":\"v1\"},\"slug\":\"index\"})":{"status":"fulfilled","endpointName":"getApiDocsArticle","requestId":"NOkBS48d2FNTN3Xb1qF-p","originalArgs":{"slug":"index","params":{"language":"en","hostname":"2captcha.com","version":"v1"}},"startedTimeStamp":1767834512042,"data":{"slug":"index","content":"2Captcha is a human-powered image and CAPTCHA recognition service. 2Captcha's main purpose is solving your CAPTCHAs in a quick and accurate way by human employees, but the service is not limited only to CAPTCHA solving. You can convert to text any image that a human can recognize.\n\n\u003csection id=\"intro\">\n\n### Introduction\n\nWe provide an API that allows you to automate the process and integrate your software with our service.\n\nThere are few simple steps to solve your captcha or recognize the image:\n\n1.  Send your image or captcha to our server.\n2.  Get the ID of your task.\n3.  Start a cycle that checks if your task is completed.\n4.  Get the result.\n\u003c/section>\n\n\u003csection id=\"recent_changes\">\n\n### Recent Changes\n**December 2, 2025**\n\nAdded [Altcha Captcha](#altchacaptcha) support\n\n**August 12, 2025**\n\nAdded [Temu Captcha](#temucaptcha) support\n\n**July 17, 2025**\n\nAdded [VK Captcha](#vkcaptcha) support\n\n**April 28, 2025**\n\nAdded [CaptchaFox](#captchafox) support\n\n**December 12, 2024**\n\nAdded [Prosopo Procaptcha](#prosopo-procaptcha) support\n\n**April 22, 2024**\n\nAdded [Tencent captcha](#tencent) support\n\n**April 12, 2024**\n\nAdded [atbCAPTCHA](#atb-captcha) support\n\n**December 19, 2023**\n\nAdded [Friendly Captcha](#friendly-captcha) support\n\n**November 14, 2023**\n\nAdded [Cutcaptcha](#cutcaptcha) support\n\n**March 16, 2023**\n\nAdded [Audio](#audio) recognition method\n\n**January 27, 2023**\n\nAdded [Amazon WAF](#amazon-waf) support\n\n**December 7, 2022**\n\nAdded [Cloudflare Turnstile](#turnstile) support\n\n**October 13, 2022**\n\nTemporary removed [TikTok](#solving_tiktok) method\n\n**July 29, 2022**\n\nAdded [Lemin method](#lemin)\n\n**March 24, 2022**\n\nAdded [Geetest v4](#geetest-v4) support\n\n**July 6, 2021**\n\nAdded `recaptcha.net` domain support for reCAPTCHA\n\n**January 21, 2021**\n\nUpdated [reCAPTCHA Enterprise](#solving_recaptcha_enterprise) method\n\n**December 22, 2020**\n\nAdded [Demo](#demo) page\n\n**September 1, 2020**\n\nAdded [reCAPTCHA Enterprise method](#solving_recaptcha_enterprise)\n\n**July 27, 2020**\n\nAdded [TikTok method](#solving_tiktok)\n\n**June 1, 2020**\n\nAdded [Capy method](#solving_capy)\n\n**May 29, 2020**\n\nAdded support of data-s, cookies and userAgent for [reCAPTCHA V2](#solving_recaptchav2_new)\n\n**July 4, 2019**\n\nAdded `surl` parameter support for [FunCaptcha](#solving_funcaptcha_new)\n\n**June 18, 2019**\n\nAdded [pingback management](/setting/pingback) interface. [More info here](#manage_pingback)\n\n**May 31, 2019**\n\nReportGOOD method added and it is recommended to use it. [More info here](#complain)\n\n**February 11, 2019**\n\nAdded Geetest API. [More info here](#solving_geetest)\n\n**February 1, 2019**\n\nAdded debugging method. [More info here](#debugging)\n\n**December 19, 2018**\n\nAdded reCAPTCHA V3 method description. [More info here](#solving_recaptchav3)\n\n**September 21, 2018**\n\nUpdated pingback logic. Now you only need to register a domain/IP instead of full URL. [More info here](#pingback)\n\n**April 17, 2018**\n\nNew parameter added for extended language support [More info here](#language)\n\n**January 18, 2018**\n\nNew parameter added for invisible reCAPTCHA [More info here](#invisible)\n\n**January 17, 2018**\n\nNew method for FunCaptcha implemented! [More info here](#solving_funcaptcha_new)\n\n**December 12, 2017**\n\nAudioCaptcha method is now deprecated as non effective and unpolular method.\n\n**February 24, 2017**\n\nAdded some notes on Invisible reCAPTCHA solving. [More info here](#invisible).\n\n**November 24, 2016**\n\nWe've added new error codes to our API corresponding to requests limits. [More info here](#limits).\n\n**November 9, 2016**\n\nWe've added some new examples for reCAPTCHA V2 API check them out [here](#examples).\n\n**November 9, 2016**\n\nAt the moment reCAPTCHA V2 can be solved for any website. It's required to [send us the full URL of the page](#pageurl) where you get reCAPTCHA (it wasn't required before). [Sending the proxy information](#proxies) is not obligatory yet but it's recommended.\n\u003c/section>\n\n\u003csection id=\"rates\">\n\n### Our rates\n\nOur rates can be found on [Pricing](/pricing) page.\n\u003c/section>\n\n\u003csection id=\"demo\">\n\n### Demo page\n\nYou may visit this [Demo page](https://2captcha.com/demo) to learn examples of how you can bypass different captcha types using PHP, Java and Python.\n\u003c/section>\n\n\u003csection id=\"solving_captchas\">\n\n### Solving Captchas\n\nOur API is based on HTTP requests and supports both HTTP and HTTPS protocols.\n\nAPI endpoints:\n\n- `https://2captcha.com/in.php` is used to submit a captcha\n- `https://2captcha.com/res.php` is used to get the captcha solution\n\nThe process of solving captchas with 2Captcha is really easy and it's mostly the same for all types of captchas:\n\n1.  Get your API key from [your account settings page](https://2captcha.com/setting). Each user is given a unique authentication token, we call it _API key_. It's a 32-characters string that looks like:  \n    `1abc234de56fab7c89012d34e56fa7b8`  \n    This key will be used for all your requests to our server.\n2.  Submit a _HTTP POST_ request to our API URL: `https://2captcha.com/in.php` with parameters corresponding to the type of your captcha.  \n    Server will return captcha ID or an [error code](#error_handling) if something went wrong.\n3.  Make a timeout: 20 seconds for reCAPTCHA, 5 seconds for other types of captchas.\n4.  Submit a _HTTP GET_ request to our API URL: `https://2captcha.com/res.php` to get the result.  \n    If captcha is already solved server will return the answer in format corresponding to the type of your captcha.  \n    By default answers are returned as plain text like: _OK|Your answer_. But answer can also be returned as JSON _{\"status\":1,\"request\":\"TEXT\"}_ if _json_ parameter is used.  \n    If captcha is not solved yet server will return _CAPCHA_NOT_READY_ result. Repeat your request in 5 seconds.  \n    If something went wrong server will return an [error code](#error_handling).\n\u003c/section>\n\n\u003csection id=\"solving_normal_captcha\">\n\n#### Normal Captcha\n\n> Normal Captcha is an image that contains distored but human-readable text. To solve the captcha user have to type the text from the image.\n\nTo solve the captcha with our service you have to submit the image with _HTTP POST_ request to our API URL: `https://2captcha.com/in.php`  \nServer accepts images in _multipart_ or _base64_ format.\n\n**Multipart sample form**\n\n    \u003cform method=\"post\" action=\"https://2captcha.com/in.php\" enctype=\"multipart/form-data\">\n    \u003cinput type=\"hidden\" name=\"method\" value=\"post\">\n    Your key:\n    \u003cinput type=\"text\" name=\"key\" value=\"YOUR_APIKEY\">\n    The CAPTCHA file:\n    \u003cinput type=\"file\" name=\"file\">\n    \u003cinput type=\"submit\" value=\"Upload and get the ID\">\n    \u003c/form>\n\n_YOUR_APIKEY_ is [Your API key](#solving_captchas).\n\n**Base64 sample form**\n\n    \u003cform method=\"post\" action=\"https://2captcha.com/in.php\">\n    \u003cinput type=\"hidden\" name=\"method\" value=\"base64\">\n    Your key:\n    \u003cinput type=\"text\" name=\"key\" value=\"YOUR_APIKEY\">\n    The CAPTCHA file body in base64 format:\n    \u003ctextarea name=\"body\">BASE64_FILE\u003c/textarea>\n    \u003cinput type=\"submit\" value=\"Upload and get the ID\">\n    \u003c/form>\n\n_YOUR_APIKEY_ is [your API key](#solving_captchas).\n\n_BASE64_FILE_ is base64-encoded image body.\n\nYou can provide additional parameters with your request to define what kind of captcha you're sending and to help workers to solve your captcha correctly. You can find the full list of parameters in the [table below.](#normal_post)\n\nIf everything is fine server will return the ID of your captcha as plain text, like: _OK|2122988149_ or as JSON _{\"status\":1,\"request\":\"2122988149\"}_ if json parameter was used.\n\nIf something went wrong server will return an error. See [Error Handling](#error_handling) chapter for the list of errors.\n\nMake a 5 seconds timeout and submit a _HTTP GET_ request to our API URL: `https://2captcha.com/res.php` providing the captcha ID. The list of parameters is in the [table below](#normal_get).\n\nIf everything is fine and your captcha is solved server will return the answer as plain text, like: _OK|TEXT_ or as JSON _{\"status\":1,\"request\":\"TEXT\"}_ if _json_ parameter was used.\n\nOtherwise server will return _CAPCHA_NOT_READY_ that means that your captcha is not solved yet. Just repeat your request in 5 seconds.\n\nIf something went wrong server will return an error. See [Error Handling](#error_handling) chapter for the list of errors.\n\n**\u003cdiv id=\"normal_post\">List of _POST_ request parameters for https://2captcha.com/in.php\u003c/div>**\n\n| **POST parameter** | **Type**                                           | **Required** |**Description** |\n| ------------------ | -------------------------------------------------- | ------------ | -------------- |\n| key                | String                                             | Yes          | [your API key](#solving_captchas)                                                                                                                                                                         |\n| method             | String                                             | Yes          | post - defines that you're sending an image with multipart form \u003cbr>base64 - defines that you're sending a base64 encoded image                                                                           |\n| file               | File                                               | Yes\\*        | Captcha image file. \u003cbr>\\* \\- required if you submit image as a file (method=post)                                                                                                                        |\n| body               | String                                             | Yes\\*        | Base64-encoded captcha image \u003cbr>\\* \\- required if you submit image as Base64-encoded string (method=base64)                                                                                              |\n| phrase             | Integer \u003cbr>Default: 0                             | No           | 0 - captcha contains one word \u003cbr>1 - captcha contains two or more words                                                                                                                                  |\n| regsense           | Integer \u003cbr>Default: 0                             | No           | 0 - captcha in not case sensitive \u003cbr>1 - captcha is case sensitive                                                                                                                                       |\n| numeric            | Integer \u003cbr>Default: 0                             | No           | 0 - not specified \u003cbr>1 - captcha contains only numbers \u003cbr>2 - captcha contains only letters \u003cbr>3 - captcha contains only numbers OR only letters \u003cbr>4 - captcha MUST contain both numbers AND letters |\n| calc               | Integer \u003cbr>Default: 0                             | No           | 0 - not specified \u003cbr>1 - captcha requires calculation (e.g. type the result 4 + 8 = )                                                                                                                    |\n| min_len            | Integer \u003cbr>Default: 0                             | No           | 0 - not specified \u003cbr>1..20 - minimal number of symbols in captcha                                                                                                                                        |\n| max_len            | Integer \u003cbr>Default: 0                             | No           | 0 - not specified \u003cbr>1..20 - maximal number of symbols in captcha                                                                                                                                        |\n| language           | Integer \u003cbr>Default: 0                             | No           | 0 - not specified \u003cbr>1 - Cyrillic captcha \u003cbr>2 - Latin captcha                                                                                                                                          |\n| lang               | String                                             | No           | Language code. [See the list of supported languages.](#language)                                                                                                                                          |\n| textinstructions   | String \u003cbr>Max 140 characters \u003cbr>Endcoding: UTF-8 | No           | Text will be shown to worker to help him to solve the captcha correctly. \u003cbr>For example: type red symbols only.                                                                                          |\n| imginstructions    | Image \u003cbr>Max 400x150px, 100 kB                    | Yes          | Image with instruction for solving reCAPTCHA. \u003cbr>**Not required** if you're sending instruction as text with _textinstructions_.                                                                         |\n| header_acao        | Integer \u003cbr>Default: 0                             | No           | 0 - disabled \u003cbr>1 - enabled. \u003cbr>If enabled `in.php` will include _Access-Control-Allow-Origin:\\*_ header in the response. \u003cbr>Used for cross-domain AJAX requests in web applications.                  |\n| pingback           | String                                             | No           | URL for pingback (callback) response that will be sent when captcha is solved. \u003cbr>URL should be registered on the server. [More info here](#pingback).                                                   |\n| json               | Integer \u003cbr>Default: 0                             | No           | 0 - server will send the response as plain text \u003cbr>1 - tells the server to send the response as JSON                                                                                                     |\n| soft_id            | Integer                                            | No           | ID of software developer. Developers who integrated their software with 2Captcha get reward: 10% of spendings of their software users.                                                                    |\n\n**List of _GET_ request parameters for https://2captcha.com/res.php**\n\n| **GET parameter** | **Type**               | **Required** | **Description** |\n| ----------------- | ---------------------- | ------------ | --------------- |\n| key               | String                 | Yes          | [your API key](#solving_captchas)|\n| action            | String                 | Yes          | get - get the asnwer for your captcha |\n| id                | Integer                | Yes          | ID of captcha returned by in.php.|\n| json              | Integer \u003cbr>Default: 0 | No           | 0 - server will send the response as plain text \u003cbr>1 - tells the server to send the response as JSON                                                                                     |\n| header_acao       | Integer \u003cbr>Default: 0 | No           | 0 - disabled \u003cbr>1 - enabled. \u003cbr>If enabled `res.php` will include _Access-Control-Allow-Origin:\\*_ header in the response. \u003cbr>Used for cross-domain AJAX requests in web applications. |\n\n**Request URL example:**\n\n    https://2captcha.com/res.php?key=1abc234de56fab7c89012d34e56fa7b8&action=get&id=2122988149\n\n\u003c/section>\n\n\u003csection id=\"solving_text_captcha\">\n\n#### Text Captcha\n\n> Text Captcha is a type of captcha that is represented as text and doesn't contain images. Usually you have to answer a question to pass the verification.\n>\n> **For example:** \"If tomorrow is Saturday, what day is today?\".\n\nTo solve text captcha with our service you have to submit the text as a value of _textcaptcha_ parameter with _HTTP POST_ request to our API URL: `https://2captcha.com/in.php`\n\n**Sample form for Text Captcha**\n\n    \u003chtml>\n    \u003chead>\n    \u003cmeta http-equiv=\"Content-Type\" content=\"text/html; charset=UTF-8\">\n    \u003c/head>\n\n    \u003cbody>\n    \u003cform method=\"post\" action=\"https://2captcha.com/in.php\" enctype=\"multipart/form-data\" accept-charset=\"UTF-8\">\n    Your key:\n    \u003cinput type=\"text\" name=\"key\" value=\"YOUR_APIKEY\">\n    \u003cinput type=\"text\" name=\"textcaptcha\" value=\"If tomorrow is Saturday, what day is today?\">\n    \u003cinput type=\"submit\" value=\"Send and get the ID\">\n    \u003c/form>\n    \u003c/body>\n    \u003c/html>\n\n_YOUR_APIKEY_ is [your API key](#solving_captchas).\n\nYou can provide additional parameters with your request to tell us more about your captcha and to help workers to solve it correctly. You can find the full list of parameters in the [table below.](#text_post)\n\nIf everything is fine server will return the ID of your captcha as plain text, like: _OK|2122988149_ or as JSON _{\"status\":1,\"request\":\"2122988149\"}_ if json parameter was used.\n\nIf something went wrong server will return an error. See [Error Handling](#error_handling) chapter for the list of errors.\n\nMake a 5 seconds timeout and submit a _GET_ request to our API URL: `https://2captcha.com/res.php` providing the captcha ID. The list of parameters is in the [table below](#text_get).\n\nIf everything is fine and your captcha is solved server will return the answer as plain text, like: _OK|TEXT_ or as JSON _{\"status\":1,\"request\":\"TEXT\"}_ if _json_ parameter was used.\n\nOtherwise server will return _CAPCHA_NOT_READY_ that means that your captcha is not solved yet. Just repeat your request in 5 seconds.\n\nIf something went wrong server will return an error. See [Error Handling](#error_handling) chapter for the list of errors.\n\n**List of _POST_ request parameters for https://2captcha.com/in.php**\n\n| **POST parameter** | **Type**                                           | **Required** | **Description** |\n| ------------------ | -------------------------------------------------- | ------------ | --------------- |\n| key                | String                                             | Yes          | [your API key](#solving_captchas)|\n| language           | Integer \u003cbr>Default: 0                             | No           | 0 - not specified \u003cbr>1 - Cyrillic (Russian) captcha \u003cbr>2 - Latin captcha|\n| lang               | String                                             | No           | Language code. [See the list of supported languages.](#language)|\n| textcaptcha        | String \u003cbr>Max 140 characters \u003cbr>Endcoding: UTF-8 | No           | Text will be shown to worker to help him to solve the captcha correctly. \u003cbr>For example: type red symbols only.                                                                         |\n| header_acao        | Integer \u003cbr>Default: 0                             | No           | 0 - disabled \u003cbr>1 - enabled. \u003cbr>If enabled `in.php` will include _Access-Control-Allow-Origin:\\*_ header in the response. \u003cbr>Used for cross-domain AJAX requests in web applications. |\n| pingback           | String                                             | No           | URL for pingback (callback) response that will be sent when captcha is solved. \u003cbr>URL should be registered on the server. [More info here](#pingback).                                  |\n| json               | Integer \u003cbr>Default: 0                             | No           | 0 - server will send the response as plain text \u003cbr>1 - tells the server to send the response as JSON                                                                                    |\n| soft_id            | Integer                                            | No           | ID of software developer. Developers who integrated their software with 2Captcha get reward: 10% of spendings of their software users.                                                   |\n\n**List of _GET_ request parameters for https://2captcha.com/res.php**\n\n| **GET parameter** | **Type**               | **Required** | **Description** |\n| ----------------- | ---------------------- | ------------ | --------------- |\n| key               | String                 | Yes          | [your API key](#solving_captchas)                                                                                                                                                         |\n| action            | String                 | Yes          | get - get the asnwer for your captcha                                                                                                                                                     |\n| id                | Integer                | Yes          | ID of captcha returned by in.php.                                                                                                                                                         |\n| json              | Integer \u003cbr>Default: 0 | No           | 0 - server will send the response as plain text \u003cbr>1 - tells the server to send the response as JSON                                                                                     |\n| header_acao       | Integer \u003cbr>Default: 0 | No           | 0 - disabled \u003cbr>1 - enabled. \u003cbr>If enabled `res.php` will include _Access-Control-Allow-Origin:\\*_ header in the response. \u003cbr>Used for cross-domain AJAX requests in web applications. |\n\n**Request URL example:**\n\n    https://2captcha.com/res.php?key=1abc234de56fab7c89012d34e56fa7b8&action=get&id=2122988149\n\n\u003c/section>\n\n\u003csection id=\"solving_recaptchav2_new\">\n\n#### reCAPTCHA V2\n\n> reCAPTCHA V2 also known as I'm not a robot reCAPTCHA is a very popular type of captcha that looks like this:\n>\n> \u003cimg src=\"/assets/captcha-api-docs/img/recaptchav2.gif\" width=\"616\" height=\"164\" alt=\"reCAPTCHA V2\" loading=\"lazy\" />\n\nSolving reCAPTCHA V2 with our new method is pretty simple:\n\n1.  Look at the element's code at the page where you found reCAPTCHA.\n\n2. \u003cimg src=\"/assets/captcha-api-docs/img/inspectelement.png\" width=\"432\" height=\"356\" alt=\"Inspect reCAPTCHA V2 widget source code\" loading=\"lazy\" />\n\n3.  Find a link that begins with _www.google.com/recaptcha/api2/anchor_ or find _data-sitekey_ parameter.\n4.  Copy the value of _k_ parameter of the link (or value of _data-sitekey_ parameter).\n\n5. \u003cimg src=\"/assets/captcha-api-docs/img/sitekey_recaptcha.png\" width=\"738\" height=\"165\" alt=\"Find 'data-sitekey' parameter\" loading=\"lazy\" />\n\n6. Submit a _HTTP GET_ or _POST_ request to our API URL: `https://2captcha.com/in.php` with method set to _userrecaptcha_ and provide the value found on previous step as value for _googlekey_ and full page URL as value for _pageurl_. [Sending proxies](#proxies) is not obligatory ar the moment but it's recommended.  \n You can find the full list of parameters in the [table below.](#recaptchav2new_post)\n\n    **Request URL example:**\n    ```\n    https://2captcha.com/in.php?key=1abc234de56fab7c89012d34e56fa7b8&method=userrecaptcha&googlekey=6Le-wvkSVVABCPBMRTvw0Q4Muexq1bi0DJwx_mJ-&pageurl=http://mysite.com/page/with/recaptcha\n    ```\n\n7.  If everything is fine server will return the ID of your captcha as plain text, like: _OK|2122988149_ or as JSON _{\"status\":1,\"request\":\"2122988149\"}_ if _json_ parameter was used.  \n    Otherwise server will return an [error code](#error_handling).\n8.  Make a 15-20 seconds timeout then submit a _HTTP GET_ request to our API URL: `https://2captcha.com/res.php` to get the result.  \n    The full list of parameters is in the [table below](#recaptchav2new_get).\n\n    If captcha is already solved server will respond in plain text or JSON and return the answer token that looks like:\n\n        03AHJ_Vuve5Asa4koK3KSMyUkCq0vUFCR5Im4CwB7PzO3dCxIo11i53epEraq-uBO5mVm2XRikL8iKOWr0aG50sCuej9bXx5qcviUGSm4iK4NC_Q88flavWhaTXSh0VxoihBwBjXxwXuJZ-WGN5Sy4dtUl2wbpMqAj8Zwup1vyCaQJWFvRjYGWJ_TQBKTXNB5CCOgncqLetmJ6B6Cos7qoQyaB8ZzBOTGf5KSP6e-K9niYs772f53Oof6aJeSUDNjiKG9gN3FTrdwKwdnAwEYX-F37sI_vLB1Zs8NQo0PObHYy0b0sf7WSLkzzcIgW9GR0FwcCCm1P8lB-50GQHPEBJUHNnhJyDzwRoRAkVzrf7UkV8wKCdTwrrWqiYDgbrzURfHc2ESsp020MicJTasSiXmNRgryt-gf50q5BMkiRH7osm4DoUgsjc_XyQiEmQmxl5sqZP7aKsaE-EM00x59XsPzD3m3YI6SRCFRUevSyumBd7KmXE8VuzIO9lgnnbka4-eZynZa6vbB9cO3QjLH0xSG3-egcplD1uLGh79wC34RF49Ui3eHwua4S9XHpH6YBe7gXzz6_mv-o-fxrOuphwfrtwvvi2FGfpTexWvxhqWICMFTTjFBCEGEgj7_IFWEKirXW2RTZCVF0Gid7EtIsoEeZkPbrcUISGmgtiJkJ_KojuKwImF0G0CsTlxYTOU2sPsd5o1JDt65wGniQR2IZufnPbbK76Yh_KI2DY4cUxMfcb2fAXcFMc9dcpHg6f9wBXhUtFYTu6pi5LhhGuhpkiGcv6vWYNxMrpWJW_pV7q8mPilwkAP-zw5MJxkgijl2wDMpM-UUQ_k37FVtf-ndbQAIPG7S469doZMmb5IZYgvcB4ojqCW3Vz6Q\n\n    If captcha is not solved yet server will return _CAPCHA_NOT_READY_ result. Repeat your request in 5 seconds.\n\n    If something went wrong server will return an [error code](#error_handling).\n\n9.  Locate the element with id _g-recaptcha-response_ and make it visible deleting _display:none_ parameter.\n\n    \u003cimg src=\"/assets/captcha-api-docs/img/g_recaptcha_response.png\" width=\"742\" height=\"82\" alt=\"Find html element with 'g-recaptcha-response' id\" loading=\"lazy\" />\n\n    > **Please note:** sometimes content on the page is generated dynamically and you will not see this element in html source.  \n    > In such cases you have to explore javascript code that generates the content. \"Inspect\" option in Google Chrome can help in that.\n\n    As an alternative you can just use javascript to set the value of g-recaptcha-response field:\n\n        document.getElementById(\"g-recaptcha-response\").innerHTML=\"TOKEN\";\n\n10. An input field will appear on the page. And you just have to paste the answer token to that field and submit the form.\n\n11. \u003cimg src=\"/assets/captcha-api-docs/img/answer.png\" width=\"374\" height=\"257\" alt=\"Past received token into the field\" loading=\"lazy\" />\n\n12. Congratulations, you've passed the recaptcha\n\n13. \u003cimg src=\"/assets/captcha-api-docs/img/hooray.png\" width=\"237\" height=\"70\" alt=\"Success\" loading=\"lazy\" />\n\u003c/section>\n\n\u003csection id=\"callback\">\n\n#### reCAPTCHA Callback\n\nSometimes there's no submit button and a callback function is used isntead. The function is executed when reCAPTCHA is solved.\n\nCallback function is usually defined in `data-callback` parameter of reCAPTCHA, for example:\n\n    data-callback=\"myCallbackFunction\"\n\nOr sometimes it's defined as `callback` parameter of `grecaptcha.render` function, for example:\n\n    grecaptcha.render('example', {\n    'sitekey' : 'someSitekey',\n    'callback' : myCallbackFunction,\n    'theme' : 'dark'\n    });\n\nAlso there's another way to find the callback function - open javascript console of your browser and explore reCAPTCHA configuration object:\n\n    ___grecaptcha_cfg.clients[0].aa.l.callback\n\nNote that **aa.l** may change and there can be multiple clients so you have to check **clients\\[1\\], clients\\[2\\]** too.\n\nOr just use [the script that finds reCAPTCHA parameters](https://gist.github.com/2captcha/2ee70fa1130e756e1693a5d4be4d8c70)\n\nFinally all you have to do is to call that function:\n\n    myCallbackFunction();\n\nOr even this way:\n\n    ___grecaptcha_cfg.clients[0].aa.l.callback();\n\nSometimes it is required to provide an argument and in most cases you should put the token there. For example:\n\n    myCallbackFunction('TOKEN');\n\u003c/section>\n\n\u003csection id=\"invisible\">\n\n#### Invisible reCAPTCHA V2\n\nreCAPTCHA V2 also has an invisible version.  \nYou may check how it looks like here: [https://www.google.com/recaptcha/api2/demo?invisible=true](https://www.google.com/recaptcha/api2/demo?invisible=true)  \nRecently we noticed some changes in invisible reCAPTCHA algorithms on few websites and added [new parameter](#recaptchav2new_post) `invisible=1` that should be used for invisible reCAPTCHA.  \nRead more about invisible reCAPTCHA below.\n\nInvisible reCAPTCHA is located on a DIV layer positioned -10 000 px from top that makes it invisible for user.\n\nreCAPTCHA is activated on page load or on user's actions like click somewhere or submit a form - that depends on the website. If user's cookies are good enough then he will just pass it automatically and no additional actions will be required. Otherwise user will see standard reCAPTCHA form with a challenge.\n\nIn most cases when challenge is completed a callback function is executed. You can read more about callback [here](#callback).\n\nIf you are still not sure — there are few ways to determine that reCAPTCHA is in invisible mode:\n\n- You don't see \"I'm not a robot\" checkbox on the page but getting recaptcha challenge when making some actions there\n- reCAPTCHA's iframe link contains parameter `size=invisible`\n- reCAPTCHA's configuration object contains parameter size that is set to invisible, for example `___grecaptcha_cfg.clients[0].aa.l.size` is equal to `invisible`\n\n**How to bypass invisible reCAPTCHA in browser?**\n\n**Method 1: using javascript:**\n\n1.  Change the value of g-recaptcha-response element to the token you received from our server:\n\n    document.getElementById(\"g-recaptcha-response\").innerHTML=\"TOKEN\";\n\n2.  Execute the action that needs to be performed on the page after solving reCAPTCHA.\n\nUsually there's a form that should be submitted and you need to identify the form by id or name or any other attribute and then submit the form. Here are few examples:\n\n    document.getElementById(\"recaptcha-demo-form\").submit(); //by id \"recaptcha-demo-form\"\n    document.getElementsByName(\"myFormName\")[0].submit(); //by element name \"myFormName\"\n    document.getElementsByClassName(\"example\").submit(); //by class name \"example\"\n\nOr sometimes there's a callback function executed when reCAPTCHA is solved.\n\nCallback function is usually defined in `data-callback` parameter of reCAPTCHA, for example:\n\n    data-callback=\"myCallbackFunction\"\n\nOr sometimes it's defined as `callback` parameter of `grecaptcha.render` function, for example:\n\n    grecaptcha.render('example', {\n    'sitekey' : 'someSitekey',\n    'callback' : myCallbackFunction,\n    'theme' : 'dark'\n    });\n\nAnd all you have to do is to call that function:\n\n    myCallbackFunction();\n\n13. Voila! You've done that with just 2 strings of code.\n\n**Method 2: changing HTML:**\n\n1.  Cut the div containing reCAPTCHA from page body.\n\n    ```html\n    \u003cdiv style=\"visibility: hidden; position: absolute; width:100%; top: -10000px; left: 0px; right: 0px; transition: visibility 0s linear 0.3s, opacity 0.3s linear; opacity: 0;\">\n    \u003cdiv style=\"width: 100%; height: 100%; position: fixed; top: 0px; left: 0px; z-index: 2000000000; background-color: #fff; opacity: 0.5;  filter: alpha(opacity=50)\">\n    \u003c/div>\n    \u003cdiv style=\"margin: 0 auto; top: 0px; left: 0px; right: 0px; position: absolute; border: 1px solid #ccc; z-index: 2000000000; background-color: #fff; overflow: hidden;\">\n    \u003ciframe src=\"https://www.google.com/recaptcha/api2/bframe?hl=en&amp;v=r20170213115309&amp;k=6LfP0CITAAAAAHq9FOgCo7v_fb0-pmmH9VW3ziFs#zglq3yifgkmj\" title=\"recaptcha challenge\" style=\"width: 100%; height: 100%;\" scrolling=\"no\" name=\"zglq3yifgkmj\" frameborder=\"0\">\u003c/iframe>\n    \u003c/div>\n    \u003c/div>\n    ```\n\n2.  Cut the whole block:\n\n    ```html\n    \u003cdiv class=\"\">\u003c!-- BEGIN: ReCAPTCHA implementation example. -->\n    \u003cdiv id=\"recaptcha-demo\" class=\"g-recaptcha\" data-sitekey=\"6LfP0CITAAAAAHq9FOgCo7v_fb0-pmmH9VW3ziFs\" data-callback=\"onSuccess\" data-bind=\"recaptcha-demo-submit\">\u003cdiv class=\"grecaptcha-badge\" style=\"width: 256px; height: 60px; transition: right 0.3s ease 0s; position: fixed; bottom: 14px; right: -186px; box-shadow: 0px 0px 5px gray;\">\u003cdiv class=\"grecaptcha-logo\">\u003ciframe src=\"https://www.google.com/recaptcha/api2/anchor?k=6LfP0CITAAAAAHq9FOgCo7v_fb0-pmmH9VW3ziFs&amp;co=aHR0cHM6Ly93d3cuZ29vZ2xlLmNvbTo0NDM.&amp;hl=en&amp;v=r20170213115309&amp;size=invisible&amp;cb=uror1hlow5a\" title=\"recaptcha widget\" scrolling=\"no\" name=\"undefined\" width=\"256\" height=\"60\" frameborder=\"0\">\u003c/iframe>\u003c/div>\u003cdiv class=\"grecaptcha-error\">\u003c/div>\u003ctextarea id=\"g-recaptcha-response\" name=\"g-recaptcha-response\" class=\"g-recaptcha-response\" style=\"width: 250px; height: 40px; border: 1px solid #c1c1c1; margin: 10px 25px; padding: 0px; resize: none;  display: none; \">\u003c/textarea>\u003c/div>\u003c/div>\n    \u003cscript>\n    var onSuccess = function (response) {\n    var errorDivs = document.getElementsByClassName(\"recaptcha-error\");\n    if (errorDivs.length) {\n        errorDivs[0].className = \"\";\n    }\n    var errorMsgs = document.getElementsByClassName(\"recaptcha-error-message\");\n    if (errorMsgs.length) {\n        errorMsgs[0].parentNode.removeChild(errorMsgs[0]);\n    }\n    document.getElementById(\"recaptcha-demo-form\").submit();\n    };\n    \u003c/script>\u003c!-- Optional noscript fallback. -->\u003c!-- END: ReCAPTCHA implementation example. -->\u003c/div>\n    ```\n\n3.  Put the following code instead of the block you've just cut:\n\n    ```html\n    \u003cinput type=\"submit\">\n    \u003ctextarea name=\"g-recaptcha-response\">%g-recaptcha-response%\u003c/textarea>\n    ```\n    \n\nWhere _%g-recaptcha-response%_ \\- is an answer token you’ve got from our service.8. You will see “Submit query” button.  \n Press the button to submit the form with g-recaptcha-response and all other form data to the website.\n\n**List of GET/POST request parameters for https://2captcha.com/in.php**\n\n| **Parameter** | **Type**                       | **Required** | **Description** |\n| ------------- | ------------------------------ | ------------ | --------------- |\n| key           | String                         | Yes          | [your API key](#solving_captchas) |\n| method        | String                         | Yes          | userrecaptcha - defines that you're sending a reCAPTCHA V2 with new method|\n| enterprise    | String \u003cbr>Default: 0          | No           | 1 - defines that you're sending reCAPTCHA Enterpise V2|\n| googlekey     | String                         | Yes          | Value of _k_ or _data-sitekey_ parameter you found on page|\n| pageurl       | String                         | Yes          | Full URL of the page where you see the reCAPTCHA|\n| domain        | String \u003cbr>Default: `google.com` | No           | Domain used to load the captcha: `google.com` or `recaptcha.net`|\n| invisible     | Integer \u003cbr>Default: 0         | No           | 1 - means that reCAPTCHA is invisible. 0 - normal reCAPTCHA.|\n| data-s        | String                         | No           | Value of _data-s_ parameter you found on page. Curenttly applicable for Google Search and other Google services.                                                                                                             |\n| cookies       | String                         | No           | Your _cookies_ that will be passed to our worker who solve the captha. We also return worker's cookies in the response if you use `json=1`. \u003cbr>Format: KEY:Value, separator: semicolon, example: `KEY1:Value1;KEY2:Value2;` |\n| userAgent     | String                         | No           | Your _userAgent_ that will be passed to our worker and used to solve the captcha.                                                                                                                                            |\n| header_acao   | Integer \u003cbr>Default: 0         | No           | 0 - disabled \u003cbr>1 - enabled. \u003cbr>If enabled `in.php` will include _Access-Control-Allow-Origin:\\*_ header in the response. \u003cbr>Used for cross-domain AJAX requests in web applications. Also supported by `res.php`.        |\n| pingback      | String                         | No           | URL for pingback (callback) response that will be sent when captcha is solved. \u003cbr>URL should be registered on the server. [More info here](#pingback).                                                                      |\n| json          | Integer \u003cbr>Default: 0         | No           | 0 - server will send the response as plain text \u003cbr>1 - tells the server to send the response as JSON                                                                                                                        |\n| soft_id       | Integer                        | No           | ID of software developer. Developers who integrated their software with 2Captcha get reward: 10% of spendings of their software users.                                                                                       |\n| proxy         | String                         | No           | Format: _login:password@123.123.123.123:3128_ \u003cbr>You can find more info about proxies [here](#proxies).                                                                                                                     |\n| proxytype     | String                         | No           | Type of your proxy: HTTP, HTTPS, SOCKS4, SOCKS5.|\n\n**List of _GET_ request parameters for https://2captcha.com/res.php**\n\n| **GET parameter** | **Type**               | **Required** | **Description** |\n| ----------------- | ---------------------- | ------------ | --------------- |\n| key               | String                 | Yes          | [your API key](#solving_captchas)                                                                     |\n| action            | String                 | Yes          | get - get the asnwer for your captcha                                                                 |\n| id                | Integer                | Yes          | ID of captcha returned by in.php.                                                                     |\n| json              | Integer \u003cbr>Default: 0 | No           | 0 - server will send the response as plain text \u003cbr>1 - tells the server to send the response as JSON |\n\n**Request URL example:**\n\n    https://2captcha.com/res.php?key=1abc234de56fab7c89012d34e56fa7b8&action=get&id=2122988149\n\n\u003c/section>\n\n\u003csection id=\"solving_recaptchav3\">\n\n#### reCAPTCHA V3\n\n> reCAPTCHA V3 is the newest type of captcha from Google. It has no challenge so there is no need for user interaction. Instead it uses a \"humanity\" rating - score.\n\nreCAPTCHA V3 technically is quite similar to reCAPTCHA V2: customer receives a token from reCAPTCHA API which is then sent inside a POST request to the target website and verified via reCAPTCHA API.\n\nThe difference is now reCAPTCHA API returns rating of a user detecting whether he was a real human or a bot. This rating is called score and could be a number from 0.1 to 0.9. This score is passed to the website which then decides what to do with the user request.\n\nAlso there is a new parameter _action_ allowing to process user actions on the website differently. After the verification of token reCAPTCHA API returns the name of the action user performed.\n\n**Our approach for solving reCAPTCHA V3**  \nWe've performed many experiments and figured out that if a user got score 0.1 on some website then he is likely to get the same score on other websites.\n\nWe are detecting the scores of our workers. Then when we've got a request for solving reCAPTCHA V3 with the minimal rating _min_score_ we pass the captcha to the worker with the requested rating or higher. Most of the requests will get the requested rating on targer websites with reCAPTCHA V3.\n\nHow to solve reCAPTCHA V3 using 2Captcha:\n\n1.  First you've got to be sure the target website is actually using reCAPTCHA V3\n\n    There should be V3 if:\n\n    - there is no captcha and no images to click on\n    - api.js script is loading with the _render=sitekey_ parameter, for example:  \n       _https://www.google.com/recaptcha/api.js?render=6LfZil0UAAAAAAdm1Dpzsw9q0F11-bmervx9g5fE_\n    - clients array of \\_\\_\\_grecaptcha_cfg object is using index 100000: _\\_\\_\\_grecaptcha_cfg.clients\\[100000\\]_\n\n2.  To start solving reCAPTCHA V3 using our API first you've got to find three parameters:\n\n    **sitekey** \\- this parameter could be obtained from the URI of api.js as a value of _render_ parameter. It could also be found inside URI of iframe with reCAPTCHA, in javascript code of the website where it's calling grecaptcha.execute function or in \\_\\_\\_grecaptcha_cfg configuration object.\n\n    **action** \\- you've got to find this inspecting javascript code of the website looking for call of grecaptcha.execute function. Example: _grecaptcha.execute('6LfZil0UAAAAAAdm1Dpzsw9q0F11-bmervx9g5fE', {action: do_something})_.  \n    Sometimes it's really hard to find it and you've got to dig through all js-files loaded by website. You may also try to find the value of action parameter inside \\_\\_\\_grecaptcha_cfg configuration object but usually it's undefined. In that case you have to call grecaptcha.execute and inspect javascript code. If you can't find it try to use the default value \"verify\" - our API will use it if you don't provide action in your request.\n\n    **pageurl** \\- full URL of the page where you see the reCAPTCHA V3.\n\n    Now you need to understand the _score_ you need to solve V3. You can't predict what score is acceptable for the website you want to solve at. It can only be figured out by trial and error. The lowest score is 0.1 which means \"robot\", the highest is 0.9 which means \"human\". But most sites uses thresholds from 0.2 to 0.5 because real humans receive a low score oftenly. Our service is able to provide solutions which requires the score of 0.3. Higher score is extreamly rare among workers.\n\n3.  Having all necessary parameters stated above you may send request to our API.\n4.  Submit a _HTTP GET_ or _POST_ request to our API URL:  \n    `https://2captcha.com/in.php`  \n    with _method_ set to _userrecaptcha_ and _version_ set to _v3_ along with _min_score_ set to score website requires, sitekey inside _googlekey_ parameter and full page URL as value for _pageurl_. You have to include _action_ parameter to or else we will use default value _verify_.\n\n    List of request parameters [below](#recaptchav3_post).\n\n    **URL request sample:**\n\n        https://2captcha.com/in.php?key=1abc234de56fab7c89012d34e56fa7b8&method=userrecaptcha&version=v3&action=verify&min_score=0.3\n        &googlekey=6LfZil0UAAAAAAdm1Dpzsw9q0F11-bmervx9g5fE&pageurl=http://mysite.com/page/\n\n5.  If everything is fine server will return the ID of your captcha as plain text, like: _OK|2122988149_ or as JSON _{\"status\":1,\"request\":\"2122988149\"}_ if json parameter was used.\n\n    If something went wrong server will return an error. See [Error Handling](#error_handling) chapter for the list of errors.\n\n6.  Make a 10-15 seconds timeout and submit a _HTTP GET_ request to our API `https://2captcha.com/res.php` providing the captcha ID. The list of parameters is in the [table below](#recaptchav3_get).\n\n    If everything is fine and your captcha is solved server will return the answer as plain text or as JSON. The answer is a token like this:\n\n        03AHJ_Vuve5Asa4koK3KSMyUkCq0vUFCR5Im4CwB7PzO3dCxIo11i53epEraq-uBO5mVm2XRikL8iKOWr0aG50sCuej9bXx5qcviUGSm4iK4NC_Q88flavWhaTXSh0VxoihBwBjXxwXuJZ-WGN5Sy4dtUl2wbpMqAj8Zwup1vyCaQJWFvRjYGWJ_TQBKTXNB5CCOgncqLetmJ6B6Cos7qoQyaB8ZzBOTGf5KSP6e-K9niYs772f53Oof6aJeSUDNjiKG9gN3FTrdwKwdnAwEYX-F37sI_vLB1Zs8NQo0PObHYy0b0sf7WSLkzzcIgW9GR0FwcCCm1P8lB--gf50q5BMkiRH7osm4DoUgsjc_XyQiEmQmxl5sqZP7aKsaE-EM00x59XsPzD3m3YI6SRCFRUevSyumBd7KmXE8VuzIO9lgnnbka4-eZynZa6vbB9cO3QjLH0xSG3--o-fxrOuphwfrtwvvi2FGfpTexWvxhqWICMFTTjFBCEGEgj7_IFWEKirXW2RTZCVF0Gid7EtIsoEeZkPbrcUISGmgtiJkJ_KojuKwImF0G0CsTlxYTOU2sPsd5o1JDt65wGniQR2IZufnPbbK76Yh_KI2DY4cUxMfcb2fAXcFMc9dcpHg6f9wBXhUtFYTu6pi5LhhGuhpkiGcv6vWYNxMrpWJW_pV7q8mPilwkAP-zw5MJxkgijl2wDMpM-UUQ_k37FVtf-ndbQAIPG7S469doZMmb5IZYgvcB4ojqCW3Vz6Q\n\n    If the captcha is not solved yet server will return _CAPCHA_NOT_READY_. Just repeat your request in 5 seconds.\n\n    If something went wrong server will return an error. See [Error Handling](#error_handling) chapter for the list of errors.\n\n    **Sample request:**\n\n        https://2captcha.com/res.php?key=1abc234de56fab7c89012d34e56fa7b8&action=get&json=1&id=2122988149\n\n7.  After receiving the token from our API you've got to use it properly on the target website. Best way to understant that is to check the requests sent to site when you act as a normal user. Most browsers has developer's console tool where you should check Network tab.\n\n    Usually token is sent using POST request. It could be _g-recaptcha-response_ just like reCAPTCHA V2 does or _g-recaptcha-response-100000_. It could be other parameter too. So you've got to inspect the requests and find out how exactly the token supposed to be sent. Then you have to compose your request accordingly.\n\n8.  Now when you have successfully submit the token you may tell us if it worked or not. If not we will refund the money you spent on this token. If it was successfully accepted we will set the worker who solved this captcha as the priority solver for you. Besides we will gather statistics regarding V3 solution which will help us to further investigate this new type of captchas and make our service better.\n\n    To let us know whether it worked or not please send the request to `https://2captcha.com/res.php` with your API Key in _key_ parameter with ID of the captcha in _id_ parameter and indicating _action_ parameter. Next to mention is _reportgood_ if token was accepted successfully or _reportbad_ if token wasn't accepted respectfully.\n\n    **Request examples:**\n\n    ReportBAD\n\n        https://2captcha.com/res.php?key=1abc234de56fab7c89012d34e56fa7b8&action=reportbad&id=2122988149\n\n    ReportGOOD\n\n        https://2captcha.com/res.php?key=1abc234de56fab7c89012d34e56fa7b8&action=reportgood&id=2122988149\n\n    Important: complains for captcha types solved with token are not shown on the website. But we proceed with every report and gather the statistics. We will implement this complain display feature in future.\n\n**List of GET/POST request parameters for https://2captcha.com/in.php**\n\n| **Parameter** | **Type**                       | **Required** | **Description** |\n| ------------- | ------------------------------ | ------------ | --------------- |\n| key           | String                         | Yes          | [your API key](#solving_captchas)|\n| method        | String                         | Yes          | userrecaptcha — defines that you're sending a reCAPTCHA|\n| version       | String                         | Yes          | v3 — defines that you're sending a reCAPTCHA V3|\n| enterprise    | String \u003cbr>Default: 0          | No           | 1 - defines that you're sending reCAPTCHA Enterpise V3|\n| googlekey     | String                         | Yes          | Value of sitekey parameter you found on page|\n| pageurl       | String                         | Yes          | Full URL of the page where you see the reCAPTCHA|\n| domain        | String \u003cbr>Default: `google.com` | No           | Domain used to load the captcha: `google.com` or `recaptcha.net`|\n| action        | String \u003cbr>Default: verify     | No           | Value of action parameter you found on page|\n| min_score     | Integer \u003cbr>Default: 0.4       | No           | The score needed for resolution. Currently it's almost impossible to get token with score higher than 0.3                                                                                                              |\n| header_acao   | Integer \u003cbr>Default: 0         | No           | 0 — disabled \u003cbr>1 — enabled. \u003cbr>If enabled `in.php` will include _Access-Control-Allow-Origin:\\*_: header in the response. \u003cbr>Used for cross-domain AJAX requests in web applications. Also supported by `res.php`. |\n| pingback      | String                         | No           | URL for pingback (callback) response that will be sent when captcha is solved. URL should be registered on the server. More info [here](#pingback).                                                                    |\n| json          | Integer \u003cbr>Default: 0         | No           | 0 — server will send the response as plain text \u003cbr>1 — tells the server to send the response as JSON                                                                                                                  |\n| soft_id       | Integer                        | No           | ID of software developer. Developers who integrated their software with 2Captcha get reward: 10% of spendings of their software users.                                                                                 |\n\n**List of GET request parameters for https://2captcha.com/res.php**\n\n| **GET parameter** | **Type**               | **Required** | **Description** |\n| ----------------- | ---------------------- | ------------ | --------------- |\n| key               | String                 | Yes          | [your API key](#solving_captchas)|\n| action            | String                 | Yes          | get — get the asnwer for your captcha \u003cbr>reportgood — - report the asnwer was accepted \u003cbr>reportbad — - report the asnwer was declined                                                |\n| id                | Integer                | Yes          | ID of captcha returned by in.php.|\n| json              | Integer \u003cbr>Default: 0 | No           | 0 — server will send the response as plain text \u003cbr>1 — tells the server to send the response as JSON                                                                                   |\n| header_acao       | Integer \u003cbr>Default: 0 | No           | 0 — disabled \u003cbr>1 — enabled. \u003cbr>If enabled res.php will include _Access-Control-Allow-Origin:\\*_ header in the response. \u003cbr>Used for cross-domain AJAX requests in web applications. |\n\u003c/section>\n\n\u003csection id=\"solving_recaptcha_enterprise\">\n\n#### reCAPTCHA Enterprise\n\n> reCAPTCHA Enterprise is the newest type of captcha from Google. It can be used as V2 and V3 and provides website administrators an option to report the interaction result - was it a human or not.\n\nHow to solve reCAPTCHA Enterprise using 2Captcha:\n\n1.  First step is to determine that Enterpise version of reCAPTCHA is used. The main Enterprise attributes are:\n\n    - `enterprise.js` script instead of `api.js` is included on the page &lt;script src=\"https://recaptcha.net/recaptcha/enterprise.js\" async=\"\" defer=\"\"&gt;&lt;/script&gt;\n    - `grecaptcha.enterprise.METHOD` calls in javascript code of the website instead of `grecaptcha.METHOD`\n\n2.  Then you need to determine which implementation is used: V2, V2 Invisible or V3. It is quite easy, just follow the flowchart below, it works in 99% of cases.\n\n    \u003cimg src=\"/assets/captcha-api-docs/img/recap_ver_flow.png\" width=\"397\" height=\"223\" alt=\"reCAPTCHA Enterprise flow\" loading=\"lazy\" />\n\n3.  Find captcha parameters the same way it is done for V2 or V3.\n\n    For V2 implementations there can be **optional** additional data used: in most cases that is a custom string value defined in `s` or `data-s` parameter. You can pass this data inside `data-s` request parameter.\n\n    For V3 you may also need the `action` value. To find it you need to dive into javascript code of the website and find the `grecaptcha.enterprise.execute` call. Action is passed to this call. But keep in mind that action is optional and can remain undefined.\n\n4.  Add an additional parameter `enterprise=1` to your request to `in.php` endpoint and interact with our API the same way it is done when [solving V2](#solving_recaptchav2_new) or [solving V3](#solving_recaptchav3) to get the token, then use the token in the same way it is used on your target website.\n\u003c/section>\n\n\u003csection id=\"grid\">\n\n#### Grid method\n\nThis method allows to solve any captcha where image can be divided into equal parts like reCAPTCHA V2. A grid is applied above the image. And you receive the numbers clicked boxes.\n\nTo solve the captcha you have to:\n\n1.  Prepare the image and the instruction what to click. The instruction can be sent as text or as image. Don't forget to indicate the instruction [language](#language)!\n2.  **Optionally:** determine the grid and define it in your request with _recaptchacols_ and _recaptcharows_ parameters.  \n    If not defined we'll check the size of the image. If it's 300x300px we put 3x3 grid on it. If the size is different we put 4x4 grid.\n3.  Submit a _HTTP POST_ request to our API URL: `https://2captcha.com/in.php` including _recaptcha_ parameter set to _1_.\n\n    Server accepts images in multipart or base64 format.\n\n    Also you can provide instructions as an image using _imginstructions_ parameter. For more info please check the full list of parameters in the [table below.](#grid_post)\n\n4.  Server will return captcha ID or an [error code](#error_handling) if something went wrong.\n5.  Make a 5 seconds timeout and submit a _HTTP GET_ request to our API URL: `https://2captcha.com/res.php` to get the result.\n\n    If captcha is already solved server will return the answer with numbers of grid cells that you need to click like: _OK|click:3/8/9_.\n\n    Grid cells are numbered starting from number 1 from left to right and from top to bottom.\n\n    If captcha is not solved yet server will return _CAPCHA_NOT_READY_ result. Repeat your request in 5 seconds.\n\n    If something went wrong server will return an [error code](#error_handling).\n\n6.  You simulate clicks on cells from the answer.\n7.  If reCAPTCHA updates the set of images you can send us new request with an additional parameter _previousID_ and the ID of previous request as a value. Then our worker will check only new images that were not selected by previous worker.\n8.  Also you can proivde additional parameter _can_no_answer_ in case if there's no images to click left. Worker will see a button to confirm that there's no corresponding images and API will return _No_matching_images_ as answer.\n\n\u003cdiv id=\"canvas\">\u003cb>Canvas method\u003c/b>\u003c/div>   \n\nIf you need to solve challenges that ask to **select around object** you can pass _canvas_ parameter set to _1_.\n\nServer will return the result in the following format: _canvas:x,y,x,y,x,y;x,y,x,y,x,y;_\n\nWhere each pair of x and y are coordinates of points you need to click to select an area around object. If there are more than one area, coordininates of areas will be separated by semicolon.\n\nFor example:  \n_canvas:5,5,3,91,93,90,90,7,8,6;_ \\- one area  \n_canvas:5,5,3,91,93,90,90,7,8,6;208,211,208,287,294,294,293,209,207,210;_ \\- two areas  \nPoint **0,0** is **top left** corner of the image.\n\nYou need to click on these points one by one to pass the challenge.\n\n**Multipart sample form for Grid method**\n\n    \u003cform method=\"post\" action=\"https://2captcha.com/in.php\" enctype=\"multipart/form-data\">\n    \u003cinput type=\"hidden\" name=\"method\" value=\"post\">\n    \u003cinput type=\"hidden\" name=\"recaptcha\" value=\"1\">\u003cbr>\n    \u003cinput type=\"hidden\" name=\"canvas\" value=\"0\">\u003cbr>\n    Your key:\n    \u003cinput type=\"text\" name=\"key\" value=\"YOUR_APIKEY\">\n    reCAPTCHA file:\n    \u003cinput type=\"file\" name=\"file\">\n    Image with instruction:\n    \u003cinput type=\"file\" name=\"imginstructions\">\n    \u003cinput type=\"submit\" value=\"Upload and get the ID\">\n    \u003c/form>\n\n_YOUR_APIKEY_ is [Your API key](#solving_captchas).\n\n**Base64 sample form for Grid method**\n\n    \u003cform method=\"post\" action=\"https://2captcha.com/in.php\">\n    \u003cinput type=\"hidden\" name=\"method\" value=\"base64\">\n    \u003cinput type=\"hidden\" name=\"recaptcha\" value=\"1\">\u003cbr>\n    \u003cinput type=\"hidden\" name=\"canvas\" value=\"0\">\u003cbr>\n    Your key:\n    \u003cinput type=\"text\" name=\"key\" value=\"YOUR_APIKEY\">\n    reCAPTCHA file body in base64 format:\n    \u003ctextarea name=\"body\">BASE64_RECAPTCHA_FILE\u003c/textarea>\n    Image with instruction body in base64 format:\n    \u003ctextarea name=\"imginstructions\">BASE64_INSTRUCTION_FILE\u003c/textarea>\n    \u003cinput type=\"submit\" value=\"Upload and get the ID\">\n    \u003c/form>\n\n_YOUR_APIKEY_ is [your API key](#solving_captchas).\n\n_BASE64_RECAPTCHA_FILE_ is base64-encoded image body of reCAPTCHA V2.\n\n_BASE64_INSTRUCTION_FILE_ is base64-encoded image body of image with instruction.\n\n**List of _POST_ request parameters for https://2captcha.com/in.php**\n\n| **POST parameter** | **Type**                                           | **Required** | **Description** |\n| ------------------ | -------------------------------------------------- | ------------ | --------------- |\n| key                | String                                             | Yes          | [your API key](#solving_captchas)|\n| method             | String                                             | Yes          | post - defines that you're sending an image with multipart form \u003cbr>base64 - defines that you're sending a base64 encoded image|\n| recaptcha          | Integer                                            | Yes          | 1 - defines that you're sending recatcha as image|\n| canvas             | Integer \u003cbr>Default: 0                             | No           | 1 - defines that you want to use [canvas method](#canvas)|\n| file               | File                                               | Yes\\*        | Captcha image file. \u003cbr>\\* \\- required if you submit image as a file (method=post)|\n| body               | String                                             | Yes\\*        | Base64-encoded captcha image \u003cbr>\\* \\- required if you submit image as Base64-encoded string (method=base64)|\n| textinstructions   | String \u003cbr>Max 140 characters \u003cbr>Endcoding: UTF-8 | Yes          | Text with instruction for solving reCAPTCHA. \u003cbr>For example: select images with trees. \u003cbr>**Not required** if you're sending instruction as an image with _imginstructions_.                                                                                                                 |\n| imginstructions    | Image \u003cbr>Max 400x150px, 100 kB                    | Yes          | Image with instruction for solving reCAPTCHA. \u003cbr>**Not required** if you're sending instruction as text with _textinstructions_.  |\n|img\\_type           | String                                             | No           | The image will be recognized using Computer Vision, which significantly reduces the time needed to solve the captcha. Supported value options: \u003cbr> `funcaptcha` - sending FunCaptcha, the version in which you need to click on the square matching the requirements.  [More info here](https://2captcha.com/blog/funcaptcha-bypass-2-ways-solutions).\u003cbr>`funcaptcha_compare` - sending FunCaptcha, a version in which you need to use the arrows to select the desired square. [More info here](https://2captcha.com/blog/funcaptcha-bypass-2-ways-solutions).\u003cbr>`recaptcha` - sending reCAPTCHA. [More info here](https://2captcha.com/blog/recaptcha-recognition-using-grid-method).\u003cbr> \u003cb>Important:\u003c/b> when using the `image_type` parameter, it is required to send the `textinstructions` parameter containing the original instructions for the captcha in English, and you also need to send the original image files and not screenshots.            |\n| recaptcharows      | Integer                                            | No           | Number of rows in reCAPTCHA grid.|\n| recaptchacols      | Integer                                            | No           | Number of columns in reCAPTCHA grid.|\n| min_clicks         | Integer \u003cbr>Default: 1                             | No | The minimum number of tiles that must be selected. Can't  be more than `recaptcharows * recaptchacols` |\n| max_clicks         | Integer \u003cbr>Default: `recaptcharows * recaptchacols` | No | The maximum number of tiles that can be selected on the image |\n| previousID         | String                                             | No           | Id of your previous request with the same captcha challenge|\n| can_no_answer      | Integer \u003cbr>Default: 0                             | No           | 0 - not specified \u003cbr>1 - possibly there's no images that fit the instruction. \u003cbr>Set the value to 1 only if it's possible that there's no images matching the instruction. \u003cbr>We'll provide a button \"No matching images\" to worker and you will receive _No_matching_images_ as answer. |\n| language           | Integer \u003cbr>Default: 0                             | No           | 0 - not specified \u003cbr>1 - Cyrillic captcha \u003cbr>2 - Latin captcha|\n| lang               | String                                             | No           | Language code. [See the list of supported languages.](#language)|\n| header_acao        | Integer \u003cbr>Default: 0                             | No           | 0 - disabled \u003cbr>1 - enabled. \u003cbr>If enabled `in.php` will include _Access-Control-Allow-Origin:\\*_ header in the response. \u003cbr>Used for cross-domain AJAX requests in web applications. Also supported by `res.php`.|\n| pingback           | String                                             | No           | URL for pingback (callback) response that will be sent when captcha is solved. \u003cbr>URL should be registered on the server. [More info here](#pingback).|\n| json               | Integer \u003cbr>Default: 0                             | No           | 0 - server will send the response as plain text \u003cbr>1 - tells the server to send the response as JSON|\n| soft_id            | Integer                                            | No           | ID of software developer. Developers who integrated their software with 2Captcha get reward: 10% of spendings of their software users.|\n\n\n\n> **Please note:** you have to send the reCAPTCHA image itself, not its screenshot. And you dont have to combine that image with anything you like, just send it as it is.  \n> Max size for reCAPTCHA image is 600 kB.  \n> Max size for _imginstructions_ is 100 kB.\n\n**List of _GET_ request parameters for https://2captcha.com/res.php**\n\n| **GET parameter** | **Type**               | **Required** | **Description** |\n| ----------------- | ---------------------- | ------------ | --------------- |\n| key               | String                 | Yes          | [your API key](#solving_captchas)|\n| action            | String                 | Yes          | get - get the asnwer for your captcha|\n| id                | Integer                | Yes          | ID of captcha returned by in.php.|\n| json              | Integer \u003cbr>Default: 0 | No           | 0 - server will send the response as plain text \u003cbr>1 - tells the server to send the response as JSON |\n\n**Request URL example:**\n\n    https://2captcha.com/res.php?key=1abc234de56fab7c89012d34e56fa7b8&action=get&id=2122988149\n\u003c/section>\n\n\u003csection id=\"coordinates\">\n\n#### Coordinates method\n\n> This method allows you to solve any captcha that requires clicking on images, like reCAPTCHA V2.\n\nTo solve the captcha you have to:\n\n1.  Get an image and an instruction that tells you what to click.\n2.  Submit a _HTTP POST_ request to our API URL: `https://2captcha.com/in.php` providing _coordinatescaptcha_ parameter set to _1_.  \n    Server accepts images in multipart or base64 format.\n\n    You can provide instruction as text using _textinstructions_ parameter, but it's not obligatory if the instruction is already indicated on the image.  \n    But don't forget to indicate the [language](#language)\n\n    The full list of parameters is in the [table below.](#coordinates_post)\n\n3.  Server will return captcha ID or an [error code](#error_handling) if something went wrong.\n4.  Make a 5 seconds timeout and submit a _HTTP GET_ request to our API URL: `https://2captcha.com/res.php` to get the result.\n\n    If captcha is already solved server will return the answer with coordinates of points where you have to click, for example: _OK|coordinate:x=39,y=59;x=252,y=72_. Where the point with x=0,y=0 is the upper left corner of the image.\n\n    If captcha is not solved yet server will return _CAPCHA_NOT_READY_ result. Repeat your request in 5 seconds.\n\n    If something went wrong server will return an [error code](#error_handling).\n\n5.  You simulate clicks on coordinates from the answer.\n\n**Multipart sample form for Coordinates method**\n\n    \u003cform method=\"post\" action=\"https://2captcha.com/in.php\" enctype=\"multipart/form-data\">\n    \u003cinput type=\"hidden\" name=\"method\" value=\"post\">\n    \u003cinput type=\"hidden\" name=\"coordinatescaptcha\" value=\"1\">\n    Your key:\n    \u003cinput type=\"text\" name=\"key\" value=\"YOUR_APIKEY\">\n    Captcha image file:\n    \u003cinput type=\"file\" name=\"file\">\n    Instruction:\n    \u003cinput type=\"text\" name=\"textinstructions\" value=\"Click on ghosts\">\n    \u003cinput type=\"submit\" value=\"Upload and get the ID\">\n    \u003c/form>\n\n_YOUR_APIKEY_ is [Your API key](#solving_captchas).\n\nBase64 sample form for Coordinates method\n\n    \u003cform method=\"post\" action=\"https://2captcha.com/in.php\">\n    \u003cinput type=\"hidden\" name=\"method\" value=\"base64\">\n    \u003cinput type=\"hidden\" name=\"coordinatescaptcha\" value=\"1\">\n    Your key:\n    \u003cinput type=\"text\" name=\"key\" value=\"YOUR_APIKEY\">\n    Captcha image body in base64 format:\n    \u003ctextarea name=\"body\">BASE64_FILE\u003c/textarea>\n    Instruction\n    \u003cinput type=\"text\" name=\"textinstructions\" value=\"Click on ghosts\">\n    \u003cinput type=\"submit\" value=\"Upload and get the ID\">\n    \u003c/form>\n\n_YOUR_APIKEY_ is [your API key](#solving_captchas).\n\n_BASE64_FILE_ is base64-encoded image body of the captcha.\n\n**List of _POST_ request parameters for https://2captcha.com/in.php**\n\n| **POST parameter** | **Type**                                           | **Required** | **Description** |\n| ------------------ | -------------------------------------------------- | ------------ | --------------- |\n| key                | String                                             | Yes          | [your API key](#solving_captchas)|\n| method             | String                                             | Yes          | post - defines that you're sending an image with multipart form \u003cbr>base64 - defines that you're sending a base64 encoded image                                                                                       |\n| coordinatescaptcha | Integer                                            | Yes          | 1 - defines that you're sending recatcha as image|\n| file               | File                                               | Yes\\*        | Captcha image file. \u003cbr>\\* \\- required if you submit image as a file (method=post)|\n| body               | String                                             | Yes\\*        | Base64-encoded captcha image \u003cbr>\\* \\- required if you submit image as Base64-encoded string (method=base64)                                                                                                          |\n| textinstructions   | String \u003cbr>Max 140 characters \u003cbr>Endcoding: UTF-8 | Yes          | Text with instruction for solving the captcha. \u003cbr>For example: click on images with ghosts. \u003cbr>**Not required** if the image already contains the instruction.                                                      |\n| imginstructions    | Image \u003cbr>Max 400x150px, 100 kB                    | Yes          | Image with instruction for solving reCAPTCHA. \u003cbr>**Not required** if you're sending instruction as text with _textinstructions_.|\n| min_clicks | Integer \u003cbr>Default: 1 | No | The minimum number of clicks to perform on the image |\n| max_clicks | Integer | No | The maximum number of clicks that can be performed on the image |\n| language           | Integer \u003cbr>Default: 0                             | No           | 0 - not specified \u003cbr>1 - Cyrillic captcha \u003cbr>2 - Latin captcha|\n| lang               | String                                             | No           | Language code. [See the list of supported languages.](#language)|\n| header_acao        | Integer \u003cbr>Default: 0                             | No           | 0 - disabled \u003cbr>1 - enabled. \u003cbr>If enabled `in.php` will include _Access-Control-Allow-Origin:\\*_ header in the response. \u003cbr>Used for cross-domain AJAX requests in web applications. Also supported by `res.php`. |\n| pingback           | String                                             | No           | URL for pingback (callback) response that will be sent when captcha is solved. \u003cbr>URL should be registered on the server. [More info here](#pingback).                                                               |\n| json               | Integer \u003cbr>Default: 0                             | No           | 0 - server will send the response as plain text \u003cbr>1 - tells the server to send the response as JSON                                                                                                                 |\n| soft_id            | Integer                                            | No           | ID of software developer. Developers who integrated their software with 2Captcha get reward: 10% of spendings of their software users.                                                                                |\n\n\n**List of _GET_ request parameters for https://2captcha.com/res.php**\n\n| **GET parameter** | **Type**               | **Required** | **Description** |\n| ----------------- | ---------------------- | ------------ | --------------- |\n| key               | String                 | Yes          | [your API key](#solving_captchas)|\n| action            | String                 | Yes          | get - get the asnwer for your captcha|\n| id                | Integer                | Yes          | ID of captcha returned by in.php.|\n| json              | Integer \u003cbr>Default: 0 | No           | 0 - server will send the response as plain text \u003cbr>1 - tells the server to send the response as JSON |\n\n**Request URL example:**\n\n    https://2captcha.com/res.php?key=1abc234de56fab7c89012d34e56fa7b8&action=get&id=2122988149\n\u003c/section>\n\n\u003csection id=\"solving_rotatecaptcha\">\n\n#### RotateCaptcha\n\n> RotateCaptcha is a type of captcha where you have to rotate images to solve it. The most popular is FunCaptcha by Arkose Labs.\n\n\u003cimg src=\"/assets/captcha-api-docs/img/funcaptcha.gif\" width=\"470\" height=\"292\" alt=\"FunCaptcha\" loading=\"lazy\" />\n\nTo solve RotateCaptcha you have to:\n\n1.  Get an image or several images that should be rotated.\n2.  **Optionally:** determine the angle for one rotation step and provide it as a value for _angle_ parameter.  \n    If not defined we'll use the default value for FunCaptcha: 40 degrees.\n\n    The full list of parameters is in the [table below.](#rotatecaptcha_post)\n\n3.  Submit images to our server with _HTTP POST_ request to our API URL: `https://2captcha.com/in.php` setting _method_ parameter to _rotatecaptcha_. Server accepts images only in multipart format.\n\n    Server will return captcha ID or an [error code](#error_handling) if something went wrong.\n\n4.  Make a 5 seconds timeout and submit a _HTTP GET_ request to our API URL: `https://2captcha.com/res.php` to get the result.\n\n    If captcha is already solved server will return the answer with angles for each image like: _OK|40|200|-120_.  \n    Positive values mean that images should be rotated clockwise.  \n    Negative values mean that images should be rotated counter-clockwise.\n\n    If captcha is not solved yet server will return _CAPCHA_NOT_READY_ result. Repeat your request in 5 seconds.  \n    If something went wrong server will return an [error code](#error_handling).\n\n5.  Rotate images to given angles to solve your RotateCaptcha.\n\n**Sample form for RotateCaptcha**\n\n    \u003cform method=\"post\" action=\"https://2captcha.com/in.php\" enctype=\"multipart/form-data\">\n    KEY:\u003cbr>\n    \u003cinput  name=\"key\" value=\"YOUR_APIKEY\">\u003cbr>\n    Type\u003cbr>\n    \u003cinput  name=\"method\" value=\"rotatecaptcha\">\u003cbr>\n    Angle\u003cbr>\n    \u003cinput  name=\"angle\" value=\"40\">\u003cbr>\n    Files:\u003cbr>\n    \u003cinput type=\"file\" name=\"file\">\u003cbr>\n    \u003cinput type=\"submit\" value=\"Upload and get the ID\">\n    \u003c/form>\n\n**Sample form for RotateCaptcha in base64 format**\n\n    \u003cform method=\"post\" action=\"https://2captcha.com/in.php\">\n    KEY:\u003cbr>\n    \u003cinput  name=\"key\" value=\"YOUR_APIKEY\">\u003cbr>\n    Type\u003cbr>\n    \u003cinput  name=\"method\" value=\"rotatecaptcha\">\u003cbr>\n    Angle\u003cbr>\n    \u003cinput  name=\"angle\" value=\"40\">\u003cbr>\n    Files:\u003cbr>\n    \u003ctextarea name=\"body\">BASE64_FILE\u003c/textarea>\n    \u003cinput type=\"submit\" value=\"Upload and get the ID\">\n    \u003c/form>\n\n_YOUR_APIKEY_ is [your API key](#solving_captchas).\n\n**List of _POST_ request parameters for https://2captcha.com/in.php**\n\n| **POST parameter** | **Type**                | **Required** | **Description** |\n| ------------------ | ----------------------- | ------------ | --------------- |\n| key                | String                  | Yes          | [your API key](#solving_captchas)|\n| method             | String                  | Yes          | Captcha solving method. \u003cbr>rotatecaptcha - defines that you're sending RotateCaptcha|\n| angle              | Integer \u003cbr>Default: 40 | No           | Angle for one rotation step in degrees. \u003cbr>If not defined we'll use the default value for FunCaptcha: 40 degrees.|\n| file               | File                    | Yes\\*        | Captcha image file. \u003cbr>\\* \\- required if you submit image as a file|\n| body               | String                  | Yes\\*        | Base64-encoded captcha image \u003cbr>\\* \\- required if you submit image as Base64-encoded string|\n| lang               | String                  | No           | Language code. [See the list of supported languages.](#language) |\n| imginstructions    | String                  | No           | Image with instruction for worker to help him to solve captcha correctly. |\n| textinstructions   | String                  | No           | Text will be shown to worker to help him to to solve captcha correctly. |\n| header_acao        | Integer \u003cbr>Default: 0  | No           | 0 - disabled \u003cbr>1 - enabled. \u003cbr>If enabled `in.php` will include `Access-Control-Allow-Origin:*` header in the response. \u003cbr>Used for cross-domain AJAX requests in web applications. Also supported by `res.php`. |\n| pingback           | String                  | No           | URL for pingback (callback) response that will be sent when captcha is solved. \u003cbr>URL should be registered on the server. [More info here](#pingback).|\n| json               | Integer \u003cbr>Default: 0  | No           | 0 - server will send the response as plain text \u003cbr>1 - tells the server to send the response as JSON|\n| soft_id            | Integer                 | No           | ID of software developer. Developers who integrated their software with 2Captcha get reward: 10% of spendings of their software users.                                                                               |\n\n**List of _GET_ request parameters for https://2captcha.com/res.php**\n\n| **GET parameter** | **Type**               | **Required** | **Description** |\n| ----------------- | ---------------------- | ------------ | --------------- |\n| key               | String                 | Yes          | [your API key](#solving_captchas)|\n| action            | String                 | Yes          | get - get the asnwer for your captcha|\n| id                | Integer                | Yes          | ID of captcha returned by in.php.|\n| json              | Integer \u003cbr>Default: 0 | No           | 0 - server will send the response as plain text \u003cbr>1 - tells the server to send the response as JSON |\n\n**Request URL example:**\n\n    https://2captcha.com/res.php?key=1abc234de56fab7c89012d34e56fa7b8&action=get&id=2122988149\n\u003c/section>\n\n\u003csection id=\"solving_funcaptcha_new\">\n\n#### Arkose Labs FunCaptcha\n\n> Now we provide a method to solve Arkose Labs captcha (ex. FunCaptcha) with a token.\n\nThe method is pretty simple:\n\n1.  You need to locate two values on the page with Arkose Labs captcha\n\n    - \\- Public key\n    - \\- Service URL (surl)\n\n    Public key can be found inside `data-pkey` parameter of funcaptcha's div element or inside an input element with name `fc-token` \\- just extract the key indicated after `pk` from the value of this element.  \n    Service Url can be also found in `fc-token` \\- that is a value of `surl` parameter.  \n    Service Url is optional parameter and if you don't provide it we use a default value that is valid for most cases, but we recommend you to provide it.\n\n2.  Submit a _HTTP GET_ or _POST_ request to our API URL: `https://2captcha.com/in.php` with method set to _funcaptcha_, provide values found on previous step for _publickey_ and _surl_ parameter and full page URL as value for _pageurl_.  \n    You can find the full list of parameters in the [table below.](#funcaptcha_new_post)\n\n    **Request URL example:**\n\n        https://2captcha.com/in.php?key=1abc234de56fab7c89012d34e56fa7b8&method=funcaptcha&publickey=12AB34CD-56F7-AB8C-9D01-2EF3456789A0&surl=https://client-api.arkoselabs.com&pageurl=http://mysite.com/page/with/funcaptcha/\n\n3.  If everything is fine server will return the ID of your captcha as plain text, like: _OK|2122988149_ or as JSON _{\"status\":1,\"request\":\"2122988149\"}_ if _json_ parameter was used.  \n    Otherwise server will return an [error code](#error_handling).\n4.  Make a 10-20 seconds timeout then submit a _HTTP GET_ request to our API URL: `https://2captcha.com/res.php` to get the result.  \n    The full list of parameters is in the [table below](#funcaptcha_new_get).\n\n    If captcha is already solved server will respond in plain text or JSON and return the answer token that looks like:\n\n        3084f4a302b176cd7.96368058|r=ap-southeast-1|guitextcolor=%23FDD531|metabgclr=%23FFFFFF|metaiconclr=%23202122|meta=3|lang=en|pk=12AB34CD-56F7-AB8C-9D01-2EF3456789A0|cdn_url=https://cdn.funcaptcha.com/fc|surl=https://funcaptcha.com\n\n    If captcha is not solved yet server will return _CAPCHA_NOT_READY_ result. Repeat your request in 5 seconds.\n\n    If something went wrong server will return an [error code](#error_handling).\n\n5.  Locate the element with id _fc-token_ and put the token into value of this element.\n6.  Do the rest what you need to do on the website: submit a form or click on a button or something else.\n\n**List of GET/POST request parameters for https://2captcha.com/in.php**\n\n| **Parameter** | **Type**               | **Required** | **Description** |\n| ------------- | ---------------------- | ------------ | --------------- |\n| key           | String                 | Yes          | [your API key](#solving_captchas)|\n| method        | String                 | Yes          | funcaptcha - defines that you're sending a FunCaptcha with token method|\n| publickey     | String                 | Yes          | Value of _pk_ or _data-pkey_ parameter you found on page|\n| surl          | String                 | No           | Value of _surl_ parameter you found on page|\n| pageurl       | String                 | Yes          | Full URL of the page where you see the FunCaptcha|\n| data\\[key\\]   | String                 | No           | Custom data to pass to FunCaptcha. \u003cbr>For example: data\\[blob\\]=stringValue|\n| userAgent     | String                 | No           | Tells us to use your user-agent value.|\n| header_acao   | Integer \u003cbr>Default: 0 | No           | 0 - disabled \u003cbr>1 - enabled. \u003cbr>If enabled `in.php` will include _Access-Control-Allow-Origin:\\*_ header in the response. \u003cbr>Used for cross-domain AJAX requests in web applications. Also supported by `res.php`. |\n| pingback      | String                 | No           | URL for pingback (callback) response that will be sent when captcha is solved. \u003cbr>URL should be registered on the server. [More info here](#pingback).                                                               |\n| json          | Integer \u003cbr>Default: 0 | No           | 0 - server will send the response as plain text \u003cbr>1 - tells the server to send the response as JSON                                                                                                                 |\n| soft_id       | Integer                | No           | ID of software developer. Developers who integrated their software with 2Captcha get reward: 10% of spendings of their software users.                                                                                |\n| proxy         | String                 | No           | Format: _login:password@123.123.123.123:3128_ \u003cbr>You can find more info about proxies [here](#proxies).                                                                                                              |\n| proxytype     | String                 | No           | Type of your proxy: HTTP, HTTPS, SOCKS4, SOCKS5.|\n\n**List of _GET_ request parameters for https://2captcha.com/res.php**\n\n| **GET parameter** | **Type**               | **Required** | **Description** |\n| ----------------- | ---------------------- | ------------ | --------------- |\n| key               | String                 | Yes          | [your API key](#solving_captchas)                                                                     |\n| action            | String                 | Yes          | get - get the asnwer for your captcha                                                                 |\n| id                | Integer                | Yes          | ID of captcha returned by in.php.                                                                     |\n| json              | Integer \u003cbr>Default: 0 | No           | 0 - server will send the response as plain text \u003cbr>1 - tells the server to send the response as JSON |\n\n**Request URL example:**\n\n    https://2captcha.com/res.php?key=1abc234de56fab7c89012d34e56fa7b8&action=get&id=2122988149\n\u003c/section>\n\n\u003csection id=\"solving_geetest\">\n\n#### Geetest\n\n> Geetest is a type of captcha where you have to move a piece of a puzzle or select some figures in the order.\n\nTo solve Geetest captcha with our service you have to:\n\n1.  Find the following Geetest captcha parameters on the target website (usually you can find them inside initGeetest function).\n\n    - `gt` \\- public website key (static)\n    - `challenge` \\- dynamic challenge key\n    - `api_server` \\- API domain (optional)\n\n> **Important:** you should get a new challenge value for each request to our API. Once captcha was loaded on the page the challenge value becomes invalid. You should inspect requests made to the website when page is loaded to identify a request that gets a new challenge value. Then you should make such request each time to get a valid challenge value.\n\n3.  Submit a _HTTP GET_ or _POST_ request to our API URL: `https://2captcha.com/in.php` with method set to _geetest_ providing values found on previous step in your request as values for corresponding request parameters and also full page URL as value for _pageurl_.  \n    You can find the full list of parameters in the [table below.](#geetest_post)\n\n    **Request URL example:**\n\n        https://2captcha.com/in.php?key=1abc234de56fab7c89012d34e56fa7b8&method=geetest&gt=f1ab2cdefa3456789012345b6c78d90e&challenge=12345678abc90123d45678ef90123a456b&api_server=api-na.geetest.com&pageurl=https://www.site.com/page/\n\n4.  If everything is fine server will return the ID of your captcha as plain text, like: _OK|2122988149_ or as JSON _{\"status\":1,\"request\":\"2122988149\"}_ if _json_ parameter was used.  \n    Otherwise server will return an [error code](#error_handling).\n5.  Make a 15-20 seconds timeout then submit a _HTTP GET_ request to our API URL: `https://2captcha.com/res.php` to get the result.  \n    The full list of parameters is in the [table below](#geetest_get).\n\n    If captcha is already solved server will return the response in JSON. The response contains three values: `challenge`, `validate` and `seccode`:\n\n        {\n        \"challenge\":\"1a2b3456cd67890e12345fab678901c2de\",\n        \"validate\":\"09fe8d7c6ba54f32e1dcb0a9fedc8765\",\n        \"seccode\":\"12fe3d4c56789ba01f2e345d6789c012|jordan\"\n        }\n\n    If captcha is not solved yet server will return _CAPCHA_NOT_READY_ result. Repeat your request in 5 seconds.\n\n    If something went wrong server will return an [error code](#error_handling).\n\n6.  Use the values received from our API to submit your request to the target website placing the values into corresponding request fields:\n\n    - `geetest_challenge`\n    - `geetest_validate`\n    - `geetest_seccode`\n\n**List of _GET/POST_ request parameters for https://2captcha.com/in.php**\n\n| **Parameter** | **Type**               | **Required** | **Description** |\n| ------------- | ---------------------- | ------------ | --------------- |\n| key           | String                 | Yes          | [your API key](#solving_captchas)                                                                                                                                                                                     |\n| method        | String                 | Yes          | geetest - defines that you're sending a Geetest captcha                                                                                                                                                               |\n| gt            | String                 | Yes          | Value of _gt_ parameter you found on target website                                                                                                                                                                   |\n| challenge     | String                 | Yes          | Value of _challenge_ parameter you found on target website                                                                                                                                                            |\n| api_server    | String                 | No           | Value of _api_server_ parameter you found on target website                                                                                                                                                           |\n| offline       | Number \u003cbr>Default: 0  | No           | In rare cases initGeetest can be called with _offline_ parameter. If the call uses _offline: true_, set the value to 1.                                                                                               |\n| new_captcha   | Number \u003cbr>Default: 0  | No           | In rare cases initGeetest can be called with _new_captcha_ parameter. If the call uses _new_captcha: true_, set the value to 1. Mostly used with _offline_ parameter.                                                 |\n| pageurl       | String                 | Yes          | Full URL of the page where you see Geetest captcha                                                                                                                                                                    |\n| header_acao   | Integer \u003cbr>Default: 0 | No           | 0 - disabled \u003cbr>1 - enabled. \u003cbr>If enabled `in.php` will include _Access-Control-Allow-Origin:\\*_ header in the response. \u003cbr>Used for cross-domain AJAX requests in web applications. Also supported by `res.php`. |\n| pingback      | String                 | No           | URL for pingback (callback) response that will be sent when captcha is solved. \u003cbr>URL should be registered on the server. [More info here](#pingback).                                                               |\n| json          | Integer \u003cbr>Default: 0 | No           | 0 - server will send the response as plain text \u003cbr>1 - tells the server to send the response as JSON                                                                                                                 |\n| soft_id       | Integer                | No           | ID of software developer. Developers who integrated their software with 2Captcha get reward: 10% of spendings of their software users.                                                                                |\n| proxy         | String                 | No           | Format: _login:password@123.123.123.123:3128_ \u003cbr>You can find more info about proxies [here](#proxies).                                                                                                              |\n| proxytype     | String                 | No           | Type of your proxy: HTTP, HTTPS, SOCKS4, SOCKS5.                                                                                                                                                                      |\n| userAgent     | String                 | No           | Your _userAgent_ that will be passed to our worker and used to solve the captcha.                                                                                                                                     |\n\n**List of _GET_ request parameters for https://2captcha.com/res.php**\n\n| **GET parameter** | **Type**               | **Required** | **Description**                                                      |\n| ----------------- | ---------------------- | ------------ | -------------------------------------------------------------------- |\n| key               | String                 | Yes          | [your API key](#solving_captchas)                                    |\n| action            | String                 | Yes          | get - get the asnwer for your captcha                                |\n| id                | Integer                | Yes          | ID of captcha returned by in.php.                                    |\n| json              | Integer \u003cbr>Default: 1 | No           | Server will alsways return the response as JSON for Geetest captcha. |\n\n**Request URL example:**\n\n    https://2captcha.com/res.php?key=1abc234de56fab7c89012d34e56fa7b8&action=get&id=2122988149\n\u003c/section>\n\n\u003csection id=\"geetest-v4\">\n\n#### Geetest v4 captcha\n\n> Geetest v4 is a new version of puzzle challenge, but you still have to move a piece of a puzzle to bypass it.\n\nTo solve Geetest v4 captcha with our service you need to:\n\n1.  find the `captcha_id` value in the page HTML source. Normally you will find the value inside script tag that include Geetest v4 javascript code on the page.\n2.  Submit a _HTTP GET_ or _POST_ request to our API URL: `https://2captcha.com/in.php` with method set to _geetest_v4_ providing the `captcha_id` found on the page and full page URL as value for _pageurl_.\n\n    **Request URL example:**\n\n        https://2captcha.com/in.php?key=1abc234de56fab7c89012d34e56fa7b8&method=geetest_v4&captcha_id=f1ab2cdefa3456789012345b6c78d90e&pageurl=https://www.site.com/page/\n\n3.  If everything is fine server will return the ID of your captcha as plain text, like: _OK|2122988149_ or as JSON _{\"status\":1,\"request\":\"2122988149\"}_ if _json_ parameter was used.  \n    Otherwise server will return an [error code](#error_handling).\n4.  Make a 15-20 seconds timeout then submit a _HTTP GET_ request to our API URL: `https://2captcha.com/res.php` to get the result.\n\n    If captcha is already solved server will return the response in JSON. The response example is shown below:\n\n        {\n        \"captcha_id\": \"e392e1d7fd421dc63325744d5a2b9c73\",\n        \"lot_number\": \"7fafac97a43d4701aee908afa49c73ba\",\n        \"pass_token\": \"6f1c27bd15777d5e9e6e1ba94604c28e7b13b94eed3f7c8b79ceaf4660da6320\",\n        \"gen_time\": \"1648112802\",\n        \"captcha_output\": \"FEB0Fyp2UEcHdeFQ0PEN-BHenkuCzlpmfX_OLXuf49iF_rPvbjYc9whxQg-sYOCPSzX_19HF0gCPgSoAZ-JPxE46ddE7L6y0J-D_5CcMnT0IYKHFK-NdcBo_m6nISKrpSH3QE9l5r53UTChJdR-bOJPO20gA0bgPEMvDCew7UkQ=\"\n        }\n\n    If captcha is not solved yet server will return _CAPCHA_NOT_READY_ result. Repeat your request in 5 seconds.\n\n    If something went wrong server will return an [error code](#error_handling).\n\n5.  Use the values received from our API to submit your request to the target website the same way it is done when you bypass the captcha manually.\n\n**List of _GET/POST_ request parameters for https://2captcha.com/in.php**\n\n| **Parameter** | **Type**               | **Required** | **Description** |\n| ------------- | ---------------------- | ------------ | --------------- |\n| key           | String                 | Yes          | [your API key](#solving_captchas)                                                                                                                                                                                     |\n| method        | String                 | Yes          | geetest_v4 - defines that you're sending the Geetest v4                                                                                                                                                               |\n| captcha_id    | String                 | Yes          | Value of _captcha_id_ parameter you found on target website                                                                                                                                                           |\n| pageurl       | String                 | Yes          | Full URL of the page where you see Geetest captcha                                                                                                                                                                    |\n| header_acao   | Integer \u003cbr>Default: 0 | No           | 0 - disabled \u003cbr>1 - enabled. \u003cbr>If enabled `in.php` will include _Access-Control-Allow-Origin:\\*_ header in the response. \u003cbr>Used for cross-domain AJAX requests in web applications. Also supported by `res.php`. |\n| pingback      | String                 | No           | URL for pingback (callback) response that will be sent when captcha is solved. \u003cbr>URL should be registered on the server. [More info here](#pingback).                                                               |\n| json          | Integer \u003cbr>Default: 0 | No           | 0 - server will send the response as plain text \u003cbr>1 - tells the server to send the response as JSON                                                                                                                 |\n| soft_id       | Integer                | No           | ID of software developer. Developers who integrated their software with 2Captcha get reward: 10% of spendings of their software users.                                                                                |\n| proxy         | String                 | No           | Format: _login:password@123.123.123.123:3128_ \u003cbr>You can find more info about proxies [here](#proxies).                                                                                                              |\n| proxytype     | String                 | No           | Type of your proxy: HTTP, HTTPS, SOCKS4, SOCKS5.                                                                                                                                                                      |\n\n**List of _GET_ request parameters for https://2captcha.com/res.php**\n\n| **GET parameter** | **Type**               | **Required** | **Description**                                                         |\n| ----------------- | ---------------------- | ------------ | ----------------------------------------------------------------------- |\n| key               | String                 | Yes          | [your API key](#solving_captchas)                                       |\n| action            | String                 | Yes          | get - get the asnwer for your captcha                                   |\n| id                | Integer                | Yes          | ID of captcha returned by in.php.                                       |\n| json              | Integer \u003cbr>Default: 1 | No           | Server will alsways return the response as JSON for Geetest v4 captcha. |\n\n**Request URL example:**\n\n    https://2captcha.com/res.php?key=1abc234de56fab7c89012d34e56fa7b8&action=get&id=2122988149\n\u003c/section>\n\n\u003csection id=\"solving_capy\">\n\n#### Capy Puzzle\n\n> Capy is a Puzzle captcha\n>\n> \u003cimg src=\"/assets/captcha-api-docs/img/capy_puzzle.png\" width=\"586\" height=\"572\" alt=\"Capy Puzzle captcha\" loading=\"lazy\" />\n\nSolving Capy is really simple:\n\n1.  Find the value of _capy_captchakey_ parameter in the source code of the page or in the script source link that looks like: https://api.capy.me/puzzle/get_js/?k=**PUZZLE_Abc1dEFghIJKLM2no34P56q7rStu8v**.\n\n    Also find the root part of the script URL, for example: _https://api.capy.me/_ and use it in `api_server` parameter.\n\n2.  Submit a _HTTP GET_ or _POST_ request to our API URL: `https://2captcha.com/in.php` with method set to _capy_ and provide the values found on previous step as _captchakey_ and _api_server_ and the full page URL as value for _pageurl_.  \n    You can find the full list of parameters in the [table below.](#capy_post)\n\n    **Request URL example:**\n\n        https://2captcha.com/in.php?key=1abc234de56fab7c89012d34e56fa7b8&method=capy&captchakey=PUZZLE_Abc1dEFghIJKLM2no34P56q7rStu8v&pageurl=http://mysite.com/\n\n3.  If everything is fine server will return the ID of your captcha as plain text, like: _OK|2122988149_ or as JSON _{\"status\":1,\"request\":\"2122988149\"}_ if _json_ parameter was used.  \n    Otherwise server will return an [error code](#error_handling).\n4.  Make a 15-20 seconds timeout then submit a _HTTP GET_ request to our API URL: `https://2captcha.com/res.php` to get the result.  \n    The full list of parameters is in the [table below](#capy_get).\n\n    If captcha is already solved server will respond in JSON and return the answer containing three values: `captchakey`, `challengekey` and `answer`\n\n        {\n        \"captchakey\": \"PUZZLE_Abc1dEFghIJKLM2no34P56q7rStu8v\",\n        \"challengekey\": \"y1Pu234nCwq56WnqB7y8TSZq0Qzp0ltK\",\n        \"answer\": \"0xax8ex0xax84x0xkx7qx0xux7qx0xux7gx0x18x7gx0x1sx76x0x26x6ix0x2qx6ix0x3ex68x0\"\n        }\n\n    If captcha is not solved yet server will return _CAPCHA_NOT_READY_ result. Repeat your request in 5 seconds.\n\n    If something went wrong server will return an [error code](#error_handling).\n\n5.  Use the values returned in your request to the target website passing them in the corresponding request fields:\n\n    - `capy_captchakey`\n    - `capy_challengekey`\n    - `capy_answer`\n\n**List of GET/POST request parameters for https://2captcha.com/in.php**\n\n| **Parameter** | **Type**                     | **Required** | **Description** |\n| ------------- | ---------------------------- | ------------ | --------------- |\n| key           | String                       | Yes          | [your API key](#solving_captchas)|\n| method        | String                       | Yes          | capy - defines that you're sending Capy|\n| captchakey    | String                       | Yes          | Value of _captchakey_ parameter you found on page|\n| api_server    | String                       | No           | The domain part of script URL you found on page. Default value: `https://jp.api.capy.me/`|\n| version       | String \u003cbr>Default: `puzzle` | No           | The version of captcha task: `puzzle` (assemble a puzzle) or `avatar` (drag an object).|\n| pageurl       | String                       | Yes          | Full URL of the page where you see the captcha|\n| header_acao   | Integer \u003cbr>Default: 0       | No           | 0 - disabled \u003cbr>1 - enabled. \u003cbr>If enabled `in.php` will include _Access-Control-Allow-Origin:\\*_ header in the response. \u003cbr>Used for cross-domain AJAX requests in web applications. Also supported by `res.php`. |\n| pingback      | String                       | No           | URL for pingback (callback) response that will be sent when captcha is solved. \u003cbr>URL should be registered on the server. [More info here](#pingback).                                                               |\n| json          | Integer \u003cbr>Default: 0       | No           | 0 - server will send the response as plain text \u003cbr>1 - tells the server to send the response as JSON |\n| soft_id       | Integer                      | No           | ID of software developer. Developers who integrated their software with 2Captcha get reward: 10% of spendings of their software users.                                                                                |\n| proxy         | String                       | No           | Format: _login:password@123.123.123.123:3128_ \u003cbr>You can find more info about proxies [here](#proxies).|\n| proxytype     | String                       | No           | Type of your proxy: HTTP, HTTPS, SOCKS4, SOCKS5.|\n\n**List of _GET_ request parameters for https://2captcha.com/res.php**\n\n| **GET parameter** | **Type**               | **Required** | **Description** |\n| ----------------- | ---------------------- | ------------ | --------------- |\n| key               | String                 | Yes          | [your API key](#solving_captchas)|\n| action            | String                 | Yes          | get - get the asnwer for your captcha|\n| id                | Integer                | Yes          | ID of captcha returned by in.php.|\n| json              | Integer \u003cbr>Default: 0 | No           | 0 - server will send the response as plain text \u003cbr>1 - tells the server to send the response as JSON |\n\n**Request URL example:**\n\n    https://2captcha.com/res.php?key=1abc234de56fab7c89012d34e56fa7b8&action=get&id=2122988149\n\u003c/section>\n\n\u003csection id=\"solving_tiktok\">\n\n#### TikTok\n\nThis method is temporary disabled.\n\u003c/section>\n\n\u003csection id=\"lemin\">\n\n#### Lemin Cropped Captcha\n\n> Lemin is a Puzzle captcha\n\nTo solve Lemin:\n\n1.  Find the value of _captcha_id_ parameter in the source code of the page or in the script source link that looks like: `https://api.leminnow.com/captcha/v1/cropped/**CROPPED\\_1abcd2f\\_a1234b567c890d12ef3a456bc78d901d**/js.`\n\n    Also find the root part of the script URL, for example: `_https://api.leminnow.com/_` and use it in `api_server` parameter.\n\n    And finally find the id of parent div element of the captcha script tag and use the id as value for `div_id` parameter.\n\n2.  Submit a _HTTP GET_ or _POST_ request to our API URL: `https://2captcha.com/in.php` with method set to _lemin_ and provide the values found on previous step as _captcha_id_, _div_id_ and _api_server_ and the full page URL as value for _pageurl_.  \n    You can find the full list of parameters in the [table below.](#lemin_post)\n\n    **Request example:**\n\n        {\n        \"key\": \"1abc234de56fab7c89012d34e56fa7b8\",\n        \"method\": \"lemin\",\n        \"captcha_id\": \"CROPPED_3dfdd5c_d1872b526b794d83ba3b365eb15a200b\",\n        \"div_id\": \"lemin-cropped-captcha\",\n        \"api_server\": \"https://api.leminnow.com/\",\n        \"pageurl\": \"https://2captcha.com/demo/lemin\",\n        \"json\":1\n        }\n\n\n3.  If everything is fine server will return the ID of your captcha\n\n        {\n        \"status\": 1,\n        \"request\": \"2122988149\"\n        }\n\n    Otherwise server will return an [error code](#error_handling).\n\n4.  Make a 15-20 seconds timeout then submit a _HTTP GET_ request to our API URL: `https://2captcha.com/res.php` to get the result.  \n    The full list of parameters is in the [table below](#lemin_get).\n\n    If captcha is already solved server will respond in JSON and return the answer containing the following values: `answer`, `challenge_id`\n\n        {\n        \"answer\":\"0x0xcgx0x0xbsx0xaxb8x0xkxakx0xux92x0x1sx76x0x2gx5ux0x34x4mx0x3ox3ex0x42x34x0x4cx2qx0x4mx2gx0x50x26x0x5ax26x0x5ax1sx0x50x1sx0x50x1ix0x50x18x0x50xux0x5axux0x5axkx0x5axax0x5ax0x_?_gAAAAABi4-Efd-oTDcTyTsnv7vbHGJW_ucw7GmoYCUxjfbvfMChlne2EIKYrVNV_TfBDN68WX_TDAEQ90xbWjatuYGkaUHsC1lzf7pM7dS8J-WhKQK1rBYaSOgAzGuNVhYX_zrNWHFFr\",\n        \"challenge_id\":\"a33515c5-9095-4c2a-b2eb-c86214d62f98\"\n        }\n\n    If captcha is not solved yet server will return _CAPCHA_NOT_READY_ result. Repeat your request in 5 seconds.\n\n    If something went wrong server will return an [error code](#error_handling).\n\n5.  Use the values returned in your request to the target website passing them in the corresponding request fields:\n\n    - `answer`\n    - `challenge_id`\n\n**List of GET/POST request parameters for https://2captcha.com/in.php**\n\n\n| **Parameter** | **Type**               | **Required** | **Description**|\n| ------------- | ---------------------- | ------------ | -------------- |\n| key           | String                 | Yes          | [your API key](#solving_captchas)|\n| method        | String                 | Yes          | lemin - defines that you're sending Lemin|\n| captcha_id    | String                 | Yes          | Value of _captcha_id_ parameter you found on page|\n| div_id        | String                 | No           | The id of captcha parent div element|\n| api_server    | String                 | No           | The domain part of script URL you found on page. Default value: `https://api.leminnow.com/`                                                                                                                           |\n| pageurl       | String                 | Yes          | Full URL of the page where you see the captcha|\n| header_acao   | Integer \u003cbr>Default: 0 | No           | 0 - disabled \u003cbr>1 - enabled. \u003cbr>If enabled `in.php` will include _Access-Control-Allow-Origin:\\*_ header in the response. \u003cbr>Used for cross-domain AJAX requests in web applications. Also supported by `res.php`. |\n| pingback      | String                 | No           | URL for pingback (callback) response that will be sent when captcha is solved. \u003cbr>URL should be registered on the server. [More info here](#pingback).                                                               |\n| json          | Integer \u003cbr>Default: 0 | No           | 0 - server will send the response as plain text \u003cbr>1 - tells the server to send the response as JSON                                                                                                                 |\n| soft_id       | Integer                | No           | ID of software developer. Developers who integrated their software with 2Captcha get reward: 10% of spendings of their software users.                                                                                |\n| proxy         | String                 | No           | Format: _login:password@123.123.123.123:3128_ \u003cbr>You can find more info about proxies [here](#proxies).                                                                                                              |\n| proxytype     | String                 | No           | Type of your proxy: HTTP, HTTPS, SOCKS4, SOCKS5.|\n\n**List of _GET_ request parameters for https://2captcha.com/res.php**\n\n| **GET parameter** | **Type**               | **Required** | **Description** |\n| ----------------- | ---------------------- | ------------ | --------------- |\n| key               | String                 | Yes          | [your API key](#solving_captchas)|\n| action            | String                 | Yes          | get - get the asnwer for your captcha|\n| id                | Integer                | Yes          | ID of captcha returned by in.php.|\n| json              | Integer \u003cbr>Default: 0 | No           | 0 - server will send the response as plain text \u003cbr>1 - tells the server to send the response as JSON |\n\n**Request URL example:**\n\n    https://2captcha.com/res.php?key=1abc234de56fab7c89012d34e56fa7b8&action=get&id=2122988149\n\u003c/section>\n\n\u003csection id=\"turnstile\">\n\n#### Cloudflare Turnstile\n\n> Cloudflare Turnstile - is a captha made by Cloudflare\n\nThere are two cases for Turnstile:\n\n1 - standalone captcha widget placed on a page of a website, protecting a form from automated submission. For this case just need to extract the _sitekey_ and send it to our API with full page URL. Then just place the token into `cf-turnstile-response` and `g-recaptcha-response` fields and submit the form. Also, there can be a callback defined in `turnstile.render` call.\n\n2 - captcha on Turnstile Challenge page on websites proxied proxied through Cloudflare. In this case you MUST extract the values of `cData`, `chlPageData` and `action` parameters and use the User-Agent value returned from our API. See more info on this case below.\n\n##### Standalone Turnstile captcha\n\n**Request example:**\n\n    {\n    \"method\": \"turnstile\",\n    \"key\": \"YOUR_API_KEY\",\n    \"sitekey\": \"3x00000000000000000000FF\",\n    \"pageurl\": \"https://2captcha.com/demo/cloudflare-turnstile\",\n    \"json\": 1\n    }\n\n**Response example:**\n\n    {\n    \"status\": 1,\n    \"request\": \"74327409378\"\n    }\n\nUse the returned ID to request the result from `res.php` endpoint of our API\n\n##### Turnstile captcha on Cloudflare Challenge pages\n\n\u003cimg src=\"/assets/captcha-api-docs/img/turnstile-challege-page.png\" width=\"1384\" height=\"1264\" alt=\"Turnstile Challege Page\" loading=\"lazy\" />\n\nIf you need to bypass the Turnstile on Cloudflare Challenge pages you also MUST provide the following additional parameters:\n\n- action\n- data\n- pagedata\n\nAnd also you MUST set the User-Agent of your browser or HTTP client to the value returned from our API together with the token.\n\nFor cases when Turnstile is used standalone on a website, it is not required.\n\n###### How to extract the required parameters\n\nTo extract the parameters you can redefine the `turnstile.rended` method to intercept the parameters passed when the method is called. For example, you can inject the following JavaScript code to the page. The code should be executed before the Turnstile widget is loaded.\n\n    const i = setInterval(()=>{\n    if (window.turnstile) {\n    clearInterval(i)\n    window.turnstile.render = (a,b) => {\n    let p = {\n    method: \"turnstile\",\n    key: \"YOUR_API_KEY\",\n    sitekey: b.sitekey,\n    pageurl: window.location.href,\n    data: b.cData,\n    pagedata: b.chlPageData,\n    action: b.action,\n    userAgent: navigator.userAgent,\n    json: 1\n    }\n    console.log(JSON.stringify(p))\n    window.tsCallback = b.callback\n    return 'foo'\n    }\n    }\n    },50)\n\n**Request example:**\n\n    {\n    \"key\": \"YOUR_API_KEY\",\n    \"method\": \"turnstile\",\n    \"sitekey\": \"0x0AAAAAAADnPIDROzbs0Aaj\",\n    \"data\": \"7fab0000b0e0ff00\",\n    \"pagedata\": \"3gAFo2...0ME1UVT0=\",\n    \"pageurl\": \"https://2captcha.com/\",\n    \"action\": \"managed\",\n    \"json\": 1\n    }\n\n**Response example:**\n\n    {\n    \"status\": 1,\n    \"request\": \"74327409378\"\n    }\n\nUse the returned id to request the result from `res.php` endpoint of our API\n\n`\n\nhttps://2captcha.com/res.php?key=1abc234de56fab7c89012d34e56fa7b8&action=get&id=74327409378&json=1\n\n`\n\n**Result example:**\n\n    {\n    \"status\": 1,\n    \"request\": \"0.4uMMZZdSfsVM8...610cd090\",\n    \"useragent\": \"Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/115.0.0.0 Safari/537.36\"\n    }\n\n**List of GET/POST request parameters for https://2captcha.com/in.php**\n\n| **Parameter**  | **Type**               | **Required** | **Description** |\n| -------------- | ---------------------- | ------------ | --------------- |\n| **key**        | String                 | Yes          | [your API key](#solving_captchas)                                                                                                                                                                                     |\n| **method**     | String                 | Yes          | turnstile - defines that you're sending Cloudflare Turnstile                                                                                                                                                          |\n| **sitekey**    | String                 | Yes          | Value of _sitekey_ parameter you found on page                                                                                                                                                                        |\n| **pageurl**    | String                 | Yes          | Full URL of the page where you see the captcha                                                                                                                                                                        |\n| **_action_**   | String                 | No\\*         | Value of optional _action_ parameter you found on page, can be defined in `data-action` attribute or passed to `turnstile.render` call                                                                                |\n| **_data_**     | String                 | No\\*         | The value of `cData` passed to `turnstile.render` call. Also can be defined in `data-cdata` attribute                                                                                                                 |\n| **_pagedata_** | String                 | No\\*         | The value of `chlPageData` passed to `turnstile.render` call                                                                                                                                                          |\n| header_acao    | Integer \u003cbr>Default: 0 | No           | 0 - disabled \u003cbr>1 - enabled. \u003cbr>If enabled `in.php` will include _Access-Control-Allow-Origin:\\*_ header in the response. \u003cbr>Used for cross-domain AJAX requests in web applications. Also supported by `res.php`. |\n| pingback       | String                 | No           | URL for pingback (callback) response that will be sent when captcha is solved. \u003cbr>URL should be registered on the server. [More info here](#pingback).                                                               |\n| json           | Integer \u003cbr>Default: 0 | No           | 0 - server will send the response as plain text \u003cbr>1 - tells the server to send the response as JSON                                                                                                                 |\n| soft_id        | Integer                | No           | ID of software developer. Developers who integrated their software with 2Captcha get reward: 10% of spendings of their software users.                                                                                |\n| proxy          | String                 | No           | Format: _login:password@123.123.123.123:3128_ \u003cbr>You can find more info about proxies [here](#proxies).                                                                                                              |\n| proxytype      | String                 | No           | Type of your proxy: HTTP, HTTPS, SOCKS4, SOCKS5.                                                                                                                                                                      |\n\n\\* \\- parameters required to bypass Turnstile on Cloudflare Challenge pages\n\n**List of _GET_ request parameters for https://2captcha.com/res.php**\n\n| **GET parameter** | **Type**               | **Required** | **Description** |\n| ----------------- | ---------------------- | ------------ | --------------- |\n| key               | String                 | Yes          | [your API key](#solving_captchas)                                                         |\n| action            | String                 | Yes          | get - get the asnwer for your captcha                                                     |\n| id                | Integer                | Yes          | ID of captcha returned by in.php.                                                         |\n| json              | Integer \u003cbr>Default: 0 | Yes          | Always set to 1 for turnstile to get the response as JSON containing the User-Agent value |\n\u003c/section>\n\n\u003csection id=\"amazon-waf\">\n\n#### Amazon WAF Captcha\n\n> Amazon WAF Captcha also known as AWS WAF Captcha is a part of Intelligent threat mitigation for Amazon AWS\n\nWe support two methods for solving this type of captcha: with `challenge_script` and with `jsapiScript`\n\n**challenge_script option:**\nTo bypass the captcha you need to grab the following parameters:\n\n- `sitekey` \\- is a value of `key` parameter in the page source\n- `iv` \\- is a value of `iv` parameter in the page source\n- `context` \\- is a value of `context` parameter in the page source\n- `challenge_script` \\- the URL of `challenge.js` script\n- `captcha_script`\\- the URL of `captcha.js`script\n- `pageurl` \\- is the full URL of page where you were challenged by the captcha\n\n**List of GET/POST request parameters for https://2captcha.com/in.php**\n\n| **Parameter**    | **Type**               | **Required** | **Description** |\n| ---------------- | ---------------------- | ------------ | --------------- |\n| key              | String                 | Yes          | [your API key](#solving_captchas) |\n| method           | String                 | Yes          | `amazon_waf` \\- defines that you're sending Amazon WAF Captcha |\n| sitekey          | String                 | Yes          | Value of `key` parameter you found on the page |\n| iv               | String                 | Yes          | Value of `iv` parameter you found on the page |\n| context          | String                 | Yes          | Value of optional `context` parameter you found on page |\n| pageurl          | String                 | Yes          | Full URL of the page where you see the captcha |\n| challenge_script | String                 | No           | The source URL of `challenge.js` script on the page |\n| captcha_script   | String                 | No           | The source URL of `captcha.js` script on the page |\n| header_acao      | Integer \u003cbr>Default: 0 | No           | 0 - disabled \u003cbr>1 - enabled. \u003cbr>If enabled `in.php` will include _Access-Control-Allow-Origin:\\*_ header in the response. \u003cbr>Used for cross-domain AJAX requests in web applications. Also supported by `res.php`. |\n| pingback         | String                 | No           | URL for pingback (callback) response that will be sent when captcha is solved. \u003cbr>URL should be registered on the server. [More info here](#pingback).                                                               |\n| json             | Integer \u003cbr>Default: 0 | No           | 0 - server will send the response as plain text \u003cbr>1 - tells the server to send the response as JSON|\n| soft_id          | Integer                | No           | ID of software developer. Developers who integrated their software with 2Captcha get reward: 10% of spendings of their software users.                                                                                |\n| proxy            | String                 | No           | Format: _login:password@123.123.123.123:3128_ \u003cbr>You can find more info about proxies [here](#proxies).|\n| proxytype        | String                 | No           | Type of your proxy: HTTP, HTTPS, SOCKS4, SOCKS5. |\n\n**Request body example:**\n\n    {\n    \"key\":\"1abc234de56fab7c89012d34e56fa7b8\",\n    \"method\":\"amazon_waf\",\n    \"sitekey\":\"AQIDAHjcYu/GjX+QlghicBgQ/7bFaQZ+m5FKCMDnO+vTbNg96AHMDLodoefdvyOnsHMRtEKQAAAAfjB8BgkqhkiG9w0BBwagbzBtAgEAMGgGCSqGSIb3DQEHATAeBglghkgBZQMEAS4wEQQMUX+ZqwwuANRnZujSAgEQgDvHSxUQmVBuyUtumoW2n4ccTG7xQN1r3X/zz41qmQaYv9SSSvQrjIoDXKaUQ23tVb4ii8+uljuRdz/HPA==\",\n    \"pageurl\":\"https://non-existent-example.execute-api.us-east-1.amazonaws.com/latest\",\n    \"context\":\"9BUgmlm48F92WUoqv97a49ZuEJJ50TCk9MVr3C7WMtQ0X6flVbufM4n8mjFLmbLVAPgaQ1Jydeaja94iAS49ljb+sUNLoukWedAQZKrlY4RdbOOzvcFqmD/ZepQFS9N5w15Exr4VwnVq+HIxTsDJwRviElWCdzKDebN/mk8/eX2n7qJi5G3Riq0tdQw9+C4diFZU5E97RSeahejOAAJTDqduqW6uLw9NsjJBkDRBlRjxjn5CaMMo5pYOxYbGrM8Un1JH5DMOLeXbq1xWbC17YSEoM1cRFfTgOoc+VpCe36Ai9Kc=\",\n    \"challenge_script\":\"https://41bcdd4fb3cb.610cd090.us-east-1.token.awswaf.com/41bcdd4fb3cb/0d21de737ccb/cd77baa6c832/challenge.js\",\n    \"captcha_script\":\"https://41bcdd4fb3cb.610cd090.us-east-1.captcha.awswaf.com/41bcdd4fb3cb/0d21de737ccb/cd77baa6c832/captcha.js\",\n    \"iv\":\"CgAHbCe2GgAAAAAj\",\n    \"json\":1\n    }\n\n**jsapiScript option:**\nTo bypass the captcha you need to grab the following parameters:\n\n- `sitekey` \\- is a value of `key` parameter in the page source\n- `jsapiScript` \\- the URL of `jsapiScript.js` script\n- `pageurl` \\- is the full URL of page where you were challenged by the captcha\n\n**List of GET/POST request parameters for https://2captcha.com/in.php**\n\n| **Parameter**    | **Type**               | **Required** | **Description** |\n| ---------------- | ---------------------- | ------------ | --------------- |\n| key              | String                 | Yes          | [your API key](#solving_captchas) |\n| method           | String                 | Yes          | `amazon_waf` \\- defines that you're sending Amazon WAF Captcha |\n| sitekey          | String                 | Yes          | Value of `key` parameter you found on the page |\n| pageurl          | String                 | Yes          | Full URL of the page where you see the captcha |\n| jsapiScript      | String                 | Yes          | The source URL of `jsapiScript.js` script on the page |\n| header_acao      | Integer \u003cbr>Default: 0 | No           | 0 - disabled \u003cbr>1 - enabled. \u003cbr>If enabled `in.php` will include _Access-Control-Allow-Origin:\\*_ header in the response. \u003cbr>Used for cross-domain AJAX requests in web applications. Also supported by `res.php`. |\n| pingback         | String                 | No           | URL for pingback (callback) response that will be sent when captcha is solved. \u003cbr>URL should be registered on the server. [More info here](#pingback).                                                               |\n| json             | Integer \u003cbr>Default: 0 | No           | 0 - server will send the response as plain text \u003cbr>1 - tells the server to send the response as JSON|\n| soft_id          | Integer                | No           | ID of software developer. Developers who integrated their software with 2Captcha get reward: 10% of spendings of their software users.                                                                                |\n| proxy            | String                 | No           | Format: _login:password@123.123.123.123:3128_ \u003cbr>You can find more info about proxies [here](#proxies).|\n| proxytype        | String                 | No           | Type of your proxy: HTTP, HTTPS, SOCKS4, SOCKS5. |\n\n**Request body example:**\n\n    {\n    \"key\":\"1abc234de56fab7c89012d34e56fa7b8\",\n    \"method\":\"amazon_waf\",\n    \"sitekey\":\"AQIDAHjcYu/GjX+QlghicBgQ/7bFaQZ+m5FKCMDnO+vTbNg96AHMDLodoefdvyOnsHMRtEKQAAAAfjB8BgkqhkiG9w0BBwagbzBtAgEAMGgGCSqGSIb3DQEHATAeBglghkgBZQMEAS4wEQQMUX+ZqwwuANRnZujSAgEQgDvHSxUQmVBuyUtumoW2n4ccTG7xQN1r3X/zz41qmQaYv9SSSvQrjIoDXKaUQ23tVb4ii8+uljuRdz/HPA==\",\n    \"pageurl\":\"https://non-existent-example.execute-api.us-east-1.amazonaws.com/latest\",\n    \"jsapiScript\":\"https://82d925f87a91.edge.captcha-sdk.awswaf.com/82d925f87a91/jsapi.js\"\n    \"json\":1\n    }\n\nIf everything is OK you will receive the response with your captcha ID `{\"status\":1,\"request\":\"2122988149\"}` or an [error code](#error_handling) if your request was incorrect.\n\nMake a 15-20 seconds timeout then submit a _HTTP GET_ request to our API URL: `https://2captcha.com/res.php` to get the result.  \nThe full list of parameters is in the [table below](#amazon-waf-get).\n\nIf captcha is already solved server will respond in the following format:\n\n    {\n    \"status\": 1,\n    \"request\": {\n    \"captcha_voucher\":\"eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJ0aW1lc3RhbXAiOiIyMDIzLTAzLTIwVDEzOjM2OjM3Ljg1Nzk5MjEyMFoiLCJjbGllbnRfaWQiOiIxOTI4NTIzMi1jMTRiLTRlMDUtYjQ2OC02ODBiYjE3ZWNhM2MiLCJkb21haW4iOiJlZnc0N2ZwYWQ5LmV4ZWN1dGUtYXBpLnVzLWVhc3QtMS5hbWF6b25hd3MuY29tIiwiZXhwIjoxNjc5MzE5Mzk3LCJwcm9ibGVtIjoiYmlmdXJjYXRlZHpvbyIsInByb2JsZW1fb3ZlcnJpZGUiOmZhbHNlLCJudW1fc29sdXRpb25zX3Byb3ZpZGVkIjoxfQ.qgSX4tZqZQwXNzVQgVe3OsUMR3vf7-fLWNzZKIHXN-4\",\n    \"existing_token\":\"25b7ee41-2d4e-46f7-a52e-2d53d10c199a:EQoAf2Zd5kEWAAAA:qGp2oQxLMEny1L7qBP6uRYJ/DRDRL2v50309/M/O7Gul+k1zh6ZqDVGNbrG6LYmUD+4dSYJMNM2IuxgQYbVHp83OwF8p/BgolBwp45CulWxzCjyEGy1/degDo5ivZ8AjFVymUJI/vCq0BOhD4GGZqR8oveOYcUN7OIJy5mtE2reNI92qCiRCqEr8ccZo02DsBDBDQEQOR+q17gQn2vn0Hp3Ss7A=\"\n    }\n    }\n\n\n\n\n\nIf captcha is not solved yet server will return _CAPCHA_NOT_READY_ result. Repeat your request in 5 seconds.\n\nIf something went wrong server will return an [error code](#error_handling).\n\nUse the values returned in your interaction with the target website. Normally the values are sent in the corresponding fields of the POST request, but you definetly need to check how it is used on your case.\n\n**List of _GET_ request parameters for https://2captcha.com/res.php**\n\n| **GET parameter** | **Type**               | **Required** | **Description** |\n| ----------------- | ---------------------- | ------------ | --------------- |\n| key               | String                 | Yes          | [your API key](#solving_captchas)                                                                     |\n| action            | String                 | Yes          | get - get the asnwer for your captcha                                                                 |\n| id                | Integer                | Yes          | ID of captcha returned by in.php.                                                                     |\n| json              | Integer \u003cbr>Default: 0 | No           | 0 - server will send the response as plain text \u003cbr>1 - tells the server to send the response as JSON |\n\n**Request URL example:**\n\n    https://2captcha.com/res.php?key=1abc234de56fab7c89012d34e56fa7b8&action=get&id=2122988149\n\u003c/section>\n\n\u003csection id=\"mtcaptcha\">\n\n#### MTCaptcha method\n\nToken-based method for automated solving of MTCaptcha.\n\n\n**Method specification**\n\n| **Parameter**     | **Type**   | **Required**     | **Description** |\n| ----------------- | ---------- | ---------------- | -------------------------------------------------------------------------------- |\n| **key**           | _String_   | **Yes**          | [your API key](#solving_captchas) |\n| **method**        | _String_   | **Yes**          | `mt_captcha` |\n| **sitekey**       | _String_   | **Yes**          | The value of `sitekey` parameter found on the page |\n| **pageurl**       | _String_   | **Yes**          | Full URL of the page where you solve the captcha |\n| proxy             | _String_   | No               | Your proxy: _login:password@123.123.123.123:3128_ \u003cbr>You can find more info about proxies [here](#proxies)|\n| proxytype         | _String_   | No               | Type of your proxy: HTTP, HTTPS, SOCKS4, SOCKS5|\n| json              | _Number_   | No               | Set to `1` to get the response as JSON. Default: `0`  |\n| soft_id           | _Number_   | No               | ID of software developer. Developers who integrated their software with 2Captcha get reward: 10% of spendings of their software users |\n| pingback          | _String_   | No               | URL for pingback (callback) response that will be sent when captcha is solved. \u003cbr>URL should be registered on the server. [More info here](#pingback). |\n\n\n##### Request example\n\nEndpoint: `https://2captcha.com/in.php`\nMethod: `POST`\n\n```json\n{\n    \"key\":\"YOUR_API_KEY\",\n    \"method\":\"mt_captcha\",\n    \"sitekey\":\"MTPublic-KzqLY1cKH\",\n    \"pageurl\":\"https://2captcha.com/demo/mtcaptcha\",\n    \"json\": 1\n}\n```\n\nRequest will return the id of your captcha. Use it to get the result.\n\n\n**Getting the result**\n\n##### Request example\n\nEndpoint: `https://2captcha.com/res.php`\nMethod: `POST`\n\n```json\n{\n    \"key\": \"YOUR_API_KEY\",\n    \"action\": \"get\",\n    \"id\": 2122988149,\n    \"json\": 1\n}\n```\n\n##### Result example\n\n```json\n{\n    \"status\": 1,\n    \"request\": \"v1(fa78e9fe,c64ca2f..8e476cd94a6a,Hx3jMg3)\"\n}\n```\n\n\u003c/section>\n\n\n\u003csection id=\"cutcaptcha\">\n\n#### Cutcaptcha method\n\nToken-based method for automated solving of Cutcaptcha.\n\nThe token received must be set as the `value` attribute of the `input#cap_token` element and/or passed to the callback function.\n\n\n**Method specification**\n\n| **Parameter**     | **Type**   | **Required**     | **Description** |\n| ----------------- | ---------- | ---------------- | -------------------------------------------------------------------------------- |\n| **key**           | _String_   | **Yes**          | [your API key](#solving_captchas) |\n| **method**        | _String_   | **Yes**          | `cutcaptcha` |\n| **misery_key**    | _String_   | **Yes**          | The value of `CUTCAPTCHA_MISERY_KEY` variable defined on page |\n| **api_key**       | _String_   | **Yes**          | The value of `data-apikey` attribute of iframe's body. Also the name of javascript file included on the page |\n| **pageurl**       | _String_   | **Yes**          | Full URL of the page where you solve the captcha |\n| proxy             | _String_   | No               | Your proxy: _login:password@123.123.123.123:3128_ \u003cbr>You can find more info about proxies [here](#proxies)|\n| proxytype         | _String_   | No               | Type of your proxy: HTTP, HTTPS, SOCKS4, SOCKS5|\n| json              | _Number_   | No               | Set to `1` to get the response as JSON. Default: `0`  |\n| soft_id           | _Number_   | No               | ID of software developer. Developers who integrated their software with 2Captcha get reward: 10% of spendings of their software users |\n| pingback          | _String_   | No               | URL for pingback (callback) response that will be sent when captcha is solved. \u003cbr>URL should be registered on the server. [More info here](#pingback). |\n\n\n##### Request example\n\nEndpoint: `https://2captcha.com/in.php`\nMethod: `POST`\n\n```json\n{\n    \"key\": \"YOUR_API_KEY\",\n    \"method\": \"cutcaptcha\",\n    \"misery_key\": \"a1488b66da00bf332a1488993a5443c79047e752\",\n    \"api_key\": \"SAb83IIB\",\n    \"pageurl\": \"https://example.cc/foo/bar.html\",\n    \"json\": 1\n}\n```\n\nRequest will return the id of your captcha. Use it to get the result.\n\n\n**Getting the result**\n\n##### Request example\n\nEndpoint: `https://2captcha.com/res.php`\nMethod: `POST`\n\n```json\n{\n    \"key\": \"YOUR_API_KEY\",\n    \"action\": \"get\",\n    \"id\": 2122988149,\n    \"json\": 1\n}\n```\n\n##### Result example\n\n```json\n{\n    \"status\": 1,\n    \"request\": \"BazM23cpFUUyAAAdqPwNEDZx0REtH3ss\"\n}\n```\n\n##### Using the token\n\nUse the returned token as a value for  `input` with `id = cap_token`, then submit it's parent form, for example:\n\n```js\ndocument.querySelector('input#cap_token').value='BazM23cpFUUyAAAdqPwNEDZx0REtH3ss'\ndocument.querySelector('form').submit()\n```\n\nIf there's a callback function defined, you can call it passing the token as argument:\n\n```js\ncapResponseCallback('BazM23cpFUUyAAAdqPwNEDZx0REtH3ss')\n```\n\n\n\u003c/section>\n\n\n\u003csection id=\"friendly-captcha\">\n\n#### Friendly Captcha method\n\nToken-based method for automated solving of Friendly Captcha.\n\nThe token received must be set as the `value` attribute of the `input#cap_token` element and/or passed to the callback function.\n\n> **Important:** To successfully use the received token, the captcha widget must not be loaded on the page. To do this, you need to abort request to `/friendlycaptcha/...module.min.js` on the page. When the captcha widget is already loaded on the page, there is a high probability that the received token will not work.\n\n\n**Method specification**\n\n| **Parameter**     | **Type**   | **Required**     | **Description** |\n| ----------------- | ---------- | ---------------- | -------------------------------------------------------------------------------- |\n| **key**           | _String_   | **Yes**          | [your API key](#solving_captchas) |\n| **method**        | _String_   | **Yes**          | `friendly_captcha` |\n| **sitekey**       | _String_   | **Yes**          | The value of `data-sitekey` attribute of captcha's `div` element on page. |\n| **pageurl**       | _String_   | **Yes**          | Full URL of the page where you solve the captcha |\n| version           | _String_   | No               | **Friendly Captcha** version. \u003cbr>`v1` — Friendly Captcha V1. \u003cbr>`v2` — Friendly Captcha V2. \u003cbr> Default: `v1`. See the official Friendly Captcha documentation for more details on version differences. |\n| module_script     | _String_   | No               | URL of the **Friendly Captcha** script with the `type=\"module\"` attribute, found on the captcha page. |\n| nomodule_script   | _String_   | No               | URL of the **Friendly Captcha** script with the `nomodule` attribute, found on the captcha page. |\n| proxy             | _String_   | No               | Your proxy: _login:password@123.123.123.123:3128_ \u003cbr>You can find more info about proxies [here](#proxies)|\n| proxytype         | _String_   | No               | Type of your proxy: HTTP, HTTPS, SOCKS4, SOCKS5|\n| json              | _Number_   | No               | Set to `1` to get the response as JSON. Default: `0`  |\n| soft_id           | _Number_   | No               | ID of software developer. Developers who integrated their software with 2Captcha get reward: 10% of spendings of their software users |\n| pingback          | _String_   | No               | URL for pingback (callback) response that will be sent when captcha is solved. \u003cbr>URL should be registered on the server. [More info here](#pingback). |\n\n\n\n##### Request example\n\nEndpoint: `https://2captcha.com/in.php`\nMethod: `POST`\n\nFriendly Captcha V1:\n```json\n{\n    \"key\": \"YOUR_API_KEY\",\n    \"method\": \"friendly_captcha\",\n    \"sitekey\": \"2FZFEVS1FZCGQ9\",\n    \"pageurl\": \"https://example.com\",\n    \"version\": \"v1\",\n    \"module_script\": \"https://cdn.example.com/static/js/friendly-challenge/@0.9.1/widget.module.min.js\",\n    \"nomodule_script\": \"https://cdn.example.com/static/js/friendly-challenge/@0.9.1/widget.js\",\n    \"json\": 1\n}\n```\n\nFriendly Captcha V2:\n```json\n    \"key\": \"YOUR_API_KEY\",\n    \"method\": \"friendly_captcha\",\n    \"sitekey\": \"2FZFEVS1FZCGQ9\",\n    \"pageurl\": \"https://example.com\",\n    \"version\": \"v2\",\n    \"module_script\": \"https://cdn.example.com/v2/widget.module.min.js\",\n    \"nomodule_script\": \"https://cdn.example.com/v2/widget.js\",\n    \"json\": 1\n```\n\nRequest will return the id of your captcha. Use it to get the result.\n\n**Getting the result**\n\n##### Request example\n\nEndpoint: `https://2captcha.com/res.php`\nMethod: `POST`\n\n```json\n{\n    \"key\": \"YOUR_API_KEY\",\n    \"action\": \"get\",\n    \"id\": 2122988149,\n    \"json\": 1\n}\n```\n\n##### Result example\n\n```json\n{\n    \"status\": 1,\n    \"request\": \"f8b10f4ad796484bae963b1ebe3ce2bb.ZXL8Z...AAAAAA.AgAD\"\n}\n```\n\n##### Using the token\n\nUse the returned token as a value for  `input` with `name = frc-captcha-solution`, then submit it's parent form, for example:\n\n```js\ndocument.querySelector('input.frc-captcha-solution').value='f8b10f4ad796484bae963b1ebe3ce2bb.ZXL8Z...AAAAAA.AgAD'\ndocument.querySelector('form').submit()\n```\n\nPlease note, that form name can be customized with `data-solution-field-name` attribute, then you need to use the name set as the attribute's value.\n\n\nIf there's a callback function defined, you can call it passing the token as argument. For example, if `data-callback=\"doneCallback\"` you should run it as:\n\n```js\ndoneCallback('f8b10f4ad796484bae963b1ebe3ce2bb.ZXL8Z...AAAAAA.AgAD')\n```\n\n\u003c/section>\n\n\n\u003csection id=\"atb-captcha\">\n\n#### atbCAPTCHA method\n\nToken-based method for automated solving of atbCAPTCHA.\n\n\n**Method specification**\n\n| **Parameter**     | **Type**   | **Required**     | **Description** |\n| ----------------- | ---------- | ---------------- | -------------------------------------------------------------------------------- |\n| **key**           | _String_   | **Yes**          | [your API key](#solving_captchas) |\n| **method**        | _String_   | **Yes**          | `atb_captcha` |\n| **app_id**        | _String_   | **Yes**          | The value of `appId` parameter in the website source code. |\n| **api_server**    | _String_   | **Yes**          | The value of `apiServer` parameter in the website source code. |\n| **pageurl**       | _String_   | **Yes**          | The full URL of target web page where the captcha is loaded. We do not open the page, not a problem if it is available only for authenticated users |\n| proxy             | _String_   | No               | Your proxy: _login:password@123.123.123.123:3128_ \u003cbr>You can find more info about proxies [here](#proxies)|\n| proxytype         | _String_   | No               | Type of your proxy: HTTP, HTTPS, SOCKS4, SOCKS5|\n| json              | _Number_   | No               | Set to `1` to get the response as JSON. Default: `0`  |\n\n\n##### Request example\n\nEndpoint: `https://2captcha.com/in.php`\nMethod: `POST`\n\n```json\n{\n    \"key\": \"YOUR_API_KEY\",\n    \"method\": \"atb_captcha\",\n    \"app_id\": \"af23e041b22d000a11e22a230fa8991c\",\n    \"api_server\": \"https://cap.aisecurius.com\",\n    \"pageurl\": \"https://www.example.com/\",\n    \"json\": 1\n}\n```\n\nRequest will return the id of your captcha. Use it to get the result.\n\n\n**Getting the result**\n\n##### Request example\n\nEndpoint: `https://2captcha.com/res.php`\nMethod: `POST`\n\n```json\n{\n    \"key\": \"YOUR_API_KEY\",\n    \"action\": \"get\",\n    \"id\": 2122988149,\n    \"json\": 1\n}\n```\n\n##### Result example\n\n```json\n{\n    \"status\": 1,\n    \"request\": \"sl191suxzluwxxh6f:\"\n}\n```\n\n##### Using the token\n\nThe token is passed to a callback function defined in `success` property during the captcha initialization. This function is usually used to make a request to the website backend where the token is verified. You can execute the callback function passing the token as an argument or build a request to the backend using passing the token.\n\n```javascript\nconst myCallbackFunction = (token) {\n    // verify the token\n}\nvar myCaptcha = as.Captcha(document.getElementById('demo'), {\n    appId: 'af23e041b22d000a11e22a230fa8991c',\n    success: myCallbackFunction\n})\n```\n\n\u003c/section>\n\n\u003csection id=\"tencent\">\n\n#### Tencent method\n\nToken-based method for automated solving of Tencent captcha.\n\n\n**Method specification**\n\n| **Parameter**     | **Type**   | **Required**     | **Description** |\n| ----------------- | ---------- | ---------------- | -------------------------------------------------------------------------------- |\n| **key**           | _String_   | **Yes**          | [your API key](#solving_captchas) |\n| **method**        | _String_   | **Yes**          | `tencent` |\n| **app_id**        | _String_   | **Yes**          | The value of `appId` parameter in the website source code. |\n| **pageurl**       | _String_   | **Yes**          | The full URL of target web page where the captcha is loaded. We do not open the page, not a problem if it is available only for authenticated users |\n| captcha_script    | _String_   | **No**           | Captcha script URL from the page source code. Default: `https://turing.captcha.qcloud.com/TCaptcha.js` |\n| proxy             | _String_   | No               | Your proxy: _login:password@123.123.123.123:3128_ \u003cbr>You can find more info about proxies [here](#proxies)|\n| proxytype         | _String_   | No               | Type of your proxy: HTTP, HTTPS, SOCKS4, SOCKS5|\n| json              | _Number_   | No               | Set to `1` to get the response as JSON. Default: `0`  |\n\n\n##### Request example\n\nEndpoint: `https://2captcha.com/in.php`\nMethod: `POST`\n\n```json\n{\n    \"key\": \"YOUR_API_KEY\",\n    \"method\": \"tencent\",\n    \"app_id\": \"190014885\",\n    \"pageurl\": \"https://www.example.com/\",\n    \"json\": 1\n}\n```\n\nRequest will return the id of your captcha. Use it to get the result.\n\n\n**Getting the result**\n\n##### Request example\n\nEndpoint: `https://2captcha.com/res.php`\nMethod: `POST`\n\n```json\n{\n    \"key\": \"YOUR_API_KEY\",\n    \"action\": \"get\",\n    \"id\": 2122988149,\n    \"json\": 1\n}\n```\n\n##### Result example\n\n```json\n{\n    \"status\": 1,\n    \"request\": {\n        \"appid\": \"190014885\",\n        \"ret\": 0,\n        \"ticket\": \"tr0344YjJASGmJGtohyWS_y6tJKiqVPIdFgl87vWlVaQoueR8D6DH28go-i-VjeassM31SXO7D0*\",\n        \"randstr\": \"@KVN\"\n    }\n}\n```\n\n### Using the token\n\nThe token is passed to a callback function defined in 2nd argument of `TencentCaptcha` constructor call during the captcha initialization.\n\n```js\nnew TencentCaptcha(CaptchaAppId, callback, options);\n```\n\nThis function is usually used to make a request to the website backend where the token is verified. You can execute the callback function passing the token as an argument or build a request to the backend using passing the token.\n\nFor example, if the captcha is initialized like this:\n\n```js\nconst myCallbackFunction = (token) {\n    // verify the token\n}\nvar captcha = new TencentCaptcha('190014885', myCallbackFunction, {});\ncaptcha.show();\n```\n\nYou need to call:\n\n```js\nlet data = JSON.parse(res)\nmyCallbackFunction(res.request)\n```\n\nWhere `res` is the JSON response from the API.\n\n\u003c/section>\n\n\u003csection id=\"datadome\">\n\n#### DataDome\n\nCookies-based method for automated solving of DataDome.\nSet the returned cookie in your browser to bypass the captcha.\n\nTo solve the `DataDome` captcha, you must use a proxy.\n\n> \u003cb>Attention\u003c/b>, you need to check the value of the parameter `t` in `captcha_url` if it is contained. The value of `t` must be equal to `fe`.\n> If `t=bv`, it means that your ip is banned by the captcha and you need to change the ip address.\n\n> \u003cb>Attention\u003c/b>, you need to monitor the quality of the proxy used. If your proxy is blocked by the captcha `DataDome`, then when solving you will receive errors `ERR_PROXY_CONNECTION_FAILED` or `ERROR_CAPTCHA_UNSOLVABLE`, in which case you need to change the proxy server used.\n\n> \u003cb>Attention\u003c/b>, you should provide your User-Agent that was used to interact with target website, it will be used to load and solve the captcha. Always use User-Agents of modern browsers.\n\n\n**Method specification**\n\n\n| **Parameter**     | **Type**   | **Required**     | **Description** |\n| ----------------- | --------   | ---------------- | -------------------------------------------------------------------------------- |\n| **key**           | _String_   | **Yes**          | [your API key](#solving_captchas) |\n| **method**        | _String_   | **Yes**          | `datadome` |\n| **captcha_url**   | _String_   | **Yes**          | The value of the `src` parameter for the `iframe` element containing the captcha on the page. |\n| **pageurl**       | _String_   | **Yes**          | Full URL of the page where you solve the captcha |\n| **userAgent**     | _String_   | **Yes**          |  User-Agent of your browser will be used to load the captcha. |\n| proxy             | _String_   | **Yes**          | Your proxy: _login:password@123.123.123.123:3128_ \u003cbr>You can find more info about proxies [here](#proxies)|\n| proxytype         | _String_   | **Yes**          | Type of your proxy: HTTP, HTTPS, SOCKS4, SOCKS5|\n| json              | _Number_   | No               | Set to `1` to get the response as JSON. Default: `0`  |\n\n\n##### Request example\n\nEndpoint: `https://2captcha.com/in.php`\nMethod: `POST`\n\n```json\n{\n    \"key\": \"YOUR_API_KEY\",\n    \"method\": \"datadome\",\n    \"captcha_url\": \"https://geo.captcha-delivery.com/captcha/?initialCid=AHrlqAAA...P~XFrBVptk&t=fe&referer=https%3A%2F%2Fhexample.com&s=45239&e=c538be..c510a00ea\",\n    \"pageurl\": \"https://example.com/\",\n    \"proxy\":\"username:password@1.2.3.4:5678\",\n    \"proxytype\":\"http\",\n    \"userAgent\":\"Mozilla/5.0 (Linux; Android 10; K) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/119.0.0.0 Mobile Safari/537.3\",\n    \"json\": 1\n}\n```\n\nRequest will return the id of your captcha. Use it to get the result.\n\n\n**Getting the result**\n\n##### Request example\n\nEndpoint: `https://2captcha.com/res.php`\nMethod: `POST`\n\n```json\n{\n    \"key\": \"YOUR_API_KEY\",\n    \"action\": \"get\",\n    \"id\": 2122988149,\n    \"json\": 1\n}\n```\n\n##### Result example\n\n```json\n{\n    \"status\": 1,\n    \"request\": \"datadome=G4TdaXfDqz0B..OJDxGGtKDktILJQEDxM; Max-Age=31536000; Domain=.example.com; Path=/; Secure; SameSite=Lax\"\n}\n```\n\n\u003c/section>\n\n\n\n\u003csection id=\"audio\">\n\n#### Audio Recognition\n\nWe provide a speech recognition method that allows you to convert an audio record to text. The method can be used to bypass audio captchas or to recognize any audio record. The limitations are:\n\n- Max file size: **1 MB**\n- Audio duration: **not limited**\n- Supported audio format: **mp3 only**\n- Supported speech languages: English, French, German, Greek, Portuguese, Russian\n\nThe recognition is fully automated and performed by a neural network trained for speech recognition.\n\nTo recognize an audio you need to:\n\n- Encode the mp3 file to base64\n- Submit a request to our API with the base64 string and the language parameter\n\n**Request body example:**\n\n    {\n    \"key\":\"1abc234de56fab7c89012d34e56fa7b8\",\n    \"method\":\"audio\",\n    \"body\":\"\",\n    \"lang\":\"pt\",\n    \"json\":1\n    }\n\n\nIf everything is OK you will receive the response with your request ID `{\"status\":1,\"request\":\"2122988149\"}` or an [error code](#error_handling) if your request was incorrect.\n\nMake a 15-20 seconds timeout then submit a _HTTP GET_ request to our API URL: `https://2captcha.com/res.php` to get the result.  \nThe full list of parameters is in the [table below](#audio-get).\n\nIf audio is already recognized server will return the text in the following format:\n\n    {\n    \"status\": 1,\n    \"request\": \"hello world\"\n    }\n\n\nIf the recognition process is not finished yet server will return _CAPCHA_NOT_READY_ result. Repeat your request in 5 seconds.\n\nIf something went wrong server will return an [error code](#error_handling).\n\nUse the recognition result the way you need it.\n\n**List of request parameters for https://2captcha.com/in.php**\n\n| **Parameter** | **Type** | **Required** | **Description**                                                                  |\n| ------------- | -------- | ------------ | -------------------------------------------------------------------------------- |\n| key           | String   | Yes          | [your API key](#solving_captchas)                                                |\n| method        | String   | Yes          | `audio` \\- indicates that you're sending audio                                   |\n| body          | String   | Yes          | Base64 encoded audio file in mp3 format. Max file size: 1 MB                     |\n| lang          | String   | Yes          | The language of audio record. Supported languages are: `en, fr, de, el, pt, ru`. |\n\n**List of request parameters for https://2captcha.com/res.php**\n\n| **GET parameter** | **Type**               | **Required** | **Description** |\n| ----------------- | ---------------------- | ------------ | --------------- |\n| key               | String                 | Yes          | [your API key](#solving_captchas)                                                                     |\n| action            | String                 | Yes          | get - get the asnwer for your captcha                                                                 |\n| id                | Integer                | Yes          | ID of captcha returned by in.php.                                                                     |\n| json              | Integer \u003cbr>Default: 0 | No           | 0 - server will send the response as plain text \u003cbr>1 - tells the server to send the response as JSON |\n\n**Request URL example:**\n\n    https://2captcha.com/res.php?key=1abc234de56fab7c89012d34e56fa7b8&action=get&id=2122988149\n\u003c/section>\n\n\u003csection id=\"bounding_box\">\n\n#### Bounding Box Method\n\nThe method can be used to solve tasks where you need to select a specific object or draw a box around an object shown on an image.\n\nThe limitations are:\n* Supported image formats: **JPEG**, **PNG**, **GIF**\n* Max file size: **600 kB**\n* Max image size: **1000px** pixels in height or width\n\n\nTo use the Bounding Box method, you must:\n\n1.  Get an image and instructions on which objects to select in the image.\n    \n2.  Submit a _HTTP POST_ request to our API URL: `https://2captcha.com/in.php` specify  _bounding\\_box_ as the value of the parameter _method_.\n    Server accepts images in base64 format.\n    \n    You must be sure to send additional instructions in the form of text or image. As text using the _textinstructions_ parameter, or as an image using the _imginstructions_ parameter.\n    \n    The full list of parameters is in the table below.\n    \n3.  Server will return captcha ID or an [error code](#error_handling) if something went wrong.\n    \n4.  Make a 5 seconds timeout and submit a _HTTP GET_ request to our API URL: `https://2captcha.com/res.php` to get the result.\n    \n    If the task is completed, the server will return the coordinates of the frame in which the object specified in the description is located, for example: _OK|[{\"xMin\":559,\"xMax\":797,\"yMin\":164,\"yMax\":430}]_. The response contains the coordinates of two points of the rectangle located diagonally. Counting coordinates from the upper-left corner of the image.\n    \n    If captcha is not solved yet server will return _CAPCHA_NOT_READY_ result. Repeat your request in 5 seconds.\n    \n    If something went wrong server will return an [error code](#error_handling).\n    \n**Base64 sample form for bounding\\_box method**\n\n    \u003cform method=\"post\" action=\"http://2captcha.com/in.php\">\n    \u003cinput type=\"hidden\" name=\"method\" value=\"bounding_box\">\n    Your key:\n    \u003cinput type=\"text\" name=\"key\" value=\"YOUR_APIKEY\">\n    The body of the bounding_box image in base64 format:\n    \u003ctextarea name=\"image\">BASE64_IMAGE\u003c/textarea>\n    Instructions for markup data:\n    \u003cinput type=\"textinstructions\" name=\"textinstructions\" value=\"Select cars in the image\">\n    \u003cinput type=\"submit\" value=\"Upload and get ID\">\n    \u003c/form>\n\nThe _YOUR\\_APIKEY_ parameter should be replaced with [your API key](#solving_captchas).\n\n_BASE64\\_IMAGE_ — the body of the image file encoded in base64 format.\n\n**List of request parameters for https://2captcha.com/in.php**\n\n| **Parameter**    | **Type** | **Required** | **Description**                                                                  |\n| ---------------- | -------- | ------------ | -------------------------------------------------------------------------------- |\n| **key**          | _String_ | **Yes**      | [your API key](#solving_captchas) |\n| **method**       | _String_ | **Yes**      | `bounding_box` |\n| **image**        | _String_ | **Yes**      | Image containing data for markup.\u003cbr>The image must be encoded in Base64 format. |\n| textinstructions | _String_ | Yes*         | Text will be shown to worker to help him to select object on the image correctly. \u003cbr>For example: Select cars in the image.\u003cbr>**Optional parameter**, if the instruction already exists in the form of the `imginstructions`. |\n| imginstructions  | _String_ | Yes*         | Image with instruction for worker to help him to select object on the image correctly. \u003cbr>The image must be encoded in Base64 format.\u003cbr>**Optional parameter**, if the instruction already exists in the form of the `textinstructions`.|\n| json             | _Number_  \u003cbr>Default: 0 | No | 0 - server will send the response as plain text \u003cbr>1 - tells the server to send the response as JSON |\n| soft_id          | _Number_ | No           | ID of software developer. Developers who integrated their software with 2Captcha get reward: 10% of spendings of their software users |\n| lang             | _String_ | No           | Language code. [See the list of supported languages.](#language) |\n| can_no_answer      | Integer \u003cbr>Default: 0                             | No           | 0 - not specified \u003cbr>1 - possibly there's no objects to select.\u003cbr>Set the value to 1 only if it's possible that there's no objects matching the instruction. \u003cbr>We'll provide a button \"No matching images\" to worker and you will receive _No_matching_images_ as answer. |\n| header_acao      | _Number_  \u003cbr>Default: 0 | No | 0 - disabled \u003cbr>1 - enabled. \u003cbr>If enabled `in.php` will include _Access-Control-Allow-Origin:\\*_ header in the response. \u003cbr>Used for cross-domain AJAX requests in web applications. |\n| pingback         | _String_ | No           | URL for pingback (callback) response that will be sent when captcha is solved. \u003cbr>URL should be registered on the server. [More info here](#pingback). |\n\n**List of request parameters for https://2captcha.com/res.php**\n\n| **GET parameter** | **Type**               | **Required** | **Description**                         |\n| ----------------- | ---------------------- | ------------ | --------------------------------------- |\n| **key**           | _String_               | **Yes**      | [your API key](#solving_captchas)       |\n| **action**        | _String_               | **Yes**      | `get` - get the asnwer for your captcha |\n| **id**            | _Number_               | **Yes**      | ID of captcha returned by in.php.       |\n| json              | _Number_  \u003cbr>Default: 0 | No         | 0 - server will send the response as plain text \u003cbr>1 - tells the server to send the response as JSON |\n| header_acao       | _Number_  \u003cbr>Default: 0 | No         | 0 - disabled \u003cbr>1 - enabled. \u003cbr>If enabled `in.php` will include _Access-Control-Allow-Origin:\\*_ header in the response. \u003cbr>Used for cross-domain AJAX requests in web applications. |\n\n##### Request example\n\nEndpoint: `https://2captcha.com/in.php`\nMethod: `POST`\n\n```json\n{\n    \"key\": \"YOUR_API_KEY\",\n    \"method\": \"bounding_box\",\n    \"image\": \"/9j/4AAQSkZJRgABAQEAYABgAAD//gA7Q1JFQVRPUjogZ2Q...\",\n    \"textinstructions\": \"Select cars in the image\",\n    \"json\": 1\n}\n```\n\nRequest will return the id of your captcha. Use it to get the result.\n\n**Getting the result**\n\n##### Request example\n\nEndpoint: `https://2captcha.com/res.php`\nMethod: `POST`\n\n```json\n{\n    \"key\": \"YOUR_API_KEY\",\n    \"action\": \"get\",\n    \"id\": 2122988149,\n    \"json\": 1\n}\n```\n\n##### Result example\n\n```json\n{\n    \"status\": 1,\n    \"request\": \"[{\\\"xMin\\\":100,\\\"xMax\\\":316,\\\"yMin\\\":66,\\\"yMax\\\":210}]\"\n}\n```\n\n\u003c/section>\n\n\u003csection id=\"prosopo-procaptcha\">\n\n#### Prosopo Procaptcha\n\nToken-based method for automated solving of Prosopo Procaptcha.\n\n**Method specification**\n\n| **Parameter**     | **Type**   | **Required**     | **Description** |\n| ----------------- | ---------- | ---------------- | -------------------------------------------------------------------------------- |\n| **key**           | _String_   | **Yes**          | [your API key](#solving_captchas) |\n| **method**        | _String_   | **Yes**          | `prosopo` |\n| **sitekey**       | _String_   | **Yes**          | The value of `siteKey` parameter found on the page |\n| **pageurl**       | _String_   | **Yes**          | The full URL of target web page where the captcha is loaded. We do not open the page, not a problem if it is available only for authenticated users |\n| proxy             | _String_   | No               | Your proxy: _login:password@123.123.123.123:3128_ \u003cbr>You can find more info about proxies [here](#proxies)|\n| proxytype         | _String_   | No               | Type of your proxy: HTTP, HTTPS, SOCKS4, SOCKS5|\n| json              | _Number_   | No               | Set to `1` to get the response as JSON. Default: `0`  |\n\n\n##### Request example\n\nEndpoint: `https://2captcha.com/in.php`\nMethod: `POST`\n\n```json\n{\n    \"key\": \"YOUR_API_KEY\",\n    \"method\": \"prosopo\",\n    \"sitekey\": \"5EPQoMZEDc5LpN7gtxMMzYPTzA6UeWqL2stk1rso9gy4Ahqt\",\n    \"pageurl\": \"https://www.example.com/\",\n    \"json\": 1\n}\n```\n\nRequest will return the id of your captcha. Use it to get the result.\n\n\n**Getting the result**\n\n##### Request example\n\nEndpoint: `https://2captcha.com/res.php`\nMethod: `POST`\n\n```json\n{\n    \"key\": \"YOUR_API_KEY\",\n    \"action\": \"get\",\n    \"id\": 2122988149,\n    \"json\": 1\n}\n```\n\n##### Result example\n\n```json\n{\n    \"status\": 1,\n    \"request\": \"0x00016c68747470733a2f2f70726f6e6f6465372e70726f736f706f2e696fc0354550516f4d5a454463354c704e376774784d4d7a5950547a4136556557714c...\"\n}\n```\n\n\u003c/section>\n\n\n\u003csection id=\"captchafox\">\n\n#### CaptchaFox\n\nA token-based method for automatically solving CaptchaFox captchas.\n\n**Method specification**\n\n| **Parameter**      | **Type**    | **Required**  | **Description** |\n| ------------------ | ----------- | ------------- | --------------- |\n| **key**            | _String_    | **Yes**       | [Your API key](#solving_captchas) |\n| **method**         | _String_    | **Yes**       | `captchafox` |\n| **sitekey**        | _String_    | **Yes**       | The value of the `sitekey` parameter found on the page or captured in network requests. |\n| **pageurl**        | _String_    | **Yes**       | The full URL of the page containing the captcha. |\n| **proxy**          | _String_    | **Yes**       | Your proxy in the format: _login:password@123.123.123.123:3128_ \u003cbr>[Learn more](#proxies) |\n| **proxytype**      | _String_    | **Yes**       | Proxy type: `HTTP`, `HTTPS`, `SOCKS4`, `SOCKS5` |\n| **useragent**      | _String_    | **Yes**       | The `User-Agent` of the browser used to access the page with the captcha. |\n| json               | _Integer_   | No            | Pass `1` to receive the response in JSON format. \u003cbr> Default: `0` |\n\n##### Request example\n\n**Endpoint:** `https://2captcha.com/in.php`  \n**Method:** `POST`\n\n````json\n{\n  \"key\": \"YOUR_API_KEY\",\n  \"method\": \"captchafox\",\n  \"sitekey\": \"sk_xtNxpk6fCdFbxh1_xJeGflSdCE9tn99G\",\n  \"pageurl\": \"https://mysite.com/page/with/captchafox\",\n  \"proxy\": \"login:password@1.2.3.4:8080\",\n  \"proxytype\": \"http\",\n  \"useragent\": \"Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/115.0.0.0 Safari/537.36\",\n  \"json\": 1\n}\n````\n\nThe request will return the ID of your captcha task, which should be used to retrieve the solution.\n\n---\n\n#### Get task result\n\n##### Request example\n\nEndpoint: `https://2captcha.com/res.php`\nMethod: `POST`\n\n```json\n{\n    \"key\": \"YOUR_API_KEY\",\n    \"action\": \"get\",\n    \"id\": 2122988149,\n    \"json\": 1\n}\n```\n\n##### Response example\n\n````json\n{\n    \"status\": 1,\n    \"request\": \"177f50c25b845601e5c779cdb51b040d523e8ab69efb4d5b343e28df07d05076\"\n}\n````\n\n\u003c/section>\n\n\n\u003csection id=\"vkcaptcha\">\n\n#### VK Captcha\n\nWe offer two methods to solve this type of captcha - token-based and image-based.\n\n**Image-based method method specification**\n\nWe use the `body` (image in base64 format)  or `file` (image as file) and `steps` parameters.\nYou can get both values from the response to the request https://api.vk.com/method/captchaNotRobot.getContent?v={API_VER} when loading the captcha widget on the page.\n\n| **Parameter**     | **Type**   | **Required**    | **Description** |\n| ----------------- | ---------- | --------------- | ------------ |\n| **key**           | _String_   | **Yes**         | [your API key](#solving_captchas) |\n| **method**        | _String_   | **Yes**         | `vkimage` |\n| **file**          | _String_   | **Yes**         | Captcha image as file. The request must include `body` or `file`.|\n| **body**          | _String_   | **Yes**         | Base64-encoded captcha image. The request must include `body` or `file`.|\n| **steps**         | _String_   | **Yes**         | Array of steps |\n| json              | _Integer_  | No              | Set to `1` to get the response as JSON. Default: `0` |\n\n##### Request examples\n\nEndpoint: `https://2captcha.com/in.php`\nMethod: `POST`\n\n```json\n{\n \"key\": \"YOUR_API_KEY\",\n \"method\": \"vkimage\",\n \"body\": \"/9j/4AAQSkZJRgABAQAAAQABAAD/2wBDAAgGBgcGBQgHBwcJCQgKDBQNDAsLDBkSEw8UHRofHh0aHBwgJC4nICIsIxwcKDcpLDAxNDQ0Hyc...\",\n \"steps\": \"[5,19,14,14,6,4,8,9,23,23,14,23,3,13,16,8,2,4,6...11,8,4,15,0,18,16,19,4,19,20,21,22,16,10,20,12,19,5,23,24,8]\",\n \"json\": 1\n}\n```\n\nThe query will return the ID of your captcha, which should be used to get the result.\n\n**Getting the result**\n\n##### Request example\n\nEndpoint: `https://2captcha.com/res.php`  \nMethod: `GET`\n\n```json\n{\n  \"key\": \"YOUR_API_KEY\",\n  \"action\": \"get\",\n  \"id\": 2122988149,\n  \"json\": 1\n}\n```\n\n##### Result example\n\n```json\n{\n    \"status\": 1,\n    \"request\": {\n        \"best_step\": 27,\n        \"preview\": \"/9j/4AAQSkZJRgABAQAAAQABAAD/...ioGFFFFMD/2Q==\",\n        \"solution\": [\n            18,\n            1,\n            11,\n            6,\n            ...\n            7,\n            2,\n            16\n        ],\n        \"answer\": \"eyJ2YWx1ZSI6WzE4LDEsMTEsNiwzLDIsMTAsMTksNSwxOSwxNywzLDE0LDIzLDE3LDIwLDcsMCwyMCwyMywxMSwxNSwyMSwyMCwxNSwxMCwxMiw3LDksMTYsMTksMiwxMywzLDIzLDQsMTQsMSwyMCwyNCwyMSwxOCwzLDE4LDQsMTksOSw3LDIzLDE0LDE0LDcsMiwxNl19\"\n    }\n}\n```\n\n`best_step` - the number of steps you need to pass to solve the captcha, you can use this value to move the slider\n`solution` - the list of steps passed to solve the captcha\n`answer` - the `solution` in proper API format, use it to interact with the target website API\n`preview` - is the base64 image showing the result of performing steps from the `solution`\n\n\n**Token-based method specification**\n\nToken-based method requires `redirect_uri` parameter, as well as proxy and userAgent. The value of the `redirect_uri` parameter can be found in the response to requests to the VK API that return captchas.\n\n| **Parameter**     | **Type**   | **Required**    | **Description** |\n| ----------------- | ---------- | --------------- | ------------ |\n| **key**           | _String_   | **Yes**         | [Ваш API-ключ](#solving_captchas) |\n| **method**        | _String_   | **Yes**         | `vkcaptcha` |\n| **redirect_uri**  | _String_   | **Yes**         | The URL that is returned on requests to the captcha API. |\n| **userAgent**     | _String_   | **Yes**         | Your User-Agent that will be passed to our worker and used to solve the captcha. |\n| proxy             | _String_   | **Yes**         | Your proxy: _login:password@123.123.123.123:3128_ \u003cbr>You can find more info about proxies [here](#proxies)|\n| proxytype         | _String_   | **Yes**         | Type of your proxy: HTTP, HTTPS, SOCKS4, SOCKS5|\n| json              | _Integer_  | No              | Set to `1` to get the response as JSON. Default: `0`  |\n\n##### Request examples\n\nEndpoint: `https://2captcha.com/in.php`\nMethod: `POST`\n\n```json\n{\n  \"type\": \"vkcaptcha\",\n  \"redirect_uri\": \"https://id.vk.com/not_robot_captcha?domain=vk.com&session_token=eyJ....HGsc5B4LyvjA&variant=popup&blank=1\",\n  \"userAgent\": \"Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/115.0.0.0 Safari/537.36\",\n  \"proxyType\": \"http\",\n  \"proxyAddress\": \"1.2.3.4\",\n  \"proxyPort\": \"8080\",\n  \"proxyLogin\": \"user23\",\n  \"proxyPassword\": \"p4$w0rd\"        \n}\n\n```\n\nThe query will return the ID of your captcha, which should be used to get the result.\n\n**Getting the result**\n\n##### Request example\n\nEndpoint: `https://2captcha.com/res.php`  \nMethod: `POST`\n\n```json\n{\n  \"key\": \"YOUR_API_KEY\",\n  \"id\": 2122988149\n}\n```\n\n##### Result example\n\n```json\n{\n    \"errorId\": 0,\n    \"status\": \"ready\",\n    \"solution\": {\n        \"token\":\"eyJhbG...kyAWZSNoJPw\"\n    },\n    \"cost\": \"0.00145\",\n    \"ip\": \"1.2.3.4\",\n    \"createTime\": 1692863536,\n    \"endTime\": 1692863556,\n    \"solveCount\": 1\n}\n```\nUse the token to interact with the target website.\n\u003c/section>\n\n\u003csection id=\"temucaptcha\">\n\n#### Temu Captcha\n\nMethod for solving Temu CAPTCHA using a CAPTCHA image.\n\n**Image-based method method specification**\n\nWe use the `body` (image in base64 format) and `parts` (images of the response parts that need to be moved) that you send us.\nYou need to get all the images and convert them to base64 format.\n\n\n| **Parameter**     | **Type**   | **Required**    | **Description** |\n| ----------------- | ---------- | --------------- | ------------ |\n| **key**           | _String_   | **Yes**         | [your API key](#solving_captchas) |\n| **method**        | _String_   | **Yes**         | `temuimage` |\n| **body**          | _String_   | **Yes**         | The main base64-encoded captcha image. |\n| **part1**         | _String_   | **Yes**          | The part of puzzle|\n| **part2**         | _String_   | **Yes**          | The part of puzzle |\n| **part3**         | _String_   | **Yes**          | The part of puzzle |\n| json              | _Integer_  | No              | Set to `1` to get the response as JSON. Default: `0` |\n\n##### Request examples\n\nEndpoint: `https://2captcha.com/in.php`\nMethod: `POST`\n\n```json\n{\n \"key\": \"YOUR_API_KEY\",\n \"method\": \"temuimage\",\n \"body\": \"data:image/png;base64,iVBORw0KG...\",\n \"part1\": \"data:image/png;base64,iVBORw0KG...\",\n \"part2\": \"data:image/png;base64,iVBORw0KG...\",\n \"part3\": \"data:image/png;base64,iVBORw0KG...\",\n \"json\": 1\n}\n```\n\nThe query will return the ID of your captcha, which should be used to get the result.\n\n**Getting the result**\n\n##### Request example\n\nEndpoint: `https://2captcha.com/res.php`  \nMethod: `GET`\n\n```json\n{\n  \"key\": \"YOUR_API_KEY\",\n  \"action\": \"get\",\n  \"id\": 2122988149,\n  \"json\": 1\n}\n```\n\n##### Result example\n\n```json\n{\n    \"cost\": \"0.0012\",\n    \"createTime\": 1754563182,\n    \"endTime\": 1754563190,\n    \"errorId\": 0,\n    \"ip\": \"46.53.232.76\",\n    \"solution\": {\n        \"coordinates\": [\n            {\n                \"x\": 155,\n                \"y\": 358\n            },\n            {\n                \"x\": 152,\n                \"y\": 153\n            },\n            {\n                \"x\": 251,\n                \"y\": 333\n            }\n        ]\n    },\n    \"solveCount\": 1,\n    \"status\": \"ready\"\n}\n```\n\nUse the received coordinates to position the image pieces correctly.\n\n\u003c/section>\n\n\u003csection id=\"altchacaptcha\">\n\n#### Altcha Captcha\n\nToken-based method for automated solving Altcha CAPTCHA.\n\n**Method specification**\n\nToken-based method requires `challengeurl` or `challengeJSON` parameter, as well as proxy (not required).\n\n\n| **Parameter**     | **Type**   | **Required**     | **Description** |\n| ----------------- | --------   | ---------------- | -------------------------------------------------------------------------------- |\n| **key**           | _String_   | **Yes**          | [your API key](#solving_captchas) |\n| **method**        | _String_   | **Yes**          | `altcha` |\n| **captcha_url**   | _String_   | **Yes***         | The value of the `challenge_url` parameter for the `altcha-widget` element containing the captcha on the page. |\n| **challenge_json**| _String_   | **Yes***        | The contents of the file from the 'challenge_url' parameter |\n| **pageurl**       | _String_   | **Yes**          | Full URL of the page where you solve the captcha |\n| proxy             | _String_   | No               | Your proxy: _login:password@123.123.123.123:3128_ \u003cbr>You can find more info about proxies [here](#proxies)|\n| proxytype         | _String_   | No               | Type of your proxy: HTTP, HTTPS, SOCKS4, SOCKS5|\n| json              | _Number_   | No               | Set to `1` to get the response as JSON. Default: `0`  |\n\n> **\\*** You can send either `captcha_url` or `challenge_json parameter`, but not two of it simultaneously.\n\n##### Request examples\n\nEndpoint: `https://2captcha.com/in.php`\nMethod: `POST`\n\n```json\n{\n \"key\": \"YOUR_API_KEY\",\n \"method\": \"altcha\",\n \"challenge_url\": \"https://.../captcha/api/altcha/challenge\",\n \"pageurl\": \"https://site.com/\",\n \"json\": 1\n}\n```\n\nThe query will return the ID of your captcha, which should be used to get the result.\n\n**Getting the result**\n\n##### Request example\n\nEndpoint: `https://2captcha.com/res.php`  \nMethod: `GET`\n\n```json\n{\n  \"key\": \"YOUR_API_KEY\",\n  \"action\": \"get\",\n  \"id\": 2122988149,\n  \"json\": 1\n}\n```\n\n##### Result example\n\n```json\n{\n    \"cost\": \"0.0012\",\n    \"createTime\": 1754563182,\n    \"endTime\": 1754563190,\n    \"errorId\": 0,\n    \"ip\": \"46.53.232.76\",\n    \"solution\":\n    {\n        \"token\":\"eyJhbGdvcml0aG0iOiJTSEEtMjU2IiwiY2hhbGxlbmdlIjoiZWFiOTE3NjRkM2Y5ZDBjMGU4ZmR.......\"\n    },\n    \"solveCount\": 1,\n    \"status\": \"ready\"\n}\n```\n\nUse the token to interact with the target website.\n\n\u003c/section>\n\n\u003csection id=\"language\">\n\n### Language support\n\nOur API allows you to set the language of captcha with `lang` parameter.\n\nEach our worker can tell us which languages he speaks. When you submit a captcha with `lang` parameter we will distribute your captcha to workers who speak the language. That allows you to solve non-latin and non-cyrillic captchas, for example chinese or vietnamese.\n\nThe list of supported languages is available in the table below.\n\n| **Language code (`lang` value)** | **Language**       |\n| -------------------------------- | ------------------ |\n| en                               | English            |\n| ru                               | Russian            |\n| es                               | Spanish            |\n| pt                               | Portuguese         |\n| uk                               | Ukrainian          |\n| vi                               | Vietnamese         |\n| fr                               | French             |\n| id                               | Indonesian         |\n| ar                               | Arab               |\n| ja                               | Japanese           |\n| tr                               | Turkish            |\n| de                               | German             |\n| zh                               | Chinese            |\n| fil                              | Philippine         |\n| pl                               | Polish             |\n| th                               | Thai               |\n| it                               | Italian            |\n| nl                               | Nederlands (Dutch) |\n| sk                               | Slovak             |\n| bg                               | Bulgarian          |\n| ro                               | Romanian           |\n| hu                               | Hungarian (Magyar) |\n| ko                               | Korean             |\n| cs                               | Czech              |\n| az                               | Azerbaijani        |\n| fa                               | Persian (Farsi)    |\n| bn                               | Bengali            |\n| el                               | Greek              |\n| lt                               | Lithuanian         |\n| lv                               | Latvian            |\n| sv                               | Swedish            |\n| sr                               | Serbian            |\n| hr                               | Croatian           |\n| he                               | Hebrew             |\n| hi                               | Hindi              |\n| nb                               | Norwegian          |\n| sl                               | Slovenian          |\n| da                               | Danish             |\n| uz                               | Uzbek              |\n| fi                               | Finnish            |\n| ca                               | Catalan            |\n| ka                               | Georgian           |\n| ms                               | Malay              |\n| te                               | Telugu             |\n| et                               | Estonian           |\n| ml                               | Malayalam          |\n| be                               | Belorussian        |\n| kk                               | Kazakh             |\n| mr                               | Marathi            |\n| ne                               | Nepali             |\n| my                               | Burmese            |\n| bs                               | Bosnian            |\n| hy                               | Armenian           |\n| mk                               | Macedonian         |\n| pa                               | Punjabi (Punjabi)  |\n\n\u003c/section>\n\n\u003csection id=\"error_handling\">\n\n### Error Handling\n\nIt's very important to use proper error handling in your code to avoid suspension of your account and service interruption.\n\nTake a look on [debugging method](#debugging) provided by our API. It can help you to identify the root or the error.\n\nNormally if something is wrong with your request server will return an error.  \nBelow you can find tables with lists of errors with descriptions:\n\n- [errors returned by https://2captcha.com/**in.php**](#in_errors)\n- [errors returned by https://2captcha.com/**res.php**](#res_errors)\n\nYou can also get the list of all errors returned from in.php by making this [call](https://2captcha.com/in.php?method=get_server_errors).\n\nErrors can be returned as plain text or as JSON if you provided _json=1_ parameter.\n\nIn very rare cases server can return HTML page with error text like 500 or 502 - please keep it in mind and handle such cases correctly.  \nIf you received anything that doesn't looks like the answer or error code - make a 5 seconds timeout and then retry your request.\n\u003c/section>\n\n\u003csection id=\"in_errors\">\n\n#### List of in.php errors\n\n| **Error code**| **Description**| **Action**|\n| ------------- | -------------- | --------- |\n| ERROR_WRONG_USER_KEY           | You've provided _key_ parameter value in incorrect format, it should contain 32 symbols.| Stop sending requests. Check [your API key](#solving_captchas).|\n| ERROR_KEY_DOES_NOT_EXIST       | The key you've provided does not exists.| Stop sending requests. Check [your API key](#solving_captchas).|\n| ERROR_ZERO_BALANCE             | You don't have funds on your account.| Stop sending requests. Deposit your account to continue solving captchas.|\n| ERROR_PAGEURL                  | _pageurl_ parameter is missing in your request.| Stop sending requests and change your code to provide valid _pageurl_ parameter. \u003cbr>[More info.](#recaptchav2new_post)|\n| ERROR_NO_SLOT_AVAILABLE        | You can receive this error in two cases: \u003cbr>1\\. **If you solve Normal Captcha or ArkoseLabs FunCaptcha:** your maximum rate is lower than current rate on the server. \u003cbr>You can change your maximum rate in [your account's settings](https://2captcha.com/setting). \u003cbr>2\\. **If you solve token-based captchas:** the queue of your captchas that are not distributed to workers is too long. Queue limit changes dynamically and depends on total amount of captchas awaiting solution and usually it’s between 50 and 100 captchas. | If you have received this error, don't try to submit your request again immediately. Instead, 1. **Adjust your maximum rate** in [your account's settings](https://2captcha.com/setting). \u003cbr>or \u003cbr>2\\. **Make 2-3 seconds timeout** and then retry to submit your request. |\n| ERROR_ZERO_CAPTCHA_FILESIZE    | Image size is less than 100 bytes.                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                         | Check the image file.                                                                                                                                                                                                                                                        |\n| ERROR_TOO_BIG_CAPTCHA_FILESIZE | Image size is more than 600 kB or image is bigger than 1000px on any side.                                                                                                                                                                                                                                                                                                                                                                                                                                                                  | Check the image file.                                                                                                                                                                                                                                                        |\n| ERROR_WRONG_FILE_EXTENSION     | Image file has unsupported extension. Accepted extensions: jpg, jpeg, gif, png.                                                                                                                                                                                                                                                                                                                                                                                                                                                            | Check the image file.                                                                                                                                                                                                                                                        |\n| ERROR_IMAGE_TYPE_NOT_SUPPORTED | Server can't recognize image file type.                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                    | Check the image file.                                                                                                                                                                                                                                                        |\n| ERROR_UPLOAD                   | Server can't get file data from your POST-request. \u003cbr>That happens if your POST-request is malformed or base64 data is not a valid base64 image.                                                                                                                                                                                                                                                                                                                                                                                          | You got to fix your code that makes POST request.                                                                                                                                                                                                                            |\n| ERROR_IP_NOT_ALLOWED           | The request is sent from the IP that is not on the list of your allowed IPs.                                                                                                                                                                                                                                                                                                                                                                                                                                                               | Check the list of your [allowed IPs](https://2captcha.com/iplist).                                                                                                                                                                                                      |\n| IP_BANNED                      | Your IP address is banned due to many frequent attempts to access the server using wrong authorization keys.                                                                                                                                                                                                                                                                                                                                                                                                                               | Ban will be automatically lifted after 5 minutes.                                                                                                                                                                                                                            |\n| ERROR_BAD_TOKEN_OR_PAGEURL     | You can get this error code when sending reCAPTCHA V2. That happens if your request contains invalid pair of googlekey and pageurl. The common reason for that is that reCAPTCHA is loaded inside an iframe hosted on another domain/subdomain.                                                                                                                                                                                                                                                                                            | Explore code of the page carefully to find valid pageurl and sitekey values.                                                                                                                                                                                                 |\n| ERROR_GOOGLEKEY                | You can get this error code when sending reCAPTCHA V2. That means that sitekey value provided in your request is incorrect: it's blank or malformed.                                                                                                                                                                                                                                                                                                                                                                                       | Check your code that gets the sitekey and makes requests to our API.                                                                                                                                                                                                         |\n| ERROR_PROXY_FORMAT             | You use incorrect proxy format in your request to `in.php`                                                                                                                                                                                                                                                                                                                                                                                                                                                                                 | Use proper format as described in section [Using proxies](#proxies).                                                                                                                                                                                                         |\n| ERROR_WRONG_GOOGLEKEY          | `googlekey` parameter is missing in your request                                                                                                                                                                                                                                                                                                                                                                                                                                                                                           | Check your code that gets the sitekey and makes requests to our API.                                                                                                                                                                                                         |\n| ERROR_CAPTCHAIMAGE_BLOCKED     | You've sent an image that is marked in our database as unrecognizable. \u003cbr>Usually that happens if the website where you found the captcha stopped sending you captchas and started to send \"deny access\" image.                                                                                                                                                                                                                                                                                                                           | Try to override website's limitations.                                                                                                                                                                                                                                       |\n| TOO_MANY_BAD_IMAGES            | You are sending too many unrecognizable images                                                                                                                                                                                                                                                                                                                                                                                                                                                                                             | Make sure that your [last captchas](/statistics/uploads) are visible and check [unrecognizable images](/setting/not_captcha) we saved for analisys. Then fix your software to submit images properly.                                                                        |\n| MAX_USER_TURN                  | You made more than 60 requests to _in.php_ within 3 seconds. \u003cbr>Your account is banned for 10 seconds. Ban will be lifted automatically.                                                                                                                                                                                                                                                                                                                                                                                                  | Set at least 100 ms timeout between requests to _in.php_.                                                                                                                                                                                                                    |\n| ERROR: NNNN                    | Where NNNN is numeric error code. \u003cbr>You exceeded request limit and your account is temporary suspended.                                                                                                                                                                                                                                                                                                                                                                                                                                  | You should set proper timeouts. Please refer to [Request limits](#limits) for more info.                                                                                                                                                                                     |\n| ERROR_BAD_PARAMETERS           | The error code is returned if some required parameters are missing in your request or the values have incorrect format. Or in case if you have SandBox mode and 100% recognition options enabled at the same time. \u003cbr>For example if you submit [Grid images](#grid) but your request is missing an instruction for workers. Or if you submit [reCAPTCHA V2](#solving_recaptchav2_new) or [TikTok](#solving_tiktok) captcha with cookies string that has incorrect format.                                                                | Check that your request contains all the required parameters and the values are in proper format. \u003cbr>Use [debug mode](#debugging) to see which values you send to our API.                                                                                                  |\n| ERROR_BAD_PROXY                | You can get this error code when sending a captcha via proxy server which is marked as _BAD_ by our API.| Use a different proxy server in your requests.|\n\u003c/section>\n\n\u003csection id=\"res_errors\">\n\n#### List of res.php errors\n\n| **Error code**                | **Description**                | **Action**                                         |\n| ----------------------------- | ------------------------------ | -------------------------------------------------- |\n| CAPCHA_NOT_READY              | Your captcha is not solved yet.| **Make 5 seconds timeout** and repeat your request.|\n| ERROR_CAPTCHA_UNSOLVABLE      | We are unable to solve your captcha - three of our workers were unable solve it or we didn't get an answer within 90 seconds (300 seconds for reCAPTCHA V2). \u003cbr>We will not charge you for that request.                                                                                    | You can retry to send your captcha.|\n| ERROR_WRONG_USER_KEY          | You've provided _key_ parameter value in incorrect format, it should contain 32 symbols.| Stop sending requests. Check [your API key](#solving_captchas).|\n| ERROR_KEY_DOES_NOT_EXIST      | The key you've provided does not exists.| Stop sending requests. Check [your API key](#solving_captchas).                                      |\n| ERROR_WRONG_ID_FORMAT         | You've provided captcha ID in wrong format. The ID can contain numbers only.| Check the ID of captcha or your code that gets the ID.                                               |\n| ERROR_WRONG_CAPTCHA_ID        | You've provided incorrect captcha ID.| Check the ID of captcha or your code that gets the ID.                                               |\n| ERROR_BAD_DUPLICATES          | Error is returned when 100% accuracy feature is enabled. The error means that max numbers of tries is reached but min number of matches not found.                                                                                                                                           | You can retry to send your captcha again.                                                            |\n| ERROR_REPORT_NOT_RECORDED     | Error is returned to your [report request](#complain) if you already complained lots of correctly solved captchas (more than 40%). Or if more than 15 minutes passed after you submitted the captcha.                                                                                        | Make sure that you're sending [complain requests](#complain) only for incorrectly solved captchas.   |\n| ERROR_DUPLICATE_REPORT        | Error is returned to your [report request](#complain) if you are trying to report the same captcha more than once.                                                                                                                                                                           | Make sure that you're sending only one report for each captcha.                                      |\n| ERROR: NNNN                   | Where NNNN is numeric error code. \u003cbr>You exceeded request limit and your account is temporary suspended.                                                                                                                                                                                    | You should set proper timeouts. Please refer to [Request limits](#limits) for more info.             |\n| ERROR_IP_ADDRES               | You can receive this error code when registering a [pingback (callback)](#pingback) IP or domain. \u003cbr>That happes if your request is coming from an IP address that doesn't match the IP address of your pingback IP or domain.                                                              | Make the request from the IP address matching your IP or domain for pingback.                        |\n| ERROR_TOKEN_EXPIRED           | You can receive this error code when sending [Geetest](#solving_geetest). \u003cbr>That error means that `challenge` value you provided is expired.                                                                                                                                               | If you always receive this error code that means that we're unable to solve Geetest on this website. |\n| ERROR_EMPTY_ACTION            | Action parameter is missing or no value is provided for `action` parameter.                                                                                                                                                                                                                  | Check your request parameters and add the neccessary value, e.g. `get` or `getbalance`.              |\n| ERROR_PROXY_CONNECTION_FAILED | You can get this error code if we were unable to load a captcha through your proxy server. The proxy will be marked as _BAD_ by our API and we will not accept requests with the proxy during 10 minutes. \u003cbr>You will recieve ERROR_BAD_PROXY code from _in.php_ API endpoint in such case. | Use a different proxy server in your requests.                                                       |\n\u003c/section>\n\n\u003csection id=\"debugging\">\n\n### Debugging API\n\nSometimes it can be hard to find to undrestand why our API returns an [error code](#error_handling) when you make a request that looks correct.\n\nWe provide a debugging method that can help you to find the root of the problem showing what exactly our API recevied from you.\n\nThe method can be used both on `in.php` and `res.php` API endpoints for any request.\n\nAdd an additional parameter `debug_dump=1` to your request and our server will return a dump of request parameters that received by our API.\n\nRequest example:\n\n    https://2captcha.com/in.php?key=1abc234de56fab7c89012d34e56fa7b8&method=userrecaptcha&googlekey=6Le-wvkSVVABCPBMRTvw0Q4Muexq1bi0DJwx_mJ-&json=1&header_acao=1&pageurl=http://mysite.com/page/with/recaptcha/&pingback=http://1.2.3.4/pingback_handler/&debug_dump=1\n\nResponse example:\n\n    array(8) {\n    [\"key\"]=>\n    string(32) \"1abc234de56fab7c89012d34e56fa7b8\"\n    [\"method\"]=>\n    string(13) \"userrecaptcha\"\n    [\"googlekey\"]=>\n    string(40) \"6Le-wvkSVVABCPBMRTvw0Q4Muexq1bi0DJwx_mJ-\"\n    [\"json\"]=>\n    string(1) \"1\"\n    [\"header_acao\"]=>\n    string(1) \"1\"\n    [\"pageurl\"]=>\n    string(38) \"http://mysite.com/page/with/recaptcha/\"\n    [\"pingback\"]=>\n    string(32) \"http://1.2.3.4/pingback_handler/\"\n    [\"debug_dump\"]=>\n    string(1) \"1\"\n    }\n    array(0) {\n    }\n    array(0) {\n    }\n    {\"status\":0,\"request\":\"ERROR_KEY_DOES_NOT_EXIST\"}\n\nUsing this method you will be able to easily identify cases when your request contains invalid data or missing required parameters.\n\u003c/section>\n\n\u003csection id=\"limits\">\n\n### Request limits\n\nPlease remember and understand that each of your requests to our API generates multuple requests to our databases. That's why we ask to set proper timeouts for your requests and use proper [error handling](#error_handling) for cases when server returns an error (error message, HTTP error or HTML page with error).\n\nFor example:\n\n- If server returns ERROR_NO_SLOT_AVAILABLE make a 5 seconds timeout before sending next request.\n- If server returns ERROR_ZERO_BALANCE set the timeout to 60 seconds.\n- After uploading a captcha wait a least 5 seconds (10-20 for recaptcha) and only then try to get the answer.\n- If captcha is not solved yet - retry in 5 seconds.\n\nIf your timeouts are configured incorrectly your account or IP address will be temporary blocked and server will return an error. See the list of error codes in the [table below](#limit_errors).\n\u003c/section>\n\n\u003csection id=\"limit_errors\">\n\n#### List of error codes for request limitations\n\n| **Error code** | **Blocking time** | **Blocking reason** |\n| -------------- | ----------------- | ------------------- |\n| ERROR: 1001    | 10 minutes        | You received 120 ERROR_NO_SLOT_AVAILABLE errors in one minute because your current bid is lower than current bid on the server |\n| ERROR: 1002    | 5 minutes         | You received 120 ERROR_ZERO_BALANCE errors in one minute because your balance is out |\n| ERROR: 1003    | 30 seconds        | You are getting ERROR_NO_SLOT_AVAILABLE because you are uploading many captchas and server has a long queue of your captchas that are not distributed to workers. \u003cbr>You received three times more errors than amount of captchas you sent (but not less than 120 errors). Increase the timeout if you see this error. |\n| ERROR: 1004    | 10 minutes        | Your IP address is blocked because there were 5 requests with incorrect API key from your IP. |\n| ERROR: 1005    | 5 minutes         | You are making too many requests to res.php to get answers. \u003cbr>We use the following rule to block your account: R > C \\* 20 + 1200 \u003cbr>Where: \u003cbr>R - the amount of your requests \u003cbr>C - the amount of captchas you've uploaded \u003cbr>That means that you don't have to make more than 20 requests to res.php per each captcha. \u003cbr>Please remember that balance request sent to res.php also counts! \u003cbr>To get your answer faster without a risk to be blocked you can use [pingback feature](#pingback) and we will send you the answer when your captcha is solved. |\n| MAX_USER_TURN  | 10 seconds        | You made more than 60 requests to _in.php_ within 3 seconds. Set at least 100 ms timeout between requests to _in.php_. |\n\u003c/section>\n\n\u003csection id=\"proxies\">\n\n### Using proxies\n\nProxies can be used to solve most types of javascript-based captchas:\n\n- [reCAPTCHA V2](#solving_recaptchav2_new)\n- [reCAPTCHA Enterpise V2](#solving_recaptcha_enterprise)\n- [Arkose Labs FunCaptcha](#solving_funcaptcha_new)\n- [Geetest](#solving_geetest)\n- [Geetest v4](#geetest-v4)\n- [TikTok](#solving_tiktok)\n\nProxy allows to solve the captcha from the same IP address as you load the page.  \nUsing proxies is not obligatory in most cases. But for some kind of protection you should use it. For example: Cloudflare and Datadome protection pages require IP matching.  \nAlso good proxies with regular rotation can raise the speed and success rate for [Arkose Labs FunCaptcha](#solving_funcaptcha_new).\n\nProxies are not supported for reCAPTCHA V3 and Enterprise V3 as proxies dramatically decrease the success rate for this types of captcha.\n\nIf you send us the proxy, we check it's availability trying to open the website through you proxy, and if we can't do that we will not use your proxy.  \nIf we're able to use your proxy - we'll load the reCAPTCHA through it for solving.\n\nWe have our own proxies that we can offer you. [Buy residential proxies](https://2captcha.com/proxy/residential-proxies) for avoid restrictions and blocks. [Quick start](https://2captcha.com/proxy?openAddTrafficModal=true).\n\nWe support the following proxy types: SOCKS4, SOCKS5, HTTP, HTTPS with authentication by IP address or login and password.\n\nIf your proxy uses IP authentication you have to add our IP addresses to the list of allowed IPs of the proxy:  \n138.201.188.166\n\nThen provide your proxy IP address and port as a value for _proxy_ parameter.  \nAnd the type of your proxy as a value for _proxytype_ parameter.\n\nIf your proxy uses login/password authentication you have to include your credentials in _proxy_ parameter.\n\u003c/section>\n\n\u003csection id=\"recaptchav2new_proxy\">\n\n#### POST parameters for proxies\n\n\n| **POST parameter** | **Type** | **Required** | **Description** |\n| ------------------ | -------- | ------------ |---------------- |\n| proxy              | String   | No           | Format for IP authentication: _IP_address:PORT_ \u003cbr>Example: _proxy=123.123.123.123:3128_ \u003cbr>Format for login/password authentication: _login:password@IP_address:PORT_ \u003cbr>Example: _proxy=proxyuser:strongPassword@123.123.123.123:3128_ |\n| proxytype          | String   | No           | Type of your proxy: HTTP, HTTPS, SOCKS4, SOCKS5. \u003cbr>Example: _proxytype=SOCKS4_ |\n\u003c/section>\n\n\u003csection id=\"cookies\">\n\n### Cookies param\n\nOur API provides extended Cookies support for reCAPTCHA V2 and reCAPTCHA V2 Enterpise.\n\nYou can provide your cookies using the format below as the value of `json_cookies` parameter. We will set the cookies on our worker's browser.\n\nAfter the captcha was solved succesfully, we will return all the cookies set for domains: `google.com` and the domain of your target website from `pageurl` parameter value.\n\nYou should use `json=1` parameter in your request to res.php endpoint to get the cookies.\n\n#### Cookies format:\n\n    {\n    \"json_cookies\": [\n    {\n        \"name\": \"my-cookie-name-1\",\n        \"value\": \"my-cookie-val-1\",\n        \"domain\": \"example.com\",\n        \"hostOnly\": true,\n        \"path\": \"\\/\",\n        \"secure\": true,\n        \"httpOnly\": false,\n        \"session\": false,\n        \"expirationDate\": 1665434653,\n        \"sameSite\": \"strict\"\n    },\n    {\n        \"name\": \"my-cookie-name-2\",\n        \"value\": \"my-cookie-val-2\",\n        \"domain\": \".google.com\",\n        \"hostOnly\": false,\n        \"path\": \"\\/\",\n        \"secure\": true,\n        \"httpOnly\": false,\n        \"session\": false,\n        \"expirationDate\": 1668015805.8028,\n        \"sameSite\": \"no_restriction\"\n    }\n    ]\n    }\n\nThe following properties are required for each cookie:\n\n- `domain` (String) - the domain for cookie\n- `name` (String) - the cookie name\n- `value` (String) - the cookie value\n- `secure` (Boolean) - should we set secure attribute?\n\u003c/section>\n\n\u003csection id=\"pingback\">\n\n### Pingback (callback)\n\nWe provide a pingback (callback) option that allows you to get the answer for your captcha automatically when it's ready.  \nIt allows you to get answers without making requests to https://2captcha.com/res.php and also allows you to avoid account suspension.\n\nTo receive automated pingback you have to:\n\n- [Register your pingback domain/IP address.](#manage_pingback)\n- Provide your pingback URL as a value for _pingback_ parameter of your request to https://2captcha.com/in.php.\n- Process _HTTP POST_ request with URLencoded form data (application/x-www-form-urlencoded) coming from our server to your pingback URL. The request contains two parameters: `id` \\- captcha ID and `code` \\- the answer.\n\nIncoming pingback request example:\n\n    id=51555263943&code=ANSWER\n\nYou can use any pingback URL pointing to your registered domain/IP address so your URL can include custom parameters.  \nBut there's one limitation: if you will submit your captcha with GET request and use URL that contains multiple parameters like `http://mysite.com/pingback/?myId=1&myCat=2&something_else=test` then you will receive pingback to URL with only the first parameter `?myId=1`. To avoid that use POST request with multipart/form-data.\n\u003c/section>\n\n\u003csection id=\"manage_pingback\">\n\n#### Manage pingback addresses\n\nYou can manage your pingback addresses on [pingback management page](/setting/pingback) or making _HTTP GET_ requests to `https://2captcha.com/res.php`  \nRequest parameters are described in the table below.\n\n**Important:** pingback domain/IP address can be registered only from the same IP address so you got to send register request from your server.\n\n**List of _GET_ request parameters for https://2captcha.com/res.php**\n\n\n| **GET parameter** | **Type**               | **Required** | **Description** |\n| ----------------- | ---------------------- | ------------ | --------------- |\n| key               | String                 | Yes          | [your API key](#solving_captchas) |\n| action            | String                 | Yes          | add_pingback - register new pingback URL \u003cbr>get_pingback - get the list of your pingback URLs \u003cbr>del_pingback - delete pingback URL                                                    |\n| addr              | String                 | -            | Your pingback URL. \u003cbr>For example: `_http://mysite.com/pingback/url/_` or `_123.123.123.123/pingback/url/_` \u003cbr>You can use 'all' value together with del_pingback to delete all your URLs. |\n| json              | Integer \u003cbr>Default: 0 | No           | 0 - server will send the response as plain text \u003cbr>1 - tells the server to send the response as JSON |\n\u003c/section>\n\n\u003csection id=\"pingback_examples\">\n\n#### Request examples\n\nRegister pingback domain/IP:\n\n    https://2captcha.com/res.php?key=1abc234de56fab7c89012d34e56fa7b8&action=add_pingback&addr=mysite.com\n\nList pingback domains/IPs:\n\n    https://2captcha.com/res.php?key=1abc234de56fab7c89012d34e56fa7b8&action=get_pingback&json=1\n\nDelete all pingback domains/IP:\n\n    https://2captcha.com/res.php?key=1abc234de56fab7c89012d34e56fa7b8&action=del_pingback&addr=all\n\u003c/section>\n\n\u003csection id=\"complain\">\n\n### Reporting answers\n\nReporting answers is not required to solve capthcas. But it can help you to cut expenses and increase the accuracy. We described why it is important to report answers in [our blog](https://2captcha.com/blog/reportgood-reportbad).\n\nWe recommend to report both correct and incorrect asnwers for all types of captchas.\n\nIf the answer is not accepted by target website use `reportbad` method to inform us about that. The answer will be rechecked and you will receive a refund for incorrect answer.\n\nIf the answer was accepted successfully use `reportgood` method to indicate that. That will allow us to increase the accuracy for future requests.\n\n> **Important:** don't try to report correct answers with `reportbad`. If you will do that then we will block this method for your account.\n\n> Reports for captchas with token like reCAPTCHA V2/V3, FunCaptcha are not visible in the user interface or the dashboard. But we gather the statistics on these reports to increase the success rate for these captchas.\n\n> Reports can not be used if 100% recognition feature is enabled.\n\n**Request examples:**\n\nReportBAD\n\n    https://2captcha.com/res.php?key=1abc234de56fab7c89012d34e56fa7b8&action=reportbad&id=2122988149\n\nReportGOOD\n\n    https://2captcha.com/res.php?key=1abc234de56fab7c89012d34e56fa7b8&action=reportgood&id=2122988149\n\n**List of _GET_ request parameters for https://2captcha.com/res.php**\n\n| **GET parameter** | **Type**               | **Required** | **Description** |\n| ----------------- | ---------------------- | ------------ | --------------- |\n| key               | String                 | Yes          | [your API key](#solving_captchas)|\n| action            | String                 | Yes          | reportbad - report incorrectly solved captcha \u003cbr>reportgood - confirm correct answer|\n| id                | String                 | Yes          | captcha ID      |\n| json              | Integer \u003cbr>Default: 0 | No           | 0 - server will send the response as plain text \u003cbr>1 - tells the server to send the response as JSON |\n\nServer will return `OK_REPORT_RECORDED` response to your request. Or an [error code](#error_handling) if something went wrong.\n\nIf you're getting too many incorrectly solved captchas you may provide [additional parameters](#normal_post) with your captcha to help wokers to solve it correctly\n\u003c/section>\n\n\u003csection id=\"additional\">\n\n### Additional methods\n\nYou can also get some additional information with our API, like balance, current rate, etc.  \nPlease check available parameters in the table below.\n\n**List of _GET_ request parameters for https://2captcha.com/res.php**\n\n\n| **GET parameter** | **Type**               | **Required** | **Description** |\n| ----------------- | ---------------------- | ------------ | --------------- |\n| key               | String                 | Yes          | [your API key](#solving_captchas) |\n| action            | String                 | Yes          | getbalance — get your balance \u003cbr>get — get answers for multiple captchas with one request. \u003cbr>Requires the list of captcha IDs in _ids_ parameter. \u003cbr>get2 — get the price of sent captcha and the answer. \u003cbr>Requires captcha ID in _id_ parameter. |\n| ids               | String                 | -            | Comma separated IDs of your captchas.|\n| json              | Integer \u003cbr>Default: 0 | No           | 0 - server will send the response as plain text \u003cbr>1 - tells the server to send the response as JSON |\n\nExample request (plain text):\n\n    https://2captcha.com/res.php?key=1abc234de56fab7c89012d34e56fa7b8&action=get2&id=2122988149\n\nExample response (plain text):\n\n    OK|ABCDE|0.00085\n\nExample request (JSON):\n\n    https://2captcha.com/res.php?key=1abc234de56fab7c89012d34e56fa7b8&action=get2&id=2122988149&json=1\n\nExample response (JSON):\n\n    {\n    \"status\":1,\n    \"request\":\"ABCDE\",\n    \"price\":\"0.00085\"\n    }\n\u003c/section>\n\n\u003csection id=\"examples\">\n\n### Code Examples\n\nWe invite you to explore our [GitHub repository](https://github.com/2captcha/) where you can find libraries and modules for easy integration with our API:\n\n- PHP [\\[GitHub\\]](https://github.com/2captcha/2captcha-php) [\\[Packageist\\]](https://packagist.org/packages/2captcha/2captcha)\n- Java [\\[GitHub\\]](https://github.com/2captcha/2captcha-java) [\\[Maven\\]](https://search.maven.org/artifact/com.github.2captcha/2captcha-java)\n- C# [\\[GitHub\\]](https://github.com/2captcha/2captcha-csharp) [\\[Nuget\\]](https://www.nuget.org/packages/2captcha-csharp/)\n- Python [\\[GitHub\\]](https://github.com/2captcha/2captcha-python) [\\[PyPi\\]](https://pypi.org/project/2captcha-python/)\n- JavaScript [\\[GitHub\\]](https://github.com/2captcha/2captcha-javascript) [\\[NPM\\]](https://www.npmjs.com/package/@2captcha/captcha-solver)\n- GO [\\[GitHub\\]](https://github.com/2captcha/2captcha-go)\n- Ruby [\\[GitHub\\]](https://github.com/2captcha/2captcha-ruby) [\\[RubyGems\\]](https://rubygems.org/gems/ruby-2captcha)\n- C++ [\\[GitHub\\]](https://github.com/2captcha/2captcha-cpp)\n\nYou can find even more code examples and libraries simply searching [2captcha OR rucaptcha](https://github.com/search?q=2captcha+OR+rucaptcha) on GitHub. If code is made for rucaptcha.com just replace the URL to 2captcha.com, API is the same.\n\u003c/section>\n\n\u003csection id=\"sandbox\">\n\n### Sandbox mode\n\nWe provide Sandbox mode that allows you to see and solve your captchas by yourself.  \nYou can enable Sandbox mode in your [settings](https://2captcha.com/setting)\n\nWhen Sandbox mode is enabled your captchas will not be distributed to wokers.\n\nNormal captchas will be availble in [Workers Cabinet](https://2captcha.com/cabinet/)\n\nToken-based captchas like reCAPTCHA V2, Geetest, etc are available in [Workers' software](https://2captcha.com/workers-software)\n\n**Important:** to use wokers' software you need to switch to \"Worker\" mode using the top right dropdown menu. Then copy workers' key and use it in the software.\n\n**reCAPTCHA V3 is not supported** in SandBox and will be distributed to workers.\n\u003c/section>","metadata":{"title":"2Captcha API - Captcha solver API","description":"Fast API. Easy inegration. Code examples - PHP, Python, C++, Java, Go, Ruby. Human-powered recognition service, which main purpose is solving your tasks in a quick and accurate way by human employees. You can convert to text any image that a human can recognize","keywords":"API, captcha, 2Captcha, rates, solving, ERROR_NO_SLOT_AVAILABLE"},"version":"v1","language":"en"},"fulfilledTimeStamp":1767834512062}},"mutations":{},"provided":{},"subscriptions":{},"config":{"online":true,"focused":true,"middlewareRegistered":true,"refetchOnFocus":false,"refetchOnReconnect":true,"refetchOnMountOrArgChange":false,"keepUnusedDataFor":60,"reducerPath":"globalApi","invalidationBehavior":"delayed"}},"customerPrivateStatistics":{"submittedCaptchas":{"graph":[],"total":[],"isFetching":false,"error":null},"detailedSubmittedCaptchas":{"data":{},"isFetching":false,"error":null},"reports":{"items":[],"isFetching":false,"error":null},"impossibleCaptchas":{"data":{},"isFetching":false,"error":null},"captchaReceivingErrors":{"items":[],"isFetching":false,"error":null},"unresolvedCaptchas":{"data":{},"isFetching":false,"error":null},"latestUploadedCaptchas":{"data":{},"isFetching":false,"error":null}},"auth":{"signUpConfirmation":{"data":{},"isFetching":false,"error":null},"emailChangeConfirmation":{"data":{},"isFetching":false,"error":null},"currentUser":{"item":{},"isFetching":false,"error":null}},"app":{"referral":{},"utm":{},"referer":null,"proxyHeaders":{}},"wallet":{"walletChangeConfirmation":{"data":{},"isFetching":false,"error":null},"payoutMethods":{"items":[],"isFetching":false,"error":null},"currentWallet":{"item":{},"isFetching":false,"error":null}},"cabinet":{"auth":{"data":{},"isFetching":false,"error":null},"currentCaptcha":{"data":{},"isFetching":false,"error":null},"workerMistakes":{"data":{},"isFetching":false,"error":null},"trainingSummary":{"data":{},"isFetching":false,"error":null}}};
            window.initialI18nStore = {"en":{"basic_layout":{"footer":{"section_names":{"captcha_solver":"Captcha solver","general":"General","proxy_services":"Proxy Services","datasets":"Data annotation service","captchas":"Captcha supported","company":"Company","captcha_solver_sdk":"Captcha solver SDK"},"reviews":{"items":{"trustpilot":"«Trustpilot» rating — 4.0 out of 5 stars","g2":"«G2» rating — 4.5 out of 5 stars","sourceforge":"«SourceForge» rating - 4.5 out of 5 stars"}},"social_networks":{"title":"Follow us","items":{"facebook":"«{{site_name}}» facebook group","telegram":"«{{site_name}}» telegram channel","x":"«{{site_name}}» on x","youtube":"«{{site_name}}» YouTube channel","github":"«{{site_name}}» on GitHub","linkedin":"«{{site_name}}» on LinkedIn"}},"contacts":{"title":"Contact us"},"copyright":"Copying any part of this website without the explicit permission of the website owner is illegal.","extension_link":{"icon_alt":"Captcha bypass extension supported in Chrome and Firefox browsers","text":"Captcha bypass extension","footer":"Recommended extension"},"alternative_extensions":{"h_captcha":{"text":"hCaptcha Solver Extension","icon_alt":"hCaptcha logo"},"recaptcha":{"text":"reCAPTCHA Solver Extension","icon_alt":"reCAPTCHA logo"},"footer":"Alternative extensions"},"new_features":{"title":"New features","links":{"captcha_solver":"{{captcha_name}} solver","mobile_proxies":"Mobile proxy: 5G/4G/3G/LTE","us_proxies":"Buy US IP (residential proxy server)"}},"captchathecat":{"logo_alt":"«CaptchaTheCat» logo","label":"In the monitoring service rating"},"home_page_link":"To home page","site_documents_links":{"payment_policy":"Payment policy","privacy_policy":"Privacy policy","terms_of_service":"Terms of service"},"site_logo_alt":"Logo of «{{site_name}}»","site_navigation_links":{"about":"About","api_docs":"Captcha solver API","blog":"Blog","captcha_jobs":"Work for us","captcha_solver":"Captcha break","faq":"FAQ","online_statistics":"Online statistics","pricing":"Pricing","software":"Software","affiliate_program":"Affiliate program","proxy":"Residential proxies","bounding_box_annotation":"Bounding box annotation","dataset_annotation":"Dataset annotation","captcha_breaker":"Captcha breaker","captcha_solver_github":"Captcha solver GitHub","captcha_solver_tool":"{{tool}} captcha solver","residential_proxies":"Residential proxies","https_proxies":"HTTP/S proxies","socks5_proxies":"SOCKS5 proxies","rotating_proxies":"Rotating proxies","browser_extension":"Browser extension","more_captchas":"More types","enterprise_support":"Enterprise support","dataset_api":"Dataset API","tutorials":"How-to tutorials"},"supported_payment_systems":"We support {{payment_systems}} payment systems"},"header":{"home_page_link":"To home page","site_logo_alt":"Logo of «{{site_name}}»","captcha_solver":{"title":"Captcha solver","popular_captchas":"Popular captchas","other_captchas":"Other captchas","close_menu":"Close captcha menu"},"site_navigation_links":{"about_captcha_recognition":"Captcha solving service","api_docs":"API","blog":"Blog","captcha_jobs":"Entry job","dashboard":"Dashboard","faq":"Support","online_statistics":"Statistics","payout":"Payout","software":"Software","start_work":"Start work","contact_sales":"Contact sales","proxy":"Proxy"},"toggle_navigation_menu":"Toggle site navigation menu","user_navigation_links":{"select_role":{"label":"Select your user role:","roles":{"customer":"Customer","developer":"Developer","placeholder":"Choose role","worker":"Worker"}},"sign_in":"Log in","sign_out":"Sign out","sign_up":"Sign up"}}},"captcha_names":{"items":{"canvas_captcha":"Canvas Captcha","capy_puzzle_captcha":"Capy Puzzle CAPTCHA","click_captcha":"Click Captcha","fun_captcha":"FunCaptcha","gee_test_captcha":"GeeTest CAPTCHA","gee_test_captcha_v4":"GeeTest CAPTCHA V4","grid_captcha":"Grid Captcha","h_captcha":"hCaptcha","lemin_captcha":"Lemin Captcha","normal_captcha":"Normal Captcha","image_captcha":"Image Captcha","recaptcha_enterprise":"reCAPTCHA Enterprise","recaptcha_v2":"reCAPTCHA V2","recaptcha_v2_callback":"reCAPTCHA V2 Callback","recaptcha_v2_invisible":"reCAPTCHA V2 Invisible","recaptcha_v3":"reCAPTCHA V3","rotate_captcha":"Rotate Captcha","solve_media_captcha":"Solve Media CAPTCHA","text_captcha":"Text Captcha","vk_captcha":"VK Captcha","yandex_captcha":"Yandex Captcha","yandex_smart_captcha":"Yandex SmartCaptcha","aws_waf":"Amazon CAPTCHA","cloudflare_turnstile":"Cloudflare Turnstile","mtcaptcha":"MTCaptcha","datadome_captcha":"DataDome CAPTCHA","cutcaptcha":"Cutcaptcha","friendly_captcha":"Friendly Captcha","russian_captcha":"Russian Captcha","chinese_captcha":"Chinese Captcha","number_captcha":"Number Captcha","math_captcha":"Math Captcha","slider_captcha":"Slider Captcha"}},"landing":{"hero":{"actions":{"quick_start":"Quick Start","pricing":"Pricing"}},"page_navigation":{"actions":{"show":"Show page navigation","hide":"Hide page navigation"}},"alternative_extensions":{"title":"Alternative extensions","h_captcha":{"text":"hCaptcha Solver Extension","icon_alt":"hCaptcha logo"},"recaptcha":{"text":"reCAPTCHA Solver Extension","icon_alt":"reCAPTCHA logo"}},"captcha_bypass_table":{"actions":{"more":"More"},"text":["{{site_name}} is the market leader in {{captcha_name}} bypass services.","No risk: pay only for automatically solved captchas.","The captcha recognition service is fully automated.","The bypass process is as follows: using the API, the customer passes a set of necessary parameters from the captcha placement page to the service, where the employee solves it. After that, the customer requests a set of parameters that must be passed to the appropriate fields to solve the captcha on the page."],"headings":{"captcha_name":"Captcha name","price":"Price per 1000","solving_speed":"Solving speed","api":"How to bypass"},"rows":{"captcha_name":"{{captcha_name}}","solving_speed":"{{solving_speed}}s"}},"api_clients":{"logo_alt":"We support API for «{{lang}}» language"},"github":{"logo_alt":"Logo of «GitHub»","content":{"title":"GitHub Repositories: SDKs and code examples","text":"Full documentation and {{captcha_name}} bypass code examples on <github_link>GitHub</github_link>"},"fallback_content":{"title":"Captcha bypass solution on GitHub","text":"Full documentation and captcha bypass code examples on <github_link>GitHub</github_link>"}},"security_standards":{"logo_alt":"«{{standard}}» logo"},"captcha_bypass_extension":{"link":"Add to browser","supported_browsers_alt":"Captcha Bypass Extension supported in Chrome and Firefox browsers","text":"This plugins allows you to automatically solve and bypass captchas found on any webpage.","content":{"extension_demo_alt":"Captcha solver browser extensions","title":"Captcha solver browser extensions"},"fallback_content":{"extension_demo_alt":"Captcha bypass extension","title":"Captcha bypass extension"}},"selenium_and_puppeteer":{"img_alt":"Bypass captcha using Selenium/Puppeteer with {{site_name}} service","selenium":{"title":"Selenium","text":"Captcha bypassing for Selenium:","links":{"landing":"Selenium captcha solver","article":"Manual: How to solve reCAPTCHA in Selenium"}},"puppeteer":{"title":"Puppeteer","text":"Automate captcha bypass in Puppeteer:","links":{"landing":"Puppeteer captcha solver","article":"Manual: How to solve reCAPTCHA in Puppeteer"}}},"bounding_box":{"title":"Data labeling","text":"<data_labeling_link>Bounding box annotation and object detection</data_labeling_link> for AI/ML companies that require model training:","links":{"landing":"Bounding box annotation service","blog":"API requests example","dataset_annotation":"Dataset annotation","satellite_image_annotation":"Satellite image annotation","image_annotation":"Image annotation"},"links_alt":{"dataset_annotation":"Dataset annotation using «{{site_name}}»","satellite_image_annotation":"Satellite image annotation using «{{site_name}}»","image_annotation":"Image annotation using «{{site_name}}»"},"img_alt":"Bounding box object detection service"},"proxy_navigation":{"items":{"proxy_service":"{{site_name}} proxy","residential_proxies":"Residential proxies","premium_proxies":"Premium proxies","datacenter_proxies":"Datacenter proxies","isp_proxies":"ISP proxies","mobile_proxies":"Mobile proxies","socks5_proxies":"SOCKS5 proxies","https_proxies":"HTTPS/HTTP proxies","rotating_proxies":"Rotating proxies","elite_proxies":"Elite proxies","anonymous_proxies":"Anonymous proxies"},"additional_items":{"actions":{"show":"Show additional items","hide":"Hide additional items"}},"logo_alt":"«{{proxy_type}}» logo"},"local_proxy_navigation":{"items":{"local_proxies":"Local proxies","us_proxies":"American proxies","ca_proxies":"Canadian proxies","mx_proxies":"Mexican proxies","br_proxies":"Brazilian proxies","de_proxies":"German proxies","fr_proxies":"French Proxies","ru_proxies":"Russian proxies","uk_proxies":"British proxies","es_proxies":"Spanish proxies","pt_proxies":"Portuguese proxies"},"additional_items":{"actions":{"show":"Show additional items","hide":"Hide additional items"}},"logo_alt":"«{{proxy_type}}» logo"},"proxy_reviews":{"title":"The best customer experience provided by leading proxy service provider","items":{"g2":"«G2» rating - 4.5 out of 5 stars","sourceforge":"«SourceForge» rating - 4.5 out of 5 stars","captchathecat":"«Captchathecat» rating - 9.8 out of 10 stars"}},"proxy_getting_started":{"title":"How to get started","img_alt":"How to get started using {{site_name}} proxy service","items":{"sign_up":"Register on the website","select_traffic_amount":"Select the required amount of traffic","generate_proxy_settings":"Open the generator and set the connection settings: GEO, protocol","get_auth_data":"Get authorization data to get started","connect_to_proxy":"Connect to the proxy server"}},"proxy_price":{"title":"Residential proxy price","info":"Proxy plans is directly linked to the volume of gigabytes you purchase. The more gigabytes you procure, the greater the discount you unlock! It's that simple. Unlock discounts with bulk proxy purchases!","features":{"rotating":"Flexible rotation options","api_access":"API access","socks5_supported":"SOCKS5 supported","unlimited_traffic":"Unlimited traffic"},"price":"Price","discount":"Discount {{amount}}%","action":"Buy residential proxy","supported_payment_methods":{"label":"We accept these payment methods:","alt":"We support Visa, Mastercard, Airtm, PayPal, Alipay, BTC, USDT payment methods"}},"proxy_plans":{"title":"Purchase of residential proxy plans","item":{"popular":"Popular Plan","discount":"{{amount}}% Off","price":"Price per 1GB","action":"Order now"}},"proxy_locations":{"title":"Rotated and static resident proxies worldwide","text":"Real residential IPs worldwide. Wide proxy pool covers locations across the world. The network of rotated (dynamic) and static (sticky) resident proxies covers more than 220 countries and the set of IP addresses exceeds the mark of 90 million. Access information you need, no matter the location.","action":"Explore residential proxy locations","sections":{"asia":"Asia","europe":"Europe","africa":"Africa","oceania":"Oceania","north_america":"North America","south_america":"South America","top":"Top city and state IPs"}},"proxy_code_examples":{"title":"Code examples","text":"Effortlessly incorporate proxy into your projects. We ensure a seamless integration of our products into your infrastructure, making the process as effortless as possible. With support for multiple languages and readily available code examples, a swift and uncomplicated start to your web project is guaranteed."},"proxy_faq":{"title":"FAQ","sections":{"general_questions":{"title":"General questions","items":{"config_generation":{"title":"How do I generate a proxy configuration?","text":"<ol> <li> Go to the configurator block on the Proxy page. </li> <li> Choose the type from: <ul> <li>State (Province) - City - targeting by State and City</li> <li>ISP - targeting by Internet Service Provider</li> </ul> </li> <li> Choose the Geo-position setting: <ul> <li>Global Mix - Geo is picked randomly</li> <li>Europe Mix - Geo is picked randomly in Europe</li> <li>Asia Mix - Geo is picked randomly in Asia</li> <li>City Mix - City is picked randomly</li> </ul> </li> <li> Set the \"IP duration\" setting based on your needs. It states for how long will the proxy be valid from 0 (every new requests goes via a new IP address) to 120 minutes. We recommend to set 3 minutes. </li> <li> Press <b>Generate</b> button and check the actual proxy configuration. </li> </ol>"},"change_ip":{"title":"How can I change the IP address manually?","text":"You can change the setting of the proxy (Geo settings for example) or you can set the IP duration to 0 so the IP is changed every time you use it."},"ip_duration":{"title":"\"IP duration (0 - 120 Min)\" does this mean that after 2 hours (120 Min) the proxies will stop working? If yes, is there a way to change it?","text":"No, there is no way to keep the session for longer than 120 minutes"},"protocols":{"title":"How is the data encrypted when passing through your residential proxies? Are there any specific encryption protocols you use?","text":"We are utilizing those protocols: HTTP, HTTPS and SOCKS5. We don't use any more protocols."},"trial":{"title":"How can I test before I buy?","text":"Unfortunately, we can't provide a trial or free traffic for a proxy."},"threads_count":{"title":"What is the maximum threads your proxy could handle?","text":"We don't limit the number of threads you use."},"blocked_sites":{"title":"Do you somehow limit traffic? Any blocked sites may be?","text":"You will not be able to use proxy with paypal.com and web.telegram.org"},"available_countries":{"title":"Where is your service available?","text":"Worldwide, except China."},"due_date":{"title":"Is there any due date for the purchased traffic?","text":"Yes, you should use prepaid traffic within 3 months."}}},"sessions":{"title":"Sessions","items":{"ip_changing":{"title":"How is IP changing: strictly on time or sometimes when there are no requests?","text":"The IP-address is changed strictly according to the time set in the settings, unless something unpredictable happens (user turned off the PC, disconnection, etc.)."},"session_end":{"title":"Will the sessions be interrupted when the IP address changes?","text":"When the IP address duration is over, the new IP address is instantly assigned."},"ip_duration":{"title":"How can I change the IP from time to time?","text":"Use IP duration for setting the time of proxy work."},"proxy_list":{"title":"How can I generate a bulk proxy list?","text":"You can use 'Generate proxy list' function to get a list of proxy with unique IP addresses."},"proxy_list_settings":{"title":"Will I have guaranteed unique IP addresses using your 'Generate proxy list' function?","text":"The nature of residential proxy doesn't allow us to check all of it at the moment you requested the list because it's dynamic in nature. This depends on the geo-settings of your proxy list. If you try to get, say, 1000 IP out of the city with 100 devices, obviously we will not be able to provide that amount of devices online, so please keep that in mind when you set up the geolocation."}}},"tariffs":{"title":"Tariffs","items":{"traffic_calculations":{"title":"How is traffic counted: separately or incoming plus outgoing?","text":"Traffic is calculated as the sum of incoming and outgoing traffic. We are aware that some services claim that they count only outgoing, but we tested it and have serious doubts about that being so."},"account_lockout":{"title":"Could you block my account for anything?","text":"Please be aware that we have the right to disable an account if we receive a complaint from our payment processor."}}},"logging_and_tracking":{"title":"Logging & Tracking","items":{"data_logging":{"title":"What is your policy regarding data logging? How is it stored and protected?","text":"We don't log anything."},"traffic_tracking":{"title":"Do you somehow track the traffic or websites visited via proxy? Do you disclose this personal information to someone?","text":"No, we don't track anything, and we have no KYC, so it's safe to say we have zero information about customers. So we can't disclose any information about customers, as we store none of it."}}}}},"proxy_use_cases":{"title":"Use cases","items":{"testing":{"title":"Testing","text":"Integrate with emulators for application testing or automation seamlessly."},"scraping":{"title":"Scraping","text":"Scraping data from apps and platforms. Hide scraping activities from target applications, sites."},"review_monitoring":{"title":"Review monitoring"},"ad_verification":{"title":"Ad verification"},"cybersecurity":{"title":"Cybersecurity"},"data_collection":{"title":"Travel fare aggregation"}}},"proxy_promo":{"title":"Buy our proxies","items":{"parse_sites":"Access any website and extract the data you need","simulate_user_behavior":"Avoid website blocks by acting like a regular user","bypass_restrictions":"Bypass GEO restricted content and access localized data","speed_up_your_work":"Enjoy faster speeds with one hop connectivity"},"action":"Quick start"},"proxy_hero":{"main_advantages":{"countries":"<b>220+</b> Countries","residential_ips":"<b>90M+</b> Residential IPs","uptime":"<b>99,9%</b> Uptime","response_time":"<b>~0,7</b> Response time"}},"data_annotation_navigation":{"items":{"data_labeling":"Data labeling","bounding_box":"Bounding box","dataset_annotation":"Dataset annotation","satellite_image_annotation":"Satellite image annotation","image_annotation":"Image annotation"}},"contact_sales":{"text":"Scale up your business with {{site_name}}","action":"Contact sales","form":{"alerts":{"success":"Your message has been successfully sent. We will contact you shortly."},"title":"Contact our sales team","field_names":{"firstName":"First name","lastName":"Last name","email":"Email","phone":"Phone","message":"Message"},"field_labels":{"firstName":"First name","lastName":"Last name","email":"Email","phone":"Phone","message":"Message"},"field_placeholders":{"firstName":"First name","lastName":"Last name","email":"Work email","phone":"Phone number","message":"Can you share more about your business needs and challenges?"},"agreement":"By clicking \"Contact sales\", I agree to the <terms_of_service_link>Terms of Service</terms_of_service_link> and <privacy_policy_link>Privacy Policy</privacy_policy_link>","actions":{"submit":"Send"}}},"profile_contacts":{"title":"Please provide an alternative communication channel","desc":"For urgent contact only — never used for ads.","select":"Select","submit":"Save","contact":"Contact","facebook_ph":"Profile or ID","imessage_ph":"Email or phone number","whatsapp_ph":"Phone number","wechat_ph":"WeChat ID","line_ph":"LINE ID or phone","kakaotalk_ph":"KakaoTalk ID","telegram_ph":"@username or phone","zalo_ph":"Phone number","vkmessenger_ph":"Profile or ID","viber_ph":"Phone number","signal_ph":"Phone number","alerts":{"success":{"title":"Contacts saved","text":"Your contacts were saved. You can view or edit them in your profile settings.","action":"Profile settings"}}}},"common":{"actions":{"how_to_solve":"How to solve","select_your_language":"Select your language","to_home_page":"To home page","toggle_navigation_menu":"Toggle navigation menu"},"captcha_form":{"field_labels":{"recaptcha":"Confirm that you are not a robot","text_captcha":"Enter text from the image"},"fill_recaptcha_message":"Solve reCAPTCHA","go_to_prev_step":"Back","type_text_captcha_message":"Type text captcha"},"chip":{"delete_action":"Delete this chip"},"code_snippet":{"code_successfully_copied":"Copied!","copy_action":"Copy code snippet"},"cookie_usage_notification":{"action":"Okay, thanks","description":"This site uses cookies. Cookies remember you, so we can provide you with personalized services. Read our <privacy_policy_link>privacy policy</privacy_policy_link>.","title":"Cookie usage notification"},"dashboard_toolbar":{"actions":{"pay":"add funds","payout":"withdraw funds","go_back":"go back"},"faq_links":{"my_tickets":"My tickets:","support":"Support","unread_replies":"Pending replies:"}},"faq_sidebar":{"open_tickets":"Tickets: {{value}}","unread_tickets":"Pending replies: {{value}}","toggle_navigation":"Toggle page navigation","navigation_links":{"api_docs":"API","captcha_demo":"Captcha demo","customer_faq":"Customer's FAQ","developer_faq":"Developer's FAQ","proxy_faq":"Proxy FAQ","new_ticket":"Create ticket","sdk":"SDK","software":"Software catalog","support":"Support","support_tickets":"My tickets","worker_faq":"Worker's FAQ","workers_software":"Software for workers","worker_terms":"Terms for Workers","pricing":"Pricing","support_bot":"Chat with assistant","tutorial_faq":"How to tutorials"}},"file_upload":{"actions":{"delete_file":"Delete file","download_file":"Download file"},"label":"Attach file by dragging & dropping, seletecting or pasting them.","measures":{"mb":"MB"}},"form":{"actions":{"reset":"Reset","save":"Save","submit":"Submit"},"form_submit_failed":"Data could not be saved, please try again later."},"modal_window":{"close_message":"Close modal window"},"pagination":{"first_page":"To first page","last_page":"To last page","next_set_of_pages":"Next set of pages","page":"Page","prev_set_of_pages":"Previous set of pages","title":"Pagination"},"password_input":{"hide_password_message":"Hide the entered password","show_password_message":"Show the entered password"},"pop_confirm":{"actions":{"cancel":"No","ok":"Yes"},"title":"Confirm the operation"},"route_error_boundary":{"content_message":"Failure when loading this page, please try refreshing the page. If the error persists, contact technical support","reload_page":"Reload page","title":"Oops, something went wrong."},"service_temporarily_unavailable":{"description":"Our service availability is currently affected by a backbone issue at one of our service providers. The website and API access can be limited. We are sorry for the incovenience and waiting for a solution from our service provider."},"table":{"total":"Total:","no_data":"No data."},"theme_switch":{"label":"Dark theme:","values":{"off":"Off","on":"On"}},"time_intervals":{"actions":{"filter":"Filter"},"hints":{"max_interval":"* The date interval cannot be more than 1 year."},"labels":{"main":"Time interval","date_from":"Date from:","date_to":"Date to:"},"month":"Last 30 days","other":"Other","six_months":"Last 6 months","today":"Today","week":"Last 7 days","yesterday":"Yesterday","three_months":"Last 3 months"},"toggle_button":{"values":{"off":"Off","on":"On"}},"copy_text":{"action":"Copy","result":"Copied"},"user_notifications":{"title":"New notification","action":"Close"},"measurements":{"avg":"avg.","sec":"sec.","mb":"MB"},"discount_campaign_banner":{"amount":"{{amount}}% Off Proxies","text":"Limited time offer - don't miss out!","action":"Quick start","close":"Close banner"},"enterprise_support":{"title":"Enterprise support","extended_title":"<b>Enterprise support plan.</b> For more comprehensive needs.","logo_alt":"enterprise support logo","features":{"api_integration":"Assistance with integrating custom API solutions","quick_support":"Faster response times for your requests","code_review":"Code review and debugging support"},"actions":{"read_more":"Read more","create_ticket":"Create Ticket","view_details":"Details","close":"Hide widget"},"statuses":{"active":"Active"},"conditions_met":{"monthly_expenses":"A monthly expenditure of {{monthly_expenses}}","account_balance":"Account balance over {{account_balance}}","plan_purchase":"Enterprise support plan purchased"}}},"api_docs":{"content":{"main":{"title":"{{site_name}} API v2","subtitle":"{{site_name}} is a human-powered image and CAPTCHA recognition service. {{site_name}}'s main purpose is solving your CAPTCHAs in a quick and accurate way by human employees, but the service is not limited only to CAPTCHA solving. You can convert to text any image that a human can recognize.","captcha_logo_alt":"Logo of «{{captcha_name}}»","recent_changes":{"title":"Recent Changes","action":"More"},"faq":{"title":"FAQ","action":"More"},"try_new_api":{"title":"Try new API. API v2 is built on JSON","text":"The earlier API v1 continues to be stable and supported. If you do not plan to use the new API v2, no action is required. We support both versions of the API.","action":"Try API v2","img_alt":"New JSON API","close":"Close notification and continue reading API v1"}},"navigation":{"toggle_navigation":"Toggle API docs navigation","select_api_version":"API version:","github_logo_alt":"Logo of «GitHub»","go_up":"Go up"},"api_docs_switcher":{"items":{"captcha_solver_api":"Captcha Solver API","proxy_api":"Proxy API"}}},"meta":{}}}};
            window.initialLanguage = 'en';
            window.initialHostname = '2captcha.com';
            window.userAcceptLanguageHeader = 'en-US,en;q=0.5';
            </script><!-- Google Tag Manager --> <script>(function(w,d,s,l,i){w[l]=w[l]||[];w[l].push({'gtm.start': new Date().getTime(),event:'gtm.js'});var f=d.getElementsByTagName(s)[0], j=d.createElement(s),dl=l!='dataLayer'?'&l='+l:'';j.async=true;j.src= 'https://www.googletagmanager.com/gtm.js?id='+i+dl;f.parentNode.insertBefore(j,f); })(window,document,'script','dataLayer','GTM-54JRQLV');</script> <!-- End Google Tag Manager --><style>
/* assets/Alert-Dml5DUQ1.css */
@keyframes _alert-slide-bottom_1uhb6_1{0%{transform:translateY(2000px)}to{transform:translateY(0)}}
/* assets/Alert-DyPrVIDF.css */
@keyframes _alert-slide-bottom_bl73y_1{0%{transform:translateY(2000px)}to{transform:translateY(0)}}
/* assets/ArticleForm-DG0eaRor.css */
[class=md-editor-mermaid][data-processed] { display: block; }@keyframes spin{0%{transform:rotate(0)}to{transform:rotate(1turn)}}@keyframes zoomIn{0%{opacity:0;transform:scale3d(.3,.3,.3)}50%{opacity:1}}@keyframes zoomOut{0%{opacity:1}50%{opacity:0;transform:scale3d(.3,.3,.3)}to{opacity:0}}
/* assets/Basic-BOhtFLTl.css */
@keyframes _toggle-navigation-menu_1n4dx_1{0%{max-height:0;opacity:0}to{max-height:700px;opacity:1}}
/* assets/Basic-BZrhdBgf.css */
@keyframes _toggle-navigation-menu_1n4dx_1{0%{max-height:0;opacity:0}to{max-height:700px;opacity:1}}
/* assets/Basic-C9Un8W0A.css */
@keyframes _fadeInOut_sm7kw_1{0%{opacity:0}25%{opacity:1}60%{opacity:1}to{opacity:0}}@keyframes _toggle-navigation-menu_1n4dx_1{0%{max-height:0;opacity:0}to{max-height:700px;opacity:1}}
/* assets/Basic-CZZhi7mW.css */
@keyframes _fadeInOut_sm7kw_1{0%{opacity:0}25%{opacity:1}60%{opacity:1}to{opacity:0}}@keyframes _toggle-navigation-menu_1n4dx_1{0%{max-height:0;opacity:0}to{max-height:700px;opacity:1}}
/* assets/Basic-Dfl5Bv3j.css */
@keyframes _fadeInOut_sm7kw_1{0%{opacity:0}25%{opacity:1}60%{opacity:1}to{opacity:0}}@keyframes _toggle-navigation-menu_1n4dx_1{0%{max-height:0;opacity:0}to{max-height:700px;opacity:1}}
/* assets/Basic-Dn-k0_pH.css */
@keyframes _toggle-navigation-menu_1n4dx_1{0%{max-height:0;opacity:0}to{max-height:700px;opacity:1}}
/* assets/Basic-oTAkLdG-.css */
@keyframes _toggle-navigation-menu_1n4dx_1{0%{max-height:0;opacity:0}to{max-height:700px;opacity:1}}
/* assets/Form-DkVjMYHI.css */
form { position: relative; }@media (max-width:600px) {form { width: 100%; }}
/* assets/SecurityStandards-CcnUcqIL.css */
@supports (gap:20px) and (display:flex){._list_148vf_1{display:flex;flex-wrap:wrap}}
/* assets/github-theme-BHqmp2QF.css */
strong { font-weight: 600; }
/* assets/index--Q8AIcbq.css */
*,:after,:before { --tw-border-spacing-x: 0;--tw-border-spacing-y: 0;--tw-translate-x: 0;--tw-translate-y: 0;--tw-rotate: 0;--tw-skew-x: 0;--tw-skew-y: 0;--tw-scale-x: 1;--tw-scale-y: 1;--tw-pan-x:  ;--tw-pan-y:  ;--tw-pinch-zoom:  ;--tw-scroll-snap-strictness: proximity;--tw-gradient-from-position:  ;--tw-gradient-via-position:  ;--tw-gradient-to-position:  ;--tw-ordinal:  ;--tw-slashed-zero:  ;--tw-numeric-figure:  ;--tw-numeric-spacing:  ;--tw-numeric-fraction:  ;--tw-ring-inset:  ;--tw-ring-offset-width: 0px;--tw-ring-offset-color: #fff;--tw-ring-color: rgba(59,130,246,.5);--tw-ring-offset-shadow: 0 0 transparent;--tw-ring-shadow: 0 0 transparent;--tw-shadow: 0 0 transparent;--tw-shadow-colored: 0 0 transparent;--tw-blur:  ;--tw-brightness:  ;--tw-contrast:  ;--tw-grayscale:  ;--tw-hue-rotate:  ;--tw-invert:  ;--tw-saturate:  ;--tw-sepia:  ;--tw-drop-shadow:  ;--tw-backdrop-blur:  ;--tw-backdrop-brightness:  ;--tw-backdrop-contrast:  ;--tw-backdrop-grayscale:  ;--tw-backdrop-hue-rotate:  ;--tw-backdrop-invert:  ;--tw-backdrop-opacity:  ;--tw-backdrop-saturate:  ;--tw-backdrop-sepia:  ;--tw-contain-size:  ;--tw-contain-layout:  ;--tw-contain-paint:  ;--tw-contain-style:  ; }::backdrop { --tw-border-spacing-x: 0;--tw-border-spacing-y: 0;--tw-translate-x: 0;--tw-translate-y: 0;--tw-rotate: 0;--tw-skew-x: 0;--tw-skew-y: 0;--tw-scale-x: 1;--tw-scale-y: 1;--tw-pan-x:  ;--tw-pan-y:  ;--tw-pinch-zoom:  ;--tw-scroll-snap-strictness: proximity;--tw-gradient-from-position:  ;--tw-gradient-via-position:  ;--tw-gradient-to-position:  ;--tw-ordinal:  ;--tw-slashed-zero:  ;--tw-numeric-figure:  ;--tw-numeric-spacing:  ;--tw-numeric-fraction:  ;--tw-ring-inset:  ;--tw-ring-offset-width: 0px;--tw-ring-offset-color: #fff;--tw-ring-color: rgba(59,130,246,.5);--tw-ring-offset-shadow: 0 0 transparent;--tw-ring-shadow: 0 0 transparent;--tw-shadow: 0 0 transparent;--tw-shadow-colored: 0 0 transparent;--tw-blur:  ;--tw-brightness:  ;--tw-contrast:  ;--tw-grayscale:  ;--tw-hue-rotate:  ;--tw-invert:  ;--tw-saturate:  ;--tw-sepia:  ;--tw-drop-shadow:  ;--tw-backdrop-blur:  ;--tw-backdrop-brightness:  ;--tw-backdrop-contrast:  ;--tw-backdrop-grayscale:  ;--tw-backdrop-hue-rotate:  ;--tw-backdrop-invert:  ;--tw-backdrop-opacity:  ;--tw-backdrop-saturate:  ;--tw-backdrop-sepia:  ;--tw-contain-size:  ;--tw-contain-layout:  ;--tw-contain-paint:  ;--tw-contain-style:  ; }*,:after,:before { border: 0 solid #e5e7eb;box-sizing: border-box; }:after,:before { --tw-content: ""; }:host,html { -webkit-text-size-adjust: 100%;font-feature-settings: normal;-webkit-tap-highlight-color: transparent;font-family: Manrope,system-ui,-apple-system,Segoe UI,Roboto,Ubuntu,Cantarell,Noto Sans,sans-serif;font-variation-settings: normal;line-height: 1.5;-moz-tab-size: 4;-o-tab-size: 4;tab-size: 4; }body { line-height: inherit;margin: 0; }hr { border-top-width: 1px;color: inherit;height: 0; }abbr:where([title]) { -webkit-text-decoration: underline dotted;text-decoration: underline dotted; }h1,h2,h3,h4,h5,h6 { font-size: inherit;font-weight: inherit; }a { color: inherit;text-decoration: inherit; }b,strong { font-weight: bolder; }code,kbd,pre,samp { font-feature-settings: normal;font-family: ui-monospace,SFMono-Regular,Menlo,Monaco,Consolas,Liberation Mono,Courier New,monospace;font-size: 1em;font-variation-settings: normal; }small { font-size: 80%; }sub,sup { font-size: 75%;line-height: 0;position: relative;vertical-align: baseline; }sub { bottom: -.25em; }sup { top: -.5em; }table { border-collapse: collapse;border-color: inherit;text-indent: 0; }button,input,optgroup,select,textarea { font-feature-settings: inherit;color: inherit;font-family: inherit;font-size: 100%;font-variation-settings: inherit;font-weight: inherit;letter-spacing: inherit;line-height: inherit;margin: 0;padding: 0; }button,select { text-transform: none; }button,input:where([type=button]),input:where([type=reset]),input:where([type=submit]) { -webkit-appearance: button;background-color: transparent;background-image: none; }:-moz-focusring { outline: auto; }:-moz-ui-invalid { box-shadow: none; }progress { vertical-align: baseline; }::-webkit-inner-spin-button,::-webkit-outer-spin-button { height: auto; }[type=search] { -webkit-appearance: textfield;outline-offset: -2px; }::-webkit-search-decoration { -webkit-appearance: none; }::-webkit-file-upload-button { -webkit-appearance: button;font: inherit; }summary { display: list-item; }blockquote,dd,dl,figure,h1,h2,h3,h4,h5,h6,hr,p,pre { margin: 0; }fieldset { margin: 0; }fieldset,legend { padding: 0; }menu,ol,ul { list-style: none;margin: 0;padding: 0; }dialog { padding: 0; }textarea { resize: vertical; }input::-moz-placeholder,textarea::-moz-placeholder { color: #9ca3af;opacity: 1; }input:-ms-input-placeholder,textarea:-ms-input-placeholder { color: #9ca3af;opacity: 1; }input::placeholder,textarea::placeholder { color: #9ca3af;opacity: 1; }[role=button],button { cursor: pointer; }:disabled { cursor: default; }audio,canvas,embed,iframe,img,object,svg,video { display: block;vertical-align: middle; }img,video { height: auto;max-width: 100%; }[hidden]:where(:not([hidden=until-found])) { display: none; }:root { --base-font-family: "Manrope",system-ui,-apple-system,Segoe UI,Roboto,Ubuntu,Cantarell,Noto Sans,sans-serif;--base-font-size: 16px;--base-line-height: 26px;--primary-color: #00a1b3;--active-primary-color: #008a9a;--light-primary-color: #cbf0e9;--secondary-color: #969696;--white-color: #fff;--dark-color: #333;--light-color: #f8f9fb;--success-color: #42c52c;--danger-color: #ff6464;--blue-color: #2484fc;--gray-color: #5b6a7d;--active-gray-color: #3c4c60;--lime-color: #cbe417;--active-lime-color: #deed74;--night-rider-color: var(--night-rider-color-800);--night-rider-color-100: #e6e6e6;--night-rider-color-200: #ccc;--night-rider-color-300: #b3b3b3;--night-rider-color-400: #999;--night-rider-color-500: grey;--night-rider-color-600: #666;--night-rider-color-700: #4d4d4d;--night-rider-color-800: #333;--night-rider-color-900: #1a1a1a;--raisin-black-color: var(--raisin-black-color-900);--raisin-black-color-300: #b3b3b3;--raisin-black-color-800: #333;--raisin-black-color-900: #232323;--alice-blue-color: #f8f9fa;--tulip-color: #fcc;--dark-red-color: #8a0000;--harlequin-green-color: #42c52c;--space-xs: 4px;--space-sm: 8px;--space-md: 16px;--space-lg: 32px;--space-xl: 64px;--space-xxl: 128px;--content-width: 640px; }body { word-wrap: break-word;--tw-bg-opacity: 1;--tw-text-opacity: 1;background-color: rgba(255,255,255,var(--tw-bg-opacity));color: rgba(51,51,51,var(--tw-text-opacity));font-family: Manrope,system-ui,-apple-system,Segoe UI,Roboto,Ubuntu,Cantarell,Noto Sans,sans-serif;font-size: 16px;font-weight: 400;line-height: 26px;margin: 0;min-height: 100vh;min-width: 320px;padding: 0; }body:where([class=dark-theme],[class=dark-theme] *) { --tw-bg-opacity: 1;--tw-text-opacity: 1;background-color: rgba(51,51,51,var(--tw-bg-opacity));color: rgba(255,255,255,var(--tw-text-opacity));font-weight: 350; }[class*=yt-lite]>div[class*=lty-playbtn] { background-color: red;opacity: 1; }details summary::-webkit-details-marker { display: none; }@keyframes _bblFadInOut_10462_1{0%,80%,to{box-shadow:0 2.5em 0 -1.3em}40%{box-shadow:0 2.5em}}@font-face{font-display:swap;font-family:Manrope;font-style:normal;font-weight:400 700;src:url(/dist/web/assets/manrope-4qdASHmp.woff2) format("woff2");unicode-range:U+0301,U+0400-045f,U+0490-0491,U+04b0-04b1,U+2116}@font-face{font-display:swap;font-family:Manrope;font-style:normal;font-weight:400 700;src:url(/dist/web/assets/manrope-4qdASHmp.woff2) format("woff2");unicode-range:U+0102-0103,U+0110-0111,U+0128-0129,U+0168-0169,U+01a0-01a1,U+01af-01b0,U+0300-0301,U+0303-0304,U+0308-0309,U+0323,U+0329,U+1ea0-1ef9,U+20ab}@font-face{font-display:swap;font-family:Manrope;font-style:normal;font-weight:400 700;src:url(/dist/web/assets/manrope-4qdASHmp.woff2) format("woff2");unicode-range:U+0100-02af,U+0304,U+0308,U+0329,U+1e00-1e9f,U+1ef2-1eff,U+2020,U+20a0-20ab,U+20ad-20cf,U+2113,U+2c60-2c7f,U+a720-a7ff}@font-face{font-display:swap;font-family:Manrope;font-style:normal;font-weight:400 700;src:url(/dist/web/assets/manrope-4qdASHmp.woff2) format("woff2");unicode-range:U+00??,U+0131,U+0152-0153,U+02bb-02bc,U+02c6,U+02da,U+02dc,U+0304,U+0308,U+0329,U+2000-206f,U+2074,U+20ac,U+2122,U+2191,U+2193,U+2212,U+2215,U+feff,U+fffd}@supports (-moz-appearance:none){.moz\:hidden{display:none!important}.moz\:block{display:block!important}}
/* assets/index-0J74gybP.css */
@keyframes _bblFadInOut_10462_1{0%,80%,to{box-shadow:0 2.5em 0 -1.3em}40%{box-shadow:0 2.5em}}@font-face{font-display:swap;font-family:Manrope;font-style:normal;font-weight:400 700;src:url(/dist/web/assets/manrope-4qdASHmp.woff2) format("woff2");unicode-range:U+0301,U+0400-045f,U+0490-0491,U+04b0-04b1,U+2116}@font-face{font-display:swap;font-family:Manrope;font-style:normal;font-weight:400 700;src:url(/dist/web/assets/manrope-4qdASHmp.woff2) format("woff2");unicode-range:U+0102-0103,U+0110-0111,U+0128-0129,U+0168-0169,U+01a0-01a1,U+01af-01b0,U+0300-0301,U+0303-0304,U+0308-0309,U+0323,U+0329,U+1ea0-1ef9,U+20ab}@font-face{font-display:swap;font-family:Manrope;font-style:normal;font-weight:400 700;src:url(/dist/web/assets/manrope-4qdASHmp.woff2) format("woff2");unicode-range:U+0100-02af,U+0304,U+0308,U+0329,U+1e00-1e9f,U+1ef2-1eff,U+2020,U+20a0-20ab,U+20ad-20cf,U+2113,U+2c60-2c7f,U+a720-a7ff}@font-face{font-display:swap;font-family:Manrope;font-style:normal;font-weight:400 700;src:url(/dist/web/assets/manrope-4qdASHmp.woff2) format("woff2");unicode-range:U+00??,U+0131,U+0152-0153,U+02bb-02bc,U+02c6,U+02da,U+02dc,U+0304,U+0308,U+0329,U+2000-206f,U+2074,U+20ac,U+2122,U+2191,U+2193,U+2212,U+2215,U+feff,U+fffd}@supports (-moz-appearance:none){.moz\:hidden{display:none!important}.moz\:block{display:block!important}}
/* assets/index-4AgQoXao.css */
@keyframes _bblFadInOut_10462_1{0%,80%,to{box-shadow:0 2.5em 0 -1.3em}40%{box-shadow:0 2.5em}}@font-face{font-display:swap;font-family:Manrope;font-style:normal;font-weight:400 700;src:url(/dist/web/assets/manrope-4qdASHmp.woff2) format("woff2");unicode-range:U+0301,U+0400-045f,U+0490-0491,U+04b0-04b1,U+2116}@font-face{font-display:swap;font-family:Manrope;font-style:normal;font-weight:400 700;src:url(/dist/web/assets/manrope-4qdASHmp.woff2) format("woff2");unicode-range:U+0102-0103,U+0110-0111,U+0128-0129,U+0168-0169,U+01a0-01a1,U+01af-01b0,U+0300-0301,U+0303-0304,U+0308-0309,U+0323,U+0329,U+1ea0-1ef9,U+20ab}@font-face{font-display:swap;font-family:Manrope;font-style:normal;font-weight:400 700;src:url(/dist/web/assets/manrope-4qdASHmp.woff2) format("woff2");unicode-range:U+0100-02af,U+0304,U+0308,U+0329,U+1e00-1e9f,U+1ef2-1eff,U+2020,U+20a0-20ab,U+20ad-20cf,U+2113,U+2c60-2c7f,U+a720-a7ff}@font-face{font-display:swap;font-family:Manrope;font-style:normal;font-weight:400 700;src:url(/dist/web/assets/manrope-4qdASHmp.woff2) format("woff2");unicode-range:U+00??,U+0131,U+0152-0153,U+02bb-02bc,U+02c6,U+02da,U+02dc,U+0304,U+0308,U+0329,U+2000-206f,U+2074,U+20ac,U+2122,U+2191,U+2193,U+2212,U+2215,U+feff,U+fffd}@supports (-moz-appearance:none){.moz\:hidden{display:none!important}.moz\:block{display:block!important}}
/* assets/index-546EsbSM.css */
@keyframes _bblFadInOut_10462_1{0%,80%,to{box-shadow:0 2.5em 0 -1.3em}40%{box-shadow:0 2.5em}}@font-face{font-display:swap;font-family:Manrope;font-style:normal;font-weight:400 700;src:url(/dist/web/assets/manrope-4qdASHmp.woff2) format("woff2");unicode-range:U+0301,U+0400-045f,U+0490-0491,U+04b0-04b1,U+2116}@font-face{font-display:swap;font-family:Manrope;font-style:normal;font-weight:400 700;src:url(/dist/web/assets/manrope-4qdASHmp.woff2) format("woff2");unicode-range:U+0102-0103,U+0110-0111,U+0128-0129,U+0168-0169,U+01a0-01a1,U+01af-01b0,U+0300-0301,U+0303-0304,U+0308-0309,U+0323,U+0329,U+1ea0-1ef9,U+20ab}@font-face{font-display:swap;font-family:Manrope;font-style:normal;font-weight:400 700;src:url(/dist/web/assets/manrope-4qdASHmp.woff2) format("woff2");unicode-range:U+0100-02af,U+0304,U+0308,U+0329,U+1e00-1e9f,U+1ef2-1eff,U+2020,U+20a0-20ab,U+20ad-20cf,U+2113,U+2c60-2c7f,U+a720-a7ff}@font-face{font-display:swap;font-family:Manrope;font-style:normal;font-weight:400 700;src:url(/dist/web/assets/manrope-4qdASHmp.woff2) format("woff2");unicode-range:U+00??,U+0131,U+0152-0153,U+02bb-02bc,U+02c6,U+02da,U+02dc,U+0304,U+0308,U+0329,U+2000-206f,U+2074,U+20ac,U+2122,U+2191,U+2193,U+2212,U+2215,U+feff,U+fffd}
/* assets/index-7Jz6n718.css */
@keyframes _bblFadInOut_10462_1{0%,80%,to{box-shadow:0 2.5em 0 -1.3em}40%{box-shadow:0 2.5em}}@font-face{font-display:swap;font-family:Manrope;font-style:normal;font-weight:400 700;src:url(/dist/web/assets/manrope-4qdASHmp.woff2) format("woff2");unicode-range:U+0301,U+0400-045f,U+0490-0491,U+04b0-04b1,U+2116}@font-face{font-display:swap;font-family:Manrope;font-style:normal;font-weight:400 700;src:url(/dist/web/assets/manrope-4qdASHmp.woff2) format("woff2");unicode-range:U+0102-0103,U+0110-0111,U+0128-0129,U+0168-0169,U+01a0-01a1,U+01af-01b0,U+0300-0301,U+0303-0304,U+0308-0309,U+0323,U+0329,U+1ea0-1ef9,U+20ab}@font-face{font-display:swap;font-family:Manrope;font-style:normal;font-weight:400 700;src:url(/dist/web/assets/manrope-4qdASHmp.woff2) format("woff2");unicode-range:U+0100-02af,U+0304,U+0308,U+0329,U+1e00-1e9f,U+1ef2-1eff,U+2020,U+20a0-20ab,U+20ad-20cf,U+2113,U+2c60-2c7f,U+a720-a7ff}@font-face{font-display:swap;font-family:Manrope;font-style:normal;font-weight:400 700;src:url(/dist/web/assets/manrope-4qdASHmp.woff2) format("woff2");unicode-range:U+00??,U+0131,U+0152-0153,U+02bb-02bc,U+02c6,U+02da,U+02dc,U+0304,U+0308,U+0329,U+2000-206f,U+2074,U+20ac,U+2122,U+2191,U+2193,U+2212,U+2215,U+feff,U+fffd}
/* assets/index-B-XL1wAn.css */
html { scroll-behavior: smooth; }@keyframes _bblFadInOut_10462_1{0%,80%,to{box-shadow:0 2.5em 0 -1.3em}40%{box-shadow:0 2.5em}}@font-face{font-display:swap;font-family:Manrope;font-style:normal;font-weight:400 700;src:url(/dist/web/assets/manrope-4qdASHmp.woff2) format("woff2");unicode-range:U+0301,U+0400-045f,U+0490-0491,U+04b0-04b1,U+2116}@font-face{font-display:swap;font-family:Manrope;font-style:normal;font-weight:400 700;src:url(/dist/web/assets/manrope-4qdASHmp.woff2) format("woff2");unicode-range:U+0102-0103,U+0110-0111,U+0128-0129,U+0168-0169,U+01a0-01a1,U+01af-01b0,U+0300-0301,U+0303-0304,U+0308-0309,U+0323,U+0329,U+1ea0-1ef9,U+20ab}@font-face{font-display:swap;font-family:Manrope;font-style:normal;font-weight:400 700;src:url(/dist/web/assets/manrope-4qdASHmp.woff2) format("woff2");unicode-range:U+0100-02af,U+0304,U+0308,U+0329,U+1e00-1e9f,U+1ef2-1eff,U+2020,U+20a0-20ab,U+20ad-20cf,U+2113,U+2c60-2c7f,U+a720-a7ff}@font-face{font-display:swap;font-family:Manrope;font-style:normal;font-weight:400 700;src:url(/dist/web/assets/manrope-4qdASHmp.woff2) format("woff2");unicode-range:U+00??,U+0131,U+0152-0153,U+02bb-02bc,U+02c6,U+02da,U+02dc,U+0304,U+0308,U+0329,U+2000-206f,U+2074,U+20ac,U+2122,U+2191,U+2193,U+2212,U+2215,U+feff,U+fffd}
/* assets/index-B0QkhgUC.css */
@keyframes _bblFadInOut_10462_1{0%,80%,to{box-shadow:0 2.5em 0 -1.3em}40%{box-shadow:0 2.5em}}@font-face{font-display:swap;font-family:Manrope;font-style:normal;font-weight:400 700;src:url(/dist/web/assets/manrope-4qdASHmp.woff2) format("woff2");unicode-range:U+0301,U+0400-045f,U+0490-0491,U+04b0-04b1,U+2116}@font-face{font-display:swap;font-family:Manrope;font-style:normal;font-weight:400 700;src:url(/dist/web/assets/manrope-4qdASHmp.woff2) format("woff2");unicode-range:U+0102-0103,U+0110-0111,U+0128-0129,U+0168-0169,U+01a0-01a1,U+01af-01b0,U+0300-0301,U+0303-0304,U+0308-0309,U+0323,U+0329,U+1ea0-1ef9,U+20ab}@font-face{font-display:swap;font-family:Manrope;font-style:normal;font-weight:400 700;src:url(/dist/web/assets/manrope-4qdASHmp.woff2) format("woff2");unicode-range:U+0100-02af,U+0304,U+0308,U+0329,U+1e00-1e9f,U+1ef2-1eff,U+2020,U+20a0-20ab,U+20ad-20cf,U+2113,U+2c60-2c7f,U+a720-a7ff}@font-face{font-display:swap;font-family:Manrope;font-style:normal;font-weight:400 700;src:url(/dist/web/assets/manrope-4qdASHmp.woff2) format("woff2");unicode-range:U+00??,U+0131,U+0152-0153,U+02bb-02bc,U+02c6,U+02da,U+02dc,U+0304,U+0308,U+0329,U+2000-206f,U+2074,U+20ac,U+2122,U+2191,U+2193,U+2212,U+2215,U+feff,U+fffd}
/* assets/index-B2w57OH0.css */
@keyframes _bblFadInOut_10462_1{0%,80%,to{box-shadow:0 2.5em 0 -1.3em}40%{box-shadow:0 2.5em}}@font-face{font-display:swap;font-family:Manrope;font-style:normal;font-weight:400 700;src:url(/dist/web/assets/manrope-4qdASHmp.woff2) format("woff2");unicode-range:U+0301,U+0400-045f,U+0490-0491,U+04b0-04b1,U+2116}@font-face{font-display:swap;font-family:Manrope;font-style:normal;font-weight:400 700;src:url(/dist/web/assets/manrope-4qdASHmp.woff2) format("woff2");unicode-range:U+0102-0103,U+0110-0111,U+0128-0129,U+0168-0169,U+01a0-01a1,U+01af-01b0,U+0300-0301,U+0303-0304,U+0308-0309,U+0323,U+0329,U+1ea0-1ef9,U+20ab}@font-face{font-display:swap;font-family:Manrope;font-style:normal;font-weight:400 700;src:url(/dist/web/assets/manrope-4qdASHmp.woff2) format("woff2");unicode-range:U+0100-02af,U+0304,U+0308,U+0329,U+1e00-1e9f,U+1ef2-1eff,U+2020,U+20a0-20ab,U+20ad-20cf,U+2113,U+2c60-2c7f,U+a720-a7ff}@font-face{font-display:swap;font-family:Manrope;font-style:normal;font-weight:400 700;src:url(/dist/web/assets/manrope-4qdASHmp.woff2) format("woff2");unicode-range:U+00??,U+0131,U+0152-0153,U+02bb-02bc,U+02c6,U+02da,U+02dc,U+0304,U+0308,U+0329,U+2000-206f,U+2074,U+20ac,U+2122,U+2191,U+2193,U+2212,U+2215,U+feff,U+fffd}
/* assets/index-B4JZEBtg.css */
@keyframes _bblFadInOut_10462_1{0%,80%,to{box-shadow:0 2.5em 0 -1.3em}40%{box-shadow:0 2.5em}}@font-face{font-display:swap;font-family:Manrope;font-style:normal;font-weight:400 700;src:url(/dist/web/assets/manrope-4qdASHmp.woff2) format("woff2");unicode-range:U+0301,U+0400-045f,U+0490-0491,U+04b0-04b1,U+2116}@font-face{font-display:swap;font-family:Manrope;font-style:normal;font-weight:400 700;src:url(/dist/web/assets/manrope-4qdASHmp.woff2) format("woff2");unicode-range:U+0102-0103,U+0110-0111,U+0128-0129,U+0168-0169,U+01a0-01a1,U+01af-01b0,U+0300-0301,U+0303-0304,U+0308-0309,U+0323,U+0329,U+1ea0-1ef9,U+20ab}@font-face{font-display:swap;font-family:Manrope;font-style:normal;font-weight:400 700;src:url(/dist/web/assets/manrope-4qdASHmp.woff2) format("woff2");unicode-range:U+0100-02af,U+0304,U+0308,U+0329,U+1e00-1e9f,U+1ef2-1eff,U+2020,U+20a0-20ab,U+20ad-20cf,U+2113,U+2c60-2c7f,U+a720-a7ff}@font-face{font-display:swap;font-family:Manrope;font-style:normal;font-weight:400 700;src:url(/dist/web/assets/manrope-4qdASHmp.woff2) format("woff2");unicode-range:U+00??,U+0131,U+0152-0153,U+02bb-02bc,U+02c6,U+02da,U+02dc,U+0304,U+0308,U+0329,U+2000-206f,U+2074,U+20ac,U+2122,U+2191,U+2193,U+2212,U+2215,U+feff,U+fffd}
/* assets/index-B5nI_vbm.css */
@keyframes _bblFadInOut_10462_1{0%,80%,to{box-shadow:0 2.5em 0 -1.3em}40%{box-shadow:0 2.5em}}@font-face{font-display:swap;font-family:Manrope;font-style:normal;font-weight:400 700;src:url(/dist/web/assets/manrope-4qdASHmp.woff2) format("woff2");unicode-range:U+0301,U+0400-045f,U+0490-0491,U+04b0-04b1,U+2116}@font-face{font-display:swap;font-family:Manrope;font-style:normal;font-weight:400 700;src:url(/dist/web/assets/manrope-4qdASHmp.woff2) format("woff2");unicode-range:U+0102-0103,U+0110-0111,U+0128-0129,U+0168-0169,U+01a0-01a1,U+01af-01b0,U+0300-0301,U+0303-0304,U+0308-0309,U+0323,U+0329,U+1ea0-1ef9,U+20ab}@font-face{font-display:swap;font-family:Manrope;font-style:normal;font-weight:400 700;src:url(/dist/web/assets/manrope-4qdASHmp.woff2) format("woff2");unicode-range:U+0100-02af,U+0304,U+0308,U+0329,U+1e00-1e9f,U+1ef2-1eff,U+2020,U+20a0-20ab,U+20ad-20cf,U+2113,U+2c60-2c7f,U+a720-a7ff}@font-face{font-display:swap;font-family:Manrope;font-style:normal;font-weight:400 700;src:url(/dist/web/assets/manrope-4qdASHmp.woff2) format("woff2");unicode-range:U+00??,U+0131,U+0152-0153,U+02bb-02bc,U+02c6,U+02da,U+02dc,U+0304,U+0308,U+0329,U+2000-206f,U+2074,U+20ac,U+2122,U+2191,U+2193,U+2212,U+2215,U+feff,U+fffd}
/* assets/index-B7-LO6iJ.css */
@keyframes _bblFadInOut_10462_1{0%,80%,to{box-shadow:0 2.5em 0 -1.3em}40%{box-shadow:0 2.5em}}@font-face{font-display:swap;font-family:Manrope;font-style:normal;font-weight:400 700;src:url(/dist/web/assets/manrope-4qdASHmp.woff2) format("woff2");unicode-range:U+0301,U+0400-045f,U+0490-0491,U+04b0-04b1,U+2116}@font-face{font-display:swap;font-family:Manrope;font-style:normal;font-weight:400 700;src:url(/dist/web/assets/manrope-4qdASHmp.woff2) format("woff2");unicode-range:U+0102-0103,U+0110-0111,U+0128-0129,U+0168-0169,U+01a0-01a1,U+01af-01b0,U+0300-0301,U+0303-0304,U+0308-0309,U+0323,U+0329,U+1ea0-1ef9,U+20ab}@font-face{font-display:swap;font-family:Manrope;font-style:normal;font-weight:400 700;src:url(/dist/web/assets/manrope-4qdASHmp.woff2) format("woff2");unicode-range:U+0100-02af,U+0304,U+0308,U+0329,U+1e00-1e9f,U+1ef2-1eff,U+2020,U+20a0-20ab,U+20ad-20cf,U+2113,U+2c60-2c7f,U+a720-a7ff}@font-face{font-display:swap;font-family:Manrope;font-style:normal;font-weight:400 700;src:url(/dist/web/assets/manrope-4qdASHmp.woff2) format("woff2");unicode-range:U+00??,U+0131,U+0152-0153,U+02bb-02bc,U+02c6,U+02da,U+02dc,U+0304,U+0308,U+0329,U+2000-206f,U+2074,U+20ac,U+2122,U+2191,U+2193,U+2212,U+2215,U+feff,U+fffd}@supports (-moz-appearance:none){.moz\:hidden{display:none!important}.moz\:block{display:block!important}}
/* assets/index-B9fHm1nc.css */
@keyframes _bblFadInOut_10462_1{0%,80%,to{box-shadow:0 2.5em 0 -1.3em}40%{box-shadow:0 2.5em}}@font-face{font-display:swap;font-family:Manrope;font-style:normal;font-weight:400 700;src:url(/dist/web/assets/manrope-4qdASHmp.woff2) format("woff2");unicode-range:U+0301,U+0400-045f,U+0490-0491,U+04b0-04b1,U+2116}@font-face{font-display:swap;font-family:Manrope;font-style:normal;font-weight:400 700;src:url(/dist/web/assets/manrope-4qdASHmp.woff2) format("woff2");unicode-range:U+0102-0103,U+0110-0111,U+0128-0129,U+0168-0169,U+01a0-01a1,U+01af-01b0,U+0300-0301,U+0303-0304,U+0308-0309,U+0323,U+0329,U+1ea0-1ef9,U+20ab}@font-face{font-display:swap;font-family:Manrope;font-style:normal;font-weight:400 700;src:url(/dist/web/assets/manrope-4qdASHmp.woff2) format("woff2");unicode-range:U+0100-02af,U+0304,U+0308,U+0329,U+1e00-1e9f,U+1ef2-1eff,U+2020,U+20a0-20ab,U+20ad-20cf,U+2113,U+2c60-2c7f,U+a720-a7ff}@font-face{font-display:swap;font-family:Manrope;font-style:normal;font-weight:400 700;src:url(/dist/web/assets/manrope-4qdASHmp.woff2) format("woff2");unicode-range:U+00??,U+0131,U+0152-0153,U+02bb-02bc,U+02c6,U+02da,U+02dc,U+0304,U+0308,U+0329,U+2000-206f,U+2074,U+20ac,U+2122,U+2191,U+2193,U+2212,U+2215,U+feff,U+fffd}
/* assets/index-BBTIf5xN.css */
@keyframes _bblFadInOut_10462_1{0%,80%,to{box-shadow:0 2.5em 0 -1.3em}40%{box-shadow:0 2.5em}}@font-face{font-display:swap;font-family:Manrope;font-style:normal;font-weight:400 700;src:url(/dist/web/assets/manrope-4qdASHmp.woff2) format("woff2");unicode-range:U+0301,U+0400-045f,U+0490-0491,U+04b0-04b1,U+2116}@font-face{font-display:swap;font-family:Manrope;font-style:normal;font-weight:400 700;src:url(/dist/web/assets/manrope-4qdASHmp.woff2) format("woff2");unicode-range:U+0102-0103,U+0110-0111,U+0128-0129,U+0168-0169,U+01a0-01a1,U+01af-01b0,U+0300-0301,U+0303-0304,U+0308-0309,U+0323,U+0329,U+1ea0-1ef9,U+20ab}@font-face{font-display:swap;font-family:Manrope;font-style:normal;font-weight:400 700;src:url(/dist/web/assets/manrope-4qdASHmp.woff2) format("woff2");unicode-range:U+0100-02af,U+0304,U+0308,U+0329,U+1e00-1e9f,U+1ef2-1eff,U+2020,U+20a0-20ab,U+20ad-20cf,U+2113,U+2c60-2c7f,U+a720-a7ff}@font-face{font-display:swap;font-family:Manrope;font-style:normal;font-weight:400 700;src:url(/dist/web/assets/manrope-4qdASHmp.woff2) format("woff2");unicode-range:U+00??,U+0131,U+0152-0153,U+02bb-02bc,U+02c6,U+02da,U+02dc,U+0304,U+0308,U+0329,U+2000-206f,U+2074,U+20ac,U+2122,U+2191,U+2193,U+2212,U+2215,U+feff,U+fffd}@supports (-moz-appearance:none){.moz\:hidden{display:none!important}.moz\:block{display:block!important}}
/* assets/index-BE66GmQt.css */
@keyframes _bblFadInOut_10462_1{0%,80%,to{box-shadow:0 2.5em 0 -1.3em}40%{box-shadow:0 2.5em}}@font-face{font-display:swap;font-family:Manrope;font-style:normal;font-weight:400 700;src:url(/dist/web/assets/manrope-4qdASHmp.woff2) format("woff2");unicode-range:U+0301,U+0400-045f,U+0490-0491,U+04b0-04b1,U+2116}@font-face{font-display:swap;font-family:Manrope;font-style:normal;font-weight:400 700;src:url(/dist/web/assets/manrope-4qdASHmp.woff2) format("woff2");unicode-range:U+0102-0103,U+0110-0111,U+0128-0129,U+0168-0169,U+01a0-01a1,U+01af-01b0,U+0300-0301,U+0303-0304,U+0308-0309,U+0323,U+0329,U+1ea0-1ef9,U+20ab}@font-face{font-display:swap;font-family:Manrope;font-style:normal;font-weight:400 700;src:url(/dist/web/assets/manrope-4qdASHmp.woff2) format("woff2");unicode-range:U+0100-02af,U+0304,U+0308,U+0329,U+1e00-1e9f,U+1ef2-1eff,U+2020,U+20a0-20ab,U+20ad-20cf,U+2113,U+2c60-2c7f,U+a720-a7ff}@font-face{font-display:swap;font-family:Manrope;font-style:normal;font-weight:400 700;src:url(/dist/web/assets/manrope-4qdASHmp.woff2) format("woff2");unicode-range:U+00??,U+0131,U+0152-0153,U+02bb-02bc,U+02c6,U+02da,U+02dc,U+0304,U+0308,U+0329,U+2000-206f,U+2074,U+20ac,U+2122,U+2191,U+2193,U+2212,U+2215,U+feff,U+fffd}
/* assets/index-BGgzpeAw.css */
@keyframes _bblFadInOut_10462_1{0%,80%,to{box-shadow:0 2.5em 0 -1.3em}40%{box-shadow:0 2.5em}}@font-face{font-display:swap;font-family:Manrope;font-style:normal;font-weight:400 700;src:url(/dist/web/assets/manrope-4qdASHmp.woff2) format("woff2");unicode-range:U+0301,U+0400-045f,U+0490-0491,U+04b0-04b1,U+2116}@font-face{font-display:swap;font-family:Manrope;font-style:normal;font-weight:400 700;src:url(/dist/web/assets/manrope-4qdASHmp.woff2) format("woff2");unicode-range:U+0102-0103,U+0110-0111,U+0128-0129,U+0168-0169,U+01a0-01a1,U+01af-01b0,U+0300-0301,U+0303-0304,U+0308-0309,U+0323,U+0329,U+1ea0-1ef9,U+20ab}@font-face{font-display:swap;font-family:Manrope;font-style:normal;font-weight:400 700;src:url(/dist/web/assets/manrope-4qdASHmp.woff2) format("woff2");unicode-range:U+0100-02af,U+0304,U+0308,U+0329,U+1e00-1e9f,U+1ef2-1eff,U+2020,U+20a0-20ab,U+20ad-20cf,U+2113,U+2c60-2c7f,U+a720-a7ff}@font-face{font-display:swap;font-family:Manrope;font-style:normal;font-weight:400 700;src:url(/dist/web/assets/manrope-4qdASHmp.woff2) format("woff2");unicode-range:U+00??,U+0131,U+0152-0153,U+02bb-02bc,U+02c6,U+02da,U+02dc,U+0304,U+0308,U+0329,U+2000-206f,U+2074,U+20ac,U+2122,U+2191,U+2193,U+2212,U+2215,U+feff,U+fffd}
/* assets/index-BJTlQgcF.css */
@keyframes _bblFadInOut_10462_1{0%,80%,to{box-shadow:0 2.5em 0 -1.3em}40%{box-shadow:0 2.5em}}@font-face{font-display:swap;font-family:Manrope;font-style:normal;font-weight:400 700;src:url(/dist/web/assets/manrope-4qdASHmp.woff2) format("woff2");unicode-range:U+0301,U+0400-045f,U+0490-0491,U+04b0-04b1,U+2116}@font-face{font-display:swap;font-family:Manrope;font-style:normal;font-weight:400 700;src:url(/dist/web/assets/manrope-4qdASHmp.woff2) format("woff2");unicode-range:U+0102-0103,U+0110-0111,U+0128-0129,U+0168-0169,U+01a0-01a1,U+01af-01b0,U+0300-0301,U+0303-0304,U+0308-0309,U+0323,U+0329,U+1ea0-1ef9,U+20ab}@font-face{font-display:swap;font-family:Manrope;font-style:normal;font-weight:400 700;src:url(/dist/web/assets/manrope-4qdASHmp.woff2) format("woff2");unicode-range:U+0100-02af,U+0304,U+0308,U+0329,U+1e00-1e9f,U+1ef2-1eff,U+2020,U+20a0-20ab,U+20ad-20cf,U+2113,U+2c60-2c7f,U+a720-a7ff}@font-face{font-display:swap;font-family:Manrope;font-style:normal;font-weight:400 700;src:url(/dist/web/assets/manrope-4qdASHmp.woff2) format("woff2");unicode-range:U+00??,U+0131,U+0152-0153,U+02bb-02bc,U+02c6,U+02da,U+02dc,U+0304,U+0308,U+0329,U+2000-206f,U+2074,U+20ac,U+2122,U+2191,U+2193,U+2212,U+2215,U+feff,U+fffd}
/* assets/index-BLo94ir2.css */
@keyframes _bblFadInOut_10462_1{0%,80%,to{box-shadow:0 2.5em 0 -1.3em}40%{box-shadow:0 2.5em}}@font-face{font-display:swap;font-family:Manrope;font-style:normal;font-weight:400 700;src:url(/dist/web/assets/manrope-4qdASHmp.woff2) format("woff2");unicode-range:U+0301,U+0400-045f,U+0490-0491,U+04b0-04b1,U+2116}@font-face{font-display:swap;font-family:Manrope;font-style:normal;font-weight:400 700;src:url(/dist/web/assets/manrope-4qdASHmp.woff2) format("woff2");unicode-range:U+0102-0103,U+0110-0111,U+0128-0129,U+0168-0169,U+01a0-01a1,U+01af-01b0,U+0300-0301,U+0303-0304,U+0308-0309,U+0323,U+0329,U+1ea0-1ef9,U+20ab}@font-face{font-display:swap;font-family:Manrope;font-style:normal;font-weight:400 700;src:url(/dist/web/assets/manrope-4qdASHmp.woff2) format("woff2");unicode-range:U+0100-02af,U+0304,U+0308,U+0329,U+1e00-1e9f,U+1ef2-1eff,U+2020,U+20a0-20ab,U+20ad-20cf,U+2113,U+2c60-2c7f,U+a720-a7ff}@font-face{font-display:swap;font-family:Manrope;font-style:normal;font-weight:400 700;src:url(/dist/web/assets/manrope-4qdASHmp.woff2) format("woff2");unicode-range:U+00??,U+0131,U+0152-0153,U+02bb-02bc,U+02c6,U+02da,U+02dc,U+0304,U+0308,U+0329,U+2000-206f,U+2074,U+20ac,U+2122,U+2191,U+2193,U+2212,U+2215,U+feff,U+fffd}
/* assets/index-BOVncjYP.css */
@keyframes _bblFadInOut_10462_1{0%,80%,to{box-shadow:0 2.5em 0 -1.3em}40%{box-shadow:0 2.5em}}@font-face{font-display:swap;font-family:Manrope;font-style:normal;font-weight:400 700;src:url(/dist/web/assets/manrope-4qdASHmp.woff2) format("woff2");unicode-range:U+0301,U+0400-045f,U+0490-0491,U+04b0-04b1,U+2116}@font-face{font-display:swap;font-family:Manrope;font-style:normal;font-weight:400 700;src:url(/dist/web/assets/manrope-4qdASHmp.woff2) format("woff2");unicode-range:U+0102-0103,U+0110-0111,U+0128-0129,U+0168-0169,U+01a0-01a1,U+01af-01b0,U+0300-0301,U+0303-0304,U+0308-0309,U+0323,U+0329,U+1ea0-1ef9,U+20ab}@font-face{font-display:swap;font-family:Manrope;font-style:normal;font-weight:400 700;src:url(/dist/web/assets/manrope-4qdASHmp.woff2) format("woff2");unicode-range:U+0100-02af,U+0304,U+0308,U+0329,U+1e00-1e9f,U+1ef2-1eff,U+2020,U+20a0-20ab,U+20ad-20cf,U+2113,U+2c60-2c7f,U+a720-a7ff}@font-face{font-display:swap;font-family:Manrope;font-style:normal;font-weight:400 700;src:url(/dist/web/assets/manrope-4qdASHmp.woff2) format("woff2");unicode-range:U+00??,U+0131,U+0152-0153,U+02bb-02bc,U+02c6,U+02da,U+02dc,U+0304,U+0308,U+0329,U+2000-206f,U+2074,U+20ac,U+2122,U+2191,U+2193,U+2212,U+2215,U+feff,U+fffd}
/* assets/index-BQYEp-sp.css */
@keyframes _bblFadInOut_10462_1{0%,80%,to{box-shadow:0 2.5em 0 -1.3em}40%{box-shadow:0 2.5em}}@font-face{font-display:swap;font-family:Manrope;font-style:normal;font-weight:400 700;src:url(/dist/web/assets/manrope-4qdASHmp.woff2) format("woff2");unicode-range:U+0301,U+0400-045f,U+0490-0491,U+04b0-04b1,U+2116}@font-face{font-display:swap;font-family:Manrope;font-style:normal;font-weight:400 700;src:url(/dist/web/assets/manrope-4qdASHmp.woff2) format("woff2");unicode-range:U+0102-0103,U+0110-0111,U+0128-0129,U+0168-0169,U+01a0-01a1,U+01af-01b0,U+0300-0301,U+0303-0304,U+0308-0309,U+0323,U+0329,U+1ea0-1ef9,U+20ab}@font-face{font-display:swap;font-family:Manrope;font-style:normal;font-weight:400 700;src:url(/dist/web/assets/manrope-4qdASHmp.woff2) format("woff2");unicode-range:U+0100-02af,U+0304,U+0308,U+0329,U+1e00-1e9f,U+1ef2-1eff,U+2020,U+20a0-20ab,U+20ad-20cf,U+2113,U+2c60-2c7f,U+a720-a7ff}@font-face{font-display:swap;font-family:Manrope;font-style:normal;font-weight:400 700;src:url(/dist/web/assets/manrope-4qdASHmp.woff2) format("woff2");unicode-range:U+00??,U+0131,U+0152-0153,U+02bb-02bc,U+02c6,U+02da,U+02dc,U+0304,U+0308,U+0329,U+2000-206f,U+2074,U+20ac,U+2122,U+2191,U+2193,U+2212,U+2215,U+feff,U+fffd}
/* assets/index-BSTnJEVu.css */
@keyframes _bblFadInOut_10462_1{0%,80%,to{box-shadow:0 2.5em 0 -1.3em}40%{box-shadow:0 2.5em}}@font-face{font-display:swap;font-family:Manrope;font-style:normal;font-weight:400 700;src:url(/dist/web/assets/manrope-4qdASHmp.woff2) format("woff2");unicode-range:U+0301,U+0400-045f,U+0490-0491,U+04b0-04b1,U+2116}@font-face{font-display:swap;font-family:Manrope;font-style:normal;font-weight:400 700;src:url(/dist/web/assets/manrope-4qdASHmp.woff2) format("woff2");unicode-range:U+0102-0103,U+0110-0111,U+0128-0129,U+0168-0169,U+01a0-01a1,U+01af-01b0,U+0300-0301,U+0303-0304,U+0308-0309,U+0323,U+0329,U+1ea0-1ef9,U+20ab}@font-face{font-display:swap;font-family:Manrope;font-style:normal;font-weight:400 700;src:url(/dist/web/assets/manrope-4qdASHmp.woff2) format("woff2");unicode-range:U+0100-02af,U+0304,U+0308,U+0329,U+1e00-1e9f,U+1ef2-1eff,U+2020,U+20a0-20ab,U+20ad-20cf,U+2113,U+2c60-2c7f,U+a720-a7ff}@font-face{font-display:swap;font-family:Manrope;font-style:normal;font-weight:400 700;src:url(/dist/web/assets/manrope-4qdASHmp.woff2) format("woff2");unicode-range:U+00??,U+0131,U+0152-0153,U+02bb-02bc,U+02c6,U+02da,U+02dc,U+0304,U+0308,U+0329,U+2000-206f,U+2074,U+20ac,U+2122,U+2191,U+2193,U+2212,U+2215,U+feff,U+fffd}
/* assets/index-BSnswDJe.css */
@keyframes _bblFadInOut_10462_1{0%,80%,to{box-shadow:0 2.5em 0 -1.3em}40%{box-shadow:0 2.5em}}@font-face{font-display:swap;font-family:Manrope;font-style:normal;font-weight:400 700;src:url(/dist/web/assets/manrope-4qdASHmp.woff2) format("woff2");unicode-range:U+0301,U+0400-045f,U+0490-0491,U+04b0-04b1,U+2116}@font-face{font-display:swap;font-family:Manrope;font-style:normal;font-weight:400 700;src:url(/dist/web/assets/manrope-4qdASHmp.woff2) format("woff2");unicode-range:U+0102-0103,U+0110-0111,U+0128-0129,U+0168-0169,U+01a0-01a1,U+01af-01b0,U+0300-0301,U+0303-0304,U+0308-0309,U+0323,U+0329,U+1ea0-1ef9,U+20ab}@font-face{font-display:swap;font-family:Manrope;font-style:normal;font-weight:400 700;src:url(/dist/web/assets/manrope-4qdASHmp.woff2) format("woff2");unicode-range:U+0100-02af,U+0304,U+0308,U+0329,U+1e00-1e9f,U+1ef2-1eff,U+2020,U+20a0-20ab,U+20ad-20cf,U+2113,U+2c60-2c7f,U+a720-a7ff}@font-face{font-display:swap;font-family:Manrope;font-style:normal;font-weight:400 700;src:url(/dist/web/assets/manrope-4qdASHmp.woff2) format("woff2");unicode-range:U+00??,U+0131,U+0152-0153,U+02bb-02bc,U+02c6,U+02da,U+02dc,U+0304,U+0308,U+0329,U+2000-206f,U+2074,U+20ac,U+2122,U+2191,U+2193,U+2212,U+2215,U+feff,U+fffd}
/* assets/index-BUxzORHG.css */
@keyframes _bblFadInOut_10462_1{0%,80%,to{box-shadow:0 2.5em 0 -1.3em}40%{box-shadow:0 2.5em}}@font-face{font-display:swap;font-family:Manrope;font-style:normal;font-weight:400 700;src:url(/dist/web/assets/manrope-4qdASHmp.woff2) format("woff2");unicode-range:U+0301,U+0400-045f,U+0490-0491,U+04b0-04b1,U+2116}@font-face{font-display:swap;font-family:Manrope;font-style:normal;font-weight:400 700;src:url(/dist/web/assets/manrope-4qdASHmp.woff2) format("woff2");unicode-range:U+0102-0103,U+0110-0111,U+0128-0129,U+0168-0169,U+01a0-01a1,U+01af-01b0,U+0300-0301,U+0303-0304,U+0308-0309,U+0323,U+0329,U+1ea0-1ef9,U+20ab}@font-face{font-display:swap;font-family:Manrope;font-style:normal;font-weight:400 700;src:url(/dist/web/assets/manrope-4qdASHmp.woff2) format("woff2");unicode-range:U+0100-02af,U+0304,U+0308,U+0329,U+1e00-1e9f,U+1ef2-1eff,U+2020,U+20a0-20ab,U+20ad-20cf,U+2113,U+2c60-2c7f,U+a720-a7ff}@font-face{font-display:swap;font-family:Manrope;font-style:normal;font-weight:400 700;src:url(/dist/web/assets/manrope-4qdASHmp.woff2) format("woff2");unicode-range:U+00??,U+0131,U+0152-0153,U+02bb-02bc,U+02c6,U+02da,U+02dc,U+0304,U+0308,U+0329,U+2000-206f,U+2074,U+20ac,U+2122,U+2191,U+2193,U+2212,U+2215,U+feff,U+fffd}
/* assets/index-BbWInn_l.css */
@keyframes _bblFadInOut_10462_1{0%,80%,to{box-shadow:0 2.5em 0 -1.3em}40%{box-shadow:0 2.5em}}@font-face{font-display:swap;font-family:Manrope;font-style:normal;font-weight:400 700;src:url(/dist/web/assets/manrope-4qdASHmp.woff2) format("woff2");unicode-range:U+0301,U+0400-045f,U+0490-0491,U+04b0-04b1,U+2116}@font-face{font-display:swap;font-family:Manrope;font-style:normal;font-weight:400 700;src:url(/dist/web/assets/manrope-4qdASHmp.woff2) format("woff2");unicode-range:U+0102-0103,U+0110-0111,U+0128-0129,U+0168-0169,U+01a0-01a1,U+01af-01b0,U+0300-0301,U+0303-0304,U+0308-0309,U+0323,U+0329,U+1ea0-1ef9,U+20ab}@font-face{font-display:swap;font-family:Manrope;font-style:normal;font-weight:400 700;src:url(/dist/web/assets/manrope-4qdASHmp.woff2) format("woff2");unicode-range:U+0100-02af,U+0304,U+0308,U+0329,U+1e00-1e9f,U+1ef2-1eff,U+2020,U+20a0-20ab,U+20ad-20cf,U+2113,U+2c60-2c7f,U+a720-a7ff}@font-face{font-display:swap;font-family:Manrope;font-style:normal;font-weight:400 700;src:url(/dist/web/assets/manrope-4qdASHmp.woff2) format("woff2");unicode-range:U+00??,U+0131,U+0152-0153,U+02bb-02bc,U+02c6,U+02da,U+02dc,U+0304,U+0308,U+0329,U+2000-206f,U+2074,U+20ac,U+2122,U+2191,U+2193,U+2212,U+2215,U+feff,U+fffd}
/* assets/index-BjBNSuEU.css */
@keyframes _bblFadInOut_10462_1{0%,80%,to{box-shadow:0 2.5em 0 -1.3em}40%{box-shadow:0 2.5em}}@font-face{font-display:swap;font-family:Manrope;font-style:normal;font-weight:400 700;src:url(/dist/web/assets/manrope-4qdASHmp.woff2) format("woff2");unicode-range:U+0301,U+0400-045f,U+0490-0491,U+04b0-04b1,U+2116}@font-face{font-display:swap;font-family:Manrope;font-style:normal;font-weight:400 700;src:url(/dist/web/assets/manrope-4qdASHmp.woff2) format("woff2");unicode-range:U+0102-0103,U+0110-0111,U+0128-0129,U+0168-0169,U+01a0-01a1,U+01af-01b0,U+0300-0301,U+0303-0304,U+0308-0309,U+0323,U+0329,U+1ea0-1ef9,U+20ab}@font-face{font-display:swap;font-family:Manrope;font-style:normal;font-weight:400 700;src:url(/dist/web/assets/manrope-4qdASHmp.woff2) format("woff2");unicode-range:U+0100-02af,U+0304,U+0308,U+0329,U+1e00-1e9f,U+1ef2-1eff,U+2020,U+20a0-20ab,U+20ad-20cf,U+2113,U+2c60-2c7f,U+a720-a7ff}@font-face{font-display:swap;font-family:Manrope;font-style:normal;font-weight:400 700;src:url(/dist/web/assets/manrope-4qdASHmp.woff2) format("woff2");unicode-range:U+00??,U+0131,U+0152-0153,U+02bb-02bc,U+02c6,U+02da,U+02dc,U+0304,U+0308,U+0329,U+2000-206f,U+2074,U+20ac,U+2122,U+2191,U+2193,U+2212,U+2215,U+feff,U+fffd}
/* assets/index-BkeE3Q7a.css */
button[disabled] { cursor: not-allowed; }
/* assets/index-BlLabP0z.css */
@font-face{font-display:swap;font-family:Manrope;font-style:normal;font-weight:400 700;src:url(/dist/web/assets/manrope-4qdASHmp.woff2) format("woff2");unicode-range:U+0301,U+0400-045f,U+0490-0491,U+04b0-04b1,U+2116}@font-face{font-display:swap;font-family:Manrope;font-style:normal;font-weight:400 700;src:url(/dist/web/assets/manrope-4qdASHmp.woff2) format("woff2");unicode-range:U+0102-0103,U+0110-0111,U+0128-0129,U+0168-0169,U+01a0-01a1,U+01af-01b0,U+0300-0301,U+0303-0304,U+0308-0309,U+0323,U+0329,U+1ea0-1ef9,U+20ab}@font-face{font-display:swap;font-family:Manrope;font-style:normal;font-weight:400 700;src:url(/dist/web/assets/manrope-4qdASHmp.woff2) format("woff2");unicode-range:U+0100-02af,U+0304,U+0308,U+0329,U+1e00-1e9f,U+1ef2-1eff,U+2020,U+20a0-20ab,U+20ad-20cf,U+2113,U+2c60-2c7f,U+a720-a7ff}@font-face{font-display:swap;font-family:Manrope;font-style:normal;font-weight:400 700;src:url(/dist/web/assets/manrope-4qdASHmp.woff2) format("woff2");unicode-range:U+00??,U+0131,U+0152-0153,U+02bb-02bc,U+02c6,U+02da,U+02dc,U+0304,U+0308,U+0329,U+2000-206f,U+2074,U+20ac,U+2122,U+2191,U+2193,U+2212,U+2215,U+feff,U+fffd}@keyframes _bblFadInOut_10462_1{0%,80%,to{box-shadow:0 2.5em 0 -1.3em}40%{box-shadow:0 2.5em}}
/* assets/index-BnLBrBxP.css */
@keyframes _bblFadInOut_10462_1{0%,80%,to{box-shadow:0 2.5em 0 -1.3em}40%{box-shadow:0 2.5em}}@font-face{font-display:swap;font-family:Manrope;font-style:normal;font-weight:400 700;src:url(/dist/web/assets/manrope-4qdASHmp.woff2) format("woff2");unicode-range:U+0301,U+0400-045f,U+0490-0491,U+04b0-04b1,U+2116}@font-face{font-display:swap;font-family:Manrope;font-style:normal;font-weight:400 700;src:url(/dist/web/assets/manrope-4qdASHmp.woff2) format("woff2");unicode-range:U+0102-0103,U+0110-0111,U+0128-0129,U+0168-0169,U+01a0-01a1,U+01af-01b0,U+0300-0301,U+0303-0304,U+0308-0309,U+0323,U+0329,U+1ea0-1ef9,U+20ab}@font-face{font-display:swap;font-family:Manrope;font-style:normal;font-weight:400 700;src:url(/dist/web/assets/manrope-4qdASHmp.woff2) format("woff2");unicode-range:U+0100-02af,U+0304,U+0308,U+0329,U+1e00-1e9f,U+1ef2-1eff,U+2020,U+20a0-20ab,U+20ad-20cf,U+2113,U+2c60-2c7f,U+a720-a7ff}@font-face{font-display:swap;font-family:Manrope;font-style:normal;font-weight:400 700;src:url(/dist/web/assets/manrope-4qdASHmp.woff2) format("woff2");unicode-range:U+00??,U+0131,U+0152-0153,U+02bb-02bc,U+02c6,U+02da,U+02dc,U+0304,U+0308,U+0329,U+2000-206f,U+2074,U+20ac,U+2122,U+2191,U+2193,U+2212,U+2215,U+feff,U+fffd}@keyframes ticker-scroll{0%{transform:translate(0)}to{transform:translate(-50%)}}@supports (-moz-appearance:none){.moz\:hidden{display:none!important}.moz\:block{display:block!important}}
/* assets/index-Bty0efa7.css */
@keyframes _bblFadInOut_10462_1{0%,80%,to{box-shadow:0 2.5em 0 -1.3em}40%{box-shadow:0 2.5em}}@font-face{font-display:swap;font-family:Manrope;font-style:normal;font-weight:400 700;src:url(/dist/web/assets/manrope-4qdASHmp.woff2) format("woff2");unicode-range:U+0301,U+0400-045f,U+0490-0491,U+04b0-04b1,U+2116}@font-face{font-display:swap;font-family:Manrope;font-style:normal;font-weight:400 700;src:url(/dist/web/assets/manrope-4qdASHmp.woff2) format("woff2");unicode-range:U+0102-0103,U+0110-0111,U+0128-0129,U+0168-0169,U+01a0-01a1,U+01af-01b0,U+0300-0301,U+0303-0304,U+0308-0309,U+0323,U+0329,U+1ea0-1ef9,U+20ab}@font-face{font-display:swap;font-family:Manrope;font-style:normal;font-weight:400 700;src:url(/dist/web/assets/manrope-4qdASHmp.woff2) format("woff2");unicode-range:U+0100-02af,U+0304,U+0308,U+0329,U+1e00-1e9f,U+1ef2-1eff,U+2020,U+20a0-20ab,U+20ad-20cf,U+2113,U+2c60-2c7f,U+a720-a7ff}@font-face{font-display:swap;font-family:Manrope;font-style:normal;font-weight:400 700;src:url(/dist/web/assets/manrope-4qdASHmp.woff2) format("woff2");unicode-range:U+00??,U+0131,U+0152-0153,U+02bb-02bc,U+02c6,U+02da,U+02dc,U+0304,U+0308,U+0329,U+2000-206f,U+2074,U+20ac,U+2122,U+2191,U+2193,U+2212,U+2215,U+feff,U+fffd}
/* assets/index-C3P8wlmg.css */
@keyframes _bblFadInOut_10462_1{0%,80%,to{box-shadow:0 2.5em 0 -1.3em}40%{box-shadow:0 2.5em}}@font-face{font-display:swap;font-family:Manrope;font-style:normal;font-weight:400 700;src:url(/dist/web/assets/manrope-4qdASHmp.woff2) format("woff2");unicode-range:U+0301,U+0400-045f,U+0490-0491,U+04b0-04b1,U+2116}@font-face{font-display:swap;font-family:Manrope;font-style:normal;font-weight:400 700;src:url(/dist/web/assets/manrope-4qdASHmp.woff2) format("woff2");unicode-range:U+0102-0103,U+0110-0111,U+0128-0129,U+0168-0169,U+01a0-01a1,U+01af-01b0,U+0300-0301,U+0303-0304,U+0308-0309,U+0323,U+0329,U+1ea0-1ef9,U+20ab}@font-face{font-display:swap;font-family:Manrope;font-style:normal;font-weight:400 700;src:url(/dist/web/assets/manrope-4qdASHmp.woff2) format("woff2");unicode-range:U+0100-02af,U+0304,U+0308,U+0329,U+1e00-1e9f,U+1ef2-1eff,U+2020,U+20a0-20ab,U+20ad-20cf,U+2113,U+2c60-2c7f,U+a720-a7ff}@font-face{font-display:swap;font-family:Manrope;font-style:normal;font-weight:400 700;src:url(/dist/web/assets/manrope-4qdASHmp.woff2) format("woff2");unicode-range:U+00??,U+0131,U+0152-0153,U+02bb-02bc,U+02c6,U+02da,U+02dc,U+0304,U+0308,U+0329,U+2000-206f,U+2074,U+20ac,U+2122,U+2191,U+2193,U+2212,U+2215,U+feff,U+fffd}
/* assets/index-C52mPH5S.css */
@keyframes _bblFadInOut_10462_1{0%,80%,to{box-shadow:0 2.5em 0 -1.3em}40%{box-shadow:0 2.5em}}@font-face{font-display:swap;font-family:Manrope;font-style:normal;font-weight:400 700;src:url(/dist/web/assets/manrope-4qdASHmp.woff2) format("woff2");unicode-range:U+0301,U+0400-045f,U+0490-0491,U+04b0-04b1,U+2116}@font-face{font-display:swap;font-family:Manrope;font-style:normal;font-weight:400 700;src:url(/dist/web/assets/manrope-4qdASHmp.woff2) format("woff2");unicode-range:U+0102-0103,U+0110-0111,U+0128-0129,U+0168-0169,U+01a0-01a1,U+01af-01b0,U+0300-0301,U+0303-0304,U+0308-0309,U+0323,U+0329,U+1ea0-1ef9,U+20ab}@font-face{font-display:swap;font-family:Manrope;font-style:normal;font-weight:400 700;src:url(/dist/web/assets/manrope-4qdASHmp.woff2) format("woff2");unicode-range:U+0100-02af,U+0304,U+0308,U+0329,U+1e00-1e9f,U+1ef2-1eff,U+2020,U+20a0-20ab,U+20ad-20cf,U+2113,U+2c60-2c7f,U+a720-a7ff}@font-face{font-display:swap;font-family:Manrope;font-style:normal;font-weight:400 700;src:url(/dist/web/assets/manrope-4qdASHmp.woff2) format("woff2");unicode-range:U+00??,U+0131,U+0152-0153,U+02bb-02bc,U+02c6,U+02da,U+02dc,U+0304,U+0308,U+0329,U+2000-206f,U+2074,U+20ac,U+2122,U+2191,U+2193,U+2212,U+2215,U+feff,U+fffd}
/* assets/index-C7E5gYQL.css */
:root { --swiper-navigation-size: 44px; }
/* assets/index-C8eALSqJ.css */
@keyframes _bblFadInOut_10462_1{0%,80%,to{box-shadow:0 2.5em 0 -1.3em}40%{box-shadow:0 2.5em}}@font-face{font-display:swap;font-family:Manrope;font-style:normal;font-weight:400 700;src:url(/dist/web/assets/manrope-4qdASHmp.woff2) format("woff2");unicode-range:U+0301,U+0400-045f,U+0490-0491,U+04b0-04b1,U+2116}@font-face{font-display:swap;font-family:Manrope;font-style:normal;font-weight:400 700;src:url(/dist/web/assets/manrope-4qdASHmp.woff2) format("woff2");unicode-range:U+0102-0103,U+0110-0111,U+0128-0129,U+0168-0169,U+01a0-01a1,U+01af-01b0,U+0300-0301,U+0303-0304,U+0308-0309,U+0323,U+0329,U+1ea0-1ef9,U+20ab}@font-face{font-display:swap;font-family:Manrope;font-style:normal;font-weight:400 700;src:url(/dist/web/assets/manrope-4qdASHmp.woff2) format("woff2");unicode-range:U+0100-02af,U+0304,U+0308,U+0329,U+1e00-1e9f,U+1ef2-1eff,U+2020,U+20a0-20ab,U+20ad-20cf,U+2113,U+2c60-2c7f,U+a720-a7ff}@font-face{font-display:swap;font-family:Manrope;font-style:normal;font-weight:400 700;src:url(/dist/web/assets/manrope-4qdASHmp.woff2) format("woff2");unicode-range:U+00??,U+0131,U+0152-0153,U+02bb-02bc,U+02c6,U+02da,U+02dc,U+0304,U+0308,U+0329,U+2000-206f,U+2074,U+20ac,U+2122,U+2191,U+2193,U+2212,U+2215,U+feff,U+fffd}@supports (-moz-appearance:none){.moz\:hidden{display:none!important}.moz\:block{display:block!important}}
/* assets/index-CAiW7JS5.css */
@keyframes _bblFadInOut_10462_1{0%,80%,to{box-shadow:0 2.5em 0 -1.3em}40%{box-shadow:0 2.5em}}@font-face{font-display:swap;font-family:Manrope;font-style:normal;font-weight:400 700;src:url(/dist/web/assets/manrope-4qdASHmp.woff2) format("woff2");unicode-range:U+0301,U+0400-045f,U+0490-0491,U+04b0-04b1,U+2116}@font-face{font-display:swap;font-family:Manrope;font-style:normal;font-weight:400 700;src:url(/dist/web/assets/manrope-4qdASHmp.woff2) format("woff2");unicode-range:U+0102-0103,U+0110-0111,U+0128-0129,U+0168-0169,U+01a0-01a1,U+01af-01b0,U+0300-0301,U+0303-0304,U+0308-0309,U+0323,U+0329,U+1ea0-1ef9,U+20ab}@font-face{font-display:swap;font-family:Manrope;font-style:normal;font-weight:400 700;src:url(/dist/web/assets/manrope-4qdASHmp.woff2) format("woff2");unicode-range:U+0100-02af,U+0304,U+0308,U+0329,U+1e00-1e9f,U+1ef2-1eff,U+2020,U+20a0-20ab,U+20ad-20cf,U+2113,U+2c60-2c7f,U+a720-a7ff}@font-face{font-display:swap;font-family:Manrope;font-style:normal;font-weight:400 700;src:url(/dist/web/assets/manrope-4qdASHmp.woff2) format("woff2");unicode-range:U+00??,U+0131,U+0152-0153,U+02bb-02bc,U+02c6,U+02da,U+02dc,U+0304,U+0308,U+0329,U+2000-206f,U+2074,U+20ac,U+2122,U+2191,U+2193,U+2212,U+2215,U+feff,U+fffd}@supports (-moz-appearance:none){.moz\:hidden{display:none!important}.moz\:block{display:block!important}}
/* assets/index-CBztbBIg.css */
@keyframes _bblFadInOut_10462_1{0%,80%,to{box-shadow:0 2.5em 0 -1.3em}40%{box-shadow:0 2.5em}}@font-face{font-display:swap;font-family:Manrope;font-style:normal;font-weight:400 700;src:url(/dist/web/assets/manrope-4qdASHmp.woff2) format("woff2");unicode-range:U+0301,U+0400-045f,U+0490-0491,U+04b0-04b1,U+2116}@font-face{font-display:swap;font-family:Manrope;font-style:normal;font-weight:400 700;src:url(/dist/web/assets/manrope-4qdASHmp.woff2) format("woff2");unicode-range:U+0102-0103,U+0110-0111,U+0128-0129,U+0168-0169,U+01a0-01a1,U+01af-01b0,U+0300-0301,U+0303-0304,U+0308-0309,U+0323,U+0329,U+1ea0-1ef9,U+20ab}@font-face{font-display:swap;font-family:Manrope;font-style:normal;font-weight:400 700;src:url(/dist/web/assets/manrope-4qdASHmp.woff2) format("woff2");unicode-range:U+0100-02af,U+0304,U+0308,U+0329,U+1e00-1e9f,U+1ef2-1eff,U+2020,U+20a0-20ab,U+20ad-20cf,U+2113,U+2c60-2c7f,U+a720-a7ff}@font-face{font-display:swap;font-family:Manrope;font-style:normal;font-weight:400 700;src:url(/dist/web/assets/manrope-4qdASHmp.woff2) format("woff2");unicode-range:U+00??,U+0131,U+0152-0153,U+02bb-02bc,U+02c6,U+02da,U+02dc,U+0304,U+0308,U+0329,U+2000-206f,U+2074,U+20ac,U+2122,U+2191,U+2193,U+2212,U+2215,U+feff,U+fffd}
/* assets/index-CGFIIWzn.css */
@keyframes _bblFadInOut_10462_1{0%,80%,to{box-shadow:0 2.5em 0 -1.3em}40%{box-shadow:0 2.5em}}@font-face{font-display:swap;font-family:Manrope;font-style:normal;font-weight:400 700;src:url(/dist/web/assets/manrope-4qdASHmp.woff2) format("woff2");unicode-range:U+0301,U+0400-045f,U+0490-0491,U+04b0-04b1,U+2116}@font-face{font-display:swap;font-family:Manrope;font-style:normal;font-weight:400 700;src:url(/dist/web/assets/manrope-4qdASHmp.woff2) format("woff2");unicode-range:U+0102-0103,U+0110-0111,U+0128-0129,U+0168-0169,U+01a0-01a1,U+01af-01b0,U+0300-0301,U+0303-0304,U+0308-0309,U+0323,U+0329,U+1ea0-1ef9,U+20ab}@font-face{font-display:swap;font-family:Manrope;font-style:normal;font-weight:400 700;src:url(/dist/web/assets/manrope-4qdASHmp.woff2) format("woff2");unicode-range:U+0100-02af,U+0304,U+0308,U+0329,U+1e00-1e9f,U+1ef2-1eff,U+2020,U+20a0-20ab,U+20ad-20cf,U+2113,U+2c60-2c7f,U+a720-a7ff}@font-face{font-display:swap;font-family:Manrope;font-style:normal;font-weight:400 700;src:url(/dist/web/assets/manrope-4qdASHmp.woff2) format("woff2");unicode-range:U+00??,U+0131,U+0152-0153,U+02bb-02bc,U+02c6,U+02da,U+02dc,U+0304,U+0308,U+0329,U+2000-206f,U+2074,U+20ac,U+2122,U+2191,U+2193,U+2212,U+2215,U+feff,U+fffd}
/* assets/index-CMHofGZN.css */
@keyframes _bblFadInOut_10462_1{0%,80%,to{box-shadow:0 2.5em 0 -1.3em}40%{box-shadow:0 2.5em}}@font-face{font-display:swap;font-family:Manrope;font-style:normal;font-weight:400 700;src:url(/dist/web/assets/manrope-4qdASHmp.woff2) format("woff2");unicode-range:U+0301,U+0400-045f,U+0490-0491,U+04b0-04b1,U+2116}@font-face{font-display:swap;font-family:Manrope;font-style:normal;font-weight:400 700;src:url(/dist/web/assets/manrope-4qdASHmp.woff2) format("woff2");unicode-range:U+0102-0103,U+0110-0111,U+0128-0129,U+0168-0169,U+01a0-01a1,U+01af-01b0,U+0300-0301,U+0303-0304,U+0308-0309,U+0323,U+0329,U+1ea0-1ef9,U+20ab}@font-face{font-display:swap;font-family:Manrope;font-style:normal;font-weight:400 700;src:url(/dist/web/assets/manrope-4qdASHmp.woff2) format("woff2");unicode-range:U+0100-02af,U+0304,U+0308,U+0329,U+1e00-1e9f,U+1ef2-1eff,U+2020,U+20a0-20ab,U+20ad-20cf,U+2113,U+2c60-2c7f,U+a720-a7ff}@font-face{font-display:swap;font-family:Manrope;font-style:normal;font-weight:400 700;src:url(/dist/web/assets/manrope-4qdASHmp.woff2) format("woff2");unicode-range:U+00??,U+0131,U+0152-0153,U+02bb-02bc,U+02c6,U+02da,U+02dc,U+0304,U+0308,U+0329,U+2000-206f,U+2074,U+20ac,U+2122,U+2191,U+2193,U+2212,U+2215,U+feff,U+fffd}
/* assets/index-CMaM1jig.css */
@keyframes _bblFadInOut_10462_1{0%,80%,to{box-shadow:0 2.5em 0 -1.3em}40%{box-shadow:0 2.5em}}@font-face{font-display:swap;font-family:Manrope;font-style:normal;font-weight:400 700;src:url(/dist/web/assets/manrope-4qdASHmp.woff2) format("woff2");unicode-range:U+0301,U+0400-045f,U+0490-0491,U+04b0-04b1,U+2116}@font-face{font-display:swap;font-family:Manrope;font-style:normal;font-weight:400 700;src:url(/dist/web/assets/manrope-4qdASHmp.woff2) format("woff2");unicode-range:U+0102-0103,U+0110-0111,U+0128-0129,U+0168-0169,U+01a0-01a1,U+01af-01b0,U+0300-0301,U+0303-0304,U+0308-0309,U+0323,U+0329,U+1ea0-1ef9,U+20ab}@font-face{font-display:swap;font-family:Manrope;font-style:normal;font-weight:400 700;src:url(/dist/web/assets/manrope-4qdASHmp.woff2) format("woff2");unicode-range:U+0100-02af,U+0304,U+0308,U+0329,U+1e00-1e9f,U+1ef2-1eff,U+2020,U+20a0-20ab,U+20ad-20cf,U+2113,U+2c60-2c7f,U+a720-a7ff}@font-face{font-display:swap;font-family:Manrope;font-style:normal;font-weight:400 700;src:url(/dist/web/assets/manrope-4qdASHmp.woff2) format("woff2");unicode-range:U+00??,U+0131,U+0152-0153,U+02bb-02bc,U+02c6,U+02da,U+02dc,U+0304,U+0308,U+0329,U+2000-206f,U+2074,U+20ac,U+2122,U+2191,U+2193,U+2212,U+2215,U+feff,U+fffd}@keyframes ticker-scroll{0%{transform:translate(0)}to{transform:translate(-50%)}}@supports (-moz-appearance:none){.moz\:hidden{display:none!important}.moz\:block{display:block!important}}
/* assets/index-COR7VHhc.css */
@keyframes _bblFadInOut_10462_1{0%,80%,to{box-shadow:0 2.5em 0 -1.3em}40%{box-shadow:0 2.5em}}@font-face{font-display:swap;font-family:Manrope;font-style:normal;font-weight:400 700;src:url(/dist/web/assets/manrope-4qdASHmp.woff2) format("woff2");unicode-range:U+0301,U+0400-045f,U+0490-0491,U+04b0-04b1,U+2116}@font-face{font-display:swap;font-family:Manrope;font-style:normal;font-weight:400 700;src:url(/dist/web/assets/manrope-4qdASHmp.woff2) format("woff2");unicode-range:U+0102-0103,U+0110-0111,U+0128-0129,U+0168-0169,U+01a0-01a1,U+01af-01b0,U+0300-0301,U+0303-0304,U+0308-0309,U+0323,U+0329,U+1ea0-1ef9,U+20ab}@font-face{font-display:swap;font-family:Manrope;font-style:normal;font-weight:400 700;src:url(/dist/web/assets/manrope-4qdASHmp.woff2) format("woff2");unicode-range:U+0100-02af,U+0304,U+0308,U+0329,U+1e00-1e9f,U+1ef2-1eff,U+2020,U+20a0-20ab,U+20ad-20cf,U+2113,U+2c60-2c7f,U+a720-a7ff}@font-face{font-display:swap;font-family:Manrope;font-style:normal;font-weight:400 700;src:url(/dist/web/assets/manrope-4qdASHmp.woff2) format("woff2");unicode-range:U+00??,U+0131,U+0152-0153,U+02bb-02bc,U+02c6,U+02da,U+02dc,U+0304,U+0308,U+0329,U+2000-206f,U+2074,U+20ac,U+2122,U+2191,U+2193,U+2212,U+2215,U+feff,U+fffd}
/* assets/index-CQ2Y2pPY.css */
@keyframes _bblFadInOut_10462_1{0%,80%,to{box-shadow:0 2.5em 0 -1.3em}40%{box-shadow:0 2.5em}}@font-face{font-display:swap;font-family:Manrope;font-style:normal;font-weight:400 700;src:url(/dist/web/assets/manrope-4qdASHmp.woff2) format("woff2");unicode-range:U+0301,U+0400-045f,U+0490-0491,U+04b0-04b1,U+2116}@font-face{font-display:swap;font-family:Manrope;font-style:normal;font-weight:400 700;src:url(/dist/web/assets/manrope-4qdASHmp.woff2) format("woff2");unicode-range:U+0102-0103,U+0110-0111,U+0128-0129,U+0168-0169,U+01a0-01a1,U+01af-01b0,U+0300-0301,U+0303-0304,U+0308-0309,U+0323,U+0329,U+1ea0-1ef9,U+20ab}@font-face{font-display:swap;font-family:Manrope;font-style:normal;font-weight:400 700;src:url(/dist/web/assets/manrope-4qdASHmp.woff2) format("woff2");unicode-range:U+0100-02af,U+0304,U+0308,U+0329,U+1e00-1e9f,U+1ef2-1eff,U+2020,U+20a0-20ab,U+20ad-20cf,U+2113,U+2c60-2c7f,U+a720-a7ff}@font-face{font-display:swap;font-family:Manrope;font-style:normal;font-weight:400 700;src:url(/dist/web/assets/manrope-4qdASHmp.woff2) format("woff2");unicode-range:U+00??,U+0131,U+0152-0153,U+02bb-02bc,U+02c6,U+02da,U+02dc,U+0304,U+0308,U+0329,U+2000-206f,U+2074,U+20ac,U+2122,U+2191,U+2193,U+2212,U+2215,U+feff,U+fffd}
/* assets/index-CSOkTFBJ.css */
@keyframes _bblFadInOut_10462_1{0%,80%,to{box-shadow:0 2.5em 0 -1.3em}40%{box-shadow:0 2.5em}}@font-face{font-display:swap;font-family:Manrope;font-style:normal;font-weight:400 700;src:url(/dist/web/assets/manrope-4qdASHmp.woff2) format("woff2");unicode-range:U+0301,U+0400-045f,U+0490-0491,U+04b0-04b1,U+2116}@font-face{font-display:swap;font-family:Manrope;font-style:normal;font-weight:400 700;src:url(/dist/web/assets/manrope-4qdASHmp.woff2) format("woff2");unicode-range:U+0102-0103,U+0110-0111,U+0128-0129,U+0168-0169,U+01a0-01a1,U+01af-01b0,U+0300-0301,U+0303-0304,U+0308-0309,U+0323,U+0329,U+1ea0-1ef9,U+20ab}@font-face{font-display:swap;font-family:Manrope;font-style:normal;font-weight:400 700;src:url(/dist/web/assets/manrope-4qdASHmp.woff2) format("woff2");unicode-range:U+0100-02af,U+0304,U+0308,U+0329,U+1e00-1e9f,U+1ef2-1eff,U+2020,U+20a0-20ab,U+20ad-20cf,U+2113,U+2c60-2c7f,U+a720-a7ff}@font-face{font-display:swap;font-family:Manrope;font-style:normal;font-weight:400 700;src:url(/dist/web/assets/manrope-4qdASHmp.woff2) format("woff2");unicode-range:U+00??,U+0131,U+0152-0153,U+02bb-02bc,U+02c6,U+02da,U+02dc,U+0304,U+0308,U+0329,U+2000-206f,U+2074,U+20ac,U+2122,U+2191,U+2193,U+2212,U+2215,U+feff,U+fffd}
/* assets/index-CU0E52kI.css */
@keyframes _bblFadInOut_10462_1{0%,80%,to{box-shadow:0 2.5em 0 -1.3em}40%{box-shadow:0 2.5em}}@font-face{font-display:swap;font-family:Manrope;font-style:normal;font-weight:400 700;src:url(/dist/web/assets/manrope-4qdASHmp.woff2) format("woff2");unicode-range:U+0301,U+0400-045f,U+0490-0491,U+04b0-04b1,U+2116}@font-face{font-display:swap;font-family:Manrope;font-style:normal;font-weight:400 700;src:url(/dist/web/assets/manrope-4qdASHmp.woff2) format("woff2");unicode-range:U+0102-0103,U+0110-0111,U+0128-0129,U+0168-0169,U+01a0-01a1,U+01af-01b0,U+0300-0301,U+0303-0304,U+0308-0309,U+0323,U+0329,U+1ea0-1ef9,U+20ab}@font-face{font-display:swap;font-family:Manrope;font-style:normal;font-weight:400 700;src:url(/dist/web/assets/manrope-4qdASHmp.woff2) format("woff2");unicode-range:U+0100-02af,U+0304,U+0308,U+0329,U+1e00-1e9f,U+1ef2-1eff,U+2020,U+20a0-20ab,U+20ad-20cf,U+2113,U+2c60-2c7f,U+a720-a7ff}@font-face{font-display:swap;font-family:Manrope;font-style:normal;font-weight:400 700;src:url(/dist/web/assets/manrope-4qdASHmp.woff2) format("woff2");unicode-range:U+00??,U+0131,U+0152-0153,U+02bb-02bc,U+02c6,U+02da,U+02dc,U+0304,U+0308,U+0329,U+2000-206f,U+2074,U+20ac,U+2122,U+2191,U+2193,U+2212,U+2215,U+feff,U+fffd}@supports (-moz-appearance:none){.moz\:hidden{display:none!important}.moz\:block{display:block!important}}
/* assets/index-CYtALZxt.css */
@keyframes _bblFadInOut_10462_1{0%,80%,to{box-shadow:0 2.5em 0 -1.3em}40%{box-shadow:0 2.5em}}@font-face{font-display:swap;font-family:Manrope;font-style:normal;font-weight:400 700;src:url(/dist/web/assets/manrope-4qdASHmp.woff2) format("woff2");unicode-range:U+0301,U+0400-045f,U+0490-0491,U+04b0-04b1,U+2116}@font-face{font-display:swap;font-family:Manrope;font-style:normal;font-weight:400 700;src:url(/dist/web/assets/manrope-4qdASHmp.woff2) format("woff2");unicode-range:U+0102-0103,U+0110-0111,U+0128-0129,U+0168-0169,U+01a0-01a1,U+01af-01b0,U+0300-0301,U+0303-0304,U+0308-0309,U+0323,U+0329,U+1ea0-1ef9,U+20ab}@font-face{font-display:swap;font-family:Manrope;font-style:normal;font-weight:400 700;src:url(/dist/web/assets/manrope-4qdASHmp.woff2) format("woff2");unicode-range:U+0100-02af,U+0304,U+0308,U+0329,U+1e00-1e9f,U+1ef2-1eff,U+2020,U+20a0-20ab,U+20ad-20cf,U+2113,U+2c60-2c7f,U+a720-a7ff}@font-face{font-display:swap;font-family:Manrope;font-style:normal;font-weight:400 700;src:url(/dist/web/assets/manrope-4qdASHmp.woff2) format("woff2");unicode-range:U+00??,U+0131,U+0152-0153,U+02bb-02bc,U+02c6,U+02da,U+02dc,U+0304,U+0308,U+0329,U+2000-206f,U+2074,U+20ac,U+2122,U+2191,U+2193,U+2212,U+2215,U+feff,U+fffd}
/* assets/index-CZnXAR8I.css */
@keyframes _bblFadInOut_10462_1{0%,80%,to{box-shadow:0 2.5em 0 -1.3em}40%{box-shadow:0 2.5em}}@font-face{font-display:swap;font-family:Manrope;font-style:normal;font-weight:400 700;src:url(/dist/web/assets/manrope-4qdASHmp.woff2) format("woff2");unicode-range:U+0301,U+0400-045f,U+0490-0491,U+04b0-04b1,U+2116}@font-face{font-display:swap;font-family:Manrope;font-style:normal;font-weight:400 700;src:url(/dist/web/assets/manrope-4qdASHmp.woff2) format("woff2");unicode-range:U+0102-0103,U+0110-0111,U+0128-0129,U+0168-0169,U+01a0-01a1,U+01af-01b0,U+0300-0301,U+0303-0304,U+0308-0309,U+0323,U+0329,U+1ea0-1ef9,U+20ab}@font-face{font-display:swap;font-family:Manrope;font-style:normal;font-weight:400 700;src:url(/dist/web/assets/manrope-4qdASHmp.woff2) format("woff2");unicode-range:U+0100-02af,U+0304,U+0308,U+0329,U+1e00-1e9f,U+1ef2-1eff,U+2020,U+20a0-20ab,U+20ad-20cf,U+2113,U+2c60-2c7f,U+a720-a7ff}@font-face{font-display:swap;font-family:Manrope;font-style:normal;font-weight:400 700;src:url(/dist/web/assets/manrope-4qdASHmp.woff2) format("woff2");unicode-range:U+00??,U+0131,U+0152-0153,U+02bb-02bc,U+02c6,U+02da,U+02dc,U+0304,U+0308,U+0329,U+2000-206f,U+2074,U+20ac,U+2122,U+2191,U+2193,U+2212,U+2215,U+feff,U+fffd}
/* assets/index-Cc1yvdmo.css */
@keyframes _bblFadInOut_10462_1{0%,80%,to{box-shadow:0 2.5em 0 -1.3em}40%{box-shadow:0 2.5em}}@font-face{font-display:swap;font-family:Manrope;font-style:normal;font-weight:400 700;src:url(/dist/web/assets/manrope-4qdASHmp.woff2) format("woff2");unicode-range:U+0301,U+0400-045f,U+0490-0491,U+04b0-04b1,U+2116}@font-face{font-display:swap;font-family:Manrope;font-style:normal;font-weight:400 700;src:url(/dist/web/assets/manrope-4qdASHmp.woff2) format("woff2");unicode-range:U+0102-0103,U+0110-0111,U+0128-0129,U+0168-0169,U+01a0-01a1,U+01af-01b0,U+0300-0301,U+0303-0304,U+0308-0309,U+0323,U+0329,U+1ea0-1ef9,U+20ab}@font-face{font-display:swap;font-family:Manrope;font-style:normal;font-weight:400 700;src:url(/dist/web/assets/manrope-4qdASHmp.woff2) format("woff2");unicode-range:U+0100-02af,U+0304,U+0308,U+0329,U+1e00-1e9f,U+1ef2-1eff,U+2020,U+20a0-20ab,U+20ad-20cf,U+2113,U+2c60-2c7f,U+a720-a7ff}@font-face{font-display:swap;font-family:Manrope;font-style:normal;font-weight:400 700;src:url(/dist/web/assets/manrope-4qdASHmp.woff2) format("woff2");unicode-range:U+00??,U+0131,U+0152-0153,U+02bb-02bc,U+02c6,U+02da,U+02dc,U+0304,U+0308,U+0329,U+2000-206f,U+2074,U+20ac,U+2122,U+2191,U+2193,U+2212,U+2215,U+feff,U+fffd}
/* assets/index-CcPpOIHz.css */
@keyframes _bblFadInOut_10462_1{0%,80%,to{box-shadow:0 2.5em 0 -1.3em}40%{box-shadow:0 2.5em}}@font-face{font-display:swap;font-family:Manrope;font-style:normal;font-weight:400 700;src:url(/dist/web/assets/manrope-4qdASHmp.woff2) format("woff2");unicode-range:U+0301,U+0400-045f,U+0490-0491,U+04b0-04b1,U+2116}@font-face{font-display:swap;font-family:Manrope;font-style:normal;font-weight:400 700;src:url(/dist/web/assets/manrope-4qdASHmp.woff2) format("woff2");unicode-range:U+0102-0103,U+0110-0111,U+0128-0129,U+0168-0169,U+01a0-01a1,U+01af-01b0,U+0300-0301,U+0303-0304,U+0308-0309,U+0323,U+0329,U+1ea0-1ef9,U+20ab}@font-face{font-display:swap;font-family:Manrope;font-style:normal;font-weight:400 700;src:url(/dist/web/assets/manrope-4qdASHmp.woff2) format("woff2");unicode-range:U+0100-02af,U+0304,U+0308,U+0329,U+1e00-1e9f,U+1ef2-1eff,U+2020,U+20a0-20ab,U+20ad-20cf,U+2113,U+2c60-2c7f,U+a720-a7ff}@font-face{font-display:swap;font-family:Manrope;font-style:normal;font-weight:400 700;src:url(/dist/web/assets/manrope-4qdASHmp.woff2) format("woff2");unicode-range:U+00??,U+0131,U+0152-0153,U+02bb-02bc,U+02c6,U+02da,U+02dc,U+0304,U+0308,U+0329,U+2000-206f,U+2074,U+20ac,U+2122,U+2191,U+2193,U+2212,U+2215,U+feff,U+fffd}@keyframes ticker-scroll{0%{transform:translate(0)}to{transform:translate(-50%)}}@supports (-moz-appearance:none){.moz\:hidden{display:none!important}.moz\:block{display:block!important}}
/* assets/index-CeW1jGok.css */
@keyframes _bblFadInOut_10462_1{0%,80%,to{box-shadow:0 2.5em 0 -1.3em}40%{box-shadow:0 2.5em}}@font-face{font-display:swap;font-family:Manrope;font-style:normal;font-weight:400 700;src:url(/dist/web/assets/manrope-4qdASHmp.woff2) format("woff2");unicode-range:U+0301,U+0400-045f,U+0490-0491,U+04b0-04b1,U+2116}@font-face{font-display:swap;font-family:Manrope;font-style:normal;font-weight:400 700;src:url(/dist/web/assets/manrope-4qdASHmp.woff2) format("woff2");unicode-range:U+0102-0103,U+0110-0111,U+0128-0129,U+0168-0169,U+01a0-01a1,U+01af-01b0,U+0300-0301,U+0303-0304,U+0308-0309,U+0323,U+0329,U+1ea0-1ef9,U+20ab}@font-face{font-display:swap;font-family:Manrope;font-style:normal;font-weight:400 700;src:url(/dist/web/assets/manrope-4qdASHmp.woff2) format("woff2");unicode-range:U+0100-02af,U+0304,U+0308,U+0329,U+1e00-1e9f,U+1ef2-1eff,U+2020,U+20a0-20ab,U+20ad-20cf,U+2113,U+2c60-2c7f,U+a720-a7ff}@font-face{font-display:swap;font-family:Manrope;font-style:normal;font-weight:400 700;src:url(/dist/web/assets/manrope-4qdASHmp.woff2) format("woff2");unicode-range:U+00??,U+0131,U+0152-0153,U+02bb-02bc,U+02c6,U+02da,U+02dc,U+0304,U+0308,U+0329,U+2000-206f,U+2074,U+20ac,U+2122,U+2191,U+2193,U+2212,U+2215,U+feff,U+fffd}@supports (-moz-appearance:none){.moz\:hidden{display:none!important}.moz\:block{display:block!important}}
/* assets/index-CgSBgN4I.css */
@keyframes _bblFadInOut_10462_1{0%,80%,to{box-shadow:0 2.5em 0 -1.3em}40%{box-shadow:0 2.5em}}@font-face{font-display:swap;font-family:Manrope;font-style:normal;font-weight:400 700;src:url(/dist/web/assets/manrope-4qdASHmp.woff2) format("woff2");unicode-range:U+0301,U+0400-045f,U+0490-0491,U+04b0-04b1,U+2116}@font-face{font-display:swap;font-family:Manrope;font-style:normal;font-weight:400 700;src:url(/dist/web/assets/manrope-4qdASHmp.woff2) format("woff2");unicode-range:U+0102-0103,U+0110-0111,U+0128-0129,U+0168-0169,U+01a0-01a1,U+01af-01b0,U+0300-0301,U+0303-0304,U+0308-0309,U+0323,U+0329,U+1ea0-1ef9,U+20ab}@font-face{font-display:swap;font-family:Manrope;font-style:normal;font-weight:400 700;src:url(/dist/web/assets/manrope-4qdASHmp.woff2) format("woff2");unicode-range:U+0100-02af,U+0304,U+0308,U+0329,U+1e00-1e9f,U+1ef2-1eff,U+2020,U+20a0-20ab,U+20ad-20cf,U+2113,U+2c60-2c7f,U+a720-a7ff}@font-face{font-display:swap;font-family:Manrope;font-style:normal;font-weight:400 700;src:url(/dist/web/assets/manrope-4qdASHmp.woff2) format("woff2");unicode-range:U+00??,U+0131,U+0152-0153,U+02bb-02bc,U+02c6,U+02da,U+02dc,U+0304,U+0308,U+0329,U+2000-206f,U+2074,U+20ac,U+2122,U+2191,U+2193,U+2212,U+2215,U+feff,U+fffd}@supports (-moz-appearance:none){.moz\:hidden{display:none!important}.moz\:block{display:block!important}}
/* assets/index-ChU_Yk3Q.css */
@keyframes _bblFadInOut_10462_1{0%,80%,to{box-shadow:0 2.5em 0 -1.3em}40%{box-shadow:0 2.5em}}@font-face{font-display:swap;font-family:Manrope;font-style:normal;font-weight:400 700;src:url(/dist/web/assets/manrope-4qdASHmp.woff2) format("woff2");unicode-range:U+0301,U+0400-045f,U+0490-0491,U+04b0-04b1,U+2116}@font-face{font-display:swap;font-family:Manrope;font-style:normal;font-weight:400 700;src:url(/dist/web/assets/manrope-4qdASHmp.woff2) format("woff2");unicode-range:U+0102-0103,U+0110-0111,U+0128-0129,U+0168-0169,U+01a0-01a1,U+01af-01b0,U+0300-0301,U+0303-0304,U+0308-0309,U+0323,U+0329,U+1ea0-1ef9,U+20ab}@font-face{font-display:swap;font-family:Manrope;font-style:normal;font-weight:400 700;src:url(/dist/web/assets/manrope-4qdASHmp.woff2) format("woff2");unicode-range:U+0100-02af,U+0304,U+0308,U+0329,U+1e00-1e9f,U+1ef2-1eff,U+2020,U+20a0-20ab,U+20ad-20cf,U+2113,U+2c60-2c7f,U+a720-a7ff}@font-face{font-display:swap;font-family:Manrope;font-style:normal;font-weight:400 700;src:url(/dist/web/assets/manrope-4qdASHmp.woff2) format("woff2");unicode-range:U+00??,U+0131,U+0152-0153,U+02bb-02bc,U+02c6,U+02da,U+02dc,U+0304,U+0308,U+0329,U+2000-206f,U+2074,U+20ac,U+2122,U+2191,U+2193,U+2212,U+2215,U+feff,U+fffd}
/* assets/index-CjC8Sq89.css */
@keyframes _bblFadInOut_10462_1{0%,80%,to{box-shadow:0 2.5em 0 -1.3em}40%{box-shadow:0 2.5em}}@font-face{font-display:swap;font-family:Manrope;font-style:normal;font-weight:400 700;src:url(/dist/web/assets/manrope-4qdASHmp.woff2) format("woff2");unicode-range:U+0301,U+0400-045f,U+0490-0491,U+04b0-04b1,U+2116}@font-face{font-display:swap;font-family:Manrope;font-style:normal;font-weight:400 700;src:url(/dist/web/assets/manrope-4qdASHmp.woff2) format("woff2");unicode-range:U+0102-0103,U+0110-0111,U+0128-0129,U+0168-0169,U+01a0-01a1,U+01af-01b0,U+0300-0301,U+0303-0304,U+0308-0309,U+0323,U+0329,U+1ea0-1ef9,U+20ab}@font-face{font-display:swap;font-family:Manrope;font-style:normal;font-weight:400 700;src:url(/dist/web/assets/manrope-4qdASHmp.woff2) format("woff2");unicode-range:U+0100-02af,U+0304,U+0308,U+0329,U+1e00-1e9f,U+1ef2-1eff,U+2020,U+20a0-20ab,U+20ad-20cf,U+2113,U+2c60-2c7f,U+a720-a7ff}@font-face{font-display:swap;font-family:Manrope;font-style:normal;font-weight:400 700;src:url(/dist/web/assets/manrope-4qdASHmp.woff2) format("woff2");unicode-range:U+00??,U+0131,U+0152-0153,U+02bb-02bc,U+02c6,U+02da,U+02dc,U+0304,U+0308,U+0329,U+2000-206f,U+2074,U+20ac,U+2122,U+2191,U+2193,U+2212,U+2215,U+feff,U+fffd}
/* assets/index-Ckscx06k.css */
@keyframes _bblFadInOut_10462_1{0%,80%,to{box-shadow:0 2.5em 0 -1.3em}40%{box-shadow:0 2.5em}}@font-face{font-display:swap;font-family:Manrope;font-style:normal;font-weight:400 700;src:url(/dist/web/assets/manrope-4qdASHmp.woff2) format("woff2");unicode-range:U+0301,U+0400-045f,U+0490-0491,U+04b0-04b1,U+2116}@font-face{font-display:swap;font-family:Manrope;font-style:normal;font-weight:400 700;src:url(/dist/web/assets/manrope-4qdASHmp.woff2) format("woff2");unicode-range:U+0102-0103,U+0110-0111,U+0128-0129,U+0168-0169,U+01a0-01a1,U+01af-01b0,U+0300-0301,U+0303-0304,U+0308-0309,U+0323,U+0329,U+1ea0-1ef9,U+20ab}@font-face{font-display:swap;font-family:Manrope;font-style:normal;font-weight:400 700;src:url(/dist/web/assets/manrope-4qdASHmp.woff2) format("woff2");unicode-range:U+0100-02af,U+0304,U+0308,U+0329,U+1e00-1e9f,U+1ef2-1eff,U+2020,U+20a0-20ab,U+20ad-20cf,U+2113,U+2c60-2c7f,U+a720-a7ff}@font-face{font-display:swap;font-family:Manrope;font-style:normal;font-weight:400 700;src:url(/dist/web/assets/manrope-4qdASHmp.woff2) format("woff2");unicode-range:U+00??,U+0131,U+0152-0153,U+02bb-02bc,U+02c6,U+02da,U+02dc,U+0304,U+0308,U+0329,U+2000-206f,U+2074,U+20ac,U+2122,U+2191,U+2193,U+2212,U+2215,U+feff,U+fffd}
/* assets/index-CwYSfGIC.css */
@keyframes _bblFadInOut_10462_1{0%,80%,to{box-shadow:0 2.5em 0 -1.3em}40%{box-shadow:0 2.5em}}@font-face{font-display:swap;font-family:Manrope;font-style:normal;font-weight:400 700;src:url(/dist/web/assets/manrope-4qdASHmp.woff2) format("woff2");unicode-range:U+0301,U+0400-045f,U+0490-0491,U+04b0-04b1,U+2116}@font-face{font-display:swap;font-family:Manrope;font-style:normal;font-weight:400 700;src:url(/dist/web/assets/manrope-4qdASHmp.woff2) format("woff2");unicode-range:U+0102-0103,U+0110-0111,U+0128-0129,U+0168-0169,U+01a0-01a1,U+01af-01b0,U+0300-0301,U+0303-0304,U+0308-0309,U+0323,U+0329,U+1ea0-1ef9,U+20ab}@font-face{font-display:swap;font-family:Manrope;font-style:normal;font-weight:400 700;src:url(/dist/web/assets/manrope-4qdASHmp.woff2) format("woff2");unicode-range:U+0100-02af,U+0304,U+0308,U+0329,U+1e00-1e9f,U+1ef2-1eff,U+2020,U+20a0-20ab,U+20ad-20cf,U+2113,U+2c60-2c7f,U+a720-a7ff}@font-face{font-display:swap;font-family:Manrope;font-style:normal;font-weight:400 700;src:url(/dist/web/assets/manrope-4qdASHmp.woff2) format("woff2");unicode-range:U+00??,U+0131,U+0152-0153,U+02bb-02bc,U+02c6,U+02da,U+02dc,U+0304,U+0308,U+0329,U+2000-206f,U+2074,U+20ac,U+2122,U+2191,U+2193,U+2212,U+2215,U+feff,U+fffd}@supports (-moz-appearance:none){.moz\:hidden{display:none!important}.moz\:block{display:block!important}}
/* assets/index-CygN-aWi.css */
@keyframes _bblFadInOut_10462_1{0%,80%,to{box-shadow:0 2.5em 0 -1.3em}40%{box-shadow:0 2.5em}}@font-face{font-display:swap;font-family:Manrope;font-style:normal;font-weight:400 700;src:url(/dist/web/assets/manrope-4qdASHmp.woff2) format("woff2");unicode-range:U+0301,U+0400-045f,U+0490-0491,U+04b0-04b1,U+2116}@font-face{font-display:swap;font-family:Manrope;font-style:normal;font-weight:400 700;src:url(/dist/web/assets/manrope-4qdASHmp.woff2) format("woff2");unicode-range:U+0102-0103,U+0110-0111,U+0128-0129,U+0168-0169,U+01a0-01a1,U+01af-01b0,U+0300-0301,U+0303-0304,U+0308-0309,U+0323,U+0329,U+1ea0-1ef9,U+20ab}@font-face{font-display:swap;font-family:Manrope;font-style:normal;font-weight:400 700;src:url(/dist/web/assets/manrope-4qdASHmp.woff2) format("woff2");unicode-range:U+0100-02af,U+0304,U+0308,U+0329,U+1e00-1e9f,U+1ef2-1eff,U+2020,U+20a0-20ab,U+20ad-20cf,U+2113,U+2c60-2c7f,U+a720-a7ff}@font-face{font-display:swap;font-family:Manrope;font-style:normal;font-weight:400 700;src:url(/dist/web/assets/manrope-4qdASHmp.woff2) format("woff2");unicode-range:U+00??,U+0131,U+0152-0153,U+02bb-02bc,U+02c6,U+02da,U+02dc,U+0304,U+0308,U+0329,U+2000-206f,U+2074,U+20ac,U+2122,U+2191,U+2193,U+2212,U+2215,U+feff,U+fffd}
/* assets/index-Czpp6AhZ.css */
@keyframes _bblFadInOut_10462_1{0%,80%,to{box-shadow:0 2.5em 0 -1.3em}40%{box-shadow:0 2.5em}}@font-face{font-display:swap;font-family:Manrope;font-style:normal;font-weight:400 700;src:url(/dist/web/assets/manrope-4qdASHmp.woff2) format("woff2");unicode-range:U+0301,U+0400-045f,U+0490-0491,U+04b0-04b1,U+2116}@font-face{font-display:swap;font-family:Manrope;font-style:normal;font-weight:400 700;src:url(/dist/web/assets/manrope-4qdASHmp.woff2) format("woff2");unicode-range:U+0102-0103,U+0110-0111,U+0128-0129,U+0168-0169,U+01a0-01a1,U+01af-01b0,U+0300-0301,U+0303-0304,U+0308-0309,U+0323,U+0329,U+1ea0-1ef9,U+20ab}@font-face{font-display:swap;font-family:Manrope;font-style:normal;font-weight:400 700;src:url(/dist/web/assets/manrope-4qdASHmp.woff2) format("woff2");unicode-range:U+0100-02af,U+0304,U+0308,U+0329,U+1e00-1e9f,U+1ef2-1eff,U+2020,U+20a0-20ab,U+20ad-20cf,U+2113,U+2c60-2c7f,U+a720-a7ff}@font-face{font-display:swap;font-family:Manrope;font-style:normal;font-weight:400 700;src:url(/dist/web/assets/manrope-4qdASHmp.woff2) format("woff2");unicode-range:U+00??,U+0131,U+0152-0153,U+02bb-02bc,U+02c6,U+02da,U+02dc,U+0304,U+0308,U+0329,U+2000-206f,U+2074,U+20ac,U+2122,U+2191,U+2193,U+2212,U+2215,U+feff,U+fffd}@keyframes ticker-scroll{0%{transform:translate(0)}to{transform:translate(-50%)}}@supports (-moz-appearance:none){.moz\:hidden{display:none!important}.moz\:block{display:block!important}}
/* assets/index-D0StjUy9.css */
@keyframes _bblFadInOut_10462_1{0%,80%,to{box-shadow:0 2.5em 0 -1.3em}40%{box-shadow:0 2.5em}}@font-face{font-display:swap;font-family:Manrope;font-style:normal;font-weight:400 700;src:url(/dist/web/assets/manrope-4qdASHmp.woff2) format("woff2");unicode-range:U+0301,U+0400-045f,U+0490-0491,U+04b0-04b1,U+2116}@font-face{font-display:swap;font-family:Manrope;font-style:normal;font-weight:400 700;src:url(/dist/web/assets/manrope-4qdASHmp.woff2) format("woff2");unicode-range:U+0102-0103,U+0110-0111,U+0128-0129,U+0168-0169,U+01a0-01a1,U+01af-01b0,U+0300-0301,U+0303-0304,U+0308-0309,U+0323,U+0329,U+1ea0-1ef9,U+20ab}@font-face{font-display:swap;font-family:Manrope;font-style:normal;font-weight:400 700;src:url(/dist/web/assets/manrope-4qdASHmp.woff2) format("woff2");unicode-range:U+0100-02af,U+0304,U+0308,U+0329,U+1e00-1e9f,U+1ef2-1eff,U+2020,U+20a0-20ab,U+20ad-20cf,U+2113,U+2c60-2c7f,U+a720-a7ff}@font-face{font-display:swap;font-family:Manrope;font-style:normal;font-weight:400 700;src:url(/dist/web/assets/manrope-4qdASHmp.woff2) format("woff2");unicode-range:U+00??,U+0131,U+0152-0153,U+02bb-02bc,U+02c6,U+02da,U+02dc,U+0304,U+0308,U+0329,U+2000-206f,U+2074,U+20ac,U+2122,U+2191,U+2193,U+2212,U+2215,U+feff,U+fffd}
/* assets/index-D5fCEgd-.css */
body { word-wrap: break-word;--tw-bg-opacity: 1;--tw-text-opacity: 1;background-color: rgba(255,255,255,var(--tw-bg-opacity));color: rgba(51,51,51,var(--tw-text-opacity));font-family: Manrope,system-ui,-apple-system,Segoe UI,Roboto,Ubuntu,Cantarell,Noto Sans,sans-serif;font-size: 16px;font-weight: 400;line-height: 26px;margin: 0;min-height: 100vh;min-width: 20rem;padding: 0; }@keyframes _bblFadInOut_10462_1{0%,80%,to{box-shadow:0 2.5em 0 -1.3em}40%{box-shadow:0 2.5em}}@font-face{font-display:swap;font-family:Manrope;font-style:normal;font-weight:400 700;src:url(/dist/web/assets/manrope-4qdASHmp.woff2) format("woff2");unicode-range:U+0301,U+0400-045f,U+0490-0491,U+04b0-04b1,U+2116}@font-face{font-display:swap;font-family:Manrope;font-style:normal;font-weight:400 700;src:url(/dist/web/assets/manrope-4qdASHmp.woff2) format("woff2");unicode-range:U+0102-0103,U+0110-0111,U+0128-0129,U+0168-0169,U+01a0-01a1,U+01af-01b0,U+0300-0301,U+0303-0304,U+0308-0309,U+0323,U+0329,U+1ea0-1ef9,U+20ab}@font-face{font-display:swap;font-family:Manrope;font-style:normal;font-weight:400 700;src:url(/dist/web/assets/manrope-4qdASHmp.woff2) format("woff2");unicode-range:U+0100-02af,U+0304,U+0308,U+0329,U+1e00-1e9f,U+1ef2-1eff,U+2020,U+20a0-20ab,U+20ad-20cf,U+2113,U+2c60-2c7f,U+a720-a7ff}@font-face{font-display:swap;font-family:Manrope;font-style:normal;font-weight:400 700;src:url(/dist/web/assets/manrope-4qdASHmp.woff2) format("woff2");unicode-range:U+00??,U+0131,U+0152-0153,U+02bb-02bc,U+02c6,U+02da,U+02dc,U+0304,U+0308,U+0329,U+2000-206f,U+2074,U+20ac,U+2122,U+2191,U+2193,U+2212,U+2215,U+feff,U+fffd}
/* assets/index-D7aJhLWE.css */
@keyframes _bblFadInOut_10462_1{0%,80%,to{box-shadow:0 2.5em 0 -1.3em}40%{box-shadow:0 2.5em}}@font-face{font-display:swap;font-family:Manrope;font-style:normal;font-weight:400 700;src:url(/dist/web/assets/manrope-4qdASHmp.woff2) format("woff2");unicode-range:U+0301,U+0400-045f,U+0490-0491,U+04b0-04b1,U+2116}@font-face{font-display:swap;font-family:Manrope;font-style:normal;font-weight:400 700;src:url(/dist/web/assets/manrope-4qdASHmp.woff2) format("woff2");unicode-range:U+0102-0103,U+0110-0111,U+0128-0129,U+0168-0169,U+01a0-01a1,U+01af-01b0,U+0300-0301,U+0303-0304,U+0308-0309,U+0323,U+0329,U+1ea0-1ef9,U+20ab}@font-face{font-display:swap;font-family:Manrope;font-style:normal;font-weight:400 700;src:url(/dist/web/assets/manrope-4qdASHmp.woff2) format("woff2");unicode-range:U+0100-02af,U+0304,U+0308,U+0329,U+1e00-1e9f,U+1ef2-1eff,U+2020,U+20a0-20ab,U+20ad-20cf,U+2113,U+2c60-2c7f,U+a720-a7ff}@font-face{font-display:swap;font-family:Manrope;font-style:normal;font-weight:400 700;src:url(/dist/web/assets/manrope-4qdASHmp.woff2) format("woff2");unicode-range:U+00??,U+0131,U+0152-0153,U+02bb-02bc,U+02c6,U+02da,U+02dc,U+0304,U+0308,U+0329,U+2000-206f,U+2074,U+20ac,U+2122,U+2191,U+2193,U+2212,U+2215,U+feff,U+fffd}@keyframes ticker-scroll{0%{transform:translate(0)}to{transform:translate(-50%)}}@supports (-moz-appearance:none){.moz\:hidden{display:none!important}.moz\:block{display:block!important}}
/* assets/index-DBI8FLQ5.css */
@keyframes _bblFadInOut_10462_1{0%,80%,to{box-shadow:0 2.5em 0 -1.3em}40%{box-shadow:0 2.5em}}@font-face{font-display:swap;font-family:Manrope;font-style:normal;font-weight:400 700;src:url(/dist/web/assets/manrope-4qdASHmp.woff2) format("woff2");unicode-range:U+0301,U+0400-045f,U+0490-0491,U+04b0-04b1,U+2116}@font-face{font-display:swap;font-family:Manrope;font-style:normal;font-weight:400 700;src:url(/dist/web/assets/manrope-4qdASHmp.woff2) format("woff2");unicode-range:U+0102-0103,U+0110-0111,U+0128-0129,U+0168-0169,U+01a0-01a1,U+01af-01b0,U+0300-0301,U+0303-0304,U+0308-0309,U+0323,U+0329,U+1ea0-1ef9,U+20ab}@font-face{font-display:swap;font-family:Manrope;font-style:normal;font-weight:400 700;src:url(/dist/web/assets/manrope-4qdASHmp.woff2) format("woff2");unicode-range:U+0100-02af,U+0304,U+0308,U+0329,U+1e00-1e9f,U+1ef2-1eff,U+2020,U+20a0-20ab,U+20ad-20cf,U+2113,U+2c60-2c7f,U+a720-a7ff}@font-face{font-display:swap;font-family:Manrope;font-style:normal;font-weight:400 700;src:url(/dist/web/assets/manrope-4qdASHmp.woff2) format("woff2");unicode-range:U+00??,U+0131,U+0152-0153,U+02bb-02bc,U+02c6,U+02da,U+02dc,U+0304,U+0308,U+0329,U+2000-206f,U+2074,U+20ac,U+2122,U+2191,U+2193,U+2212,U+2215,U+feff,U+fffd}
/* assets/index-DBr0pQ9G.css */
@keyframes _bblFadInOut_10462_1{0%,80%,to{box-shadow:0 2.5em 0 -1.3em}40%{box-shadow:0 2.5em}}@font-face{font-display:swap;font-family:Manrope;font-style:normal;font-weight:400 700;src:url(/dist/web/assets/manrope-4qdASHmp.woff2) format("woff2");unicode-range:U+0301,U+0400-045f,U+0490-0491,U+04b0-04b1,U+2116}@font-face{font-display:swap;font-family:Manrope;font-style:normal;font-weight:400 700;src:url(/dist/web/assets/manrope-4qdASHmp.woff2) format("woff2");unicode-range:U+0102-0103,U+0110-0111,U+0128-0129,U+0168-0169,U+01a0-01a1,U+01af-01b0,U+0300-0301,U+0303-0304,U+0308-0309,U+0323,U+0329,U+1ea0-1ef9,U+20ab}@font-face{font-display:swap;font-family:Manrope;font-style:normal;font-weight:400 700;src:url(/dist/web/assets/manrope-4qdASHmp.woff2) format("woff2");unicode-range:U+0100-02af,U+0304,U+0308,U+0329,U+1e00-1e9f,U+1ef2-1eff,U+2020,U+20a0-20ab,U+20ad-20cf,U+2113,U+2c60-2c7f,U+a720-a7ff}@font-face{font-display:swap;font-family:Manrope;font-style:normal;font-weight:400 700;src:url(/dist/web/assets/manrope-4qdASHmp.woff2) format("woff2");unicode-range:U+00??,U+0131,U+0152-0153,U+02bb-02bc,U+02c6,U+02da,U+02dc,U+0304,U+0308,U+0329,U+2000-206f,U+2074,U+20ac,U+2122,U+2191,U+2193,U+2212,U+2215,U+feff,U+fffd}@keyframes ticker-scroll{0%{transform:translate(0)}to{transform:translate(-50%)}}@supports (-moz-appearance:none){.moz\:hidden{display:none!important}.moz\:block{display:block!important}}
/* assets/index-DBxkXMX_.css */
@keyframes _bblFadInOut_10462_1{0%,80%,to{box-shadow:0 2.5em 0 -1.3em}40%{box-shadow:0 2.5em}}@font-face{font-display:swap;font-family:Manrope;font-style:normal;font-weight:400 700;src:url(/dist/web/assets/manrope-4qdASHmp.woff2) format("woff2");unicode-range:U+0301,U+0400-045f,U+0490-0491,U+04b0-04b1,U+2116}@font-face{font-display:swap;font-family:Manrope;font-style:normal;font-weight:400 700;src:url(/dist/web/assets/manrope-4qdASHmp.woff2) format("woff2");unicode-range:U+0102-0103,U+0110-0111,U+0128-0129,U+0168-0169,U+01a0-01a1,U+01af-01b0,U+0300-0301,U+0303-0304,U+0308-0309,U+0323,U+0329,U+1ea0-1ef9,U+20ab}@font-face{font-display:swap;font-family:Manrope;font-style:normal;font-weight:400 700;src:url(/dist/web/assets/manrope-4qdASHmp.woff2) format("woff2");unicode-range:U+0100-02af,U+0304,U+0308,U+0329,U+1e00-1e9f,U+1ef2-1eff,U+2020,U+20a0-20ab,U+20ad-20cf,U+2113,U+2c60-2c7f,U+a720-a7ff}@font-face{font-display:swap;font-family:Manrope;font-style:normal;font-weight:400 700;src:url(/dist/web/assets/manrope-4qdASHmp.woff2) format("woff2");unicode-range:U+00??,U+0131,U+0152-0153,U+02bb-02bc,U+02c6,U+02da,U+02dc,U+0304,U+0308,U+0329,U+2000-206f,U+2074,U+20ac,U+2122,U+2191,U+2193,U+2212,U+2215,U+feff,U+fffd}
/* assets/index-DF_UKH3p.css */
@keyframes _bblFadInOut_10462_1{0%,80%,to{box-shadow:0 2.5em 0 -1.3em}40%{box-shadow:0 2.5em}}@font-face{font-display:swap;font-family:Manrope;font-style:normal;font-weight:400 700;src:url(/dist/web/assets/manrope-4qdASHmp.woff2) format("woff2");unicode-range:U+0301,U+0400-045f,U+0490-0491,U+04b0-04b1,U+2116}@font-face{font-display:swap;font-family:Manrope;font-style:normal;font-weight:400 700;src:url(/dist/web/assets/manrope-4qdASHmp.woff2) format("woff2");unicode-range:U+0102-0103,U+0110-0111,U+0128-0129,U+0168-0169,U+01a0-01a1,U+01af-01b0,U+0300-0301,U+0303-0304,U+0308-0309,U+0323,U+0329,U+1ea0-1ef9,U+20ab}@font-face{font-display:swap;font-family:Manrope;font-style:normal;font-weight:400 700;src:url(/dist/web/assets/manrope-4qdASHmp.woff2) format("woff2");unicode-range:U+0100-02af,U+0304,U+0308,U+0329,U+1e00-1e9f,U+1ef2-1eff,U+2020,U+20a0-20ab,U+20ad-20cf,U+2113,U+2c60-2c7f,U+a720-a7ff}@font-face{font-display:swap;font-family:Manrope;font-style:normal;font-weight:400 700;src:url(/dist/web/assets/manrope-4qdASHmp.woff2) format("woff2");unicode-range:U+00??,U+0131,U+0152-0153,U+02bb-02bc,U+02c6,U+02da,U+02dc,U+0304,U+0308,U+0329,U+2000-206f,U+2074,U+20ac,U+2122,U+2191,U+2193,U+2212,U+2215,U+feff,U+fffd}
/* assets/index-DI33FrZX.css */
@keyframes _bblFadInOut_10462_1{0%,80%,to{box-shadow:0 2.5em 0 -1.3em}40%{box-shadow:0 2.5em}}@font-face{font-display:swap;font-family:Manrope;font-style:normal;font-weight:400 700;src:url(/dist/web/assets/manrope-4qdASHmp.woff2) format("woff2");unicode-range:U+0301,U+0400-045f,U+0490-0491,U+04b0-04b1,U+2116}@font-face{font-display:swap;font-family:Manrope;font-style:normal;font-weight:400 700;src:url(/dist/web/assets/manrope-4qdASHmp.woff2) format("woff2");unicode-range:U+0102-0103,U+0110-0111,U+0128-0129,U+0168-0169,U+01a0-01a1,U+01af-01b0,U+0300-0301,U+0303-0304,U+0308-0309,U+0323,U+0329,U+1ea0-1ef9,U+20ab}@font-face{font-display:swap;font-family:Manrope;font-style:normal;font-weight:400 700;src:url(/dist/web/assets/manrope-4qdASHmp.woff2) format("woff2");unicode-range:U+0100-02af,U+0304,U+0308,U+0329,U+1e00-1e9f,U+1ef2-1eff,U+2020,U+20a0-20ab,U+20ad-20cf,U+2113,U+2c60-2c7f,U+a720-a7ff}@font-face{font-display:swap;font-family:Manrope;font-style:normal;font-weight:400 700;src:url(/dist/web/assets/manrope-4qdASHmp.woff2) format("woff2");unicode-range:U+00??,U+0131,U+0152-0153,U+02bb-02bc,U+02c6,U+02da,U+02dc,U+0304,U+0308,U+0329,U+2000-206f,U+2074,U+20ac,U+2122,U+2191,U+2193,U+2212,U+2215,U+feff,U+fffd}@supports (-moz-appearance:none){.moz\:hidden{display:none!important}.moz\:block{display:block!important}}
/* assets/index-DM4PBttb.css */
@font-face{font-display:swap;font-family:Manrope;font-style:normal;font-weight:400 700;src:url(/dist/web/assets/manrope-4qdASHmp.woff2) format("woff2");unicode-range:U+0301,U+0400-045f,U+0490-0491,U+04b0-04b1,U+2116}@font-face{font-display:swap;font-family:Manrope;font-style:normal;font-weight:400 700;src:url(/dist/web/assets/manrope-4qdASHmp.woff2) format("woff2");unicode-range:U+0102-0103,U+0110-0111,U+0128-0129,U+0168-0169,U+01a0-01a1,U+01af-01b0,U+0300-0301,U+0303-0304,U+0308-0309,U+0323,U+0329,U+1ea0-1ef9,U+20ab}@font-face{font-display:swap;font-family:Manrope;font-style:normal;font-weight:400 700;src:url(/dist/web/assets/manrope-4qdASHmp.woff2) format("woff2");unicode-range:U+0100-02af,U+0304,U+0308,U+0329,U+1e00-1e9f,U+1ef2-1eff,U+2020,U+20a0-20ab,U+20ad-20cf,U+2113,U+2c60-2c7f,U+a720-a7ff}@font-face{font-display:swap;font-family:Manrope;font-style:normal;font-weight:400 700;src:url(/dist/web/assets/manrope-4qdASHmp.woff2) format("woff2");unicode-range:U+00??,U+0131,U+0152-0153,U+02bb-02bc,U+02c6,U+02da,U+02dc,U+0304,U+0308,U+0329,U+2000-206f,U+2074,U+20ac,U+2122,U+2191,U+2193,U+2212,U+2215,U+feff,U+fffd}@keyframes _bblFadInOut_10462_1{0%,80%,to{box-shadow:0 2.5em 0 -1.3em}40%{box-shadow:0 2.5em}}
/* assets/index-DNzKTe3K.css */
@keyframes _bblFadInOut_10462_1{0%,80%,to{box-shadow:0 2.5em 0 -1.3em}40%{box-shadow:0 2.5em}}@font-face{font-display:swap;font-family:Manrope;font-style:normal;font-weight:400 700;src:url(/dist/web/assets/manrope-4qdASHmp.woff2) format("woff2");unicode-range:U+0301,U+0400-045f,U+0490-0491,U+04b0-04b1,U+2116}@font-face{font-display:swap;font-family:Manrope;font-style:normal;font-weight:400 700;src:url(/dist/web/assets/manrope-4qdASHmp.woff2) format("woff2");unicode-range:U+0102-0103,U+0110-0111,U+0128-0129,U+0168-0169,U+01a0-01a1,U+01af-01b0,U+0300-0301,U+0303-0304,U+0308-0309,U+0323,U+0329,U+1ea0-1ef9,U+20ab}@font-face{font-display:swap;font-family:Manrope;font-style:normal;font-weight:400 700;src:url(/dist/web/assets/manrope-4qdASHmp.woff2) format("woff2");unicode-range:U+0100-02af,U+0304,U+0308,U+0329,U+1e00-1e9f,U+1ef2-1eff,U+2020,U+20a0-20ab,U+20ad-20cf,U+2113,U+2c60-2c7f,U+a720-a7ff}@font-face{font-display:swap;font-family:Manrope;font-style:normal;font-weight:400 700;src:url(/dist/web/assets/manrope-4qdASHmp.woff2) format("woff2");unicode-range:U+00??,U+0131,U+0152-0153,U+02bb-02bc,U+02c6,U+02da,U+02dc,U+0304,U+0308,U+0329,U+2000-206f,U+2074,U+20ac,U+2122,U+2191,U+2193,U+2212,U+2215,U+feff,U+fffd}
/* assets/index-DOizIgT7.css */
@keyframes _bblFadInOut_10462_1{0%,80%,to{box-shadow:0 2.5em 0 -1.3em}40%{box-shadow:0 2.5em}}@font-face{font-display:swap;font-family:Manrope;font-style:normal;font-weight:400 700;src:url(/dist/web/assets/manrope-4qdASHmp.woff2) format("woff2");unicode-range:U+0301,U+0400-045f,U+0490-0491,U+04b0-04b1,U+2116}@font-face{font-display:swap;font-family:Manrope;font-style:normal;font-weight:400 700;src:url(/dist/web/assets/manrope-4qdASHmp.woff2) format("woff2");unicode-range:U+0102-0103,U+0110-0111,U+0128-0129,U+0168-0169,U+01a0-01a1,U+01af-01b0,U+0300-0301,U+0303-0304,U+0308-0309,U+0323,U+0329,U+1ea0-1ef9,U+20ab}@font-face{font-display:swap;font-family:Manrope;font-style:normal;font-weight:400 700;src:url(/dist/web/assets/manrope-4qdASHmp.woff2) format("woff2");unicode-range:U+0100-02af,U+0304,U+0308,U+0329,U+1e00-1e9f,U+1ef2-1eff,U+2020,U+20a0-20ab,U+20ad-20cf,U+2113,U+2c60-2c7f,U+a720-a7ff}@font-face{font-display:swap;font-family:Manrope;font-style:normal;font-weight:400 700;src:url(/dist/web/assets/manrope-4qdASHmp.woff2) format("woff2");unicode-range:U+00??,U+0131,U+0152-0153,U+02bb-02bc,U+02c6,U+02da,U+02dc,U+0304,U+0308,U+0329,U+2000-206f,U+2074,U+20ac,U+2122,U+2191,U+2193,U+2212,U+2215,U+feff,U+fffd}
/* assets/index-DQs0k2s9.css */
@keyframes _bblFadInOut_10462_1{0%,80%,to{box-shadow:0 2.5em 0 -1.3em}40%{box-shadow:0 2.5em}}@font-face{font-display:swap;font-family:Manrope;font-style:normal;font-weight:400 700;src:url(/dist/web/assets/manrope-4qdASHmp.woff2) format("woff2");unicode-range:U+0301,U+0400-045f,U+0490-0491,U+04b0-04b1,U+2116}@font-face{font-display:swap;font-family:Manrope;font-style:normal;font-weight:400 700;src:url(/dist/web/assets/manrope-4qdASHmp.woff2) format("woff2");unicode-range:U+0102-0103,U+0110-0111,U+0128-0129,U+0168-0169,U+01a0-01a1,U+01af-01b0,U+0300-0301,U+0303-0304,U+0308-0309,U+0323,U+0329,U+1ea0-1ef9,U+20ab}@font-face{font-display:swap;font-family:Manrope;font-style:normal;font-weight:400 700;src:url(/dist/web/assets/manrope-4qdASHmp.woff2) format("woff2");unicode-range:U+0100-02af,U+0304,U+0308,U+0329,U+1e00-1e9f,U+1ef2-1eff,U+2020,U+20a0-20ab,U+20ad-20cf,U+2113,U+2c60-2c7f,U+a720-a7ff}@font-face{font-display:swap;font-family:Manrope;font-style:normal;font-weight:400 700;src:url(/dist/web/assets/manrope-4qdASHmp.woff2) format("woff2");unicode-range:U+00??,U+0131,U+0152-0153,U+02bb-02bc,U+02c6,U+02da,U+02dc,U+0304,U+0308,U+0329,U+2000-206f,U+2074,U+20ac,U+2122,U+2191,U+2193,U+2212,U+2215,U+feff,U+fffd}
/* assets/index-DY9Z0mnx.css */
@keyframes _bblFadInOut_10462_1{0%,80%,to{box-shadow:0 2.5em 0 -1.3em}40%{box-shadow:0 2.5em}}@font-face{font-display:swap;font-family:Manrope;font-style:normal;font-weight:400 700;src:url(/dist/web/assets/manrope-4qdASHmp.woff2) format("woff2");unicode-range:U+0301,U+0400-045f,U+0490-0491,U+04b0-04b1,U+2116}@font-face{font-display:swap;font-family:Manrope;font-style:normal;font-weight:400 700;src:url(/dist/web/assets/manrope-4qdASHmp.woff2) format("woff2");unicode-range:U+0102-0103,U+0110-0111,U+0128-0129,U+0168-0169,U+01a0-01a1,U+01af-01b0,U+0300-0301,U+0303-0304,U+0308-0309,U+0323,U+0329,U+1ea0-1ef9,U+20ab}@font-face{font-display:swap;font-family:Manrope;font-style:normal;font-weight:400 700;src:url(/dist/web/assets/manrope-4qdASHmp.woff2) format("woff2");unicode-range:U+0100-02af,U+0304,U+0308,U+0329,U+1e00-1e9f,U+1ef2-1eff,U+2020,U+20a0-20ab,U+20ad-20cf,U+2113,U+2c60-2c7f,U+a720-a7ff}@font-face{font-display:swap;font-family:Manrope;font-style:normal;font-weight:400 700;src:url(/dist/web/assets/manrope-4qdASHmp.woff2) format("woff2");unicode-range:U+00??,U+0131,U+0152-0153,U+02bb-02bc,U+02c6,U+02da,U+02dc,U+0304,U+0308,U+0329,U+2000-206f,U+2074,U+20ac,U+2122,U+2191,U+2193,U+2212,U+2215,U+feff,U+fffd}
/* assets/index-DdFFhobj.css */
@keyframes _bblFadInOut_10462_1{0%,80%,to{box-shadow:0 2.5em 0 -1.3em}40%{box-shadow:0 2.5em}}@font-face{font-display:swap;font-family:Manrope;font-style:normal;font-weight:400 700;src:url(/dist/web/assets/manrope-4qdASHmp.woff2) format("woff2");unicode-range:U+0301,U+0400-045f,U+0490-0491,U+04b0-04b1,U+2116}@font-face{font-display:swap;font-family:Manrope;font-style:normal;font-weight:400 700;src:url(/dist/web/assets/manrope-4qdASHmp.woff2) format("woff2");unicode-range:U+0102-0103,U+0110-0111,U+0128-0129,U+0168-0169,U+01a0-01a1,U+01af-01b0,U+0300-0301,U+0303-0304,U+0308-0309,U+0323,U+0329,U+1ea0-1ef9,U+20ab}@font-face{font-display:swap;font-family:Manrope;font-style:normal;font-weight:400 700;src:url(/dist/web/assets/manrope-4qdASHmp.woff2) format("woff2");unicode-range:U+0100-02af,U+0304,U+0308,U+0329,U+1e00-1e9f,U+1ef2-1eff,U+2020,U+20a0-20ab,U+20ad-20cf,U+2113,U+2c60-2c7f,U+a720-a7ff}@font-face{font-display:swap;font-family:Manrope;font-style:normal;font-weight:400 700;src:url(/dist/web/assets/manrope-4qdASHmp.woff2) format("woff2");unicode-range:U+00??,U+0131,U+0152-0153,U+02bb-02bc,U+02c6,U+02da,U+02dc,U+0304,U+0308,U+0329,U+2000-206f,U+2074,U+20ac,U+2122,U+2191,U+2193,U+2212,U+2215,U+feff,U+fffd}
/* assets/index-DhfVs5KY.css */
@keyframes _bblFadInOut_10462_1{0%,80%,to{box-shadow:0 2.5em 0 -1.3em}40%{box-shadow:0 2.5em}}@font-face{font-display:swap;font-family:Manrope;font-style:normal;font-weight:400 700;src:url(/dist/web/assets/manrope-4qdASHmp.woff2) format("woff2");unicode-range:U+0301,U+0400-045f,U+0490-0491,U+04b0-04b1,U+2116}@font-face{font-display:swap;font-family:Manrope;font-style:normal;font-weight:400 700;src:url(/dist/web/assets/manrope-4qdASHmp.woff2) format("woff2");unicode-range:U+0102-0103,U+0110-0111,U+0128-0129,U+0168-0169,U+01a0-01a1,U+01af-01b0,U+0300-0301,U+0303-0304,U+0308-0309,U+0323,U+0329,U+1ea0-1ef9,U+20ab}@font-face{font-display:swap;font-family:Manrope;font-style:normal;font-weight:400 700;src:url(/dist/web/assets/manrope-4qdASHmp.woff2) format("woff2");unicode-range:U+0100-02af,U+0304,U+0308,U+0329,U+1e00-1e9f,U+1ef2-1eff,U+2020,U+20a0-20ab,U+20ad-20cf,U+2113,U+2c60-2c7f,U+a720-a7ff}@font-face{font-display:swap;font-family:Manrope;font-style:normal;font-weight:400 700;src:url(/dist/web/assets/manrope-4qdASHmp.woff2) format("woff2");unicode-range:U+00??,U+0131,U+0152-0153,U+02bb-02bc,U+02c6,U+02da,U+02dc,U+0304,U+0308,U+0329,U+2000-206f,U+2074,U+20ac,U+2122,U+2191,U+2193,U+2212,U+2215,U+feff,U+fffd}@supports (-moz-appearance:none){.moz\:hidden{display:none!important}.moz\:block{display:block!important}}
/* assets/index-DmUiVjWR.css */
@keyframes _bblFadInOut_10462_1{0%,80%,to{box-shadow:0 2.5em 0 -1.3em}40%{box-shadow:0 2.5em}}@font-face{font-display:swap;font-family:Manrope;font-style:normal;font-weight:400 700;src:url(/dist/web/assets/manrope-4qdASHmp.woff2) format("woff2");unicode-range:U+0301,U+0400-045f,U+0490-0491,U+04b0-04b1,U+2116}@font-face{font-display:swap;font-family:Manrope;font-style:normal;font-weight:400 700;src:url(/dist/web/assets/manrope-4qdASHmp.woff2) format("woff2");unicode-range:U+0102-0103,U+0110-0111,U+0128-0129,U+0168-0169,U+01a0-01a1,U+01af-01b0,U+0300-0301,U+0303-0304,U+0308-0309,U+0323,U+0329,U+1ea0-1ef9,U+20ab}@font-face{font-display:swap;font-family:Manrope;font-style:normal;font-weight:400 700;src:url(/dist/web/assets/manrope-4qdASHmp.woff2) format("woff2");unicode-range:U+0100-02af,U+0304,U+0308,U+0329,U+1e00-1e9f,U+1ef2-1eff,U+2020,U+20a0-20ab,U+20ad-20cf,U+2113,U+2c60-2c7f,U+a720-a7ff}@font-face{font-display:swap;font-family:Manrope;font-style:normal;font-weight:400 700;src:url(/dist/web/assets/manrope-4qdASHmp.woff2) format("woff2");unicode-range:U+00??,U+0131,U+0152-0153,U+02bb-02bc,U+02c6,U+02da,U+02dc,U+0304,U+0308,U+0329,U+2000-206f,U+2074,U+20ac,U+2122,U+2191,U+2193,U+2212,U+2215,U+feff,U+fffd}@keyframes ticker-scroll{0%{transform:translate(0)}to{transform:translate(-50%)}}@supports (-moz-appearance:none){.moz\:hidden{display:none!important}.moz\:block{display:block!important}}
/* assets/index-DnRgEPwd.css */
@keyframes _bblFadInOut_10462_1{0%,80%,to{box-shadow:0 2.5em 0 -1.3em}40%{box-shadow:0 2.5em}}@font-face{font-display:swap;font-family:Manrope;font-style:normal;font-weight:400 700;src:url(/dist/web/assets/manrope-4qdASHmp.woff2) format("woff2");unicode-range:U+0301,U+0400-045f,U+0490-0491,U+04b0-04b1,U+2116}@font-face{font-display:swap;font-family:Manrope;font-style:normal;font-weight:400 700;src:url(/dist/web/assets/manrope-4qdASHmp.woff2) format("woff2");unicode-range:U+0102-0103,U+0110-0111,U+0128-0129,U+0168-0169,U+01a0-01a1,U+01af-01b0,U+0300-0301,U+0303-0304,U+0308-0309,U+0323,U+0329,U+1ea0-1ef9,U+20ab}@font-face{font-display:swap;font-family:Manrope;font-style:normal;font-weight:400 700;src:url(/dist/web/assets/manrope-4qdASHmp.woff2) format("woff2");unicode-range:U+0100-02af,U+0304,U+0308,U+0329,U+1e00-1e9f,U+1ef2-1eff,U+2020,U+20a0-20ab,U+20ad-20cf,U+2113,U+2c60-2c7f,U+a720-a7ff}@font-face{font-display:swap;font-family:Manrope;font-style:normal;font-weight:400 700;src:url(/dist/web/assets/manrope-4qdASHmp.woff2) format("woff2");unicode-range:U+00??,U+0131,U+0152-0153,U+02bb-02bc,U+02c6,U+02da,U+02dc,U+0304,U+0308,U+0329,U+2000-206f,U+2074,U+20ac,U+2122,U+2191,U+2193,U+2212,U+2215,U+feff,U+fffd}@keyframes ticker-scroll{0%{transform:translate(0)}to{transform:translate(-50%)}}@supports (-moz-appearance:none){.moz\:hidden{display:none!important}.moz\:block{display:block!important}}
/* assets/index-DnuGABcB.css */
@keyframes _bblFadInOut_10462_1{0%,80%,to{box-shadow:0 2.5em 0 -1.3em}40%{box-shadow:0 2.5em}}@font-face{font-display:swap;font-family:Manrope;font-style:normal;font-weight:400 700;src:url(/dist/web/assets/manrope-4qdASHmp.woff2) format("woff2");unicode-range:U+0301,U+0400-045f,U+0490-0491,U+04b0-04b1,U+2116}@font-face{font-display:swap;font-family:Manrope;font-style:normal;font-weight:400 700;src:url(/dist/web/assets/manrope-4qdASHmp.woff2) format("woff2");unicode-range:U+0102-0103,U+0110-0111,U+0128-0129,U+0168-0169,U+01a0-01a1,U+01af-01b0,U+0300-0301,U+0303-0304,U+0308-0309,U+0323,U+0329,U+1ea0-1ef9,U+20ab}@font-face{font-display:swap;font-family:Manrope;font-style:normal;font-weight:400 700;src:url(/dist/web/assets/manrope-4qdASHmp.woff2) format("woff2");unicode-range:U+0100-02af,U+0304,U+0308,U+0329,U+1e00-1e9f,U+1ef2-1eff,U+2020,U+20a0-20ab,U+20ad-20cf,U+2113,U+2c60-2c7f,U+a720-a7ff}@font-face{font-display:swap;font-family:Manrope;font-style:normal;font-weight:400 700;src:url(/dist/web/assets/manrope-4qdASHmp.woff2) format("woff2");unicode-range:U+00??,U+0131,U+0152-0153,U+02bb-02bc,U+02c6,U+02da,U+02dc,U+0304,U+0308,U+0329,U+2000-206f,U+2074,U+20ac,U+2122,U+2191,U+2193,U+2212,U+2215,U+feff,U+fffd}@supports (-moz-appearance:none){.moz\:hidden{display:none!important}.moz\:block{display:block!important}}
/* assets/index-Dr9kD5Xg.css */
@keyframes _bblFadInOut_10462_1{0%,80%,to{box-shadow:0 2.5em 0 -1.3em}40%{box-shadow:0 2.5em}}@font-face{font-display:swap;font-family:Manrope;font-style:normal;font-weight:400 700;src:url(/dist/web/assets/manrope-4qdASHmp.woff2) format("woff2");unicode-range:U+0301,U+0400-045f,U+0490-0491,U+04b0-04b1,U+2116}@font-face{font-display:swap;font-family:Manrope;font-style:normal;font-weight:400 700;src:url(/dist/web/assets/manrope-4qdASHmp.woff2) format("woff2");unicode-range:U+0102-0103,U+0110-0111,U+0128-0129,U+0168-0169,U+01a0-01a1,U+01af-01b0,U+0300-0301,U+0303-0304,U+0308-0309,U+0323,U+0329,U+1ea0-1ef9,U+20ab}@font-face{font-display:swap;font-family:Manrope;font-style:normal;font-weight:400 700;src:url(/dist/web/assets/manrope-4qdASHmp.woff2) format("woff2");unicode-range:U+0100-02af,U+0304,U+0308,U+0329,U+1e00-1e9f,U+1ef2-1eff,U+2020,U+20a0-20ab,U+20ad-20cf,U+2113,U+2c60-2c7f,U+a720-a7ff}@font-face{font-display:swap;font-family:Manrope;font-style:normal;font-weight:400 700;src:url(/dist/web/assets/manrope-4qdASHmp.woff2) format("woff2");unicode-range:U+00??,U+0131,U+0152-0153,U+02bb-02bc,U+02c6,U+02da,U+02dc,U+0304,U+0308,U+0329,U+2000-206f,U+2074,U+20ac,U+2122,U+2191,U+2193,U+2212,U+2215,U+feff,U+fffd}
/* assets/index-Ds1vV4oM.css */
@keyframes _bblFadInOut_10462_1{0%,80%,to{box-shadow:0 2.5em 0 -1.3em}40%{box-shadow:0 2.5em}}@font-face{font-display:swap;font-family:Manrope;font-style:normal;font-weight:400 700;src:url(/dist/web/assets/manrope-4qdASHmp.woff2) format("woff2");unicode-range:U+0301,U+0400-045f,U+0490-0491,U+04b0-04b1,U+2116}@font-face{font-display:swap;font-family:Manrope;font-style:normal;font-weight:400 700;src:url(/dist/web/assets/manrope-4qdASHmp.woff2) format("woff2");unicode-range:U+0102-0103,U+0110-0111,U+0128-0129,U+0168-0169,U+01a0-01a1,U+01af-01b0,U+0300-0301,U+0303-0304,U+0308-0309,U+0323,U+0329,U+1ea0-1ef9,U+20ab}@font-face{font-display:swap;font-family:Manrope;font-style:normal;font-weight:400 700;src:url(/dist/web/assets/manrope-4qdASHmp.woff2) format("woff2");unicode-range:U+0100-02af,U+0304,U+0308,U+0329,U+1e00-1e9f,U+1ef2-1eff,U+2020,U+20a0-20ab,U+20ad-20cf,U+2113,U+2c60-2c7f,U+a720-a7ff}@font-face{font-display:swap;font-family:Manrope;font-style:normal;font-weight:400 700;src:url(/dist/web/assets/manrope-4qdASHmp.woff2) format("woff2");unicode-range:U+00??,U+0131,U+0152-0153,U+02bb-02bc,U+02c6,U+02da,U+02dc,U+0304,U+0308,U+0329,U+2000-206f,U+2074,U+20ac,U+2122,U+2191,U+2193,U+2212,U+2215,U+feff,U+fffd}
/* assets/index-Dwp7xsiS.css */
@keyframes _bblFadInOut_10462_1{0%,80%,to{box-shadow:0 2.5em 0 -1.3em}40%{box-shadow:0 2.5em}}@font-face{font-display:swap;font-family:Manrope;font-style:normal;font-weight:400 700;src:url(/dist/web/assets/manrope-4qdASHmp.woff2) format("woff2");unicode-range:U+0301,U+0400-045f,U+0490-0491,U+04b0-04b1,U+2116}@font-face{font-display:swap;font-family:Manrope;font-style:normal;font-weight:400 700;src:url(/dist/web/assets/manrope-4qdASHmp.woff2) format("woff2");unicode-range:U+0102-0103,U+0110-0111,U+0128-0129,U+0168-0169,U+01a0-01a1,U+01af-01b0,U+0300-0301,U+0303-0304,U+0308-0309,U+0323,U+0329,U+1ea0-1ef9,U+20ab}@font-face{font-display:swap;font-family:Manrope;font-style:normal;font-weight:400 700;src:url(/dist/web/assets/manrope-4qdASHmp.woff2) format("woff2");unicode-range:U+0100-02af,U+0304,U+0308,U+0329,U+1e00-1e9f,U+1ef2-1eff,U+2020,U+20a0-20ab,U+20ad-20cf,U+2113,U+2c60-2c7f,U+a720-a7ff}@font-face{font-display:swap;font-family:Manrope;font-style:normal;font-weight:400 700;src:url(/dist/web/assets/manrope-4qdASHmp.woff2) format("woff2");unicode-range:U+00??,U+0131,U+0152-0153,U+02bb-02bc,U+02c6,U+02da,U+02dc,U+0304,U+0308,U+0329,U+2000-206f,U+2074,U+20ac,U+2122,U+2191,U+2193,U+2212,U+2215,U+feff,U+fffd}
/* assets/index-DxOJwnYZ.css */
@keyframes _bblFadInOut_10462_1{0%,80%,to{box-shadow:0 2.5em 0 -1.3em}40%{box-shadow:0 2.5em}}@font-face{font-display:swap;font-family:Manrope;font-style:normal;font-weight:400 700;src:url(/dist/web/assets/manrope-4qdASHmp.woff2) format("woff2");unicode-range:U+0301,U+0400-045f,U+0490-0491,U+04b0-04b1,U+2116}@font-face{font-display:swap;font-family:Manrope;font-style:normal;font-weight:400 700;src:url(/dist/web/assets/manrope-4qdASHmp.woff2) format("woff2");unicode-range:U+0102-0103,U+0110-0111,U+0128-0129,U+0168-0169,U+01a0-01a1,U+01af-01b0,U+0300-0301,U+0303-0304,U+0308-0309,U+0323,U+0329,U+1ea0-1ef9,U+20ab}@font-face{font-display:swap;font-family:Manrope;font-style:normal;font-weight:400 700;src:url(/dist/web/assets/manrope-4qdASHmp.woff2) format("woff2");unicode-range:U+0100-02af,U+0304,U+0308,U+0329,U+1e00-1e9f,U+1ef2-1eff,U+2020,U+20a0-20ab,U+20ad-20cf,U+2113,U+2c60-2c7f,U+a720-a7ff}@font-face{font-display:swap;font-family:Manrope;font-style:normal;font-weight:400 700;src:url(/dist/web/assets/manrope-4qdASHmp.woff2) format("woff2");unicode-range:U+00??,U+0131,U+0152-0153,U+02bb-02bc,U+02c6,U+02da,U+02dc,U+0304,U+0308,U+0329,U+2000-206f,U+2074,U+20ac,U+2122,U+2191,U+2193,U+2212,U+2215,U+feff,U+fffd}
/* assets/index-Dyi8VjxG.css */
@keyframes _bblFadInOut_10462_1{0%,80%,to{box-shadow:0 2.5em 0 -1.3em}40%{box-shadow:0 2.5em}}@font-face{font-display:swap;font-family:Manrope;font-style:normal;font-weight:400 700;src:url(/dist/web/assets/manrope-4qdASHmp.woff2) format("woff2");unicode-range:U+0301,U+0400-045f,U+0490-0491,U+04b0-04b1,U+2116}@font-face{font-display:swap;font-family:Manrope;font-style:normal;font-weight:400 700;src:url(/dist/web/assets/manrope-4qdASHmp.woff2) format("woff2");unicode-range:U+0102-0103,U+0110-0111,U+0128-0129,U+0168-0169,U+01a0-01a1,U+01af-01b0,U+0300-0301,U+0303-0304,U+0308-0309,U+0323,U+0329,U+1ea0-1ef9,U+20ab}@font-face{font-display:swap;font-family:Manrope;font-style:normal;font-weight:400 700;src:url(/dist/web/assets/manrope-4qdASHmp.woff2) format("woff2");unicode-range:U+0100-02af,U+0304,U+0308,U+0329,U+1e00-1e9f,U+1ef2-1eff,U+2020,U+20a0-20ab,U+20ad-20cf,U+2113,U+2c60-2c7f,U+a720-a7ff}@font-face{font-display:swap;font-family:Manrope;font-style:normal;font-weight:400 700;src:url(/dist/web/assets/manrope-4qdASHmp.woff2) format("woff2");unicode-range:U+00??,U+0131,U+0152-0153,U+02bb-02bc,U+02c6,U+02da,U+02dc,U+0304,U+0308,U+0329,U+2000-206f,U+2074,U+20ac,U+2122,U+2191,U+2193,U+2212,U+2215,U+feff,U+fffd}@supports (-moz-appearance:none){.moz\:hidden{display:none!important}.moz\:block{display:block!important}}
/* assets/index-Gi4Y8CST.css */
@keyframes _bblFadInOut_10462_1{0%,80%,to{box-shadow:0 2.5em 0 -1.3em}40%{box-shadow:0 2.5em}}@font-face{font-display:swap;font-family:Manrope;font-style:normal;font-weight:400 700;src:url(/dist/web/assets/manrope-4qdASHmp.woff2) format("woff2");unicode-range:U+0301,U+0400-045f,U+0490-0491,U+04b0-04b1,U+2116}@font-face{font-display:swap;font-family:Manrope;font-style:normal;font-weight:400 700;src:url(/dist/web/assets/manrope-4qdASHmp.woff2) format("woff2");unicode-range:U+0102-0103,U+0110-0111,U+0128-0129,U+0168-0169,U+01a0-01a1,U+01af-01b0,U+0300-0301,U+0303-0304,U+0308-0309,U+0323,U+0329,U+1ea0-1ef9,U+20ab}@font-face{font-display:swap;font-family:Manrope;font-style:normal;font-weight:400 700;src:url(/dist/web/assets/manrope-4qdASHmp.woff2) format("woff2");unicode-range:U+0100-02af,U+0304,U+0308,U+0329,U+1e00-1e9f,U+1ef2-1eff,U+2020,U+20a0-20ab,U+20ad-20cf,U+2113,U+2c60-2c7f,U+a720-a7ff}@font-face{font-display:swap;font-family:Manrope;font-style:normal;font-weight:400 700;src:url(/dist/web/assets/manrope-4qdASHmp.woff2) format("woff2");unicode-range:U+00??,U+0131,U+0152-0153,U+02bb-02bc,U+02c6,U+02da,U+02dc,U+0304,U+0308,U+0329,U+2000-206f,U+2074,U+20ac,U+2122,U+2191,U+2193,U+2212,U+2215,U+feff,U+fffd}
/* assets/index-HiBAUp8q.css */
@keyframes _bblFadInOut_10462_1{0%,80%,to{box-shadow:0 2.5em 0 -1.3em}40%{box-shadow:0 2.5em}}@font-face{font-display:swap;font-family:Manrope;font-style:normal;font-weight:400 700;src:url(/dist/web/assets/manrope-4qdASHmp.woff2) format("woff2");unicode-range:U+0301,U+0400-045f,U+0490-0491,U+04b0-04b1,U+2116}@font-face{font-display:swap;font-family:Manrope;font-style:normal;font-weight:400 700;src:url(/dist/web/assets/manrope-4qdASHmp.woff2) format("woff2");unicode-range:U+0102-0103,U+0110-0111,U+0128-0129,U+0168-0169,U+01a0-01a1,U+01af-01b0,U+0300-0301,U+0303-0304,U+0308-0309,U+0323,U+0329,U+1ea0-1ef9,U+20ab}@font-face{font-display:swap;font-family:Manrope;font-style:normal;font-weight:400 700;src:url(/dist/web/assets/manrope-4qdASHmp.woff2) format("woff2");unicode-range:U+0100-02af,U+0304,U+0308,U+0329,U+1e00-1e9f,U+1ef2-1eff,U+2020,U+20a0-20ab,U+20ad-20cf,U+2113,U+2c60-2c7f,U+a720-a7ff}@font-face{font-display:swap;font-family:Manrope;font-style:normal;font-weight:400 700;src:url(/dist/web/assets/manrope-4qdASHmp.woff2) format("woff2");unicode-range:U+00??,U+0131,U+0152-0153,U+02bb-02bc,U+02c6,U+02da,U+02dc,U+0304,U+0308,U+0329,U+2000-206f,U+2074,U+20ac,U+2122,U+2191,U+2193,U+2212,U+2215,U+feff,U+fffd}@supports (-moz-appearance:none){.moz\:hidden{display:none!important}.moz\:block{display:block!important}}
/* assets/index-IgU-G2hi.css */
@keyframes _bblFadInOut_10462_1{0%,80%,to{box-shadow:0 2.5em 0 -1.3em}40%{box-shadow:0 2.5em}}@font-face{font-display:swap;font-family:Manrope;font-style:normal;font-weight:400 700;src:url(/dist/web/assets/manrope-4qdASHmp.woff2) format("woff2");unicode-range:U+0301,U+0400-045f,U+0490-0491,U+04b0-04b1,U+2116}@font-face{font-display:swap;font-family:Manrope;font-style:normal;font-weight:400 700;src:url(/dist/web/assets/manrope-4qdASHmp.woff2) format("woff2");unicode-range:U+0102-0103,U+0110-0111,U+0128-0129,U+0168-0169,U+01a0-01a1,U+01af-01b0,U+0300-0301,U+0303-0304,U+0308-0309,U+0323,U+0329,U+1ea0-1ef9,U+20ab}@font-face{font-display:swap;font-family:Manrope;font-style:normal;font-weight:400 700;src:url(/dist/web/assets/manrope-4qdASHmp.woff2) format("woff2");unicode-range:U+0100-02af,U+0304,U+0308,U+0329,U+1e00-1e9f,U+1ef2-1eff,U+2020,U+20a0-20ab,U+20ad-20cf,U+2113,U+2c60-2c7f,U+a720-a7ff}@font-face{font-display:swap;font-family:Manrope;font-style:normal;font-weight:400 700;src:url(/dist/web/assets/manrope-4qdASHmp.woff2) format("woff2");unicode-range:U+00??,U+0131,U+0152-0153,U+02bb-02bc,U+02c6,U+02da,U+02dc,U+0304,U+0308,U+0329,U+2000-206f,U+2074,U+20ac,U+2122,U+2191,U+2193,U+2212,U+2215,U+feff,U+fffd}
/* assets/index-MJ__H5dY.css */
@keyframes _bblFadInOut_10462_1{0%,80%,to{box-shadow:0 2.5em 0 -1.3em}40%{box-shadow:0 2.5em}}@font-face{font-display:swap;font-family:Manrope;font-style:normal;font-weight:400 700;src:url(/dist/web/assets/manrope-4qdASHmp.woff2) format("woff2");unicode-range:U+0301,U+0400-045f,U+0490-0491,U+04b0-04b1,U+2116}@font-face{font-display:swap;font-family:Manrope;font-style:normal;font-weight:400 700;src:url(/dist/web/assets/manrope-4qdASHmp.woff2) format("woff2");unicode-range:U+0102-0103,U+0110-0111,U+0128-0129,U+0168-0169,U+01a0-01a1,U+01af-01b0,U+0300-0301,U+0303-0304,U+0308-0309,U+0323,U+0329,U+1ea0-1ef9,U+20ab}@font-face{font-display:swap;font-family:Manrope;font-style:normal;font-weight:400 700;src:url(/dist/web/assets/manrope-4qdASHmp.woff2) format("woff2");unicode-range:U+0100-02af,U+0304,U+0308,U+0329,U+1e00-1e9f,U+1ef2-1eff,U+2020,U+20a0-20ab,U+20ad-20cf,U+2113,U+2c60-2c7f,U+a720-a7ff}@font-face{font-display:swap;font-family:Manrope;font-style:normal;font-weight:400 700;src:url(/dist/web/assets/manrope-4qdASHmp.woff2) format("woff2");unicode-range:U+00??,U+0131,U+0152-0153,U+02bb-02bc,U+02c6,U+02da,U+02dc,U+0304,U+0308,U+0329,U+2000-206f,U+2074,U+20ac,U+2122,U+2191,U+2193,U+2212,U+2215,U+feff,U+fffd}
/* assets/index-N9qyfwZ2.css */
@keyframes _bblFadInOut_10462_1{0%,80%,to{box-shadow:0 2.5em 0 -1.3em}40%{box-shadow:0 2.5em}}@font-face{font-display:swap;font-family:Manrope;font-style:normal;font-weight:400 700;src:url(/dist/web/assets/manrope-4qdASHmp.woff2) format("woff2");unicode-range:U+0301,U+0400-045f,U+0490-0491,U+04b0-04b1,U+2116}@font-face{font-display:swap;font-family:Manrope;font-style:normal;font-weight:400 700;src:url(/dist/web/assets/manrope-4qdASHmp.woff2) format("woff2");unicode-range:U+0102-0103,U+0110-0111,U+0128-0129,U+0168-0169,U+01a0-01a1,U+01af-01b0,U+0300-0301,U+0303-0304,U+0308-0309,U+0323,U+0329,U+1ea0-1ef9,U+20ab}@font-face{font-display:swap;font-family:Manrope;font-style:normal;font-weight:400 700;src:url(/dist/web/assets/manrope-4qdASHmp.woff2) format("woff2");unicode-range:U+0100-02af,U+0304,U+0308,U+0329,U+1e00-1e9f,U+1ef2-1eff,U+2020,U+20a0-20ab,U+20ad-20cf,U+2113,U+2c60-2c7f,U+a720-a7ff}@font-face{font-display:swap;font-family:Manrope;font-style:normal;font-weight:400 700;src:url(/dist/web/assets/manrope-4qdASHmp.woff2) format("woff2");unicode-range:U+00??,U+0131,U+0152-0153,U+02bb-02bc,U+02c6,U+02da,U+02dc,U+0304,U+0308,U+0329,U+2000-206f,U+2074,U+20ac,U+2122,U+2191,U+2193,U+2212,U+2215,U+feff,U+fffd}
/* assets/index-PN3aE1yf.css */
@keyframes _bblFadInOut_10462_1{0%,80%,to{box-shadow:0 2.5em 0 -1.3em}40%{box-shadow:0 2.5em}}@font-face{font-display:swap;font-family:Manrope;font-style:normal;font-weight:400 700;src:url(/dist/web/assets/manrope-4qdASHmp.woff2) format("woff2");unicode-range:U+0301,U+0400-045f,U+0490-0491,U+04b0-04b1,U+2116}@font-face{font-display:swap;font-family:Manrope;font-style:normal;font-weight:400 700;src:url(/dist/web/assets/manrope-4qdASHmp.woff2) format("woff2");unicode-range:U+0102-0103,U+0110-0111,U+0128-0129,U+0168-0169,U+01a0-01a1,U+01af-01b0,U+0300-0301,U+0303-0304,U+0308-0309,U+0323,U+0329,U+1ea0-1ef9,U+20ab}@font-face{font-display:swap;font-family:Manrope;font-style:normal;font-weight:400 700;src:url(/dist/web/assets/manrope-4qdASHmp.woff2) format("woff2");unicode-range:U+0100-02af,U+0304,U+0308,U+0329,U+1e00-1e9f,U+1ef2-1eff,U+2020,U+20a0-20ab,U+20ad-20cf,U+2113,U+2c60-2c7f,U+a720-a7ff}@font-face{font-display:swap;font-family:Manrope;font-style:normal;font-weight:400 700;src:url(/dist/web/assets/manrope-4qdASHmp.woff2) format("woff2");unicode-range:U+00??,U+0131,U+0152-0153,U+02bb-02bc,U+02c6,U+02da,U+02dc,U+0304,U+0308,U+0329,U+2000-206f,U+2074,U+20ac,U+2122,U+2191,U+2193,U+2212,U+2215,U+feff,U+fffd}
/* assets/index-QgxHhAcP.css */
@keyframes _bblFadInOut_10462_1{0%,80%,to{box-shadow:0 2.5em 0 -1.3em}40%{box-shadow:0 2.5em}}@font-face{font-display:swap;font-family:Manrope;font-style:normal;font-weight:400 700;src:url(/dist/web/assets/manrope-4qdASHmp.woff2) format("woff2");unicode-range:U+0301,U+0400-045f,U+0490-0491,U+04b0-04b1,U+2116}@font-face{font-display:swap;font-family:Manrope;font-style:normal;font-weight:400 700;src:url(/dist/web/assets/manrope-4qdASHmp.woff2) format("woff2");unicode-range:U+0102-0103,U+0110-0111,U+0128-0129,U+0168-0169,U+01a0-01a1,U+01af-01b0,U+0300-0301,U+0303-0304,U+0308-0309,U+0323,U+0329,U+1ea0-1ef9,U+20ab}@font-face{font-display:swap;font-family:Manrope;font-style:normal;font-weight:400 700;src:url(/dist/web/assets/manrope-4qdASHmp.woff2) format("woff2");unicode-range:U+0100-02af,U+0304,U+0308,U+0329,U+1e00-1e9f,U+1ef2-1eff,U+2020,U+20a0-20ab,U+20ad-20cf,U+2113,U+2c60-2c7f,U+a720-a7ff}@font-face{font-display:swap;font-family:Manrope;font-style:normal;font-weight:400 700;src:url(/dist/web/assets/manrope-4qdASHmp.woff2) format("woff2");unicode-range:U+00??,U+0131,U+0152-0153,U+02bb-02bc,U+02c6,U+02da,U+02dc,U+0304,U+0308,U+0329,U+2000-206f,U+2074,U+20ac,U+2122,U+2191,U+2193,U+2212,U+2215,U+feff,U+fffd}
/* assets/index-Tu1KS_La.css */
@keyframes _bblFadInOut_10462_1{0%,80%,to{box-shadow:0 2.5em 0 -1.3em}40%{box-shadow:0 2.5em}}@font-face{font-display:swap;font-family:Manrope;font-style:normal;font-weight:400 700;src:url(/dist/web/assets/manrope-4qdASHmp.woff2) format("woff2");unicode-range:U+0301,U+0400-045f,U+0490-0491,U+04b0-04b1,U+2116}@font-face{font-display:swap;font-family:Manrope;font-style:normal;font-weight:400 700;src:url(/dist/web/assets/manrope-4qdASHmp.woff2) format("woff2");unicode-range:U+0102-0103,U+0110-0111,U+0128-0129,U+0168-0169,U+01a0-01a1,U+01af-01b0,U+0300-0301,U+0303-0304,U+0308-0309,U+0323,U+0329,U+1ea0-1ef9,U+20ab}@font-face{font-display:swap;font-family:Manrope;font-style:normal;font-weight:400 700;src:url(/dist/web/assets/manrope-4qdASHmp.woff2) format("woff2");unicode-range:U+0100-02af,U+0304,U+0308,U+0329,U+1e00-1e9f,U+1ef2-1eff,U+2020,U+20a0-20ab,U+20ad-20cf,U+2113,U+2c60-2c7f,U+a720-a7ff}@font-face{font-display:swap;font-family:Manrope;font-style:normal;font-weight:400 700;src:url(/dist/web/assets/manrope-4qdASHmp.woff2) format("woff2");unicode-range:U+00??,U+0131,U+0152-0153,U+02bb-02bc,U+02c6,U+02da,U+02dc,U+0304,U+0308,U+0329,U+2000-206f,U+2074,U+20ac,U+2122,U+2191,U+2193,U+2212,U+2215,U+feff,U+fffd}
/* assets/index-VupVPIGv.css */
@keyframes _bblFadInOut_10462_1{0%,80%,to{box-shadow:0 2.5em 0 -1.3em}40%{box-shadow:0 2.5em}}@font-face{font-display:swap;font-family:Manrope;font-style:normal;font-weight:400 700;src:url(/dist/web/assets/manrope-4qdASHmp.woff2) format("woff2");unicode-range:U+0301,U+0400-045f,U+0490-0491,U+04b0-04b1,U+2116}@font-face{font-display:swap;font-family:Manrope;font-style:normal;font-weight:400 700;src:url(/dist/web/assets/manrope-4qdASHmp.woff2) format("woff2");unicode-range:U+0102-0103,U+0110-0111,U+0128-0129,U+0168-0169,U+01a0-01a1,U+01af-01b0,U+0300-0301,U+0303-0304,U+0308-0309,U+0323,U+0329,U+1ea0-1ef9,U+20ab}@font-face{font-display:swap;font-family:Manrope;font-style:normal;font-weight:400 700;src:url(/dist/web/assets/manrope-4qdASHmp.woff2) format("woff2");unicode-range:U+0100-02af,U+0304,U+0308,U+0329,U+1e00-1e9f,U+1ef2-1eff,U+2020,U+20a0-20ab,U+20ad-20cf,U+2113,U+2c60-2c7f,U+a720-a7ff}@font-face{font-display:swap;font-family:Manrope;font-style:normal;font-weight:400 700;src:url(/dist/web/assets/manrope-4qdASHmp.woff2) format("woff2");unicode-range:U+00??,U+0131,U+0152-0153,U+02bb-02bc,U+02c6,U+02da,U+02dc,U+0304,U+0308,U+0329,U+2000-206f,U+2074,U+20ac,U+2122,U+2191,U+2193,U+2212,U+2215,U+feff,U+fffd}
/* assets/index-XAIe3Ip5.css */
@keyframes _bblFadInOut_10462_1{0%,80%,to{box-shadow:0 2.5em 0 -1.3em}40%{box-shadow:0 2.5em}}@font-face{font-display:swap;font-family:Manrope;font-style:normal;font-weight:400 700;src:url(/dist/web/assets/manrope-4qdASHmp.woff2) format("woff2");unicode-range:U+0301,U+0400-045f,U+0490-0491,U+04b0-04b1,U+2116}@font-face{font-display:swap;font-family:Manrope;font-style:normal;font-weight:400 700;src:url(/dist/web/assets/manrope-4qdASHmp.woff2) format("woff2");unicode-range:U+0102-0103,U+0110-0111,U+0128-0129,U+0168-0169,U+01a0-01a1,U+01af-01b0,U+0300-0301,U+0303-0304,U+0308-0309,U+0323,U+0329,U+1ea0-1ef9,U+20ab}@font-face{font-display:swap;font-family:Manrope;font-style:normal;font-weight:400 700;src:url(/dist/web/assets/manrope-4qdASHmp.woff2) format("woff2");unicode-range:U+0100-02af,U+0304,U+0308,U+0329,U+1e00-1e9f,U+1ef2-1eff,U+2020,U+20a0-20ab,U+20ad-20cf,U+2113,U+2c60-2c7f,U+a720-a7ff}@font-face{font-display:swap;font-family:Manrope;font-style:normal;font-weight:400 700;src:url(/dist/web/assets/manrope-4qdASHmp.woff2) format("woff2");unicode-range:U+00??,U+0131,U+0152-0153,U+02bb-02bc,U+02c6,U+02da,U+02dc,U+0304,U+0308,U+0329,U+2000-206f,U+2074,U+20ac,U+2122,U+2191,U+2193,U+2212,U+2215,U+feff,U+fffd}@supports (-moz-appearance:none){.moz\:hidden{display:none!important}.moz\:block{display:block!important}}
/* assets/index-Xdchy0Tc.css */
@keyframes _bblFadInOut_10462_1{0%,80%,to{box-shadow:0 2.5em 0 -1.3em}40%{box-shadow:0 2.5em}}@font-face{font-display:swap;font-family:Manrope;font-style:normal;font-weight:400 700;src:url(/dist/web/assets/manrope-4qdASHmp.woff2) format("woff2");unicode-range:U+0301,U+0400-045f,U+0490-0491,U+04b0-04b1,U+2116}@font-face{font-display:swap;font-family:Manrope;font-style:normal;font-weight:400 700;src:url(/dist/web/assets/manrope-4qdASHmp.woff2) format("woff2");unicode-range:U+0102-0103,U+0110-0111,U+0128-0129,U+0168-0169,U+01a0-01a1,U+01af-01b0,U+0300-0301,U+0303-0304,U+0308-0309,U+0323,U+0329,U+1ea0-1ef9,U+20ab}@font-face{font-display:swap;font-family:Manrope;font-style:normal;font-weight:400 700;src:url(/dist/web/assets/manrope-4qdASHmp.woff2) format("woff2");unicode-range:U+0100-02af,U+0304,U+0308,U+0329,U+1e00-1e9f,U+1ef2-1eff,U+2020,U+20a0-20ab,U+20ad-20cf,U+2113,U+2c60-2c7f,U+a720-a7ff}@font-face{font-display:swap;font-family:Manrope;font-style:normal;font-weight:400 700;src:url(/dist/web/assets/manrope-4qdASHmp.woff2) format("woff2");unicode-range:U+00??,U+0131,U+0152-0153,U+02bb-02bc,U+02c6,U+02da,U+02dc,U+0304,U+0308,U+0329,U+2000-206f,U+2074,U+20ac,U+2122,U+2191,U+2193,U+2212,U+2215,U+feff,U+fffd}
/* assets/index-dO2zsjkN.css */
@keyframes _bblFadInOut_10462_1{0%,80%,to{box-shadow:0 2.5em 0 -1.3em}40%{box-shadow:0 2.5em}}@font-face{font-display:swap;font-family:Manrope;font-style:normal;font-weight:400 700;src:url(/dist/web/assets/manrope-4qdASHmp.woff2) format("woff2");unicode-range:U+0301,U+0400-045f,U+0490-0491,U+04b0-04b1,U+2116}@font-face{font-display:swap;font-family:Manrope;font-style:normal;font-weight:400 700;src:url(/dist/web/assets/manrope-4qdASHmp.woff2) format("woff2");unicode-range:U+0102-0103,U+0110-0111,U+0128-0129,U+0168-0169,U+01a0-01a1,U+01af-01b0,U+0300-0301,U+0303-0304,U+0308-0309,U+0323,U+0329,U+1ea0-1ef9,U+20ab}@font-face{font-display:swap;font-family:Manrope;font-style:normal;font-weight:400 700;src:url(/dist/web/assets/manrope-4qdASHmp.woff2) format("woff2");unicode-range:U+0100-02af,U+0304,U+0308,U+0329,U+1e00-1e9f,U+1ef2-1eff,U+2020,U+20a0-20ab,U+20ad-20cf,U+2113,U+2c60-2c7f,U+a720-a7ff}@font-face{font-display:swap;font-family:Manrope;font-style:normal;font-weight:400 700;src:url(/dist/web/assets/manrope-4qdASHmp.woff2) format("woff2");unicode-range:U+00??,U+0131,U+0152-0153,U+02bb-02bc,U+02c6,U+02da,U+02dc,U+0304,U+0308,U+0329,U+2000-206f,U+2074,U+20ac,U+2122,U+2191,U+2193,U+2212,U+2215,U+feff,U+fffd}
/* assets/index-jB9GYJ6e.css */
@keyframes _bblFadInOut_10462_1{0%,80%,to{box-shadow:0 2.5em 0 -1.3em}40%{box-shadow:0 2.5em}}@font-face{font-display:swap;font-family:Manrope;font-style:normal;font-weight:400 700;src:url(/dist/web/assets/manrope-4qdASHmp.woff2) format("woff2");unicode-range:U+0301,U+0400-045f,U+0490-0491,U+04b0-04b1,U+2116}@font-face{font-display:swap;font-family:Manrope;font-style:normal;font-weight:400 700;src:url(/dist/web/assets/manrope-4qdASHmp.woff2) format("woff2");unicode-range:U+0102-0103,U+0110-0111,U+0128-0129,U+0168-0169,U+01a0-01a1,U+01af-01b0,U+0300-0301,U+0303-0304,U+0308-0309,U+0323,U+0329,U+1ea0-1ef9,U+20ab}@font-face{font-display:swap;font-family:Manrope;font-style:normal;font-weight:400 700;src:url(/dist/web/assets/manrope-4qdASHmp.woff2) format("woff2");unicode-range:U+0100-02af,U+0304,U+0308,U+0329,U+1e00-1e9f,U+1ef2-1eff,U+2020,U+20a0-20ab,U+20ad-20cf,U+2113,U+2c60-2c7f,U+a720-a7ff}@font-face{font-display:swap;font-family:Manrope;font-style:normal;font-weight:400 700;src:url(/dist/web/assets/manrope-4qdASHmp.woff2) format("woff2");unicode-range:U+00??,U+0131,U+0152-0153,U+02bb-02bc,U+02c6,U+02da,U+02dc,U+0304,U+0308,U+0329,U+2000-206f,U+2074,U+20ac,U+2122,U+2191,U+2193,U+2212,U+2215,U+feff,U+fffd}
/* assets/index-k1-MyS6w.css */
@keyframes _bblFadInOut_10462_1{0%,80%,to{box-shadow:0 2.5em 0 -1.3em}40%{box-shadow:0 2.5em}}@font-face{font-display:swap;font-family:Manrope;font-style:normal;font-weight:400 700;src:url(/dist/web/assets/manrope-4qdASHmp.woff2) format("woff2");unicode-range:U+0301,U+0400-045f,U+0490-0491,U+04b0-04b1,U+2116}@font-face{font-display:swap;font-family:Manrope;font-style:normal;font-weight:400 700;src:url(/dist/web/assets/manrope-4qdASHmp.woff2) format("woff2");unicode-range:U+0102-0103,U+0110-0111,U+0128-0129,U+0168-0169,U+01a0-01a1,U+01af-01b0,U+0300-0301,U+0303-0304,U+0308-0309,U+0323,U+0329,U+1ea0-1ef9,U+20ab}@font-face{font-display:swap;font-family:Manrope;font-style:normal;font-weight:400 700;src:url(/dist/web/assets/manrope-4qdASHmp.woff2) format("woff2");unicode-range:U+0100-02af,U+0304,U+0308,U+0329,U+1e00-1e9f,U+1ef2-1eff,U+2020,U+20a0-20ab,U+20ad-20cf,U+2113,U+2c60-2c7f,U+a720-a7ff}@font-face{font-display:swap;font-family:Manrope;font-style:normal;font-weight:400 700;src:url(/dist/web/assets/manrope-4qdASHmp.woff2) format("woff2");unicode-range:U+00??,U+0131,U+0152-0153,U+02bb-02bc,U+02c6,U+02da,U+02dc,U+0304,U+0308,U+0329,U+2000-206f,U+2074,U+20ac,U+2122,U+2191,U+2193,U+2212,U+2215,U+feff,U+fffd}
/* assets/index-kD-AzwaY.css */
@keyframes _bblFadInOut_10462_1{0%,80%,to{box-shadow:0 2.5em 0 -1.3em}40%{box-shadow:0 2.5em}}@font-face{font-display:swap;font-family:Manrope;font-style:normal;font-weight:400 700;src:url(/dist/web/assets/manrope-4qdASHmp.woff2) format("woff2");unicode-range:U+0301,U+0400-045f,U+0490-0491,U+04b0-04b1,U+2116}@font-face{font-display:swap;font-family:Manrope;font-style:normal;font-weight:400 700;src:url(/dist/web/assets/manrope-4qdASHmp.woff2) format("woff2");unicode-range:U+0102-0103,U+0110-0111,U+0128-0129,U+0168-0169,U+01a0-01a1,U+01af-01b0,U+0300-0301,U+0303-0304,U+0308-0309,U+0323,U+0329,U+1ea0-1ef9,U+20ab}@font-face{font-display:swap;font-family:Manrope;font-style:normal;font-weight:400 700;src:url(/dist/web/assets/manrope-4qdASHmp.woff2) format("woff2");unicode-range:U+0100-02af,U+0304,U+0308,U+0329,U+1e00-1e9f,U+1ef2-1eff,U+2020,U+20a0-20ab,U+20ad-20cf,U+2113,U+2c60-2c7f,U+a720-a7ff}@font-face{font-display:swap;font-family:Manrope;font-style:normal;font-weight:400 700;src:url(/dist/web/assets/manrope-4qdASHmp.woff2) format("woff2");unicode-range:U+00??,U+0131,U+0152-0153,U+02bb-02bc,U+02c6,U+02da,U+02dc,U+0304,U+0308,U+0329,U+2000-206f,U+2074,U+20ac,U+2122,U+2191,U+2193,U+2212,U+2215,U+feff,U+fffd}
/* assets/index-kubnjski.css */
@keyframes _bblFadInOut_10462_1{0%,80%,to{box-shadow:0 2.5em 0 -1.3em}40%{box-shadow:0 2.5em}}@font-face{font-display:swap;font-family:Manrope;font-style:normal;font-weight:400 700;src:url(/dist/web/assets/manrope-4qdASHmp.woff2) format("woff2");unicode-range:U+0301,U+0400-045f,U+0490-0491,U+04b0-04b1,U+2116}@font-face{font-display:swap;font-family:Manrope;font-style:normal;font-weight:400 700;src:url(/dist/web/assets/manrope-4qdASHmp.woff2) format("woff2");unicode-range:U+0102-0103,U+0110-0111,U+0128-0129,U+0168-0169,U+01a0-01a1,U+01af-01b0,U+0300-0301,U+0303-0304,U+0308-0309,U+0323,U+0329,U+1ea0-1ef9,U+20ab}@font-face{font-display:swap;font-family:Manrope;font-style:normal;font-weight:400 700;src:url(/dist/web/assets/manrope-4qdASHmp.woff2) format("woff2");unicode-range:U+0100-02af,U+0304,U+0308,U+0329,U+1e00-1e9f,U+1ef2-1eff,U+2020,U+20a0-20ab,U+20ad-20cf,U+2113,U+2c60-2c7f,U+a720-a7ff}@font-face{font-display:swap;font-family:Manrope;font-style:normal;font-weight:400 700;src:url(/dist/web/assets/manrope-4qdASHmp.woff2) format("woff2");unicode-range:U+00??,U+0131,U+0152-0153,U+02bb-02bc,U+02c6,U+02da,U+02dc,U+0304,U+0308,U+0329,U+2000-206f,U+2074,U+20ac,U+2122,U+2191,U+2193,U+2212,U+2215,U+feff,U+fffd}
/* assets/index-n87Eyx--.css */
@keyframes _bblFadInOut_10462_1{0%,80%,to{box-shadow:0 2.5em 0 -1.3em}40%{box-shadow:0 2.5em}}@font-face{font-display:swap;font-family:Manrope;font-style:normal;font-weight:400 700;src:url(/dist/web/assets/manrope-4qdASHmp.woff2) format("woff2");unicode-range:U+0301,U+0400-045f,U+0490-0491,U+04b0-04b1,U+2116}@font-face{font-display:swap;font-family:Manrope;font-style:normal;font-weight:400 700;src:url(/dist/web/assets/manrope-4qdASHmp.woff2) format("woff2");unicode-range:U+0102-0103,U+0110-0111,U+0128-0129,U+0168-0169,U+01a0-01a1,U+01af-01b0,U+0300-0301,U+0303-0304,U+0308-0309,U+0323,U+0329,U+1ea0-1ef9,U+20ab}@font-face{font-display:swap;font-family:Manrope;font-style:normal;font-weight:400 700;src:url(/dist/web/assets/manrope-4qdASHmp.woff2) format("woff2");unicode-range:U+0100-02af,U+0304,U+0308,U+0329,U+1e00-1e9f,U+1ef2-1eff,U+2020,U+20a0-20ab,U+20ad-20cf,U+2113,U+2c60-2c7f,U+a720-a7ff}@font-face{font-display:swap;font-family:Manrope;font-style:normal;font-weight:400 700;src:url(/dist/web/assets/manrope-4qdASHmp.woff2) format("woff2");unicode-range:U+00??,U+0131,U+0152-0153,U+02bb-02bc,U+02c6,U+02da,U+02dc,U+0304,U+0308,U+0329,U+2000-206f,U+2074,U+20ac,U+2122,U+2191,U+2193,U+2212,U+2215,U+feff,U+fffd}
/* assets/index-pW4tkP38.css */
@keyframes _bblFadInOut_10462_1{0%,80%,to{box-shadow:0 2.5em 0 -1.3em}40%{box-shadow:0 2.5em}}@font-face{font-display:swap;font-family:Manrope;font-style:normal;font-weight:400 700;src:url(/dist/web/assets/manrope-4qdASHmp.woff2) format("woff2");unicode-range:U+0301,U+0400-045f,U+0490-0491,U+04b0-04b1,U+2116}@font-face{font-display:swap;font-family:Manrope;font-style:normal;font-weight:400 700;src:url(/dist/web/assets/manrope-4qdASHmp.woff2) format("woff2");unicode-range:U+0102-0103,U+0110-0111,U+0128-0129,U+0168-0169,U+01a0-01a1,U+01af-01b0,U+0300-0301,U+0303-0304,U+0308-0309,U+0323,U+0329,U+1ea0-1ef9,U+20ab}@font-face{font-display:swap;font-family:Manrope;font-style:normal;font-weight:400 700;src:url(/dist/web/assets/manrope-4qdASHmp.woff2) format("woff2");unicode-range:U+0100-02af,U+0304,U+0308,U+0329,U+1e00-1e9f,U+1ef2-1eff,U+2020,U+20a0-20ab,U+20ad-20cf,U+2113,U+2c60-2c7f,U+a720-a7ff}@font-face{font-display:swap;font-family:Manrope;font-style:normal;font-weight:400 700;src:url(/dist/web/assets/manrope-4qdASHmp.woff2) format("woff2");unicode-range:U+00??,U+0131,U+0152-0153,U+02bb-02bc,U+02c6,U+02da,U+02dc,U+0304,U+0308,U+0329,U+2000-206f,U+2074,U+20ac,U+2122,U+2191,U+2193,U+2212,U+2215,U+feff,U+fffd}
/* assets/index-ppfGiAl1.css */
@keyframes _bblFadInOut_10462_1{0%,80%,to{box-shadow:0 2.5em 0 -1.3em}40%{box-shadow:0 2.5em}}@font-face{font-display:swap;font-family:Manrope;font-style:normal;font-weight:400 700;src:url(/dist/web/assets/manrope-4qdASHmp.woff2) format("woff2");unicode-range:U+0301,U+0400-045f,U+0490-0491,U+04b0-04b1,U+2116}@font-face{font-display:swap;font-family:Manrope;font-style:normal;font-weight:400 700;src:url(/dist/web/assets/manrope-4qdASHmp.woff2) format("woff2");unicode-range:U+0102-0103,U+0110-0111,U+0128-0129,U+0168-0169,U+01a0-01a1,U+01af-01b0,U+0300-0301,U+0303-0304,U+0308-0309,U+0323,U+0329,U+1ea0-1ef9,U+20ab}@font-face{font-display:swap;font-family:Manrope;font-style:normal;font-weight:400 700;src:url(/dist/web/assets/manrope-4qdASHmp.woff2) format("woff2");unicode-range:U+0100-02af,U+0304,U+0308,U+0329,U+1e00-1e9f,U+1ef2-1eff,U+2020,U+20a0-20ab,U+20ad-20cf,U+2113,U+2c60-2c7f,U+a720-a7ff}@font-face{font-display:swap;font-family:Manrope;font-style:normal;font-weight:400 700;src:url(/dist/web/assets/manrope-4qdASHmp.woff2) format("woff2");unicode-range:U+00??,U+0131,U+0152-0153,U+02bb-02bc,U+02c6,U+02da,U+02dc,U+0304,U+0308,U+0329,U+2000-206f,U+2074,U+20ac,U+2122,U+2191,U+2193,U+2212,U+2215,U+feff,U+fffd}
/* assets/index-rL5DnwYl.css */
@keyframes _bblFadInOut_10462_1{0%,80%,to{box-shadow:0 2.5em 0 -1.3em}40%{box-shadow:0 2.5em}}@font-face{font-display:swap;font-family:Manrope;font-style:normal;font-weight:400 700;src:url(/dist/web/assets/manrope-4qdASHmp.woff2) format("woff2");unicode-range:U+0301,U+0400-045f,U+0490-0491,U+04b0-04b1,U+2116}@font-face{font-display:swap;font-family:Manrope;font-style:normal;font-weight:400 700;src:url(/dist/web/assets/manrope-4qdASHmp.woff2) format("woff2");unicode-range:U+0102-0103,U+0110-0111,U+0128-0129,U+0168-0169,U+01a0-01a1,U+01af-01b0,U+0300-0301,U+0303-0304,U+0308-0309,U+0323,U+0329,U+1ea0-1ef9,U+20ab}@font-face{font-display:swap;font-family:Manrope;font-style:normal;font-weight:400 700;src:url(/dist/web/assets/manrope-4qdASHmp.woff2) format("woff2");unicode-range:U+0100-02af,U+0304,U+0308,U+0329,U+1e00-1e9f,U+1ef2-1eff,U+2020,U+20a0-20ab,U+20ad-20cf,U+2113,U+2c60-2c7f,U+a720-a7ff}@font-face{font-display:swap;font-family:Manrope;font-style:normal;font-weight:400 700;src:url(/dist/web/assets/manrope-4qdASHmp.woff2) format("woff2");unicode-range:U+00??,U+0131,U+0152-0153,U+02bb-02bc,U+02c6,U+02da,U+02dc,U+0304,U+0308,U+0329,U+2000-206f,U+2074,U+20ac,U+2122,U+2191,U+2193,U+2212,U+2215,U+feff,U+fffd}
/* assets/index-sAxC70XE.css */
@keyframes _bblFadInOut_10462_1{0%,80%,to{box-shadow:0 2.5em 0 -1.3em}40%{box-shadow:0 2.5em}}@font-face{font-display:swap;font-family:Manrope;font-style:normal;font-weight:400 700;src:url(/dist/web/assets/manrope-4qdASHmp.woff2) format("woff2");unicode-range:U+0301,U+0400-045f,U+0490-0491,U+04b0-04b1,U+2116}@font-face{font-display:swap;font-family:Manrope;font-style:normal;font-weight:400 700;src:url(/dist/web/assets/manrope-4qdASHmp.woff2) format("woff2");unicode-range:U+0102-0103,U+0110-0111,U+0128-0129,U+0168-0169,U+01a0-01a1,U+01af-01b0,U+0300-0301,U+0303-0304,U+0308-0309,U+0323,U+0329,U+1ea0-1ef9,U+20ab}@font-face{font-display:swap;font-family:Manrope;font-style:normal;font-weight:400 700;src:url(/dist/web/assets/manrope-4qdASHmp.woff2) format("woff2");unicode-range:U+0100-02af,U+0304,U+0308,U+0329,U+1e00-1e9f,U+1ef2-1eff,U+2020,U+20a0-20ab,U+20ad-20cf,U+2113,U+2c60-2c7f,U+a720-a7ff}@font-face{font-display:swap;font-family:Manrope;font-style:normal;font-weight:400 700;src:url(/dist/web/assets/manrope-4qdASHmp.woff2) format("woff2");unicode-range:U+00??,U+0131,U+0152-0153,U+02bb-02bc,U+02c6,U+02da,U+02dc,U+0304,U+0308,U+0329,U+2000-206f,U+2074,U+20ac,U+2122,U+2191,U+2193,U+2212,U+2215,U+feff,U+fffd}@supports (-moz-appearance:none){.moz\:hidden{display:none!important}.moz\:block{display:block!important}}
/* assets/index-uibHYZhK.css */
@keyframes _bblFadInOut_10462_1{0%,80%,to{box-shadow:0 2.5em 0 -1.3em}40%{box-shadow:0 2.5em}}@font-face{font-display:swap;font-family:Manrope;font-style:normal;font-weight:400 700;src:url(/dist/web/assets/manrope-4qdASHmp.woff2) format("woff2");unicode-range:U+0301,U+0400-045f,U+0490-0491,U+04b0-04b1,U+2116}@font-face{font-display:swap;font-family:Manrope;font-style:normal;font-weight:400 700;src:url(/dist/web/assets/manrope-4qdASHmp.woff2) format("woff2");unicode-range:U+0102-0103,U+0110-0111,U+0128-0129,U+0168-0169,U+01a0-01a1,U+01af-01b0,U+0300-0301,U+0303-0304,U+0308-0309,U+0323,U+0329,U+1ea0-1ef9,U+20ab}@font-face{font-display:swap;font-family:Manrope;font-style:normal;font-weight:400 700;src:url(/dist/web/assets/manrope-4qdASHmp.woff2) format("woff2");unicode-range:U+0100-02af,U+0304,U+0308,U+0329,U+1e00-1e9f,U+1ef2-1eff,U+2020,U+20a0-20ab,U+20ad-20cf,U+2113,U+2c60-2c7f,U+a720-a7ff}@font-face{font-display:swap;font-family:Manrope;font-style:normal;font-weight:400 700;src:url(/dist/web/assets/manrope-4qdASHmp.woff2) format("woff2");unicode-range:U+00??,U+0131,U+0152-0153,U+02bb-02bc,U+02c6,U+02da,U+02dc,U+0304,U+0308,U+0329,U+2000-206f,U+2074,U+20ac,U+2122,U+2191,U+2193,U+2212,U+2215,U+feff,U+fffd}
/* assets/index-vF7ueyNY.css */
@keyframes _bblFadInOut_10462_1{0%,80%,to{box-shadow:0 2.5em 0 -1.3em}40%{box-shadow:0 2.5em}}@font-face{font-display:swap;font-family:Manrope;font-style:normal;font-weight:400 700;src:url(/dist/web/assets/manrope-4qdASHmp.woff2) format("woff2");unicode-range:U+0301,U+0400-045f,U+0490-0491,U+04b0-04b1,U+2116}@font-face{font-display:swap;font-family:Manrope;font-style:normal;font-weight:400 700;src:url(/dist/web/assets/manrope-4qdASHmp.woff2) format("woff2");unicode-range:U+0102-0103,U+0110-0111,U+0128-0129,U+0168-0169,U+01a0-01a1,U+01af-01b0,U+0300-0301,U+0303-0304,U+0308-0309,U+0323,U+0329,U+1ea0-1ef9,U+20ab}@font-face{font-display:swap;font-family:Manrope;font-style:normal;font-weight:400 700;src:url(/dist/web/assets/manrope-4qdASHmp.woff2) format("woff2");unicode-range:U+0100-02af,U+0304,U+0308,U+0329,U+1e00-1e9f,U+1ef2-1eff,U+2020,U+20a0-20ab,U+20ad-20cf,U+2113,U+2c60-2c7f,U+a720-a7ff}@font-face{font-display:swap;font-family:Manrope;font-style:normal;font-weight:400 700;src:url(/dist/web/assets/manrope-4qdASHmp.woff2) format("woff2");unicode-range:U+00??,U+0131,U+0152-0153,U+02bb-02bc,U+02c6,U+02da,U+02dc,U+0304,U+0308,U+0329,U+2000-206f,U+2074,U+20ac,U+2122,U+2191,U+2193,U+2212,U+2215,U+feff,U+fffd}
/* assets/index-vZBqRtgC.css */
@keyframes _bblFadInOut_10462_1{0%,80%,to{box-shadow:0 2.5em 0 -1.3em}40%{box-shadow:0 2.5em}}@font-face{font-display:swap;font-family:Manrope;font-style:normal;font-weight:400 700;src:url(/dist/web/assets/manrope-4qdASHmp.woff2) format("woff2");unicode-range:U+0301,U+0400-045f,U+0490-0491,U+04b0-04b1,U+2116}@font-face{font-display:swap;font-family:Manrope;font-style:normal;font-weight:400 700;src:url(/dist/web/assets/manrope-4qdASHmp.woff2) format("woff2");unicode-range:U+0102-0103,U+0110-0111,U+0128-0129,U+0168-0169,U+01a0-01a1,U+01af-01b0,U+0300-0301,U+0303-0304,U+0308-0309,U+0323,U+0329,U+1ea0-1ef9,U+20ab}@font-face{font-display:swap;font-family:Manrope;font-style:normal;font-weight:400 700;src:url(/dist/web/assets/manrope-4qdASHmp.woff2) format("woff2");unicode-range:U+0100-02af,U+0304,U+0308,U+0329,U+1e00-1e9f,U+1ef2-1eff,U+2020,U+20a0-20ab,U+20ad-20cf,U+2113,U+2c60-2c7f,U+a720-a7ff}@font-face{font-display:swap;font-family:Manrope;font-style:normal;font-weight:400 700;src:url(/dist/web/assets/manrope-4qdASHmp.woff2) format("woff2");unicode-range:U+00??,U+0131,U+0152-0153,U+02bb-02bc,U+02c6,U+02da,U+02dc,U+0304,U+0308,U+0329,U+2000-206f,U+2074,U+20ac,U+2122,U+2191,U+2193,U+2212,U+2215,U+feff,U+fffd}
/* assets/index-vmo5UNM0.css */
@font-face{font-display:swap;font-family:Manrope;font-style:normal;font-weight:400 700;src:url(/dist/web/assets/manrope-4qdASHmp.woff2) format("woff2");unicode-range:U+0301,U+0400-045f,U+0490-0491,U+04b0-04b1,U+2116}@font-face{font-display:swap;font-family:Manrope;font-style:normal;font-weight:400 700;src:url(/dist/web/assets/manrope-4qdASHmp.woff2) format("woff2");unicode-range:U+0102-0103,U+0110-0111,U+0128-0129,U+0168-0169,U+01a0-01a1,U+01af-01b0,U+0300-0301,U+0303-0304,U+0308-0309,U+0323,U+0329,U+1ea0-1ef9,U+20ab}@font-face{font-display:swap;font-family:Manrope;font-style:normal;font-weight:400 700;src:url(/dist/web/assets/manrope-4qdASHmp.woff2) format("woff2");unicode-range:U+0100-02af,U+0304,U+0308,U+0329,U+1e00-1e9f,U+1ef2-1eff,U+2020,U+20a0-20ab,U+20ad-20cf,U+2113,U+2c60-2c7f,U+a720-a7ff}@font-face{font-display:swap;font-family:Manrope;font-style:normal;font-weight:400 700;src:url(/dist/web/assets/manrope-4qdASHmp.woff2) format("woff2");unicode-range:U+00??,U+0131,U+0152-0153,U+02bb-02bc,U+02c6,U+02da,U+02dc,U+0304,U+0308,U+0329,U+2000-206f,U+2074,U+20ac,U+2122,U+2191,U+2193,U+2212,U+2215,U+feff,U+fffd}@keyframes _bblFadInOut_10462_1{0%,80%,to{box-shadow:0 2.5em 0 -1.3em}40%{box-shadow:0 2.5em}}
/* assets/index-zVBwMjNn.css */
@keyframes _bblFadInOut_10462_1{0%,80%,to{box-shadow:0 2.5em 0 -1.3em}40%{box-shadow:0 2.5em}}@font-face{font-display:swap;font-family:Manrope;font-style:normal;font-weight:400 700;src:url(/dist/web/assets/manrope-4qdASHmp.woff2) format("woff2");unicode-range:U+0301,U+0400-045f,U+0490-0491,U+04b0-04b1,U+2116}@font-face{font-display:swap;font-family:Manrope;font-style:normal;font-weight:400 700;src:url(/dist/web/assets/manrope-4qdASHmp.woff2) format("woff2");unicode-range:U+0102-0103,U+0110-0111,U+0128-0129,U+0168-0169,U+01a0-01a1,U+01af-01b0,U+0300-0301,U+0303-0304,U+0308-0309,U+0323,U+0329,U+1ea0-1ef9,U+20ab}@font-face{font-display:swap;font-family:Manrope;font-style:normal;font-weight:400 700;src:url(/dist/web/assets/manrope-4qdASHmp.woff2) format("woff2");unicode-range:U+0100-02af,U+0304,U+0308,U+0329,U+1e00-1e9f,U+1ef2-1eff,U+2020,U+20a0-20ab,U+20ad-20cf,U+2113,U+2c60-2c7f,U+a720-a7ff}@font-face{font-display:swap;font-family:Manrope;font-style:normal;font-weight:400 700;src:url(/dist/web/assets/manrope-4qdASHmp.woff2) format("woff2");unicode-range:U+00??,U+0131,U+0152-0153,U+02bb-02bc,U+02c6,U+02da,U+02dc,U+0304,U+0308,U+0329,U+2000-206f,U+2074,U+20ac,U+2122,U+2191,U+2193,U+2212,U+2215,U+feff,U+fffd}
/* assets/index-zfjX3cqB.css */
@keyframes _bblFadInOut_10462_1{0%,80%,to{box-shadow:0 2.5em 0 -1.3em}40%{box-shadow:0 2.5em}}@font-face{font-display:swap;font-family:Manrope;font-style:normal;font-weight:400 700;src:url(/dist/web/assets/manrope-4qdASHmp.woff2) format("woff2");unicode-range:U+0301,U+0400-045f,U+0490-0491,U+04b0-04b1,U+2116}@font-face{font-display:swap;font-family:Manrope;font-style:normal;font-weight:400 700;src:url(/dist/web/assets/manrope-4qdASHmp.woff2) format("woff2");unicode-range:U+0102-0103,U+0110-0111,U+0128-0129,U+0168-0169,U+01a0-01a1,U+01af-01b0,U+0300-0301,U+0303-0304,U+0308-0309,U+0323,U+0329,U+1ea0-1ef9,U+20ab}@font-face{font-display:swap;font-family:Manrope;font-style:normal;font-weight:400 700;src:url(/dist/web/assets/manrope-4qdASHmp.woff2) format("woff2");unicode-range:U+0100-02af,U+0304,U+0308,U+0329,U+1e00-1e9f,U+1ef2-1eff,U+2020,U+20a0-20ab,U+20ad-20cf,U+2113,U+2c60-2c7f,U+a720-a7ff}@font-face{font-display:swap;font-family:Manrope;font-style:normal;font-weight:400 700;src:url(/dist/web/assets/manrope-4qdASHmp.woff2) format("woff2");unicode-range:U+00??,U+0131,U+0152-0153,U+02bb-02bc,U+02c6,U+02da,U+02dc,U+0304,U+0308,U+0329,U+2000-206f,U+2074,U+20ac,U+2122,U+2191,U+2193,U+2212,U+2215,U+feff,U+fffd}
/* assets/preview-Blj0H2NZ.css */
@keyframes spin{0%{transform:rotate(0)}to{transform:rotate(1turn)}}
/* assets/preview-CEscvQMY.css */
@keyframes spin{0%{transform:rotate(0)}to{transform:rotate(1turn)}}
/* assets/style-BYmOokLm.css */
@keyframes _bblFadInOut_10462_1{0%,80%,to{box-shadow:0 2.5em 0 -1.3em}40%{box-shadow:0 2.5em}}@font-face{font-display:swap;font-family:Manrope;font-style:normal;font-weight:400 700;src:url(/dist/web/assets/manrope-4qdASHmp.woff2) format("woff2");unicode-range:U+0301,U+0400-045f,U+0490-0491,U+04b0-04b1,U+2116}@font-face{font-display:swap;font-family:Manrope;font-style:normal;font-weight:400 700;src:url(/dist/web/assets/manrope-4qdASHmp.woff2) format("woff2");unicode-range:U+0102-0103,U+0110-0111,U+0128-0129,U+0168-0169,U+01a0-01a1,U+01af-01b0,U+0300-0301,U+0303-0304,U+0308-0309,U+0323,U+0329,U+1ea0-1ef9,U+20ab}@font-face{font-display:swap;font-family:Manrope;font-style:normal;font-weight:400 700;src:url(/dist/web/assets/manrope-4qdASHmp.woff2) format("woff2");unicode-range:U+0100-02af,U+0304,U+0308,U+0329,U+1e00-1e9f,U+1ef2-1eff,U+2020,U+20a0-20ab,U+20ad-20cf,U+2113,U+2c60-2c7f,U+a720-a7ff}@font-face{font-display:swap;font-family:Manrope;font-style:normal;font-weight:400 700;src:url(/dist/web/assets/manrope-4qdASHmp.woff2) format("woff2");unicode-range:U+00??,U+0131,U+0152-0153,U+02bb-02bc,U+02c6,U+02da,U+02dc,U+0304,U+0308,U+0329,U+2000-206f,U+2074,U+20ac,U+2122,U+2191,U+2193,U+2212,U+2215,U+feff,U+fffd}@keyframes _toggle-navigation-menu_1n4dx_1{0%{max-height:0;opacity:0}to{max-height:700px;opacity:1}}@keyframes _alert-slide-bottom_1uhb6_1{0%{transform:translateY(2000px)}to{transform:translateY(0)}}@supports (gap:20px) and (display:flex){._list_148vf_1{display:flex;flex-wrap:wrap}}@keyframes spin{0%{transform:rotate(0)}to{transform:rotate(1turn)}}@keyframes zoomIn{0%{opacity:0;transform:scale3d(.3,.3,.3)}50%{opacity:1}}@keyframes zoomOut{0%{opacity:1}50%{opacity:0;transform:scale3d(.3,.3,.3)}to{opacity:0}}
/* assets/style-Bp0n0o_6.css */
@keyframes _bblFadInOut_10462_1{0%,80%,to{box-shadow:0 2.5em 0 -1.3em}40%{box-shadow:0 2.5em}}@font-face{font-display:swap;font-family:Manrope;font-style:normal;font-weight:400 700;src:url(/dist/web/assets/manrope-4qdASHmp.woff2) format("woff2");unicode-range:U+0301,U+0400-045f,U+0490-0491,U+04b0-04b1,U+2116}@font-face{font-display:swap;font-family:Manrope;font-style:normal;font-weight:400 700;src:url(/dist/web/assets/manrope-4qdASHmp.woff2) format("woff2");unicode-range:U+0102-0103,U+0110-0111,U+0128-0129,U+0168-0169,U+01a0-01a1,U+01af-01b0,U+0300-0301,U+0303-0304,U+0308-0309,U+0323,U+0329,U+1ea0-1ef9,U+20ab}@font-face{font-display:swap;font-family:Manrope;font-style:normal;font-weight:400 700;src:url(/dist/web/assets/manrope-4qdASHmp.woff2) format("woff2");unicode-range:U+0100-02af,U+0304,U+0308,U+0329,U+1e00-1e9f,U+1ef2-1eff,U+2020,U+20a0-20ab,U+20ad-20cf,U+2113,U+2c60-2c7f,U+a720-a7ff}@font-face{font-display:swap;font-family:Manrope;font-style:normal;font-weight:400 700;src:url(/dist/web/assets/manrope-4qdASHmp.woff2) format("woff2");unicode-range:U+00??,U+0131,U+0152-0153,U+02bb-02bc,U+02c6,U+02da,U+02dc,U+0304,U+0308,U+0329,U+2000-206f,U+2074,U+20ac,U+2122,U+2191,U+2193,U+2212,U+2215,U+feff,U+fffd}@keyframes _toggle-navigation-menu_1n4dx_1{0%{max-height:0;opacity:0}to{max-height:700px;opacity:1}}@keyframes _alert-slide-bottom_1uhb6_1{0%{transform:translateY(2000px)}to{transform:translateY(0)}}@supports (gap:20px) and (display:flex){._list_148vf_1{display:flex;flex-wrap:wrap}}@keyframes spin{0%{transform:rotate(0)}to{transform:rotate(1turn)}}@keyframes zoomIn{0%{opacity:0;transform:scale3d(.3,.3,.3)}50%{opacity:1}}@keyframes zoomOut{0%{opacity:1}50%{opacity:0;transform:scale3d(.3,.3,.3)}to{opacity:0}}
/* assets/style-C_lehBcC.css */
@keyframes spin{0%{transform:rotate(0)}to{transform:rotate(1turn)}}@keyframes zoomIn{0%{opacity:0;transform:scale3d(.3,.3,.3)}50%{opacity:1}}@keyframes zoomOut{0%{opacity:1}50%{opacity:0;transform:scale3d(.3,.3,.3)}to{opacity:0}}
/* assets/style-hxXoFv9F.css */
@keyframes spin{0%{transform:rotate(0)}to{transform:rotate(1turn)}}@keyframes zoomIn{0%{opacity:0;transform:scale3d(.3,.3,.3)}50%{opacity:1}}@keyframes zoomOut{0%{opacity:1}50%{opacity:0;transform:scale3d(.3,.3,.3)}to{opacity:0}}
/* assets/swiper-CwacYJ_s.css */
:root { --swiper-theme-color: #007aff; }:host { display: block;margin-left: auto;margin-right: auto;position: relative;z-index: 1; }@font-face{font-family:swiper-icons;font-style:normal;font-weight:400;src:url(data:application/font-woff;charset=utf-8;base64,\ d09GRgABAAAAAAZgABAAAAAADAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAABGRlRNAAAGRAAAABoAAAAci6qHkUdERUYAAAWgAAAAIwAAACQAYABXR1BPUwAABhQAAAAuAAAANuAY7+xHU1VCAAAFxAAAAFAAAABm2fPczU9TLzIAAAHcAAAASgAAAGBP9V5RY21hcAAAAkQAAACIAAABYt6F0cBjdnQgAAACzAAAAAQAAAAEABEBRGdhc3AAAAWYAAAACAAAAAj//wADZ2x5ZgAAAywAAADMAAAD2MHtryVoZWFkAAABbAAAADAAAAA2E2+eoWhoZWEAAAGcAAAAHwAAACQC9gDzaG10eAAAAigAAAAZAAAArgJkABFsb2NhAAAC0AAAAFoAAABaFQAUGG1heHAAAAG8AAAAHwAAACAAcABAbmFtZQAAA/gAAAE5AAACXvFdBwlwb3N0AAAFNAAAAGIAAACE5s74hXjaY2BkYGAAYpf5Hu/j+W2+MnAzMYDAzaX6QjD6/4//Bxj5GA8AuRwMYGkAPywL13jaY2BkYGA88P8Agx4j+/8fQDYfA1AEBWgDAIB2BOoAeNpjYGRgYNBh4GdgYgABEMnIABJzYNADCQAACWgAsQB42mNgYfzCOIGBlYGB0YcxjYGBwR1Kf2WQZGhhYGBiYGVmgAFGBiQQkOaawtDAoMBQxXjg/wEGPcYDDA4wNUA2CCgwsAAAO4EL6gAAeNpj2M0gyAACqxgGNWBkZ2D4/wMA+xkDdgAAAHjaY2BgYGaAYBkGRgYQiAHyGMF8FgYHIM3DwMHABGQrMOgyWDLEM1T9/w8UBfEMgLzE////P/5//f/V/xv+r4eaAAeMbAxwIUYmIMHEgKYAYjUcsDAwsLKxc3BycfPw8jEQA/gZBASFhEVExcQlJKWkZWTl5BUUlZRVVNXUNTQZBgMAAMR+E+gAEQFEAAAAKgAqACoANAA+AEgAUgBcAGYAcAB6AIQAjgCYAKIArAC2AMAAygDUAN4A6ADyAPwBBgEQARoBJAEuATgBQgFMAVYBYAFqAXQBfgGIAZIBnAGmAbIBzgHsAAB42u2NMQ6CUAyGW568x9AneYYgm4MJbhKFaExIOAVX8ApewSt4Bic4AfeAid3VOBixDxfPYEza5O+Xfi04YADggiUIULCuEJK8VhO4bSvpdnktHI5QCYtdi2sl8ZnXaHlqUrNKzdKcT8cjlq+rwZSvIVczNiezsfnP/uznmfPFBNODM2K7MTQ45YEAZqGP81AmGGcF3iPqOop0r1SPTaTbVkfUe4HXj97wYE+yNwWYxwWu4v1ugWHgo3S1XdZEVqWM7ET0cfnLGxWfkgR42o2PvWrDMBSFj/IHLaF0zKjRgdiVMwScNRAoWUoH78Y2icB/yIY09An6AH2Bdu/UB+yxopYshQiEvnvu0dURgDt8QeC8PDw7Fpji3fEA4z/PEJ6YOB5hKh4dj3EvXhxPqH/SKUY3rJ7srZ4FZnh1PMAtPhwP6fl2PMJMPDgeQ4rY8YT6Gzao0eAEA409DuggmTnFnOcSCiEiLMgxCiTI6Cq5DZUd3Qmp10vO0LaLTd2cjN4fOumlc7lUYbSQcZFkutRG7g6JKZKy0RmdLY680CDnEJ+UMkpFFe1RN7nxdVpXrC4aTtnaurOnYercZg2YVmLN/d/gczfEimrE/fs/bOuq29Zmn8tloORaXgZgGa78yO9/cnXm2BpaGvq25Dv9S4E9+5SIc9PqupJKhYFSSl47+Qcr1mYNAAAAeNptw0cKwkAAAMDZJA8Q7OUJvkLsPfZ6zFVERPy8qHh2YER+3i/BP83vIBLLySsoKimrqKqpa2hp6+jq6RsYGhmbmJqZSy0sraxtbO3sHRydnEMU4uR6yx7JJXveP7WrDycAAAAAAAH//wACeNpjYGRgYOABYhkgZgJCZgZNBkYGLQZtIJsFLMYAAAw3ALgAeNolizEKgDAQBCchRbC2sFER0YD6qVQiBCv/H9ezGI6Z5XBAw8CBK/m5iQQVauVbXLnOrMZv2oLdKFa8Pjuru2hJzGabmOSLzNMzvutpB3N42mNgZGBg4GKQYzBhYMxJLMlj4GBgAYow/P/PAJJhLM6sSoWKfWCAAwDAjgbRAAB42mNgYGBkAIIbCZo5IPrmUn0hGA0AO8EFTQAA)}@keyframes swiper-preloader-spin{0%{transform:rotate(0)}to{transform:rotate(1turn)}}
/* assets/ApiClients-DUxsAy79.css */
._list_1pb95_1 { --api-clients-gap: 5px;--api-clients-padding: 7px 10px;align-items: center;display: flex;flex-wrap: wrap;list-style: none;margin: 0;margin-bottom: calc(var(--api-clients-gap)*-1);margin-right: calc(var(--api-clients-gap)*-1);padding: 0; }._listItem_1pb95_17 { margin-bottom: var(--api-clients-gap);margin-right: var(--api-clients-gap); }._listItem_1pb95_17 ._link_1pb95_22 { background-color: #f6f7f9;border-radius: 10px;display: flex;font-size: 16px;font-weight: 700;line-height: 1;padding: var(--api-clients-padding); }@media (min-width:71.375em) {._list_1pb95_1 { --api-clients-gap: 10px;--api-clients-padding: 10px; }._listCompact_1pb95_38 { --api-clients-gap: 5px;--api-clients-padding: 7px 10px; }}
/* assets/ApiDocsScrollBtn-BYcXj3yt.css */
._scrollBtn_mgllk_1 { align-items: center;background-color: var(--primary-color);border: 0;border-radius: 4px;bottom: 20px;color: #fff;cursor: pointer;display: flex;flex-direction: column;font-size: 12px;font-weight: 600;height: 50px;justify-content: center;line-height: 20px;opacity: 0;padding: 0;position: fixed;right: 20px;transform: translateY(300px);transition: all .38s ease;width: 50px;z-index: 2; }._scrollBtnIcon_mgllk_31 { font-size: 14px;margin-bottom: 5px; }@media (min-width:71.375em) {._scrollBtn_mgllk_1 { background-color: #fff;color: var(--primary-color); }}
/* assets/ApiDocsScrollBtn-DqAF9syE.css */

/* assets/ArticleForm-DG0eaRor.css */
.md-editor .md-editor-preview { --md-theme-color: var(--md-color);--md-theme-color-reverse: #eee;--md-theme-color-hover: #eee;--md-theme-color-hover-inset: #ddd;--md-theme-link-color: #2d8cf0;--md-theme-link-hover-color: #73d13d;--md-theme-border-color: #e6e6e6;--md-theme-border-color-reverse: #bebebe;--md-theme-border-color-inset: #d6d6d6;--md-theme-bg-color: #fff;--md-theme-bg-color-inset: #ececec;--md-theme-bg-color-scrollbar-track: #e2e2e2;--md-theme-bg-color-scrollbar-thumb: rgba(0,0,0,.302);--md-theme-bg-color-scrollbar-thumb-hover: rgba(0,0,0,.349);--md-theme-bg-color-scrollbar-thumb-active: rgba(0,0,0,.38);--md-theme-code-copy-tips-color: inherit;--md-theme-code-copy-tips-bg-color: #fff;--md-theme-code-active-color: #61aeee; }.md-editor-scrn span[rn-wrapper] { counter-reset: linenumber;font-size: 100%;left: 0;letter-spacing: -1px;pointer-events: none;position: absolute;top: 1em;-webkit-user-select: none;-moz-user-select: none;-ms-user-select: none;user-select: none;width: 3em; }.md-editor-scrn span[rn-wrapper]>span { counter-increment: linenumber;display: block;pointer-events: none; }.md-editor-scrn span[rn-wrapper]>span:before { color: #999;content: counter(linenumber);display: block;padding-right: .5em;text-align: right; }.md-editor-scrn pre code { padding-left: 3.5em !important; }.md-editor default-theme { --md-theme-table-stripe-color: #fafafa; }.md-editor div.github-theme { --md-theme-code-inline-color: inherit;--md-theme-code-inline-bg-color: #eff1f2;--md-theme-code-block-color: inherit;--md-theme-code-block-bg-color: #f6f8fa; }.github-theme code { background-color: var(--md-theme-code-inline-bg-color);border-radius: 6px;color: var(--md-theme-code-inline-color);margin: 0;padding: .2em .4em; }.github-theme pre { border-radius: 6px;position: relative; }.github-theme pre code { background-color: var(--md-theme-code-block-bg-color);color: var(--md-theme-code-block-color);letter-spacing: 1px;margin-bottom: 0;padding: 22px 1em;word-break: normal; }.github-theme pre code>* { line-height: 1.6; }.github-theme pre code span[rn-wrapper] { top: 22px; }.md-editor div.github-theme { --md-theme-heading-color: inherit;--md-theme-heading-6-color: #2d3339;--md-theme-heading-border-color: #d9dee4; }.github-theme h1,.github-theme h2,.github-theme h3,.github-theme h4,.github-theme h5,.github-theme h6 { color: var(--md-theme-heading-color);font-weight: 600;line-height: 1.25;margin-bottom: 16px;margin-top: 24px; }.github-theme h1 { font-size: 2em; }.github-theme h1,.github-theme h2 { border-bottom: 1px solid var(--md-theme-heading-border-color);padding-bottom: .3em; }.github-theme h2 { font-size: 1.5em; }.github-theme h3 { font-size: 1.25em; }.github-theme h4 { font-size: 1em; }.github-theme h5 { font-size: .875em; }.github-theme h6 { color: var(--md-theme-heading-6-color);font-size: .85em; }.md-editor div.github-theme { --md-theme-heading-bg-color: #fff; }.github-theme img { background-color: var(--md-theme-heading-bg-color);box-sizing: content-box;max-width: 100%; }.github-theme a { color: #539bf5; }.github-theme a:hover { text-decoration: underline; }.github-theme ol li+li,.github-theme ul li+li { margin-top: .25em; }.github-theme p:empty { display: none; }.md-editor div.github-theme { --md-theme-quote-color: #57606a;--md-theme-quote-border-color: #d0d7de; }.github-theme blockquote { border-left: .25em solid var(--md-theme-quote-border-color);color: var(--md-theme-quote-color);padding: 0 1em; }.md-editor div.github-theme { --md-theme-table-stripe-color: #f7f8fa;--md-theme-table-tr-bg-color: #fff;--md-theme-table-tr-border-color: #d8dee4;--md-theme-table-td-border-color: #d0d7de; }.github-theme table { border-collapse: collapse;border-spacing: 0;display: block;max-width: 100%;overflow: auto; }.github-theme table tr { background-color: var(--md-theme-table-tr-bg-color);border-top: 1px solid var(--md-theme-table-tr-border-color); }.github-theme table tr td,.github-theme table tr th { border: 1px solid var(--md-theme-table-td-border-color);padding: 6px 13px; }.github-theme table tr:nth-child(2n) { background-color: var(--md-theme-table-stripe-color); }.md-editor .github-theme { --md-theme-color: #222; }.github-theme { color: var(--md-theme-color);line-height: 1.5; }.github-theme ::-webkit-scrollbar { height: 6px;width: 6px; }.github-theme ::-webkit-scrollbar-corner,.github-theme ::-webkit-scrollbar-track { background-color: var(--md-theme-bg-color-scrollbar-track);border-radius: 2px; }.github-theme ::-webkit-scrollbar-thumb { background-color: var(--md-theme-bg-color-scrollbar-thumb);border-radius: 2px; }.github-theme ::-webkit-scrollbar-button:vertical { display: none; }.github-theme ::-webkit-scrollbar-thumb:vertical:hover { background-color: var(--md-theme-bg-color-scrollbar-thumb-hover); }.github-theme ::-webkit-scrollbar-thumb:vertical:active { background-color: var(--md-theme-bg-color-scrollbar-thumb-active); }.github-theme h1,.github-theme h2,.github-theme h3,.github-theme h4,.github-theme h5,.github-theme h6 { position: relative;word-break: break-all; }.github-theme h1 a,.github-theme h1 a:hover,.github-theme h2 a,.github-theme h2 a:hover,.github-theme h3 a,.github-theme h3 a:hover,.github-theme h4 a,.github-theme h4 a:hover,.github-theme h5 a,.github-theme h5 a:hover,.github-theme h6 a,.github-theme h6 a:hover { color: inherit; }.github-theme ol>li { list-style: decimal; }.github-theme ul>li { list-style: disc; }.github-theme ol,.github-theme ul { padding-left: 2.35em; }.github-theme a { text-decoration: none; }.github-theme code,.github-theme pre { font-family: source-code-pro,Menlo,Monaco,Consolas,Courier New,monospace;font-size: 14px; }.github-theme pre { margin: 20px 0; }.github-theme pre code { display: block;line-height: 1;overflow: auto; }.github-theme pre code[language]:before { content: attr(language);font-size: 12px;line-height: 1;position: absolute;right: 40px;top: 11px;z-index: 1; }.github-theme hr { border: none;border-top: 1px solid var(--md-theme-border-color);height: 1px;margin: 10px 0; }.github-theme figure { display: inline-flex;flex-direction: column;margin: 0 0 1em;text-align: center; }.github-theme figure figcaption { color: var(--md-theme-color);font-size: .875em;margin-top: 5px; }.github-theme blockquote,.github-theme details,.github-theme dl,.github-theme ol,.github-theme p,.github-theme pre,.github-theme table,.github-theme ul { margin-bottom: 16px;margin-top: 0; }.md-editor { --md-color: #3f4a54;--md-hover-color: #000;--md-bk-color: #fff;--md-bk-color-outstand: #f6f6f6;--md-bk-hover-color: #f5f7fa;--md-border-color: #e6e6e6;--md-border-hover-color: #b9b9b9;--md-border-active-color: #999;--md-modal-mask: rgba(0,0,0,.45098);--md-scrollbar-bg-color: #e2e2e2;--md-scrollbar-thumb-color: rgba(0,0,0,.30196);--md-scrollbar-thumb-hover-color: rgba(0,0,0,.34902);--md-scrollbar-thumb-active-color: rgba(0,0,0,.38039);background-color: var(--md-bk-color);border: 1px solid var(--md-border-color);box-sizing: border-box;color: var(--md-color);display: flex;flex-direction: column;font-family: -apple-system,BlinkMacSystemFont,Segoe UI Variable,Segoe UI,system-ui,Roboto,Ubuntu,Cantarell,Noto Sans,sans-serif,ui-sans-serif,Helvetica,Arial,Apple Color Emoji,Segoe UI Emoji;height: 500px;overflow: hidden;position: relative;width: 100%; }.md-editor ::-webkit-scrollbar { height: 6px;width: 6px; }.md-editor ::-webkit-scrollbar-corner,.md-editor ::-webkit-scrollbar-track { background-color: var(--md-scrollbar-bg-color); }.md-editor ::-webkit-scrollbar-thumb { background-color: var(--md-scrollbar-thumb-color);border-radius: 2px; }.md-editor ::-webkit-scrollbar-button:vertical { display: none; }.md-editor ::-webkit-scrollbar-thumb:vertical:hover { background-color: var(--md-scrollbar-thumb-hover-color); }.md-editor ::-webkit-scrollbar-thumb:vertical:active { background-color: var(--md-scrollbar-thumb-active-color); }.md-editor-icon { fill: currentColor;display: block;height: 24px;overflow: hidden;width: 24px; }.md-editor-preview-wrapper { box-sizing: border-box;flex: 1;overflow: auto;padding: 10px 20px;position: relative; }.md-editor-preview { font-size: 16px;overflow: hidden;word-break: break-all; }.md-editor-previewOnly { border: none;height: auto; }.md-editor-previewOnly .md-editor-preview { padding: 0; }
/* assets/Basic-BOhtFLTl.css */
._languageSwitcherTrigger_1r36p_1 { --tw-border-opacity: 1;--tw-bg-opacity: 1;--tw-text-opacity: 1;background-color: rgba(17,25,35,var(--tw-bg-opacity));border-color: rgba(91,106,125,var(--tw-border-opacity));border-radius: 9999px;border-width: 1px;color: rgba(161,170,181,var(--tw-text-opacity));display: flex;font-size: 14px;line-height: 24px;padding: 5px 15px;transition-duration: .15s;transition-property: color,background-color,border-color,fill,stroke,-webkit-text-decoration-color;transition-property: color,background-color,border-color,text-decoration-color,fill,stroke;transition-property: color,background-color,border-color,text-decoration-color,fill,stroke,-webkit-text-decoration-color;transition-timing-function: cubic-bezier(.4,0,.2,1);width: 165px; }._languageSwitcherTrigger_1r36p_1:focus,._languageSwitcherTrigger_1r36p_1:hover { --tw-bg-opacity: 1;background-color: rgba(36,49,66,var(--tw-bg-opacity)); }@media (min-width:1024px) {._languageSwitcherTrigger_1r36p_1 { margin-left: auto;margin-top: auto;width: 200px; }}._languageSwitcherTrigger_1r36p_1 img { height: 20px;margin-right: 10px;width: 20px; }
/* assets/Basic-BZrhdBgf.css */

/* assets/Basic-C1yMqEtJ.css */

/* assets/Basic-C9-YtLnE.css */
._layout_1smur_1 { color: var(--dark-color);min-height: 100vh; }._layout_1smur_1,._main_1smur_8 { display: flex;flex-direction: column; }._main_1smur_8 { flex-grow: 1;padding-bottom: 30px;padding-top: 20px;position: relative; }._container_1smur_21 { display: flex;flex-direction: column;flex-grow: 1; }
/* assets/Basic-C9Un8W0A.css */

/* assets/Basic-CZZhi7mW.css */

/* assets/Basic-DUqvxMQ7.css */

/* assets/Basic-Dfl5Bv3j.css */

/* assets/Basic-Dn-k0_pH.css */

/* assets/Basic-oTAkLdG-.css */

/* assets/EnterpriseSupportDrawer-h_9qIEAb.css */
._section_1gqi2_1 { background-color: #07162d;background-image: linear-gradient(90deg,#052e64 21.12%,#07162d 79.01%);bottom: 0;color: var(--white-color);left: 0;padding: 15px;position: fixed;right: 0;z-index: 10000; }._section_1gqi2_1 ._title_1gqi2_13 { align-items: center;display: flex;font-size: 20px;font-weight: 400;line-height: 30px;margin: 0 0 10px; }._title_1gqi2_13 b { font-weight: 600; }._list_1gqi2_32 { list-style: none;margin: 0 0 15px;padding: 0; }._listItem_1gqi2_39 { display: flex;font-size: 14px;line-height: 24px; }._listItem_1gqi2_39:not(:last-child) { margin-bottom: 5px; }._listItemIcon_1gqi2_49 { flex-shrink: 0;font-size: 16px;margin-bottom: 4px;margin-right: 10px;margin-top: 4px; }._section_1gqi2_1 ._closeBtn_1gqi2_57 { font-size: 16px;position: absolute;right: 15px;top: 15px; }._section_1gqi2_1 ._actionBtn_1gqi2_64 { flex-shrink: 0;font-size: 14px;line-height: 24px;margin-right: 20px; }@media (min-width:71.375em) {._section_1gqi2_1 { padding: 15px 0; }._sectionInner_1gqi2_76 { align-items: center;display: flex; }._mainContent_1gqi2_81 { flex-grow: 1;margin-right: 40px; }._list_1gqi2_32 { align-items: center;display: flex;margin-bottom: 0; }._listItem_1gqi2_39:not(:last-child) { margin-bottom: 0;margin-right: 20px; }._section_1gqi2_1 ._closeBtn_1gqi2_57 { position: static; }}
/* assets/LanguageSwitcher-ChZ7wQW-.css */
._trigger_1eybx_5 { align-items: center;color: inherit;display: inline-flex;padding: var(--space-sm); }._languageIcon_1eybx_12 { height: 24px;margin-right: var(--space-sm);width: 24px; }
/* assets/github-theme-BHqmp2QF.css */
.github-theme { --tw-text-opacity: 1;color: rgba(51,51,51,var(--tw-text-opacity));font-size: 16px;line-height: 26px; }.github-theme blockquote,.github-theme details,.github-theme dl,.github-theme ol,.github-theme p,.github-theme pre,.github-theme table,.github-theme ul { margin-bottom: 15px;margin-top: 0; }.github-theme b { font-weight: 600; }.github-theme figure+h2 { margin-top: 0; }.github-theme h1,.github-theme h2,.github-theme h3,.github-theme h4,.github-theme h5,.github-theme h6 { font-weight: 600;margin-top: 25px; }.github-theme h2 { border-bottom-width: 0;font-size: 20px;line-height: 30px;margin-bottom: 15px;padding-bottom: 0; }@media (min-width:1024px) {.github-theme h2 { font-size: 24px;line-height: 34px; }}.github-theme img { border-radius: 10px; }
/* assets/github-theme-C6w77Wk3.css */
.github-theme h1 { border-bottom-width: 0;font-size: 30px;line-height: 40px;margin-bottom: 15px;padding-bottom: 0; }.github-theme>:last-child { margin-bottom: 0; }
/* assets/github-theme-DY4MACNq.css */
.github-theme h2 { border-bottom-width: 0;font-size: 24px;line-height: 34px;margin-bottom: 15px;padding-bottom: 0; }
/* assets/github-theme-Exd9o8pK.css */
.github-theme h1 { font-size: 30px;line-height: 40px; }
/* assets/github-theme-sMc5oAoJ.css */

/* assets/index--Q8AIcbq.css */
.icon { stroke-width: 0;stroke: currentColor;fill: currentColor;display: inline-block;height: 1em;width: 1em; }.icon-ellipsis-vertical { width: .25em; }._link_1kv8l_1 { align-items: center;color: inherit;cursor: pointer;display: inline-flex;text-decoration: none;text-underline-offset: 4px;transition: color .38s ease; }._link_1kv8l_1:focus { text-decoration: underline; }._linkEarlsGreen_1kv8l_43 { color: var(--lime-color); }._linkEarlsGreen_1kv8l_43:focus,._linkEarlsGreen_1kv8l_43:hover { color: var(--active-lime-color); }._linkPrepend_1kv8l_56 { display: flex;margin-right: 10px; }._header_tarhc_1 { font-size: 20px;font-weight: 600;line-height: 30px;margin: 0; }._button_1cbf7_1 { align-items: center;background-color: transparent;border: 0;box-sizing: border-box;cursor: pointer;display: inline-flex;font: inherit;justify-content: center;min-width: 100px;padding: 0;text-align: center;transition: background-color .38s ease,color .38s ease,box-shadow .38s ease,border-color .38s ease; }._button_1cbf7_1:disabled,._button_1cbf7_1[data-disabled=true] { cursor: not-allowed; }._buttonMd_1cbf7_30 { min-height: 40px;padding: 5px 20px; }._buttonPrimary_1cbf7_40 { background-color: var(--primary-color);border-color: var(--primary-color);border-radius: 5px;color: #fff; }._buttonPrimary_1cbf7_40:focus,._buttonPrimary_1cbf7_40:hover { background-color: var(--active-primary-color);border-color: var(--active-primary-color); }._buttonPrimary_1cbf7_40:disabled,._buttonPrimary_1cbf7_40:disabled:focus,._buttonPrimary_1cbf7_40:disabled:hover { background-color: var(--primary-color);border-color: var(--primary-color);opacity: .5; }._buttonPrimaryEarlsGreen_1cbf7_79 { background-color: var(--lime-color);border-radius: 5px;color: var(--dark-color); }._buttonPrimaryEarlsGreen_1cbf7_79:focus,._buttonPrimaryEarlsGreen_1cbf7_79:hover { background-color: var(--active-lime-color);color: var(--dark-color); }._buttonPrimaryEarlsGreen_1cbf7_79:disabled,._buttonPrimaryEarlsGreen_1cbf7_79:disabled:focus,._buttonPrimaryEarlsGreen_1cbf7_79:disabled:hover { background-color: #e1eaf6;color: var(--gray-color); }._buttonSecondaryWhite_1cbf7_165 { background-color: transparent;border-radius: 5px;box-shadow: inset 0 0 0 1px currentColor;color: var(--white-color); }._buttonService_1cbf7_186 { border: 0;border-radius: 0;color: inherit;display: inline-flex;font: inherit;line-height: 1;min-height: 0;min-width: 0;padding: 0; }.container { width: 100%; }@media (min-width:640px) {.container { max-width: 640px; }}@media (min-width:768px) {.container { max-width: 768px; }}@media (min-width:1024px) {.container { max-width: 1024px; }}@media (min-width:1280px) {.container { max-width: 1280px; }}@media (min-width:1536px) {.container { max-width: 1536px; }}.container { margin-left: auto;margin-right: auto;max-width: 100%;padding-left: 5px;padding-right: 5px;width: 100%; }@media (min-width:1024px) {.container { max-width: 1140px;padding-left: 15px;padding-right: 15px; }}.sr-only { clip: rect(0,0,0,0);border-width: 0;height: 1px;margin: -1px;overflow: hidden;padding: 0;position: absolute;white-space: nowrap;width: 1px; }.invisible { visibility: hidden; }.fixed { position: fixed; }.absolute { position: absolute; }.relative { position: relative; }.-left-10 { left: -10px; }.bottom-0 { bottom: 0; }.bottom-5 { bottom: 5px; }.left-0 { left: 0; }.right-0 { right: 0; }.right-15 { right: 15px; }.top-0 { top: 0; }.top-20 { top: 20px; }.top-5 { top: 5px; }.top-full { top: 100%; }.-z-10 { z-index: -10; }.z-10 { z-index: 10; }.-order-1 { order: -1; }.order-3 { order: 3; }.row-span-1 { grid-row: span 1/span 1; }.row-span-2 { grid-row: span 2/span 2; }.row-span-3 { grid-row: span 3/span 3; }.-mx-10 { margin-left: -10px;margin-right: -10px; }.-mx-15 { margin-left: -15px;margin-right: -15px; }.-mx-20 { margin-left: -20px;margin-right: -20px; }.mx-auto { margin-left: auto;margin-right: auto; }.mb-10 { margin-bottom: 10px; }.mb-15 { margin-bottom: 15px; }.mb-20 { margin-bottom: 20px; }.mb-25 { margin-bottom: 25px; }.mb-30 { margin-bottom: 30px; }.mb-35 { margin-bottom: 35px; }.mb-40 { margin-bottom: 40px; }.mb-5 { margin-bottom: 5px; }.ml-auto { margin-left: auto; }.mr-10 { margin-right: 10px; }.mr-15 { margin-right: 15px; }.mr-20 { margin-right: 20px; }.mr-40 { margin-right: 40px; }.mr-auto { margin-right: auto; }.mt-10 { margin-top: 10px; }.mt-20 { margin-top: 20px; }.block { display: block; }.flex { display: flex; }.inline-flex { display: inline-flex; }.grid { display: grid; }.hidden { display: none; }.size-40 { height: 40px;width: 40px; }.h-10 { height: 10px; }.h-auto { height: auto; }.h-full { height: 100%; }.h-px { height: 1px; }.min-h-64 { min-height: 16rem; }.w-5 { width: 5px; }.w-full { width: 100%; }.w-px { width: 1px; }.min-w-0 { min-width: 0; }.max-w-full { max-width: 100%; }.flex-shrink-0 { flex-shrink: 0; }.flex-grow { flex-grow: 1; }.select-none { -webkit-user-select: none;-moz-user-select: none;-ms-user-select: none;user-select: none; }.grid-cols-1 { grid-template-columns: repeat(1,minmax(0,1fr)); }.grid-cols-2 { grid-template-columns: repeat(2,minmax(0,1fr)); }.grid-cols-4 { grid-template-columns: repeat(4,minmax(0,1fr)); }.grid-cols-5 { grid-template-columns: repeat(5,minmax(0,1fr)); }.flex-col { flex-direction: column; }.flex-wrap { flex-wrap: wrap; }.items-center { align-items: center; }.justify-center { justify-content: center; }.gap-10 { gap: 10px; }.gap-15 { gap: 15px; }.gap-20 { gap: 20px; }.gap-x-15 { -moz-column-gap: 15px;column-gap: 15px; }.gap-y-10 { row-gap: 10px; }.gap-y-25 { row-gap: 25px; }.overflow-hidden { overflow: hidden; }.overflow-y-auto { overflow-y: auto; }.rounded-10 { border-radius: 10px; }.rounded-5 { border-radius: 5px; }.rounded-full { border-radius: 9999px; }.border { border-width: 1px; }.border-2 { border-width: 2px; }.border-x { border-left-width: 1px;border-right-width: 1px; }.border-r { border-right-width: 1px; }.border-frost-gray { --tw-border-opacity: 1;border-color: rgba(222,227,237,var(--tw-border-opacity)); }.bg-charcoal-blue { --tw-bg-opacity: 1;background-color: rgba(17,25,35,var(--tw-bg-opacity)); }.bg-cool-gray { --tw-bg-opacity: 1;background-color: rgba(248,249,251,var(--tw-bg-opacity)); }.bg-frost-gray { --tw-bg-opacity: 1;background-color: rgba(222,227,237,var(--tw-bg-opacity)); }.bg-midnight-blue { --tw-bg-opacity: 1;background-color: rgba(36,49,66,var(--tw-bg-opacity)); }.bg-silver-blue { --tw-bg-opacity: 1;background-color: rgba(161,170,181,var(--tw-bg-opacity)); }.bg-steel-gray { --tw-bg-opacity: 1;background-color: rgba(91,106,125,var(--tw-bg-opacity)); }.bg-teal { --tw-bg-opacity: 1;background-color: rgba(0,161,179,var(--tw-bg-opacity)); }.bg-teal-dark { --tw-bg-opacity: 1;background-color: rgba(0,138,154,var(--tw-bg-opacity)); }.bg-transparent { background-color: transparent; }.bg-white { --tw-bg-opacity: 1;background-color: rgba(255,255,255,var(--tw-bg-opacity)); }.bg-opacity-50 { --tw-bg-opacity: .5; }.p-10 { padding: 10px; }.px-0 { padding-left: 0;padding-right: 0; }.px-10 { padding-left: 10px;padding-right: 10px; }.px-15 { padding-left: 15px;padding-right: 15px; }.px-20 { padding-left: 20px;padding-right: 20px; }.px-30 { padding-left: 30px;padding-right: 30px; }.py-10 { padding-bottom: 10px;padding-top: 10px; }.py-15 { padding-bottom: 15px;padding-top: 15px; }.py-20 { padding-bottom: 20px;padding-top: 20px; }.py-25 { padding-bottom: 25px;padding-top: 25px; }.py-5 { padding-bottom: 5px;padding-top: 5px; }.py-px { padding-bottom: 1px;padding-top: 1px; }.pb-10 { padding-bottom: 10px; }.pb-20 { padding-bottom: 20px; }.pb-25 { padding-bottom: 25px; }.pl-10 { padding-left: 10px; }.pl-20 { padding-left: 20px; }.pr-15 { padding-right: 15px; }.pt-15 { padding-top: 15px; }.pt-25 { padding-top: 25px; }.pt-5 { padding-top: 5px; }.text-center { text-align: center; }.text-base { font-size: 16px;line-height: 26px; }.text-sm { font-size: 14px;line-height: 24px; }.font-medium { font-weight: 500; }.font-semibold { font-weight: 600; }.uppercase { text-transform: uppercase; }.leading-none { line-height: 1; }.tracking-widest { letter-spacing: .1em; }.text-charcoal-blue { --tw-text-opacity: 1;color: rgba(17,25,35,var(--tw-text-opacity)); }.text-dark { --tw-text-opacity: 1;color: rgba(51,51,51,var(--tw-text-opacity)); }.text-earls-green { --tw-text-opacity: 1;color: rgba(203,228,23,var(--tw-text-opacity)); }.text-silver-blue { --tw-text-opacity: 1;color: rgba(161,170,181,var(--tw-text-opacity)); }.text-steel-gray { --tw-text-opacity: 1;color: rgba(91,106,125,var(--tw-text-opacity)); }.text-white { --tw-text-opacity: 1;color: rgba(255,255,255,var(--tw-text-opacity)); }.opacity-0 { opacity: 0; }.transition-colors { transition-duration: .15s;transition-property: color,background-color,border-color,fill,stroke,-webkit-text-decoration-color;transition-property: color,background-color,border-color,text-decoration-color,fill,stroke;transition-property: color,background-color,border-color,text-decoration-color,fill,stroke,-webkit-text-decoration-color;transition-timing-function: cubic-bezier(.4,0,.2,1); }.transition-opacity { transition-duration: .15s;transition-property: opacity;transition-timing-function: cubic-bezier(.4,0,.2,1); }.scrollbar-hide::-webkit-scrollbar { display: none; }.scrollbar-hide { -ms-overflow-style: none;scrollbar-width: none; }.app-level-notifications { bottom: 10px;display: flex;flex-direction: column;left: 10px;position: fixed;right: 10px;z-index: 1; }@media (min-width:48em) {.app-level-notifications { width: 360px; }}.visually-hidden:not(:focus):not(:active),input[type=checkbox].visually-hidden,input[type=file].visually-hidden,input[type=radio].visually-hidden { clip: rect(0 0 0 0);border: 0;clip-path: inset(100%);height: 1px;margin: -1px;overflow: hidden;padding: 0;position: absolute;white-space: nowrap;width: 1px; }.md-editor { font-family: var(--base-font-family) !important; }.md-editor-preview-wrapper { padding: 0 !important; }.md-editor-preview { word-break: normal !important; }.github-theme a { text-decoration-thickness: 1px;text-underline-offset: 4px; }.github-theme pre code { letter-spacing: 0 !important; }.github-theme h1,.github-theme h2,.github-theme h3,.github-theme h4,.github-theme h5,.github-theme h6 { word-break: normal !important; }.\[\&\.active\]\:border-teal.active { --tw-border-opacity: 1;border-color: rgba(0,161,179,var(--tw-border-opacity)); }.\[\&\.active\]\:border-teal-dark.active { --tw-border-opacity: 1;border-color: rgba(0,138,154,var(--tw-border-opacity)); }.\[\&\.active\]\:bg-cloud-blue.active { --tw-bg-opacity: 1;background-color: rgba(225,234,246,var(--tw-bg-opacity)); }.\[\&\.active\]\:bg-cool-gray.active { --tw-bg-opacity: 1;background-color: rgba(248,249,251,var(--tw-bg-opacity)); }.\[\&\.active\]\:bg-midnight-blue.active { --tw-bg-opacity: 1;background-color: rgba(36,49,66,var(--tw-bg-opacity)); }.\[\&\.active\]\:bg-steel-gray.active { --tw-bg-opacity: 1;background-color: rgba(91,106,125,var(--tw-bg-opacity)); }.\[\&\.active\]\:bg-teal.active { --tw-bg-opacity: 1;background-color: rgba(0,161,179,var(--tw-bg-opacity)); }.\[\&\.active\]\:font-semibold.active { font-weight: 600; }.\[\&\.active\]\:text-dark.active { --tw-text-opacity: 1;color: rgba(51,51,51,var(--tw-text-opacity)); }.\[\&\.active\]\:text-steel-gray.active { --tw-text-opacity: 1;color: rgba(91,106,125,var(--tw-text-opacity)); }.\[\&\.active\]\:text-teal-dark.active { --tw-text-opacity: 1;color: rgba(0,138,154,var(--tw-text-opacity)); }.\[\&\.active\]\:text-white.active { --tw-text-opacity: 1;color: rgba(255,255,255,var(--tw-text-opacity)); }.\[\&_td\]\:\!text-left td,.\[\&_th\]\:\!text-left th { text-align: left !important; }
/* assets/index-0J74gybP.css */

/* assets/index-3tQiy-gP.css */

/* assets/index-4AgQoXao.css */
.\[\&\.active\]\:border-\[\#1B2533\].active { --tw-border-opacity: 1;border-color: rgba(27,37,51,var(--tw-border-opacity)); }.\[\&\.active\]\:bg-\[\#1B2533\].active { --tw-bg-opacity: 1;background-color: rgba(27,37,51,var(--tw-bg-opacity)); }
/* assets/index-546EsbSM.css */
.md-editor { font-family: Manrope,system-ui,-apple-system,Segoe UI,Roboto,Ubuntu,Cantarell,Noto Sans,sans-serif !important;font-family: var(--base-font-family) !important; }
/* assets/index-7Jz6n718.css */

/* assets/index-B-XL1wAn.css */
.container { margin-left: auto;margin-right: auto;padding-left: 5px;padding-right: 5px;width: 100%; }@media (min-width:71.375em) {.container { max-width: 1140px;padding-left: 15px;padding-right: 15px; }}
/* assets/index-B0QkhgUC.css */

/* assets/index-B2w57OH0.css */

/* assets/index-B4JZEBtg.css */

/* assets/index-B5nI_vbm.css */

/* assets/index-B7-LO6iJ.css */

/* assets/index-B9fHm1nc.css */

/* assets/index-BBTIf5xN.css */

/* assets/index-BBmxDE47.css */

/* assets/index-BE66GmQt.css */

/* assets/index-BGgzpeAw.css */

/* assets/index-BJTlQgcF.css */

/* assets/index-BLo94ir2.css */

/* assets/index-BOVncjYP.css */

/* assets/index-BQYEp-sp.css */

/* assets/index-BSTnJEVu.css */

/* assets/index-BSnswDJe.css */

/* assets/index-BUxzORHG.css */

/* assets/index-BbWInn_l.css */

/* assets/index-Bf285RMu.css */

/* assets/index-BjBNSuEU.css */

/* assets/index-BlLabP0z.css */

/* assets/index-BnLBrBxP.css */

/* assets/index-Bty0efa7.css */

/* assets/index-C3P8wlmg.css */

/* assets/index-C52mPH5S.css */

/* assets/index-C8eALSqJ.css */

/* assets/index-CAiW7JS5.css */

/* assets/index-CBztbBIg.css */

/* assets/index-CGFIIWzn.css */

/* assets/index-CHXydIDZ.css */
._section_1m9bc_1 { background-color: var(--alice-blue-color);border-radius: 4px;color: var(--night-rider-color);font-size: 14px;line-height: 24px;margin-bottom: 25px;padding: 20px 15px;position: relative; }._title_1m9bc_12 { font-size: 16px;font-weight: 600;line-height: 30px;margin: 0 0 5px; }._text_1m9bc_20 { margin: 0 0 15px; }._section_1m9bc_1 ._action_1m9bc_25 { line-height: 16px;min-width: 145px;padding: 10px 15px; }._img_1m9bc_31 { margin: 0 auto 10px;width: 285px; }._close_1m9bc_36 { background-color: transparent;border: 0;color: #646464;cursor: pointer;display: block;font-size: 12px;height: 12px;line-height: 1;padding: 0;position: absolute;right: 15px;top: 15px;width: 12px; }@media (min-width:71.375em) {._section_1m9bc_1 { align-items: flex-start;display: flex;padding: 10px 50px 10px 20px; }._textContent_1m9bc_59 { margin-right: 50px; }._img_1m9bc_31 { margin: 0;order: 1; }._close_1m9bc_36 { right: 20px;top: 20px; }}._markup_15n71_1 .md-editor-preview { font-size: 16px;line-height: 30px; }._markup_15n71_1 .md-editor-preview>:first-child { margin-top: 0; }._markup_15n71_1 table { font-size: 14px;line-height: 24px; }._markup_15n71_1 [data-component=TabList] { display: flex;flex-wrap: wrap;list-style: none;margin: 0;padding: 0; }._markup_15n71_1 [data-component=TabList] li { list-style: none;margin: 0 5px 5px 0; }._markup_15n71_1 [data-component=Tab] { align-items: center;background-color: #f6f8fa;border-radius: 10px;color: var(--night-rider-color);display: flex;font-size: 14px;line-height: 1;padding: 10px;text-align: center; }._markup_15n71_1 [data-component=Tab][aria-selected=true] { background-color: var(--night-rider-color);color: #fff; }
/* assets/index-CMHofGZN.css */

/* assets/index-CMaM1jig.css */

/* assets/index-COR7VHhc.css */

/* assets/index-CQ2Y2pPY.css */

/* assets/index-CSOkTFBJ.css */
.grid { display: grid;grid-template-columns: repeat(12,[col-start] 1fr); }
/* assets/index-CU0E52kI.css */

/* assets/index-CYtALZxt.css */

/* assets/index-CZnXAR8I.css */

/* assets/index-CaHX2IaR.css */

/* assets/index-Cc1yvdmo.css */

/* assets/index-CcPpOIHz.css */

/* assets/index-CeW1jGok.css */

/* assets/index-CgSBgN4I.css */

/* assets/index-ChU_Yk3Q.css */

/* assets/index-CjC8Sq89.css */

/* assets/index-Ckscx06k.css */

/* assets/index-CwYSfGIC.css */

/* assets/index-CygN-aWi.css */

/* assets/index-Czpp6AhZ.css */

/* assets/index-D0StjUy9.css */

/* assets/index-D5fCEgd-.css */

/* assets/index-D7aJhLWE.css */

/* assets/index-DBI8FLQ5.css */

/* assets/index-DBr0pQ9G.css */

/* assets/index-DBxkXMX_.css */

/* assets/index-DF_UKH3p.css */

/* assets/index-DI33FrZX.css */

/* assets/index-DM4PBttb.css */

/* assets/index-DNzKTe3K.css */

/* assets/index-DOizIgT7.css */

/* assets/index-DQs0k2s9.css */

/* assets/index-DY4MACNq.css */

/* assets/index-DY9Z0mnx.css */

/* assets/index-DdFFhobj.css */

/* assets/index-DfDq3_uS.css */

/* assets/index-DhfVs5KY.css */

/* assets/index-DmUiVjWR.css */

/* assets/index-DnRgEPwd.css */

/* assets/index-DnuGABcB.css */

/* assets/index-Dr9kD5Xg.css */

/* assets/index-Ds1vV4oM.css */

/* assets/index-Dwp7xsiS.css */

/* assets/index-DxOJwnYZ.css */

/* assets/index-Dyi8VjxG.css */

/* assets/index-Gi4Y8CST.css */

/* assets/index-HiBAUp8q.css */

/* assets/index-IgU-G2hi.css */

/* assets/index-MJ__H5dY.css */

/* assets/index-N9qyfwZ2.css */

/* assets/index-NY_piYm3.css */

/* assets/index-PN3aE1yf.css */

/* assets/index-QgxHhAcP.css */

/* assets/index-Tu1KS_La.css */

/* assets/index-VupVPIGv.css */

/* assets/index-XAIe3Ip5.css */

/* assets/index-Xdchy0Tc.css */

/* assets/index-dO2zsjkN.css */

/* assets/index-iIvVVh1Y.css */

/* assets/index-jB9GYJ6e.css */

/* assets/index-k1-MyS6w.css */

/* assets/index-kD-AzwaY.css */

/* assets/index-kq1FmTsW.css */

/* assets/index-kubnjski.css */

/* assets/index-n87Eyx--.css */

/* assets/index-pW4tkP38.css */

/* assets/index-ppfGiAl1.css */

/* assets/index-rL5DnwYl.css */

/* assets/index-sAxC70XE.css */

/* assets/index-uibHYZhK.css */

/* assets/index-vF7ueyNY.css */

/* assets/index-vZBqRtgC.css */

/* assets/index-vmo5UNM0.css */

/* assets/index-zVBwMjNn.css */

/* assets/index-zfjX3cqB.css */

/* assets/preview-Blj0H2NZ.css */
.md-editor .md-editor-preview { --md-theme-color: var(--md-color);--md-theme-color-reverse: #eee;--md-theme-color-hover: #eee;--md-theme-color-hover-inset: #ddd;--md-theme-link-color: #2d8cf0;--md-theme-link-hover-color: #73d13d;--md-theme-border-color: #e6e6e6;--md-theme-border-color-reverse: #bebebe;--md-theme-border-color-inset: #d6d6d6;--md-theme-bg-color: #fff;--md-theme-bg-color-inset: #ececec;--md-theme-code-copy-tips-color: inherit;--md-theme-code-copy-tips-bg-color: #fff;--md-theme-code-active-color: #61aeee;--md-theme-radius-s: 2px;--md-theme-radius-m: 5px; }.md-editor-preview [class=md-editor-mermaid][data-grab] { cursor: grab; }.md-editor-preview [class=md-editor-mermaid][data-grab]:active { cursor: grabbing; }.md-editor-preview [class=md-editor-mermaid][data-processed] { align-items: center;display: flex;justify-content: center;position: relative; }.md-editor-preview [class=md-editor-mermaid][data-processed] svg { transform-origin: top left; }.md-editor .md-editor-preview { --md-theme-code-inline-color: #3594f7;--md-theme-code-inline-bg-color: rgba(59,170,250,.1);--md-theme-code-inline-radius: var(--md-theme-radius-s);--md-theme-code-block-color: #a9b7c6;--md-theme-code-block-bg-color: #282c34;--md-theme-code-before-bg-color: var(--md-theme-code-block-bg-color);--md-theme-code-block-radius: var(--md-theme-radius-m); }.md-editor-preview code { background-color: var(--md-theme-code-inline-bg-color);border-radius: var(--md-theme-code-inline-radius);color: var(--md-theme-code-inline-color);line-height: 22px;padding: 2px 4px; }.md-editor-preview .md-editor-code { color: var(--md-theme-code-block-color);font-size: 12px;line-height: 1;margin: 20px 0;position: relative; }.md-editor-preview .md-editor-code input[type=radio],.md-editor-preview .md-editor-code input[type=radio]+pre,.md-editor-preview .md-editor-code input[type=radio]+span.md-editor-code-lang { display: none; }.md-editor-preview .md-editor-code input:checked+pre,.md-editor-preview .md-editor-code input:checked+span.md-editor-code-lang { display: block; }.md-editor-preview .md-editor-code input:checked+label { border-bottom: 1px solid;color: var(--md-theme-code-active-color); }.md-editor-preview .md-editor-code .md-editor-code-head { -webkit-tap-highlight-color: rgba(0,0,0,0);background-color: var(--md-theme-code-before-bg-color);border-top-left-radius: var(--md-theme-code-block-radius);border-top-right-radius: var(--md-theme-code-block-radius);display: grid;font-size: 12px;grid-template: "1fr 1fr";height: 32px;justify-content: space-between;list-style: none;margin-bottom: 0;position: sticky;top: 0;width: 100%;z-index: 10000; }.md-editor-preview .md-editor-code .md-editor-code-head::-webkit-details-marker { display: none; }.md-editor-preview .md-editor-code .md-editor-code-head .md-editor-code-flag { margin-left: 12px; }.md-editor-preview .md-editor-code .md-editor-code-head .md-editor-code-flag span { border-radius: 50%;display: inline-block;height: 10px;margin-top: 11px;width: 10px; }.md-editor-preview .md-editor-code .md-editor-code-head .md-editor-code-flag span:first-of-type { background-color: #ec6a5e; }.md-editor-preview .md-editor-code .md-editor-code-head .md-editor-code-flag span:nth-of-type(2) { background-color: #f4bf4f; }.md-editor-preview .md-editor-code .md-editor-code-head .md-editor-code-flag span:nth-of-type(3) { background-color: #61c554; }.md-editor-preview .md-editor-code .md-editor-code-head .md-editor-code-flag span+span { margin-left: 4px; }.md-editor-preview .md-editor-code .md-editor-code-head .md-editor-code-action { align-items: center;display: flex; }.md-editor-preview .md-editor-code .md-editor-code-head .md-editor-code-action>* { margin-right: 10px; }.md-editor-preview .md-editor-code .md-editor-code-head .md-editor-code-lang { line-height: 32px; }.md-editor-preview .md-editor-code .md-editor-code-head .md-editor-copy-button:not(data-is-icon) { cursor: pointer;line-height: 32px;position: static; }.md-editor-preview .md-editor-code .md-editor-code-head .md-editor-copy-button:not(data-is-icon) .md-editor-icon { display: inline-block;height: 15px;vertical-align: sub;width: 15px; }.md-editor-preview .md-editor-code .md-editor-code-head .md-editor-copy-button[data-is-icon] { cursor: pointer;line-height: 1;position: relative; }.md-editor-preview .md-editor-code .md-editor-code-head .md-editor-copy-button[data-is-icon] .md-editor-icon { display: inline-block;height: 15px;vertical-align: sub;width: 15px; }.md-editor-preview .md-editor-code .md-editor-code-head .md-editor-copy-button[data-is-icon]:before { background-color: var(--md-theme-code-copy-tips-bg-color);border-radius: var(--md-theme-radius-s);box-shadow: 0 0 2px rgba(0,0,0,.2);color: var(--md-theme-code-copy-tips-color);content: attr(data-tips);font-family: sans-serif;font-size: 12px;left: -10px;padding: 4px;position: absolute;text-align: center;top: 50%;transform: translate(-100%,-50%);width: -moz-max-content;width: max-content; }.md-editor-preview .md-editor-code .md-editor-code-head .md-editor-copy-button[data-is-icon]:after { border-color: transparent transparent transparent currentcolor;border-style: solid;border-width: 5px 0 5px 5px;color: var(--md-theme-code-copy-tips-bg-color);content: "";filter: drop-shadow(4px 0 2px rgba(0,0,0,.2));height: 0;left: -10px;position: absolute;top: 50%;transform: translateY(-50%);width: 0; }.md-editor-preview .md-editor-code .md-editor-code-head .md-editor-copy-button[data-is-icon]:after,.md-editor-preview .md-editor-code .md-editor-code-head .md-editor-copy-button[data-is-icon]:before { transition: .3s;visibility: hidden; }.md-editor-preview .md-editor-code .md-editor-code-head .md-editor-copy-button[data-is-icon]:hover:after,.md-editor-preview .md-editor-code .md-editor-code-head .md-editor-copy-button[data-is-icon]:hover:before { visibility: visible; }.md-editor-preview .md-editor-code .md-editor-code-head .md-editor-collapse-tips { margin-right: 12px; }.md-editor-preview .md-editor-code .md-editor-code-head .md-editor-collapse-tips .md-editor-icon { display: inline-block;font-size: 16px;height: 16px;transform: rotate(0);transition: transform .1s;vertical-align: sub;width: 16px; }.md-editor-preview .md-editor-code pre { margin: 0;position: relative; }.md-editor-preview .md-editor-code pre code { background-color: var(--md-theme-code-before-bg-color);border-bottom-left-radius: var(--md-theme-code-block-radius);border-bottom-right-radius: var(--md-theme-code-block-radius);border-top-left-radius: 0;border-top-right-radius: 0;color: var(--md-theme-code-block-color);display: block;font-family: source-code-pro,Menlo,Monaco,Consolas,Courier New,monospace;font-size: 14px;line-height: 1.6;overflow: auto;padding: 1em;position: relative; }.md-editor-preview .md-editor-code pre code .md-editor-code-block { color: var(--md-theme-code-block-color);display: inline-block;overflow: auto;vertical-align: bottom;width: 100%; }.md-editor-preview details.md-editor-code .md-editor-code-head { cursor: pointer; }.md-editor-preview details.md-editor-code:not(open) .md-editor-code-head { border-bottom-left-radius: var(--md-theme-code-block-radius);border-bottom-right-radius: var(--md-theme-code-block-radius); }.md-editor-preview details.md-editor-code[open] .md-editor-code-head { border-bottom-left-radius: 0;border-bottom-right-radius: 0; }.md-editor-preview details.md-editor-code[open] .md-editor-code-head .md-editor-collapse-tips .md-editor-icon { transform: rotate(-90deg); }.md-editor-preview figure { display: inline-flex;flex-direction: column;margin: 0 0 1em;text-align: center; }.md-editor-preview figure figcaption { color: var(--md-theme-color);font-size: .875em;margin-top: 5px; }.md-editor .md-editor-preview { --md-theme-heading-color: var(--md-theme-color);--md-theme-heading-border: none;--md-theme-heading-1-color: var(--md-theme-heading-color);--md-theme-heading-1-border: var(--md-theme-heading-border);--md-theme-heading-2-color: var(--md-theme-heading-color);--md-theme-heading-2-border: var(--md-theme-heading-border);--md-theme-heading-3-color: var(--md-theme-heading-color);--md-theme-heading-3-border: var(--md-theme-heading-border);--md-theme-heading-4-color: var(--md-theme-heading-color);--md-theme-heading-4-border: var(--md-theme-heading-border);--md-theme-heading-5-color: var(--md-theme-heading-color);--md-theme-heading-5-border: var(--md-theme-heading-border);--md-theme-heading-6-color: var(--md-theme-heading-color);--md-theme-heading-6-border: var(--md-theme-heading-border); }.md-editor-preview h1,.md-editor-preview h2,.md-editor-preview h3,.md-editor-preview h4,.md-editor-preview h5,.md-editor-preview h6 { font-weight: 700;margin: 1.4em 0 .8em;position: relative;word-break: break-all; }.md-editor-preview h1 a,.md-editor-preview h1 a:hover,.md-editor-preview h2 a,.md-editor-preview h2 a:hover,.md-editor-preview h3 a,.md-editor-preview h3 a:hover,.md-editor-preview h4 a,.md-editor-preview h4 a:hover,.md-editor-preview h5 a,.md-editor-preview h5 a:hover,.md-editor-preview h6 a,.md-editor-preview h6 a:hover { color: inherit; }.md-editor-preview h1 { border-bottom: var(--md-theme-heading-1-border);color: var(--md-theme-heading-1-color); }.md-editor-preview h2 { border-bottom: var(--md-theme-heading-2-border);color: var(--md-theme-heading-2-color); }.md-editor-preview h3 { border-bottom: var(--md-theme-heading-3-border);color: var(--md-theme-heading-3-color); }.md-editor-preview h4 { border-bottom: var(--md-theme-heading-4-border);color: var(--md-theme-heading-4-color); }.md-editor-preview h5 { border-bottom: var(--md-theme-heading-5-border);color: var(--md-theme-heading-5-color); }.md-editor-preview h6 { border-bottom: var(--md-theme-heading-6-border);color: var(--md-theme-heading-6-color); }.md-editor-preview h1 { font-size: 2em; }.md-editor-preview h2 { font-size: 1.5em; }.md-editor-preview h3 { font-size: 1.25em; }.md-editor-preview h4 { font-size: 1em; }.md-editor-preview h5 { font-size: .875em; }.md-editor-preview h6 { font-size: .85em; }.md-editor-preview hr { border: none;border-top: 1px solid var(--md-theme-border-color);height: 1px;margin: 10px 0; }.md-editor-preview a { color: var(--md-theme-link-color);text-decoration: none;transition: color .1s; }.md-editor-preview a:hover { color: var(--md-theme-link-hover-color); }.md-editor-preview a:empty:before { content: attr(href); }.md-editor-preview ol,.md-editor-preview ul { padding-left: 2em; }.md-editor-preview img { max-width: 100%; }.md-editor-preview p:empty { display: none; }.md-editor .md-editor-preview { --md-theme-quote-color: var(--md-theme-color);--md-theme-quote-border: none;--md-theme-quote-bg-color: inherit; }.md-editor-preview blockquote { background-color: var(--md-theme-quote-bg-color);border-left: var(--md-theme-quote-border);color: var(--md-theme-quote-color);padding: 0 1em; }.md-editor .md-editor-preview { --md-theme-table-stripe-color: #fafafa;--md-theme-table-tr-bg-color: inherit;--md-theme-table-td-border-color: var(--md-theme-border-color); }.md-editor-preview table tr { background-color: var(--md-theme-table-tr-bg-color); }.md-editor-preview table tr td,.md-editor-preview table tr th { border: 1px solid var(--md-theme-table-td-border-color); }.md-editor-preview table tr:nth-child(2n) { background-color: var(--md-theme-table-stripe-color); }.md-editor-preview { color: var(--md-theme-color); }.md-editor-preview ::-webkit-scrollbar { height: 6px;width: 6px; }.md-editor-preview ::-webkit-scrollbar-button:vertical { display: none; }.md-editor-preview ::-webkit-scrollbar-corner,.md-editor-preview ::-webkit-scrollbar-thumb,.md-editor-preview ::-webkit-scrollbar-track { border-radius: 2px; }.md-editor .md-editor-preview ::-webkit-scrollbar-corner,.md-editor .md-editor-preview ::-webkit-scrollbar-track { background-color: #e2e2e2; }.md-editor .md-editor-preview ::-webkit-scrollbar-thumb { background-color: rgba(0,0,0,.3); }.md-editor .md-editor-preview ::-webkit-scrollbar-thumb:vertical:hover { background-color: rgba(0,0,0,.35); }.md-editor .md-editor-preview ::-webkit-scrollbar-thumb:vertical:active { background-color: rgba(0,0,0,.38); }.md-editor div.github-theme { --md-theme-code-inline-color: inherit;--md-theme-code-inline-bg-color: #eff1f2;--md-theme-code-inline-radius: 6px;--md-theme-code-block-color: inherit;--md-theme-code-block-bg-color: #f6f8fa;--md-theme-code-before-bg-color: var(--md-theme-code-block-bg-color);--md-theme-code-block-radius: 6px; }div.github-theme code { margin: 0;padding: .2em .4em; }div.github-theme pre code { letter-spacing: 1px;margin-bottom: 0;padding: 22px 1em;word-break: normal; }.md-editor div.github-theme { --md-theme-heading-color: inherit;--md-theme-heading-6-color: #2d3339;--md-theme-heading-1-border: 1px solid #d9dee4;--md-theme-heading-2-border: 1px solid #d9dee4; }div.github-theme h1,div.github-theme h2,div.github-theme h3,div.github-theme h4,div.github-theme h5,div.github-theme h6 { font-weight: 600;line-height: 1.25;margin-bottom: 16px;margin-top: 24px; }div.github-theme h1 { font-size: 2em;padding-bottom: .3em; }div.github-theme h2 { font-size: 1.5em;padding-bottom: .3em; }div.github-theme h3 { font-size: 1.25em; }div.github-theme h4 { font-size: 1em; }div.github-theme h5 { font-size: .875em; }div.github-theme h6 { font-size: .85em; }div.github-theme img { background-color: var(--md-theme-heading-bg-color); }.md-editor div.github-theme { --md-theme-link-color: #539bf5;--md-theme-link-hover-color: #539bf5; }div.github-theme a:hover { text-decoration: underline; }div.github-theme ol li+li,div.github-theme ul li+li { margin-top: .25em; }.md-editor div.github-theme { --md-theme-quote-color: #57606a;--md-theme-quote-border: .25em solid #d0d7de; }div.github-theme blockquote { margin: 0;padding: 0 1em; }.md-editor div.github-theme { --md-theme-table-stripe-color: #f7f8fa;--md-theme-table-tr-bg-color: #fff;--md-theme-table-td-border-color: #d0d7de; }div.github-theme table { border-collapse: collapse;border-spacing: 0;display: block;max-width: 100%;overflow: auto; }div.github-theme table tr td,div.github-theme table tr th { padding: 6px 13px; }.md-editor div.github-theme { --md-theme-color: #222; }div.github-theme { color: var(--md-theme-color);line-height: 1.5; }div.github-theme blockquote,div.github-theme details,div.github-theme dl,div.github-theme ol,div.github-theme p,div.github-theme pre,div.github-theme table,div.github-theme ul { margin-bottom: 16px;margin-top: 0; }.md-editor { --md-color: #3f4a54;--md-hover-color: #000;--md-bk-color: #fff;--md-bk-color-outstand: #f2f2f2;--md-bk-hover-color: #f5f7fa;--md-border-color: #e6e6e6;--md-border-hover-color: #b9b9b9;--md-border-active-color: #999;--md-modal-mask: rgba(0,0,0,.45098);--md-modal-shadow: 0px 6px 24px 2px rgba(0,0,0,.09804);--md-scrollbar-bg-color: #e2e2e2;--md-scrollbar-thumb-color: rgba(0,0,0,.30196);--md-scrollbar-thumb-hover-color: rgba(0,0,0,.34902);--md-scrollbar-thumb-active-color: rgba(0,0,0,.38039);background-color: var(--md-bk-color);border: 1px solid var(--md-border-color);box-sizing: border-box;color: var(--md-color);display: flex;flex-direction: column;font-family: -apple-system,BlinkMacSystemFont,Segoe UI Variable,Segoe UI,system-ui,Roboto,Ubuntu,Cantarell,Noto Sans,sans-serif,ui-sans-serif,Helvetica,Arial,Apple Color Emoji,Segoe UI Emoji;height: 500px;overflow: hidden;position: relative;width: 100%; }svg.md-editor-icon { fill: none;box-sizing: content-box;display: block;height: 16px;overflow: hidden;padding: 4px;width: 16px; }.md-editor-preview-wrapper { box-sizing: border-box;flex: 1;overflow: auto;position: relative; }.md-editor-preview { display: flow-root;font-size: 16px;padding: 10px 20px;word-break: break-all; }.md-editor-previewOnly { border: none;height: auto;overflow: visible; }.md-editor-previewOnly .md-editor-preview-wrapper { overflow: visible; }
/* assets/preview-CEscvQMY.css */

/* assets/style-BYmOokLm.css */

/* assets/style-Bp0n0o_6.css */

/* assets/style-C_lehBcC.css */

/* assets/style-hxXoFv9F.css */
.\!visible{visibility:visible!important}.-right-\[10px\]{right:-10px}.bottom-\[17px\]{bottom:17px}.bottom-\[7px\]{bottom:7px}.top-1\/2{top:50%}.top-\[4px\]{top:4px}.top-\[7px\]{top:7px}.my-\[2px\]{margin-bottom:2px;margin-top:2px}.my-\[33px\]{margin-bottom:33px;margin-top:33px}.my-\[3px\]{margin-bottom:3px;margin-top:3px}.my-\[4px\]{margin-bottom:4px;margin-top:4px}.my-\[8px\]{margin-bottom:8px;margin-top:8px}.-mt-\[2px\]{margin-top:-2px}.-mt-\[6px\]{margin-top:-6px}.mb-\[13px\]{margin-bottom:13px}.mb-\[17px\]{margin-bottom:17px}.mb-\[18px\]{margin-bottom:18px}.mb-\[23px\]{margin-bottom:23px}.mb-\[27px\]{margin-bottom:27px}.mb-\[2px\]{margin-bottom:2px}.mb-\[33px\]{margin-bottom:33px}.mr-\[2px\]{margin-right:2px}.mt-\[13px\]{margin-top:13px}.mt-\[18px\]{margin-top:18px}.mt-\[23px\]{margin-top:23px}.mt-\[3px\]{margin-top:3px}.\!block{display:block!important}.\!flex{display:flex!important}.\!hidden{display:none!important}.size-\[160px\]{height:160px;width:160px}.size-\[180px\]{height:180px;width:180px}.size-\[300px\]{height:300px;width:300px}.size-\[46px\]{height:46px;width:46px}.h-\[105px\]{height:105px}.h-\[12px\]{height:12px}.h-\[16px\]{height:16px}.h-\[1px\]{height:1px}.h-\[200px\]{height:200px}.h-\[40px\]{height:40px}.max-h-\[620px\]{max-height:620px}.min-h-\[100px\]{min-height:100px}.min-h-\[180px\]{min-height:180px}.min-h-\[195px\]{min-height:195px}.min-h-\[40px\]{min-height:40px}.w-\[120px\]{width:120px}.w-\[140px\]{width:140px}.w-\[180px\]{width:180px}.w-\[1px\]{width:1px}.w-\[260px\]{width:260px}.w-\[285px\]{width:285px}.w-\[300px\]{width:300px}.w-\[55px\]{width:55px}.\!min-w-0{min-width:0!important}.max-w-\[200px\]{max-width:200px}.max-w-\[290px\]{max-width:290px}.max-w-\[320px\]{max-width:320px}.max-w-\[480px\]{max-width:480px}.max-w-\[640px\]{max-width:640px}.max-w-\[720px\]{max-width:720px}.border-spacing-y-\[2px\]{--tw-border-spacing-y:2px;border-spacing:var(--tw-border-spacing-x) var(--tw-border-spacing-y)}.-translate-y-1\/2{--tw-translate-y:-50%;transform:translate(var(--tw-translate-x),var(--tw-translate-y)) rotate(var(--tw-rotate)) skewX(var(--tw-skew-x)) skewY(var(--tw-skew-y)) scaleX(var(--tw-scale-x)) scaleY(var(--tw-scale-y))}.grid-cols-\[minmax\(auto\2c 165px\)\2c minmax\(auto\2c 165px\)\]{grid-template-columns:minmax(auto,165px) minmax(auto,165px)}.grid-cols-\[minmax\(auto\2c 215px\)\2c 105px\]{grid-template-columns:minmax(auto,215px) 105px}.grid-cols-\[minmax\(auto\2c 230px\)\]{grid-template-columns:minmax(auto,230px)}.grid-cols-\[repeat\(3\2c 105px\)\]{grid-template-columns:repeat(3,105px)}.grid-cols-\[repeat\(auto-fit\2c 165px\)\]{grid-template-columns:repeat(auto-fit,165px)}.gap-\[2px\]{gap:2px}.gap-\[7px\]{gap:7px}.gap-x-\[2px\]{-moz-column-gap:2px;column-gap:2px}.gap-y-\[2px\]{row-gap:2px}.gap-y-\[7px\]{row-gap:7px}.rounded-\[12px\]{border-radius:12px}.rounded-\[1px\]{border-radius:1px}.rounded-\[3px\]{border-radius:3px}.border-\[\#304562\]{--tw-border-opacity:1;border-color:rgb(48 69 98/var(--tw-border-opacity))}.bg-\[\#E5F6FD\]{--tw-bg-opacity:1;background-color:rgb(229 246 253/var(--tw-bg-opacity))}.bg-\[\#F2F391\]{--tw-bg-opacity:1;background-color:rgb(242 243 145/var(--tw-bg-opacity))}.bg-\[\#e9f0fe\]{--tw-bg-opacity:1;background-color:rgb(233 240 254/var(--tw-bg-opacity))}.from-\[\#EBF1F8\]{--tw-gradient-from:#ebf1f8 var(--tw-gradient-from-position);--tw-gradient-to:rgba(235,241,248,0) var(--tw-gradient-to-position);--tw-gradient-stops:var(--tw-gradient-from),var(--tw-gradient-to)}.to-\[\#D5EEFF\]{--tw-gradient-to:#d5eeff var(--tw-gradient-to-position)}.p-\[2px\]{padding:2px}.\!px-5{padding-left:5px!important;padding-right:5px!important}.px-\[10px\]{padding-left:10px;padding-right:10px}.px-\[1em\]{padding-left:1em;padding-right:1em}.px-\[2px\]{padding-left:2px;padding-right:2px}.px-\[8px\]{padding-left:8px;padding-right:8px}.py-\[11px\]{padding-bottom:11px;padding-top:11px}.py-\[12px\]{padding-bottom:12px;padding-top:12px}.py-\[1em\]{padding-bottom:1em;padding-top:1em}.py-\[23px\]{padding-bottom:23px;padding-top:23px}.py-\[2px\]{padding-bottom:2px;padding-top:2px}.py-\[32px\]{padding-bottom:32px;padding-top:32px}.py-\[3px\]{padding-bottom:3px;padding-top:3px}.py-\[6px\]{padding-bottom:6px;padding-top:6px}.py-\[7px\]{padding-bottom:7px;padding-top:7px}.py-\[8px\]{padding-bottom:8px;padding-top:8px}.\!pb-0{padding-bottom:0!important}.pb-\[13px\]{padding-bottom:13px}.pb-\[1px\]{padding-bottom:1px}.pb-\[33px\]{padding-bottom:33px}.pl-\[75px\]{padding-left:75px}.pr-\[11px\]{padding-right:11px}.pr-\[2px\]{padding-right:2px}.pt-\[32px\]{padding-top:32px}.pt-\[33px\]{padding-top:33px}.pt-\[3px\]{padding-top:3px}.text-\[10px\]{font-size:10px}.text-\[12px\]{font-size:12px}.text-\[14px\]{font-size:14px}.text-\[16px\]{font-size:16px}.text-\[20px\]{font-size:20px}.text-\[24px\]{font-size:24px}.text-\[30px\]{font-size:30px}.text-\[36px\]{font-size:36px}.text-\[7px\]{font-size:7px}.leading-\[18px\]{line-height:18px}.leading-\[20px\]{line-height:20px}.leading-\[30px\]{line-height:30px}.leading-\[34px\]{line-height:34px}.leading-\[40px\]{line-height:40px}.text-\[\#014361\]{--tw-text-opacity:1;color:rgb(1 67 97/var(--tw-text-opacity))}.text-\[\#2484FC\]{--tw-text-opacity:1;color:rgb(36 132 252/var(--tw-text-opacity))}.text-\[\#42c52c\]{--tw-text-opacity:1;color:rgb(66 197 44/var(--tw-text-opacity))}.text-\[\#469DFF\]{--tw-text-opacity:1;color:rgb(70 157 255/var(--tw-text-opacity))}.text-\[\#646464\]{--tw-text-opacity:1;color:rgb(100 100 100/var(--tw-text-opacity))}@media (min-width:1024px){@media (min-width:640px){.lg\:container{max-width:640px}}@media (min-width:768px){.lg\:container{max-width:768px}}@media (min-width:1024px){.lg\:container{max-width:1024px}}@media (min-width:1280px){.lg\:container{max-width:1280px}}@media (min-width:1536px){.lg\:container{max-width:1536px}}.lg\:container{margin-left:auto;margin-right:auto;max-width:100%;padding-left:5px;padding-right:5px;width:100%}@media (min-width:1024px){.lg\:container{max-width:1140px;padding-left:15px;padding-right:15px}}}.last\:mb-0:last-child{margin-bottom:0}.last\:mr-0:last-child{margin-right:0}.empty\:mb-0:empty{margin-bottom:0}.disabled\:text-cloud-blue:disabled{--tw-text-opacity:1;color:rgb(225 234 246/var(--tw-text-opacity))}.disabled\:opacity-100:disabled{opacity:1}.group:last-child .group-last\:hidden{display:none}.group[open] .group-open\:block{display:block}.group[open] .group-open\:hidden{display:none}.group[open] .group-open\:bg-transparent{background-color:transparent}.group[open] .group-open\:bg-white{--tw-bg-opacity:1;background-color:rgb(255 255 255/var(--tw-bg-opacity))}.group.open .group-\[\&\.open\]\:visible{visibility:visible}.group.open .group-\[\&\.open\]\:block{display:block}.peer:checked~.peer-checked\:bg-steel-gray{--tw-bg-opacity:1;background-color:rgb(91 106 125/var(--tw-bg-opacity))}.peer:checked~.peer-checked\:text-white{--tw-text-opacity:1;color:rgb(255 255 255/var(--tw-text-opacity))}.aria-selected\:border-cool-gray[aria-selected=true]{--tw-border-opacity:1;border-color:rgb(248 249 251/var(--tw-border-opacity))}.aria-selected\:border-white[aria-selected=true]{--tw-border-opacity:1;border-color:rgb(255 255 255/var(--tw-border-opacity))}.aria-selected\:bg-cool-gray[aria-selected=true]{--tw-bg-opacity:1;background-color:rgb(248 249 251/var(--tw-bg-opacity))}.aria-selected\:bg-dark[aria-selected=true]{--tw-bg-opacity:1;background-color:rgb(51 51 51/var(--tw-bg-opacity))}.aria-selected\:bg-white[aria-selected=true]{--tw-bg-opacity:1;background-color:rgb(255 255 255/var(--tw-bg-opacity))}.aria-selected\:text-dark[aria-selected=true]{--tw-text-opacity:1;color:rgb(51 51 51/var(--tw-text-opacity))}.aria-selected\:text-teal[aria-selected=true]{--tw-text-opacity:1;color:rgb(0 161 179/var(--tw-text-opacity))}.aria-selected\:text-white[aria-selected=true]{--tw-text-opacity:1;color:rgb(255 255 255/var(--tw-text-opacity))}.aria-\[current\=page\]\:underline[aria-current=page]{-webkit-text-decoration-line:underline;text-decoration-line:underline}@media not all and (min-width:1024px){.max-lg\:\!py-0{padding-bottom:0!important;padding-top:0!important}}@media (min-width:640px){.sm\:order-1{order:1}.sm\:order-2{order:2}.sm\:order-3{order:3}.sm\:order-6{order:6}.sm\:col-span-1{grid-column:span 1/span 1}.sm\:row-span-2{grid-row:span 2/span 2}.sm\:mb-0{margin-bottom:0}.sm\:mt-0{margin-top:0}.sm\:grid-cols-3{grid-template-columns:repeat(3,minmax(0,1fr))}.sm\:grid-cols-\[1fr\2c minmax\(auto\2c 215px\)\2c 105px\]{grid-template-columns:1fr minmax(auto,215px) 105px}.sm\:grid-cols-\[repeat\(3\2c 105px\)\2c 1fr\]{grid-template-columns:repeat(3,105px) 1fr}.sm\:text-right{text-align:right}}@media (min-width:768px){.md\:order-1{order:1}.md\:order-3{order:3}.md\:order-4{order:4}.md\:order-5{order:5}.md\:order-6{order:6}.md\:col-span-1{grid-column:span 1/span 1}.md\:row-span-1{grid-row:span 1/span 1}.md\:mb-0{margin-bottom:0}.md\:mb-55{margin-bottom:55px}.md\:ml-0{margin-left:0}.md\:ml-10{margin-left:10px}.md\:mr-40{margin-right:40px}.md\:mt-5{margin-top:5px}.md\:flex{display:flex}.md\:grid{display:grid}.md\:w-auto{width:auto}.md\:max-w-\[640px\]{max-width:640px}.md\:flex-grow{flex-grow:1}.md\:grid-cols-2{grid-template-columns:repeat(2,minmax(0,1fr))}.md\:grid-cols-\[1fr\2c minmax\(auto\2c 215px\)\2c 105px\2c 105px\]{grid-template-columns:1fr minmax(auto,215px) 105px 105px}.md\:grid-cols-\[1fr\2c repeat\(3\2c 105px\)\2c auto\]{grid-template-columns:1fr repeat(3,105px) auto}.md\:flex-row{flex-direction:row}.md\:flex-col{flex-direction:column}.md\:items-start{align-items:flex-start}.md\:items-end{align-items:flex-end}.md\:gap-x-10{-moz-column-gap:10px;column-gap:10px}.md\:px-15{padding-left:15px;padding-right:15px}.md\:py-5{padding-bottom:5px;padding-top:5px}.md\:text-\[30px\]{font-size:30px}}@media (min-width:1024px){.lg\:not-sr-only{height:auto;margin:0;overflow:visible;padding:0;position:static;width:auto;clip:auto;white-space:normal}.lg\:visible{visibility:visible}.lg\:static{position:static}.lg\:fixed{position:fixed}.lg\:absolute{position:absolute}.lg\:relative{position:relative}.lg\:sticky{position:sticky}.lg\:bottom-0{bottom:0}.lg\:bottom-auto{bottom:auto}.lg\:left-0{left:0}.lg\:right-0{right:0}.lg\:right-10{right:10px}.lg\:right-20{right:20px}.lg\:right-auto{right:auto}.lg\:top-0{top:0}.lg\:top-1\/2{top:50%}.lg\:top-10{top:10px}.lg\:top-\[13px\]{top:13px}.lg\:top-auto{top:auto}.lg\:z-0{z-index:0}.lg\:order-1{order:1}.lg\:order-2{order:2}.lg\:order-3{order:3}.lg\:order-first{order:-9999}.lg\:mx-0{margin-left:0;margin-right:0}.lg\:mx-auto{margin-left:auto;margin-right:auto}.lg\:mb-0{margin-bottom:0}.lg\:mb-15{margin-bottom:15px}.lg\:mb-20{margin-bottom:20px}.lg\:mb-25{margin-bottom:25px}.lg\:mb-30{margin-bottom:30px}.lg\:mb-35{margin-bottom:35px}.lg\:mb-45{margin-bottom:45px}.lg\:mb-60{margin-bottom:60px}.lg\:mb-\[13px\]{margin-bottom:13px}.lg\:mb-\[33px\]{margin-bottom:33px}.lg\:mb-auto{margin-bottom:auto}.lg\:ml-0{margin-left:0}.lg\:ml-15{margin-left:15px}.lg\:ml-45{margin-left:45px}.lg\:ml-auto{margin-left:auto}.lg\:mr-0{margin-right:0}.lg\:mr-10{margin-right:10px}.lg\:mr-15{margin-right:15px}.lg\:mr-20{margin-right:20px}.lg\:mr-30{margin-right:30px}.lg\:mr-40{margin-right:40px}.lg\:mr-60{margin-right:60px}.lg\:mr-80{margin-right:80px}.lg\:mr-auto{margin-right:auto}.lg\:mt-0{margin-top:0}.lg\:mt-10{margin-top:10px}.lg\:mt-15{margin-top:15px}.lg\:mt-30{margin-top:30px}.lg\:mt-40{margin-top:40px}.lg\:mt-5{margin-top:5px}.lg\:mt-\[7px\]{margin-top:7px}.lg\:mt-auto{margin-top:auto}.lg\:line-clamp-2{display:-webkit-box;overflow:hidden;-webkit-box-orient:vertical;-webkit-line-clamp:2}.lg\:block{display:block}.lg\:flex{display:flex}.lg\:table{display:table}.lg\:table-header-group{display:table-header-group}.lg\:table-row-group{display:table-row-group}.lg\:table-row{display:table-row}.lg\:grid{display:grid}.lg\:hidden{display:none}.lg\:size-60{height:60px;width:60px}.lg\:size-\[90px\]{height:90px;width:90px}.lg\:h-\[30px\]{height:30px}.lg\:max-h-none{max-height:none}.lg\:max-h-screen{max-height:100vh}.lg\:min-h-\[185px\]{min-height:185px}.lg\:w-\[110px\]{width:110px}.lg\:w-\[140px\]{width:140px}.lg\:w-\[160px\]{width:160px}.lg\:w-\[165px\]{width:165px}.lg\:w-\[180px\]{width:180px}.lg\:w-\[230px\]{width:230px}.lg\:w-\[270px\]{width:270px}.lg\:w-\[310px\]{width:310px}.lg\:w-\[330px\]{width:330px}.lg\:w-\[370px\]{width:370px}.lg\:w-\[400px\]{width:400px}.lg\:w-\[500px\]{width:500px}.lg\:w-\[510px\]{width:510px}.lg\:w-\[600px\]{width:600px}.lg\:w-\[640px\]{width:640px}.lg\:w-\[680px\]{width:680px}.lg\:w-\[740px\]{width:740px}.lg\:w-\[780px\]{width:780px}.lg\:w-\[80px\]{width:80px}.lg\:w-\[840px\]{width:840px}.lg\:w-auto{width:auto}.lg\:w-full{width:100%}.lg\:max-w-none{max-width:none}.lg\:flex-grow{flex-grow:1}.lg\:-translate-y-1\/2{--tw-translate-y:-50%;transform:translate(var(--tw-translate-x),var(--tw-translate-y)) rotate(var(--tw-rotate)) skewX(var(--tw-skew-x)) skewY(var(--tw-skew-y)) scaleX(var(--tw-scale-x)) scaleY(var(--tw-scale-y))}.lg\:grid-flow-col{grid-auto-flow:column}.lg\:grid-cols-2{grid-template-columns:repeat(2,minmax(0,1fr))}.lg\:grid-cols-3{grid-template-columns:repeat(3,minmax(0,1fr))}.lg\:grid-cols-4{grid-template-columns:repeat(4,minmax(0,1fr))}.lg\:grid-cols-\[repeat\(auto-fit\2c 200px\)\]{grid-template-columns:repeat(auto-fit,200px)}.lg\:grid-rows-5{grid-template-rows:repeat(5,minmax(0,1fr))}.lg\:grid-rows-6{grid-template-rows:repeat(6,minmax(0,1fr))}.lg\:flex-row{flex-direction:row}.lg\:flex-col{flex-direction:column}.lg\:flex-wrap{flex-wrap:wrap}.lg\:items-start{align-items:flex-start}.lg\:items-end{align-items:flex-end}.lg\:items-center{align-items:center}.lg\:justify-center{justify-content:center}.lg\:justify-between{justify-content:space-between}.lg\:gap-15{gap:15px}.lg\:gap-20{gap:20px}.lg\:gap-30{gap:30px}.lg\:gap-x-20{-moz-column-gap:20px;column-gap:20px}.lg\:gap-x-40{-moz-column-gap:40px;column-gap:40px}.lg\:gap-x-5{-moz-column-gap:5px;column-gap:5px}.lg\:gap-y-0{row-gap:0}.lg\:overflow-visible{overflow:visible}.lg\:overflow-y-auto{overflow-y:auto}.lg\:overflow-y-visible{overflow-y:visible}.lg\:rounded-10{border-radius:10px}.lg\:rounded-l-10{border-bottom-left-radius:10px;border-top-left-radius:10px}.lg\:rounded-br-10{border-bottom-right-radius:10px}.lg\:border-0{border-width:0}.lg\:border-r{border-right-width:1px}.lg\:border-cloud-blue{--tw-border-opacity:1;border-color:rgb(225 234 246/var(--tw-border-opacity))}.lg\:border-r-cloud-blue{--tw-border-opacity:1;border-right-color:rgb(225 234 246/var(--tw-border-opacity))}.lg\:px-0{padding-left:0;padding-right:0}.lg\:px-10{padding-left:10px;padding-right:10px}.lg\:px-15{padding-left:15px;padding-right:15px}.lg\:px-20{padding-left:20px;padding-right:20px}.lg\:px-30{padding-left:30px;padding-right:30px}.lg\:px-40{padding-left:40px;padding-right:40px}.lg\:px-60{padding-left:60px;padding-right:60px}.lg\:py-0{padding-bottom:0;padding-top:0}.lg\:py-10{padding-bottom:10px;padding-top:10px}.lg\:py-40{padding-bottom:40px;padding-top:40px}.lg\:py-5{padding-bottom:5px;padding-top:5px}.lg\:py-\[13px\]{padding-bottom:13px;padding-top:13px}.lg\:py-\[8px\]{padding-bottom:8px;padding-top:8px}.lg\:pb-0{padding-bottom:0}.lg\:pb-25{padding-bottom:25px}.lg\:pb-30{padding-bottom:30px}.lg\:pb-35{padding-bottom:35px}.lg\:pb-40{padding-bottom:40px}.lg\:pb-\[12px\]{padding-bottom:12px}.lg\:pl-0{padding-left:0}.lg\:pl-15{padding-left:15px}.lg\:pl-20{padding-left:20px}.lg\:pl-40{padding-left:40px}.lg\:pl-5{padding-left:5px}.lg\:pr-0{padding-right:0}.lg\:pr-10{padding-right:10px}.lg\:pr-20{padding-right:20px}.lg\:pr-25{padding-right:25px}.lg\:pr-30{padding-right:30px}.lg\:pr-40{padding-right:40px}.lg\:pr-\[115px\]{padding-right:115px}.lg\:pt-25{padding-top:25px}.lg\:pt-30{padding-top:30px}.lg\:pt-35{padding-top:35px}.lg\:pt-40{padding-top:40px}.lg\:pt-45{padding-top:45px}.lg\:pt-50{padding-top:50px}.lg\:pt-\[12px\]{padding-top:12px}.lg\:text-left{text-align:left}.lg\:text-center{text-align:center}.lg\:text-right{text-align:right}.lg\:text-\[12px\]{font-size:12px}.lg\:text-\[30px\]{font-size:30px}.lg\:text-base{font-size:16px;line-height:26px}.lg\:text-lg{font-size:18px;line-height:30px}.lg\:leading-\[40px\]{line-height:40px}.lg\:text-\[\#8b8f92\]{--tw-text-opacity:1;color:rgb(139 143 146/var(--tw-text-opacity))}.lg\:opacity-100{opacity:1}.lg\:last\:mb-0:last-child{margin-bottom:0}.lg\:even\:flex-row-reverse:nth-child(2n){flex-direction:row-reverse}.lg\:focus\:bg-cool-gray:focus,.lg\:hover\:bg-cool-gray:hover{--tw-bg-opacity:1;background-color:rgb(248 249 251/var(--tw-bg-opacity))}.group.open .lg\:group-\[\&\.open\]\:hidden{display:none}}.\[\&\.active\]\:border-teal.active{--tw-border-opacity:1;border-color:rgb(0 161 179/var(--tw-border-opacity))}.\[\&\.active\]\:border-teal-dark.active{--tw-border-opacity:1;border-color:rgb(0 138 154/var(--tw-border-opacity))}.\[\&\.active\]\:bg-cloud-blue.active{--tw-bg-opacity:1;background-color:rgb(225 234 246/var(--tw-bg-opacity))}.\[\&\.active\]\:bg-cool-gray.active{--tw-bg-opacity:1;background-color:rgb(248 249 251/var(--tw-bg-opacity))}.\[\&\.active\]\:bg-steel-gray.active{--tw-bg-opacity:1;background-color:rgb(91 106 125/var(--tw-bg-opacity))}.\[\&\.active\]\:bg-teal.active{--tw-bg-opacity:1;background-color:rgb(0 161 179/var(--tw-bg-opacity))}.\[\&\.active\]\:font-semibold.active{font-weight:600}.\[\&\.active\]\:text-dark.active{--tw-text-opacity:1;color:rgb(51 51 51/var(--tw-text-opacity))}.\[\&\.active\]\:text-steel-gray.active{--tw-text-opacity:1;color:rgb(91 106 125/var(--tw-text-opacity))}.\[\&\.active\]\:text-teal-dark.active{--tw-text-opacity:1;color:rgb(0 138 154/var(--tw-text-opacity))}.\[\&\.active\]\:text-white.active{--tw-text-opacity:1;color:rgb(255 255 255/var(--tw-text-opacity))}</style>
    <script type="module" crossorigin src="/dist/web/assets/index-ldDqkWdH.js"></script>
    <link rel="stylesheet" media="print" onload="this.media='all'; this.onload=null;" crossorigin href="/dist/web/assets/index-CcPpOIHz.css">
    <script type="module">import.meta.url;import("_").catch(()=>1);(async function*(){})().next();if(location.protocol!="file:"){window.__vite_is_modern_browser=true}</script>
    <script type="module">!function(){if(window.__vite_is_modern_browser)return;console.warn("vite: loading legacy chunks, syntax error above and the same error below should be ignored");var e=document.getElementById("vite-legacy-polyfill"),n=document.createElement("script");n.src=e.src,n.onload=function(){System.import(document.getElementById('vite-legacy-entry').getAttribute('data-src'))},document.body.appendChild(n)}();</script>
  </head>
  <body ><!-- Google Tag Manager (noscript) --> <noscript><iframe src="https://www.googletagmanager.com/ns.html?id=GTM-54JRQLV" height="0" width="0" style="display:none;visibility:hidden"></iframe></noscript> <!-- End Google Tag Manager (noscript) --><noscript>Sorry, this site does not work without JS, enable it please or update browser version.</noscript>
    <div id="root"><!--$--><div class="app-level-notifications"></div><div class="_layout_1smur_1"><header class="relative text-white bg-charcoal-blue py-[12px] px-10 lg:py-10 lg:px-0"><div class="container"><div class="flex flex-wrap items-center"><a class="flex mr-auto" href="/"><img src="/dist/web/assets/twocaptcha-logo-CYCKxIN9.svg" alt="Logo of «2Captcha»" width="140" height="30"/><span class="sr-only">To home page</span></a><div class="flex flex-col w-full order-3 absolute z-10 invisible opacity-0 transition-opacity top-full left-0 right-0 text-white bg-charcoal-blue py-10 px-20 lg:py-0 lg:px-0 lg:static lg:w-auto lg:visible lg:opacity-100 lg:flex-row"><ul class="flex flex-col gap-y-10 gap-x-[2px] lg:mr-10 lg:flex-row"><li><button type="button" class="flex items-center rounded-5 bg-transparent px-10 py-[7px] text-white"><span class="mr-10">Captcha solver</span><svg class="icon icon-chevron-down text-[10px]"><use xlink:href="/dist/web/assets/symbol-defs-Ba5hjZu8.svg#icon-chevron-down" href="/dist/web/assets/symbol-defs-Ba5hjZu8.svg#icon-chevron-down"></use></svg></button><div class="invisible absolute opacity-0 -mx-20 mt-10 bg-white px-15 py-25 text-dark transition-opacity lg:left-0 lg:right-0 lg:mx-0 lg:w-full lg:px-0 lg:pb-35 lg:pt-25"><div class="lg:container"><div class="grid grid-cols-1 gap-y-25 text-sm lg:grid-cols-2 lg:gap-x-20"><div><span class="mb-25 block font-semibold uppercase text-steel-gray lg:mb-15 lg:ml-15">Popular captchas</span><ul class="grid grid-cols-[minmax(auto,230px)] gap-20 lg:grid-flow-col lg:grid-cols-2 lg:grid-rows-5 lg:gap-y-0"><li><a class="group flex items-center rounded-5 transition-colors lg:py-[13px] lg:pl-15 lg:pr-10 lg:hover:bg-cool-gray lg:focus:bg-cool-gray _link_1kv8l_1" href="/p/recaptcha_v2"><svg class="icon icon-recaptcha-v2 mr-10 text-[20px]"><use xlink:href="/dist/web/assets/symbol-defs-Ba5hjZu8.svg#icon-recaptcha-v2" href="/dist/web/assets/symbol-defs-Ba5hjZu8.svg#icon-recaptcha-v2"></use></svg><span class="mr-10">reCAPTCHA V2</span><svg class="icon icon-arrow-right ml-auto hidden group-hover:block group-focus:block"><use xlink:href="/dist/web/assets/symbol-defs-Ba5hjZu8.svg#icon-arrow-right" href="/dist/web/assets/symbol-defs-Ba5hjZu8.svg#icon-arrow-right"></use></svg></a></li><li><a class="group flex items-center rounded-5 transition-colors lg:py-[13px] lg:pl-15 lg:pr-10 lg:hover:bg-cool-gray lg:focus:bg-cool-gray _link_1kv8l_1" href="/p/recaptcha_v2_callback"><svg class="icon icon-recaptcha-v2-callback mr-10 text-[20px]"><use xlink:href="/dist/web/assets/symbol-defs-Ba5hjZu8.svg#icon-recaptcha-v2-callback" href="/dist/web/assets/symbol-defs-Ba5hjZu8.svg#icon-recaptcha-v2-callback"></use></svg><span class="mr-10">reCAPTCHA V2 Callback</span><svg class="icon icon-arrow-right ml-auto hidden group-hover:block group-focus:block"><use xlink:href="/dist/web/assets/symbol-defs-Ba5hjZu8.svg#icon-arrow-right" href="/dist/web/assets/symbol-defs-Ba5hjZu8.svg#icon-arrow-right"></use></svg></a></li><li><a class="group flex items-center rounded-5 transition-colors lg:py-[13px] lg:pl-15 lg:pr-10 lg:hover:bg-cool-gray lg:focus:bg-cool-gray _link_1kv8l_1" href="/p/recaptcha_v2_invisible"><svg class="icon icon-recaptcha-v2-invisible mr-10 text-[20px]"><use xlink:href="/dist/web/assets/symbol-defs-Ba5hjZu8.svg#icon-recaptcha-v2-invisible" href="/dist/web/assets/symbol-defs-Ba5hjZu8.svg#icon-recaptcha-v2-invisible"></use></svg><span class="mr-10">reCAPTCHA V2 Invisible</span><svg class="icon icon-arrow-right ml-auto hidden group-hover:block group-focus:block"><use xlink:href="/dist/web/assets/symbol-defs-Ba5hjZu8.svg#icon-arrow-right" href="/dist/web/assets/symbol-defs-Ba5hjZu8.svg#icon-arrow-right"></use></svg></a></li><li><a class="group flex items-center rounded-5 transition-colors lg:py-[13px] lg:pl-15 lg:pr-10 lg:hover:bg-cool-gray lg:focus:bg-cool-gray _link_1kv8l_1" href="/p/recaptcha_v3"><svg class="icon icon-recaptcha-v3 mr-10 text-[20px]"><use xlink:href="/dist/web/assets/symbol-defs-Ba5hjZu8.svg#icon-recaptcha-v3" href="/dist/web/assets/symbol-defs-Ba5hjZu8.svg#icon-recaptcha-v3"></use></svg><span class="mr-10">reCAPTCHA V3</span><svg class="icon icon-arrow-right ml-auto hidden group-hover:block group-focus:block"><use xlink:href="/dist/web/assets/symbol-defs-Ba5hjZu8.svg#icon-arrow-right" href="/dist/web/assets/symbol-defs-Ba5hjZu8.svg#icon-arrow-right"></use></svg></a></li><li><a class="group flex items-center rounded-5 transition-colors lg:py-[13px] lg:pl-15 lg:pr-10 lg:hover:bg-cool-gray lg:focus:bg-cool-gray _link_1kv8l_1" href="/p/recaptcha_enterprise"><svg class="icon icon-recaptcha-enterprise mr-10 text-[20px]"><use xlink:href="/dist/web/assets/symbol-defs-Ba5hjZu8.svg#icon-recaptcha-enterprise" href="/dist/web/assets/symbol-defs-Ba5hjZu8.svg#icon-recaptcha-enterprise"></use></svg><span class="mr-10">reCAPTCHA Enterprise</span><svg class="icon icon-arrow-right ml-auto hidden group-hover:block group-focus:block"><use xlink:href="/dist/web/assets/symbol-defs-Ba5hjZu8.svg#icon-arrow-right" href="/dist/web/assets/symbol-defs-Ba5hjZu8.svg#icon-arrow-right"></use></svg></a></li><li><a class="group flex items-center rounded-5 transition-colors lg:py-[13px] lg:pl-15 lg:pr-10 lg:hover:bg-cool-gray lg:focus:bg-cool-gray _link_1kv8l_1" href="/p/cloudflare-turnstile"><svg class="icon icon-cloudflare-turnstile mr-10 text-[20px]"><use xlink:href="/dist/web/assets/symbol-defs-Ba5hjZu8.svg#icon-cloudflare-turnstile" href="/dist/web/assets/symbol-defs-Ba5hjZu8.svg#icon-cloudflare-turnstile"></use></svg><span class="mr-10">Cloudflare Turnstile</span><svg class="icon icon-arrow-right ml-auto hidden group-hover:block group-focus:block"><use xlink:href="/dist/web/assets/symbol-defs-Ba5hjZu8.svg#icon-arrow-right" href="/dist/web/assets/symbol-defs-Ba5hjZu8.svg#icon-arrow-right"></use></svg></a></li><li><a class="group flex items-center rounded-5 transition-colors lg:py-[13px] lg:pl-15 lg:pr-10 lg:hover:bg-cool-gray lg:focus:bg-cool-gray _link_1kv8l_1" href="/p/funcaptcha"><svg class="icon icon-fun-captcha mr-10 text-[20px]"><use xlink:href="/dist/web/assets/symbol-defs-Ba5hjZu8.svg#icon-fun-captcha" href="/dist/web/assets/symbol-defs-Ba5hjZu8.svg#icon-fun-captcha"></use></svg><span class="mr-10">Arkose Labs (FunCaptcha)</span><svg class="icon icon-arrow-right ml-auto hidden group-hover:block group-focus:block"><use xlink:href="/dist/web/assets/symbol-defs-Ba5hjZu8.svg#icon-arrow-right" href="/dist/web/assets/symbol-defs-Ba5hjZu8.svg#icon-arrow-right"></use></svg></a></li><li><a class="group flex items-center rounded-5 transition-colors lg:py-[13px] lg:pl-15 lg:pr-10 lg:hover:bg-cool-gray lg:focus:bg-cool-gray _link_1kv8l_1" href="/p/simple_captcha"><svg class="icon icon-normal-captcha mr-10 text-[20px]"><use xlink:href="/dist/web/assets/symbol-defs-Ba5hjZu8.svg#icon-normal-captcha" href="/dist/web/assets/symbol-defs-Ba5hjZu8.svg#icon-normal-captcha"></use></svg><span class="mr-10">Normal Captcha</span><svg class="icon icon-arrow-right ml-auto hidden group-hover:block group-focus:block"><use xlink:href="/dist/web/assets/symbol-defs-Ba5hjZu8.svg#icon-arrow-right" href="/dist/web/assets/symbol-defs-Ba5hjZu8.svg#icon-arrow-right"></use></svg></a></li><li><a class="group flex items-center rounded-5 transition-colors lg:py-[13px] lg:pl-15 lg:pr-10 lg:hover:bg-cool-gray lg:focus:bg-cool-gray _link_1kv8l_1" href="/p/image-picture-captcha-solver"><svg class="icon icon-image-captcha mr-10 text-[20px]"><use xlink:href="/dist/web/assets/symbol-defs-Ba5hjZu8.svg#icon-image-captcha" href="/dist/web/assets/symbol-defs-Ba5hjZu8.svg#icon-image-captcha"></use></svg><span class="mr-10">Image Captcha</span><svg class="icon icon-arrow-right ml-auto hidden group-hover:block group-focus:block"><use xlink:href="/dist/web/assets/symbol-defs-Ba5hjZu8.svg#icon-arrow-right" href="/dist/web/assets/symbol-defs-Ba5hjZu8.svg#icon-arrow-right"></use></svg></a></li><li><a class="group flex items-center rounded-5 transition-colors lg:py-[13px] lg:pl-15 lg:pr-10 lg:hover:bg-cool-gray lg:focus:bg-cool-gray _link_1kv8l_1" href="/p/amazon-captcha-bypass"><svg class="icon icon-aws-waf mr-10 text-[20px]"><use xlink:href="/dist/web/assets/symbol-defs-Ba5hjZu8.svg#icon-aws-waf" href="/dist/web/assets/symbol-defs-Ba5hjZu8.svg#icon-aws-waf"></use></svg><span class="mr-10">Amazon Captcha</span><svg class="icon icon-arrow-right ml-auto hidden group-hover:block group-focus:block"><use xlink:href="/dist/web/assets/symbol-defs-Ba5hjZu8.svg#icon-arrow-right" href="/dist/web/assets/symbol-defs-Ba5hjZu8.svg#icon-arrow-right"></use></svg></a></li></ul></div><div><span class="mb-20 flex items-center font-semibold uppercase text-steel-gray lg:ml-15"><span class="mr-auto">Other captchas</span><button type="button" class="hidden text-[16px] leading-none text-steel-gray lg:flex"><span class="sr-only">Close captcha menu</span><svg class="icon icon-x"><use xlink:href="/dist/web/assets/symbol-defs-Ba5hjZu8.svg#icon-x" href="/dist/web/assets/symbol-defs-Ba5hjZu8.svg#icon-x"></use></svg></button></span><ul class="grid grid-cols-[minmax(auto,165px),minmax(auto,165px)] gap-15 lg:grid-flow-col lg:grid-cols-3 lg:grid-rows-8 lg:gap-x-5 lg:gap-y-0"><li><a class="group flex items-center rounded-5 transition-colors lg:px-10 lg:py-[8px] lg:hover:bg-cool-gray lg:focus:bg-cool-gray _link_1kv8l_1" href="/p/geetest"><span class="mr-10">GeeTest</span><svg class="icon icon-arrow-right ml-auto hidden flex-shrink-0 group-hover:block group-focus:block"><use xlink:href="/dist/web/assets/symbol-defs-Ba5hjZu8.svg#icon-arrow-right" href="/dist/web/assets/symbol-defs-Ba5hjZu8.svg#icon-arrow-right"></use></svg></a></li><li><a class="group flex items-center rounded-5 transition-colors lg:px-10 lg:py-[8px] lg:hover:bg-cool-gray lg:focus:bg-cool-gray _link_1kv8l_1" href="/p/audio-captcha"><span class="mr-10">Audio Captcha</span><svg class="icon icon-arrow-right ml-auto hidden flex-shrink-0 group-hover:block group-focus:block"><use xlink:href="/dist/web/assets/symbol-defs-Ba5hjZu8.svg#icon-arrow-right" href="/dist/web/assets/symbol-defs-Ba5hjZu8.svg#icon-arrow-right"></use></svg></a></li><li><a class="group flex items-center rounded-5 transition-colors lg:px-10 lg:py-[8px] lg:hover:bg-cool-gray lg:focus:bg-cool-gray _link_1kv8l_1" href="/p/russian-captcha-solver"><span class="mr-10">Russian Captcha</span><svg class="icon icon-arrow-right ml-auto hidden flex-shrink-0 group-hover:block group-focus:block"><use xlink:href="/dist/web/assets/symbol-defs-Ba5hjZu8.svg#icon-arrow-right" href="/dist/web/assets/symbol-defs-Ba5hjZu8.svg#icon-arrow-right"></use></svg></a></li><li><a class="group flex items-center rounded-5 transition-colors lg:px-10 lg:py-[8px] lg:hover:bg-cool-gray lg:focus:bg-cool-gray _link_1kv8l_1" href="/p/mtcaptcha-solver"><span class="mr-10">MTCaptcha</span><svg class="icon icon-arrow-right ml-auto hidden flex-shrink-0 group-hover:block group-focus:block"><use xlink:href="/dist/web/assets/symbol-defs-Ba5hjZu8.svg#icon-arrow-right" href="/dist/web/assets/symbol-defs-Ba5hjZu8.svg#icon-arrow-right"></use></svg></a></li><li><a class="group flex items-center rounded-5 transition-colors lg:px-10 lg:py-[8px] lg:hover:bg-cool-gray lg:focus:bg-cool-gray _link_1kv8l_1" href="/p/number-captcha-solver"><span class="mr-10">Number Captcha</span><svg class="icon icon-arrow-right ml-auto hidden flex-shrink-0 group-hover:block group-focus:block"><use xlink:href="/dist/web/assets/symbol-defs-Ba5hjZu8.svg#icon-arrow-right" href="/dist/web/assets/symbol-defs-Ba5hjZu8.svg#icon-arrow-right"></use></svg></a></li><li><a class="group flex items-center rounded-5 transition-colors lg:px-10 lg:py-[8px] lg:hover:bg-cool-gray lg:focus:bg-cool-gray _link_1kv8l_1" href="/p/text_captcha"><span class="mr-10">Text Captcha</span><svg class="icon icon-arrow-right ml-auto hidden flex-shrink-0 group-hover:block group-focus:block"><use xlink:href="/dist/web/assets/symbol-defs-Ba5hjZu8.svg#icon-arrow-right" href="/dist/web/assets/symbol-defs-Ba5hjZu8.svg#icon-arrow-right"></use></svg></a></li><li><a class="group flex items-center rounded-5 transition-colors lg:px-10 lg:py-[8px] lg:hover:bg-cool-gray lg:focus:bg-cool-gray _link_1kv8l_1" href="/p/lemin-captcha"><span class="mr-10">Lemin Captcha</span><svg class="icon icon-arrow-right ml-auto hidden flex-shrink-0 group-hover:block group-focus:block"><use xlink:href="/dist/web/assets/symbol-defs-Ba5hjZu8.svg#icon-arrow-right" href="/dist/web/assets/symbol-defs-Ba5hjZu8.svg#icon-arrow-right"></use></svg></a></li><li><a class="group flex items-center rounded-5 transition-colors lg:px-10 lg:py-[8px] lg:hover:bg-cool-gray lg:focus:bg-cool-gray _link_1kv8l_1" href="/p/chinese-captcha-solver"><span class="mr-10">Chinese Captcha</span><svg class="icon icon-arrow-right ml-auto hidden flex-shrink-0 group-hover:block group-focus:block"><use xlink:href="/dist/web/assets/symbol-defs-Ba5hjZu8.svg#icon-arrow-right" href="/dist/web/assets/symbol-defs-Ba5hjZu8.svg#icon-arrow-right"></use></svg></a></li><li><a class="group flex items-center rounded-5 transition-colors lg:px-10 lg:py-[8px] lg:hover:bg-cool-gray lg:focus:bg-cool-gray _link_1kv8l_1" href="/p/rotatecaptcha"><span class="mr-10">Rotate Captcha</span><svg class="icon icon-arrow-right ml-auto hidden flex-shrink-0 group-hover:block group-focus:block"><use xlink:href="/dist/web/assets/symbol-defs-Ba5hjZu8.svg#icon-arrow-right" href="/dist/web/assets/symbol-defs-Ba5hjZu8.svg#icon-arrow-right"></use></svg></a></li><li><a class="group flex items-center rounded-5 transition-colors lg:px-10 lg:py-[8px] lg:hover:bg-cool-gray lg:focus:bg-cool-gray _link_1kv8l_1" href="/p/friendly-captcha-solver"><span class="mr-10">Friendly Captcha</span><svg class="icon icon-arrow-right ml-auto hidden flex-shrink-0 group-hover:block group-focus:block"><use xlink:href="/dist/web/assets/symbol-defs-Ba5hjZu8.svg#icon-arrow-right" href="/dist/web/assets/symbol-defs-Ba5hjZu8.svg#icon-arrow-right"></use></svg></a></li><li><a class="group flex items-center rounded-5 transition-colors lg:px-10 lg:py-[8px] lg:hover:bg-cool-gray lg:focus:bg-cool-gray _link_1kv8l_1" href="/p/datadome-captcha-solver"><span class="mr-10">DataDome</span><svg class="icon icon-arrow-right ml-auto hidden flex-shrink-0 group-hover:block group-focus:block"><use xlink:href="/dist/web/assets/symbol-defs-Ba5hjZu8.svg#icon-arrow-right" href="/dist/web/assets/symbol-defs-Ba5hjZu8.svg#icon-arrow-right"></use></svg></a></li><li><a class="group flex items-center rounded-5 transition-colors lg:px-10 lg:py-[8px] lg:hover:bg-cool-gray lg:focus:bg-cool-gray _link_1kv8l_1" href="/p/math-captcha-solver"><span class="mr-10">Math Captcha</span><svg class="icon icon-arrow-right ml-auto hidden flex-shrink-0 group-hover:block group-focus:block"><use xlink:href="/dist/web/assets/symbol-defs-Ba5hjZu8.svg#icon-arrow-right" href="/dist/web/assets/symbol-defs-Ba5hjZu8.svg#icon-arrow-right"></use></svg></a></li><li><a class="group flex items-center rounded-5 transition-colors lg:px-10 lg:py-[8px] lg:hover:bg-cool-gray lg:focus:bg-cool-gray _link_1kv8l_1" href="/p/clickcaptcha"><span class="mr-10">Click Captcha</span><svg class="icon icon-arrow-right ml-auto hidden flex-shrink-0 group-hover:block group-focus:block"><use xlink:href="/dist/web/assets/symbol-defs-Ba5hjZu8.svg#icon-arrow-right" href="/dist/web/assets/symbol-defs-Ba5hjZu8.svg#icon-arrow-right"></use></svg></a></li><li><a class="group flex items-center rounded-5 transition-colors lg:px-10 lg:py-[8px] lg:hover:bg-cool-gray lg:focus:bg-cool-gray _link_1kv8l_1" href="/p/slider-captcha-solver"><span class="mr-10">Slider Captcha</span><svg class="icon icon-arrow-right ml-auto hidden flex-shrink-0 group-hover:block group-focus:block"><use xlink:href="/dist/web/assets/symbol-defs-Ba5hjZu8.svg#icon-arrow-right" href="/dist/web/assets/symbol-defs-Ba5hjZu8.svg#icon-arrow-right"></use></svg></a></li><li><a class="group flex items-center rounded-5 transition-colors lg:px-10 lg:py-[8px] lg:hover:bg-cool-gray lg:focus:bg-cool-gray _link_1kv8l_1" href="/p/cutcaptcha-solver"><span class="mr-10">Cutcaptcha</span><svg class="icon icon-arrow-right ml-auto hidden flex-shrink-0 group-hover:block group-focus:block"><use xlink:href="/dist/web/assets/symbol-defs-Ba5hjZu8.svg#icon-arrow-right" href="/dist/web/assets/symbol-defs-Ba5hjZu8.svg#icon-arrow-right"></use></svg></a></li><li><a class="group flex items-center rounded-5 transition-colors lg:px-10 lg:py-[8px] lg:hover:bg-cool-gray lg:focus:bg-cool-gray _link_1kv8l_1" href="/p/tencent-captcha-solver"><span class="mr-10">Tencent Captcha</span><svg class="icon icon-arrow-right ml-auto hidden flex-shrink-0 group-hover:block group-focus:block"><use xlink:href="/dist/web/assets/symbol-defs-Ba5hjZu8.svg#icon-arrow-right" href="/dist/web/assets/symbol-defs-Ba5hjZu8.svg#icon-arrow-right"></use></svg></a></li><li><a class="group flex items-center rounded-5 transition-colors lg:px-10 lg:py-[8px] lg:hover:bg-cool-gray lg:focus:bg-cool-gray _link_1kv8l_1" href="/p/altcha-solver"><span class="mr-10">ALTCHA</span><svg class="icon icon-arrow-right ml-auto hidden flex-shrink-0 group-hover:block group-focus:block"><use xlink:href="/dist/web/assets/symbol-defs-Ba5hjZu8.svg#icon-arrow-right" href="/dist/web/assets/symbol-defs-Ba5hjZu8.svg#icon-arrow-right"></use></svg></a></li><li><a class="group flex items-center rounded-5 transition-colors lg:px-10 lg:py-[8px] lg:hover:bg-cool-gray lg:focus:bg-cool-gray _link_1kv8l_1" href="/p/temu-captcha-solver"><span class="mr-10">Temu Captcha</span><svg class="icon icon-arrow-right ml-auto hidden flex-shrink-0 group-hover:block group-focus:block"><use xlink:href="/dist/web/assets/symbol-defs-Ba5hjZu8.svg#icon-arrow-right" href="/dist/web/assets/symbol-defs-Ba5hjZu8.svg#icon-arrow-right"></use></svg></a></li><li><a class="group flex items-center rounded-5 transition-colors lg:px-10 lg:py-[8px] lg:hover:bg-cool-gray lg:focus:bg-cool-gray _link_1kv8l_1" href="/p/capy_puzzle"><span class="mr-10">Capy Puzzle</span><svg class="icon icon-arrow-right ml-auto hidden flex-shrink-0 group-hover:block group-focus:block"><use xlink:href="/dist/web/assets/symbol-defs-Ba5hjZu8.svg#icon-arrow-right" href="/dist/web/assets/symbol-defs-Ba5hjZu8.svg#icon-arrow-right"></use></svg></a></li><li><a class="group flex items-center rounded-5 transition-colors lg:px-10 lg:py-[8px] lg:hover:bg-cool-gray lg:focus:bg-cool-gray _link_1kv8l_1" href="/p/atb-captcha-solver"><span class="mr-10">atbCAPTCHA</span><svg class="icon icon-arrow-right ml-auto hidden flex-shrink-0 group-hover:block group-focus:block"><use xlink:href="/dist/web/assets/symbol-defs-Ba5hjZu8.svg#icon-arrow-right" href="/dist/web/assets/symbol-defs-Ba5hjZu8.svg#icon-arrow-right"></use></svg></a></li><li><a class="group flex items-center rounded-5 transition-colors lg:px-10 lg:py-[8px] lg:hover:bg-cool-gray lg:focus:bg-cool-gray _link_1kv8l_1" href="/p/procaptcha-solver"><span class="mr-10">Prosopo Procaptcha</span><svg class="icon icon-arrow-right ml-auto hidden flex-shrink-0 group-hover:block group-focus:block"><use xlink:href="/dist/web/assets/symbol-defs-Ba5hjZu8.svg#icon-arrow-right" href="/dist/web/assets/symbol-defs-Ba5hjZu8.svg#icon-arrow-right"></use></svg></a></li><li><a class="group flex items-center rounded-5 transition-colors lg:px-10 lg:py-[8px] lg:hover:bg-cool-gray lg:focus:bg-cool-gray _link_1kv8l_1" href="/p/captchafox-solver"><span class="mr-10">CaptchaFox</span><svg class="icon icon-arrow-right ml-auto hidden flex-shrink-0 group-hover:block group-focus:block"><use xlink:href="/dist/web/assets/symbol-defs-Ba5hjZu8.svg#icon-arrow-right" href="/dist/web/assets/symbol-defs-Ba5hjZu8.svg#icon-arrow-right"></use></svg></a></li><li><a class="group flex items-center rounded-5 transition-colors lg:px-10 lg:py-[8px] lg:hover:bg-cool-gray lg:focus:bg-cool-gray _link_1kv8l_1" href="/p/vk-captcha-solver"><span class="mr-10">VK Captcha</span><svg class="icon icon-arrow-right ml-auto hidden flex-shrink-0 group-hover:block group-focus:block"><use xlink:href="/dist/web/assets/symbol-defs-Ba5hjZu8.svg#icon-arrow-right" href="/dist/web/assets/symbol-defs-Ba5hjZu8.svg#icon-arrow-right"></use></svg></a></li></ul></div></div><span class="absolute left-0 right-0 top-full hidden h-10 w-full lg:block" style="background-image:linear-gradient(0deg, rgba(17, 25, 35, 0) 0%, rgba(17, 25, 35, 0.1) 100%)"></span></div></div></li><li><a class="flex rounded-5 bg-transparent px-10 py-[7px] text-white" href="/make-money-online">Entry job</a></li><li><a class="flex rounded-5 bg-transparent px-10 py-[7px] text-white" href="/api-docs">API</a></li><li><a class="flex rounded-5 bg-transparent px-10 py-[7px] text-white" href="/proxy">Proxy</a></li><li><a class="flex rounded-5 bg-transparent px-10 py-[7px] text-white" href="/software">Software</a></li><li><a class="flex rounded-5 bg-transparent px-10 py-[7px] text-white" href="/blog">Blog</a></li></ul><span class="hidden lg:block bg-midnight-blue h-[40px] w-px mr-10"></span><div class="flex lg:mr-10"><button type="button" class="flex w-full rounded-5 bg-transparent text-earls-green px-10 py-[7px]">Contact sales</button></div><ul class="-order-1 mb-30 flex items-center justify-center gap-20 lg:order-3 lg:mb-0"><li><a class="_button_1cbf7_1 _buttonPrimaryEarlsGreen_1cbf7_79 _buttonMd_1cbf7_30" href="/auth/register">Sign up</a></li><li><a class="_link_1kv8l_1 _linkEarlsGreen_1kv8l_43" href="/auth/login"><span class="_linkPrepend_1kv8l_56"><svg class="icon icon-login"><use xlink:href="/dist/web/assets/symbol-defs-Ba5hjZu8.svg#icon-login" href="/dist/web/assets/symbol-defs-Ba5hjZu8.svg#icon-login"></use></svg></span>Log in</a></li></ul></div><button type="button" class="flex text-[20px] leading-none ml-auto lg:hidden"><span class="sr-only">Toggle site navigation menu</span><svg class="icon icon-bars"><use xlink:href="/dist/web/assets/symbol-defs-Ba5hjZu8.svg#icon-bars" href="/dist/web/assets/symbol-defs-Ba5hjZu8.svg#icon-bars"></use></svg></button></div></div></header><main class="_main_1smur_8 max-lg:!py-0 leading-[30px]"><span class="absolute -z-10 bottom-0 left-0 right-0 top-0 block h-full w-full bg-teal overflow-hidden" aria-hidden="true"><svg width="1920" height="1080" viewBox="0 0 1920 1080" fill="none" xmlns="http://www.w3.org/2000/svg" class="block h-auto w-full max-w-full"><mask id="mask0_5195_2" style="mask-type:alpha" maskUnits="userSpaceOnUse" x="0" y="0" width="1920" height="1080"><path d="M0 1080V0H1920V1080H0Z" fill="black"></path></mask><g mask="url(#mask0_5195_2)"><path d="M0 1080V0H1920V1080H0Z" fill="#00A1B3"></path><g opacity="0.8" filter="url(#filter0_f_5195_2)"><path d="M764.8 -380.8L745.6 -400H-400V784L764.8 -380.8Z" fill="#EEF44C"></path></g><g opacity="0.8" filter="url(#filter1_f_5195_2)"><path d="M1251.19 -400H2319.99V822.4L1174.39 -323.2L1251.19 -400Z" fill="#EEF44C"></path></g><g filter="url(#filter2_f_5195_2)"><path d="M1036.81 307.2L329.609 -400H1744.01L1036.81 307.2Z" fill="#CBF0E9"></path></g><g filter="url(#filter3_f_5195_2)"><path d="M2089.59 -400L1209.59 480L1113.59 384L1113.6 383.998L1017.6 288L1705.6 -400H2089.59Z" fill="#E5E140"></path></g><g filter="url(#filter4_f_5195_2)"><path d="M172.812 479.999L499.212 153.599L595.212 249.599L268.812 575.999L172.812 479.999Z" fill="#FFFC7D"></path></g><g filter="url(#filter5_f_5195_2)"><path d="M1036.81 729.6L-92.793 -400H368.007L1267.21 499.2L1036.81 729.6Z" fill="#0FD4DC"></path></g><path d="M0 1080V720H1920V1080H0Z" fill="url(#paint0_linear_5195_2)"></path></g><defs><filter id="filter0_f_5195_2" x="-700" y="-700" width="1764.8" height="1784" filterUnits="userSpaceOnUse" color-interpolation-filters="sRGB"><feFlood flood-opacity="0" result="BackgroundImageFix"></feFlood><feBlend mode="normal" in="SourceGraphic" in2="BackgroundImageFix" result="shape"></feBlend><feGaussianBlur stdDeviation="150" result="effect1_foregroundBlur_5195_2"></feGaussianBlur></filter><filter id="filter1_f_5195_2" x="874.395" y="-700" width="1745.6" height="1822.4" filterUnits="userSpaceOnUse" color-interpolation-filters="sRGB"><feFlood flood-opacity="0" result="BackgroundImageFix"></feFlood><feBlend mode="normal" in="SourceGraphic" in2="BackgroundImageFix" result="shape"></feBlend><feGaussianBlur stdDeviation="150" result="effect1_foregroundBlur_5195_2"></feGaussianBlur></filter><filter id="filter2_f_5195_2" x="29.6094" y="-700" width="2014.4" height="1307.2" filterUnits="userSpaceOnUse" color-interpolation-filters="sRGB"><feFlood flood-opacity="0" result="BackgroundImageFix"></feFlood><feBlend mode="normal" in="SourceGraphic" in2="BackgroundImageFix" result="shape"></feBlend><feGaussianBlur stdDeviation="150" result="effect1_foregroundBlur_5195_2"></feGaussianBlur></filter><filter id="filter3_f_5195_2" x="717.598" y="-700" width="1672" height="1480" filterUnits="userSpaceOnUse" color-interpolation-filters="sRGB"><feFlood flood-opacity="0" result="BackgroundImageFix"></feFlood><feBlend mode="normal" in="SourceGraphic" in2="BackgroundImageFix" result="shape"></feBlend><feGaussianBlur stdDeviation="150" result="effect1_foregroundBlur_5195_2"></feGaussianBlur></filter><filter id="filter4_f_5195_2" x="-127.188" y="-146.401" width="1022.4" height="1022.4" filterUnits="userSpaceOnUse" color-interpolation-filters="sRGB"><feFlood flood-opacity="0" result="BackgroundImageFix"></feFlood><feBlend mode="normal" in="SourceGraphic" in2="BackgroundImageFix" result="shape"></feBlend><feGaussianBlur stdDeviation="150" result="effect1_foregroundBlur_5195_2"></feGaussianBlur></filter><filter id="filter5_f_5195_2" x="-392.793" y="-700" width="1960" height="1729.6" filterUnits="userSpaceOnUse" color-interpolation-filters="sRGB"><feFlood flood-opacity="0" result="BackgroundImageFix"></feFlood><feBlend mode="normal" in="SourceGraphic" in2="BackgroundImageFix" result="shape"></feBlend><feGaussianBlur stdDeviation="150" result="effect1_foregroundBlur_5195_2"></feGaussianBlur></filter><linearGradient id="paint0_linear_5195_2" x1="960" y1="720" x2="960" y2="1080" gradientUnits="userSpaceOnUse"><stop stop-color="#00A1B3" stop-opacity="0"></stop><stop offset="1" stop-color="#00A1B3"></stop></linearGradient></defs></svg></span><div class="container _container_1smur_21 px-0 lg:px-15"><button type="button" class="_scrollBtn_mgllk_1"><svg class="icon icon-chevron-up _scrollBtnIcon_mgllk_31"><use xlink:href="/dist/web/assets/symbol-defs-Ba5hjZu8.svg#icon-chevron-up" href="/dist/web/assets/symbol-defs-Ba5hjZu8.svg#icon-chevron-up"></use></svg><span>Go up</span></button><div class="relative flex-grow bg-white text-dark lg:flex lg:rounded-10 lg:static" lang="en"><div class="min-h-64 px-15 py-20 lg:px-30 lg:pt-40 lg:pb-40 lg:w-[840px] lg:border-r lg:border-cloud-blue"><div class="mb-35 inline-flex items-center gap-[2px] rounded-5 bg-cool-gray px-[2px] py-[2px] text-base"><a aria-current="page" class="rounded-5 bg-transparent px-10 py-5 font-semibold text-steel-gray [&amp;.active]:bg-teal [&amp;.active]:text-white active" href="/2captcha-api">Captcha Solver API</a><a class="rounded-5 bg-transparent px-10 py-5 font-semibold text-steel-gray [&amp;.active]:bg-teal [&amp;.active]:text-white" href="/proxy/api">Proxy API</a></div><h1 class="mb-15 mr-40 font-semibold text-[30px] leading-[40px]">2Captcha API v1</h1><section class="_section_1m9bc_1"><img class="_img_1m9bc_31" src="/dist/web/assets/new-json-api-y30z9VIU.svg" alt="New JSON API" width="285" height="160"/><div class="_textContent_1m9bc_59"><h2 class="_title_1m9bc_12">Try new API. API v2 is built on JSON</h2><p class="_text_1m9bc_20">The earlier API v1 continues to be stable and supported. If you do not plan to use the new API v2, no action is required. We support both versions of the API.</p><a class="_action_1m9bc_25 _button_1cbf7_1 _buttonPrimary_1cbf7_40 _buttonMd_1cbf7_30" href="/api-docs">Try API v2</a></div><button type="button" class="_close_1m9bc_36"><svg class="icon icon-x"><use xlink:href="/dist/web/assets/symbol-defs-Ba5hjZu8.svg#icon-x" href="/dist/web/assets/symbol-defs-Ba5hjZu8.svg#icon-x"></use></svg><span class="visually-hidden">Close notification and continue reading API v1</span></button></section><div id="old-api-docs-editor" class="md-editor _markup_15n71_1  md-editor-previewOnly"><div id="old-api-docs-editor-preview-wrapper" class="md-editor-preview-wrapper"><div id="old-api-docs-editor-preview" class="md-editor-preview github-theme md-editor-scrn"><p data-line="0">2Captcha is a human-powered image and CAPTCHA recognition service. 2Captcha's main purpose is solving your CAPTCHAs in a quick and accurate way by human employees, but the service is not limited only to CAPTCHA solving. You can convert to text any image that a human can recognize.</p>
<section id="intro">
<h3 id="introduction" tabindex="-1" data-line="4"><a class="header-anchor" href="#introduction">Introduction</a></h3>
<p data-line="6">We provide an API that allows you to automate the process and integrate your software with our service.</p>
<p data-line="8">There are few simple steps to solve your captcha or recognize the image:</p>
<ol data-line="10">
<li data-line="10">Send your image or captcha to our server.</li>
<li data-line="11">Get the ID of your task.</li>
<li data-line="12">Start a cycle that checks if your task is completed.</li>
<li data-line="13">Get the result.</li>
</ol>
</section>
<section id="recent_changes">
<h3 id="recent-changes" tabindex="-1" data-line="18"><a class="header-anchor" href="#recent-changes">Recent Changes</a></h3>
<p data-line="19"><strong>December 2, 2025</strong></p>
<p data-line="21">Added <a href="#altchacaptcha">Altcha Captcha</a> support</p>
<p data-line="23"><strong>August 12, 2025</strong></p>
<p data-line="25">Added <a href="#temucaptcha">Temu Captcha</a> support</p>
<p data-line="27"><strong>July 17, 2025</strong></p>
<p data-line="29">Added <a href="#vkcaptcha">VK Captcha</a> support</p>
<p data-line="31"><strong>April 28, 2025</strong></p>
<p data-line="33">Added <a href="#captchafox">CaptchaFox</a> support</p>
<p data-line="35"><strong>December 12, 2024</strong></p>
<p data-line="37">Added <a href="#prosopo-procaptcha">Prosopo Procaptcha</a> support</p>
<p data-line="39"><strong>April 22, 2024</strong></p>
<p data-line="41">Added <a href="#tencent">Tencent captcha</a> support</p>
<p data-line="43"><strong>April 12, 2024</strong></p>
<p data-line="45">Added <a href="#atb-captcha">atbCAPTCHA</a> support</p>
<p data-line="47"><strong>December 19, 2023</strong></p>
<p data-line="49">Added <a href="#friendly-captcha">Friendly Captcha</a> support</p>
<p data-line="51"><strong>November 14, 2023</strong></p>
<p data-line="53">Added <a href="#cutcaptcha">Cutcaptcha</a> support</p>
<p data-line="55"><strong>March 16, 2023</strong></p>
<p data-line="57">Added <a href="#audio">Audio</a> recognition method</p>
<p data-line="59"><strong>January 27, 2023</strong></p>
<p data-line="61">Added <a href="#amazon-waf">Amazon WAF</a> support</p>
<p data-line="63"><strong>December 7, 2022</strong></p>
<p data-line="65">Added <a href="#turnstile">Cloudflare Turnstile</a> support</p>
<p data-line="67"><strong>October 13, 2022</strong></p>
<p data-line="69">Temporary removed <a href="#solving_tiktok">TikTok</a> method</p>
<p data-line="71"><strong>July 29, 2022</strong></p>
<p data-line="73">Added <a href="#lemin">Lemin method</a></p>
<p data-line="75"><strong>March 24, 2022</strong></p>
<p data-line="77">Added <a href="#geetest-v4">Geetest v4</a> support</p>
<p data-line="79"><strong>July 6, 2021</strong></p>
<p data-line="81">Added <code>recaptcha.net</code> domain support for reCAPTCHA</p>
<p data-line="83"><strong>January 21, 2021</strong></p>
<p data-line="85">Updated <a href="#solving_recaptcha_enterprise">reCAPTCHA Enterprise</a> method</p>
<p data-line="87"><strong>December 22, 2020</strong></p>
<p data-line="89">Added <a href="#demo">Demo</a> page</p>
<p data-line="91"><strong>September 1, 2020</strong></p>
<p data-line="93">Added <a href="#solving_recaptcha_enterprise">reCAPTCHA Enterprise method</a></p>
<p data-line="95"><strong>July 27, 2020</strong></p>
<p data-line="97">Added <a href="#solving_tiktok">TikTok method</a></p>
<p data-line="99"><strong>June 1, 2020</strong></p>
<p data-line="101">Added <a href="#solving_capy">Capy method</a></p>
<p data-line="103"><strong>May 29, 2020</strong></p>
<p data-line="105">Added support of data-s, cookies and userAgent for <a href="#solving_recaptchav2_new">reCAPTCHA V2</a></p>
<p data-line="107"><strong>July 4, 2019</strong></p>
<p data-line="109">Added <code>surl</code> parameter support for <a href="#solving_funcaptcha_new">FunCaptcha</a></p>
<p data-line="111"><strong>June 18, 2019</strong></p>
<p data-line="113">Added <a href="/setting/pingback">pingback management</a> interface. <a href="#manage_pingback">More info here</a></p>
<p data-line="115"><strong>May 31, 2019</strong></p>
<p data-line="117">ReportGOOD method added and it is recommended to use it. <a href="#complain">More info here</a></p>
<p data-line="119"><strong>February 11, 2019</strong></p>
<p data-line="121">Added Geetest API. <a href="#solving_geetest">More info here</a></p>
<p data-line="123"><strong>February 1, 2019</strong></p>
<p data-line="125">Added debugging method. <a href="#debugging">More info here</a></p>
<p data-line="127"><strong>December 19, 2018</strong></p>
<p data-line="129">Added reCAPTCHA V3 method description. <a href="#solving_recaptchav3">More info here</a></p>
<p data-line="131"><strong>September 21, 2018</strong></p>
<p data-line="133">Updated pingback logic. Now you only need to register a domain/IP instead of full URL. <a href="#pingback">More info here</a></p>
<p data-line="135"><strong>April 17, 2018</strong></p>
<p data-line="137">New parameter added for extended language support <a href="#language">More info here</a></p>
<p data-line="139"><strong>January 18, 2018</strong></p>
<p data-line="141">New parameter added for invisible reCAPTCHA <a href="#invisible">More info here</a></p>
<p data-line="143"><strong>January 17, 2018</strong></p>
<p data-line="145">New method for FunCaptcha implemented! <a href="#solving_funcaptcha_new">More info here</a></p>
<p data-line="147"><strong>December 12, 2017</strong></p>
<p data-line="149">AudioCaptcha method is now deprecated as non effective and unpolular method.</p>
<p data-line="151"><strong>February 24, 2017</strong></p>
<p data-line="153">Added some notes on Invisible reCAPTCHA solving. <a href="#invisible">More info here</a>.</p>
<p data-line="155"><strong>November 24, 2016</strong></p>
<p data-line="157">We've added new error codes to our API corresponding to requests limits. <a href="#limits">More info here</a>.</p>
<p data-line="159"><strong>November 9, 2016</strong></p>
<p data-line="161">We've added some new examples for reCAPTCHA V2 API check them out <a href="#examples">here</a>.</p>
<p data-line="163"><strong>November 9, 2016</strong></p>
<p data-line="165">At the moment reCAPTCHA V2 can be solved for any website. It's required to <a href="#pageurl">send us the full URL of the page</a> where you get reCAPTCHA (it wasn't required before). <a href="#proxies">Sending the proxy information</a> is not obligatory yet but it's recommended.</p>
</section>
<section id="rates">
<h3 id="our-rates" tabindex="-1" data-line="170"><a class="header-anchor" href="#our-rates">Our rates</a></h3>
<p data-line="172">Our rates can be found on <a href="/pricing">Pricing</a> page.</p>
</section>
<section id="demo">
<h3 id="demo-page" tabindex="-1" data-line="177"><a class="header-anchor" href="#demo-page">Demo page</a></h3>
<p data-line="179">You may visit this <a href="https://2captcha.com/demo">Demo page</a> to learn examples of how you can bypass different captcha types using PHP, Java and Python.</p>
</section>
<section id="solving_captchas">
<h3 id="solving-captchas" tabindex="-1" data-line="184"><a class="header-anchor" href="#solving-captchas">Solving Captchas</a></h3>
<p data-line="186">Our API is based on HTTP requests and supports both HTTP and HTTPS protocols.</p>
<p data-line="188">API endpoints:</p>
<ul data-line="190">
<li data-line="190"><code>https://2captcha.com/in.php</code> is used to submit a captcha</li>
<li data-line="191"><code>https://2captcha.com/res.php</code> is used to get the captcha solution</li>
</ul>
<p data-line="193">The process of solving captchas with 2Captcha is really easy and it's mostly the same for all types of captchas:</p>
<ol data-line="195">
<li data-line="195">Get your API key from <a href="https://2captcha.com/setting">your account settings page</a>. Each user is given a unique authentication token, we call it <em>API key</em>. It's a 32-characters string that looks like:<br>
<code>1abc234de56fab7c89012d34e56fa7b8</code><br>
This key will be used for all your requests to our server.</li>
<li data-line="198">Submit a <em>HTTP POST</em> request to our API URL: <code>https://2captcha.com/in.php</code> with parameters corresponding to the type of your captcha.<br>
Server will return captcha ID or an <a href="#error_handling">error code</a> if something went wrong.</li>
<li data-line="200">Make a timeout: 20 seconds for reCAPTCHA, 5 seconds for other types of captchas.</li>
<li data-line="201">Submit a <em>HTTP GET</em> request to our API URL: <code>https://2captcha.com/res.php</code> to get the result.<br>
If captcha is already solved server will return the answer in format corresponding to the type of your captcha.<br>
By default answers are returned as plain text like: <em>OK|Your answer</em>. But answer can also be returned as JSON <em>{&quot;status&quot;:1,&quot;request&quot;:&quot;TEXT&quot;}</em> if <em>json</em> parameter is used.<br>
If captcha is not solved yet server will return <em>CAPCHA_NOT_READY</em> result. Repeat your request in 5 seconds.<br>
If something went wrong server will return an <a href="#error_handling">error code</a>.</li>
</ol>
</section>
<section id="solving_normal_captcha">
<h4 id="normal-captcha" tabindex="-1" data-line="210"><a class="header-anchor" href="#normal-captcha">Normal Captcha</a></h4>
<blockquote data-line="212">
<p data-line="212">Normal Captcha is an image that contains distored but human-readable text. To solve the captcha user have to type the text from the image.</p>
</blockquote>
<p data-line="214">To solve the captcha with our service you have to submit the image with <em>HTTP POST</em> request to our API URL: <code>https://2captcha.com/in.php</code><br>
Server accepts images in <em>multipart</em> or <em>base64</em> format.</p>
<p data-line="217"><strong>Multipart sample form</strong></p>

        <details  data-line="219" class="md-editor-code" open="">
          <summary class="md-editor-code-head">
            <div class="md-editor-code-flag"><span></span><span></span><span></span></div>
            <div class="md-editor-code-action">
              <span class="md-editor-code-lang"></span>
              <span class="md-editor-copy-button" data-tips="Copy">Copy</span>
              
              <span class="md-editor-collapse-tips"><svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="lucide lucide-circle-chevron-left md-editor-icon"><circle cx="12" cy="12" r="10"/><path d="m14 16-4-4 4-4"/></svg></span>
            </div>
          </summary>
          <pre><code class="language-" language=><span class="md-editor-code-block">&lt;form method=&quot;post&quot; action=&quot;https://2captcha.com/in.php&quot; enctype=&quot;multipart/form-data&quot;&gt;
&lt;input type=&quot;hidden&quot; name=&quot;method&quot; value=&quot;post&quot;&gt;
Your key:
&lt;input type=&quot;text&quot; name=&quot;key&quot; value=&quot;YOUR_APIKEY&quot;&gt;
The CAPTCHA file:
&lt;input type=&quot;file&quot; name=&quot;file&quot;&gt;
&lt;input type=&quot;submit&quot; value=&quot;Upload and get the ID&quot;&gt;
&lt;/form&gt;</span><span rn-wrapper aria-hidden="true"><span></span><span></span><span></span><span></span><span></span><span></span><span></span><span></span></span></code></pre>

        </details>
      <p data-line="228"><em>YOUR_APIKEY</em> is <a href="#solving_captchas">Your API key</a>.</p>
<p data-line="230"><strong>Base64 sample form</strong></p>

        <details  data-line="232" class="md-editor-code" open="">
          <summary class="md-editor-code-head">
            <div class="md-editor-code-flag"><span></span><span></span><span></span></div>
            <div class="md-editor-code-action">
              <span class="md-editor-code-lang"></span>
              <span class="md-editor-copy-button" data-tips="Copy">Copy</span>
              
              <span class="md-editor-collapse-tips"><svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="lucide lucide-circle-chevron-left md-editor-icon"><circle cx="12" cy="12" r="10"/><path d="m14 16-4-4 4-4"/></svg></span>
            </div>
          </summary>
          <pre><code class="language-" language=><span class="md-editor-code-block">&lt;form method=&quot;post&quot; action=&quot;https://2captcha.com/in.php&quot;&gt;
&lt;input type=&quot;hidden&quot; name=&quot;method&quot; value=&quot;base64&quot;&gt;
Your key:
&lt;input type=&quot;text&quot; name=&quot;key&quot; value=&quot;YOUR_APIKEY&quot;&gt;
The CAPTCHA file body in base64 format:
&lt;textarea name=&quot;body&quot;&gt;BASE64_FILE&lt;/textarea&gt;
&lt;input type=&quot;submit&quot; value=&quot;Upload and get the ID&quot;&gt;
&lt;/form&gt;</span><span rn-wrapper aria-hidden="true"><span></span><span></span><span></span><span></span><span></span><span></span><span></span><span></span></span></code></pre>

        </details>
      <p data-line="241"><em>YOUR_APIKEY</em> is <a href="#solving_captchas">your API key</a>.</p>
<p data-line="243"><em>BASE64_FILE</em> is base64-encoded image body.</p>
<p data-line="245">You can provide additional parameters with your request to define what kind of captcha you're sending and to help workers to solve your captcha correctly. You can find the full list of parameters in the <a href="#normal_post">table below.</a></p>
<p data-line="247">If everything is fine server will return the ID of your captcha as plain text, like: <em>OK|2122988149</em> or as JSON <em>{&quot;status&quot;:1,&quot;request&quot;:&quot;2122988149&quot;}</em> if json parameter was used.</p>
<p data-line="249">If something went wrong server will return an error. See <a href="#error_handling">Error Handling</a> chapter for the list of errors.</p>
<p data-line="251">Make a 5 seconds timeout and submit a <em>HTTP GET</em> request to our API URL: <code>https://2captcha.com/res.php</code> providing the captcha ID. The list of parameters is in the <a href="#normal_get">table below</a>.</p>
<p data-line="253">If everything is fine and your captcha is solved server will return the answer as plain text, like: <em>OK|TEXT</em> or as JSON <em>{&quot;status&quot;:1,&quot;request&quot;:&quot;TEXT&quot;}</em> if <em>json</em> parameter was used.</p>
<p data-line="255">Otherwise server will return <em>CAPCHA_NOT_READY</em> that means that your captcha is not solved yet. Just repeat your request in 5 seconds.</p>
<p data-line="257">If something went wrong server will return an error. See <a href="#error_handling">Error Handling</a> chapter for the list of errors.</p>
<p data-line="259"><strong><div id="normal_post">List of <em>POST</em> request parameters for <a href="https://2captcha.com/in.php">https://2captcha.com/in.php</a></div></strong></p>
<table data-line="261">
<thead data-line="261">
<tr data-line="261">
<th><strong>POST parameter</strong></th>
<th><strong>Type</strong></th>
<th><strong>Required</strong></th>
<th><strong>Description</strong></th>
</tr>
</thead>
<tbody data-line="263">
<tr data-line="263">
<td>key</td>
<td>String</td>
<td>Yes</td>
<td><a href="#solving_captchas">your API key</a></td>
</tr>
<tr data-line="264">
<td>method</td>
<td>String</td>
<td>Yes</td>
<td>post - defines that you're sending an image with multipart form <br>base64 - defines that you're sending a base64 encoded image</td>
</tr>
<tr data-line="265">
<td>file</td>
<td>File</td>
<td>Yes*</td>
<td>Captcha image file. <br>* - required if you submit image as a file (method=post)</td>
</tr>
<tr data-line="266">
<td>body</td>
<td>String</td>
<td>Yes*</td>
<td>Base64-encoded captcha image <br>* - required if you submit image as Base64-encoded string (method=base64)</td>
</tr>
<tr data-line="267">
<td>phrase</td>
<td>Integer <br>Default: 0</td>
<td>No</td>
<td>0 - captcha contains one word <br>1 - captcha contains two or more words</td>
</tr>
<tr data-line="268">
<td>regsense</td>
<td>Integer <br>Default: 0</td>
<td>No</td>
<td>0 - captcha in not case sensitive <br>1 - captcha is case sensitive</td>
</tr>
<tr data-line="269">
<td>numeric</td>
<td>Integer <br>Default: 0</td>
<td>No</td>
<td>0 - not specified <br>1 - captcha contains only numbers <br>2 - captcha contains only letters <br>3 - captcha contains only numbers OR only letters <br>4 - captcha MUST contain both numbers AND letters</td>
</tr>
<tr data-line="270">
<td>calc</td>
<td>Integer <br>Default: 0</td>
<td>No</td>
<td>0 - not specified <br>1 - captcha requires calculation (e.g. type the result 4 + 8 = )</td>
</tr>
<tr data-line="271">
<td>min_len</td>
<td>Integer <br>Default: 0</td>
<td>No</td>
<td>0 - not specified <br>1..20 - minimal number of symbols in captcha</td>
</tr>
<tr data-line="272">
<td>max_len</td>
<td>Integer <br>Default: 0</td>
<td>No</td>
<td>0 - not specified <br>1..20 - maximal number of symbols in captcha</td>
</tr>
<tr data-line="273">
<td>language</td>
<td>Integer <br>Default: 0</td>
<td>No</td>
<td>0 - not specified <br>1 - Cyrillic captcha <br>2 - Latin captcha</td>
</tr>
<tr data-line="274">
<td>lang</td>
<td>String</td>
<td>No</td>
<td>Language code. <a href="#language">See the list of supported languages.</a></td>
</tr>
<tr data-line="275">
<td>textinstructions</td>
<td>String <br>Max 140 characters <br>Endcoding: UTF-8</td>
<td>No</td>
<td>Text will be shown to worker to help him to solve the captcha correctly. <br>For example: type red symbols only.</td>
</tr>
<tr data-line="276">
<td>imginstructions</td>
<td>Image <br>Max 400x150px, 100 kB</td>
<td>Yes</td>
<td>Image with instruction for solving reCAPTCHA. <br><strong>Not required</strong> if you're sending instruction as text with <em>textinstructions</em>.</td>
</tr>
<tr data-line="277">
<td>header_acao</td>
<td>Integer <br>Default: 0</td>
<td>No</td>
<td>0 - disabled <br>1 - enabled. <br>If enabled <code>in.php</code> will include <em>Access-Control-Allow-Origin:*</em> header in the response. <br>Used for cross-domain AJAX requests in web applications.</td>
</tr>
<tr data-line="278">
<td>pingback</td>
<td>String</td>
<td>No</td>
<td>URL for pingback (callback) response that will be sent when captcha is solved. <br>URL should be registered on the server. <a href="#pingback">More info here</a>.</td>
</tr>
<tr data-line="279">
<td>json</td>
<td>Integer <br>Default: 0</td>
<td>No</td>
<td>0 - server will send the response as plain text <br>1 - tells the server to send the response as JSON</td>
</tr>
<tr data-line="280">
<td>soft_id</td>
<td>Integer</td>
<td>No</td>
<td>ID of software developer. Developers who integrated their software with 2Captcha get reward: 10% of spendings of their software users.</td>
</tr>
</tbody>
</table>
<p data-line="282"><strong>List of <em>GET</em> request parameters for <a href="https://2captcha.com/res.php">https://2captcha.com/res.php</a></strong></p>
<table data-line="284">
<thead data-line="284">
<tr data-line="284">
<th><strong>GET parameter</strong></th>
<th><strong>Type</strong></th>
<th><strong>Required</strong></th>
<th><strong>Description</strong></th>
</tr>
</thead>
<tbody data-line="286">
<tr data-line="286">
<td>key</td>
<td>String</td>
<td>Yes</td>
<td><a href="#solving_captchas">your API key</a></td>
</tr>
<tr data-line="287">
<td>action</td>
<td>String</td>
<td>Yes</td>
<td>get - get the asnwer for your captcha</td>
</tr>
<tr data-line="288">
<td>id</td>
<td>Integer</td>
<td>Yes</td>
<td>ID of captcha returned by in.php.</td>
</tr>
<tr data-line="289">
<td>json</td>
<td>Integer <br>Default: 0</td>
<td>No</td>
<td>0 - server will send the response as plain text <br>1 - tells the server to send the response as JSON</td>
</tr>
<tr data-line="290">
<td>header_acao</td>
<td>Integer <br>Default: 0</td>
<td>No</td>
<td>0 - disabled <br>1 - enabled. <br>If enabled <code>res.php</code> will include <em>Access-Control-Allow-Origin:*</em> header in the response. <br>Used for cross-domain AJAX requests in web applications.</td>
</tr>
</tbody>
</table>
<p data-line="292"><strong>Request URL example:</strong></p>

        <details  data-line="294" class="md-editor-code" open="">
          <summary class="md-editor-code-head">
            <div class="md-editor-code-flag"><span></span><span></span><span></span></div>
            <div class="md-editor-code-action">
              <span class="md-editor-code-lang"></span>
              <span class="md-editor-copy-button" data-tips="Copy">Copy</span>
              
              <span class="md-editor-collapse-tips"><svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="lucide lucide-circle-chevron-left md-editor-icon"><circle cx="12" cy="12" r="10"/><path d="m14 16-4-4 4-4"/></svg></span>
            </div>
          </summary>
          <pre><code class="language-" language=><span class="md-editor-code-block">https://2captcha.com/res.php?key=1abc234de56fab7c89012d34e56fa7b8&amp;action=get&amp;id=2122988149</span><span rn-wrapper aria-hidden="true"><span></span></span></code></pre>

        </details>
      </section>
<section id="solving_text_captcha">
<h4 id="text-captcha" tabindex="-1" data-line="300"><a class="header-anchor" href="#text-captcha">Text Captcha</a></h4>
<blockquote data-line="302">
<p data-line="302">Text Captcha is a type of captcha that is represented as text and doesn't contain images. Usually you have to answer a question to pass the verification.</p>
<p data-line="304"><strong>For example:</strong> &quot;If tomorrow is Saturday, what day is today?&quot;.</p>
</blockquote>
<p data-line="306">To solve text captcha with our service you have to submit the text as a value of <em>textcaptcha</em> parameter with <em>HTTP POST</em> request to our API URL: <code>https://2captcha.com/in.php</code></p>
<p data-line="308"><strong>Sample form for Text Captcha</strong></p>

        <details  data-line="310" class="md-editor-code" open="">
          <summary class="md-editor-code-head">
            <div class="md-editor-code-flag"><span></span><span></span><span></span></div>
            <div class="md-editor-code-action">
              <span class="md-editor-code-lang"></span>
              <span class="md-editor-copy-button" data-tips="Copy">Copy</span>
              
              <span class="md-editor-collapse-tips"><svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="lucide lucide-circle-chevron-left md-editor-icon"><circle cx="12" cy="12" r="10"/><path d="m14 16-4-4 4-4"/></svg></span>
            </div>
          </summary>
          <pre><code class="language-" language=><span class="md-editor-code-block">&lt;html&gt;
&lt;head&gt;
&lt;meta http-equiv=&quot;Content-Type&quot; content=&quot;text/html; charset=UTF-8&quot;&gt;
&lt;/head&gt;

&lt;body&gt;
&lt;form method=&quot;post&quot; action=&quot;https://2captcha.com/in.php&quot; enctype=&quot;multipart/form-data&quot; accept-charset=&quot;UTF-8&quot;&gt;
Your key:
&lt;input type=&quot;text&quot; name=&quot;key&quot; value=&quot;YOUR_APIKEY&quot;&gt;
&lt;input type=&quot;text&quot; name=&quot;textcaptcha&quot; value=&quot;If tomorrow is Saturday, what day is today?&quot;&gt;
&lt;input type=&quot;submit&quot; value=&quot;Send and get the ID&quot;&gt;
&lt;/form&gt;
&lt;/body&gt;
&lt;/html&gt;</span><span rn-wrapper aria-hidden="true"><span></span><span></span><span></span><span></span><span></span><span></span><span></span><span></span><span></span><span></span><span></span><span></span><span></span><span></span></span></code></pre>

        </details>
      <p data-line="325"><em>YOUR_APIKEY</em> is <a href="#solving_captchas">your API key</a>.</p>
<p data-line="327">You can provide additional parameters with your request to tell us more about your captcha and to help workers to solve it correctly. You can find the full list of parameters in the <a href="#text_post">table below.</a></p>
<p data-line="329">If everything is fine server will return the ID of your captcha as plain text, like: <em>OK|2122988149</em> or as JSON <em>{&quot;status&quot;:1,&quot;request&quot;:&quot;2122988149&quot;}</em> if json parameter was used.</p>
<p data-line="331">If something went wrong server will return an error. See <a href="#error_handling">Error Handling</a> chapter for the list of errors.</p>
<p data-line="333">Make a 5 seconds timeout and submit a <em>GET</em> request to our API URL: <code>https://2captcha.com/res.php</code> providing the captcha ID. The list of parameters is in the <a href="#text_get">table below</a>.</p>
<p data-line="335">If everything is fine and your captcha is solved server will return the answer as plain text, like: <em>OK|TEXT</em> or as JSON <em>{&quot;status&quot;:1,&quot;request&quot;:&quot;TEXT&quot;}</em> if <em>json</em> parameter was used.</p>
<p data-line="337">Otherwise server will return <em>CAPCHA_NOT_READY</em> that means that your captcha is not solved yet. Just repeat your request in 5 seconds.</p>
<p data-line="339">If something went wrong server will return an error. See <a href="#error_handling">Error Handling</a> chapter for the list of errors.</p>
<p data-line="341"><strong>List of <em>POST</em> request parameters for <a href="https://2captcha.com/in.php">https://2captcha.com/in.php</a></strong></p>
<table data-line="343">
<thead data-line="343">
<tr data-line="343">
<th><strong>POST parameter</strong></th>
<th><strong>Type</strong></th>
<th><strong>Required</strong></th>
<th><strong>Description</strong></th>
</tr>
</thead>
<tbody data-line="345">
<tr data-line="345">
<td>key</td>
<td>String</td>
<td>Yes</td>
<td><a href="#solving_captchas">your API key</a></td>
</tr>
<tr data-line="346">
<td>language</td>
<td>Integer <br>Default: 0</td>
<td>No</td>
<td>0 - not specified <br>1 - Cyrillic (Russian) captcha <br>2 - Latin captcha</td>
</tr>
<tr data-line="347">
<td>lang</td>
<td>String</td>
<td>No</td>
<td>Language code. <a href="#language">See the list of supported languages.</a></td>
</tr>
<tr data-line="348">
<td>textcaptcha</td>
<td>String <br>Max 140 characters <br>Endcoding: UTF-8</td>
<td>No</td>
<td>Text will be shown to worker to help him to solve the captcha correctly. <br>For example: type red symbols only.</td>
</tr>
<tr data-line="349">
<td>header_acao</td>
<td>Integer <br>Default: 0</td>
<td>No</td>
<td>0 - disabled <br>1 - enabled. <br>If enabled <code>in.php</code> will include <em>Access-Control-Allow-Origin:*</em> header in the response. <br>Used for cross-domain AJAX requests in web applications.</td>
</tr>
<tr data-line="350">
<td>pingback</td>
<td>String</td>
<td>No</td>
<td>URL for pingback (callback) response that will be sent when captcha is solved. <br>URL should be registered on the server. <a href="#pingback">More info here</a>.</td>
</tr>
<tr data-line="351">
<td>json</td>
<td>Integer <br>Default: 0</td>
<td>No</td>
<td>0 - server will send the response as plain text <br>1 - tells the server to send the response as JSON</td>
</tr>
<tr data-line="352">
<td>soft_id</td>
<td>Integer</td>
<td>No</td>
<td>ID of software developer. Developers who integrated their software with 2Captcha get reward: 10% of spendings of their software users.</td>
</tr>
</tbody>
</table>
<p data-line="354"><strong>List of <em>GET</em> request parameters for <a href="https://2captcha.com/res.php">https://2captcha.com/res.php</a></strong></p>
<table data-line="356">
<thead data-line="356">
<tr data-line="356">
<th><strong>GET parameter</strong></th>
<th><strong>Type</strong></th>
<th><strong>Required</strong></th>
<th><strong>Description</strong></th>
</tr>
</thead>
<tbody data-line="358">
<tr data-line="358">
<td>key</td>
<td>String</td>
<td>Yes</td>
<td><a href="#solving_captchas">your API key</a></td>
</tr>
<tr data-line="359">
<td>action</td>
<td>String</td>
<td>Yes</td>
<td>get - get the asnwer for your captcha</td>
</tr>
<tr data-line="360">
<td>id</td>
<td>Integer</td>
<td>Yes</td>
<td>ID of captcha returned by in.php.</td>
</tr>
<tr data-line="361">
<td>json</td>
<td>Integer <br>Default: 0</td>
<td>No</td>
<td>0 - server will send the response as plain text <br>1 - tells the server to send the response as JSON</td>
</tr>
<tr data-line="362">
<td>header_acao</td>
<td>Integer <br>Default: 0</td>
<td>No</td>
<td>0 - disabled <br>1 - enabled. <br>If enabled <code>res.php</code> will include <em>Access-Control-Allow-Origin:*</em> header in the response. <br>Used for cross-domain AJAX requests in web applications.</td>
</tr>
</tbody>
</table>
<p data-line="364"><strong>Request URL example:</strong></p>

        <details  data-line="366" class="md-editor-code" open="">
          <summary class="md-editor-code-head">
            <div class="md-editor-code-flag"><span></span><span></span><span></span></div>
            <div class="md-editor-code-action">
              <span class="md-editor-code-lang"></span>
              <span class="md-editor-copy-button" data-tips="Copy">Copy</span>
              
              <span class="md-editor-collapse-tips"><svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="lucide lucide-circle-chevron-left md-editor-icon"><circle cx="12" cy="12" r="10"/><path d="m14 16-4-4 4-4"/></svg></span>
            </div>
          </summary>
          <pre><code class="language-" language=><span class="md-editor-code-block">https://2captcha.com/res.php?key=1abc234de56fab7c89012d34e56fa7b8&amp;action=get&amp;id=2122988149</span><span rn-wrapper aria-hidden="true"><span></span></span></code></pre>

        </details>
      </section>
<section id="solving_recaptchav2_new">
<h4 id="recaptcha-v2" tabindex="-1" data-line="372"><a class="header-anchor" href="#recaptcha-v2">reCAPTCHA V2</a></h4>
<blockquote data-line="374">
<p data-line="374">reCAPTCHA V2 also known as I'm not a robot reCAPTCHA is a very popular type of captcha that looks like this:</p>
<img src="/assets/captcha-api-docs/img/recaptchav2.gif" width="616" height="164" alt="reCAPTCHA V2" loading="lazy" />
</blockquote>
<p data-line="378">Solving reCAPTCHA V2 with our new method is pretty simple:</p>
<ol data-line="380">
<li data-line="380">
<p data-line="380">Look at the element's code at the page where you found reCAPTCHA.</p>
</li>
<li data-line="382">
<img src="/assets/captcha-api-docs/img/inspectelement.png" width="432" height="356" alt="Inspect reCAPTCHA V2 widget source code" loading="lazy" />
</li>
<li data-line="384">
<p data-line="384">Find a link that begins with <em><a href="http://www.google.com/recaptcha/api2/anchor">www.google.com/recaptcha/api2/anchor</a></em> or find <em>data-sitekey</em> parameter.</p>
</li>
<li data-line="385">
<p data-line="385">Copy the value of <em>k</em> parameter of the link (or value of <em>data-sitekey</em> parameter).</p>
</li>
<li data-line="387">
<img src="/assets/captcha-api-docs/img/sitekey_recaptcha.png" width="738" height="165" alt="Find 'data-sitekey' parameter" loading="lazy" />
</li>
<li data-line="389">
<p data-line="389">Submit a <em>HTTP GET</em> or <em>POST</em> request to our API URL: <code>https://2captcha.com/in.php</code> with method set to <em>userrecaptcha</em> and provide the value found on previous step as value for <em>googlekey</em> and full page URL as value for <em>pageurl</em>. <a href="#proxies">Sending proxies</a> is not obligatory ar the moment but it's recommended.<br>
You can find the full list of parameters in the <a href="#recaptchav2new_post">table below.</a></p>
<p data-line="392"><strong>Request URL example:</strong></p>

        <details  data-line="393" class="md-editor-code" open="">
          <summary class="md-editor-code-head">
            <div class="md-editor-code-flag"><span></span><span></span><span></span></div>
            <div class="md-editor-code-action">
              <span class="md-editor-code-lang"></span>
              <span class="md-editor-copy-button" data-tips="Copy">Copy</span>
              
              <span class="md-editor-collapse-tips"><svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="lucide lucide-circle-chevron-left md-editor-icon"><circle cx="12" cy="12" r="10"/><path d="m14 16-4-4 4-4"/></svg></span>
            </div>
          </summary>
          <pre><code class="language-" language=><span class="md-editor-code-block">https://2captcha.com/in.php?key=1abc234de56fab7c89012d34e56fa7b8&amp;method=userrecaptcha&amp;googlekey=6Le-wvkSVVABCPBMRTvw0Q4Muexq1bi0DJwx_mJ-&amp;pageurl=http://mysite.com/page/with/recaptcha</span><span rn-wrapper aria-hidden="true"><span></span></span></code></pre>

        </details>
      </li>
<li data-line="397">
<p data-line="397">If everything is fine server will return the ID of your captcha as plain text, like: <em>OK|2122988149</em> or as JSON <em>{&quot;status&quot;:1,&quot;request&quot;:&quot;2122988149&quot;}</em> if <em>json</em> parameter was used.<br>
Otherwise server will return an <a href="#error_handling">error code</a>.</p>
</li>
<li data-line="399">
<p data-line="399">Make a 15-20 seconds timeout then submit a <em>HTTP GET</em> request to our API URL: <code>https://2captcha.com/res.php</code> to get the result.<br>
The full list of parameters is in the <a href="#recaptchav2new_get">table below</a>.</p>
<p data-line="402">If captcha is already solved server will respond in plain text or JSON and return the answer token that looks like:</p>

        <details  data-line="404" class="md-editor-code" open="">
          <summary class="md-editor-code-head">
            <div class="md-editor-code-flag"><span></span><span></span><span></span></div>
            <div class="md-editor-code-action">
              <span class="md-editor-code-lang"></span>
              <span class="md-editor-copy-button" data-tips="Copy">Copy</span>
              
              <span class="md-editor-collapse-tips"><svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="lucide lucide-circle-chevron-left md-editor-icon"><circle cx="12" cy="12" r="10"/><path d="m14 16-4-4 4-4"/></svg></span>
            </div>
          </summary>
          <pre><code class="language-" language=><span class="md-editor-code-block">03AHJ_Vuve5Asa4koK3KSMyUkCq0vUFCR5Im4CwB7PzO3dCxIo11i53epEraq-uBO5mVm2XRikL8iKOWr0aG50sCuej9bXx5qcviUGSm4iK4NC_Q88flavWhaTXSh0VxoihBwBjXxwXuJZ-WGN5Sy4dtUl2wbpMqAj8Zwup1vyCaQJWFvRjYGWJ_TQBKTXNB5CCOgncqLetmJ6B6Cos7qoQyaB8ZzBOTGf5KSP6e-K9niYs772f53Oof6aJeSUDNjiKG9gN3FTrdwKwdnAwEYX-F37sI_vLB1Zs8NQo0PObHYy0b0sf7WSLkzzcIgW9GR0FwcCCm1P8lB-50GQHPEBJUHNnhJyDzwRoRAkVzrf7UkV8wKCdTwrrWqiYDgbrzURfHc2ESsp020MicJTasSiXmNRgryt-gf50q5BMkiRH7osm4DoUgsjc_XyQiEmQmxl5sqZP7aKsaE-EM00x59XsPzD3m3YI6SRCFRUevSyumBd7KmXE8VuzIO9lgnnbka4-eZynZa6vbB9cO3QjLH0xSG3-egcplD1uLGh79wC34RF49Ui3eHwua4S9XHpH6YBe7gXzz6_mv-o-fxrOuphwfrtwvvi2FGfpTexWvxhqWICMFTTjFBCEGEgj7_IFWEKirXW2RTZCVF0Gid7EtIsoEeZkPbrcUISGmgtiJkJ_KojuKwImF0G0CsTlxYTOU2sPsd5o1JDt65wGniQR2IZufnPbbK76Yh_KI2DY4cUxMfcb2fAXcFMc9dcpHg6f9wBXhUtFYTu6pi5LhhGuhpkiGcv6vWYNxMrpWJW_pV7q8mPilwkAP-zw5MJxkgijl2wDMpM-UUQ_k37FVtf-ndbQAIPG7S469doZMmb5IZYgvcB4ojqCW3Vz6Q</span><span rn-wrapper aria-hidden="true"><span></span></span></code></pre>

        </details>
      <p data-line="406">If captcha is not solved yet server will return <em>CAPCHA_NOT_READY</em> result. Repeat your request in 5 seconds.</p>
<p data-line="408">If something went wrong server will return an <a href="#error_handling">error code</a>.</p>
</li>
<li data-line="410">
<p data-line="410">Locate the element with id <em>g-recaptcha-response</em> and make it visible deleting <em>display:none</em> parameter.</p>
<img src="/assets/captcha-api-docs/img/g_recaptcha_response.png" width="742" height="82" alt="Find html element with 'g-recaptcha-response' id" loading="lazy" />
<blockquote data-line="414">
<p data-line="414"><strong>Please note:</strong> sometimes content on the page is generated dynamically and you will not see this element in html source.<br>
In such cases you have to explore javascript code that generates the content. &quot;Inspect&quot; option in Google Chrome can help in that.</p>
</blockquote>
<p data-line="417">As an alternative you can just use javascript to set the value of g-recaptcha-response field:</p>

        <details  data-line="419" class="md-editor-code" open="">
          <summary class="md-editor-code-head">
            <div class="md-editor-code-flag"><span></span><span></span><span></span></div>
            <div class="md-editor-code-action">
              <span class="md-editor-code-lang"></span>
              <span class="md-editor-copy-button" data-tips="Copy">Copy</span>
              
              <span class="md-editor-collapse-tips"><svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="lucide lucide-circle-chevron-left md-editor-icon"><circle cx="12" cy="12" r="10"/><path d="m14 16-4-4 4-4"/></svg></span>
            </div>
          </summary>
          <pre><code class="language-" language=><span class="md-editor-code-block">document.getElementById(&quot;g-recaptcha-response&quot;).innerHTML=&quot;TOKEN&quot;;</span><span rn-wrapper aria-hidden="true"><span></span></span></code></pre>

        </details>
      </li>
<li data-line="421">
<p data-line="421">An input field will appear on the page. And you just have to paste the answer token to that field and submit the form.</p>
</li>
<li data-line="423">
<img src="/assets/captcha-api-docs/img/answer.png" width="374" height="257" alt="Past received token into the field" loading="lazy" />
</li>
<li data-line="425">
<p data-line="425">Congratulations, you've passed the recaptcha</p>
</li>
<li data-line="427">
<img src="/assets/captcha-api-docs/img/hooray.png" width="237" height="70" alt="Success" loading="lazy" />
</li>
</ol>
</section>
<section id="callback">
<h4 id="recaptcha-callback" tabindex="-1" data-line="432"><a class="header-anchor" href="#recaptcha-callback">reCAPTCHA Callback</a></h4>
<p data-line="434">Sometimes there's no submit button and a callback function is used isntead. The function is executed when reCAPTCHA is solved.</p>
<p data-line="436">Callback function is usually defined in <code>data-callback</code> parameter of reCAPTCHA, for example:</p>

        <details  data-line="438" class="md-editor-code" open="">
          <summary class="md-editor-code-head">
            <div class="md-editor-code-flag"><span></span><span></span><span></span></div>
            <div class="md-editor-code-action">
              <span class="md-editor-code-lang"></span>
              <span class="md-editor-copy-button" data-tips="Copy">Copy</span>
              
              <span class="md-editor-collapse-tips"><svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="lucide lucide-circle-chevron-left md-editor-icon"><circle cx="12" cy="12" r="10"/><path d="m14 16-4-4 4-4"/></svg></span>
            </div>
          </summary>
          <pre><code class="language-" language=><span class="md-editor-code-block">data-callback=&quot;myCallbackFunction&quot;</span><span rn-wrapper aria-hidden="true"><span></span></span></code></pre>

        </details>
      <p data-line="440">Or sometimes it's defined as <code>callback</code> parameter of <code>grecaptcha.render</code> function, for example:</p>

        <details  data-line="442" class="md-editor-code" open="">
          <summary class="md-editor-code-head">
            <div class="md-editor-code-flag"><span></span><span></span><span></span></div>
            <div class="md-editor-code-action">
              <span class="md-editor-code-lang"></span>
              <span class="md-editor-copy-button" data-tips="Copy">Copy</span>
              
              <span class="md-editor-collapse-tips"><svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="lucide lucide-circle-chevron-left md-editor-icon"><circle cx="12" cy="12" r="10"/><path d="m14 16-4-4 4-4"/></svg></span>
            </div>
          </summary>
          <pre><code class="language-" language=><span class="md-editor-code-block">grecaptcha.render('example', {
'sitekey' : 'someSitekey',
'callback' : myCallbackFunction,
'theme' : 'dark'
});</span><span rn-wrapper aria-hidden="true"><span></span><span></span><span></span><span></span><span></span></span></code></pre>

        </details>
      <p data-line="448">Also there's another way to find the callback function - open javascript console of your browser and explore reCAPTCHA configuration object:</p>

        <details  data-line="450" class="md-editor-code" open="">
          <summary class="md-editor-code-head">
            <div class="md-editor-code-flag"><span></span><span></span><span></span></div>
            <div class="md-editor-code-action">
              <span class="md-editor-code-lang"></span>
              <span class="md-editor-copy-button" data-tips="Copy">Copy</span>
              
              <span class="md-editor-collapse-tips"><svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="lucide lucide-circle-chevron-left md-editor-icon"><circle cx="12" cy="12" r="10"/><path d="m14 16-4-4 4-4"/></svg></span>
            </div>
          </summary>
          <pre><code class="language-" language=><span class="md-editor-code-block">___grecaptcha_cfg.clients[0].aa.l.callback</span><span rn-wrapper aria-hidden="true"><span></span></span></code></pre>

        </details>
      <p data-line="452">Note that <strong>aa.l</strong> may change and there can be multiple clients so you have to check <strong>clients[1], clients[2]</strong> too.</p>
<p data-line="454">Or just use <a href="https://gist.github.com/2captcha/2ee70fa1130e756e1693a5d4be4d8c70">the script that finds reCAPTCHA parameters</a></p>
<p data-line="456">Finally all you have to do is to call that function:</p>

        <details  data-line="458" class="md-editor-code" open="">
          <summary class="md-editor-code-head">
            <div class="md-editor-code-flag"><span></span><span></span><span></span></div>
            <div class="md-editor-code-action">
              <span class="md-editor-code-lang"></span>
              <span class="md-editor-copy-button" data-tips="Copy">Copy</span>
              
              <span class="md-editor-collapse-tips"><svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="lucide lucide-circle-chevron-left md-editor-icon"><circle cx="12" cy="12" r="10"/><path d="m14 16-4-4 4-4"/></svg></span>
            </div>
          </summary>
          <pre><code class="language-" language=><span class="md-editor-code-block">myCallbackFunction();</span><span rn-wrapper aria-hidden="true"><span></span></span></code></pre>

        </details>
      <p data-line="460">Or even this way:</p>

        <details  data-line="462" class="md-editor-code" open="">
          <summary class="md-editor-code-head">
            <div class="md-editor-code-flag"><span></span><span></span><span></span></div>
            <div class="md-editor-code-action">
              <span class="md-editor-code-lang"></span>
              <span class="md-editor-copy-button" data-tips="Copy">Copy</span>
              
              <span class="md-editor-collapse-tips"><svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="lucide lucide-circle-chevron-left md-editor-icon"><circle cx="12" cy="12" r="10"/><path d="m14 16-4-4 4-4"/></svg></span>
            </div>
          </summary>
          <pre><code class="language-" language=><span class="md-editor-code-block">___grecaptcha_cfg.clients[0].aa.l.callback();</span><span rn-wrapper aria-hidden="true"><span></span></span></code></pre>

        </details>
      <p data-line="464">Sometimes it is required to provide an argument and in most cases you should put the token there. For example:</p>

        <details  data-line="466" class="md-editor-code" open="">
          <summary class="md-editor-code-head">
            <div class="md-editor-code-flag"><span></span><span></span><span></span></div>
            <div class="md-editor-code-action">
              <span class="md-editor-code-lang"></span>
              <span class="md-editor-copy-button" data-tips="Copy">Copy</span>
              
              <span class="md-editor-collapse-tips"><svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="lucide lucide-circle-chevron-left md-editor-icon"><circle cx="12" cy="12" r="10"/><path d="m14 16-4-4 4-4"/></svg></span>
            </div>
          </summary>
          <pre><code class="language-" language=><span class="md-editor-code-block">myCallbackFunction('TOKEN');</span><span rn-wrapper aria-hidden="true"><span></span></span></code></pre>

        </details>
      </section>
<section id="invisible">
<h4 id="invisible-recaptcha-v2" tabindex="-1" data-line="471"><a class="header-anchor" href="#invisible-recaptcha-v2">Invisible reCAPTCHA V2</a></h4>
<p data-line="473">reCAPTCHA V2 also has an invisible version.<br>
You may check how it looks like here: <a href="https://www.google.com/recaptcha/api2/demo?invisible=true">https://www.google.com/recaptcha/api2/demo?invisible=true</a><br>
Recently we noticed some changes in invisible reCAPTCHA algorithms on few websites and added <a href="#recaptchav2new_post">new parameter</a> <code>invisible=1</code> that should be used for invisible reCAPTCHA.<br>
Read more about invisible reCAPTCHA below.</p>
<p data-line="478">Invisible reCAPTCHA is located on a DIV layer positioned -10 000 px from top that makes it invisible for user.</p>
<p data-line="480">reCAPTCHA is activated on page load or on user's actions like click somewhere or submit a form - that depends on the website. If user's cookies are good enough then he will just pass it automatically and no additional actions will be required. Otherwise user will see standard reCAPTCHA form with a challenge.</p>
<p data-line="482">In most cases when challenge is completed a callback function is executed. You can read more about callback <a href="#callback">here</a>.</p>
<p data-line="484">If you are still not sure — there are few ways to determine that reCAPTCHA is in invisible mode:</p>
<ul data-line="486">
<li data-line="486">You don't see &quot;I'm not a robot&quot; checkbox on the page but getting recaptcha challenge when making some actions there</li>
<li data-line="487">reCAPTCHA's iframe link contains parameter <code>size=invisible</code></li>
<li data-line="488">reCAPTCHA's configuration object contains parameter size that is set to invisible, for example <code>___grecaptcha_cfg.clients[0].aa.l.size</code> is equal to <code>invisible</code></li>
</ul>
<p data-line="490"><strong>How to bypass invisible reCAPTCHA in browser?</strong></p>
<p data-line="492"><strong>Method 1: using javascript:</strong></p>
<ol data-line="494">
<li data-line="494">
<p data-line="494">Change the value of g-recaptcha-response element to the token you received from our server:</p>
<p data-line="496">document.getElementById(&quot;g-recaptcha-response&quot;).innerHTML=&quot;TOKEN&quot;;</p>
</li>
<li data-line="498">
<p data-line="498">Execute the action that needs to be performed on the page after solving reCAPTCHA.</p>
</li>
</ol>
<p data-line="500">Usually there's a form that should be submitted and you need to identify the form by id or name or any other attribute and then submit the form. Here are few examples:</p>

        <details  data-line="502" class="md-editor-code" open="">
          <summary class="md-editor-code-head">
            <div class="md-editor-code-flag"><span></span><span></span><span></span></div>
            <div class="md-editor-code-action">
              <span class="md-editor-code-lang"></span>
              <span class="md-editor-copy-button" data-tips="Copy">Copy</span>
              
              <span class="md-editor-collapse-tips"><svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="lucide lucide-circle-chevron-left md-editor-icon"><circle cx="12" cy="12" r="10"/><path d="m14 16-4-4 4-4"/></svg></span>
            </div>
          </summary>
          <pre><code class="language-" language=><span class="md-editor-code-block">document.getElementById(&quot;recaptcha-demo-form&quot;).submit(); //by id &quot;recaptcha-demo-form&quot;
document.getElementsByName(&quot;myFormName&quot;)[0].submit(); //by element name &quot;myFormName&quot;
document.getElementsByClassName(&quot;example&quot;).submit(); //by class name &quot;example&quot;</span><span rn-wrapper aria-hidden="true"><span></span><span></span><span></span></span></code></pre>

        </details>
      <p data-line="506">Or sometimes there's a callback function executed when reCAPTCHA is solved.</p>
<p data-line="508">Callback function is usually defined in <code>data-callback</code> parameter of reCAPTCHA, for example:</p>

        <details  data-line="510" class="md-editor-code" open="">
          <summary class="md-editor-code-head">
            <div class="md-editor-code-flag"><span></span><span></span><span></span></div>
            <div class="md-editor-code-action">
              <span class="md-editor-code-lang"></span>
              <span class="md-editor-copy-button" data-tips="Copy">Copy</span>
              
              <span class="md-editor-collapse-tips"><svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="lucide lucide-circle-chevron-left md-editor-icon"><circle cx="12" cy="12" r="10"/><path d="m14 16-4-4 4-4"/></svg></span>
            </div>
          </summary>
          <pre><code class="language-" language=><span class="md-editor-code-block">data-callback=&quot;myCallbackFunction&quot;</span><span rn-wrapper aria-hidden="true"><span></span></span></code></pre>

        </details>
      <p data-line="512">Or sometimes it's defined as <code>callback</code> parameter of <code>grecaptcha.render</code> function, for example:</p>

        <details  data-line="514" class="md-editor-code" open="">
          <summary class="md-editor-code-head">
            <div class="md-editor-code-flag"><span></span><span></span><span></span></div>
            <div class="md-editor-code-action">
              <span class="md-editor-code-lang"></span>
              <span class="md-editor-copy-button" data-tips="Copy">Copy</span>
              
              <span class="md-editor-collapse-tips"><svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="lucide lucide-circle-chevron-left md-editor-icon"><circle cx="12" cy="12" r="10"/><path d="m14 16-4-4 4-4"/></svg></span>
            </div>
          </summary>
          <pre><code class="language-" language=><span class="md-editor-code-block">grecaptcha.render('example', {
'sitekey' : 'someSitekey',
'callback' : myCallbackFunction,
'theme' : 'dark'
});</span><span rn-wrapper aria-hidden="true"><span></span><span></span><span></span><span></span><span></span></span></code></pre>

        </details>
      <p data-line="520">And all you have to do is to call that function:</p>

        <details  data-line="522" class="md-editor-code" open="">
          <summary class="md-editor-code-head">
            <div class="md-editor-code-flag"><span></span><span></span><span></span></div>
            <div class="md-editor-code-action">
              <span class="md-editor-code-lang"></span>
              <span class="md-editor-copy-button" data-tips="Copy">Copy</span>
              
              <span class="md-editor-collapse-tips"><svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="lucide lucide-circle-chevron-left md-editor-icon"><circle cx="12" cy="12" r="10"/><path d="m14 16-4-4 4-4"/></svg></span>
            </div>
          </summary>
          <pre><code class="language-" language=><span class="md-editor-code-block">myCallbackFunction();</span><span rn-wrapper aria-hidden="true"><span></span></span></code></pre>

        </details>
      <ol start="13" data-line="524">
<li data-line="524">Voila! You've done that with just 2 strings of code.</li>
</ol>
<p data-line="526"><strong>Method 2: changing HTML:</strong></p>
<ol data-line="528">
<li data-line="528">
<p data-line="528">Cut the div containing reCAPTCHA from page body.</p>

        <details  data-line="530" class="md-editor-code" open="">
          <summary class="md-editor-code-head">
            <div class="md-editor-code-flag"><span></span><span></span><span></span></div>
            <div class="md-editor-code-action">
              <span class="md-editor-code-lang">html</span>
              <span class="md-editor-copy-button" data-tips="Copy">Copy</span>
              
              <span class="md-editor-collapse-tips"><svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="lucide lucide-circle-chevron-left md-editor-icon"><circle cx="12" cy="12" r="10"/><path d="m14 16-4-4 4-4"/></svg></span>
            </div>
          </summary>
          <pre><code class="language-html" language=html><span class="md-editor-code-block">&lt;div style=&quot;visibility: hidden; position: absolute; width:100%; top: -10000px; left: 0px; right: 0px; transition: visibility 0s linear 0.3s, opacity 0.3s linear; opacity: 0;&quot;&gt;
&lt;div style=&quot;width: 100%; height: 100%; position: fixed; top: 0px; left: 0px; z-index: 2000000000; background-color: #fff; opacity: 0.5;  filter: alpha(opacity=50)&quot;&gt;
&lt;/div&gt;
&lt;div style=&quot;margin: 0 auto; top: 0px; left: 0px; right: 0px; position: absolute; border: 1px solid #ccc; z-index: 2000000000; background-color: #fff; overflow: hidden;&quot;&gt;
&lt;iframe src=&quot;https://www.google.com/recaptcha/api2/bframe?hl=en&amp;amp;v=r20170213115309&amp;amp;k=6LfP0CITAAAAAHq9FOgCo7v_fb0-pmmH9VW3ziFs#zglq3yifgkmj&quot; title=&quot;recaptcha challenge&quot; style=&quot;width: 100%; height: 100%;&quot; scrolling=&quot;no&quot; name=&quot;zglq3yifgkmj&quot; frameborder=&quot;0&quot;&gt;&lt;/iframe&gt;
&lt;/div&gt;
&lt;/div&gt;</span><span rn-wrapper aria-hidden="true"><span></span><span></span><span></span><span></span><span></span><span></span><span></span></span></code></pre>

        </details>
      </li>
<li data-line="540">
<p data-line="540">Cut the whole block:</p>

        <details  data-line="542" class="md-editor-code" open="">
          <summary class="md-editor-code-head">
            <div class="md-editor-code-flag"><span></span><span></span><span></span></div>
            <div class="md-editor-code-action">
              <span class="md-editor-code-lang">html</span>
              <span class="md-editor-copy-button" data-tips="Copy">Copy</span>
              
              <span class="md-editor-collapse-tips"><svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="lucide lucide-circle-chevron-left md-editor-icon"><circle cx="12" cy="12" r="10"/><path d="m14 16-4-4 4-4"/></svg></span>
            </div>
          </summary>
          <pre><code class="language-html" language=html><span class="md-editor-code-block">&lt;div class=&quot;&quot;&gt;&lt;!-- BEGIN: ReCAPTCHA implementation example. --&gt;
&lt;div id=&quot;recaptcha-demo&quot; class=&quot;g-recaptcha&quot; data-sitekey=&quot;6LfP0CITAAAAAHq9FOgCo7v_fb0-pmmH9VW3ziFs&quot; data-callback=&quot;onSuccess&quot; data-bind=&quot;recaptcha-demo-submit&quot;&gt;&lt;div class=&quot;grecaptcha-badge&quot; style=&quot;width: 256px; height: 60px; transition: right 0.3s ease 0s; position: fixed; bottom: 14px; right: -186px; box-shadow: 0px 0px 5px gray;&quot;&gt;&lt;div class=&quot;grecaptcha-logo&quot;&gt;&lt;iframe src=&quot;https://www.google.com/recaptcha/api2/anchor?k=6LfP0CITAAAAAHq9FOgCo7v_fb0-pmmH9VW3ziFs&amp;amp;co=aHR0cHM6Ly93d3cuZ29vZ2xlLmNvbTo0NDM.&amp;amp;hl=en&amp;amp;v=r20170213115309&amp;amp;size=invisible&amp;amp;cb=uror1hlow5a&quot; title=&quot;recaptcha widget&quot; scrolling=&quot;no&quot; name=&quot;undefined&quot; width=&quot;256&quot; height=&quot;60&quot; frameborder=&quot;0&quot;&gt;&lt;/iframe&gt;&lt;/div&gt;&lt;div class=&quot;grecaptcha-error&quot;&gt;&lt;/div&gt;&lt;textarea id=&quot;g-recaptcha-response&quot; name=&quot;g-recaptcha-response&quot; class=&quot;g-recaptcha-response&quot; style=&quot;width: 250px; height: 40px; border: 1px solid #c1c1c1; margin: 10px 25px; padding: 0px; resize: none;  display: none; &quot;&gt;&lt;/textarea&gt;&lt;/div&gt;&lt;/div&gt;
&lt;script&gt;
var onSuccess = function (response) {
var errorDivs = document.getElementsByClassName(&quot;recaptcha-error&quot;);
if (errorDivs.length) {
    errorDivs[0].className = &quot;&quot;;
}
var errorMsgs = document.getElementsByClassName(&quot;recaptcha-error-message&quot;);
if (errorMsgs.length) {
    errorMsgs[0].parentNode.removeChild(errorMsgs[0]);
}
document.getElementById(&quot;recaptcha-demo-form&quot;).submit();
};
&lt;/script&gt;&lt;!-- Optional noscript fallback. --&gt;&lt;!-- END: ReCAPTCHA implementation example. --&gt;&lt;/div&gt;</span><span rn-wrapper aria-hidden="true"><span></span><span></span><span></span><span></span><span></span><span></span><span></span><span></span><span></span><span></span><span></span><span></span><span></span><span></span><span></span></span></code></pre>

        </details>
      </li>
<li data-line="560">
<p data-line="560">Put the following code instead of the block you've just cut:</p>

        <details  data-line="562" class="md-editor-code" open="">
          <summary class="md-editor-code-head">
            <div class="md-editor-code-flag"><span></span><span></span><span></span></div>
            <div class="md-editor-code-action">
              <span class="md-editor-code-lang">html</span>
              <span class="md-editor-copy-button" data-tips="Copy">Copy</span>
              
              <span class="md-editor-collapse-tips"><svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="lucide lucide-circle-chevron-left md-editor-icon"><circle cx="12" cy="12" r="10"/><path d="m14 16-4-4 4-4"/></svg></span>
            </div>
          </summary>
          <pre><code class="language-html" language=html><span class="md-editor-code-block">&lt;input type=&quot;submit&quot;&gt;
&lt;textarea name=&quot;g-recaptcha-response&quot;&gt;%g-recaptcha-response%&lt;/textarea&gt;</span><span rn-wrapper aria-hidden="true"><span></span><span></span></span></code></pre>

        </details>
      </li>
</ol>
<p data-line="568">Where <em>%g-recaptcha-response%</em> - is an answer token you’ve got from our service.8. You will see “Submit query” button.<br>
Press the button to submit the form with g-recaptcha-response and all other form data to the website.</p>
<p data-line="571"><strong>List of GET/POST request parameters for <a href="https://2captcha.com/in.php">https://2captcha.com/in.php</a></strong></p>
<table data-line="573">
<thead data-line="573">
<tr data-line="573">
<th><strong>Parameter</strong></th>
<th><strong>Type</strong></th>
<th><strong>Required</strong></th>
<th><strong>Description</strong></th>
</tr>
</thead>
<tbody data-line="575">
<tr data-line="575">
<td>key</td>
<td>String</td>
<td>Yes</td>
<td><a href="#solving_captchas">your API key</a></td>
</tr>
<tr data-line="576">
<td>method</td>
<td>String</td>
<td>Yes</td>
<td>userrecaptcha - defines that you're sending a reCAPTCHA V2 with new method</td>
</tr>
<tr data-line="577">
<td>enterprise</td>
<td>String <br>Default: 0</td>
<td>No</td>
<td>1 - defines that you're sending reCAPTCHA Enterpise V2</td>
</tr>
<tr data-line="578">
<td>googlekey</td>
<td>String</td>
<td>Yes</td>
<td>Value of <em>k</em> or <em>data-sitekey</em> parameter you found on page</td>
</tr>
<tr data-line="579">
<td>pageurl</td>
<td>String</td>
<td>Yes</td>
<td>Full URL of the page where you see the reCAPTCHA</td>
</tr>
<tr data-line="580">
<td>domain</td>
<td>String <br>Default: <code>google.com</code></td>
<td>No</td>
<td>Domain used to load the captcha: <code>google.com</code> or <code>recaptcha.net</code></td>
</tr>
<tr data-line="581">
<td>invisible</td>
<td>Integer <br>Default: 0</td>
<td>No</td>
<td>1 - means that reCAPTCHA is invisible. 0 - normal reCAPTCHA.</td>
</tr>
<tr data-line="582">
<td>data-s</td>
<td>String</td>
<td>No</td>
<td>Value of <em>data-s</em> parameter you found on page. Curenttly applicable for Google Search and other Google services.</td>
</tr>
<tr data-line="583">
<td>cookies</td>
<td>String</td>
<td>No</td>
<td>Your <em>cookies</em> that will be passed to our worker who solve the captha. We also return worker's cookies in the response if you use <code>json=1</code>. <br>Format: KEY:Value, separator: semicolon, example: <code>KEY1:Value1;KEY2:Value2;</code></td>
</tr>
<tr data-line="584">
<td>userAgent</td>
<td>String</td>
<td>No</td>
<td>Your <em>userAgent</em> that will be passed to our worker and used to solve the captcha.</td>
</tr>
<tr data-line="585">
<td>header_acao</td>
<td>Integer <br>Default: 0</td>
<td>No</td>
<td>0 - disabled <br>1 - enabled. <br>If enabled <code>in.php</code> will include <em>Access-Control-Allow-Origin:*</em> header in the response. <br>Used for cross-domain AJAX requests in web applications. Also supported by <code>res.php</code>.</td>
</tr>
<tr data-line="586">
<td>pingback</td>
<td>String</td>
<td>No</td>
<td>URL for pingback (callback) response that will be sent when captcha is solved. <br>URL should be registered on the server. <a href="#pingback">More info here</a>.</td>
</tr>
<tr data-line="587">
<td>json</td>
<td>Integer <br>Default: 0</td>
<td>No</td>
<td>0 - server will send the response as plain text <br>1 - tells the server to send the response as JSON</td>
</tr>
<tr data-line="588">
<td>soft_id</td>
<td>Integer</td>
<td>No</td>
<td>ID of software developer. Developers who integrated their software with 2Captcha get reward: 10% of spendings of their software users.</td>
</tr>
<tr data-line="589">
<td>proxy</td>
<td>String</td>
<td>No</td>
<td>Format: <em>login:password@123.123.123.123:3128</em> <br>You can find more info about proxies <a href="#proxies">here</a>.</td>
</tr>
<tr data-line="590">
<td>proxytype</td>
<td>String</td>
<td>No</td>
<td>Type of your proxy: HTTP, HTTPS, SOCKS4, SOCKS5.</td>
</tr>
</tbody>
</table>
<p data-line="592"><strong>List of <em>GET</em> request parameters for <a href="https://2captcha.com/res.php">https://2captcha.com/res.php</a></strong></p>
<table data-line="594">
<thead data-line="594">
<tr data-line="594">
<th><strong>GET parameter</strong></th>
<th><strong>Type</strong></th>
<th><strong>Required</strong></th>
<th><strong>Description</strong></th>
</tr>
</thead>
<tbody data-line="596">
<tr data-line="596">
<td>key</td>
<td>String</td>
<td>Yes</td>
<td><a href="#solving_captchas">your API key</a></td>
</tr>
<tr data-line="597">
<td>action</td>
<td>String</td>
<td>Yes</td>
<td>get - get the asnwer for your captcha</td>
</tr>
<tr data-line="598">
<td>id</td>
<td>Integer</td>
<td>Yes</td>
<td>ID of captcha returned by in.php.</td>
</tr>
<tr data-line="599">
<td>json</td>
<td>Integer <br>Default: 0</td>
<td>No</td>
<td>0 - server will send the response as plain text <br>1 - tells the server to send the response as JSON</td>
</tr>
</tbody>
</table>
<p data-line="601"><strong>Request URL example:</strong></p>

        <details  data-line="603" class="md-editor-code" open="">
          <summary class="md-editor-code-head">
            <div class="md-editor-code-flag"><span></span><span></span><span></span></div>
            <div class="md-editor-code-action">
              <span class="md-editor-code-lang"></span>
              <span class="md-editor-copy-button" data-tips="Copy">Copy</span>
              
              <span class="md-editor-collapse-tips"><svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="lucide lucide-circle-chevron-left md-editor-icon"><circle cx="12" cy="12" r="10"/><path d="m14 16-4-4 4-4"/></svg></span>
            </div>
          </summary>
          <pre><code class="language-" language=><span class="md-editor-code-block">https://2captcha.com/res.php?key=1abc234de56fab7c89012d34e56fa7b8&amp;action=get&amp;id=2122988149</span><span rn-wrapper aria-hidden="true"><span></span></span></code></pre>

        </details>
      </section>
<section id="solving_recaptchav3">
<h4 id="recaptcha-v3" tabindex="-1" data-line="609"><a class="header-anchor" href="#recaptcha-v3">reCAPTCHA V3</a></h4>
<blockquote data-line="611">
<p data-line="611">reCAPTCHA V3 is the newest type of captcha from Google. It has no challenge so there is no need for user interaction. Instead it uses a &quot;humanity&quot; rating - score.</p>
</blockquote>
<p data-line="613">reCAPTCHA V3 technically is quite similar to reCAPTCHA V2: customer receives a token from reCAPTCHA API which is then sent inside a POST request to the target website and verified via reCAPTCHA API.</p>
<p data-line="615">The difference is now reCAPTCHA API returns rating of a user detecting whether he was a real human or a bot. This rating is called score and could be a number from 0.1 to 0.9. This score is passed to the website which then decides what to do with the user request.</p>
<p data-line="617">Also there is a new parameter <em>action</em> allowing to process user actions on the website differently. After the verification of token reCAPTCHA API returns the name of the action user performed.</p>
<p data-line="619"><strong>Our approach for solving reCAPTCHA V3</strong><br>
We've performed many experiments and figured out that if a user got score 0.1 on some website then he is likely to get the same score on other websites.</p>
<p data-line="622">We are detecting the scores of our workers. Then when we've got a request for solving reCAPTCHA V3 with the minimal rating <em>min_score</em> we pass the captcha to the worker with the requested rating or higher. Most of the requests will get the requested rating on targer websites with reCAPTCHA V3.</p>
<p data-line="624">How to solve reCAPTCHA V3 using 2Captcha:</p>
<ol data-line="626">
<li data-line="626">
<p data-line="626">First you've got to be sure the target website is actually using reCAPTCHA V3</p>
<p data-line="628">There should be V3 if:</p>
<ul data-line="630">
<li data-line="630">there is no captcha and no images to click on</li>
<li data-line="631">api.js script is loading with the <em>render=sitekey</em> parameter, for example:<br>
_<a href="https://www.google.com/recaptcha/api.js?render=6LfZil0UAAAAAAdm1Dpzsw9q0F11-bmervx9g5fE_">https://www.google.com/recaptcha/api.js?render=6LfZil0UAAAAAAdm1Dpzsw9q0F11-bmervx9g5fE_</a></li>
<li data-line="633">clients array of ___grecaptcha_cfg object is using index 100000: <em>___grecaptcha_cfg.clients[100000]</em></li>
</ul>
</li>
<li data-line="635">
<p data-line="635">To start solving reCAPTCHA V3 using our API first you've got to find three parameters:</p>
<p data-line="637"><strong>sitekey</strong> - this parameter could be obtained from the URI of api.js as a value of <em>render</em> parameter. It could also be found inside URI of iframe with reCAPTCHA, in javascript code of the website where it's calling grecaptcha.execute function or in ___grecaptcha_cfg configuration object.</p>
<p data-line="639"><strong>action</strong> - you've got to find this inspecting javascript code of the website looking for call of grecaptcha.execute function. Example: <em>grecaptcha.execute('6LfZil0UAAAAAAdm1Dpzsw9q0F11-bmervx9g5fE', {action: do_something})</em>.<br>
Sometimes it's really hard to find it and you've got to dig through all js-files loaded by website. You may also try to find the value of action parameter inside ___grecaptcha_cfg configuration object but usually it's undefined. In that case you have to call grecaptcha.execute and inspect javascript code. If you can't find it try to use the default value &quot;verify&quot; - our API will use it if you don't provide action in your request.</p>
<p data-line="642"><strong>pageurl</strong> - full URL of the page where you see the reCAPTCHA V3.</p>
<p data-line="644">Now you need to understand the <em>score</em> you need to solve V3. You can't predict what score is acceptable for the website you want to solve at. It can only be figured out by trial and error. The lowest score is 0.1 which means &quot;robot&quot;, the highest is 0.9 which means &quot;human&quot;. But most sites uses thresholds from 0.2 to 0.5 because real humans receive a low score oftenly. Our service is able to provide solutions which requires the score of 0.3. Higher score is extreamly rare among workers.</p>
</li>
<li data-line="646">
<p data-line="646">Having all necessary parameters stated above you may send request to our API.</p>
</li>
<li data-line="647">
<p data-line="647">Submit a <em>HTTP GET</em> or <em>POST</em> request to our API URL:<br>
<code>https://2captcha.com/in.php</code><br>
with <em>method</em> set to <em>userrecaptcha</em> and <em>version</em> set to <em>v3</em> along with <em>min_score</em> set to score website requires, sitekey inside <em>googlekey</em> parameter and full page URL as value for <em>pageurl</em>. You have to include <em>action</em> parameter to or else we will use default value <em>verify</em>.</p>
<p data-line="651">List of request parameters <a href="#recaptchav3_post">below</a>.</p>
<p data-line="653"><strong>URL request sample:</strong></p>

        <details  data-line="655" class="md-editor-code" open="">
          <summary class="md-editor-code-head">
            <div class="md-editor-code-flag"><span></span><span></span><span></span></div>
            <div class="md-editor-code-action">
              <span class="md-editor-code-lang"></span>
              <span class="md-editor-copy-button" data-tips="Copy">Copy</span>
              
              <span class="md-editor-collapse-tips"><svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="lucide lucide-circle-chevron-left md-editor-icon"><circle cx="12" cy="12" r="10"/><path d="m14 16-4-4 4-4"/></svg></span>
            </div>
          </summary>
          <pre><code class="language-" language=><span class="md-editor-code-block">https://2captcha.com/in.php?key=1abc234de56fab7c89012d34e56fa7b8&amp;method=userrecaptcha&amp;version=v3&amp;action=verify&amp;min_score=0.3
&amp;googlekey=6LfZil0UAAAAAAdm1Dpzsw9q0F11-bmervx9g5fE&amp;pageurl=http://mysite.com/page/</span><span rn-wrapper aria-hidden="true"><span></span><span></span></span></code></pre>

        </details>
      </li>
<li data-line="658">
<p data-line="658">If everything is fine server will return the ID of your captcha as plain text, like: <em>OK|2122988149</em> or as JSON <em>{&quot;status&quot;:1,&quot;request&quot;:&quot;2122988149&quot;}</em> if json parameter was used.</p>
<p data-line="660">If something went wrong server will return an error. See <a href="#error_handling">Error Handling</a> chapter for the list of errors.</p>
</li>
<li data-line="662">
<p data-line="662">Make a 10-15 seconds timeout and submit a <em>HTTP GET</em> request to our API <code>https://2captcha.com/res.php</code> providing the captcha ID. The list of parameters is in the <a href="#recaptchav3_get">table below</a>.</p>
<p data-line="664">If everything is fine and your captcha is solved server will return the answer as plain text or as JSON. The answer is a token like this:</p>

        <details  data-line="666" class="md-editor-code" open="">
          <summary class="md-editor-code-head">
            <div class="md-editor-code-flag"><span></span><span></span><span></span></div>
            <div class="md-editor-code-action">
              <span class="md-editor-code-lang"></span>
              <span class="md-editor-copy-button" data-tips="Copy">Copy</span>
              
              <span class="md-editor-collapse-tips"><svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="lucide lucide-circle-chevron-left md-editor-icon"><circle cx="12" cy="12" r="10"/><path d="m14 16-4-4 4-4"/></svg></span>
            </div>
          </summary>
          <pre><code class="language-" language=><span class="md-editor-code-block">03AHJ_Vuve5Asa4koK3KSMyUkCq0vUFCR5Im4CwB7PzO3dCxIo11i53epEraq-uBO5mVm2XRikL8iKOWr0aG50sCuej9bXx5qcviUGSm4iK4NC_Q88flavWhaTXSh0VxoihBwBjXxwXuJZ-WGN5Sy4dtUl2wbpMqAj8Zwup1vyCaQJWFvRjYGWJ_TQBKTXNB5CCOgncqLetmJ6B6Cos7qoQyaB8ZzBOTGf5KSP6e-K9niYs772f53Oof6aJeSUDNjiKG9gN3FTrdwKwdnAwEYX-F37sI_vLB1Zs8NQo0PObHYy0b0sf7WSLkzzcIgW9GR0FwcCCm1P8lB--gf50q5BMkiRH7osm4DoUgsjc_XyQiEmQmxl5sqZP7aKsaE-EM00x59XsPzD3m3YI6SRCFRUevSyumBd7KmXE8VuzIO9lgnnbka4-eZynZa6vbB9cO3QjLH0xSG3--o-fxrOuphwfrtwvvi2FGfpTexWvxhqWICMFTTjFBCEGEgj7_IFWEKirXW2RTZCVF0Gid7EtIsoEeZkPbrcUISGmgtiJkJ_KojuKwImF0G0CsTlxYTOU2sPsd5o1JDt65wGniQR2IZufnPbbK76Yh_KI2DY4cUxMfcb2fAXcFMc9dcpHg6f9wBXhUtFYTu6pi5LhhGuhpkiGcv6vWYNxMrpWJW_pV7q8mPilwkAP-zw5MJxkgijl2wDMpM-UUQ_k37FVtf-ndbQAIPG7S469doZMmb5IZYgvcB4ojqCW3Vz6Q</span><span rn-wrapper aria-hidden="true"><span></span></span></code></pre>

        </details>
      <p data-line="668">If the captcha is not solved yet server will return <em>CAPCHA_NOT_READY</em>. Just repeat your request in 5 seconds.</p>
<p data-line="670">If something went wrong server will return an error. See <a href="#error_handling">Error Handling</a> chapter for the list of errors.</p>
<p data-line="672"><strong>Sample request:</strong></p>

        <details  data-line="674" class="md-editor-code" open="">
          <summary class="md-editor-code-head">
            <div class="md-editor-code-flag"><span></span><span></span><span></span></div>
            <div class="md-editor-code-action">
              <span class="md-editor-code-lang"></span>
              <span class="md-editor-copy-button" data-tips="Copy">Copy</span>
              
              <span class="md-editor-collapse-tips"><svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="lucide lucide-circle-chevron-left md-editor-icon"><circle cx="12" cy="12" r="10"/><path d="m14 16-4-4 4-4"/></svg></span>
            </div>
          </summary>
          <pre><code class="language-" language=><span class="md-editor-code-block">https://2captcha.com/res.php?key=1abc234de56fab7c89012d34e56fa7b8&amp;action=get&amp;json=1&amp;id=2122988149</span><span rn-wrapper aria-hidden="true"><span></span></span></code></pre>

        </details>
      </li>
<li data-line="676">
<p data-line="676">After receiving the token from our API you've got to use it properly on the target website. Best way to understant that is to check the requests sent to site when you act as a normal user. Most browsers has developer's console tool where you should check Network tab.</p>
<p data-line="678">Usually token is sent using POST request. It could be <em>g-recaptcha-response</em> just like reCAPTCHA V2 does or <em>g-recaptcha-response-100000</em>. It could be other parameter too. So you've got to inspect the requests and find out how exactly the token supposed to be sent. Then you have to compose your request accordingly.</p>
</li>
<li data-line="680">
<p data-line="680">Now when you have successfully submit the token you may tell us if it worked or not. If not we will refund the money you spent on this token. If it was successfully accepted we will set the worker who solved this captcha as the priority solver for you. Besides we will gather statistics regarding V3 solution which will help us to further investigate this new type of captchas and make our service better.</p>
<p data-line="682">To let us know whether it worked or not please send the request to <code>https://2captcha.com/res.php</code> with your API Key in <em>key</em> parameter with ID of the captcha in <em>id</em> parameter and indicating <em>action</em> parameter. Next to mention is <em>reportgood</em> if token was accepted successfully or <em>reportbad</em> if token wasn't accepted respectfully.</p>
<p data-line="684"><strong>Request examples:</strong></p>
<p data-line="686">ReportBAD</p>

        <details  data-line="688" class="md-editor-code" open="">
          <summary class="md-editor-code-head">
            <div class="md-editor-code-flag"><span></span><span></span><span></span></div>
            <div class="md-editor-code-action">
              <span class="md-editor-code-lang"></span>
              <span class="md-editor-copy-button" data-tips="Copy">Copy</span>
              
              <span class="md-editor-collapse-tips"><svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="lucide lucide-circle-chevron-left md-editor-icon"><circle cx="12" cy="12" r="10"/><path d="m14 16-4-4 4-4"/></svg></span>
            </div>
          </summary>
          <pre><code class="language-" language=><span class="md-editor-code-block">https://2captcha.com/res.php?key=1abc234de56fab7c89012d34e56fa7b8&amp;action=reportbad&amp;id=2122988149</span><span rn-wrapper aria-hidden="true"><span></span></span></code></pre>

        </details>
      <p data-line="690">ReportGOOD</p>

        <details  data-line="692" class="md-editor-code" open="">
          <summary class="md-editor-code-head">
            <div class="md-editor-code-flag"><span></span><span></span><span></span></div>
            <div class="md-editor-code-action">
              <span class="md-editor-code-lang"></span>
              <span class="md-editor-copy-button" data-tips="Copy">Copy</span>
              
              <span class="md-editor-collapse-tips"><svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="lucide lucide-circle-chevron-left md-editor-icon"><circle cx="12" cy="12" r="10"/><path d="m14 16-4-4 4-4"/></svg></span>
            </div>
          </summary>
          <pre><code class="language-" language=><span class="md-editor-code-block">https://2captcha.com/res.php?key=1abc234de56fab7c89012d34e56fa7b8&amp;action=reportgood&amp;id=2122988149</span><span rn-wrapper aria-hidden="true"><span></span></span></code></pre>

        </details>
      <p data-line="694">Important: complains for captcha types solved with token are not shown on the website. But we proceed with every report and gather the statistics. We will implement this complain display feature in future.</p>
</li>
</ol>
<p data-line="696"><strong>List of GET/POST request parameters for <a href="https://2captcha.com/in.php">https://2captcha.com/in.php</a></strong></p>
<table data-line="698">
<thead data-line="698">
<tr data-line="698">
<th><strong>Parameter</strong></th>
<th><strong>Type</strong></th>
<th><strong>Required</strong></th>
<th><strong>Description</strong></th>
</tr>
</thead>
<tbody data-line="700">
<tr data-line="700">
<td>key</td>
<td>String</td>
<td>Yes</td>
<td><a href="#solving_captchas">your API key</a></td>
</tr>
<tr data-line="701">
<td>method</td>
<td>String</td>
<td>Yes</td>
<td>userrecaptcha — defines that you're sending a reCAPTCHA</td>
</tr>
<tr data-line="702">
<td>version</td>
<td>String</td>
<td>Yes</td>
<td>v3 — defines that you're sending a reCAPTCHA V3</td>
</tr>
<tr data-line="703">
<td>enterprise</td>
<td>String <br>Default: 0</td>
<td>No</td>
<td>1 - defines that you're sending reCAPTCHA Enterpise V3</td>
</tr>
<tr data-line="704">
<td>googlekey</td>
<td>String</td>
<td>Yes</td>
<td>Value of sitekey parameter you found on page</td>
</tr>
<tr data-line="705">
<td>pageurl</td>
<td>String</td>
<td>Yes</td>
<td>Full URL of the page where you see the reCAPTCHA</td>
</tr>
<tr data-line="706">
<td>domain</td>
<td>String <br>Default: <code>google.com</code></td>
<td>No</td>
<td>Domain used to load the captcha: <code>google.com</code> or <code>recaptcha.net</code></td>
</tr>
<tr data-line="707">
<td>action</td>
<td>String <br>Default: verify</td>
<td>No</td>
<td>Value of action parameter you found on page</td>
</tr>
<tr data-line="708">
<td>min_score</td>
<td>Integer <br>Default: 0.4</td>
<td>No</td>
<td>The score needed for resolution. Currently it's almost impossible to get token with score higher than 0.3</td>
</tr>
<tr data-line="709">
<td>header_acao</td>
<td>Integer <br>Default: 0</td>
<td>No</td>
<td>0 — disabled <br>1 — enabled. <br>If enabled <code>in.php</code> will include <em>Access-Control-Allow-Origin:*</em>: header in the response. <br>Used for cross-domain AJAX requests in web applications. Also supported by <code>res.php</code>.</td>
</tr>
<tr data-line="710">
<td>pingback</td>
<td>String</td>
<td>No</td>
<td>URL for pingback (callback) response that will be sent when captcha is solved. URL should be registered on the server. More info <a href="#pingback">here</a>.</td>
</tr>
<tr data-line="711">
<td>json</td>
<td>Integer <br>Default: 0</td>
<td>No</td>
<td>0 — server will send the response as plain text <br>1 — tells the server to send the response as JSON</td>
</tr>
<tr data-line="712">
<td>soft_id</td>
<td>Integer</td>
<td>No</td>
<td>ID of software developer. Developers who integrated their software with 2Captcha get reward: 10% of spendings of their software users.</td>
</tr>
</tbody>
</table>
<p data-line="714"><strong>List of GET request parameters for <a href="https://2captcha.com/res.php">https://2captcha.com/res.php</a></strong></p>
<table data-line="716">
<thead data-line="716">
<tr data-line="716">
<th><strong>GET parameter</strong></th>
<th><strong>Type</strong></th>
<th><strong>Required</strong></th>
<th><strong>Description</strong></th>
</tr>
</thead>
<tbody data-line="718">
<tr data-line="718">
<td>key</td>
<td>String</td>
<td>Yes</td>
<td><a href="#solving_captchas">your API key</a></td>
</tr>
<tr data-line="719">
<td>action</td>
<td>String</td>
<td>Yes</td>
<td>get — get the asnwer for your captcha <br>reportgood — - report the asnwer was accepted <br>reportbad — - report the asnwer was declined</td>
</tr>
<tr data-line="720">
<td>id</td>
<td>Integer</td>
<td>Yes</td>
<td>ID of captcha returned by in.php.</td>
</tr>
<tr data-line="721">
<td>json</td>
<td>Integer <br>Default: 0</td>
<td>No</td>
<td>0 — server will send the response as plain text <br>1 — tells the server to send the response as JSON</td>
</tr>
<tr data-line="722">
<td>header_acao</td>
<td>Integer <br>Default: 0</td>
<td>No</td>
<td>0 — disabled <br>1 — enabled. <br>If enabled res.php will include <em>Access-Control-Allow-Origin:*</em> header in the response. <br>Used for cross-domain AJAX requests in web applications.</td>
</tr>
</tbody>
</table>
</section>
<section id="solving_recaptcha_enterprise">
<h4 id="recaptcha-enterprise" tabindex="-1" data-line="727"><a class="header-anchor" href="#recaptcha-enterprise">reCAPTCHA Enterprise</a></h4>
<blockquote data-line="729">
<p data-line="729">reCAPTCHA Enterprise is the newest type of captcha from Google. It can be used as V2 and V3 and provides website administrators an option to report the interaction result - was it a human or not.</p>
</blockquote>
<p data-line="731">How to solve reCAPTCHA Enterprise using 2Captcha:</p>
<ol data-line="733">
<li data-line="733">
<p data-line="733">First step is to determine that Enterpise version of reCAPTCHA is used. The main Enterprise attributes are:</p>
<ul data-line="735">
<li data-line="735"><code>enterprise.js</code> script instead of <code>api.js</code> is included on the page &lt;script src=&quot;<a href="https://recaptcha.net/recaptcha/enterprise.js">https://recaptcha.net/recaptcha/enterprise.js</a>&quot; async=&quot;&quot; defer=&quot;&quot;&gt;&lt;/script&gt;</li>
<li data-line="736"><code>grecaptcha.enterprise.METHOD</code> calls in javascript code of the website instead of <code>grecaptcha.METHOD</code></li>
</ul>
</li>
<li data-line="738">
<p data-line="738">Then you need to determine which implementation is used: V2, V2 Invisible or V3. It is quite easy, just follow the flowchart below, it works in 99% of cases.</p>
<img src="/assets/captcha-api-docs/img/recap_ver_flow.png" width="397" height="223" alt="reCAPTCHA Enterprise flow" loading="lazy" />
</li>
<li data-line="742">
<p data-line="742">Find captcha parameters the same way it is done for V2 or V3.</p>
<p data-line="744">For V2 implementations there can be <strong>optional</strong> additional data used: in most cases that is a custom string value defined in <code>s</code> or <code>data-s</code> parameter. You can pass this data inside <code>data-s</code> request parameter.</p>
<p data-line="746">For V3 you may also need the <code>action</code> value. To find it you need to dive into javascript code of the website and find the <code>grecaptcha.enterprise.execute</code> call. Action is passed to this call. But keep in mind that action is optional and can remain undefined.</p>
</li>
<li data-line="748">
<p data-line="748">Add an additional parameter <code>enterprise=1</code> to your request to <code>in.php</code> endpoint and interact with our API the same way it is done when <a href="#solving_recaptchav2_new">solving V2</a> or <a href="#solving_recaptchav3">solving V3</a> to get the token, then use the token in the same way it is used on your target website.</p>
</li>
</ol>
</section>
<section id="grid">
<h4 id="grid-method" tabindex="-1" data-line="753"><a class="header-anchor" href="#grid-method">Grid method</a></h4>
<p data-line="755">This method allows to solve any captcha where image can be divided into equal parts like reCAPTCHA V2. A grid is applied above the image. And you receive the numbers clicked boxes.</p>
<p data-line="757">To solve the captcha you have to:</p>
<ol data-line="759">
<li data-line="759">
<p data-line="759">Prepare the image and the instruction what to click. The instruction can be sent as text or as image. Don't forget to indicate the instruction <a href="#language">language</a>!</p>
</li>
<li data-line="760">
<p data-line="760"><strong>Optionally:</strong> determine the grid and define it in your request with <em>recaptchacols</em> and <em>recaptcharows</em> parameters.<br>
If not defined we'll check the size of the image. If it's 300x300px we put 3x3 grid on it. If the size is different we put 4x4 grid.</p>
</li>
<li data-line="762">
<p data-line="762">Submit a <em>HTTP POST</em> request to our API URL: <code>https://2captcha.com/in.php</code> including <em>recaptcha</em> parameter set to <em>1</em>.</p>
<p data-line="764">Server accepts images in multipart or base64 format.</p>
<p data-line="766">Also you can provide instructions as an image using <em>imginstructions</em> parameter. For more info please check the full list of parameters in the <a href="#grid_post">table below.</a></p>
</li>
<li data-line="768">
<p data-line="768">Server will return captcha ID or an <a href="#error_handling">error code</a> if something went wrong.</p>
</li>
<li data-line="769">
<p data-line="769">Make a 5 seconds timeout and submit a <em>HTTP GET</em> request to our API URL: <code>https://2captcha.com/res.php</code> to get the result.</p>
<p data-line="771">If captcha is already solved server will return the answer with numbers of grid cells that you need to click like: <em>OK|click:3/8/9</em>.</p>
<p data-line="773">Grid cells are numbered starting from number 1 from left to right and from top to bottom.</p>
<p data-line="775">If captcha is not solved yet server will return <em>CAPCHA_NOT_READY</em> result. Repeat your request in 5 seconds.</p>
<p data-line="777">If something went wrong server will return an <a href="#error_handling">error code</a>.</p>
</li>
<li data-line="779">
<p data-line="779">You simulate clicks on cells from the answer.</p>
</li>
<li data-line="780">
<p data-line="780">If reCAPTCHA updates the set of images you can send us new request with an additional parameter <em>previousID</em> and the ID of previous request as a value. Then our worker will check only new images that were not selected by previous worker.</p>
</li>
<li data-line="781">
<p data-line="781">Also you can proivde additional parameter <em>can_no_answer</em> in case if there's no images to click left. Worker will see a button to confirm that there's no corresponding images and API will return <em>No_matching_images</em> as answer.</p>
</li>
</ol>
<div id="canvas"><b>Canvas method</b></div>   
<p data-line="785">If you need to solve challenges that ask to <strong>select around object</strong> you can pass <em>canvas</em> parameter set to <em>1</em>.</p>
<p data-line="787">Server will return the result in the following format: <em>canvas:x,y,x,y,x,y;x,y,x,y,x,y;</em></p>
<p data-line="789">Where each pair of x and y are coordinates of points you need to click to select an area around object. If there are more than one area, coordininates of areas will be separated by semicolon.</p>
<p data-line="791">For example:<br>
<em>canvas:5,5,3,91,93,90,90,7,8,6;</em> - one area<br>
<em>canvas:5,5,3,91,93,90,90,7,8,6;208,211,208,287,294,294,293,209,207,210;</em> - two areas<br>
Point <strong>0,0</strong> is <strong>top left</strong> corner of the image.</p>
<p data-line="796">You need to click on these points one by one to pass the challenge.</p>
<p data-line="798"><strong>Multipart sample form for Grid method</strong></p>

        <details  data-line="800" class="md-editor-code" open="">
          <summary class="md-editor-code-head">
            <div class="md-editor-code-flag"><span></span><span></span><span></span></div>
            <div class="md-editor-code-action">
              <span class="md-editor-code-lang"></span>
              <span class="md-editor-copy-button" data-tips="Copy">Copy</span>
              
              <span class="md-editor-collapse-tips"><svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="lucide lucide-circle-chevron-left md-editor-icon"><circle cx="12" cy="12" r="10"/><path d="m14 16-4-4 4-4"/></svg></span>
            </div>
          </summary>
          <pre><code class="language-" language=><span class="md-editor-code-block">&lt;form method=&quot;post&quot; action=&quot;https://2captcha.com/in.php&quot; enctype=&quot;multipart/form-data&quot;&gt;
&lt;input type=&quot;hidden&quot; name=&quot;method&quot; value=&quot;post&quot;&gt;
&lt;input type=&quot;hidden&quot; name=&quot;recaptcha&quot; value=&quot;1&quot;&gt;&lt;br&gt;
&lt;input type=&quot;hidden&quot; name=&quot;canvas&quot; value=&quot;0&quot;&gt;&lt;br&gt;
Your key:
&lt;input type=&quot;text&quot; name=&quot;key&quot; value=&quot;YOUR_APIKEY&quot;&gt;
reCAPTCHA file:
&lt;input type=&quot;file&quot; name=&quot;file&quot;&gt;
Image with instruction:
&lt;input type=&quot;file&quot; name=&quot;imginstructions&quot;&gt;
&lt;input type=&quot;submit&quot; value=&quot;Upload and get the ID&quot;&gt;
&lt;/form&gt;</span><span rn-wrapper aria-hidden="true"><span></span><span></span><span></span><span></span><span></span><span></span><span></span><span></span><span></span><span></span><span></span><span></span></span></code></pre>

        </details>
      <p data-line="813"><em>YOUR_APIKEY</em> is <a href="#solving_captchas">Your API key</a>.</p>
<p data-line="815"><strong>Base64 sample form for Grid method</strong></p>

        <details  data-line="817" class="md-editor-code" open="">
          <summary class="md-editor-code-head">
            <div class="md-editor-code-flag"><span></span><span></span><span></span></div>
            <div class="md-editor-code-action">
              <span class="md-editor-code-lang"></span>
              <span class="md-editor-copy-button" data-tips="Copy">Copy</span>
              
              <span class="md-editor-collapse-tips"><svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="lucide lucide-circle-chevron-left md-editor-icon"><circle cx="12" cy="12" r="10"/><path d="m14 16-4-4 4-4"/></svg></span>
            </div>
          </summary>
          <pre><code class="language-" language=><span class="md-editor-code-block">&lt;form method=&quot;post&quot; action=&quot;https://2captcha.com/in.php&quot;&gt;
&lt;input type=&quot;hidden&quot; name=&quot;method&quot; value=&quot;base64&quot;&gt;
&lt;input type=&quot;hidden&quot; name=&quot;recaptcha&quot; value=&quot;1&quot;&gt;&lt;br&gt;
&lt;input type=&quot;hidden&quot; name=&quot;canvas&quot; value=&quot;0&quot;&gt;&lt;br&gt;
Your key:
&lt;input type=&quot;text&quot; name=&quot;key&quot; value=&quot;YOUR_APIKEY&quot;&gt;
reCAPTCHA file body in base64 format:
&lt;textarea name=&quot;body&quot;&gt;BASE64_RECAPTCHA_FILE&lt;/textarea&gt;
Image with instruction body in base64 format:
&lt;textarea name=&quot;imginstructions&quot;&gt;BASE64_INSTRUCTION_FILE&lt;/textarea&gt;
&lt;input type=&quot;submit&quot; value=&quot;Upload and get the ID&quot;&gt;
&lt;/form&gt;</span><span rn-wrapper aria-hidden="true"><span></span><span></span><span></span><span></span><span></span><span></span><span></span><span></span><span></span><span></span><span></span><span></span></span></code></pre>

        </details>
      <p data-line="830"><em>YOUR_APIKEY</em> is <a href="#solving_captchas">your API key</a>.</p>
<p data-line="832"><em>BASE64_RECAPTCHA_FILE</em> is base64-encoded image body of reCAPTCHA V2.</p>
<p data-line="834"><em>BASE64_INSTRUCTION_FILE</em> is base64-encoded image body of image with instruction.</p>
<p data-line="836"><strong>List of <em>POST</em> request parameters for <a href="https://2captcha.com/in.php">https://2captcha.com/in.php</a></strong></p>
<table data-line="838">
<thead data-line="838">
<tr data-line="838">
<th><strong>POST parameter</strong></th>
<th><strong>Type</strong></th>
<th><strong>Required</strong></th>
<th><strong>Description</strong></th>
</tr>
</thead>
<tbody data-line="840">
<tr data-line="840">
<td>key</td>
<td>String</td>
<td>Yes</td>
<td><a href="#solving_captchas">your API key</a></td>
</tr>
<tr data-line="841">
<td>method</td>
<td>String</td>
<td>Yes</td>
<td>post - defines that you're sending an image with multipart form <br>base64 - defines that you're sending a base64 encoded image</td>
</tr>
<tr data-line="842">
<td>recaptcha</td>
<td>Integer</td>
<td>Yes</td>
<td>1 - defines that you're sending recatcha as image</td>
</tr>
<tr data-line="843">
<td>canvas</td>
<td>Integer <br>Default: 0</td>
<td>No</td>
<td>1 - defines that you want to use <a href="#canvas">canvas method</a></td>
</tr>
<tr data-line="844">
<td>file</td>
<td>File</td>
<td>Yes*</td>
<td>Captcha image file. <br>* - required if you submit image as a file (method=post)</td>
</tr>
<tr data-line="845">
<td>body</td>
<td>String</td>
<td>Yes*</td>
<td>Base64-encoded captcha image <br>* - required if you submit image as Base64-encoded string (method=base64)</td>
</tr>
<tr data-line="846">
<td>textinstructions</td>
<td>String <br>Max 140 characters <br>Endcoding: UTF-8</td>
<td>Yes</td>
<td>Text with instruction for solving reCAPTCHA. <br>For example: select images with trees. <br><strong>Not required</strong> if you're sending instruction as an image with <em>imginstructions</em>.</td>
</tr>
<tr data-line="847">
<td>imginstructions</td>
<td>Image <br>Max 400x150px, 100 kB</td>
<td>Yes</td>
<td>Image with instruction for solving reCAPTCHA. <br><strong>Not required</strong> if you're sending instruction as text with <em>textinstructions</em>.</td>
</tr>
<tr data-line="848">
<td>img_type</td>
<td>String</td>
<td>No</td>
<td>The image will be recognized using Computer Vision, which significantly reduces the time needed to solve the captcha. Supported value options: <br> <code>funcaptcha</code> - sending FunCaptcha, the version in which you need to click on the square matching the requirements.  <a href="https://2captcha.com/blog/funcaptcha-bypass-2-ways-solutions">More info here</a>.<br><code>funcaptcha_compare</code> - sending FunCaptcha, a version in which you need to use the arrows to select the desired square. <a href="https://2captcha.com/blog/funcaptcha-bypass-2-ways-solutions">More info here</a>.<br><code>recaptcha</code> - sending reCAPTCHA. <a href="https://2captcha.com/blog/recaptcha-recognition-using-grid-method">More info here</a>.<br> <b>Important:</b> when using the <code>image_type</code> parameter, it is required to send the <code>textinstructions</code> parameter containing the original instructions for the captcha in English, and you also need to send the original image files and not screenshots.</td>
</tr>
<tr data-line="849">
<td>recaptcharows</td>
<td>Integer</td>
<td>No</td>
<td>Number of rows in reCAPTCHA grid.</td>
</tr>
<tr data-line="850">
<td>recaptchacols</td>
<td>Integer</td>
<td>No</td>
<td>Number of columns in reCAPTCHA grid.</td>
</tr>
<tr data-line="851">
<td>min_clicks</td>
<td>Integer <br>Default: 1</td>
<td>No</td>
<td>The minimum number of tiles that must be selected. Can't  be more than <code>recaptcharows * recaptchacols</code></td>
</tr>
<tr data-line="852">
<td>max_clicks</td>
<td>Integer <br>Default: <code>recaptcharows * recaptchacols</code></td>
<td>No</td>
<td>The maximum number of tiles that can be selected on the image</td>
</tr>
<tr data-line="853">
<td>previousID</td>
<td>String</td>
<td>No</td>
<td>Id of your previous request with the same captcha challenge</td>
</tr>
<tr data-line="854">
<td>can_no_answer</td>
<td>Integer <br>Default: 0</td>
<td>No</td>
<td>0 - not specified <br>1 - possibly there's no images that fit the instruction. <br>Set the value to 1 only if it's possible that there's no images matching the instruction. <br>We'll provide a button &quot;No matching images&quot; to worker and you will receive <em>No_matching_images</em> as answer.</td>
</tr>
<tr data-line="855">
<td>language</td>
<td>Integer <br>Default: 0</td>
<td>No</td>
<td>0 - not specified <br>1 - Cyrillic captcha <br>2 - Latin captcha</td>
</tr>
<tr data-line="856">
<td>lang</td>
<td>String</td>
<td>No</td>
<td>Language code. <a href="#language">See the list of supported languages.</a></td>
</tr>
<tr data-line="857">
<td>header_acao</td>
<td>Integer <br>Default: 0</td>
<td>No</td>
<td>0 - disabled <br>1 - enabled. <br>If enabled <code>in.php</code> will include <em>Access-Control-Allow-Origin:*</em> header in the response. <br>Used for cross-domain AJAX requests in web applications. Also supported by <code>res.php</code>.</td>
</tr>
<tr data-line="858">
<td>pingback</td>
<td>String</td>
<td>No</td>
<td>URL for pingback (callback) response that will be sent when captcha is solved. <br>URL should be registered on the server. <a href="#pingback">More info here</a>.</td>
</tr>
<tr data-line="859">
<td>json</td>
<td>Integer <br>Default: 0</td>
<td>No</td>
<td>0 - server will send the response as plain text <br>1 - tells the server to send the response as JSON</td>
</tr>
<tr data-line="860">
<td>soft_id</td>
<td>Integer</td>
<td>No</td>
<td>ID of software developer. Developers who integrated their software with 2Captcha get reward: 10% of spendings of their software users.</td>
</tr>
</tbody>
</table>
<blockquote data-line="864">
<p data-line="864"><strong>Please note:</strong> you have to send the reCAPTCHA image itself, not its screenshot. And you dont have to combine that image with anything you like, just send it as it is.<br>
Max size for reCAPTCHA image is 600 kB.<br>
Max size for <em>imginstructions</em> is 100 kB.</p>
</blockquote>
<p data-line="868"><strong>List of <em>GET</em> request parameters for <a href="https://2captcha.com/res.php">https://2captcha.com/res.php</a></strong></p>
<table data-line="870">
<thead data-line="870">
<tr data-line="870">
<th><strong>GET parameter</strong></th>
<th><strong>Type</strong></th>
<th><strong>Required</strong></th>
<th><strong>Description</strong></th>
</tr>
</thead>
<tbody data-line="872">
<tr data-line="872">
<td>key</td>
<td>String</td>
<td>Yes</td>
<td><a href="#solving_captchas">your API key</a></td>
</tr>
<tr data-line="873">
<td>action</td>
<td>String</td>
<td>Yes</td>
<td>get - get the asnwer for your captcha</td>
</tr>
<tr data-line="874">
<td>id</td>
<td>Integer</td>
<td>Yes</td>
<td>ID of captcha returned by in.php.</td>
</tr>
<tr data-line="875">
<td>json</td>
<td>Integer <br>Default: 0</td>
<td>No</td>
<td>0 - server will send the response as plain text <br>1 - tells the server to send the response as JSON</td>
</tr>
</tbody>
</table>
<p data-line="877"><strong>Request URL example:</strong></p>

        <details  data-line="879" class="md-editor-code" open="">
          <summary class="md-editor-code-head">
            <div class="md-editor-code-flag"><span></span><span></span><span></span></div>
            <div class="md-editor-code-action">
              <span class="md-editor-code-lang"></span>
              <span class="md-editor-copy-button" data-tips="Copy">Copy</span>
              
              <span class="md-editor-collapse-tips"><svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="lucide lucide-circle-chevron-left md-editor-icon"><circle cx="12" cy="12" r="10"/><path d="m14 16-4-4 4-4"/></svg></span>
            </div>
          </summary>
          <pre><code class="language-" language=><span class="md-editor-code-block">https://2captcha.com/res.php?key=1abc234de56fab7c89012d34e56fa7b8&amp;action=get&amp;id=2122988149</span><span rn-wrapper aria-hidden="true"><span></span></span></code></pre>

        </details>
      </section>
<section id="coordinates">
<h4 id="coordinates-method" tabindex="-1" data-line="884"><a class="header-anchor" href="#coordinates-method">Coordinates method</a></h4>
<blockquote data-line="886">
<p data-line="886">This method allows you to solve any captcha that requires clicking on images, like reCAPTCHA V2.</p>
</blockquote>
<p data-line="888">To solve the captcha you have to:</p>
<ol data-line="890">
<li data-line="890">
<p data-line="890">Get an image and an instruction that tells you what to click.</p>
</li>
<li data-line="891">
<p data-line="891">Submit a <em>HTTP POST</em> request to our API URL: <code>https://2captcha.com/in.php</code> providing <em>coordinatescaptcha</em> parameter set to <em>1</em>.<br>
Server accepts images in multipart or base64 format.</p>
<p data-line="894">You can provide instruction as text using <em>textinstructions</em> parameter, but it's not obligatory if the instruction is already indicated on the image.<br>
But don't forget to indicate the <a href="#language">language</a></p>
<p data-line="897">The full list of parameters is in the <a href="#coordinates_post">table below.</a></p>
</li>
<li data-line="899">
<p data-line="899">Server will return captcha ID or an <a href="#error_handling">error code</a> if something went wrong.</p>
</li>
<li data-line="900">
<p data-line="900">Make a 5 seconds timeout and submit a <em>HTTP GET</em> request to our API URL: <code>https://2captcha.com/res.php</code> to get the result.</p>
<p data-line="902">If captcha is already solved server will return the answer with coordinates of points where you have to click, for example: <em>OK|coordinate:x=39,y=59;x=252,y=72</em>. Where the point with x=0,y=0 is the upper left corner of the image.</p>
<p data-line="904">If captcha is not solved yet server will return <em>CAPCHA_NOT_READY</em> result. Repeat your request in 5 seconds.</p>
<p data-line="906">If something went wrong server will return an <a href="#error_handling">error code</a>.</p>
</li>
<li data-line="908">
<p data-line="908">You simulate clicks on coordinates from the answer.</p>
</li>
</ol>
<p data-line="910"><strong>Multipart sample form for Coordinates method</strong></p>

        <details  data-line="912" class="md-editor-code" open="">
          <summary class="md-editor-code-head">
            <div class="md-editor-code-flag"><span></span><span></span><span></span></div>
            <div class="md-editor-code-action">
              <span class="md-editor-code-lang"></span>
              <span class="md-editor-copy-button" data-tips="Copy">Copy</span>
              
              <span class="md-editor-collapse-tips"><svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="lucide lucide-circle-chevron-left md-editor-icon"><circle cx="12" cy="12" r="10"/><path d="m14 16-4-4 4-4"/></svg></span>
            </div>
          </summary>
          <pre><code class="language-" language=><span class="md-editor-code-block">&lt;form method=&quot;post&quot; action=&quot;https://2captcha.com/in.php&quot; enctype=&quot;multipart/form-data&quot;&gt;
&lt;input type=&quot;hidden&quot; name=&quot;method&quot; value=&quot;post&quot;&gt;
&lt;input type=&quot;hidden&quot; name=&quot;coordinatescaptcha&quot; value=&quot;1&quot;&gt;
Your key:
&lt;input type=&quot;text&quot; name=&quot;key&quot; value=&quot;YOUR_APIKEY&quot;&gt;
Captcha image file:
&lt;input type=&quot;file&quot; name=&quot;file&quot;&gt;
Instruction:
&lt;input type=&quot;text&quot; name=&quot;textinstructions&quot; value=&quot;Click on ghosts&quot;&gt;
&lt;input type=&quot;submit&quot; value=&quot;Upload and get the ID&quot;&gt;
&lt;/form&gt;</span><span rn-wrapper aria-hidden="true"><span></span><span></span><span></span><span></span><span></span><span></span><span></span><span></span><span></span><span></span><span></span></span></code></pre>

        </details>
      <p data-line="924"><em>YOUR_APIKEY</em> is <a href="#solving_captchas">Your API key</a>.</p>
<p data-line="926">Base64 sample form for Coordinates method</p>

        <details  data-line="928" class="md-editor-code" open="">
          <summary class="md-editor-code-head">
            <div class="md-editor-code-flag"><span></span><span></span><span></span></div>
            <div class="md-editor-code-action">
              <span class="md-editor-code-lang"></span>
              <span class="md-editor-copy-button" data-tips="Copy">Copy</span>
              
              <span class="md-editor-collapse-tips"><svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="lucide lucide-circle-chevron-left md-editor-icon"><circle cx="12" cy="12" r="10"/><path d="m14 16-4-4 4-4"/></svg></span>
            </div>
          </summary>
          <pre><code class="language-" language=><span class="md-editor-code-block">&lt;form method=&quot;post&quot; action=&quot;https://2captcha.com/in.php&quot;&gt;
&lt;input type=&quot;hidden&quot; name=&quot;method&quot; value=&quot;base64&quot;&gt;
&lt;input type=&quot;hidden&quot; name=&quot;coordinatescaptcha&quot; value=&quot;1&quot;&gt;
Your key:
&lt;input type=&quot;text&quot; name=&quot;key&quot; value=&quot;YOUR_APIKEY&quot;&gt;
Captcha image body in base64 format:
&lt;textarea name=&quot;body&quot;&gt;BASE64_FILE&lt;/textarea&gt;
Instruction
&lt;input type=&quot;text&quot; name=&quot;textinstructions&quot; value=&quot;Click on ghosts&quot;&gt;
&lt;input type=&quot;submit&quot; value=&quot;Upload and get the ID&quot;&gt;
&lt;/form&gt;</span><span rn-wrapper aria-hidden="true"><span></span><span></span><span></span><span></span><span></span><span></span><span></span><span></span><span></span><span></span><span></span></span></code></pre>

        </details>
      <p data-line="940"><em>YOUR_APIKEY</em> is <a href="#solving_captchas">your API key</a>.</p>
<p data-line="942"><em>BASE64_FILE</em> is base64-encoded image body of the captcha.</p>
<p data-line="944"><strong>List of <em>POST</em> request parameters for <a href="https://2captcha.com/in.php">https://2captcha.com/in.php</a></strong></p>
<table data-line="946">
<thead data-line="946">
<tr data-line="946">
<th><strong>POST parameter</strong></th>
<th><strong>Type</strong></th>
<th><strong>Required</strong></th>
<th><strong>Description</strong></th>
</tr>
</thead>
<tbody data-line="948">
<tr data-line="948">
<td>key</td>
<td>String</td>
<td>Yes</td>
<td><a href="#solving_captchas">your API key</a></td>
</tr>
<tr data-line="949">
<td>method</td>
<td>String</td>
<td>Yes</td>
<td>post - defines that you're sending an image with multipart form <br>base64 - defines that you're sending a base64 encoded image</td>
</tr>
<tr data-line="950">
<td>coordinatescaptcha</td>
<td>Integer</td>
<td>Yes</td>
<td>1 - defines that you're sending recatcha as image</td>
</tr>
<tr data-line="951">
<td>file</td>
<td>File</td>
<td>Yes*</td>
<td>Captcha image file. <br>* - required if you submit image as a file (method=post)</td>
</tr>
<tr data-line="952">
<td>body</td>
<td>String</td>
<td>Yes*</td>
<td>Base64-encoded captcha image <br>* - required if you submit image as Base64-encoded string (method=base64)</td>
</tr>
<tr data-line="953">
<td>textinstructions</td>
<td>String <br>Max 140 characters <br>Endcoding: UTF-8</td>
<td>Yes</td>
<td>Text with instruction for solving the captcha. <br>For example: click on images with ghosts. <br><strong>Not required</strong> if the image already contains the instruction.</td>
</tr>
<tr data-line="954">
<td>imginstructions</td>
<td>Image <br>Max 400x150px, 100 kB</td>
<td>Yes</td>
<td>Image with instruction for solving reCAPTCHA. <br><strong>Not required</strong> if you're sending instruction as text with <em>textinstructions</em>.</td>
</tr>
<tr data-line="955">
<td>min_clicks</td>
<td>Integer <br>Default: 1</td>
<td>No</td>
<td>The minimum number of clicks to perform on the image</td>
</tr>
<tr data-line="956">
<td>max_clicks</td>
<td>Integer</td>
<td>No</td>
<td>The maximum number of clicks that can be performed on the image</td>
</tr>
<tr data-line="957">
<td>language</td>
<td>Integer <br>Default: 0</td>
<td>No</td>
<td>0 - not specified <br>1 - Cyrillic captcha <br>2 - Latin captcha</td>
</tr>
<tr data-line="958">
<td>lang</td>
<td>String</td>
<td>No</td>
<td>Language code. <a href="#language">See the list of supported languages.</a></td>
</tr>
<tr data-line="959">
<td>header_acao</td>
<td>Integer <br>Default: 0</td>
<td>No</td>
<td>0 - disabled <br>1 - enabled. <br>If enabled <code>in.php</code> will include <em>Access-Control-Allow-Origin:*</em> header in the response. <br>Used for cross-domain AJAX requests in web applications. Also supported by <code>res.php</code>.</td>
</tr>
<tr data-line="960">
<td>pingback</td>
<td>String</td>
<td>No</td>
<td>URL for pingback (callback) response that will be sent when captcha is solved. <br>URL should be registered on the server. <a href="#pingback">More info here</a>.</td>
</tr>
<tr data-line="961">
<td>json</td>
<td>Integer <br>Default: 0</td>
<td>No</td>
<td>0 - server will send the response as plain text <br>1 - tells the server to send the response as JSON</td>
</tr>
<tr data-line="962">
<td>soft_id</td>
<td>Integer</td>
<td>No</td>
<td>ID of software developer. Developers who integrated their software with 2Captcha get reward: 10% of spendings of their software users.</td>
</tr>
</tbody>
</table>
<p data-line="965"><strong>List of <em>GET</em> request parameters for <a href="https://2captcha.com/res.php">https://2captcha.com/res.php</a></strong></p>
<table data-line="967">
<thead data-line="967">
<tr data-line="967">
<th><strong>GET parameter</strong></th>
<th><strong>Type</strong></th>
<th><strong>Required</strong></th>
<th><strong>Description</strong></th>
</tr>
</thead>
<tbody data-line="969">
<tr data-line="969">
<td>key</td>
<td>String</td>
<td>Yes</td>
<td><a href="#solving_captchas">your API key</a></td>
</tr>
<tr data-line="970">
<td>action</td>
<td>String</td>
<td>Yes</td>
<td>get - get the asnwer for your captcha</td>
</tr>
<tr data-line="971">
<td>id</td>
<td>Integer</td>
<td>Yes</td>
<td>ID of captcha returned by in.php.</td>
</tr>
<tr data-line="972">
<td>json</td>
<td>Integer <br>Default: 0</td>
<td>No</td>
<td>0 - server will send the response as plain text <br>1 - tells the server to send the response as JSON</td>
</tr>
</tbody>
</table>
<p data-line="974"><strong>Request URL example:</strong></p>

        <details  data-line="976" class="md-editor-code" open="">
          <summary class="md-editor-code-head">
            <div class="md-editor-code-flag"><span></span><span></span><span></span></div>
            <div class="md-editor-code-action">
              <span class="md-editor-code-lang"></span>
              <span class="md-editor-copy-button" data-tips="Copy">Copy</span>
              
              <span class="md-editor-collapse-tips"><svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="lucide lucide-circle-chevron-left md-editor-icon"><circle cx="12" cy="12" r="10"/><path d="m14 16-4-4 4-4"/></svg></span>
            </div>
          </summary>
          <pre><code class="language-" language=><span class="md-editor-code-block">https://2captcha.com/res.php?key=1abc234de56fab7c89012d34e56fa7b8&amp;action=get&amp;id=2122988149</span><span rn-wrapper aria-hidden="true"><span></span></span></code></pre>

        </details>
      </section>
<section id="solving_rotatecaptcha">
<h4 id="rotatecaptcha" tabindex="-1" data-line="981"><a class="header-anchor" href="#rotatecaptcha">RotateCaptcha</a></h4>
<blockquote data-line="983">
<p data-line="983">RotateCaptcha is a type of captcha where you have to rotate images to solve it. The most popular is FunCaptcha by Arkose Labs.</p>
</blockquote>
<img src="/assets/captcha-api-docs/img/funcaptcha.gif" width="470" height="292" alt="FunCaptcha" loading="lazy" />
<p data-line="987">To solve RotateCaptcha you have to:</p>
<ol data-line="989">
<li data-line="989">
<p data-line="989">Get an image or several images that should be rotated.</p>
</li>
<li data-line="990">
<p data-line="990"><strong>Optionally:</strong> determine the angle for one rotation step and provide it as a value for <em>angle</em> parameter.<br>
If not defined we'll use the default value for FunCaptcha: 40 degrees.</p>
<p data-line="993">The full list of parameters is in the <a href="#rotatecaptcha_post">table below.</a></p>
</li>
<li data-line="995">
<p data-line="995">Submit images to our server with <em>HTTP POST</em> request to our API URL: <code>https://2captcha.com/in.php</code> setting <em>method</em> parameter to <em>rotatecaptcha</em>. Server accepts images only in multipart format.</p>
<p data-line="997">Server will return captcha ID or an <a href="#error_handling">error code</a> if something went wrong.</p>
</li>
<li data-line="999">
<p data-line="999">Make a 5 seconds timeout and submit a <em>HTTP GET</em> request to our API URL: <code>https://2captcha.com/res.php</code> to get the result.</p>
<p data-line="1001">If captcha is already solved server will return the answer with angles for each image like: <em>OK|40|200|-120</em>.<br>
Positive values mean that images should be rotated clockwise.<br>
Negative values mean that images should be rotated counter-clockwise.</p>
<p data-line="1005">If captcha is not solved yet server will return <em>CAPCHA_NOT_READY</em> result. Repeat your request in 5 seconds.<br>
If something went wrong server will return an <a href="#error_handling">error code</a>.</p>
</li>
<li data-line="1008">
<p data-line="1008">Rotate images to given angles to solve your RotateCaptcha.</p>
</li>
</ol>
<p data-line="1010"><strong>Sample form for RotateCaptcha</strong></p>

        <details  data-line="1012" class="md-editor-code" open="">
          <summary class="md-editor-code-head">
            <div class="md-editor-code-flag"><span></span><span></span><span></span></div>
            <div class="md-editor-code-action">
              <span class="md-editor-code-lang"></span>
              <span class="md-editor-copy-button" data-tips="Copy">Copy</span>
              
              <span class="md-editor-collapse-tips"><svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="lucide lucide-circle-chevron-left md-editor-icon"><circle cx="12" cy="12" r="10"/><path d="m14 16-4-4 4-4"/></svg></span>
            </div>
          </summary>
          <pre><code class="language-" language=><span class="md-editor-code-block">&lt;form method=&quot;post&quot; action=&quot;https://2captcha.com/in.php&quot; enctype=&quot;multipart/form-data&quot;&gt;
KEY:&lt;br&gt;
&lt;input  name=&quot;key&quot; value=&quot;YOUR_APIKEY&quot;&gt;&lt;br&gt;
Type&lt;br&gt;
&lt;input  name=&quot;method&quot; value=&quot;rotatecaptcha&quot;&gt;&lt;br&gt;
Angle&lt;br&gt;
&lt;input  name=&quot;angle&quot; value=&quot;40&quot;&gt;&lt;br&gt;
Files:&lt;br&gt;
&lt;input type=&quot;file&quot; name=&quot;file&quot;&gt;&lt;br&gt;
&lt;input type=&quot;submit&quot; value=&quot;Upload and get the ID&quot;&gt;
&lt;/form&gt;</span><span rn-wrapper aria-hidden="true"><span></span><span></span><span></span><span></span><span></span><span></span><span></span><span></span><span></span><span></span><span></span></span></code></pre>

        </details>
      <p data-line="1024"><strong>Sample form for RotateCaptcha in base64 format</strong></p>

        <details  data-line="1026" class="md-editor-code" open="">
          <summary class="md-editor-code-head">
            <div class="md-editor-code-flag"><span></span><span></span><span></span></div>
            <div class="md-editor-code-action">
              <span class="md-editor-code-lang"></span>
              <span class="md-editor-copy-button" data-tips="Copy">Copy</span>
              
              <span class="md-editor-collapse-tips"><svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="lucide lucide-circle-chevron-left md-editor-icon"><circle cx="12" cy="12" r="10"/><path d="m14 16-4-4 4-4"/></svg></span>
            </div>
          </summary>
          <pre><code class="language-" language=><span class="md-editor-code-block">&lt;form method=&quot;post&quot; action=&quot;https://2captcha.com/in.php&quot;&gt;
KEY:&lt;br&gt;
&lt;input  name=&quot;key&quot; value=&quot;YOUR_APIKEY&quot;&gt;&lt;br&gt;
Type&lt;br&gt;
&lt;input  name=&quot;method&quot; value=&quot;rotatecaptcha&quot;&gt;&lt;br&gt;
Angle&lt;br&gt;
&lt;input  name=&quot;angle&quot; value=&quot;40&quot;&gt;&lt;br&gt;
Files:&lt;br&gt;
&lt;textarea name=&quot;body&quot;&gt;BASE64_FILE&lt;/textarea&gt;
&lt;input type=&quot;submit&quot; value=&quot;Upload and get the ID&quot;&gt;
&lt;/form&gt;</span><span rn-wrapper aria-hidden="true"><span></span><span></span><span></span><span></span><span></span><span></span><span></span><span></span><span></span><span></span><span></span></span></code></pre>

        </details>
      <p data-line="1038"><em>YOUR_APIKEY</em> is <a href="#solving_captchas">your API key</a>.</p>
<p data-line="1040"><strong>List of <em>POST</em> request parameters for <a href="https://2captcha.com/in.php">https://2captcha.com/in.php</a></strong></p>
<table data-line="1042">
<thead data-line="1042">
<tr data-line="1042">
<th><strong>POST parameter</strong></th>
<th><strong>Type</strong></th>
<th><strong>Required</strong></th>
<th><strong>Description</strong></th>
</tr>
</thead>
<tbody data-line="1044">
<tr data-line="1044">
<td>key</td>
<td>String</td>
<td>Yes</td>
<td><a href="#solving_captchas">your API key</a></td>
</tr>
<tr data-line="1045">
<td>method</td>
<td>String</td>
<td>Yes</td>
<td>Captcha solving method. <br>rotatecaptcha - defines that you're sending RotateCaptcha</td>
</tr>
<tr data-line="1046">
<td>angle</td>
<td>Integer <br>Default: 40</td>
<td>No</td>
<td>Angle for one rotation step in degrees. <br>If not defined we'll use the default value for FunCaptcha: 40 degrees.</td>
</tr>
<tr data-line="1047">
<td>file</td>
<td>File</td>
<td>Yes*</td>
<td>Captcha image file. <br>* - required if you submit image as a file</td>
</tr>
<tr data-line="1048">
<td>body</td>
<td>String</td>
<td>Yes*</td>
<td>Base64-encoded captcha image <br>* - required if you submit image as Base64-encoded string</td>
</tr>
<tr data-line="1049">
<td>lang</td>
<td>String</td>
<td>No</td>
<td>Language code. <a href="#language">See the list of supported languages.</a></td>
</tr>
<tr data-line="1050">
<td>imginstructions</td>
<td>String</td>
<td>No</td>
<td>Image with instruction for worker to help him to solve captcha correctly.</td>
</tr>
<tr data-line="1051">
<td>textinstructions</td>
<td>String</td>
<td>No</td>
<td>Text will be shown to worker to help him to to solve captcha correctly.</td>
</tr>
<tr data-line="1052">
<td>header_acao</td>
<td>Integer <br>Default: 0</td>
<td>No</td>
<td>0 - disabled <br>1 - enabled. <br>If enabled <code>in.php</code> will include <code>Access-Control-Allow-Origin:*</code> header in the response. <br>Used for cross-domain AJAX requests in web applications. Also supported by <code>res.php</code>.</td>
</tr>
<tr data-line="1053">
<td>pingback</td>
<td>String</td>
<td>No</td>
<td>URL for pingback (callback) response that will be sent when captcha is solved. <br>URL should be registered on the server. <a href="#pingback">More info here</a>.</td>
</tr>
<tr data-line="1054">
<td>json</td>
<td>Integer <br>Default: 0</td>
<td>No</td>
<td>0 - server will send the response as plain text <br>1 - tells the server to send the response as JSON</td>
</tr>
<tr data-line="1055">
<td>soft_id</td>
<td>Integer</td>
<td>No</td>
<td>ID of software developer. Developers who integrated their software with 2Captcha get reward: 10% of spendings of their software users.</td>
</tr>
</tbody>
</table>
<p data-line="1057"><strong>List of <em>GET</em> request parameters for <a href="https://2captcha.com/res.php">https://2captcha.com/res.php</a></strong></p>
<table data-line="1059">
<thead data-line="1059">
<tr data-line="1059">
<th><strong>GET parameter</strong></th>
<th><strong>Type</strong></th>
<th><strong>Required</strong></th>
<th><strong>Description</strong></th>
</tr>
</thead>
<tbody data-line="1061">
<tr data-line="1061">
<td>key</td>
<td>String</td>
<td>Yes</td>
<td><a href="#solving_captchas">your API key</a></td>
</tr>
<tr data-line="1062">
<td>action</td>
<td>String</td>
<td>Yes</td>
<td>get - get the asnwer for your captcha</td>
</tr>
<tr data-line="1063">
<td>id</td>
<td>Integer</td>
<td>Yes</td>
<td>ID of captcha returned by in.php.</td>
</tr>
<tr data-line="1064">
<td>json</td>
<td>Integer <br>Default: 0</td>
<td>No</td>
<td>0 - server will send the response as plain text <br>1 - tells the server to send the response as JSON</td>
</tr>
</tbody>
</table>
<p data-line="1066"><strong>Request URL example:</strong></p>

        <details  data-line="1068" class="md-editor-code" open="">
          <summary class="md-editor-code-head">
            <div class="md-editor-code-flag"><span></span><span></span><span></span></div>
            <div class="md-editor-code-action">
              <span class="md-editor-code-lang"></span>
              <span class="md-editor-copy-button" data-tips="Copy">Copy</span>
              
              <span class="md-editor-collapse-tips"><svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="lucide lucide-circle-chevron-left md-editor-icon"><circle cx="12" cy="12" r="10"/><path d="m14 16-4-4 4-4"/></svg></span>
            </div>
          </summary>
          <pre><code class="language-" language=><span class="md-editor-code-block">https://2captcha.com/res.php?key=1abc234de56fab7c89012d34e56fa7b8&amp;action=get&amp;id=2122988149</span><span rn-wrapper aria-hidden="true"><span></span></span></code></pre>

        </details>
      </section>
<section id="solving_funcaptcha_new">
<h4 id="arkose-labs-funcaptcha" tabindex="-1" data-line="1073"><a class="header-anchor" href="#arkose-labs-funcaptcha">Arkose Labs FunCaptcha</a></h4>
<blockquote data-line="1075">
<p data-line="1075">Now we provide a method to solve Arkose Labs captcha (ex. FunCaptcha) with a token.</p>
</blockquote>
<p data-line="1077">The method is pretty simple:</p>
<ol data-line="1079">
<li data-line="1079">
<p data-line="1079">You need to locate two values on the page with Arkose Labs captcha</p>
<ul data-line="1081">
<li data-line="1081">- Public key</li>
<li data-line="1082">- Service URL (surl)</li>
</ul>
<p data-line="1084">Public key can be found inside <code>data-pkey</code> parameter of funcaptcha's div element or inside an input element with name <code>fc-token</code> - just extract the key indicated after <code>pk</code> from the value of this element.<br>
Service Url can be also found in <code>fc-token</code> - that is a value of <code>surl</code> parameter.<br>
Service Url is optional parameter and if you don't provide it we use a default value that is valid for most cases, but we recommend you to provide it.</p>
</li>
<li data-line="1088">
<p data-line="1088">Submit a <em>HTTP GET</em> or <em>POST</em> request to our API URL: <code>https://2captcha.com/in.php</code> with method set to <em>funcaptcha</em>, provide values found on previous step for <em>publickey</em> and <em>surl</em> parameter and full page URL as value for <em>pageurl</em>.<br>
You can find the full list of parameters in the <a href="#funcaptcha_new_post">table below.</a></p>
<p data-line="1091"><strong>Request URL example:</strong></p>

        <details  data-line="1093" class="md-editor-code" open="">
          <summary class="md-editor-code-head">
            <div class="md-editor-code-flag"><span></span><span></span><span></span></div>
            <div class="md-editor-code-action">
              <span class="md-editor-code-lang"></span>
              <span class="md-editor-copy-button" data-tips="Copy">Copy</span>
              
              <span class="md-editor-collapse-tips"><svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="lucide lucide-circle-chevron-left md-editor-icon"><circle cx="12" cy="12" r="10"/><path d="m14 16-4-4 4-4"/></svg></span>
            </div>
          </summary>
          <pre><code class="language-" language=><span class="md-editor-code-block">https://2captcha.com/in.php?key=1abc234de56fab7c89012d34e56fa7b8&amp;method=funcaptcha&amp;publickey=12AB34CD-56F7-AB8C-9D01-2EF3456789A0&amp;surl=https://client-api.arkoselabs.com&amp;pageurl=http://mysite.com/page/with/funcaptcha/</span><span rn-wrapper aria-hidden="true"><span></span></span></code></pre>

        </details>
      </li>
<li data-line="1095">
<p data-line="1095">If everything is fine server will return the ID of your captcha as plain text, like: <em>OK|2122988149</em> or as JSON <em>{&quot;status&quot;:1,&quot;request&quot;:&quot;2122988149&quot;}</em> if <em>json</em> parameter was used.<br>
Otherwise server will return an <a href="#error_handling">error code</a>.</p>
</li>
<li data-line="1097">
<p data-line="1097">Make a 10-20 seconds timeout then submit a <em>HTTP GET</em> request to our API URL: <code>https://2captcha.com/res.php</code> to get the result.<br>
The full list of parameters is in the <a href="#funcaptcha_new_get">table below</a>.</p>
<p data-line="1100">If captcha is already solved server will respond in plain text or JSON and return the answer token that looks like:</p>

        <details  data-line="1102" class="md-editor-code" open="">
          <summary class="md-editor-code-head">
            <div class="md-editor-code-flag"><span></span><span></span><span></span></div>
            <div class="md-editor-code-action">
              <span class="md-editor-code-lang"></span>
              <span class="md-editor-copy-button" data-tips="Copy">Copy</span>
              
              <span class="md-editor-collapse-tips"><svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="lucide lucide-circle-chevron-left md-editor-icon"><circle cx="12" cy="12" r="10"/><path d="m14 16-4-4 4-4"/></svg></span>
            </div>
          </summary>
          <pre><code class="language-" language=><span class="md-editor-code-block">3084f4a302b176cd7.96368058|r=ap-southeast-1|guitextcolor=%23FDD531|metabgclr=%23FFFFFF|metaiconclr=%23202122|meta=3|lang=en|pk=12AB34CD-56F7-AB8C-9D01-2EF3456789A0|cdn_url=https://cdn.funcaptcha.com/fc|surl=https://funcaptcha.com</span><span rn-wrapper aria-hidden="true"><span></span></span></code></pre>

        </details>
      <p data-line="1104">If captcha is not solved yet server will return <em>CAPCHA_NOT_READY</em> result. Repeat your request in 5 seconds.</p>
<p data-line="1106">If something went wrong server will return an <a href="#error_handling">error code</a>.</p>
</li>
<li data-line="1108">
<p data-line="1108">Locate the element with id <em>fc-token</em> and put the token into value of this element.</p>
</li>
<li data-line="1109">
<p data-line="1109">Do the rest what you need to do on the website: submit a form or click on a button or something else.</p>
</li>
</ol>
<p data-line="1111"><strong>List of GET/POST request parameters for <a href="https://2captcha.com/in.php">https://2captcha.com/in.php</a></strong></p>
<table data-line="1113">
<thead data-line="1113">
<tr data-line="1113">
<th><strong>Parameter</strong></th>
<th><strong>Type</strong></th>
<th><strong>Required</strong></th>
<th><strong>Description</strong></th>
</tr>
</thead>
<tbody data-line="1115">
<tr data-line="1115">
<td>key</td>
<td>String</td>
<td>Yes</td>
<td><a href="#solving_captchas">your API key</a></td>
</tr>
<tr data-line="1116">
<td>method</td>
<td>String</td>
<td>Yes</td>
<td>funcaptcha - defines that you're sending a FunCaptcha with token method</td>
</tr>
<tr data-line="1117">
<td>publickey</td>
<td>String</td>
<td>Yes</td>
<td>Value of <em>pk</em> or <em>data-pkey</em> parameter you found on page</td>
</tr>
<tr data-line="1118">
<td>surl</td>
<td>String</td>
<td>No</td>
<td>Value of <em>surl</em> parameter you found on page</td>
</tr>
<tr data-line="1119">
<td>pageurl</td>
<td>String</td>
<td>Yes</td>
<td>Full URL of the page where you see the FunCaptcha</td>
</tr>
<tr data-line="1120">
<td>data[key]</td>
<td>String</td>
<td>No</td>
<td>Custom data to pass to FunCaptcha. <br>For example: data[blob]=stringValue</td>
</tr>
<tr data-line="1121">
<td>userAgent</td>
<td>String</td>
<td>No</td>
<td>Tells us to use your user-agent value.</td>
</tr>
<tr data-line="1122">
<td>header_acao</td>
<td>Integer <br>Default: 0</td>
<td>No</td>
<td>0 - disabled <br>1 - enabled. <br>If enabled <code>in.php</code> will include <em>Access-Control-Allow-Origin:*</em> header in the response. <br>Used for cross-domain AJAX requests in web applications. Also supported by <code>res.php</code>.</td>
</tr>
<tr data-line="1123">
<td>pingback</td>
<td>String</td>
<td>No</td>
<td>URL for pingback (callback) response that will be sent when captcha is solved. <br>URL should be registered on the server. <a href="#pingback">More info here</a>.</td>
</tr>
<tr data-line="1124">
<td>json</td>
<td>Integer <br>Default: 0</td>
<td>No</td>
<td>0 - server will send the response as plain text <br>1 - tells the server to send the response as JSON</td>
</tr>
<tr data-line="1125">
<td>soft_id</td>
<td>Integer</td>
<td>No</td>
<td>ID of software developer. Developers who integrated their software with 2Captcha get reward: 10% of spendings of their software users.</td>
</tr>
<tr data-line="1126">
<td>proxy</td>
<td>String</td>
<td>No</td>
<td>Format: <em>login:password@123.123.123.123:3128</em> <br>You can find more info about proxies <a href="#proxies">here</a>.</td>
</tr>
<tr data-line="1127">
<td>proxytype</td>
<td>String</td>
<td>No</td>
<td>Type of your proxy: HTTP, HTTPS, SOCKS4, SOCKS5.</td>
</tr>
</tbody>
</table>
<p data-line="1129"><strong>List of <em>GET</em> request parameters for <a href="https://2captcha.com/res.php">https://2captcha.com/res.php</a></strong></p>
<table data-line="1131">
<thead data-line="1131">
<tr data-line="1131">
<th><strong>GET parameter</strong></th>
<th><strong>Type</strong></th>
<th><strong>Required</strong></th>
<th><strong>Description</strong></th>
</tr>
</thead>
<tbody data-line="1133">
<tr data-line="1133">
<td>key</td>
<td>String</td>
<td>Yes</td>
<td><a href="#solving_captchas">your API key</a></td>
</tr>
<tr data-line="1134">
<td>action</td>
<td>String</td>
<td>Yes</td>
<td>get - get the asnwer for your captcha</td>
</tr>
<tr data-line="1135">
<td>id</td>
<td>Integer</td>
<td>Yes</td>
<td>ID of captcha returned by in.php.</td>
</tr>
<tr data-line="1136">
<td>json</td>
<td>Integer <br>Default: 0</td>
<td>No</td>
<td>0 - server will send the response as plain text <br>1 - tells the server to send the response as JSON</td>
</tr>
</tbody>
</table>
<p data-line="1138"><strong>Request URL example:</strong></p>

        <details  data-line="1140" class="md-editor-code" open="">
          <summary class="md-editor-code-head">
            <div class="md-editor-code-flag"><span></span><span></span><span></span></div>
            <div class="md-editor-code-action">
              <span class="md-editor-code-lang"></span>
              <span class="md-editor-copy-button" data-tips="Copy">Copy</span>
              
              <span class="md-editor-collapse-tips"><svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="lucide lucide-circle-chevron-left md-editor-icon"><circle cx="12" cy="12" r="10"/><path d="m14 16-4-4 4-4"/></svg></span>
            </div>
          </summary>
          <pre><code class="language-" language=><span class="md-editor-code-block">https://2captcha.com/res.php?key=1abc234de56fab7c89012d34e56fa7b8&amp;action=get&amp;id=2122988149</span><span rn-wrapper aria-hidden="true"><span></span></span></code></pre>

        </details>
      </section>
<section id="solving_geetest">
<h4 id="geetest" tabindex="-1" data-line="1145"><a class="header-anchor" href="#geetest">Geetest</a></h4>
<blockquote data-line="1147">
<p data-line="1147">Geetest is a type of captcha where you have to move a piece of a puzzle or select some figures in the order.</p>
</blockquote>
<p data-line="1149">To solve Geetest captcha with our service you have to:</p>
<ol data-line="1151">
<li data-line="1151">
<p data-line="1151">Find the following Geetest captcha parameters on the target website (usually you can find them inside initGeetest function).</p>
<ul data-line="1153">
<li data-line="1153"><code>gt</code> - public website key (static)</li>
<li data-line="1154"><code>challenge</code> - dynamic challenge key</li>
<li data-line="1155"><code>api_server</code> - API domain (optional)</li>
</ul>
</li>
</ol>
<blockquote data-line="1157">
<p data-line="1157"><strong>Important:</strong> you should get a new challenge value for each request to our API. Once captcha was loaded on the page the challenge value becomes invalid. You should inspect requests made to the website when page is loaded to identify a request that gets a new challenge value. Then you should make such request each time to get a valid challenge value.</p>
</blockquote>
<ol start="3" data-line="1159">
<li data-line="1159">
<p data-line="1159">Submit a <em>HTTP GET</em> or <em>POST</em> request to our API URL: <code>https://2captcha.com/in.php</code> with method set to <em>geetest</em> providing values found on previous step in your request as values for corresponding request parameters and also full page URL as value for <em>pageurl</em>.<br>
You can find the full list of parameters in the <a href="#geetest_post">table below.</a></p>
<p data-line="1162"><strong>Request URL example:</strong></p>

        <details  data-line="1164" class="md-editor-code" open="">
          <summary class="md-editor-code-head">
            <div class="md-editor-code-flag"><span></span><span></span><span></span></div>
            <div class="md-editor-code-action">
              <span class="md-editor-code-lang"></span>
              <span class="md-editor-copy-button" data-tips="Copy">Copy</span>
              
              <span class="md-editor-collapse-tips"><svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="lucide lucide-circle-chevron-left md-editor-icon"><circle cx="12" cy="12" r="10"/><path d="m14 16-4-4 4-4"/></svg></span>
            </div>
          </summary>
          <pre><code class="language-" language=><span class="md-editor-code-block">https://2captcha.com/in.php?key=1abc234de56fab7c89012d34e56fa7b8&amp;method=geetest&amp;gt=f1ab2cdefa3456789012345b6c78d90e&amp;challenge=12345678abc90123d45678ef90123a456b&amp;api_server=api-na.geetest.com&amp;pageurl=https://www.site.com/page/</span><span rn-wrapper aria-hidden="true"><span></span></span></code></pre>

        </details>
      </li>
<li data-line="1166">
<p data-line="1166">If everything is fine server will return the ID of your captcha as plain text, like: <em>OK|2122988149</em> or as JSON <em>{&quot;status&quot;:1,&quot;request&quot;:&quot;2122988149&quot;}</em> if <em>json</em> parameter was used.<br>
Otherwise server will return an <a href="#error_handling">error code</a>.</p>
</li>
<li data-line="1168">
<p data-line="1168">Make a 15-20 seconds timeout then submit a <em>HTTP GET</em> request to our API URL: <code>https://2captcha.com/res.php</code> to get the result.<br>
The full list of parameters is in the <a href="#geetest_get">table below</a>.</p>
<p data-line="1171">If captcha is already solved server will return the response in JSON. The response contains three values: <code>challenge</code>, <code>validate</code> and <code>seccode</code>:</p>

        <details  data-line="1173" class="md-editor-code" open="">
          <summary class="md-editor-code-head">
            <div class="md-editor-code-flag"><span></span><span></span><span></span></div>
            <div class="md-editor-code-action">
              <span class="md-editor-code-lang"></span>
              <span class="md-editor-copy-button" data-tips="Copy">Copy</span>
              
              <span class="md-editor-collapse-tips"><svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="lucide lucide-circle-chevron-left md-editor-icon"><circle cx="12" cy="12" r="10"/><path d="m14 16-4-4 4-4"/></svg></span>
            </div>
          </summary>
          <pre><code class="language-" language=><span class="md-editor-code-block">{
&quot;challenge&quot;:&quot;1a2b3456cd67890e12345fab678901c2de&quot;,
&quot;validate&quot;:&quot;09fe8d7c6ba54f32e1dcb0a9fedc8765&quot;,
&quot;seccode&quot;:&quot;12fe3d4c56789ba01f2e345d6789c012|jordan&quot;
}</span><span rn-wrapper aria-hidden="true"><span></span><span></span><span></span><span></span><span></span></span></code></pre>

        </details>
      <p data-line="1179">If captcha is not solved yet server will return <em>CAPCHA_NOT_READY</em> result. Repeat your request in 5 seconds.</p>
<p data-line="1181">If something went wrong server will return an <a href="#error_handling">error code</a>.</p>
</li>
<li data-line="1183">
<p data-line="1183">Use the values received from our API to submit your request to the target website placing the values into corresponding request fields:</p>
<ul data-line="1185">
<li data-line="1185"><code>geetest_challenge</code></li>
<li data-line="1186"><code>geetest_validate</code></li>
<li data-line="1187"><code>geetest_seccode</code></li>
</ul>
</li>
</ol>
<p data-line="1189"><strong>List of <em>GET/POST</em> request parameters for <a href="https://2captcha.com/in.php">https://2captcha.com/in.php</a></strong></p>
<table data-line="1191">
<thead data-line="1191">
<tr data-line="1191">
<th><strong>Parameter</strong></th>
<th><strong>Type</strong></th>
<th><strong>Required</strong></th>
<th><strong>Description</strong></th>
</tr>
</thead>
<tbody data-line="1193">
<tr data-line="1193">
<td>key</td>
<td>String</td>
<td>Yes</td>
<td><a href="#solving_captchas">your API key</a></td>
</tr>
<tr data-line="1194">
<td>method</td>
<td>String</td>
<td>Yes</td>
<td>geetest - defines that you're sending a Geetest captcha</td>
</tr>
<tr data-line="1195">
<td>gt</td>
<td>String</td>
<td>Yes</td>
<td>Value of <em>gt</em> parameter you found on target website</td>
</tr>
<tr data-line="1196">
<td>challenge</td>
<td>String</td>
<td>Yes</td>
<td>Value of <em>challenge</em> parameter you found on target website</td>
</tr>
<tr data-line="1197">
<td>api_server</td>
<td>String</td>
<td>No</td>
<td>Value of <em>api_server</em> parameter you found on target website</td>
</tr>
<tr data-line="1198">
<td>offline</td>
<td>Number <br>Default: 0</td>
<td>No</td>
<td>In rare cases initGeetest can be called with <em>offline</em> parameter. If the call uses <em>offline: true</em>, set the value to 1.</td>
</tr>
<tr data-line="1199">
<td>new_captcha</td>
<td>Number <br>Default: 0</td>
<td>No</td>
<td>In rare cases initGeetest can be called with <em>new_captcha</em> parameter. If the call uses <em>new_captcha: true</em>, set the value to 1. Mostly used with <em>offline</em> parameter.</td>
</tr>
<tr data-line="1200">
<td>pageurl</td>
<td>String</td>
<td>Yes</td>
<td>Full URL of the page where you see Geetest captcha</td>
</tr>
<tr data-line="1201">
<td>header_acao</td>
<td>Integer <br>Default: 0</td>
<td>No</td>
<td>0 - disabled <br>1 - enabled. <br>If enabled <code>in.php</code> will include <em>Access-Control-Allow-Origin:*</em> header in the response. <br>Used for cross-domain AJAX requests in web applications. Also supported by <code>res.php</code>.</td>
</tr>
<tr data-line="1202">
<td>pingback</td>
<td>String</td>
<td>No</td>
<td>URL for pingback (callback) response that will be sent when captcha is solved. <br>URL should be registered on the server. <a href="#pingback">More info here</a>.</td>
</tr>
<tr data-line="1203">
<td>json</td>
<td>Integer <br>Default: 0</td>
<td>No</td>
<td>0 - server will send the response as plain text <br>1 - tells the server to send the response as JSON</td>
</tr>
<tr data-line="1204">
<td>soft_id</td>
<td>Integer</td>
<td>No</td>
<td>ID of software developer. Developers who integrated their software with 2Captcha get reward: 10% of spendings of their software users.</td>
</tr>
<tr data-line="1205">
<td>proxy</td>
<td>String</td>
<td>No</td>
<td>Format: <em>login:password@123.123.123.123:3128</em> <br>You can find more info about proxies <a href="#proxies">here</a>.</td>
</tr>
<tr data-line="1206">
<td>proxytype</td>
<td>String</td>
<td>No</td>
<td>Type of your proxy: HTTP, HTTPS, SOCKS4, SOCKS5.</td>
</tr>
<tr data-line="1207">
<td>userAgent</td>
<td>String</td>
<td>No</td>
<td>Your <em>userAgent</em> that will be passed to our worker and used to solve the captcha.</td>
</tr>
</tbody>
</table>
<p data-line="1209"><strong>List of <em>GET</em> request parameters for <a href="https://2captcha.com/res.php">https://2captcha.com/res.php</a></strong></p>
<table data-line="1211">
<thead data-line="1211">
<tr data-line="1211">
<th><strong>GET parameter</strong></th>
<th><strong>Type</strong></th>
<th><strong>Required</strong></th>
<th><strong>Description</strong></th>
</tr>
</thead>
<tbody data-line="1213">
<tr data-line="1213">
<td>key</td>
<td>String</td>
<td>Yes</td>
<td><a href="#solving_captchas">your API key</a></td>
</tr>
<tr data-line="1214">
<td>action</td>
<td>String</td>
<td>Yes</td>
<td>get - get the asnwer for your captcha</td>
</tr>
<tr data-line="1215">
<td>id</td>
<td>Integer</td>
<td>Yes</td>
<td>ID of captcha returned by in.php.</td>
</tr>
<tr data-line="1216">
<td>json</td>
<td>Integer <br>Default: 1</td>
<td>No</td>
<td>Server will alsways return the response as JSON for Geetest captcha.</td>
</tr>
</tbody>
</table>
<p data-line="1218"><strong>Request URL example:</strong></p>

        <details  data-line="1220" class="md-editor-code" open="">
          <summary class="md-editor-code-head">
            <div class="md-editor-code-flag"><span></span><span></span><span></span></div>
            <div class="md-editor-code-action">
              <span class="md-editor-code-lang"></span>
              <span class="md-editor-copy-button" data-tips="Copy">Copy</span>
              
              <span class="md-editor-collapse-tips"><svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="lucide lucide-circle-chevron-left md-editor-icon"><circle cx="12" cy="12" r="10"/><path d="m14 16-4-4 4-4"/></svg></span>
            </div>
          </summary>
          <pre><code class="language-" language=><span class="md-editor-code-block">https://2captcha.com/res.php?key=1abc234de56fab7c89012d34e56fa7b8&amp;action=get&amp;id=2122988149</span><span rn-wrapper aria-hidden="true"><span></span></span></code></pre>

        </details>
      </section>
<section id="geetest-v4">
<h4 id="geetest-v4-captcha" tabindex="-1" data-line="1225"><a class="header-anchor" href="#geetest-v4-captcha">Geetest v4 captcha</a></h4>
<blockquote data-line="1227">
<p data-line="1227">Geetest v4 is a new version of puzzle challenge, but you still have to move a piece of a puzzle to bypass it.</p>
</blockquote>
<p data-line="1229">To solve Geetest v4 captcha with our service you need to:</p>
<ol data-line="1231">
<li data-line="1231">
<p data-line="1231">find the <code>captcha_id</code> value in the page HTML source. Normally you will find the value inside script tag that include Geetest v4 javascript code on the page.</p>
</li>
<li data-line="1232">
<p data-line="1232">Submit a <em>HTTP GET</em> or <em>POST</em> request to our API URL: <code>https://2captcha.com/in.php</code> with method set to <em>geetest_v4</em> providing the <code>captcha_id</code> found on the page and full page URL as value for <em>pageurl</em>.</p>
<p data-line="1234"><strong>Request URL example:</strong></p>

        <details  data-line="1236" class="md-editor-code" open="">
          <summary class="md-editor-code-head">
            <div class="md-editor-code-flag"><span></span><span></span><span></span></div>
            <div class="md-editor-code-action">
              <span class="md-editor-code-lang"></span>
              <span class="md-editor-copy-button" data-tips="Copy">Copy</span>
              
              <span class="md-editor-collapse-tips"><svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="lucide lucide-circle-chevron-left md-editor-icon"><circle cx="12" cy="12" r="10"/><path d="m14 16-4-4 4-4"/></svg></span>
            </div>
          </summary>
          <pre><code class="language-" language=><span class="md-editor-code-block">https://2captcha.com/in.php?key=1abc234de56fab7c89012d34e56fa7b8&amp;method=geetest_v4&amp;captcha_id=f1ab2cdefa3456789012345b6c78d90e&amp;pageurl=https://www.site.com/page/</span><span rn-wrapper aria-hidden="true"><span></span></span></code></pre>

        </details>
      </li>
<li data-line="1238">
<p data-line="1238">If everything is fine server will return the ID of your captcha as plain text, like: <em>OK|2122988149</em> or as JSON <em>{&quot;status&quot;:1,&quot;request&quot;:&quot;2122988149&quot;}</em> if <em>json</em> parameter was used.<br>
Otherwise server will return an <a href="#error_handling">error code</a>.</p>
</li>
<li data-line="1240">
<p data-line="1240">Make a 15-20 seconds timeout then submit a <em>HTTP GET</em> request to our API URL: <code>https://2captcha.com/res.php</code> to get the result.</p>
<p data-line="1242">If captcha is already solved server will return the response in JSON. The response example is shown below:</p>

        <details  data-line="1244" class="md-editor-code" open="">
          <summary class="md-editor-code-head">
            <div class="md-editor-code-flag"><span></span><span></span><span></span></div>
            <div class="md-editor-code-action">
              <span class="md-editor-code-lang"></span>
              <span class="md-editor-copy-button" data-tips="Copy">Copy</span>
              
              <span class="md-editor-collapse-tips"><svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="lucide lucide-circle-chevron-left md-editor-icon"><circle cx="12" cy="12" r="10"/><path d="m14 16-4-4 4-4"/></svg></span>
            </div>
          </summary>
          <pre><code class="language-" language=><span class="md-editor-code-block">{
&quot;captcha_id&quot;: &quot;e392e1d7fd421dc63325744d5a2b9c73&quot;,
&quot;lot_number&quot;: &quot;7fafac97a43d4701aee908afa49c73ba&quot;,
&quot;pass_token&quot;: &quot;6f1c27bd15777d5e9e6e1ba94604c28e7b13b94eed3f7c8b79ceaf4660da6320&quot;,
&quot;gen_time&quot;: &quot;1648112802&quot;,
&quot;captcha_output&quot;: &quot;FEB0Fyp2UEcHdeFQ0PEN-BHenkuCzlpmfX_OLXuf49iF_rPvbjYc9whxQg-sYOCPSzX_19HF0gCPgSoAZ-JPxE46ddE7L6y0J-D_5CcMnT0IYKHFK-NdcBo_m6nISKrpSH3QE9l5r53UTChJdR-bOJPO20gA0bgPEMvDCew7UkQ=&quot;
}</span><span rn-wrapper aria-hidden="true"><span></span><span></span><span></span><span></span><span></span><span></span><span></span></span></code></pre>

        </details>
      <p data-line="1252">If captcha is not solved yet server will return <em>CAPCHA_NOT_READY</em> result. Repeat your request in 5 seconds.</p>
<p data-line="1254">If something went wrong server will return an <a href="#error_handling">error code</a>.</p>
</li>
<li data-line="1256">
<p data-line="1256">Use the values received from our API to submit your request to the target website the same way it is done when you bypass the captcha manually.</p>
</li>
</ol>
<p data-line="1258"><strong>List of <em>GET/POST</em> request parameters for <a href="https://2captcha.com/in.php">https://2captcha.com/in.php</a></strong></p>
<table data-line="1260">
<thead data-line="1260">
<tr data-line="1260">
<th><strong>Parameter</strong></th>
<th><strong>Type</strong></th>
<th><strong>Required</strong></th>
<th><strong>Description</strong></th>
</tr>
</thead>
<tbody data-line="1262">
<tr data-line="1262">
<td>key</td>
<td>String</td>
<td>Yes</td>
<td><a href="#solving_captchas">your API key</a></td>
</tr>
<tr data-line="1263">
<td>method</td>
<td>String</td>
<td>Yes</td>
<td>geetest_v4 - defines that you're sending the Geetest v4</td>
</tr>
<tr data-line="1264">
<td>captcha_id</td>
<td>String</td>
<td>Yes</td>
<td>Value of <em>captcha_id</em> parameter you found on target website</td>
</tr>
<tr data-line="1265">
<td>pageurl</td>
<td>String</td>
<td>Yes</td>
<td>Full URL of the page where you see Geetest captcha</td>
</tr>
<tr data-line="1266">
<td>header_acao</td>
<td>Integer <br>Default: 0</td>
<td>No</td>
<td>0 - disabled <br>1 - enabled. <br>If enabled <code>in.php</code> will include <em>Access-Control-Allow-Origin:*</em> header in the response. <br>Used for cross-domain AJAX requests in web applications. Also supported by <code>res.php</code>.</td>
</tr>
<tr data-line="1267">
<td>pingback</td>
<td>String</td>
<td>No</td>
<td>URL for pingback (callback) response that will be sent when captcha is solved. <br>URL should be registered on the server. <a href="#pingback">More info here</a>.</td>
</tr>
<tr data-line="1268">
<td>json</td>
<td>Integer <br>Default: 0</td>
<td>No</td>
<td>0 - server will send the response as plain text <br>1 - tells the server to send the response as JSON</td>
</tr>
<tr data-line="1269">
<td>soft_id</td>
<td>Integer</td>
<td>No</td>
<td>ID of software developer. Developers who integrated their software with 2Captcha get reward: 10% of spendings of their software users.</td>
</tr>
<tr data-line="1270">
<td>proxy</td>
<td>String</td>
<td>No</td>
<td>Format: <em>login:password@123.123.123.123:3128</em> <br>You can find more info about proxies <a href="#proxies">here</a>.</td>
</tr>
<tr data-line="1271">
<td>proxytype</td>
<td>String</td>
<td>No</td>
<td>Type of your proxy: HTTP, HTTPS, SOCKS4, SOCKS5.</td>
</tr>
</tbody>
</table>
<p data-line="1273"><strong>List of <em>GET</em> request parameters for <a href="https://2captcha.com/res.php">https://2captcha.com/res.php</a></strong></p>
<table data-line="1275">
<thead data-line="1275">
<tr data-line="1275">
<th><strong>GET parameter</strong></th>
<th><strong>Type</strong></th>
<th><strong>Required</strong></th>
<th><strong>Description</strong></th>
</tr>
</thead>
<tbody data-line="1277">
<tr data-line="1277">
<td>key</td>
<td>String</td>
<td>Yes</td>
<td><a href="#solving_captchas">your API key</a></td>
</tr>
<tr data-line="1278">
<td>action</td>
<td>String</td>
<td>Yes</td>
<td>get - get the asnwer for your captcha</td>
</tr>
<tr data-line="1279">
<td>id</td>
<td>Integer</td>
<td>Yes</td>
<td>ID of captcha returned by in.php.</td>
</tr>
<tr data-line="1280">
<td>json</td>
<td>Integer <br>Default: 1</td>
<td>No</td>
<td>Server will alsways return the response as JSON for Geetest v4 captcha.</td>
</tr>
</tbody>
</table>
<p data-line="1282"><strong>Request URL example:</strong></p>

        <details  data-line="1284" class="md-editor-code" open="">
          <summary class="md-editor-code-head">
            <div class="md-editor-code-flag"><span></span><span></span><span></span></div>
            <div class="md-editor-code-action">
              <span class="md-editor-code-lang"></span>
              <span class="md-editor-copy-button" data-tips="Copy">Copy</span>
              
              <span class="md-editor-collapse-tips"><svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="lucide lucide-circle-chevron-left md-editor-icon"><circle cx="12" cy="12" r="10"/><path d="m14 16-4-4 4-4"/></svg></span>
            </div>
          </summary>
          <pre><code class="language-" language=><span class="md-editor-code-block">https://2captcha.com/res.php?key=1abc234de56fab7c89012d34e56fa7b8&amp;action=get&amp;id=2122988149</span><span rn-wrapper aria-hidden="true"><span></span></span></code></pre>

        </details>
      </section>
<section id="solving_capy">
<h4 id="capy-puzzle" tabindex="-1" data-line="1289"><a class="header-anchor" href="#capy-puzzle">Capy Puzzle</a></h4>
<blockquote data-line="1291">
<p data-line="1291">Capy is a Puzzle captcha</p>
<img src="/assets/captcha-api-docs/img/capy_puzzle.png" width="586" height="572" alt="Capy Puzzle captcha" loading="lazy" />
</blockquote>
<p data-line="1295">Solving Capy is really simple:</p>
<ol data-line="1297">
<li data-line="1297">
<p data-line="1297">Find the value of <em>capy_captchakey</em> parameter in the source code of the page or in the script source link that looks like: <a href="https://api.capy.me/puzzle/get_js/?k=**PUZZLE_Abc1dEFghIJKLM2no34P56q7rStu8v">https://api.capy.me/puzzle/get_js/?k=**PUZZLE_Abc1dEFghIJKLM2no34P56q7rStu8v</a>**.</p>
<p data-line="1299">Also find the root part of the script URL, for example: _<a href="https://api.capy.me/_">https://api.capy.me/_</a> and use it in <code>api_server</code> parameter.</p>
</li>
<li data-line="1301">
<p data-line="1301">Submit a <em>HTTP GET</em> or <em>POST</em> request to our API URL: <code>https://2captcha.com/in.php</code> with method set to <em>capy</em> and provide the values found on previous step as <em>captchakey</em> and <em>api_server</em> and the full page URL as value for <em>pageurl</em>.<br>
You can find the full list of parameters in the <a href="#capy_post">table below.</a></p>
<p data-line="1304"><strong>Request URL example:</strong></p>

        <details  data-line="1306" class="md-editor-code" open="">
          <summary class="md-editor-code-head">
            <div class="md-editor-code-flag"><span></span><span></span><span></span></div>
            <div class="md-editor-code-action">
              <span class="md-editor-code-lang"></span>
              <span class="md-editor-copy-button" data-tips="Copy">Copy</span>
              
              <span class="md-editor-collapse-tips"><svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="lucide lucide-circle-chevron-left md-editor-icon"><circle cx="12" cy="12" r="10"/><path d="m14 16-4-4 4-4"/></svg></span>
            </div>
          </summary>
          <pre><code class="language-" language=><span class="md-editor-code-block">https://2captcha.com/in.php?key=1abc234de56fab7c89012d34e56fa7b8&amp;method=capy&amp;captchakey=PUZZLE_Abc1dEFghIJKLM2no34P56q7rStu8v&amp;pageurl=http://mysite.com/</span><span rn-wrapper aria-hidden="true"><span></span></span></code></pre>

        </details>
      </li>
<li data-line="1308">
<p data-line="1308">If everything is fine server will return the ID of your captcha as plain text, like: <em>OK|2122988149</em> or as JSON <em>{&quot;status&quot;:1,&quot;request&quot;:&quot;2122988149&quot;}</em> if <em>json</em> parameter was used.<br>
Otherwise server will return an <a href="#error_handling">error code</a>.</p>
</li>
<li data-line="1310">
<p data-line="1310">Make a 15-20 seconds timeout then submit a <em>HTTP GET</em> request to our API URL: <code>https://2captcha.com/res.php</code> to get the result.<br>
The full list of parameters is in the <a href="#capy_get">table below</a>.</p>
<p data-line="1313">If captcha is already solved server will respond in JSON and return the answer containing three values: <code>captchakey</code>, <code>challengekey</code> and <code>answer</code></p>

        <details  data-line="1315" class="md-editor-code" open="">
          <summary class="md-editor-code-head">
            <div class="md-editor-code-flag"><span></span><span></span><span></span></div>
            <div class="md-editor-code-action">
              <span class="md-editor-code-lang"></span>
              <span class="md-editor-copy-button" data-tips="Copy">Copy</span>
              
              <span class="md-editor-collapse-tips"><svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="lucide lucide-circle-chevron-left md-editor-icon"><circle cx="12" cy="12" r="10"/><path d="m14 16-4-4 4-4"/></svg></span>
            </div>
          </summary>
          <pre><code class="language-" language=><span class="md-editor-code-block">{
&quot;captchakey&quot;: &quot;PUZZLE_Abc1dEFghIJKLM2no34P56q7rStu8v&quot;,
&quot;challengekey&quot;: &quot;y1Pu234nCwq56WnqB7y8TSZq0Qzp0ltK&quot;,
&quot;answer&quot;: &quot;0xax8ex0xax84x0xkx7qx0xux7qx0xux7gx0x18x7gx0x1sx76x0x26x6ix0x2qx6ix0x3ex68x0&quot;
}</span><span rn-wrapper aria-hidden="true"><span></span><span></span><span></span><span></span><span></span></span></code></pre>

        </details>
      <p data-line="1321">If captcha is not solved yet server will return <em>CAPCHA_NOT_READY</em> result. Repeat your request in 5 seconds.</p>
<p data-line="1323">If something went wrong server will return an <a href="#error_handling">error code</a>.</p>
</li>
<li data-line="1325">
<p data-line="1325">Use the values returned in your request to the target website passing them in the corresponding request fields:</p>
<ul data-line="1327">
<li data-line="1327"><code>capy_captchakey</code></li>
<li data-line="1328"><code>capy_challengekey</code></li>
<li data-line="1329"><code>capy_answer</code></li>
</ul>
</li>
</ol>
<p data-line="1331"><strong>List of GET/POST request parameters for <a href="https://2captcha.com/in.php">https://2captcha.com/in.php</a></strong></p>
<table data-line="1333">
<thead data-line="1333">
<tr data-line="1333">
<th><strong>Parameter</strong></th>
<th><strong>Type</strong></th>
<th><strong>Required</strong></th>
<th><strong>Description</strong></th>
</tr>
</thead>
<tbody data-line="1335">
<tr data-line="1335">
<td>key</td>
<td>String</td>
<td>Yes</td>
<td><a href="#solving_captchas">your API key</a></td>
</tr>
<tr data-line="1336">
<td>method</td>
<td>String</td>
<td>Yes</td>
<td>capy - defines that you're sending Capy</td>
</tr>
<tr data-line="1337">
<td>captchakey</td>
<td>String</td>
<td>Yes</td>
<td>Value of <em>captchakey</em> parameter you found on page</td>
</tr>
<tr data-line="1338">
<td>api_server</td>
<td>String</td>
<td>No</td>
<td>The domain part of script URL you found on page. Default value: <code>https://jp.api.capy.me/</code></td>
</tr>
<tr data-line="1339">
<td>version</td>
<td>String <br>Default: <code>puzzle</code></td>
<td>No</td>
<td>The version of captcha task: <code>puzzle</code> (assemble a puzzle) or <code>avatar</code> (drag an object).</td>
</tr>
<tr data-line="1340">
<td>pageurl</td>
<td>String</td>
<td>Yes</td>
<td>Full URL of the page where you see the captcha</td>
</tr>
<tr data-line="1341">
<td>header_acao</td>
<td>Integer <br>Default: 0</td>
<td>No</td>
<td>0 - disabled <br>1 - enabled. <br>If enabled <code>in.php</code> will include <em>Access-Control-Allow-Origin:*</em> header in the response. <br>Used for cross-domain AJAX requests in web applications. Also supported by <code>res.php</code>.</td>
</tr>
<tr data-line="1342">
<td>pingback</td>
<td>String</td>
<td>No</td>
<td>URL for pingback (callback) response that will be sent when captcha is solved. <br>URL should be registered on the server. <a href="#pingback">More info here</a>.</td>
</tr>
<tr data-line="1343">
<td>json</td>
<td>Integer <br>Default: 0</td>
<td>No</td>
<td>0 - server will send the response as plain text <br>1 - tells the server to send the response as JSON</td>
</tr>
<tr data-line="1344">
<td>soft_id</td>
<td>Integer</td>
<td>No</td>
<td>ID of software developer. Developers who integrated their software with 2Captcha get reward: 10% of spendings of their software users.</td>
</tr>
<tr data-line="1345">
<td>proxy</td>
<td>String</td>
<td>No</td>
<td>Format: <em>login:password@123.123.123.123:3128</em> <br>You can find more info about proxies <a href="#proxies">here</a>.</td>
</tr>
<tr data-line="1346">
<td>proxytype</td>
<td>String</td>
<td>No</td>
<td>Type of your proxy: HTTP, HTTPS, SOCKS4, SOCKS5.</td>
</tr>
</tbody>
</table>
<p data-line="1348"><strong>List of <em>GET</em> request parameters for <a href="https://2captcha.com/res.php">https://2captcha.com/res.php</a></strong></p>
<table data-line="1350">
<thead data-line="1350">
<tr data-line="1350">
<th><strong>GET parameter</strong></th>
<th><strong>Type</strong></th>
<th><strong>Required</strong></th>
<th><strong>Description</strong></th>
</tr>
</thead>
<tbody data-line="1352">
<tr data-line="1352">
<td>key</td>
<td>String</td>
<td>Yes</td>
<td><a href="#solving_captchas">your API key</a></td>
</tr>
<tr data-line="1353">
<td>action</td>
<td>String</td>
<td>Yes</td>
<td>get - get the asnwer for your captcha</td>
</tr>
<tr data-line="1354">
<td>id</td>
<td>Integer</td>
<td>Yes</td>
<td>ID of captcha returned by in.php.</td>
</tr>
<tr data-line="1355">
<td>json</td>
<td>Integer <br>Default: 0</td>
<td>No</td>
<td>0 - server will send the response as plain text <br>1 - tells the server to send the response as JSON</td>
</tr>
</tbody>
</table>
<p data-line="1357"><strong>Request URL example:</strong></p>

        <details  data-line="1359" class="md-editor-code" open="">
          <summary class="md-editor-code-head">
            <div class="md-editor-code-flag"><span></span><span></span><span></span></div>
            <div class="md-editor-code-action">
              <span class="md-editor-code-lang"></span>
              <span class="md-editor-copy-button" data-tips="Copy">Copy</span>
              
              <span class="md-editor-collapse-tips"><svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="lucide lucide-circle-chevron-left md-editor-icon"><circle cx="12" cy="12" r="10"/><path d="m14 16-4-4 4-4"/></svg></span>
            </div>
          </summary>
          <pre><code class="language-" language=><span class="md-editor-code-block">https://2captcha.com/res.php?key=1abc234de56fab7c89012d34e56fa7b8&amp;action=get&amp;id=2122988149</span><span rn-wrapper aria-hidden="true"><span></span></span></code></pre>

        </details>
      </section>
<section id="solving_tiktok">
<h4 id="tiktok" tabindex="-1" data-line="1364"><a class="header-anchor" href="#tiktok">TikTok</a></h4>
<p data-line="1366">This method is temporary disabled.</p>
</section>
<section id="lemin">
<h4 id="lemin-cropped-captcha" tabindex="-1" data-line="1371"><a class="header-anchor" href="#lemin-cropped-captcha">Lemin Cropped Captcha</a></h4>
<blockquote data-line="1373">
<p data-line="1373">Lemin is a Puzzle captcha</p>
</blockquote>
<p data-line="1375">To solve Lemin:</p>
<ol data-line="1377">
<li data-line="1377">
<p data-line="1377">Find the value of <em>captcha_id</em> parameter in the source code of the page or in the script source link that looks like: <code>https://api.leminnow.com/captcha/v1/cropped/**CROPPED\_1abcd2f\_a1234b567c890d12ef3a456bc78d901d**/js.</code></p>
<p data-line="1379">Also find the root part of the script URL, for example: <code>_https://api.leminnow.com/_</code> and use it in <code>api_server</code> parameter.</p>
<p data-line="1381">And finally find the id of parent div element of the captcha script tag and use the id as value for <code>div_id</code> parameter.</p>
</li>
<li data-line="1383">
<p data-line="1383">Submit a <em>HTTP GET</em> or <em>POST</em> request to our API URL: <code>https://2captcha.com/in.php</code> with method set to <em>lemin</em> and provide the values found on previous step as <em>captcha_id</em>, <em>div_id</em> and <em>api_server</em> and the full page URL as value for <em>pageurl</em>.<br>
You can find the full list of parameters in the <a href="#lemin_post">table below.</a></p>
<p data-line="1386"><strong>Request example:</strong></p>

        <details  data-line="1388" class="md-editor-code" open="">
          <summary class="md-editor-code-head">
            <div class="md-editor-code-flag"><span></span><span></span><span></span></div>
            <div class="md-editor-code-action">
              <span class="md-editor-code-lang"></span>
              <span class="md-editor-copy-button" data-tips="Copy">Copy</span>
              
              <span class="md-editor-collapse-tips"><svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="lucide lucide-circle-chevron-left md-editor-icon"><circle cx="12" cy="12" r="10"/><path d="m14 16-4-4 4-4"/></svg></span>
            </div>
          </summary>
          <pre><code class="language-" language=><span class="md-editor-code-block">{
&quot;key&quot;: &quot;1abc234de56fab7c89012d34e56fa7b8&quot;,
&quot;method&quot;: &quot;lemin&quot;,
&quot;captcha_id&quot;: &quot;CROPPED_3dfdd5c_d1872b526b794d83ba3b365eb15a200b&quot;,
&quot;div_id&quot;: &quot;lemin-cropped-captcha&quot;,
&quot;api_server&quot;: &quot;https://api.leminnow.com/&quot;,
&quot;pageurl&quot;: &quot;https://2captcha.com/demo/lemin&quot;,
&quot;json&quot;:1
}</span><span rn-wrapper aria-hidden="true"><span></span><span></span><span></span><span></span><span></span><span></span><span></span><span></span><span></span></span></code></pre>

        </details>
      </li>
<li data-line="1399">
<p data-line="1399">If everything is fine server will return the ID of your captcha</p>

        <details  data-line="1401" class="md-editor-code" open="">
          <summary class="md-editor-code-head">
            <div class="md-editor-code-flag"><span></span><span></span><span></span></div>
            <div class="md-editor-code-action">
              <span class="md-editor-code-lang"></span>
              <span class="md-editor-copy-button" data-tips="Copy">Copy</span>
              
              <span class="md-editor-collapse-tips"><svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="lucide lucide-circle-chevron-left md-editor-icon"><circle cx="12" cy="12" r="10"/><path d="m14 16-4-4 4-4"/></svg></span>
            </div>
          </summary>
          <pre><code class="language-" language=><span class="md-editor-code-block">{
&quot;status&quot;: 1,
&quot;request&quot;: &quot;2122988149&quot;
}</span><span rn-wrapper aria-hidden="true"><span></span><span></span><span></span><span></span></span></code></pre>

        </details>
      <p data-line="1406">Otherwise server will return an <a href="#error_handling">error code</a>.</p>
</li>
<li data-line="1408">
<p data-line="1408">Make a 15-20 seconds timeout then submit a <em>HTTP GET</em> request to our API URL: <code>https://2captcha.com/res.php</code> to get the result.<br>
The full list of parameters is in the <a href="#lemin_get">table below</a>.</p>
<p data-line="1411">If captcha is already solved server will respond in JSON and return the answer containing the following values: <code>answer</code>, <code>challenge_id</code></p>

        <details  data-line="1413" class="md-editor-code" open="">
          <summary class="md-editor-code-head">
            <div class="md-editor-code-flag"><span></span><span></span><span></span></div>
            <div class="md-editor-code-action">
              <span class="md-editor-code-lang"></span>
              <span class="md-editor-copy-button" data-tips="Copy">Copy</span>
              
              <span class="md-editor-collapse-tips"><svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="lucide lucide-circle-chevron-left md-editor-icon"><circle cx="12" cy="12" r="10"/><path d="m14 16-4-4 4-4"/></svg></span>
            </div>
          </summary>
          <pre><code class="language-" language=><span class="md-editor-code-block">{
&quot;answer&quot;:&quot;0x0xcgx0x0xbsx0xaxb8x0xkxakx0xux92x0x1sx76x0x2gx5ux0x34x4mx0x3ox3ex0x42x34x0x4cx2qx0x4mx2gx0x50x26x0x5ax26x0x5ax1sx0x50x1sx0x50x1ix0x50x18x0x50xux0x5axux0x5axkx0x5axax0x5ax0x_?_gAAAAABi4-Efd-oTDcTyTsnv7vbHGJW_ucw7GmoYCUxjfbvfMChlne2EIKYrVNV_TfBDN68WX_TDAEQ90xbWjatuYGkaUHsC1lzf7pM7dS8J-WhKQK1rBYaSOgAzGuNVhYX_zrNWHFFr&quot;,
&quot;challenge_id&quot;:&quot;a33515c5-9095-4c2a-b2eb-c86214d62f98&quot;
}</span><span rn-wrapper aria-hidden="true"><span></span><span></span><span></span><span></span></span></code></pre>

        </details>
      <p data-line="1418">If captcha is not solved yet server will return <em>CAPCHA_NOT_READY</em> result. Repeat your request in 5 seconds.</p>
<p data-line="1420">If something went wrong server will return an <a href="#error_handling">error code</a>.</p>
</li>
<li data-line="1422">
<p data-line="1422">Use the values returned in your request to the target website passing them in the corresponding request fields:</p>
<ul data-line="1424">
<li data-line="1424"><code>answer</code></li>
<li data-line="1425"><code>challenge_id</code></li>
</ul>
</li>
</ol>
<p data-line="1427"><strong>List of GET/POST request parameters for <a href="https://2captcha.com/in.php">https://2captcha.com/in.php</a></strong></p>
<table data-line="1430">
<thead data-line="1430">
<tr data-line="1430">
<th><strong>Parameter</strong></th>
<th><strong>Type</strong></th>
<th><strong>Required</strong></th>
<th><strong>Description</strong></th>
</tr>
</thead>
<tbody data-line="1432">
<tr data-line="1432">
<td>key</td>
<td>String</td>
<td>Yes</td>
<td><a href="#solving_captchas">your API key</a></td>
</tr>
<tr data-line="1433">
<td>method</td>
<td>String</td>
<td>Yes</td>
<td>lemin - defines that you're sending Lemin</td>
</tr>
<tr data-line="1434">
<td>captcha_id</td>
<td>String</td>
<td>Yes</td>
<td>Value of <em>captcha_id</em> parameter you found on page</td>
</tr>
<tr data-line="1435">
<td>div_id</td>
<td>String</td>
<td>No</td>
<td>The id of captcha parent div element</td>
</tr>
<tr data-line="1436">
<td>api_server</td>
<td>String</td>
<td>No</td>
<td>The domain part of script URL you found on page. Default value: <code>https://api.leminnow.com/</code></td>
</tr>
<tr data-line="1437">
<td>pageurl</td>
<td>String</td>
<td>Yes</td>
<td>Full URL of the page where you see the captcha</td>
</tr>
<tr data-line="1438">
<td>header_acao</td>
<td>Integer <br>Default: 0</td>
<td>No</td>
<td>0 - disabled <br>1 - enabled. <br>If enabled <code>in.php</code> will include <em>Access-Control-Allow-Origin:*</em> header in the response. <br>Used for cross-domain AJAX requests in web applications. Also supported by <code>res.php</code>.</td>
</tr>
<tr data-line="1439">
<td>pingback</td>
<td>String</td>
<td>No</td>
<td>URL for pingback (callback) response that will be sent when captcha is solved. <br>URL should be registered on the server. <a href="#pingback">More info here</a>.</td>
</tr>
<tr data-line="1440">
<td>json</td>
<td>Integer <br>Default: 0</td>
<td>No</td>
<td>0 - server will send the response as plain text <br>1 - tells the server to send the response as JSON</td>
</tr>
<tr data-line="1441">
<td>soft_id</td>
<td>Integer</td>
<td>No</td>
<td>ID of software developer. Developers who integrated their software with 2Captcha get reward: 10% of spendings of their software users.</td>
</tr>
<tr data-line="1442">
<td>proxy</td>
<td>String</td>
<td>No</td>
<td>Format: <em>login:password@123.123.123.123:3128</em> <br>You can find more info about proxies <a href="#proxies">here</a>.</td>
</tr>
<tr data-line="1443">
<td>proxytype</td>
<td>String</td>
<td>No</td>
<td>Type of your proxy: HTTP, HTTPS, SOCKS4, SOCKS5.</td>
</tr>
</tbody>
</table>
<p data-line="1445"><strong>List of <em>GET</em> request parameters for <a href="https://2captcha.com/res.php">https://2captcha.com/res.php</a></strong></p>
<table data-line="1447">
<thead data-line="1447">
<tr data-line="1447">
<th><strong>GET parameter</strong></th>
<th><strong>Type</strong></th>
<th><strong>Required</strong></th>
<th><strong>Description</strong></th>
</tr>
</thead>
<tbody data-line="1449">
<tr data-line="1449">
<td>key</td>
<td>String</td>
<td>Yes</td>
<td><a href="#solving_captchas">your API key</a></td>
</tr>
<tr data-line="1450">
<td>action</td>
<td>String</td>
<td>Yes</td>
<td>get - get the asnwer for your captcha</td>
</tr>
<tr data-line="1451">
<td>id</td>
<td>Integer</td>
<td>Yes</td>
<td>ID of captcha returned by in.php.</td>
</tr>
<tr data-line="1452">
<td>json</td>
<td>Integer <br>Default: 0</td>
<td>No</td>
<td>0 - server will send the response as plain text <br>1 - tells the server to send the response as JSON</td>
</tr>
</tbody>
</table>
<p data-line="1454"><strong>Request URL example:</strong></p>

        <details  data-line="1456" class="md-editor-code" open="">
          <summary class="md-editor-code-head">
            <div class="md-editor-code-flag"><span></span><span></span><span></span></div>
            <div class="md-editor-code-action">
              <span class="md-editor-code-lang"></span>
              <span class="md-editor-copy-button" data-tips="Copy">Copy</span>
              
              <span class="md-editor-collapse-tips"><svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="lucide lucide-circle-chevron-left md-editor-icon"><circle cx="12" cy="12" r="10"/><path d="m14 16-4-4 4-4"/></svg></span>
            </div>
          </summary>
          <pre><code class="language-" language=><span class="md-editor-code-block">https://2captcha.com/res.php?key=1abc234de56fab7c89012d34e56fa7b8&amp;action=get&amp;id=2122988149</span><span rn-wrapper aria-hidden="true"><span></span></span></code></pre>

        </details>
      </section>
<section id="turnstile">
<h4 id="cloudflare-turnstile" tabindex="-1" data-line="1461"><a class="header-anchor" href="#cloudflare-turnstile">Cloudflare Turnstile</a></h4>
<blockquote data-line="1463">
<p data-line="1463">Cloudflare Turnstile - is a captha made by Cloudflare</p>
</blockquote>
<p data-line="1465">There are two cases for Turnstile:</p>
<p data-line="1467">1 - standalone captcha widget placed on a page of a website, protecting a form from automated submission. For this case just need to extract the <em>sitekey</em> and send it to our API with full page URL. Then just place the token into <code>cf-turnstile-response</code> and <code>g-recaptcha-response</code> fields and submit the form. Also, there can be a callback defined in <code>turnstile.render</code> call.</p>
<p data-line="1469">2 - captcha on Turnstile Challenge page on websites proxied proxied through Cloudflare. In this case you MUST extract the values of <code>cData</code>, <code>chlPageData</code> and <code>action</code> parameters and use the User-Agent value returned from our API. See more info on this case below.</p>
<h5 data-line="1471" id="">Standalone Turnstile captcha</h5>
<p data-line="1473"><strong>Request example:</strong></p>

        <details  data-line="1475" class="md-editor-code" open="">
          <summary class="md-editor-code-head">
            <div class="md-editor-code-flag"><span></span><span></span><span></span></div>
            <div class="md-editor-code-action">
              <span class="md-editor-code-lang"></span>
              <span class="md-editor-copy-button" data-tips="Copy">Copy</span>
              
              <span class="md-editor-collapse-tips"><svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="lucide lucide-circle-chevron-left md-editor-icon"><circle cx="12" cy="12" r="10"/><path d="m14 16-4-4 4-4"/></svg></span>
            </div>
          </summary>
          <pre><code class="language-" language=><span class="md-editor-code-block">{
&quot;method&quot;: &quot;turnstile&quot;,
&quot;key&quot;: &quot;YOUR_API_KEY&quot;,
&quot;sitekey&quot;: &quot;3x00000000000000000000FF&quot;,
&quot;pageurl&quot;: &quot;https://2captcha.com/demo/cloudflare-turnstile&quot;,
&quot;json&quot;: 1
}</span><span rn-wrapper aria-hidden="true"><span></span><span></span><span></span><span></span><span></span><span></span><span></span></span></code></pre>

        </details>
      <p data-line="1483"><strong>Response example:</strong></p>

        <details  data-line="1485" class="md-editor-code" open="">
          <summary class="md-editor-code-head">
            <div class="md-editor-code-flag"><span></span><span></span><span></span></div>
            <div class="md-editor-code-action">
              <span class="md-editor-code-lang"></span>
              <span class="md-editor-copy-button" data-tips="Copy">Copy</span>
              
              <span class="md-editor-collapse-tips"><svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="lucide lucide-circle-chevron-left md-editor-icon"><circle cx="12" cy="12" r="10"/><path d="m14 16-4-4 4-4"/></svg></span>
            </div>
          </summary>
          <pre><code class="language-" language=><span class="md-editor-code-block">{
&quot;status&quot;: 1,
&quot;request&quot;: &quot;74327409378&quot;
}</span><span rn-wrapper aria-hidden="true"><span></span><span></span><span></span><span></span></span></code></pre>

        </details>
      <p data-line="1490">Use the returned ID to request the result from <code>res.php</code> endpoint of our API</p>
<h5 data-line="1492" id="">Turnstile captcha on Cloudflare Challenge pages</h5>
<img src="/assets/captcha-api-docs/img/turnstile-challege-page.png" width="1384" height="1264" alt="Turnstile Challege Page" loading="lazy" />
<p data-line="1496">If you need to bypass the Turnstile on Cloudflare Challenge pages you also MUST provide the following additional parameters:</p>
<ul data-line="1498">
<li data-line="1498">action</li>
<li data-line="1499">data</li>
<li data-line="1500">pagedata</li>
</ul>
<p data-line="1502">And also you MUST set the User-Agent of your browser or HTTP client to the value returned from our API together with the token.</p>
<p data-line="1504">For cases when Turnstile is used standalone on a website, it is not required.</p>
<h6 data-line="1506" id="">How to extract the required parameters</h6>
<p data-line="1508">To extract the parameters you can redefine the <code>turnstile.rended</code> method to intercept the parameters passed when the method is called. For example, you can inject the following JavaScript code to the page. The code should be executed before the Turnstile widget is loaded.</p>

        <details  data-line="1510" class="md-editor-code" open="">
          <summary class="md-editor-code-head">
            <div class="md-editor-code-flag"><span></span><span></span><span></span></div>
            <div class="md-editor-code-action">
              <span class="md-editor-code-lang"></span>
              <span class="md-editor-copy-button" data-tips="Copy">Copy</span>
              
              <span class="md-editor-collapse-tips"><svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="lucide lucide-circle-chevron-left md-editor-icon"><circle cx="12" cy="12" r="10"/><path d="m14 16-4-4 4-4"/></svg></span>
            </div>
          </summary>
          <pre><code class="language-" language=><span class="md-editor-code-block">const i = setInterval(()=&gt;{
if (window.turnstile) {
clearInterval(i)
window.turnstile.render = (a,b) =&gt; {
let p = {
method: &quot;turnstile&quot;,
key: &quot;YOUR_API_KEY&quot;,
sitekey: b.sitekey,
pageurl: window.location.href,
data: b.cData,
pagedata: b.chlPageData,
action: b.action,
userAgent: navigator.userAgent,
json: 1
}
console.log(JSON.stringify(p))
window.tsCallback = b.callback
return 'foo'
}
}
},50)</span><span rn-wrapper aria-hidden="true"><span></span><span></span><span></span><span></span><span></span><span></span><span></span><span></span><span></span><span></span><span></span><span></span><span></span><span></span><span></span><span></span><span></span><span></span><span></span><span></span><span></span></span></code></pre>

        </details>
      <p data-line="1532"><strong>Request example:</strong></p>

        <details  data-line="1534" class="md-editor-code" open="">
          <summary class="md-editor-code-head">
            <div class="md-editor-code-flag"><span></span><span></span><span></span></div>
            <div class="md-editor-code-action">
              <span class="md-editor-code-lang"></span>
              <span class="md-editor-copy-button" data-tips="Copy">Copy</span>
              
              <span class="md-editor-collapse-tips"><svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="lucide lucide-circle-chevron-left md-editor-icon"><circle cx="12" cy="12" r="10"/><path d="m14 16-4-4 4-4"/></svg></span>
            </div>
          </summary>
          <pre><code class="language-" language=><span class="md-editor-code-block">{
&quot;key&quot;: &quot;YOUR_API_KEY&quot;,
&quot;method&quot;: &quot;turnstile&quot;,
&quot;sitekey&quot;: &quot;0x0AAAAAAADnPIDROzbs0Aaj&quot;,
&quot;data&quot;: &quot;7fab0000b0e0ff00&quot;,
&quot;pagedata&quot;: &quot;3gAFo2...0ME1UVT0=&quot;,
&quot;pageurl&quot;: &quot;https://2captcha.com/&quot;,
&quot;action&quot;: &quot;managed&quot;,
&quot;json&quot;: 1
}</span><span rn-wrapper aria-hidden="true"><span></span><span></span><span></span><span></span><span></span><span></span><span></span><span></span><span></span><span></span></span></code></pre>

        </details>
      <p data-line="1545"><strong>Response example:</strong></p>

        <details  data-line="1547" class="md-editor-code" open="">
          <summary class="md-editor-code-head">
            <div class="md-editor-code-flag"><span></span><span></span><span></span></div>
            <div class="md-editor-code-action">
              <span class="md-editor-code-lang"></span>
              <span class="md-editor-copy-button" data-tips="Copy">Copy</span>
              
              <span class="md-editor-collapse-tips"><svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="lucide lucide-circle-chevron-left md-editor-icon"><circle cx="12" cy="12" r="10"/><path d="m14 16-4-4 4-4"/></svg></span>
            </div>
          </summary>
          <pre><code class="language-" language=><span class="md-editor-code-block">{
&quot;status&quot;: 1,
&quot;request&quot;: &quot;74327409378&quot;
}</span><span rn-wrapper aria-hidden="true"><span></span><span></span><span></span><span></span></span></code></pre>

        </details>
      <p data-line="1552">Use the returned id to request the result from <code>res.php</code> endpoint of our API</p>
<p data-line="1554">`</p>
<p data-line="1556"><a href="https://2captcha.com/res.php?key=1abc234de56fab7c89012d34e56fa7b8&amp;action=get&amp;id=74327409378&amp;json=1">https://2captcha.com/res.php?key=1abc234de56fab7c89012d34e56fa7b8&amp;action=get&amp;id=74327409378&amp;json=1</a></p>
<p data-line="1558">`</p>
<p data-line="1560"><strong>Result example:</strong></p>

        <details  data-line="1562" class="md-editor-code" open="">
          <summary class="md-editor-code-head">
            <div class="md-editor-code-flag"><span></span><span></span><span></span></div>
            <div class="md-editor-code-action">
              <span class="md-editor-code-lang"></span>
              <span class="md-editor-copy-button" data-tips="Copy">Copy</span>
              
              <span class="md-editor-collapse-tips"><svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="lucide lucide-circle-chevron-left md-editor-icon"><circle cx="12" cy="12" r="10"/><path d="m14 16-4-4 4-4"/></svg></span>
            </div>
          </summary>
          <pre><code class="language-" language=><span class="md-editor-code-block">{
&quot;status&quot;: 1,
&quot;request&quot;: &quot;0.4uMMZZdSfsVM8...610cd090&quot;,
&quot;useragent&quot;: &quot;Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/115.0.0.0 Safari/537.36&quot;
}</span><span rn-wrapper aria-hidden="true"><span></span><span></span><span></span><span></span><span></span></span></code></pre>

        </details>
      <p data-line="1568"><strong>List of GET/POST request parameters for <a href="https://2captcha.com/in.php">https://2captcha.com/in.php</a></strong></p>
<table data-line="1570">
<thead data-line="1570">
<tr data-line="1570">
<th><strong>Parameter</strong></th>
<th><strong>Type</strong></th>
<th><strong>Required</strong></th>
<th><strong>Description</strong></th>
</tr>
</thead>
<tbody data-line="1572">
<tr data-line="1572">
<td><strong>key</strong></td>
<td>String</td>
<td>Yes</td>
<td><a href="#solving_captchas">your API key</a></td>
</tr>
<tr data-line="1573">
<td><strong>method</strong></td>
<td>String</td>
<td>Yes</td>
<td>turnstile - defines that you're sending Cloudflare Turnstile</td>
</tr>
<tr data-line="1574">
<td><strong>sitekey</strong></td>
<td>String</td>
<td>Yes</td>
<td>Value of <em>sitekey</em> parameter you found on page</td>
</tr>
<tr data-line="1575">
<td><strong>pageurl</strong></td>
<td>String</td>
<td>Yes</td>
<td>Full URL of the page where you see the captcha</td>
</tr>
<tr data-line="1576">
<td><strong><em>action</em></strong></td>
<td>String</td>
<td>No*</td>
<td>Value of optional <em>action</em> parameter you found on page, can be defined in <code>data-action</code> attribute or passed to <code>turnstile.render</code> call</td>
</tr>
<tr data-line="1577">
<td><strong><em>data</em></strong></td>
<td>String</td>
<td>No*</td>
<td>The value of <code>cData</code> passed to <code>turnstile.render</code> call. Also can be defined in <code>data-cdata</code> attribute</td>
</tr>
<tr data-line="1578">
<td><strong><em>pagedata</em></strong></td>
<td>String</td>
<td>No*</td>
<td>The value of <code>chlPageData</code> passed to <code>turnstile.render</code> call</td>
</tr>
<tr data-line="1579">
<td>header_acao</td>
<td>Integer <br>Default: 0</td>
<td>No</td>
<td>0 - disabled <br>1 - enabled. <br>If enabled <code>in.php</code> will include <em>Access-Control-Allow-Origin:*</em> header in the response. <br>Used for cross-domain AJAX requests in web applications. Also supported by <code>res.php</code>.</td>
</tr>
<tr data-line="1580">
<td>pingback</td>
<td>String</td>
<td>No</td>
<td>URL for pingback (callback) response that will be sent when captcha is solved. <br>URL should be registered on the server. <a href="#pingback">More info here</a>.</td>
</tr>
<tr data-line="1581">
<td>json</td>
<td>Integer <br>Default: 0</td>
<td>No</td>
<td>0 - server will send the response as plain text <br>1 - tells the server to send the response as JSON</td>
</tr>
<tr data-line="1582">
<td>soft_id</td>
<td>Integer</td>
<td>No</td>
<td>ID of software developer. Developers who integrated their software with 2Captcha get reward: 10% of spendings of their software users.</td>
</tr>
<tr data-line="1583">
<td>proxy</td>
<td>String</td>
<td>No</td>
<td>Format: <em>login:password@123.123.123.123:3128</em> <br>You can find more info about proxies <a href="#proxies">here</a>.</td>
</tr>
<tr data-line="1584">
<td>proxytype</td>
<td>String</td>
<td>No</td>
<td>Type of your proxy: HTTP, HTTPS, SOCKS4, SOCKS5.</td>
</tr>
</tbody>
</table>
<p data-line="1586">* - parameters required to bypass Turnstile on Cloudflare Challenge pages</p>
<p data-line="1588"><strong>List of <em>GET</em> request parameters for <a href="https://2captcha.com/res.php">https://2captcha.com/res.php</a></strong></p>
<table data-line="1590">
<thead data-line="1590">
<tr data-line="1590">
<th><strong>GET parameter</strong></th>
<th><strong>Type</strong></th>
<th><strong>Required</strong></th>
<th><strong>Description</strong></th>
</tr>
</thead>
<tbody data-line="1592">
<tr data-line="1592">
<td>key</td>
<td>String</td>
<td>Yes</td>
<td><a href="#solving_captchas">your API key</a></td>
</tr>
<tr data-line="1593">
<td>action</td>
<td>String</td>
<td>Yes</td>
<td>get - get the asnwer for your captcha</td>
</tr>
<tr data-line="1594">
<td>id</td>
<td>Integer</td>
<td>Yes</td>
<td>ID of captcha returned by in.php.</td>
</tr>
<tr data-line="1595">
<td>json</td>
<td>Integer <br>Default: 0</td>
<td>Yes</td>
<td>Always set to 1 for turnstile to get the response as JSON containing the User-Agent value</td>
</tr>
</tbody>
</table>
</section>
<section id="amazon-waf">
<h4 id="amazon-waf-captcha" tabindex="-1" data-line="1600"><a class="header-anchor" href="#amazon-waf-captcha">Amazon WAF Captcha</a></h4>
<blockquote data-line="1602">
<p data-line="1602">Amazon WAF Captcha also known as AWS WAF Captcha is a part of Intelligent threat mitigation for Amazon AWS</p>
</blockquote>
<p data-line="1604">We support two methods for solving this type of captcha: with <code>challenge_script</code> and with <code>jsapiScript</code></p>
<p data-line="1606"><strong>challenge_script option:</strong><br>
To bypass the captcha you need to grab the following parameters:</p>
<ul data-line="1609">
<li data-line="1609"><code>sitekey</code> - is a value of <code>key</code> parameter in the page source</li>
<li data-line="1610"><code>iv</code> - is a value of <code>iv</code> parameter in the page source</li>
<li data-line="1611"><code>context</code> - is a value of <code>context</code> parameter in the page source</li>
<li data-line="1612"><code>challenge_script</code> - the URL of <code>challenge.js</code> script</li>
<li data-line="1613"><code>captcha_script</code>- the URL of <code>captcha.js</code>script</li>
<li data-line="1614"><code>pageurl</code> - is the full URL of page where you were challenged by the captcha</li>
</ul>
<p data-line="1616"><strong>List of GET/POST request parameters for <a href="https://2captcha.com/in.php">https://2captcha.com/in.php</a></strong></p>
<table data-line="1618">
<thead data-line="1618">
<tr data-line="1618">
<th><strong>Parameter</strong></th>
<th><strong>Type</strong></th>
<th><strong>Required</strong></th>
<th><strong>Description</strong></th>
</tr>
</thead>
<tbody data-line="1620">
<tr data-line="1620">
<td>key</td>
<td>String</td>
<td>Yes</td>
<td><a href="#solving_captchas">your API key</a></td>
</tr>
<tr data-line="1621">
<td>method</td>
<td>String</td>
<td>Yes</td>
<td><code>amazon_waf</code> - defines that you're sending Amazon WAF Captcha</td>
</tr>
<tr data-line="1622">
<td>sitekey</td>
<td>String</td>
<td>Yes</td>
<td>Value of <code>key</code> parameter you found on the page</td>
</tr>
<tr data-line="1623">
<td>iv</td>
<td>String</td>
<td>Yes</td>
<td>Value of <code>iv</code> parameter you found on the page</td>
</tr>
<tr data-line="1624">
<td>context</td>
<td>String</td>
<td>Yes</td>
<td>Value of optional <code>context</code> parameter you found on page</td>
</tr>
<tr data-line="1625">
<td>pageurl</td>
<td>String</td>
<td>Yes</td>
<td>Full URL of the page where you see the captcha</td>
</tr>
<tr data-line="1626">
<td>challenge_script</td>
<td>String</td>
<td>No</td>
<td>The source URL of <code>challenge.js</code> script on the page</td>
</tr>
<tr data-line="1627">
<td>captcha_script</td>
<td>String</td>
<td>No</td>
<td>The source URL of <code>captcha.js</code> script on the page</td>
</tr>
<tr data-line="1628">
<td>header_acao</td>
<td>Integer <br>Default: 0</td>
<td>No</td>
<td>0 - disabled <br>1 - enabled. <br>If enabled <code>in.php</code> will include <em>Access-Control-Allow-Origin:*</em> header in the response. <br>Used for cross-domain AJAX requests in web applications. Also supported by <code>res.php</code>.</td>
</tr>
<tr data-line="1629">
<td>pingback</td>
<td>String</td>
<td>No</td>
<td>URL for pingback (callback) response that will be sent when captcha is solved. <br>URL should be registered on the server. <a href="#pingback">More info here</a>.</td>
</tr>
<tr data-line="1630">
<td>json</td>
<td>Integer <br>Default: 0</td>
<td>No</td>
<td>0 - server will send the response as plain text <br>1 - tells the server to send the response as JSON</td>
</tr>
<tr data-line="1631">
<td>soft_id</td>
<td>Integer</td>
<td>No</td>
<td>ID of software developer. Developers who integrated their software with 2Captcha get reward: 10% of spendings of their software users.</td>
</tr>
<tr data-line="1632">
<td>proxy</td>
<td>String</td>
<td>No</td>
<td>Format: <em>login:password@123.123.123.123:3128</em> <br>You can find more info about proxies <a href="#proxies">here</a>.</td>
</tr>
<tr data-line="1633">
<td>proxytype</td>
<td>String</td>
<td>No</td>
<td>Type of your proxy: HTTP, HTTPS, SOCKS4, SOCKS5.</td>
</tr>
</tbody>
</table>
<p data-line="1635"><strong>Request body example:</strong></p>

        <details  data-line="1637" class="md-editor-code" open="">
          <summary class="md-editor-code-head">
            <div class="md-editor-code-flag"><span></span><span></span><span></span></div>
            <div class="md-editor-code-action">
              <span class="md-editor-code-lang"></span>
              <span class="md-editor-copy-button" data-tips="Copy">Copy</span>
              
              <span class="md-editor-collapse-tips"><svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="lucide lucide-circle-chevron-left md-editor-icon"><circle cx="12" cy="12" r="10"/><path d="m14 16-4-4 4-4"/></svg></span>
            </div>
          </summary>
          <pre><code class="language-" language=><span class="md-editor-code-block">{
&quot;key&quot;:&quot;1abc234de56fab7c89012d34e56fa7b8&quot;,
&quot;method&quot;:&quot;amazon_waf&quot;,
&quot;sitekey&quot;:&quot;AQIDAHjcYu/GjX+QlghicBgQ/7bFaQZ+m5FKCMDnO+vTbNg96AHMDLodoefdvyOnsHMRtEKQAAAAfjB8BgkqhkiG9w0BBwagbzBtAgEAMGgGCSqGSIb3DQEHATAeBglghkgBZQMEAS4wEQQMUX+ZqwwuANRnZujSAgEQgDvHSxUQmVBuyUtumoW2n4ccTG7xQN1r3X/zz41qmQaYv9SSSvQrjIoDXKaUQ23tVb4ii8+uljuRdz/HPA==&quot;,
&quot;pageurl&quot;:&quot;https://non-existent-example.execute-api.us-east-1.amazonaws.com/latest&quot;,
&quot;context&quot;:&quot;9BUgmlm48F92WUoqv97a49ZuEJJ50TCk9MVr3C7WMtQ0X6flVbufM4n8mjFLmbLVAPgaQ1Jydeaja94iAS49ljb+sUNLoukWedAQZKrlY4RdbOOzvcFqmD/ZepQFS9N5w15Exr4VwnVq+HIxTsDJwRviElWCdzKDebN/mk8/eX2n7qJi5G3Riq0tdQw9+C4diFZU5E97RSeahejOAAJTDqduqW6uLw9NsjJBkDRBlRjxjn5CaMMo5pYOxYbGrM8Un1JH5DMOLeXbq1xWbC17YSEoM1cRFfTgOoc+VpCe36Ai9Kc=&quot;,
&quot;challenge_script&quot;:&quot;https://41bcdd4fb3cb.610cd090.us-east-1.token.awswaf.com/41bcdd4fb3cb/0d21de737ccb/cd77baa6c832/challenge.js&quot;,
&quot;captcha_script&quot;:&quot;https://41bcdd4fb3cb.610cd090.us-east-1.captcha.awswaf.com/41bcdd4fb3cb/0d21de737ccb/cd77baa6c832/captcha.js&quot;,
&quot;iv&quot;:&quot;CgAHbCe2GgAAAAAj&quot;,
&quot;json&quot;:1
}</span><span rn-wrapper aria-hidden="true"><span></span><span></span><span></span><span></span><span></span><span></span><span></span><span></span><span></span><span></span><span></span></span></code></pre>

        </details>
      <p data-line="1649"><strong>jsapiScript option:</strong><br>
To bypass the captcha you need to grab the following parameters:</p>
<ul data-line="1652">
<li data-line="1652"><code>sitekey</code> - is a value of <code>key</code> parameter in the page source</li>
<li data-line="1653"><code>jsapiScript</code> - the URL of <code>jsapiScript.js</code> script</li>
<li data-line="1654"><code>pageurl</code> - is the full URL of page where you were challenged by the captcha</li>
</ul>
<p data-line="1656"><strong>List of GET/POST request parameters for <a href="https://2captcha.com/in.php">https://2captcha.com/in.php</a></strong></p>
<table data-line="1658">
<thead data-line="1658">
<tr data-line="1658">
<th><strong>Parameter</strong></th>
<th><strong>Type</strong></th>
<th><strong>Required</strong></th>
<th><strong>Description</strong></th>
</tr>
</thead>
<tbody data-line="1660">
<tr data-line="1660">
<td>key</td>
<td>String</td>
<td>Yes</td>
<td><a href="#solving_captchas">your API key</a></td>
</tr>
<tr data-line="1661">
<td>method</td>
<td>String</td>
<td>Yes</td>
<td><code>amazon_waf</code> - defines that you're sending Amazon WAF Captcha</td>
</tr>
<tr data-line="1662">
<td>sitekey</td>
<td>String</td>
<td>Yes</td>
<td>Value of <code>key</code> parameter you found on the page</td>
</tr>
<tr data-line="1663">
<td>pageurl</td>
<td>String</td>
<td>Yes</td>
<td>Full URL of the page where you see the captcha</td>
</tr>
<tr data-line="1664">
<td>jsapiScript</td>
<td>String</td>
<td>Yes</td>
<td>The source URL of <code>jsapiScript.js</code> script on the page</td>
</tr>
<tr data-line="1665">
<td>header_acao</td>
<td>Integer <br>Default: 0</td>
<td>No</td>
<td>0 - disabled <br>1 - enabled. <br>If enabled <code>in.php</code> will include <em>Access-Control-Allow-Origin:*</em> header in the response. <br>Used for cross-domain AJAX requests in web applications. Also supported by <code>res.php</code>.</td>
</tr>
<tr data-line="1666">
<td>pingback</td>
<td>String</td>
<td>No</td>
<td>URL for pingback (callback) response that will be sent when captcha is solved. <br>URL should be registered on the server. <a href="#pingback">More info here</a>.</td>
</tr>
<tr data-line="1667">
<td>json</td>
<td>Integer <br>Default: 0</td>
<td>No</td>
<td>0 - server will send the response as plain text <br>1 - tells the server to send the response as JSON</td>
</tr>
<tr data-line="1668">
<td>soft_id</td>
<td>Integer</td>
<td>No</td>
<td>ID of software developer. Developers who integrated their software with 2Captcha get reward: 10% of spendings of their software users.</td>
</tr>
<tr data-line="1669">
<td>proxy</td>
<td>String</td>
<td>No</td>
<td>Format: <em>login:password@123.123.123.123:3128</em> <br>You can find more info about proxies <a href="#proxies">here</a>.</td>
</tr>
<tr data-line="1670">
<td>proxytype</td>
<td>String</td>
<td>No</td>
<td>Type of your proxy: HTTP, HTTPS, SOCKS4, SOCKS5.</td>
</tr>
</tbody>
</table>
<p data-line="1672"><strong>Request body example:</strong></p>

        <details  data-line="1674" class="md-editor-code" open="">
          <summary class="md-editor-code-head">
            <div class="md-editor-code-flag"><span></span><span></span><span></span></div>
            <div class="md-editor-code-action">
              <span class="md-editor-code-lang"></span>
              <span class="md-editor-copy-button" data-tips="Copy">Copy</span>
              
              <span class="md-editor-collapse-tips"><svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="lucide lucide-circle-chevron-left md-editor-icon"><circle cx="12" cy="12" r="10"/><path d="m14 16-4-4 4-4"/></svg></span>
            </div>
          </summary>
          <pre><code class="language-" language=><span class="md-editor-code-block">{
&quot;key&quot;:&quot;1abc234de56fab7c89012d34e56fa7b8&quot;,
&quot;method&quot;:&quot;amazon_waf&quot;,
&quot;sitekey&quot;:&quot;AQIDAHjcYu/GjX+QlghicBgQ/7bFaQZ+m5FKCMDnO+vTbNg96AHMDLodoefdvyOnsHMRtEKQAAAAfjB8BgkqhkiG9w0BBwagbzBtAgEAMGgGCSqGSIb3DQEHATAeBglghkgBZQMEAS4wEQQMUX+ZqwwuANRnZujSAgEQgDvHSxUQmVBuyUtumoW2n4ccTG7xQN1r3X/zz41qmQaYv9SSSvQrjIoDXKaUQ23tVb4ii8+uljuRdz/HPA==&quot;,
&quot;pageurl&quot;:&quot;https://non-existent-example.execute-api.us-east-1.amazonaws.com/latest&quot;,
&quot;jsapiScript&quot;:&quot;https://82d925f87a91.edge.captcha-sdk.awswaf.com/82d925f87a91/jsapi.js&quot;
&quot;json&quot;:1
}</span><span rn-wrapper aria-hidden="true"><span></span><span></span><span></span><span></span><span></span><span></span><span></span><span></span></span></code></pre>

        </details>
      <p data-line="1683">If everything is OK you will receive the response with your captcha ID <code>{&quot;status&quot;:1,&quot;request&quot;:&quot;2122988149&quot;}</code> or an <a href="#error_handling">error code</a> if your request was incorrect.</p>
<p data-line="1685">Make a 15-20 seconds timeout then submit a <em>HTTP GET</em> request to our API URL: <code>https://2captcha.com/res.php</code> to get the result.<br>
The full list of parameters is in the <a href="#amazon-waf-get">table below</a>.</p>
<p data-line="1688">If captcha is already solved server will respond in the following format:</p>

        <details  data-line="1690" class="md-editor-code" open="">
          <summary class="md-editor-code-head">
            <div class="md-editor-code-flag"><span></span><span></span><span></span></div>
            <div class="md-editor-code-action">
              <span class="md-editor-code-lang"></span>
              <span class="md-editor-copy-button" data-tips="Copy">Copy</span>
              
              <span class="md-editor-collapse-tips"><svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="lucide lucide-circle-chevron-left md-editor-icon"><circle cx="12" cy="12" r="10"/><path d="m14 16-4-4 4-4"/></svg></span>
            </div>
          </summary>
          <pre><code class="language-" language=><span class="md-editor-code-block">{
&quot;status&quot;: 1,
&quot;request&quot;: {
&quot;captcha_voucher&quot;:&quot;eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJ0aW1lc3RhbXAiOiIyMDIzLTAzLTIwVDEzOjM2OjM3Ljg1Nzk5MjEyMFoiLCJjbGllbnRfaWQiOiIxOTI4NTIzMi1jMTRiLTRlMDUtYjQ2OC02ODBiYjE3ZWNhM2MiLCJkb21haW4iOiJlZnc0N2ZwYWQ5LmV4ZWN1dGUtYXBpLnVzLWVhc3QtMS5hbWF6b25hd3MuY29tIiwiZXhwIjoxNjc5MzE5Mzk3LCJwcm9ibGVtIjoiYmlmdXJjYXRlZHpvbyIsInByb2JsZW1fb3ZlcnJpZGUiOmZhbHNlLCJudW1fc29sdXRpb25zX3Byb3ZpZGVkIjoxfQ.qgSX4tZqZQwXNzVQgVe3OsUMR3vf7-fLWNzZKIHXN-4&quot;,
&quot;existing_token&quot;:&quot;25b7ee41-2d4e-46f7-a52e-2d53d10c199a:EQoAf2Zd5kEWAAAA:qGp2oQxLMEny1L7qBP6uRYJ/DRDRL2v50309/M/O7Gul+k1zh6ZqDVGNbrG6LYmUD+4dSYJMNM2IuxgQYbVHp83OwF8p/BgolBwp45CulWxzCjyEGy1/degDo5ivZ8AjFVymUJI/vCq0BOhD4GGZqR8oveOYcUN7OIJy5mtE2reNI92qCiRCqEr8ccZo02DsBDBDQEQOR+q17gQn2vn0Hp3Ss7A=&quot;
}
}</span><span rn-wrapper aria-hidden="true"><span></span><span></span><span></span><span></span><span></span><span></span><span></span></span></code></pre>

        </details>
      <p data-line="1702">If captcha is not solved yet server will return <em>CAPCHA_NOT_READY</em> result. Repeat your request in 5 seconds.</p>
<p data-line="1704">If something went wrong server will return an <a href="#error_handling">error code</a>.</p>
<p data-line="1706">Use the values returned in your interaction with the target website. Normally the values are sent in the corresponding fields of the POST request, but you definetly need to check how it is used on your case.</p>
<p data-line="1708"><strong>List of <em>GET</em> request parameters for <a href="https://2captcha.com/res.php">https://2captcha.com/res.php</a></strong></p>
<table data-line="1710">
<thead data-line="1710">
<tr data-line="1710">
<th><strong>GET parameter</strong></th>
<th><strong>Type</strong></th>
<th><strong>Required</strong></th>
<th><strong>Description</strong></th>
</tr>
</thead>
<tbody data-line="1712">
<tr data-line="1712">
<td>key</td>
<td>String</td>
<td>Yes</td>
<td><a href="#solving_captchas">your API key</a></td>
</tr>
<tr data-line="1713">
<td>action</td>
<td>String</td>
<td>Yes</td>
<td>get - get the asnwer for your captcha</td>
</tr>
<tr data-line="1714">
<td>id</td>
<td>Integer</td>
<td>Yes</td>
<td>ID of captcha returned by in.php.</td>
</tr>
<tr data-line="1715">
<td>json</td>
<td>Integer <br>Default: 0</td>
<td>No</td>
<td>0 - server will send the response as plain text <br>1 - tells the server to send the response as JSON</td>
</tr>
</tbody>
</table>
<p data-line="1717"><strong>Request URL example:</strong></p>

        <details  data-line="1719" class="md-editor-code" open="">
          <summary class="md-editor-code-head">
            <div class="md-editor-code-flag"><span></span><span></span><span></span></div>
            <div class="md-editor-code-action">
              <span class="md-editor-code-lang"></span>
              <span class="md-editor-copy-button" data-tips="Copy">Copy</span>
              
              <span class="md-editor-collapse-tips"><svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="lucide lucide-circle-chevron-left md-editor-icon"><circle cx="12" cy="12" r="10"/><path d="m14 16-4-4 4-4"/></svg></span>
            </div>
          </summary>
          <pre><code class="language-" language=><span class="md-editor-code-block">https://2captcha.com/res.php?key=1abc234de56fab7c89012d34e56fa7b8&amp;action=get&amp;id=2122988149</span><span rn-wrapper aria-hidden="true"><span></span></span></code></pre>

        </details>
      </section>
<section id="mtcaptcha">
<h4 id="mtcaptcha-method" tabindex="-1" data-line="1724"><a class="header-anchor" href="#mtcaptcha-method">MTCaptcha method</a></h4>
<p data-line="1726">Token-based method for automated solving of MTCaptcha.</p>
<p data-line="1729"><strong>Method specification</strong></p>
<table data-line="1731">
<thead data-line="1731">
<tr data-line="1731">
<th><strong>Parameter</strong></th>
<th><strong>Type</strong></th>
<th><strong>Required</strong></th>
<th><strong>Description</strong></th>
</tr>
</thead>
<tbody data-line="1733">
<tr data-line="1733">
<td><strong>key</strong></td>
<td><em>String</em></td>
<td><strong>Yes</strong></td>
<td><a href="#solving_captchas">your API key</a></td>
</tr>
<tr data-line="1734">
<td><strong>method</strong></td>
<td><em>String</em></td>
<td><strong>Yes</strong></td>
<td><code>mt_captcha</code></td>
</tr>
<tr data-line="1735">
<td><strong>sitekey</strong></td>
<td><em>String</em></td>
<td><strong>Yes</strong></td>
<td>The value of <code>sitekey</code> parameter found on the page</td>
</tr>
<tr data-line="1736">
<td><strong>pageurl</strong></td>
<td><em>String</em></td>
<td><strong>Yes</strong></td>
<td>Full URL of the page where you solve the captcha</td>
</tr>
<tr data-line="1737">
<td>proxy</td>
<td><em>String</em></td>
<td>No</td>
<td>Your proxy: <em>login:password@123.123.123.123:3128</em> <br>You can find more info about proxies <a href="#proxies">here</a></td>
</tr>
<tr data-line="1738">
<td>proxytype</td>
<td><em>String</em></td>
<td>No</td>
<td>Type of your proxy: HTTP, HTTPS, SOCKS4, SOCKS5</td>
</tr>
<tr data-line="1739">
<td>json</td>
<td><em>Number</em></td>
<td>No</td>
<td>Set to <code>1</code> to get the response as JSON. Default: <code>0</code></td>
</tr>
<tr data-line="1740">
<td>soft_id</td>
<td><em>Number</em></td>
<td>No</td>
<td>ID of software developer. Developers who integrated their software with 2Captcha get reward: 10% of spendings of their software users</td>
</tr>
<tr data-line="1741">
<td>pingback</td>
<td><em>String</em></td>
<td>No</td>
<td>URL for pingback (callback) response that will be sent when captcha is solved. <br>URL should be registered on the server. <a href="#pingback">More info here</a>.</td>
</tr>
</tbody>
</table>
<h5 data-line="1744" id="">Request example</h5>
<p data-line="1746">Endpoint: <code>https://2captcha.com/in.php</code><br>
Method: <code>POST</code></p>

        <details  data-line="1749" class="md-editor-code" open="">
          <summary class="md-editor-code-head">
            <div class="md-editor-code-flag"><span></span><span></span><span></span></div>
            <div class="md-editor-code-action">
              <span class="md-editor-code-lang">json</span>
              <span class="md-editor-copy-button" data-tips="Copy">Copy</span>
              
              <span class="md-editor-collapse-tips"><svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="lucide lucide-circle-chevron-left md-editor-icon"><circle cx="12" cy="12" r="10"/><path d="m14 16-4-4 4-4"/></svg></span>
            </div>
          </summary>
          <pre><code class="language-json" language=json><span class="md-editor-code-block">{
    &quot;key&quot;:&quot;YOUR_API_KEY&quot;,
    &quot;method&quot;:&quot;mt_captcha&quot;,
    &quot;sitekey&quot;:&quot;MTPublic-KzqLY1cKH&quot;,
    &quot;pageurl&quot;:&quot;https://2captcha.com/demo/mtcaptcha&quot;,
    &quot;json&quot;: 1
}</span><span rn-wrapper aria-hidden="true"><span></span><span></span><span></span><span></span><span></span><span></span><span></span></span></code></pre>

        </details>
      <p data-line="1759">Request will return the id of your captcha. Use it to get the result.</p>
<p data-line="1762"><strong>Getting the result</strong></p>
<h5 data-line="1764" id="">Request example</h5>
<p data-line="1766">Endpoint: <code>https://2captcha.com/res.php</code><br>
Method: <code>POST</code></p>

        <details  data-line="1769" class="md-editor-code" open="">
          <summary class="md-editor-code-head">
            <div class="md-editor-code-flag"><span></span><span></span><span></span></div>
            <div class="md-editor-code-action">
              <span class="md-editor-code-lang">json</span>
              <span class="md-editor-copy-button" data-tips="Copy">Copy</span>
              
              <span class="md-editor-collapse-tips"><svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="lucide lucide-circle-chevron-left md-editor-icon"><circle cx="12" cy="12" r="10"/><path d="m14 16-4-4 4-4"/></svg></span>
            </div>
          </summary>
          <pre><code class="language-json" language=json><span class="md-editor-code-block">{
    &quot;key&quot;: &quot;YOUR_API_KEY&quot;,
    &quot;action&quot;: &quot;get&quot;,
    &quot;id&quot;: 2122988149,
    &quot;json&quot;: 1
}</span><span rn-wrapper aria-hidden="true"><span></span><span></span><span></span><span></span><span></span><span></span></span></code></pre>

        </details>
      <h5 data-line="1778" id="">Result example</h5>

        <details  data-line="1780" class="md-editor-code" open="">
          <summary class="md-editor-code-head">
            <div class="md-editor-code-flag"><span></span><span></span><span></span></div>
            <div class="md-editor-code-action">
              <span class="md-editor-code-lang">json</span>
              <span class="md-editor-copy-button" data-tips="Copy">Copy</span>
              
              <span class="md-editor-collapse-tips"><svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="lucide lucide-circle-chevron-left md-editor-icon"><circle cx="12" cy="12" r="10"/><path d="m14 16-4-4 4-4"/></svg></span>
            </div>
          </summary>
          <pre><code class="language-json" language=json><span class="md-editor-code-block">{
    &quot;status&quot;: 1,
    &quot;request&quot;: &quot;v1(fa78e9fe,c64ca2f..8e476cd94a6a,Hx3jMg3)&quot;
}</span><span rn-wrapper aria-hidden="true"><span></span><span></span><span></span><span></span></span></code></pre>

        </details>
      </section>
<section id="cutcaptcha">
<h4 id="cutcaptcha-method" tabindex="-1" data-line="1792"><a class="header-anchor" href="#cutcaptcha-method">Cutcaptcha method</a></h4>
<p data-line="1794">Token-based method for automated solving of Cutcaptcha.</p>
<p data-line="1796">The token received must be set as the <code>value</code> attribute of the <code>input#cap_token</code> element and/or passed to the callback function.</p>
<p data-line="1799"><strong>Method specification</strong></p>
<table data-line="1801">
<thead data-line="1801">
<tr data-line="1801">
<th><strong>Parameter</strong></th>
<th><strong>Type</strong></th>
<th><strong>Required</strong></th>
<th><strong>Description</strong></th>
</tr>
</thead>
<tbody data-line="1803">
<tr data-line="1803">
<td><strong>key</strong></td>
<td><em>String</em></td>
<td><strong>Yes</strong></td>
<td><a href="#solving_captchas">your API key</a></td>
</tr>
<tr data-line="1804">
<td><strong>method</strong></td>
<td><em>String</em></td>
<td><strong>Yes</strong></td>
<td><code>cutcaptcha</code></td>
</tr>
<tr data-line="1805">
<td><strong>misery_key</strong></td>
<td><em>String</em></td>
<td><strong>Yes</strong></td>
<td>The value of <code>CUTCAPTCHA_MISERY_KEY</code> variable defined on page</td>
</tr>
<tr data-line="1806">
<td><strong>api_key</strong></td>
<td><em>String</em></td>
<td><strong>Yes</strong></td>
<td>The value of <code>data-apikey</code> attribute of iframe's body. Also the name of javascript file included on the page</td>
</tr>
<tr data-line="1807">
<td><strong>pageurl</strong></td>
<td><em>String</em></td>
<td><strong>Yes</strong></td>
<td>Full URL of the page where you solve the captcha</td>
</tr>
<tr data-line="1808">
<td>proxy</td>
<td><em>String</em></td>
<td>No</td>
<td>Your proxy: <em>login:password@123.123.123.123:3128</em> <br>You can find more info about proxies <a href="#proxies">here</a></td>
</tr>
<tr data-line="1809">
<td>proxytype</td>
<td><em>String</em></td>
<td>No</td>
<td>Type of your proxy: HTTP, HTTPS, SOCKS4, SOCKS5</td>
</tr>
<tr data-line="1810">
<td>json</td>
<td><em>Number</em></td>
<td>No</td>
<td>Set to <code>1</code> to get the response as JSON. Default: <code>0</code></td>
</tr>
<tr data-line="1811">
<td>soft_id</td>
<td><em>Number</em></td>
<td>No</td>
<td>ID of software developer. Developers who integrated their software with 2Captcha get reward: 10% of spendings of their software users</td>
</tr>
<tr data-line="1812">
<td>pingback</td>
<td><em>String</em></td>
<td>No</td>
<td>URL for pingback (callback) response that will be sent when captcha is solved. <br>URL should be registered on the server. <a href="#pingback">More info here</a>.</td>
</tr>
</tbody>
</table>
<h5 data-line="1815" id="">Request example</h5>
<p data-line="1817">Endpoint: <code>https://2captcha.com/in.php</code><br>
Method: <code>POST</code></p>

        <details  data-line="1820" class="md-editor-code" open="">
          <summary class="md-editor-code-head">
            <div class="md-editor-code-flag"><span></span><span></span><span></span></div>
            <div class="md-editor-code-action">
              <span class="md-editor-code-lang">json</span>
              <span class="md-editor-copy-button" data-tips="Copy">Copy</span>
              
              <span class="md-editor-collapse-tips"><svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="lucide lucide-circle-chevron-left md-editor-icon"><circle cx="12" cy="12" r="10"/><path d="m14 16-4-4 4-4"/></svg></span>
            </div>
          </summary>
          <pre><code class="language-json" language=json><span class="md-editor-code-block">{
    &quot;key&quot;: &quot;YOUR_API_KEY&quot;,
    &quot;method&quot;: &quot;cutcaptcha&quot;,
    &quot;misery_key&quot;: &quot;a1488b66da00bf332a1488993a5443c79047e752&quot;,
    &quot;api_key&quot;: &quot;SAb83IIB&quot;,
    &quot;pageurl&quot;: &quot;https://example.cc/foo/bar.html&quot;,
    &quot;json&quot;: 1
}</span><span rn-wrapper aria-hidden="true"><span></span><span></span><span></span><span></span><span></span><span></span><span></span><span></span></span></code></pre>

        </details>
      <p data-line="1831">Request will return the id of your captcha. Use it to get the result.</p>
<p data-line="1834"><strong>Getting the result</strong></p>
<h5 data-line="1836" id="">Request example</h5>
<p data-line="1838">Endpoint: <code>https://2captcha.com/res.php</code><br>
Method: <code>POST</code></p>

        <details  data-line="1841" class="md-editor-code" open="">
          <summary class="md-editor-code-head">
            <div class="md-editor-code-flag"><span></span><span></span><span></span></div>
            <div class="md-editor-code-action">
              <span class="md-editor-code-lang">json</span>
              <span class="md-editor-copy-button" data-tips="Copy">Copy</span>
              
              <span class="md-editor-collapse-tips"><svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="lucide lucide-circle-chevron-left md-editor-icon"><circle cx="12" cy="12" r="10"/><path d="m14 16-4-4 4-4"/></svg></span>
            </div>
          </summary>
          <pre><code class="language-json" language=json><span class="md-editor-code-block">{
    &quot;key&quot;: &quot;YOUR_API_KEY&quot;,
    &quot;action&quot;: &quot;get&quot;,
    &quot;id&quot;: 2122988149,
    &quot;json&quot;: 1
}</span><span rn-wrapper aria-hidden="true"><span></span><span></span><span></span><span></span><span></span><span></span></span></code></pre>

        </details>
      <h5 data-line="1850" id="">Result example</h5>

        <details  data-line="1852" class="md-editor-code" open="">
          <summary class="md-editor-code-head">
            <div class="md-editor-code-flag"><span></span><span></span><span></span></div>
            <div class="md-editor-code-action">
              <span class="md-editor-code-lang">json</span>
              <span class="md-editor-copy-button" data-tips="Copy">Copy</span>
              
              <span class="md-editor-collapse-tips"><svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="lucide lucide-circle-chevron-left md-editor-icon"><circle cx="12" cy="12" r="10"/><path d="m14 16-4-4 4-4"/></svg></span>
            </div>
          </summary>
          <pre><code class="language-json" language=json><span class="md-editor-code-block">{
    &quot;status&quot;: 1,
    &quot;request&quot;: &quot;BazM23cpFUUyAAAdqPwNEDZx0REtH3ss&quot;
}</span><span rn-wrapper aria-hidden="true"><span></span><span></span><span></span><span></span></span></code></pre>

        </details>
      <h5 data-line="1859" id="">Using the token</h5>
<p data-line="1861">Use the returned token as a value for  <code>input</code> with <code>id = cap_token</code>, then submit it's parent form, for example:</p>

        <details  data-line="1863" class="md-editor-code" open="">
          <summary class="md-editor-code-head">
            <div class="md-editor-code-flag"><span></span><span></span><span></span></div>
            <div class="md-editor-code-action">
              <span class="md-editor-code-lang">js</span>
              <span class="md-editor-copy-button" data-tips="Copy">Copy</span>
              
              <span class="md-editor-collapse-tips"><svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="lucide lucide-circle-chevron-left md-editor-icon"><circle cx="12" cy="12" r="10"/><path d="m14 16-4-4 4-4"/></svg></span>
            </div>
          </summary>
          <pre><code class="language-js" language=js><span class="md-editor-code-block">document.querySelector('input#cap_token').value='BazM23cpFUUyAAAdqPwNEDZx0REtH3ss'
document.querySelector('form').submit()</span><span rn-wrapper aria-hidden="true"><span></span><span></span></span></code></pre>

        </details>
      <p data-line="1868">If there's a callback function defined, you can call it passing the token as argument:</p>

        <details  data-line="1870" class="md-editor-code" open="">
          <summary class="md-editor-code-head">
            <div class="md-editor-code-flag"><span></span><span></span><span></span></div>
            <div class="md-editor-code-action">
              <span class="md-editor-code-lang">js</span>
              <span class="md-editor-copy-button" data-tips="Copy">Copy</span>
              
              <span class="md-editor-collapse-tips"><svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="lucide lucide-circle-chevron-left md-editor-icon"><circle cx="12" cy="12" r="10"/><path d="m14 16-4-4 4-4"/></svg></span>
            </div>
          </summary>
          <pre><code class="language-js" language=js><span class="md-editor-code-block">capResponseCallback('BazM23cpFUUyAAAdqPwNEDZx0REtH3ss')</span><span rn-wrapper aria-hidden="true"><span></span></span></code></pre>

        </details>
      </section>
<section id="friendly-captcha">
<h4 id="friendly-captcha-method" tabindex="-1" data-line="1880"><a class="header-anchor" href="#friendly-captcha-method">Friendly Captcha method</a></h4>
<p data-line="1882">Token-based method for automated solving of Friendly Captcha.</p>
<p data-line="1884">The token received must be set as the <code>value</code> attribute of the <code>input#cap_token</code> element and/or passed to the callback function.</p>
<blockquote data-line="1886">
<p data-line="1886"><strong>Important:</strong> To successfully use the received token, the captcha widget must not be loaded on the page. To do this, you need to abort request to <code>/friendlycaptcha/...module.min.js</code> on the page. When the captcha widget is already loaded on the page, there is a high probability that the received token will not work.</p>
</blockquote>
<p data-line="1889"><strong>Method specification</strong></p>
<table data-line="1891">
<thead data-line="1891">
<tr data-line="1891">
<th><strong>Parameter</strong></th>
<th><strong>Type</strong></th>
<th><strong>Required</strong></th>
<th><strong>Description</strong></th>
</tr>
</thead>
<tbody data-line="1893">
<tr data-line="1893">
<td><strong>key</strong></td>
<td><em>String</em></td>
<td><strong>Yes</strong></td>
<td><a href="#solving_captchas">your API key</a></td>
</tr>
<tr data-line="1894">
<td><strong>method</strong></td>
<td><em>String</em></td>
<td><strong>Yes</strong></td>
<td><code>friendly_captcha</code></td>
</tr>
<tr data-line="1895">
<td><strong>sitekey</strong></td>
<td><em>String</em></td>
<td><strong>Yes</strong></td>
<td>The value of <code>data-sitekey</code> attribute of captcha's <code>div</code> element on page.</td>
</tr>
<tr data-line="1896">
<td><strong>pageurl</strong></td>
<td><em>String</em></td>
<td><strong>Yes</strong></td>
<td>Full URL of the page where you solve the captcha</td>
</tr>
<tr data-line="1897">
<td>version</td>
<td><em>String</em></td>
<td>No</td>
<td><strong>Friendly Captcha</strong> version. <br><code>v1</code> — Friendly Captcha V1. <br><code>v2</code> — Friendly Captcha V2. <br> Default: <code>v1</code>. See the official Friendly Captcha documentation for more details on version differences.</td>
</tr>
<tr data-line="1898">
<td>module_script</td>
<td><em>String</em></td>
<td>No</td>
<td>URL of the <strong>Friendly Captcha</strong> script with the <code>type=&quot;module&quot;</code> attribute, found on the captcha page.</td>
</tr>
<tr data-line="1899">
<td>nomodule_script</td>
<td><em>String</em></td>
<td>No</td>
<td>URL of the <strong>Friendly Captcha</strong> script with the <code>nomodule</code> attribute, found on the captcha page.</td>
</tr>
<tr data-line="1900">
<td>proxy</td>
<td><em>String</em></td>
<td>No</td>
<td>Your proxy: <em>login:password@123.123.123.123:3128</em> <br>You can find more info about proxies <a href="#proxies">here</a></td>
</tr>
<tr data-line="1901">
<td>proxytype</td>
<td><em>String</em></td>
<td>No</td>
<td>Type of your proxy: HTTP, HTTPS, SOCKS4, SOCKS5</td>
</tr>
<tr data-line="1902">
<td>json</td>
<td><em>Number</em></td>
<td>No</td>
<td>Set to <code>1</code> to get the response as JSON. Default: <code>0</code></td>
</tr>
<tr data-line="1903">
<td>soft_id</td>
<td><em>Number</em></td>
<td>No</td>
<td>ID of software developer. Developers who integrated their software with 2Captcha get reward: 10% of spendings of their software users</td>
</tr>
<tr data-line="1904">
<td>pingback</td>
<td><em>String</em></td>
<td>No</td>
<td>URL for pingback (callback) response that will be sent when captcha is solved. <br>URL should be registered on the server. <a href="#pingback">More info here</a>.</td>
</tr>
</tbody>
</table>
<h5 data-line="1908" id="">Request example</h5>
<p data-line="1910">Endpoint: <code>https://2captcha.com/in.php</code><br>
Method: <code>POST</code></p>
<p data-line="1913">Friendly Captcha V1:</p>

        <details  data-line="1914" class="md-editor-code" open="">
          <summary class="md-editor-code-head">
            <div class="md-editor-code-flag"><span></span><span></span><span></span></div>
            <div class="md-editor-code-action">
              <span class="md-editor-code-lang">json</span>
              <span class="md-editor-copy-button" data-tips="Copy">Copy</span>
              
              <span class="md-editor-collapse-tips"><svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="lucide lucide-circle-chevron-left md-editor-icon"><circle cx="12" cy="12" r="10"/><path d="m14 16-4-4 4-4"/></svg></span>
            </div>
          </summary>
          <pre><code class="language-json" language=json><span class="md-editor-code-block">{
    &quot;key&quot;: &quot;YOUR_API_KEY&quot;,
    &quot;method&quot;: &quot;friendly_captcha&quot;,
    &quot;sitekey&quot;: &quot;2FZFEVS1FZCGQ9&quot;,
    &quot;pageurl&quot;: &quot;https://example.com&quot;,
    &quot;version&quot;: &quot;v1&quot;,
    &quot;module_script&quot;: &quot;https://cdn.example.com/static/js/friendly-challenge/@0.9.1/widget.module.min.js&quot;,
    &quot;nomodule_script&quot;: &quot;https://cdn.example.com/static/js/friendly-challenge/@0.9.1/widget.js&quot;,
    &quot;json&quot;: 1
}</span><span rn-wrapper aria-hidden="true"><span></span><span></span><span></span><span></span><span></span><span></span><span></span><span></span><span></span><span></span></span></code></pre>

        </details>
      <p data-line="1927">Friendly Captcha V2:</p>

        <details  data-line="1928" class="md-editor-code" open="">
          <summary class="md-editor-code-head">
            <div class="md-editor-code-flag"><span></span><span></span><span></span></div>
            <div class="md-editor-code-action">
              <span class="md-editor-code-lang">json</span>
              <span class="md-editor-copy-button" data-tips="Copy">Copy</span>
              
              <span class="md-editor-collapse-tips"><svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="lucide lucide-circle-chevron-left md-editor-icon"><circle cx="12" cy="12" r="10"/><path d="m14 16-4-4 4-4"/></svg></span>
            </div>
          </summary>
          <pre><code class="language-json" language=json><span class="md-editor-code-block">    &quot;key&quot;: &quot;YOUR_API_KEY&quot;,
    &quot;method&quot;: &quot;friendly_captcha&quot;,
    &quot;sitekey&quot;: &quot;2FZFEVS1FZCGQ9&quot;,
    &quot;pageurl&quot;: &quot;https://example.com&quot;,
    &quot;version&quot;: &quot;v2&quot;,
    &quot;module_script&quot;: &quot;https://cdn.example.com/v2/widget.module.min.js&quot;,
    &quot;nomodule_script&quot;: &quot;https://cdn.example.com/v2/widget.js&quot;,
    &quot;json&quot;: 1</span><span rn-wrapper aria-hidden="true"><span></span><span></span><span></span><span></span><span></span><span></span><span></span><span></span></span></code></pre>

        </details>
      <p data-line="1939">Request will return the id of your captcha. Use it to get the result.</p>
<p data-line="1941"><strong>Getting the result</strong></p>
<h5 data-line="1943" id="">Request example</h5>
<p data-line="1945">Endpoint: <code>https://2captcha.com/res.php</code><br>
Method: <code>POST</code></p>

        <details  data-line="1948" class="md-editor-code" open="">
          <summary class="md-editor-code-head">
            <div class="md-editor-code-flag"><span></span><span></span><span></span></div>
            <div class="md-editor-code-action">
              <span class="md-editor-code-lang">json</span>
              <span class="md-editor-copy-button" data-tips="Copy">Copy</span>
              
              <span class="md-editor-collapse-tips"><svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="lucide lucide-circle-chevron-left md-editor-icon"><circle cx="12" cy="12" r="10"/><path d="m14 16-4-4 4-4"/></svg></span>
            </div>
          </summary>
          <pre><code class="language-json" language=json><span class="md-editor-code-block">{
    &quot;key&quot;: &quot;YOUR_API_KEY&quot;,
    &quot;action&quot;: &quot;get&quot;,
    &quot;id&quot;: 2122988149,
    &quot;json&quot;: 1
}</span><span rn-wrapper aria-hidden="true"><span></span><span></span><span></span><span></span><span></span><span></span></span></code></pre>

        </details>
      <h5 data-line="1957" id="">Result example</h5>

        <details  data-line="1959" class="md-editor-code" open="">
          <summary class="md-editor-code-head">
            <div class="md-editor-code-flag"><span></span><span></span><span></span></div>
            <div class="md-editor-code-action">
              <span class="md-editor-code-lang">json</span>
              <span class="md-editor-copy-button" data-tips="Copy">Copy</span>
              
              <span class="md-editor-collapse-tips"><svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="lucide lucide-circle-chevron-left md-editor-icon"><circle cx="12" cy="12" r="10"/><path d="m14 16-4-4 4-4"/></svg></span>
            </div>
          </summary>
          <pre><code class="language-json" language=json><span class="md-editor-code-block">{
    &quot;status&quot;: 1,
    &quot;request&quot;: &quot;f8b10f4ad796484bae963b1ebe3ce2bb.ZXL8Z...AAAAAA.AgAD&quot;
}</span><span rn-wrapper aria-hidden="true"><span></span><span></span><span></span><span></span></span></code></pre>

        </details>
      <h5 data-line="1966" id="">Using the token</h5>
<p data-line="1968">Use the returned token as a value for  <code>input</code> with <code>name = frc-captcha-solution</code>, then submit it's parent form, for example:</p>

        <details  data-line="1970" class="md-editor-code" open="">
          <summary class="md-editor-code-head">
            <div class="md-editor-code-flag"><span></span><span></span><span></span></div>
            <div class="md-editor-code-action">
              <span class="md-editor-code-lang">js</span>
              <span class="md-editor-copy-button" data-tips="Copy">Copy</span>
              
              <span class="md-editor-collapse-tips"><svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="lucide lucide-circle-chevron-left md-editor-icon"><circle cx="12" cy="12" r="10"/><path d="m14 16-4-4 4-4"/></svg></span>
            </div>
          </summary>
          <pre><code class="language-js" language=js><span class="md-editor-code-block">document.querySelector('input.frc-captcha-solution').value='f8b10f4ad796484bae963b1ebe3ce2bb.ZXL8Z...AAAAAA.AgAD'
document.querySelector('form').submit()</span><span rn-wrapper aria-hidden="true"><span></span><span></span></span></code></pre>

        </details>
      <p data-line="1975">Please note, that form name can be customized with <code>data-solution-field-name</code> attribute, then you need to use the name set as the attribute's value.</p>
<p data-line="1978">If there's a callback function defined, you can call it passing the token as argument. For example, if <code>data-callback=&quot;doneCallback&quot;</code> you should run it as:</p>

        <details  data-line="1980" class="md-editor-code" open="">
          <summary class="md-editor-code-head">
            <div class="md-editor-code-flag"><span></span><span></span><span></span></div>
            <div class="md-editor-code-action">
              <span class="md-editor-code-lang">js</span>
              <span class="md-editor-copy-button" data-tips="Copy">Copy</span>
              
              <span class="md-editor-collapse-tips"><svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="lucide lucide-circle-chevron-left md-editor-icon"><circle cx="12" cy="12" r="10"/><path d="m14 16-4-4 4-4"/></svg></span>
            </div>
          </summary>
          <pre><code class="language-js" language=js><span class="md-editor-code-block">doneCallback('f8b10f4ad796484bae963b1ebe3ce2bb.ZXL8Z...AAAAAA.AgAD')</span><span rn-wrapper aria-hidden="true"><span></span></span></code></pre>

        </details>
      </section>
<section id="atb-captcha">
<h4 id="atbcaptcha-method" tabindex="-1" data-line="1989"><a class="header-anchor" href="#atbcaptcha-method">atbCAPTCHA method</a></h4>
<p data-line="1991">Token-based method for automated solving of atbCAPTCHA.</p>
<p data-line="1994"><strong>Method specification</strong></p>
<table data-line="1996">
<thead data-line="1996">
<tr data-line="1996">
<th><strong>Parameter</strong></th>
<th><strong>Type</strong></th>
<th><strong>Required</strong></th>
<th><strong>Description</strong></th>
</tr>
</thead>
<tbody data-line="1998">
<tr data-line="1998">
<td><strong>key</strong></td>
<td><em>String</em></td>
<td><strong>Yes</strong></td>
<td><a href="#solving_captchas">your API key</a></td>
</tr>
<tr data-line="1999">
<td><strong>method</strong></td>
<td><em>String</em></td>
<td><strong>Yes</strong></td>
<td><code>atb_captcha</code></td>
</tr>
<tr data-line="2000">
<td><strong>app_id</strong></td>
<td><em>String</em></td>
<td><strong>Yes</strong></td>
<td>The value of <code>appId</code> parameter in the website source code.</td>
</tr>
<tr data-line="2001">
<td><strong>api_server</strong></td>
<td><em>String</em></td>
<td><strong>Yes</strong></td>
<td>The value of <code>apiServer</code> parameter in the website source code.</td>
</tr>
<tr data-line="2002">
<td><strong>pageurl</strong></td>
<td><em>String</em></td>
<td><strong>Yes</strong></td>
<td>The full URL of target web page where the captcha is loaded. We do not open the page, not a problem if it is available only for authenticated users</td>
</tr>
<tr data-line="2003">
<td>proxy</td>
<td><em>String</em></td>
<td>No</td>
<td>Your proxy: <em>login:password@123.123.123.123:3128</em> <br>You can find more info about proxies <a href="#proxies">here</a></td>
</tr>
<tr data-line="2004">
<td>proxytype</td>
<td><em>String</em></td>
<td>No</td>
<td>Type of your proxy: HTTP, HTTPS, SOCKS4, SOCKS5</td>
</tr>
<tr data-line="2005">
<td>json</td>
<td><em>Number</em></td>
<td>No</td>
<td>Set to <code>1</code> to get the response as JSON. Default: <code>0</code></td>
</tr>
</tbody>
</table>
<h5 data-line="2008" id="">Request example</h5>
<p data-line="2010">Endpoint: <code>https://2captcha.com/in.php</code><br>
Method: <code>POST</code></p>

        <details  data-line="2013" class="md-editor-code" open="">
          <summary class="md-editor-code-head">
            <div class="md-editor-code-flag"><span></span><span></span><span></span></div>
            <div class="md-editor-code-action">
              <span class="md-editor-code-lang">json</span>
              <span class="md-editor-copy-button" data-tips="Copy">Copy</span>
              
              <span class="md-editor-collapse-tips"><svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="lucide lucide-circle-chevron-left md-editor-icon"><circle cx="12" cy="12" r="10"/><path d="m14 16-4-4 4-4"/></svg></span>
            </div>
          </summary>
          <pre><code class="language-json" language=json><span class="md-editor-code-block">{
    &quot;key&quot;: &quot;YOUR_API_KEY&quot;,
    &quot;method&quot;: &quot;atb_captcha&quot;,
    &quot;app_id&quot;: &quot;af23e041b22d000a11e22a230fa8991c&quot;,
    &quot;api_server&quot;: &quot;https://cap.aisecurius.com&quot;,
    &quot;pageurl&quot;: &quot;https://www.example.com/&quot;,
    &quot;json&quot;: 1
}</span><span rn-wrapper aria-hidden="true"><span></span><span></span><span></span><span></span><span></span><span></span><span></span><span></span></span></code></pre>

        </details>
      <p data-line="2024">Request will return the id of your captcha. Use it to get the result.</p>
<p data-line="2027"><strong>Getting the result</strong></p>
<h5 data-line="2029" id="">Request example</h5>
<p data-line="2031">Endpoint: <code>https://2captcha.com/res.php</code><br>
Method: <code>POST</code></p>

        <details  data-line="2034" class="md-editor-code" open="">
          <summary class="md-editor-code-head">
            <div class="md-editor-code-flag"><span></span><span></span><span></span></div>
            <div class="md-editor-code-action">
              <span class="md-editor-code-lang">json</span>
              <span class="md-editor-copy-button" data-tips="Copy">Copy</span>
              
              <span class="md-editor-collapse-tips"><svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="lucide lucide-circle-chevron-left md-editor-icon"><circle cx="12" cy="12" r="10"/><path d="m14 16-4-4 4-4"/></svg></span>
            </div>
          </summary>
          <pre><code class="language-json" language=json><span class="md-editor-code-block">{
    &quot;key&quot;: &quot;YOUR_API_KEY&quot;,
    &quot;action&quot;: &quot;get&quot;,
    &quot;id&quot;: 2122988149,
    &quot;json&quot;: 1
}</span><span rn-wrapper aria-hidden="true"><span></span><span></span><span></span><span></span><span></span><span></span></span></code></pre>

        </details>
      <h5 data-line="2043" id="">Result example</h5>

        <details  data-line="2045" class="md-editor-code" open="">
          <summary class="md-editor-code-head">
            <div class="md-editor-code-flag"><span></span><span></span><span></span></div>
            <div class="md-editor-code-action">
              <span class="md-editor-code-lang">json</span>
              <span class="md-editor-copy-button" data-tips="Copy">Copy</span>
              
              <span class="md-editor-collapse-tips"><svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="lucide lucide-circle-chevron-left md-editor-icon"><circle cx="12" cy="12" r="10"/><path d="m14 16-4-4 4-4"/></svg></span>
            </div>
          </summary>
          <pre><code class="language-json" language=json><span class="md-editor-code-block">{
    &quot;status&quot;: 1,
    &quot;request&quot;: &quot;sl191suxzluwxxh6f:&quot;
}</span><span rn-wrapper aria-hidden="true"><span></span><span></span><span></span><span></span></span></code></pre>

        </details>
      <h5 data-line="2052" id="">Using the token</h5>
<p data-line="2054">The token is passed to a callback function defined in <code>success</code> property during the captcha initialization. This function is usually used to make a request to the website backend where the token is verified. You can execute the callback function passing the token as an argument or build a request to the backend using passing the token.</p>

        <details  data-line="2056" class="md-editor-code" open="">
          <summary class="md-editor-code-head">
            <div class="md-editor-code-flag"><span></span><span></span><span></span></div>
            <div class="md-editor-code-action">
              <span class="md-editor-code-lang">javascript</span>
              <span class="md-editor-copy-button" data-tips="Copy">Copy</span>
              
              <span class="md-editor-collapse-tips"><svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="lucide lucide-circle-chevron-left md-editor-icon"><circle cx="12" cy="12" r="10"/><path d="m14 16-4-4 4-4"/></svg></span>
            </div>
          </summary>
          <pre><code class="language-javascript" language=javascript><span class="md-editor-code-block">const myCallbackFunction = (token) {
    // verify the token
}
var myCaptcha = as.Captcha(document.getElementById('demo'), {
    appId: 'af23e041b22d000a11e22a230fa8991c',
    success: myCallbackFunction
})</span><span rn-wrapper aria-hidden="true"><span></span><span></span><span></span><span></span><span></span><span></span><span></span></span></code></pre>

        </details>
      </section>
<section id="tencent">
<h4 id="tencent-method" tabindex="-1" data-line="2070"><a class="header-anchor" href="#tencent-method">Tencent method</a></h4>
<p data-line="2072">Token-based method for automated solving of Tencent captcha.</p>
<p data-line="2075"><strong>Method specification</strong></p>
<table data-line="2077">
<thead data-line="2077">
<tr data-line="2077">
<th><strong>Parameter</strong></th>
<th><strong>Type</strong></th>
<th><strong>Required</strong></th>
<th><strong>Description</strong></th>
</tr>
</thead>
<tbody data-line="2079">
<tr data-line="2079">
<td><strong>key</strong></td>
<td><em>String</em></td>
<td><strong>Yes</strong></td>
<td><a href="#solving_captchas">your API key</a></td>
</tr>
<tr data-line="2080">
<td><strong>method</strong></td>
<td><em>String</em></td>
<td><strong>Yes</strong></td>
<td><code>tencent</code></td>
</tr>
<tr data-line="2081">
<td><strong>app_id</strong></td>
<td><em>String</em></td>
<td><strong>Yes</strong></td>
<td>The value of <code>appId</code> parameter in the website source code.</td>
</tr>
<tr data-line="2082">
<td><strong>pageurl</strong></td>
<td><em>String</em></td>
<td><strong>Yes</strong></td>
<td>The full URL of target web page where the captcha is loaded. We do not open the page, not a problem if it is available only for authenticated users</td>
</tr>
<tr data-line="2083">
<td>captcha_script</td>
<td><em>String</em></td>
<td><strong>No</strong></td>
<td>Captcha script URL from the page source code. Default: <code>https://turing.captcha.qcloud.com/TCaptcha.js</code></td>
</tr>
<tr data-line="2084">
<td>proxy</td>
<td><em>String</em></td>
<td>No</td>
<td>Your proxy: <em>login:password@123.123.123.123:3128</em> <br>You can find more info about proxies <a href="#proxies">here</a></td>
</tr>
<tr data-line="2085">
<td>proxytype</td>
<td><em>String</em></td>
<td>No</td>
<td>Type of your proxy: HTTP, HTTPS, SOCKS4, SOCKS5</td>
</tr>
<tr data-line="2086">
<td>json</td>
<td><em>Number</em></td>
<td>No</td>
<td>Set to <code>1</code> to get the response as JSON. Default: <code>0</code></td>
</tr>
</tbody>
</table>
<h5 data-line="2089" id="">Request example</h5>
<p data-line="2091">Endpoint: <code>https://2captcha.com/in.php</code><br>
Method: <code>POST</code></p>

        <details  data-line="2094" class="md-editor-code" open="">
          <summary class="md-editor-code-head">
            <div class="md-editor-code-flag"><span></span><span></span><span></span></div>
            <div class="md-editor-code-action">
              <span class="md-editor-code-lang">json</span>
              <span class="md-editor-copy-button" data-tips="Copy">Copy</span>
              
              <span class="md-editor-collapse-tips"><svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="lucide lucide-circle-chevron-left md-editor-icon"><circle cx="12" cy="12" r="10"/><path d="m14 16-4-4 4-4"/></svg></span>
            </div>
          </summary>
          <pre><code class="language-json" language=json><span class="md-editor-code-block">{
    &quot;key&quot;: &quot;YOUR_API_KEY&quot;,
    &quot;method&quot;: &quot;tencent&quot;,
    &quot;app_id&quot;: &quot;190014885&quot;,
    &quot;pageurl&quot;: &quot;https://www.example.com/&quot;,
    &quot;json&quot;: 1
}</span><span rn-wrapper aria-hidden="true"><span></span><span></span><span></span><span></span><span></span><span></span><span></span></span></code></pre>

        </details>
      <p data-line="2104">Request will return the id of your captcha. Use it to get the result.</p>
<p data-line="2107"><strong>Getting the result</strong></p>
<h5 data-line="2109" id="">Request example</h5>
<p data-line="2111">Endpoint: <code>https://2captcha.com/res.php</code><br>
Method: <code>POST</code></p>

        <details  data-line="2114" class="md-editor-code" open="">
          <summary class="md-editor-code-head">
            <div class="md-editor-code-flag"><span></span><span></span><span></span></div>
            <div class="md-editor-code-action">
              <span class="md-editor-code-lang">json</span>
              <span class="md-editor-copy-button" data-tips="Copy">Copy</span>
              
              <span class="md-editor-collapse-tips"><svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="lucide lucide-circle-chevron-left md-editor-icon"><circle cx="12" cy="12" r="10"/><path d="m14 16-4-4 4-4"/></svg></span>
            </div>
          </summary>
          <pre><code class="language-json" language=json><span class="md-editor-code-block">{
    &quot;key&quot;: &quot;YOUR_API_KEY&quot;,
    &quot;action&quot;: &quot;get&quot;,
    &quot;id&quot;: 2122988149,
    &quot;json&quot;: 1
}</span><span rn-wrapper aria-hidden="true"><span></span><span></span><span></span><span></span><span></span><span></span></span></code></pre>

        </details>
      <h5 data-line="2123" id="">Result example</h5>

        <details  data-line="2125" class="md-editor-code" open="">
          <summary class="md-editor-code-head">
            <div class="md-editor-code-flag"><span></span><span></span><span></span></div>
            <div class="md-editor-code-action">
              <span class="md-editor-code-lang">json</span>
              <span class="md-editor-copy-button" data-tips="Copy">Copy</span>
              
              <span class="md-editor-collapse-tips"><svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="lucide lucide-circle-chevron-left md-editor-icon"><circle cx="12" cy="12" r="10"/><path d="m14 16-4-4 4-4"/></svg></span>
            </div>
          </summary>
          <pre><code class="language-json" language=json><span class="md-editor-code-block">{
    &quot;status&quot;: 1,
    &quot;request&quot;: {
        &quot;appid&quot;: &quot;190014885&quot;,
        &quot;ret&quot;: 0,
        &quot;ticket&quot;: &quot;tr0344YjJASGmJGtohyWS_y6tJKiqVPIdFgl87vWlVaQoueR8D6DH28go-i-VjeassM31SXO7D0*&quot;,
        &quot;randstr&quot;: &quot;@KVN&quot;
    }
}</span><span rn-wrapper aria-hidden="true"><span></span><span></span><span></span><span></span><span></span><span></span><span></span><span></span><span></span></span></code></pre>

        </details>
      <h3 id="using-the-token" tabindex="-1" data-line="2137"><a class="header-anchor" href="#using-the-token">Using the token</a></h3>
<p data-line="2139">The token is passed to a callback function defined in 2nd argument of <code>TencentCaptcha</code> constructor call during the captcha initialization.</p>

        <details  data-line="2141" class="md-editor-code" open="">
          <summary class="md-editor-code-head">
            <div class="md-editor-code-flag"><span></span><span></span><span></span></div>
            <div class="md-editor-code-action">
              <span class="md-editor-code-lang">js</span>
              <span class="md-editor-copy-button" data-tips="Copy">Copy</span>
              
              <span class="md-editor-collapse-tips"><svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="lucide lucide-circle-chevron-left md-editor-icon"><circle cx="12" cy="12" r="10"/><path d="m14 16-4-4 4-4"/></svg></span>
            </div>
          </summary>
          <pre><code class="language-js" language=js><span class="md-editor-code-block">new TencentCaptcha(CaptchaAppId, callback, options);</span><span rn-wrapper aria-hidden="true"><span></span></span></code></pre>

        </details>
      <p data-line="2145">This function is usually used to make a request to the website backend where the token is verified. You can execute the callback function passing the token as an argument or build a request to the backend using passing the token.</p>
<p data-line="2147">For example, if the captcha is initialized like this:</p>

        <details  data-line="2149" class="md-editor-code" open="">
          <summary class="md-editor-code-head">
            <div class="md-editor-code-flag"><span></span><span></span><span></span></div>
            <div class="md-editor-code-action">
              <span class="md-editor-code-lang">js</span>
              <span class="md-editor-copy-button" data-tips="Copy">Copy</span>
              
              <span class="md-editor-collapse-tips"><svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="lucide lucide-circle-chevron-left md-editor-icon"><circle cx="12" cy="12" r="10"/><path d="m14 16-4-4 4-4"/></svg></span>
            </div>
          </summary>
          <pre><code class="language-js" language=js><span class="md-editor-code-block">const myCallbackFunction = (token) {
    // verify the token
}
var captcha = new TencentCaptcha('190014885', myCallbackFunction, {});
captcha.show();</span><span rn-wrapper aria-hidden="true"><span></span><span></span><span></span><span></span><span></span></span></code></pre>

        </details>
      <p data-line="2157">You need to call:</p>

        <details  data-line="2159" class="md-editor-code" open="">
          <summary class="md-editor-code-head">
            <div class="md-editor-code-flag"><span></span><span></span><span></span></div>
            <div class="md-editor-code-action">
              <span class="md-editor-code-lang">js</span>
              <span class="md-editor-copy-button" data-tips="Copy">Copy</span>
              
              <span class="md-editor-collapse-tips"><svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="lucide lucide-circle-chevron-left md-editor-icon"><circle cx="12" cy="12" r="10"/><path d="m14 16-4-4 4-4"/></svg></span>
            </div>
          </summary>
          <pre><code class="language-js" language=js><span class="md-editor-code-block">let data = JSON.parse(res)
myCallbackFunction(res.request)</span><span rn-wrapper aria-hidden="true"><span></span><span></span></span></code></pre>

        </details>
      <p data-line="2164">Where <code>res</code> is the JSON response from the API.</p>
</section>
<section id="datadome">
<h4 id="datadome" tabindex="-1" data-line="2170"><a class="header-anchor" href="#datadome">DataDome</a></h4>
<p data-line="2172">Cookies-based method for automated solving of DataDome.<br>
Set the returned cookie in your browser to bypass the captcha.</p>
<p data-line="2175">To solve the <code>DataDome</code> captcha, you must use a proxy.</p>
<blockquote data-line="2177">
<p data-line="2177"><b>Attention</b>, you need to check the value of the parameter <code>t</code> in <code>captcha_url</code> if it is contained. The value of <code>t</code> must be equal to <code>fe</code>.<br>
If <code>t=bv</code>, it means that your ip is banned by the captcha and you need to change the ip address.</p>
</blockquote>
<blockquote data-line="2180">
<p data-line="2180"><b>Attention</b>, you need to monitor the quality of the proxy used. If your proxy is blocked by the captcha <code>DataDome</code>, then when solving you will receive errors <code>ERR_PROXY_CONNECTION_FAILED</code> or <code>ERROR_CAPTCHA_UNSOLVABLE</code>, in which case you need to change the proxy server used.</p>
</blockquote>
<blockquote data-line="2182">
<p data-line="2182"><b>Attention</b>, you should provide your User-Agent that was used to interact with target website, it will be used to load and solve the captcha. Always use User-Agents of modern browsers.</p>
</blockquote>
<p data-line="2185"><strong>Method specification</strong></p>
<table data-line="2188">
<thead data-line="2188">
<tr data-line="2188">
<th><strong>Parameter</strong></th>
<th><strong>Type</strong></th>
<th><strong>Required</strong></th>
<th><strong>Description</strong></th>
</tr>
</thead>
<tbody data-line="2190">
<tr data-line="2190">
<td><strong>key</strong></td>
<td><em>String</em></td>
<td><strong>Yes</strong></td>
<td><a href="#solving_captchas">your API key</a></td>
</tr>
<tr data-line="2191">
<td><strong>method</strong></td>
<td><em>String</em></td>
<td><strong>Yes</strong></td>
<td><code>datadome</code></td>
</tr>
<tr data-line="2192">
<td><strong>captcha_url</strong></td>
<td><em>String</em></td>
<td><strong>Yes</strong></td>
<td>The value of the <code>src</code> parameter for the <code>iframe</code> element containing the captcha on the page.</td>
</tr>
<tr data-line="2193">
<td><strong>pageurl</strong></td>
<td><em>String</em></td>
<td><strong>Yes</strong></td>
<td>Full URL of the page where you solve the captcha</td>
</tr>
<tr data-line="2194">
<td><strong>userAgent</strong></td>
<td><em>String</em></td>
<td><strong>Yes</strong></td>
<td>User-Agent of your browser will be used to load the captcha.</td>
</tr>
<tr data-line="2195">
<td>proxy</td>
<td><em>String</em></td>
<td><strong>Yes</strong></td>
<td>Your proxy: <em>login:password@123.123.123.123:3128</em> <br>You can find more info about proxies <a href="#proxies">here</a></td>
</tr>
<tr data-line="2196">
<td>proxytype</td>
<td><em>String</em></td>
<td><strong>Yes</strong></td>
<td>Type of your proxy: HTTP, HTTPS, SOCKS4, SOCKS5</td>
</tr>
<tr data-line="2197">
<td>json</td>
<td><em>Number</em></td>
<td>No</td>
<td>Set to <code>1</code> to get the response as JSON. Default: <code>0</code></td>
</tr>
</tbody>
</table>
<h5 data-line="2200" id="">Request example</h5>
<p data-line="2202">Endpoint: <code>https://2captcha.com/in.php</code><br>
Method: <code>POST</code></p>

        <details  data-line="2205" class="md-editor-code" open="">
          <summary class="md-editor-code-head">
            <div class="md-editor-code-flag"><span></span><span></span><span></span></div>
            <div class="md-editor-code-action">
              <span class="md-editor-code-lang">json</span>
              <span class="md-editor-copy-button" data-tips="Copy">Copy</span>
              
              <span class="md-editor-collapse-tips"><svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="lucide lucide-circle-chevron-left md-editor-icon"><circle cx="12" cy="12" r="10"/><path d="m14 16-4-4 4-4"/></svg></span>
            </div>
          </summary>
          <pre><code class="language-json" language=json><span class="md-editor-code-block">{
    &quot;key&quot;: &quot;YOUR_API_KEY&quot;,
    &quot;method&quot;: &quot;datadome&quot;,
    &quot;captcha_url&quot;: &quot;https://geo.captcha-delivery.com/captcha/?initialCid=AHrlqAAA...P~XFrBVptk&amp;t=fe&amp;referer=https%3A%2F%2Fhexample.com&amp;s=45239&amp;e=c538be..c510a00ea&quot;,
    &quot;pageurl&quot;: &quot;https://example.com/&quot;,
    &quot;proxy&quot;:&quot;username:password@1.2.3.4:5678&quot;,
    &quot;proxytype&quot;:&quot;http&quot;,
    &quot;userAgent&quot;:&quot;Mozilla/5.0 (Linux; Android 10; K) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/119.0.0.0 Mobile Safari/537.3&quot;,
    &quot;json&quot;: 1
}</span><span rn-wrapper aria-hidden="true"><span></span><span></span><span></span><span></span><span></span><span></span><span></span><span></span><span></span><span></span></span></code></pre>

        </details>
      <p data-line="2218">Request will return the id of your captcha. Use it to get the result.</p>
<p data-line="2221"><strong>Getting the result</strong></p>
<h5 data-line="2223" id="">Request example</h5>
<p data-line="2225">Endpoint: <code>https://2captcha.com/res.php</code><br>
Method: <code>POST</code></p>

        <details  data-line="2228" class="md-editor-code" open="">
          <summary class="md-editor-code-head">
            <div class="md-editor-code-flag"><span></span><span></span><span></span></div>
            <div class="md-editor-code-action">
              <span class="md-editor-code-lang">json</span>
              <span class="md-editor-copy-button" data-tips="Copy">Copy</span>
              
              <span class="md-editor-collapse-tips"><svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="lucide lucide-circle-chevron-left md-editor-icon"><circle cx="12" cy="12" r="10"/><path d="m14 16-4-4 4-4"/></svg></span>
            </div>
          </summary>
          <pre><code class="language-json" language=json><span class="md-editor-code-block">{
    &quot;key&quot;: &quot;YOUR_API_KEY&quot;,
    &quot;action&quot;: &quot;get&quot;,
    &quot;id&quot;: 2122988149,
    &quot;json&quot;: 1
}</span><span rn-wrapper aria-hidden="true"><span></span><span></span><span></span><span></span><span></span><span></span></span></code></pre>

        </details>
      <h5 data-line="2237" id="">Result example</h5>

        <details  data-line="2239" class="md-editor-code" open="">
          <summary class="md-editor-code-head">
            <div class="md-editor-code-flag"><span></span><span></span><span></span></div>
            <div class="md-editor-code-action">
              <span class="md-editor-code-lang">json</span>
              <span class="md-editor-copy-button" data-tips="Copy">Copy</span>
              
              <span class="md-editor-collapse-tips"><svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="lucide lucide-circle-chevron-left md-editor-icon"><circle cx="12" cy="12" r="10"/><path d="m14 16-4-4 4-4"/></svg></span>
            </div>
          </summary>
          <pre><code class="language-json" language=json><span class="md-editor-code-block">{
    &quot;status&quot;: 1,
    &quot;request&quot;: &quot;datadome=G4TdaXfDqz0B..OJDxGGtKDktILJQEDxM; Max-Age=31536000; Domain=.example.com; Path=/; Secure; SameSite=Lax&quot;
}</span><span rn-wrapper aria-hidden="true"><span></span><span></span><span></span><span></span></span></code></pre>

        </details>
      </section>
<section id="audio">
<h4 id="audio-recognition" tabindex="-1" data-line="2252"><a class="header-anchor" href="#audio-recognition">Audio Recognition</a></h4>
<p data-line="2254">We provide a speech recognition method that allows you to convert an audio record to text. The method can be used to bypass audio captchas or to recognize any audio record. The limitations are:</p>
<ul data-line="2256">
<li data-line="2256">Max file size: <strong>1 MB</strong></li>
<li data-line="2257">Audio duration: <strong>not limited</strong></li>
<li data-line="2258">Supported audio format: <strong>mp3 only</strong></li>
<li data-line="2259">Supported speech languages: English, French, German, Greek, Portuguese, Russian</li>
</ul>
<p data-line="2261">The recognition is fully automated and performed by a neural network trained for speech recognition.</p>
<p data-line="2263">To recognize an audio you need to:</p>
<ul data-line="2265">
<li data-line="2265">Encode the mp3 file to base64</li>
<li data-line="2266">Submit a request to our API with the base64 string and the language parameter</li>
</ul>
<p data-line="2268"><strong>Request body example:</strong></p>

        <details  data-line="2270" class="md-editor-code" open="">
          <summary class="md-editor-code-head">
            <div class="md-editor-code-flag"><span></span><span></span><span></span></div>
            <div class="md-editor-code-action">
              <span class="md-editor-code-lang"></span>
              <span class="md-editor-copy-button" data-tips="Copy">Copy</span>
              
              <span class="md-editor-collapse-tips"><svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="lucide lucide-circle-chevron-left md-editor-icon"><circle cx="12" cy="12" r="10"/><path d="m14 16-4-4 4-4"/></svg></span>
            </div>
          </summary>
          <pre><code class="language-" language=><span class="md-editor-code-block">{
&quot;key&quot;:&quot;1abc234de56fab7c89012d34e56fa7b8&quot;,
&quot;method&quot;:&quot;audio&quot;,
&quot;body&quot;:&quot;&quot;,
&quot;lang&quot;:&quot;pt&quot;,
&quot;json&quot;:1
}</span><span rn-wrapper aria-hidden="true"><span></span><span></span><span></span><span></span><span></span><span></span><span></span></span></code></pre>

        </details>
      <p data-line="2279">If everything is OK you will receive the response with your request ID <code>{&quot;status&quot;:1,&quot;request&quot;:&quot;2122988149&quot;}</code> or an <a href="#error_handling">error code</a> if your request was incorrect.</p>
<p data-line="2281">Make a 15-20 seconds timeout then submit a <em>HTTP GET</em> request to our API URL: <code>https://2captcha.com/res.php</code> to get the result.<br>
The full list of parameters is in the <a href="#audio-get">table below</a>.</p>
<p data-line="2284">If audio is already recognized server will return the text in the following format:</p>

        <details  data-line="2286" class="md-editor-code" open="">
          <summary class="md-editor-code-head">
            <div class="md-editor-code-flag"><span></span><span></span><span></span></div>
            <div class="md-editor-code-action">
              <span class="md-editor-code-lang"></span>
              <span class="md-editor-copy-button" data-tips="Copy">Copy</span>
              
              <span class="md-editor-collapse-tips"><svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="lucide lucide-circle-chevron-left md-editor-icon"><circle cx="12" cy="12" r="10"/><path d="m14 16-4-4 4-4"/></svg></span>
            </div>
          </summary>
          <pre><code class="language-" language=><span class="md-editor-code-block">{
&quot;status&quot;: 1,
&quot;request&quot;: &quot;hello world&quot;
}</span><span rn-wrapper aria-hidden="true"><span></span><span></span><span></span><span></span></span></code></pre>

        </details>
      <p data-line="2292">If the recognition process is not finished yet server will return <em>CAPCHA_NOT_READY</em> result. Repeat your request in 5 seconds.</p>
<p data-line="2294">If something went wrong server will return an <a href="#error_handling">error code</a>.</p>
<p data-line="2296">Use the recognition result the way you need it.</p>
<p data-line="2298"><strong>List of request parameters for <a href="https://2captcha.com/in.php">https://2captcha.com/in.php</a></strong></p>
<table data-line="2300">
<thead data-line="2300">
<tr data-line="2300">
<th><strong>Parameter</strong></th>
<th><strong>Type</strong></th>
<th><strong>Required</strong></th>
<th><strong>Description</strong></th>
</tr>
</thead>
<tbody data-line="2302">
<tr data-line="2302">
<td>key</td>
<td>String</td>
<td>Yes</td>
<td><a href="#solving_captchas">your API key</a></td>
</tr>
<tr data-line="2303">
<td>method</td>
<td>String</td>
<td>Yes</td>
<td><code>audio</code> - indicates that you're sending audio</td>
</tr>
<tr data-line="2304">
<td>body</td>
<td>String</td>
<td>Yes</td>
<td>Base64 encoded audio file in mp3 format. Max file size: 1 MB</td>
</tr>
<tr data-line="2305">
<td>lang</td>
<td>String</td>
<td>Yes</td>
<td>The language of audio record. Supported languages are: <code>en, fr, de, el, pt, ru</code>.</td>
</tr>
</tbody>
</table>
<p data-line="2307"><strong>List of request parameters for <a href="https://2captcha.com/res.php">https://2captcha.com/res.php</a></strong></p>
<table data-line="2309">
<thead data-line="2309">
<tr data-line="2309">
<th><strong>GET parameter</strong></th>
<th><strong>Type</strong></th>
<th><strong>Required</strong></th>
<th><strong>Description</strong></th>
</tr>
</thead>
<tbody data-line="2311">
<tr data-line="2311">
<td>key</td>
<td>String</td>
<td>Yes</td>
<td><a href="#solving_captchas">your API key</a></td>
</tr>
<tr data-line="2312">
<td>action</td>
<td>String</td>
<td>Yes</td>
<td>get - get the asnwer for your captcha</td>
</tr>
<tr data-line="2313">
<td>id</td>
<td>Integer</td>
<td>Yes</td>
<td>ID of captcha returned by in.php.</td>
</tr>
<tr data-line="2314">
<td>json</td>
<td>Integer <br>Default: 0</td>
<td>No</td>
<td>0 - server will send the response as plain text <br>1 - tells the server to send the response as JSON</td>
</tr>
</tbody>
</table>
<p data-line="2316"><strong>Request URL example:</strong></p>

        <details  data-line="2318" class="md-editor-code" open="">
          <summary class="md-editor-code-head">
            <div class="md-editor-code-flag"><span></span><span></span><span></span></div>
            <div class="md-editor-code-action">
              <span class="md-editor-code-lang"></span>
              <span class="md-editor-copy-button" data-tips="Copy">Copy</span>
              
              <span class="md-editor-collapse-tips"><svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="lucide lucide-circle-chevron-left md-editor-icon"><circle cx="12" cy="12" r="10"/><path d="m14 16-4-4 4-4"/></svg></span>
            </div>
          </summary>
          <pre><code class="language-" language=><span class="md-editor-code-block">https://2captcha.com/res.php?key=1abc234de56fab7c89012d34e56fa7b8&amp;action=get&amp;id=2122988149</span><span rn-wrapper aria-hidden="true"><span></span></span></code></pre>

        </details>
      </section>
<section id="bounding_box">
<h4 id="bounding-box-method" tabindex="-1" data-line="2323"><a class="header-anchor" href="#bounding-box-method">Bounding Box Method</a></h4>
<p data-line="2325">The method can be used to solve tasks where you need to select a specific object or draw a box around an object shown on an image.</p>
<p data-line="2327">The limitations are:</p>
<ul data-line="2328">
<li data-line="2328">Supported image formats: <strong>JPEG</strong>, <strong>PNG</strong>, <strong>GIF</strong></li>
<li data-line="2329">Max file size: <strong>600 kB</strong></li>
<li data-line="2330">Max image size: <strong>1000px</strong> pixels in height or width</li>
</ul>
<p data-line="2333">To use the Bounding Box method, you must:</p>
<ol data-line="2335">
<li data-line="2335">
<p data-line="2335">Get an image and instructions on which objects to select in the image.</p>
</li>
<li data-line="2337">
<p data-line="2337">Submit a <em>HTTP POST</em> request to our API URL: <code>https://2captcha.com/in.php</code> specify  <em>bounding_box</em> as the value of the parameter <em>method</em>.<br>
Server accepts images in base64 format.</p>
<p data-line="2340">You must be sure to send additional instructions in the form of text or image. As text using the <em>textinstructions</em> parameter, or as an image using the <em>imginstructions</em> parameter.</p>
<p data-line="2342">The full list of parameters is in the table below.</p>
</li>
<li data-line="2344">
<p data-line="2344">Server will return captcha ID or an <a href="#error_handling">error code</a> if something went wrong.</p>
</li>
<li data-line="2346">
<p data-line="2346">Make a 5 seconds timeout and submit a <em>HTTP GET</em> request to our API URL: <code>https://2captcha.com/res.php</code> to get the result.</p>
<p data-line="2348">If the task is completed, the server will return the coordinates of the frame in which the object specified in the description is located, for example: <em>OK|[{&quot;xMin&quot;:559,&quot;xMax&quot;:797,&quot;yMin&quot;:164,&quot;yMax&quot;:430}]</em>. The response contains the coordinates of two points of the rectangle located diagonally. Counting coordinates from the upper-left corner of the image.</p>
<p data-line="2350">If captcha is not solved yet server will return <em>CAPCHA_NOT_READY</em> result. Repeat your request in 5 seconds.</p>
<p data-line="2352">If something went wrong server will return an <a href="#error_handling">error code</a>.</p>
</li>
</ol>
<p data-line="2354"><strong>Base64 sample form for bounding_box method</strong></p>

        <details  data-line="2356" class="md-editor-code" open="">
          <summary class="md-editor-code-head">
            <div class="md-editor-code-flag"><span></span><span></span><span></span></div>
            <div class="md-editor-code-action">
              <span class="md-editor-code-lang"></span>
              <span class="md-editor-copy-button" data-tips="Copy">Copy</span>
              
              <span class="md-editor-collapse-tips"><svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="lucide lucide-circle-chevron-left md-editor-icon"><circle cx="12" cy="12" r="10"/><path d="m14 16-4-4 4-4"/></svg></span>
            </div>
          </summary>
          <pre><code class="language-" language=><span class="md-editor-code-block">&lt;form method=&quot;post&quot; action=&quot;http://2captcha.com/in.php&quot;&gt;
&lt;input type=&quot;hidden&quot; name=&quot;method&quot; value=&quot;bounding_box&quot;&gt;
Your key:
&lt;input type=&quot;text&quot; name=&quot;key&quot; value=&quot;YOUR_APIKEY&quot;&gt;
The body of the bounding_box image in base64 format:
&lt;textarea name=&quot;image&quot;&gt;BASE64_IMAGE&lt;/textarea&gt;
Instructions for markup data:
&lt;input type=&quot;textinstructions&quot; name=&quot;textinstructions&quot; value=&quot;Select cars in the image&quot;&gt;
&lt;input type=&quot;submit&quot; value=&quot;Upload and get ID&quot;&gt;
&lt;/form&gt;</span><span rn-wrapper aria-hidden="true"><span></span><span></span><span></span><span></span><span></span><span></span><span></span><span></span><span></span><span></span></span></code></pre>

        </details>
      <p data-line="2367">The <em>YOUR_APIKEY</em> parameter should be replaced with <a href="#solving_captchas">your API key</a>.</p>
<p data-line="2369"><em>BASE64_IMAGE</em> — the body of the image file encoded in base64 format.</p>
<p data-line="2371"><strong>List of request parameters for <a href="https://2captcha.com/in.php">https://2captcha.com/in.php</a></strong></p>
<table data-line="2373">
<thead data-line="2373">
<tr data-line="2373">
<th><strong>Parameter</strong></th>
<th><strong>Type</strong></th>
<th><strong>Required</strong></th>
<th><strong>Description</strong></th>
</tr>
</thead>
<tbody data-line="2375">
<tr data-line="2375">
<td><strong>key</strong></td>
<td><em>String</em></td>
<td><strong>Yes</strong></td>
<td><a href="#solving_captchas">your API key</a></td>
</tr>
<tr data-line="2376">
<td><strong>method</strong></td>
<td><em>String</em></td>
<td><strong>Yes</strong></td>
<td><code>bounding_box</code></td>
</tr>
<tr data-line="2377">
<td><strong>image</strong></td>
<td><em>String</em></td>
<td><strong>Yes</strong></td>
<td>Image containing data for markup.<br>The image must be encoded in Base64 format.</td>
</tr>
<tr data-line="2378">
<td>textinstructions</td>
<td><em>String</em></td>
<td>Yes*</td>
<td>Text will be shown to worker to help him to select object on the image correctly. <br>For example: Select cars in the image.<br><strong>Optional parameter</strong>, if the instruction already exists in the form of the <code>imginstructions</code>.</td>
</tr>
<tr data-line="2379">
<td>imginstructions</td>
<td><em>String</em></td>
<td>Yes*</td>
<td>Image with instruction for worker to help him to select object on the image correctly. <br>The image must be encoded in Base64 format.<br><strong>Optional parameter</strong>, if the instruction already exists in the form of the <code>textinstructions</code>.</td>
</tr>
<tr data-line="2380">
<td>json</td>
<td><em>Number</em>  <br>Default: 0</td>
<td>No</td>
<td>0 - server will send the response as plain text <br>1 - tells the server to send the response as JSON</td>
</tr>
<tr data-line="2381">
<td>soft_id</td>
<td><em>Number</em></td>
<td>No</td>
<td>ID of software developer. Developers who integrated their software with 2Captcha get reward: 10% of spendings of their software users</td>
</tr>
<tr data-line="2382">
<td>lang</td>
<td><em>String</em></td>
<td>No</td>
<td>Language code. <a href="#language">See the list of supported languages.</a></td>
</tr>
<tr data-line="2383">
<td>can_no_answer</td>
<td>Integer <br>Default: 0</td>
<td>No</td>
<td>0 - not specified <br>1 - possibly there's no objects to select.<br>Set the value to 1 only if it's possible that there's no objects matching the instruction. <br>We'll provide a button &quot;No matching images&quot; to worker and you will receive <em>No_matching_images</em> as answer.</td>
</tr>
<tr data-line="2384">
<td>header_acao</td>
<td><em>Number</em>  <br>Default: 0</td>
<td>No</td>
<td>0 - disabled <br>1 - enabled. <br>If enabled <code>in.php</code> will include <em>Access-Control-Allow-Origin:*</em> header in the response. <br>Used for cross-domain AJAX requests in web applications.</td>
</tr>
<tr data-line="2385">
<td>pingback</td>
<td><em>String</em></td>
<td>No</td>
<td>URL for pingback (callback) response that will be sent when captcha is solved. <br>URL should be registered on the server. <a href="#pingback">More info here</a>.</td>
</tr>
</tbody>
</table>
<p data-line="2387"><strong>List of request parameters for <a href="https://2captcha.com/res.php">https://2captcha.com/res.php</a></strong></p>
<table data-line="2389">
<thead data-line="2389">
<tr data-line="2389">
<th><strong>GET parameter</strong></th>
<th><strong>Type</strong></th>
<th><strong>Required</strong></th>
<th><strong>Description</strong></th>
</tr>
</thead>
<tbody data-line="2391">
<tr data-line="2391">
<td><strong>key</strong></td>
<td><em>String</em></td>
<td><strong>Yes</strong></td>
<td><a href="#solving_captchas">your API key</a></td>
</tr>
<tr data-line="2392">
<td><strong>action</strong></td>
<td><em>String</em></td>
<td><strong>Yes</strong></td>
<td><code>get</code> - get the asnwer for your captcha</td>
</tr>
<tr data-line="2393">
<td><strong>id</strong></td>
<td><em>Number</em></td>
<td><strong>Yes</strong></td>
<td>ID of captcha returned by in.php.</td>
</tr>
<tr data-line="2394">
<td>json</td>
<td><em>Number</em>  <br>Default: 0</td>
<td>No</td>
<td>0 - server will send the response as plain text <br>1 - tells the server to send the response as JSON</td>
</tr>
<tr data-line="2395">
<td>header_acao</td>
<td><em>Number</em>  <br>Default: 0</td>
<td>No</td>
<td>0 - disabled <br>1 - enabled. <br>If enabled <code>in.php</code> will include <em>Access-Control-Allow-Origin:*</em> header in the response. <br>Used for cross-domain AJAX requests in web applications.</td>
</tr>
</tbody>
</table>
<h5 data-line="2397" id="">Request example</h5>
<p data-line="2399">Endpoint: <code>https://2captcha.com/in.php</code><br>
Method: <code>POST</code></p>

        <details  data-line="2402" class="md-editor-code" open="">
          <summary class="md-editor-code-head">
            <div class="md-editor-code-flag"><span></span><span></span><span></span></div>
            <div class="md-editor-code-action">
              <span class="md-editor-code-lang">json</span>
              <span class="md-editor-copy-button" data-tips="Copy">Copy</span>
              
              <span class="md-editor-collapse-tips"><svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="lucide lucide-circle-chevron-left md-editor-icon"><circle cx="12" cy="12" r="10"/><path d="m14 16-4-4 4-4"/></svg></span>
            </div>
          </summary>
          <pre><code class="language-json" language=json><span class="md-editor-code-block">{
    &quot;key&quot;: &quot;YOUR_API_KEY&quot;,
    &quot;method&quot;: &quot;bounding_box&quot;,
    &quot;image&quot;: &quot;/9j/4AAQSkZJRgABAQEAYABgAAD//gA7Q1JFQVRPUjogZ2Q...&quot;,
    &quot;textinstructions&quot;: &quot;Select cars in the image&quot;,
    &quot;json&quot;: 1
}</span><span rn-wrapper aria-hidden="true"><span></span><span></span><span></span><span></span><span></span><span></span><span></span></span></code></pre>

        </details>
      <p data-line="2412">Request will return the id of your captcha. Use it to get the result.</p>
<p data-line="2414"><strong>Getting the result</strong></p>
<h5 data-line="2416" id="">Request example</h5>
<p data-line="2418">Endpoint: <code>https://2captcha.com/res.php</code><br>
Method: <code>POST</code></p>

        <details  data-line="2421" class="md-editor-code" open="">
          <summary class="md-editor-code-head">
            <div class="md-editor-code-flag"><span></span><span></span><span></span></div>
            <div class="md-editor-code-action">
              <span class="md-editor-code-lang">json</span>
              <span class="md-editor-copy-button" data-tips="Copy">Copy</span>
              
              <span class="md-editor-collapse-tips"><svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="lucide lucide-circle-chevron-left md-editor-icon"><circle cx="12" cy="12" r="10"/><path d="m14 16-4-4 4-4"/></svg></span>
            </div>
          </summary>
          <pre><code class="language-json" language=json><span class="md-editor-code-block">{
    &quot;key&quot;: &quot;YOUR_API_KEY&quot;,
    &quot;action&quot;: &quot;get&quot;,
    &quot;id&quot;: 2122988149,
    &quot;json&quot;: 1
}</span><span rn-wrapper aria-hidden="true"><span></span><span></span><span></span><span></span><span></span><span></span></span></code></pre>

        </details>
      <h5 data-line="2430" id="">Result example</h5>

        <details  data-line="2432" class="md-editor-code" open="">
          <summary class="md-editor-code-head">
            <div class="md-editor-code-flag"><span></span><span></span><span></span></div>
            <div class="md-editor-code-action">
              <span class="md-editor-code-lang">json</span>
              <span class="md-editor-copy-button" data-tips="Copy">Copy</span>
              
              <span class="md-editor-collapse-tips"><svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="lucide lucide-circle-chevron-left md-editor-icon"><circle cx="12" cy="12" r="10"/><path d="m14 16-4-4 4-4"/></svg></span>
            </div>
          </summary>
          <pre><code class="language-json" language=json><span class="md-editor-code-block">{
    &quot;status&quot;: 1,
    &quot;request&quot;: &quot;[{\&quot;xMin\&quot;:100,\&quot;xMax\&quot;:316,\&quot;yMin\&quot;:66,\&quot;yMax\&quot;:210}]&quot;
}</span><span rn-wrapper aria-hidden="true"><span></span><span></span><span></span><span></span></span></code></pre>

        </details>
      </section>
<section id="prosopo-procaptcha">
<h4 id="prosopo-procaptcha" tabindex="-1" data-line="2443"><a class="header-anchor" href="#prosopo-procaptcha">Prosopo Procaptcha</a></h4>
<p data-line="2445">Token-based method for automated solving of Prosopo Procaptcha.</p>
<p data-line="2447"><strong>Method specification</strong></p>
<table data-line="2449">
<thead data-line="2449">
<tr data-line="2449">
<th><strong>Parameter</strong></th>
<th><strong>Type</strong></th>
<th><strong>Required</strong></th>
<th><strong>Description</strong></th>
</tr>
</thead>
<tbody data-line="2451">
<tr data-line="2451">
<td><strong>key</strong></td>
<td><em>String</em></td>
<td><strong>Yes</strong></td>
<td><a href="#solving_captchas">your API key</a></td>
</tr>
<tr data-line="2452">
<td><strong>method</strong></td>
<td><em>String</em></td>
<td><strong>Yes</strong></td>
<td><code>prosopo</code></td>
</tr>
<tr data-line="2453">
<td><strong>sitekey</strong></td>
<td><em>String</em></td>
<td><strong>Yes</strong></td>
<td>The value of <code>siteKey</code> parameter found on the page</td>
</tr>
<tr data-line="2454">
<td><strong>pageurl</strong></td>
<td><em>String</em></td>
<td><strong>Yes</strong></td>
<td>The full URL of target web page where the captcha is loaded. We do not open the page, not a problem if it is available only for authenticated users</td>
</tr>
<tr data-line="2455">
<td>proxy</td>
<td><em>String</em></td>
<td>No</td>
<td>Your proxy: <em>login:password@123.123.123.123:3128</em> <br>You can find more info about proxies <a href="#proxies">here</a></td>
</tr>
<tr data-line="2456">
<td>proxytype</td>
<td><em>String</em></td>
<td>No</td>
<td>Type of your proxy: HTTP, HTTPS, SOCKS4, SOCKS5</td>
</tr>
<tr data-line="2457">
<td>json</td>
<td><em>Number</em></td>
<td>No</td>
<td>Set to <code>1</code> to get the response as JSON. Default: <code>0</code></td>
</tr>
</tbody>
</table>
<h5 data-line="2460" id="">Request example</h5>
<p data-line="2462">Endpoint: <code>https://2captcha.com/in.php</code><br>
Method: <code>POST</code></p>

        <details  data-line="2465" class="md-editor-code" open="">
          <summary class="md-editor-code-head">
            <div class="md-editor-code-flag"><span></span><span></span><span></span></div>
            <div class="md-editor-code-action">
              <span class="md-editor-code-lang">json</span>
              <span class="md-editor-copy-button" data-tips="Copy">Copy</span>
              
              <span class="md-editor-collapse-tips"><svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="lucide lucide-circle-chevron-left md-editor-icon"><circle cx="12" cy="12" r="10"/><path d="m14 16-4-4 4-4"/></svg></span>
            </div>
          </summary>
          <pre><code class="language-json" language=json><span class="md-editor-code-block">{
    &quot;key&quot;: &quot;YOUR_API_KEY&quot;,
    &quot;method&quot;: &quot;prosopo&quot;,
    &quot;sitekey&quot;: &quot;5EPQoMZEDc5LpN7gtxMMzYPTzA6UeWqL2stk1rso9gy4Ahqt&quot;,
    &quot;pageurl&quot;: &quot;https://www.example.com/&quot;,
    &quot;json&quot;: 1
}</span><span rn-wrapper aria-hidden="true"><span></span><span></span><span></span><span></span><span></span><span></span><span></span></span></code></pre>

        </details>
      <p data-line="2475">Request will return the id of your captcha. Use it to get the result.</p>
<p data-line="2478"><strong>Getting the result</strong></p>
<h5 data-line="2480" id="">Request example</h5>
<p data-line="2482">Endpoint: <code>https://2captcha.com/res.php</code><br>
Method: <code>POST</code></p>

        <details  data-line="2485" class="md-editor-code" open="">
          <summary class="md-editor-code-head">
            <div class="md-editor-code-flag"><span></span><span></span><span></span></div>
            <div class="md-editor-code-action">
              <span class="md-editor-code-lang">json</span>
              <span class="md-editor-copy-button" data-tips="Copy">Copy</span>
              
              <span class="md-editor-collapse-tips"><svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="lucide lucide-circle-chevron-left md-editor-icon"><circle cx="12" cy="12" r="10"/><path d="m14 16-4-4 4-4"/></svg></span>
            </div>
          </summary>
          <pre><code class="language-json" language=json><span class="md-editor-code-block">{
    &quot;key&quot;: &quot;YOUR_API_KEY&quot;,
    &quot;action&quot;: &quot;get&quot;,
    &quot;id&quot;: 2122988149,
    &quot;json&quot;: 1
}</span><span rn-wrapper aria-hidden="true"><span></span><span></span><span></span><span></span><span></span><span></span></span></code></pre>

        </details>
      <h5 data-line="2494" id="">Result example</h5>

        <details  data-line="2496" class="md-editor-code" open="">
          <summary class="md-editor-code-head">
            <div class="md-editor-code-flag"><span></span><span></span><span></span></div>
            <div class="md-editor-code-action">
              <span class="md-editor-code-lang">json</span>
              <span class="md-editor-copy-button" data-tips="Copy">Copy</span>
              
              <span class="md-editor-collapse-tips"><svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="lucide lucide-circle-chevron-left md-editor-icon"><circle cx="12" cy="12" r="10"/><path d="m14 16-4-4 4-4"/></svg></span>
            </div>
          </summary>
          <pre><code class="language-json" language=json><span class="md-editor-code-block">{
    &quot;status&quot;: 1,
    &quot;request&quot;: &quot;0x00016c68747470733a2f2f70726f6e6f6465372e70726f736f706f2e696fc0354550516f4d5a454463354c704e376774784d4d7a5950547a4136556557714c...&quot;
}</span><span rn-wrapper aria-hidden="true"><span></span><span></span><span></span><span></span></span></code></pre>

        </details>
      </section>
<section id="captchafox">
<h4 id="captchafox" tabindex="-1" data-line="2508"><a class="header-anchor" href="#captchafox">CaptchaFox</a></h4>
<p data-line="2510">A token-based method for automatically solving CaptchaFox captchas.</p>
<p data-line="2512"><strong>Method specification</strong></p>
<table data-line="2514">
<thead data-line="2514">
<tr data-line="2514">
<th><strong>Parameter</strong></th>
<th><strong>Type</strong></th>
<th><strong>Required</strong></th>
<th><strong>Description</strong></th>
</tr>
</thead>
<tbody data-line="2516">
<tr data-line="2516">
<td><strong>key</strong></td>
<td><em>String</em></td>
<td><strong>Yes</strong></td>
<td><a href="#solving_captchas">Your API key</a></td>
</tr>
<tr data-line="2517">
<td><strong>method</strong></td>
<td><em>String</em></td>
<td><strong>Yes</strong></td>
<td><code>captchafox</code></td>
</tr>
<tr data-line="2518">
<td><strong>sitekey</strong></td>
<td><em>String</em></td>
<td><strong>Yes</strong></td>
<td>The value of the <code>sitekey</code> parameter found on the page or captured in network requests.</td>
</tr>
<tr data-line="2519">
<td><strong>pageurl</strong></td>
<td><em>String</em></td>
<td><strong>Yes</strong></td>
<td>The full URL of the page containing the captcha.</td>
</tr>
<tr data-line="2520">
<td><strong>proxy</strong></td>
<td><em>String</em></td>
<td><strong>Yes</strong></td>
<td>Your proxy in the format: <em>login:password@123.123.123.123:3128</em> <br><a href="#proxies">Learn more</a></td>
</tr>
<tr data-line="2521">
<td><strong>proxytype</strong></td>
<td><em>String</em></td>
<td><strong>Yes</strong></td>
<td>Proxy type: <code>HTTP</code>, <code>HTTPS</code>, <code>SOCKS4</code>, <code>SOCKS5</code></td>
</tr>
<tr data-line="2522">
<td><strong>useragent</strong></td>
<td><em>String</em></td>
<td><strong>Yes</strong></td>
<td>The <code>User-Agent</code> of the browser used to access the page with the captcha.</td>
</tr>
<tr data-line="2523">
<td>json</td>
<td><em>Integer</em></td>
<td>No</td>
<td>Pass <code>1</code> to receive the response in JSON format. <br> Default: <code>0</code></td>
</tr>
</tbody>
</table>
<h5 data-line="2525" id="">Request example</h5>
<p data-line="2527"><strong>Endpoint:</strong> <code>https://2captcha.com/in.php</code><br>
<strong>Method:</strong> <code>POST</code></p>

        <details  data-line="2530" class="md-editor-code" open="">
          <summary class="md-editor-code-head">
            <div class="md-editor-code-flag"><span></span><span></span><span></span></div>
            <div class="md-editor-code-action">
              <span class="md-editor-code-lang">json</span>
              <span class="md-editor-copy-button" data-tips="Copy">Copy</span>
              
              <span class="md-editor-collapse-tips"><svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="lucide lucide-circle-chevron-left md-editor-icon"><circle cx="12" cy="12" r="10"/><path d="m14 16-4-4 4-4"/></svg></span>
            </div>
          </summary>
          <pre><code class="language-json" language=json><span class="md-editor-code-block">{
  &quot;key&quot;: &quot;YOUR_API_KEY&quot;,
  &quot;method&quot;: &quot;captchafox&quot;,
  &quot;sitekey&quot;: &quot;sk_xtNxpk6fCdFbxh1_xJeGflSdCE9tn99G&quot;,
  &quot;pageurl&quot;: &quot;https://mysite.com/page/with/captchafox&quot;,
  &quot;proxy&quot;: &quot;login:password@1.2.3.4:8080&quot;,
  &quot;proxytype&quot;: &quot;http&quot;,
  &quot;useragent&quot;: &quot;Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/115.0.0.0 Safari/537.36&quot;,
  &quot;json&quot;: 1
}</span><span rn-wrapper aria-hidden="true"><span></span><span></span><span></span><span></span><span></span><span></span><span></span><span></span><span></span><span></span></span></code></pre>

        </details>
      <p data-line="2543">The request will return the ID of your captcha task, which should be used to retrieve the solution.</p>
<hr data-line="2545">
<h4 id="get-task-result" tabindex="-1" data-line="2547"><a class="header-anchor" href="#get-task-result">Get task result</a></h4>
<h5 data-line="2549" id="">Request example</h5>
<p data-line="2551">Endpoint: <code>https://2captcha.com/res.php</code><br>
Method: <code>POST</code></p>

        <details  data-line="2554" class="md-editor-code" open="">
          <summary class="md-editor-code-head">
            <div class="md-editor-code-flag"><span></span><span></span><span></span></div>
            <div class="md-editor-code-action">
              <span class="md-editor-code-lang">json</span>
              <span class="md-editor-copy-button" data-tips="Copy">Copy</span>
              
              <span class="md-editor-collapse-tips"><svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="lucide lucide-circle-chevron-left md-editor-icon"><circle cx="12" cy="12" r="10"/><path d="m14 16-4-4 4-4"/></svg></span>
            </div>
          </summary>
          <pre><code class="language-json" language=json><span class="md-editor-code-block">{
    &quot;key&quot;: &quot;YOUR_API_KEY&quot;,
    &quot;action&quot;: &quot;get&quot;,
    &quot;id&quot;: 2122988149,
    &quot;json&quot;: 1
}</span><span rn-wrapper aria-hidden="true"><span></span><span></span><span></span><span></span><span></span><span></span></span></code></pre>

        </details>
      <h5 data-line="2563" id="">Response example</h5>

        <details  data-line="2565" class="md-editor-code" open="">
          <summary class="md-editor-code-head">
            <div class="md-editor-code-flag"><span></span><span></span><span></span></div>
            <div class="md-editor-code-action">
              <span class="md-editor-code-lang">json</span>
              <span class="md-editor-copy-button" data-tips="Copy">Copy</span>
              
              <span class="md-editor-collapse-tips"><svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="lucide lucide-circle-chevron-left md-editor-icon"><circle cx="12" cy="12" r="10"/><path d="m14 16-4-4 4-4"/></svg></span>
            </div>
          </summary>
          <pre><code class="language-json" language=json><span class="md-editor-code-block">{
    &quot;status&quot;: 1,
    &quot;request&quot;: &quot;177f50c25b845601e5c779cdb51b040d523e8ab69efb4d5b343e28df07d05076&quot;
}</span><span rn-wrapper aria-hidden="true"><span></span><span></span><span></span><span></span></span></code></pre>

        </details>
      </section>
<section id="vkcaptcha">
<h4 id="vk-captcha" tabindex="-1" data-line="2577"><a class="header-anchor" href="#vk-captcha">VK Captcha</a></h4>
<p data-line="2579">We offer two methods to solve this type of captcha - token-based and image-based.</p>
<p data-line="2581"><strong>Image-based method method specification</strong></p>
<p data-line="2583">We use the <code>body</code> (image in base64 format)  or <code>file</code> (image as file) and <code>steps</code> parameters.<br>
You can get both values from the response to the request <a href="https://api.vk.com/method/captchaNotRobot.getContent?v=%7BAPI_VER%7D">https://api.vk.com/method/captchaNotRobot.getContent?v={API_VER}</a> when loading the captcha widget on the page.</p>
<table data-line="2586">
<thead data-line="2586">
<tr data-line="2586">
<th><strong>Parameter</strong></th>
<th><strong>Type</strong></th>
<th><strong>Required</strong></th>
<th><strong>Description</strong></th>
</tr>
</thead>
<tbody data-line="2588">
<tr data-line="2588">
<td><strong>key</strong></td>
<td><em>String</em></td>
<td><strong>Yes</strong></td>
<td><a href="#solving_captchas">your API key</a></td>
</tr>
<tr data-line="2589">
<td><strong>method</strong></td>
<td><em>String</em></td>
<td><strong>Yes</strong></td>
<td><code>vkimage</code></td>
</tr>
<tr data-line="2590">
<td><strong>file</strong></td>
<td><em>String</em></td>
<td><strong>Yes</strong></td>
<td>Captcha image as file. The request must include <code>body</code> or <code>file</code>.</td>
</tr>
<tr data-line="2591">
<td><strong>body</strong></td>
<td><em>String</em></td>
<td><strong>Yes</strong></td>
<td>Base64-encoded captcha image. The request must include <code>body</code> or <code>file</code>.</td>
</tr>
<tr data-line="2592">
<td><strong>steps</strong></td>
<td><em>String</em></td>
<td><strong>Yes</strong></td>
<td>Array of steps</td>
</tr>
<tr data-line="2593">
<td>json</td>
<td><em>Integer</em></td>
<td>No</td>
<td>Set to <code>1</code> to get the response as JSON. Default: <code>0</code></td>
</tr>
</tbody>
</table>
<h5 data-line="2595" id="">Request examples</h5>
<p data-line="2597">Endpoint: <code>https://2captcha.com/in.php</code><br>
Method: <code>POST</code></p>

        <details  data-line="2600" class="md-editor-code" open="">
          <summary class="md-editor-code-head">
            <div class="md-editor-code-flag"><span></span><span></span><span></span></div>
            <div class="md-editor-code-action">
              <span class="md-editor-code-lang">json</span>
              <span class="md-editor-copy-button" data-tips="Copy">Copy</span>
              
              <span class="md-editor-collapse-tips"><svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="lucide lucide-circle-chevron-left md-editor-icon"><circle cx="12" cy="12" r="10"/><path d="m14 16-4-4 4-4"/></svg></span>
            </div>
          </summary>
          <pre><code class="language-json" language=json><span class="md-editor-code-block">{
 &quot;key&quot;: &quot;YOUR_API_KEY&quot;,
 &quot;method&quot;: &quot;vkimage&quot;,
 &quot;body&quot;: &quot;/9j/4AAQSkZJRgABAQAAAQABAAD/2wBDAAgGBgcGBQgHBwcJCQgKDBQNDAsLDBkSEw8UHRofHh0aHBwgJC4nICIsIxwcKDcpLDAxNDQ0Hyc...&quot;,
 &quot;steps&quot;: &quot;[5,19,14,14,6,4,8,9,23,23,14,23,3,13,16,8,2,4,6...11,8,4,15,0,18,16,19,4,19,20,21,22,16,10,20,12,19,5,23,24,8]&quot;,
 &quot;json&quot;: 1
}</span><span rn-wrapper aria-hidden="true"><span></span><span></span><span></span><span></span><span></span><span></span><span></span></span></code></pre>

        </details>
      <p data-line="2610">The query will return the ID of your captcha, which should be used to get the result.</p>
<p data-line="2612"><strong>Getting the result</strong></p>
<h5 data-line="2614" id="">Request example</h5>
<p data-line="2616">Endpoint: <code>https://2captcha.com/res.php</code><br>
Method: <code>GET</code></p>

        <details  data-line="2619" class="md-editor-code" open="">
          <summary class="md-editor-code-head">
            <div class="md-editor-code-flag"><span></span><span></span><span></span></div>
            <div class="md-editor-code-action">
              <span class="md-editor-code-lang">json</span>
              <span class="md-editor-copy-button" data-tips="Copy">Copy</span>
              
              <span class="md-editor-collapse-tips"><svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="lucide lucide-circle-chevron-left md-editor-icon"><circle cx="12" cy="12" r="10"/><path d="m14 16-4-4 4-4"/></svg></span>
            </div>
          </summary>
          <pre><code class="language-json" language=json><span class="md-editor-code-block">{
  &quot;key&quot;: &quot;YOUR_API_KEY&quot;,
  &quot;action&quot;: &quot;get&quot;,
  &quot;id&quot;: 2122988149,
  &quot;json&quot;: 1
}</span><span rn-wrapper aria-hidden="true"><span></span><span></span><span></span><span></span><span></span><span></span></span></code></pre>

        </details>
      <h5 data-line="2628" id="">Result example</h5>

        <details  data-line="2630" class="md-editor-code" open="">
          <summary class="md-editor-code-head">
            <div class="md-editor-code-flag"><span></span><span></span><span></span></div>
            <div class="md-editor-code-action">
              <span class="md-editor-code-lang">json</span>
              <span class="md-editor-copy-button" data-tips="Copy">Copy</span>
              
              <span class="md-editor-collapse-tips"><svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="lucide lucide-circle-chevron-left md-editor-icon"><circle cx="12" cy="12" r="10"/><path d="m14 16-4-4 4-4"/></svg></span>
            </div>
          </summary>
          <pre><code class="language-json" language=json><span class="md-editor-code-block">{
    &quot;status&quot;: 1,
    &quot;request&quot;: {
        &quot;best_step&quot;: 27,
        &quot;preview&quot;: &quot;/9j/4AAQSkZJRgABAQAAAQABAAD/...ioGFFFFMD/2Q==&quot;,
        &quot;solution&quot;: [
            18,
            1,
            11,
            6,
            ...
            7,
            2,
            16
        ],
        &quot;answer&quot;: &quot;eyJ2YWx1ZSI6WzE4LDEsMTEsNiwzLDIsMTAsMTksNSwxOSwxNywzLDE0LDIzLDE3LDIwLDcsMCwyMCwyMywxMSwxNSwyMSwyMCwxNSwxMCwxMiw3LDksMTYsMTksMiwxMywzLDIzLDQsMTQsMSwyMCwyNCwyMSwxOCwzLDE4LDQsMTksOSw3LDIzLDE0LDE0LDcsMiwxNl19&quot;
    }
}</span><span rn-wrapper aria-hidden="true"><span></span><span></span><span></span><span></span><span></span><span></span><span></span><span></span><span></span><span></span><span></span><span></span><span></span><span></span><span></span><span></span><span></span><span></span></span></code></pre>

        </details>
      <p data-line="2651"><code>best_step</code> - the number of steps you need to pass to solve the captcha, you can use this value to move the slider<br>
<code>solution</code> - the list of steps passed to solve the captcha<br>
<code>answer</code> - the <code>solution</code> in proper API format, use it to interact with the target website API<br>
<code>preview</code> - is the base64 image showing the result of performing steps from the <code>solution</code></p>
<p data-line="2657"><strong>Token-based method specification</strong></p>
<p data-line="2659">Token-based method requires <code>redirect_uri</code> parameter, as well as proxy and userAgent. The value of the <code>redirect_uri</code> parameter can be found in the response to requests to the VK API that return captchas.</p>
<table data-line="2661">
<thead data-line="2661">
<tr data-line="2661">
<th><strong>Parameter</strong></th>
<th><strong>Type</strong></th>
<th><strong>Required</strong></th>
<th><strong>Description</strong></th>
</tr>
</thead>
<tbody data-line="2663">
<tr data-line="2663">
<td><strong>key</strong></td>
<td><em>String</em></td>
<td><strong>Yes</strong></td>
<td><a href="#solving_captchas">Ваш API-ключ</a></td>
</tr>
<tr data-line="2664">
<td><strong>method</strong></td>
<td><em>String</em></td>
<td><strong>Yes</strong></td>
<td><code>vkcaptcha</code></td>
</tr>
<tr data-line="2665">
<td><strong>redirect_uri</strong></td>
<td><em>String</em></td>
<td><strong>Yes</strong></td>
<td>The URL that is returned on requests to the captcha API.</td>
</tr>
<tr data-line="2666">
<td><strong>userAgent</strong></td>
<td><em>String</em></td>
<td><strong>Yes</strong></td>
<td>Your User-Agent that will be passed to our worker and used to solve the captcha.</td>
</tr>
<tr data-line="2667">
<td>proxy</td>
<td><em>String</em></td>
<td><strong>Yes</strong></td>
<td>Your proxy: <em>login:password@123.123.123.123:3128</em> <br>You can find more info about proxies <a href="#proxies">here</a></td>
</tr>
<tr data-line="2668">
<td>proxytype</td>
<td><em>String</em></td>
<td><strong>Yes</strong></td>
<td>Type of your proxy: HTTP, HTTPS, SOCKS4, SOCKS5</td>
</tr>
<tr data-line="2669">
<td>json</td>
<td><em>Integer</em></td>
<td>No</td>
<td>Set to <code>1</code> to get the response as JSON. Default: <code>0</code></td>
</tr>
</tbody>
</table>
<h5 data-line="2671" id="">Request examples</h5>
<p data-line="2673">Endpoint: <code>https://2captcha.com/in.php</code><br>
Method: <code>POST</code></p>

        <details  data-line="2676" class="md-editor-code" open="">
          <summary class="md-editor-code-head">
            <div class="md-editor-code-flag"><span></span><span></span><span></span></div>
            <div class="md-editor-code-action">
              <span class="md-editor-code-lang">json</span>
              <span class="md-editor-copy-button" data-tips="Copy">Copy</span>
              
              <span class="md-editor-collapse-tips"><svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="lucide lucide-circle-chevron-left md-editor-icon"><circle cx="12" cy="12" r="10"/><path d="m14 16-4-4 4-4"/></svg></span>
            </div>
          </summary>
          <pre><code class="language-json" language=json><span class="md-editor-code-block">{
  &quot;type&quot;: &quot;vkcaptcha&quot;,
  &quot;redirect_uri&quot;: &quot;https://id.vk.com/not_robot_captcha?domain=vk.com&amp;session_token=eyJ....HGsc5B4LyvjA&amp;variant=popup&amp;blank=1&quot;,
  &quot;userAgent&quot;: &quot;Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/115.0.0.0 Safari/537.36&quot;,
  &quot;proxyType&quot;: &quot;http&quot;,
  &quot;proxyAddress&quot;: &quot;1.2.3.4&quot;,
  &quot;proxyPort&quot;: &quot;8080&quot;,
  &quot;proxyLogin&quot;: &quot;user23&quot;,
  &quot;proxyPassword&quot;: &quot;p4$w0rd&quot;        
}</span><span rn-wrapper aria-hidden="true"><span></span><span></span><span></span><span></span><span></span><span></span><span></span><span></span><span></span><span></span></span></code></pre>

        </details>
      <p data-line="2690">The query will return the ID of your captcha, which should be used to get the result.</p>
<p data-line="2692"><strong>Getting the result</strong></p>
<h5 data-line="2694" id="">Request example</h5>
<p data-line="2696">Endpoint: <code>https://2captcha.com/res.php</code><br>
Method: <code>POST</code></p>

        <details  data-line="2699" class="md-editor-code" open="">
          <summary class="md-editor-code-head">
            <div class="md-editor-code-flag"><span></span><span></span><span></span></div>
            <div class="md-editor-code-action">
              <span class="md-editor-code-lang">json</span>
              <span class="md-editor-copy-button" data-tips="Copy">Copy</span>
              
              <span class="md-editor-collapse-tips"><svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="lucide lucide-circle-chevron-left md-editor-icon"><circle cx="12" cy="12" r="10"/><path d="m14 16-4-4 4-4"/></svg></span>
            </div>
          </summary>
          <pre><code class="language-json" language=json><span class="md-editor-code-block">{
  &quot;key&quot;: &quot;YOUR_API_KEY&quot;,
  &quot;id&quot;: 2122988149
}</span><span rn-wrapper aria-hidden="true"><span></span><span></span><span></span><span></span></span></code></pre>

        </details>
      <h5 data-line="2706" id="">Result example</h5>

        <details  data-line="2708" class="md-editor-code" open="">
          <summary class="md-editor-code-head">
            <div class="md-editor-code-flag"><span></span><span></span><span></span></div>
            <div class="md-editor-code-action">
              <span class="md-editor-code-lang">json</span>
              <span class="md-editor-copy-button" data-tips="Copy">Copy</span>
              
              <span class="md-editor-collapse-tips"><svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="lucide lucide-circle-chevron-left md-editor-icon"><circle cx="12" cy="12" r="10"/><path d="m14 16-4-4 4-4"/></svg></span>
            </div>
          </summary>
          <pre><code class="language-json" language=json><span class="md-editor-code-block">{
    &quot;errorId&quot;: 0,
    &quot;status&quot;: &quot;ready&quot;,
    &quot;solution&quot;: {
        &quot;token&quot;:&quot;eyJhbG...kyAWZSNoJPw&quot;
    },
    &quot;cost&quot;: &quot;0.00145&quot;,
    &quot;ip&quot;: &quot;1.2.3.4&quot;,
    &quot;createTime&quot;: 1692863536,
    &quot;endTime&quot;: 1692863556,
    &quot;solveCount&quot;: 1
}</span><span rn-wrapper aria-hidden="true"><span></span><span></span><span></span><span></span><span></span><span></span><span></span><span></span><span></span><span></span><span></span><span></span></span></code></pre>

        </details>
      <p data-line="2722">Use the token to interact with the target website.</p>
</section>
<section id="temucaptcha">
<h4 id="temu-captcha" tabindex="-1" data-line="2727"><a class="header-anchor" href="#temu-captcha">Temu Captcha</a></h4>
<p data-line="2729">Method for solving Temu CAPTCHA using a CAPTCHA image.</p>
<p data-line="2731"><strong>Image-based method method specification</strong></p>
<p data-line="2733">We use the <code>body</code> (image in base64 format) and <code>parts</code> (images of the response parts that need to be moved) that you send us.<br>
You need to get all the images and convert them to base64 format.</p>
<table data-line="2737">
<thead data-line="2737">
<tr data-line="2737">
<th><strong>Parameter</strong></th>
<th><strong>Type</strong></th>
<th><strong>Required</strong></th>
<th><strong>Description</strong></th>
</tr>
</thead>
<tbody data-line="2739">
<tr data-line="2739">
<td><strong>key</strong></td>
<td><em>String</em></td>
<td><strong>Yes</strong></td>
<td><a href="#solving_captchas">your API key</a></td>
</tr>
<tr data-line="2740">
<td><strong>method</strong></td>
<td><em>String</em></td>
<td><strong>Yes</strong></td>
<td><code>temuimage</code></td>
</tr>
<tr data-line="2741">
<td><strong>body</strong></td>
<td><em>String</em></td>
<td><strong>Yes</strong></td>
<td>The main base64-encoded captcha image.</td>
</tr>
<tr data-line="2742">
<td><strong>part1</strong></td>
<td><em>String</em></td>
<td><strong>Yes</strong></td>
<td>The part of puzzle</td>
</tr>
<tr data-line="2743">
<td><strong>part2</strong></td>
<td><em>String</em></td>
<td><strong>Yes</strong></td>
<td>The part of puzzle</td>
</tr>
<tr data-line="2744">
<td><strong>part3</strong></td>
<td><em>String</em></td>
<td><strong>Yes</strong></td>
<td>The part of puzzle</td>
</tr>
<tr data-line="2745">
<td>json</td>
<td><em>Integer</em></td>
<td>No</td>
<td>Set to <code>1</code> to get the response as JSON. Default: <code>0</code></td>
</tr>
</tbody>
</table>
<h5 data-line="2747" id="">Request examples</h5>
<p data-line="2749">Endpoint: <code>https://2captcha.com/in.php</code><br>
Method: <code>POST</code></p>

        <details  data-line="2752" class="md-editor-code" open="">
          <summary class="md-editor-code-head">
            <div class="md-editor-code-flag"><span></span><span></span><span></span></div>
            <div class="md-editor-code-action">
              <span class="md-editor-code-lang">json</span>
              <span class="md-editor-copy-button" data-tips="Copy">Copy</span>
              
              <span class="md-editor-collapse-tips"><svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="lucide lucide-circle-chevron-left md-editor-icon"><circle cx="12" cy="12" r="10"/><path d="m14 16-4-4 4-4"/></svg></span>
            </div>
          </summary>
          <pre><code class="language-json" language=json><span class="md-editor-code-block">{
 &quot;key&quot;: &quot;YOUR_API_KEY&quot;,
 &quot;method&quot;: &quot;temuimage&quot;,
 &quot;body&quot;: &quot;data:image/png;base64,iVBORw0KG...&quot;,
 &quot;part1&quot;: &quot;data:image/png;base64,iVBORw0KG...&quot;,
 &quot;part2&quot;: &quot;data:image/png;base64,iVBORw0KG...&quot;,
 &quot;part3&quot;: &quot;data:image/png;base64,iVBORw0KG...&quot;,
 &quot;json&quot;: 1
}</span><span rn-wrapper aria-hidden="true"><span></span><span></span><span></span><span></span><span></span><span></span><span></span><span></span><span></span></span></code></pre>

        </details>
      <p data-line="2764">The query will return the ID of your captcha, which should be used to get the result.</p>
<p data-line="2766"><strong>Getting the result</strong></p>
<h5 data-line="2768" id="">Request example</h5>
<p data-line="2770">Endpoint: <code>https://2captcha.com/res.php</code><br>
Method: <code>GET</code></p>

        <details  data-line="2773" class="md-editor-code" open="">
          <summary class="md-editor-code-head">
            <div class="md-editor-code-flag"><span></span><span></span><span></span></div>
            <div class="md-editor-code-action">
              <span class="md-editor-code-lang">json</span>
              <span class="md-editor-copy-button" data-tips="Copy">Copy</span>
              
              <span class="md-editor-collapse-tips"><svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="lucide lucide-circle-chevron-left md-editor-icon"><circle cx="12" cy="12" r="10"/><path d="m14 16-4-4 4-4"/></svg></span>
            </div>
          </summary>
          <pre><code class="language-json" language=json><span class="md-editor-code-block">{
  &quot;key&quot;: &quot;YOUR_API_KEY&quot;,
  &quot;action&quot;: &quot;get&quot;,
  &quot;id&quot;: 2122988149,
  &quot;json&quot;: 1
}</span><span rn-wrapper aria-hidden="true"><span></span><span></span><span></span><span></span><span></span><span></span></span></code></pre>

        </details>
      <h5 data-line="2782" id="">Result example</h5>

        <details  data-line="2784" class="md-editor-code" open="">
          <summary class="md-editor-code-head">
            <div class="md-editor-code-flag"><span></span><span></span><span></span></div>
            <div class="md-editor-code-action">
              <span class="md-editor-code-lang">json</span>
              <span class="md-editor-copy-button" data-tips="Copy">Copy</span>
              
              <span class="md-editor-collapse-tips"><svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="lucide lucide-circle-chevron-left md-editor-icon"><circle cx="12" cy="12" r="10"/><path d="m14 16-4-4 4-4"/></svg></span>
            </div>
          </summary>
          <pre><code class="language-json" language=json><span class="md-editor-code-block">{
    &quot;cost&quot;: &quot;0.0012&quot;,
    &quot;createTime&quot;: 1754563182,
    &quot;endTime&quot;: 1754563190,
    &quot;errorId&quot;: 0,
    &quot;ip&quot;: &quot;46.53.232.76&quot;,
    &quot;solution&quot;: {
        &quot;coordinates&quot;: [
            {
                &quot;x&quot;: 155,
                &quot;y&quot;: 358
            },
            {
                &quot;x&quot;: 152,
                &quot;y&quot;: 153
            },
            {
                &quot;x&quot;: 251,
                &quot;y&quot;: 333
            }
        ]
    },
    &quot;solveCount&quot;: 1,
    &quot;status&quot;: &quot;ready&quot;
}</span><span rn-wrapper aria-hidden="true"><span></span><span></span><span></span><span></span><span></span><span></span><span></span><span></span><span></span><span></span><span></span><span></span><span></span><span></span><span></span><span></span><span></span><span></span><span></span><span></span><span></span><span></span><span></span><span></span><span></span></span></code></pre>

        </details>
      <p data-line="2812">Use the received coordinates to position the image pieces correctly.</p>
</section>
<section id="altchacaptcha">
<h4 id="altcha-captcha" tabindex="-1" data-line="2818"><a class="header-anchor" href="#altcha-captcha">Altcha Captcha</a></h4>
<p data-line="2820">Token-based method for automated solving Altcha CAPTCHA.</p>
<p data-line="2822"><strong>Method specification</strong></p>
<p data-line="2824">Token-based method requires <code>challengeurl</code> or <code>challengeJSON</code> parameter, as well as proxy (not required).</p>
<table data-line="2827">
<thead data-line="2827">
<tr data-line="2827">
<th><strong>Parameter</strong></th>
<th><strong>Type</strong></th>
<th><strong>Required</strong></th>
<th><strong>Description</strong></th>
</tr>
</thead>
<tbody data-line="2829">
<tr data-line="2829">
<td><strong>key</strong></td>
<td><em>String</em></td>
<td><strong>Yes</strong></td>
<td><a href="#solving_captchas">your API key</a></td>
</tr>
<tr data-line="2830">
<td><strong>method</strong></td>
<td><em>String</em></td>
<td><strong>Yes</strong></td>
<td><code>altcha</code></td>
</tr>
<tr data-line="2831">
<td><strong>captcha_url</strong></td>
<td><em>String</em></td>
<td><strong>Yes</strong>*</td>
<td>The value of the <code>challenge_url</code> parameter for the <code>altcha-widget</code> element containing the captcha on the page.</td>
</tr>
<tr data-line="2832">
<td><strong>challenge_json</strong></td>
<td><em>String</em></td>
<td><strong>Yes</strong>*</td>
<td>The contents of the file from the 'challenge_url' parameter</td>
</tr>
<tr data-line="2833">
<td><strong>pageurl</strong></td>
<td><em>String</em></td>
<td><strong>Yes</strong></td>
<td>Full URL of the page where you solve the captcha</td>
</tr>
<tr data-line="2834">
<td>proxy</td>
<td><em>String</em></td>
<td>No</td>
<td>Your proxy: <em>login:password@123.123.123.123:3128</em> <br>You can find more info about proxies <a href="#proxies">here</a></td>
</tr>
<tr data-line="2835">
<td>proxytype</td>
<td><em>String</em></td>
<td>No</td>
<td>Type of your proxy: HTTP, HTTPS, SOCKS4, SOCKS5</td>
</tr>
<tr data-line="2836">
<td>json</td>
<td><em>Number</em></td>
<td>No</td>
<td>Set to <code>1</code> to get the response as JSON. Default: <code>0</code></td>
</tr>
</tbody>
</table>
<blockquote data-line="2838">
<p data-line="2838"><strong>*</strong> You can send either <code>captcha_url</code> or <code>challenge_json parameter</code>, but not two of it simultaneously.</p>
</blockquote>
<h5 data-line="2840" id="">Request examples</h5>
<p data-line="2842">Endpoint: <code>https://2captcha.com/in.php</code><br>
Method: <code>POST</code></p>

        <details  data-line="2845" class="md-editor-code" open="">
          <summary class="md-editor-code-head">
            <div class="md-editor-code-flag"><span></span><span></span><span></span></div>
            <div class="md-editor-code-action">
              <span class="md-editor-code-lang">json</span>
              <span class="md-editor-copy-button" data-tips="Copy">Copy</span>
              
              <span class="md-editor-collapse-tips"><svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="lucide lucide-circle-chevron-left md-editor-icon"><circle cx="12" cy="12" r="10"/><path d="m14 16-4-4 4-4"/></svg></span>
            </div>
          </summary>
          <pre><code class="language-json" language=json><span class="md-editor-code-block">{
 &quot;key&quot;: &quot;YOUR_API_KEY&quot;,
 &quot;method&quot;: &quot;altcha&quot;,
 &quot;challenge_url&quot;: &quot;https://.../captcha/api/altcha/challenge&quot;,
 &quot;pageurl&quot;: &quot;https://site.com/&quot;,
 &quot;json&quot;: 1
}</span><span rn-wrapper aria-hidden="true"><span></span><span></span><span></span><span></span><span></span><span></span><span></span></span></code></pre>

        </details>
      <p data-line="2855">The query will return the ID of your captcha, which should be used to get the result.</p>
<p data-line="2857"><strong>Getting the result</strong></p>
<h5 data-line="2859" id="">Request example</h5>
<p data-line="2861">Endpoint: <code>https://2captcha.com/res.php</code><br>
Method: <code>GET</code></p>

        <details  data-line="2864" class="md-editor-code" open="">
          <summary class="md-editor-code-head">
            <div class="md-editor-code-flag"><span></span><span></span><span></span></div>
            <div class="md-editor-code-action">
              <span class="md-editor-code-lang">json</span>
              <span class="md-editor-copy-button" data-tips="Copy">Copy</span>
              
              <span class="md-editor-collapse-tips"><svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="lucide lucide-circle-chevron-left md-editor-icon"><circle cx="12" cy="12" r="10"/><path d="m14 16-4-4 4-4"/></svg></span>
            </div>
          </summary>
          <pre><code class="language-json" language=json><span class="md-editor-code-block">{
  &quot;key&quot;: &quot;YOUR_API_KEY&quot;,
  &quot;action&quot;: &quot;get&quot;,
  &quot;id&quot;: 2122988149,
  &quot;json&quot;: 1
}</span><span rn-wrapper aria-hidden="true"><span></span><span></span><span></span><span></span><span></span><span></span></span></code></pre>

        </details>
      <h5 data-line="2873" id="">Result example</h5>

        <details  data-line="2875" class="md-editor-code" open="">
          <summary class="md-editor-code-head">
            <div class="md-editor-code-flag"><span></span><span></span><span></span></div>
            <div class="md-editor-code-action">
              <span class="md-editor-code-lang">json</span>
              <span class="md-editor-copy-button" data-tips="Copy">Copy</span>
              
              <span class="md-editor-collapse-tips"><svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="lucide lucide-circle-chevron-left md-editor-icon"><circle cx="12" cy="12" r="10"/><path d="m14 16-4-4 4-4"/></svg></span>
            </div>
          </summary>
          <pre><code class="language-json" language=json><span class="md-editor-code-block">{
    &quot;cost&quot;: &quot;0.0012&quot;,
    &quot;createTime&quot;: 1754563182,
    &quot;endTime&quot;: 1754563190,
    &quot;errorId&quot;: 0,
    &quot;ip&quot;: &quot;46.53.232.76&quot;,
    &quot;solution&quot;:
    {
        &quot;token&quot;:&quot;eyJhbGdvcml0aG0iOiJTSEEtMjU2IiwiY2hhbGxlbmdlIjoiZWFiOTE3NjRkM2Y5ZDBjMGU4ZmR.......&quot;
    },
    &quot;solveCount&quot;: 1,
    &quot;status&quot;: &quot;ready&quot;
}</span><span rn-wrapper aria-hidden="true"><span></span><span></span><span></span><span></span><span></span><span></span><span></span><span></span><span></span><span></span><span></span><span></span><span></span></span></code></pre>

        </details>
      <p data-line="2891">Use the token to interact with the target website.</p>
</section>
<section id="language">
<h3 id="language-support" tabindex="-1" data-line="2897"><a class="header-anchor" href="#language-support">Language support</a></h3>
<p data-line="2899">Our API allows you to set the language of captcha with <code>lang</code> parameter.</p>
<p data-line="2901">Each our worker can tell us which languages he speaks. When you submit a captcha with <code>lang</code> parameter we will distribute your captcha to workers who speak the language. That allows you to solve non-latin and non-cyrillic captchas, for example chinese or vietnamese.</p>
<p data-line="2903">The list of supported languages is available in the table below.</p>
<table data-line="2905">
<thead data-line="2905">
<tr data-line="2905">
<th><strong>Language code (<code>lang</code> value)</strong></th>
<th><strong>Language</strong></th>
</tr>
</thead>
<tbody data-line="2907">
<tr data-line="2907">
<td>en</td>
<td>English</td>
</tr>
<tr data-line="2908">
<td>ru</td>
<td>Russian</td>
</tr>
<tr data-line="2909">
<td>es</td>
<td>Spanish</td>
</tr>
<tr data-line="2910">
<td>pt</td>
<td>Portuguese</td>
</tr>
<tr data-line="2911">
<td>uk</td>
<td>Ukrainian</td>
</tr>
<tr data-line="2912">
<td>vi</td>
<td>Vietnamese</td>
</tr>
<tr data-line="2913">
<td>fr</td>
<td>French</td>
</tr>
<tr data-line="2914">
<td>id</td>
<td>Indonesian</td>
</tr>
<tr data-line="2915">
<td>ar</td>
<td>Arab</td>
</tr>
<tr data-line="2916">
<td>ja</td>
<td>Japanese</td>
</tr>
<tr data-line="2917">
<td>tr</td>
<td>Turkish</td>
</tr>
<tr data-line="2918">
<td>de</td>
<td>German</td>
</tr>
<tr data-line="2919">
<td>zh</td>
<td>Chinese</td>
</tr>
<tr data-line="2920">
<td>fil</td>
<td>Philippine</td>
</tr>
<tr data-line="2921">
<td>pl</td>
<td>Polish</td>
</tr>
<tr data-line="2922">
<td>th</td>
<td>Thai</td>
</tr>
<tr data-line="2923">
<td>it</td>
<td>Italian</td>
</tr>
<tr data-line="2924">
<td>nl</td>
<td>Nederlands (Dutch)</td>
</tr>
<tr data-line="2925">
<td>sk</td>
<td>Slovak</td>
</tr>
<tr data-line="2926">
<td>bg</td>
<td>Bulgarian</td>
</tr>
<tr data-line="2927">
<td>ro</td>
<td>Romanian</td>
</tr>
<tr data-line="2928">
<td>hu</td>
<td>Hungarian (Magyar)</td>
</tr>
<tr data-line="2929">
<td>ko</td>
<td>Korean</td>
</tr>
<tr data-line="2930">
<td>cs</td>
<td>Czech</td>
</tr>
<tr data-line="2931">
<td>az</td>
<td>Azerbaijani</td>
</tr>
<tr data-line="2932">
<td>fa</td>
<td>Persian (Farsi)</td>
</tr>
<tr data-line="2933">
<td>bn</td>
<td>Bengali</td>
</tr>
<tr data-line="2934">
<td>el</td>
<td>Greek</td>
</tr>
<tr data-line="2935">
<td>lt</td>
<td>Lithuanian</td>
</tr>
<tr data-line="2936">
<td>lv</td>
<td>Latvian</td>
</tr>
<tr data-line="2937">
<td>sv</td>
<td>Swedish</td>
</tr>
<tr data-line="2938">
<td>sr</td>
<td>Serbian</td>
</tr>
<tr data-line="2939">
<td>hr</td>
<td>Croatian</td>
</tr>
<tr data-line="2940">
<td>he</td>
<td>Hebrew</td>
</tr>
<tr data-line="2941">
<td>hi</td>
<td>Hindi</td>
</tr>
<tr data-line="2942">
<td>nb</td>
<td>Norwegian</td>
</tr>
<tr data-line="2943">
<td>sl</td>
<td>Slovenian</td>
</tr>
<tr data-line="2944">
<td>da</td>
<td>Danish</td>
</tr>
<tr data-line="2945">
<td>uz</td>
<td>Uzbek</td>
</tr>
<tr data-line="2946">
<td>fi</td>
<td>Finnish</td>
</tr>
<tr data-line="2947">
<td>ca</td>
<td>Catalan</td>
</tr>
<tr data-line="2948">
<td>ka</td>
<td>Georgian</td>
</tr>
<tr data-line="2949">
<td>ms</td>
<td>Malay</td>
</tr>
<tr data-line="2950">
<td>te</td>
<td>Telugu</td>
</tr>
<tr data-line="2951">
<td>et</td>
<td>Estonian</td>
</tr>
<tr data-line="2952">
<td>ml</td>
<td>Malayalam</td>
</tr>
<tr data-line="2953">
<td>be</td>
<td>Belorussian</td>
</tr>
<tr data-line="2954">
<td>kk</td>
<td>Kazakh</td>
</tr>
<tr data-line="2955">
<td>mr</td>
<td>Marathi</td>
</tr>
<tr data-line="2956">
<td>ne</td>
<td>Nepali</td>
</tr>
<tr data-line="2957">
<td>my</td>
<td>Burmese</td>
</tr>
<tr data-line="2958">
<td>bs</td>
<td>Bosnian</td>
</tr>
<tr data-line="2959">
<td>hy</td>
<td>Armenian</td>
</tr>
<tr data-line="2960">
<td>mk</td>
<td>Macedonian</td>
</tr>
<tr data-line="2961">
<td>pa</td>
<td>Punjabi (Punjabi)</td>
</tr>
</tbody>
</table>
</section>
<section id="error_handling">
<h3 id="error-handling" tabindex="-1" data-line="2967"><a class="header-anchor" href="#error-handling">Error Handling</a></h3>
<p data-line="2969">It's very important to use proper error handling in your code to avoid suspension of your account and service interruption.</p>
<p data-line="2971">Take a look on <a href="#debugging">debugging method</a> provided by our API. It can help you to identify the root or the error.</p>
<p data-line="2973">Normally if something is wrong with your request server will return an error.<br>
Below you can find tables with lists of errors with descriptions:</p>
<ul data-line="2976">
<li data-line="2976"><a href="#in_errors">errors returned by https://2captcha.com/<strong>in.php</strong></a></li>
<li data-line="2977"><a href="#res_errors">errors returned by https://2captcha.com/<strong>res.php</strong></a></li>
</ul>
<p data-line="2979">You can also get the list of all errors returned from in.php by making this <a href="https://2captcha.com/in.php?method=get_server_errors">call</a>.</p>
<p data-line="2981">Errors can be returned as plain text or as JSON if you provided <em>json=1</em> parameter.</p>
<p data-line="2983">In very rare cases server can return HTML page with error text like 500 or 502 - please keep it in mind and handle such cases correctly.<br>
If you received anything that doesn't looks like the answer or error code - make a 5 seconds timeout and then retry your request.</p>
</section>
<section id="in_errors">
<h4 id="list-of-inphp-errors" tabindex="-1" data-line="2989"><a class="header-anchor" href="#list-of-inphp-errors">List of in.php errors</a></h4>
<table data-line="2991">
<thead data-line="2991">
<tr data-line="2991">
<th><strong>Error code</strong></th>
<th><strong>Description</strong></th>
<th><strong>Action</strong></th>
</tr>
</thead>
<tbody data-line="2993">
<tr data-line="2993">
<td>ERROR_WRONG_USER_KEY</td>
<td>You've provided <em>key</em> parameter value in incorrect format, it should contain 32 symbols.</td>
<td>Stop sending requests. Check <a href="#solving_captchas">your API key</a>.</td>
</tr>
<tr data-line="2994">
<td>ERROR_KEY_DOES_NOT_EXIST</td>
<td>The key you've provided does not exists.</td>
<td>Stop sending requests. Check <a href="#solving_captchas">your API key</a>.</td>
</tr>
<tr data-line="2995">
<td>ERROR_ZERO_BALANCE</td>
<td>You don't have funds on your account.</td>
<td>Stop sending requests. Deposit your account to continue solving captchas.</td>
</tr>
<tr data-line="2996">
<td>ERROR_PAGEURL</td>
<td><em>pageurl</em> parameter is missing in your request.</td>
<td>Stop sending requests and change your code to provide valid <em>pageurl</em> parameter. <br><a href="#recaptchav2new_post">More info.</a></td>
</tr>
<tr data-line="2997">
<td>ERROR_NO_SLOT_AVAILABLE</td>
<td>You can receive this error in two cases: <br>1. <strong>If you solve Normal Captcha or ArkoseLabs FunCaptcha:</strong> your maximum rate is lower than current rate on the server. <br>You can change your maximum rate in <a href="https://2captcha.com/setting">your account's settings</a>. <br>2. <strong>If you solve token-based captchas:</strong> the queue of your captchas that are not distributed to workers is too long. Queue limit changes dynamically and depends on total amount of captchas awaiting solution and usually it’s between 50 and 100 captchas.</td>
<td>If you have received this error, don't try to submit your request again immediately. Instead, 1. <strong>Adjust your maximum rate</strong> in <a href="https://2captcha.com/setting">your account's settings</a>. <br>or <br>2. <strong>Make 2-3 seconds timeout</strong> and then retry to submit your request.</td>
</tr>
<tr data-line="2998">
<td>ERROR_ZERO_CAPTCHA_FILESIZE</td>
<td>Image size is less than 100 bytes.</td>
<td>Check the image file.</td>
</tr>
<tr data-line="2999">
<td>ERROR_TOO_BIG_CAPTCHA_FILESIZE</td>
<td>Image size is more than 600 kB or image is bigger than 1000px on any side.</td>
<td>Check the image file.</td>
</tr>
<tr data-line="3000">
<td>ERROR_WRONG_FILE_EXTENSION</td>
<td>Image file has unsupported extension. Accepted extensions: jpg, jpeg, gif, png.</td>
<td>Check the image file.</td>
</tr>
<tr data-line="3001">
<td>ERROR_IMAGE_TYPE_NOT_SUPPORTED</td>
<td>Server can't recognize image file type.</td>
<td>Check the image file.</td>
</tr>
<tr data-line="3002">
<td>ERROR_UPLOAD</td>
<td>Server can't get file data from your POST-request. <br>That happens if your POST-request is malformed or base64 data is not a valid base64 image.</td>
<td>You got to fix your code that makes POST request.</td>
</tr>
<tr data-line="3003">
<td>ERROR_IP_NOT_ALLOWED</td>
<td>The request is sent from the IP that is not on the list of your allowed IPs.</td>
<td>Check the list of your <a href="https://2captcha.com/iplist">allowed IPs</a>.</td>
</tr>
<tr data-line="3004">
<td>IP_BANNED</td>
<td>Your IP address is banned due to many frequent attempts to access the server using wrong authorization keys.</td>
<td>Ban will be automatically lifted after 5 minutes.</td>
</tr>
<tr data-line="3005">
<td>ERROR_BAD_TOKEN_OR_PAGEURL</td>
<td>You can get this error code when sending reCAPTCHA V2. That happens if your request contains invalid pair of googlekey and pageurl. The common reason for that is that reCAPTCHA is loaded inside an iframe hosted on another domain/subdomain.</td>
<td>Explore code of the page carefully to find valid pageurl and sitekey values.</td>
</tr>
<tr data-line="3006">
<td>ERROR_GOOGLEKEY</td>
<td>You can get this error code when sending reCAPTCHA V2. That means that sitekey value provided in your request is incorrect: it's blank or malformed.</td>
<td>Check your code that gets the sitekey and makes requests to our API.</td>
</tr>
<tr data-line="3007">
<td>ERROR_PROXY_FORMAT</td>
<td>You use incorrect proxy format in your request to <code>in.php</code></td>
<td>Use proper format as described in section <a href="#proxies">Using proxies</a>.</td>
</tr>
<tr data-line="3008">
<td>ERROR_WRONG_GOOGLEKEY</td>
<td><code>googlekey</code> parameter is missing in your request</td>
<td>Check your code that gets the sitekey and makes requests to our API.</td>
</tr>
<tr data-line="3009">
<td>ERROR_CAPTCHAIMAGE_BLOCKED</td>
<td>You've sent an image that is marked in our database as unrecognizable. <br>Usually that happens if the website where you found the captcha stopped sending you captchas and started to send &quot;deny access&quot; image.</td>
<td>Try to override website's limitations.</td>
</tr>
<tr data-line="3010">
<td>TOO_MANY_BAD_IMAGES</td>
<td>You are sending too many unrecognizable images</td>
<td>Make sure that your <a href="/statistics/uploads">last captchas</a> are visible and check <a href="/setting/not_captcha">unrecognizable images</a> we saved for analisys. Then fix your software to submit images properly.</td>
</tr>
<tr data-line="3011">
<td>MAX_USER_TURN</td>
<td>You made more than 60 requests to <em>in.php</em> within 3 seconds. <br>Your account is banned for 10 seconds. Ban will be lifted automatically.</td>
<td>Set at least 100 ms timeout between requests to <em>in.php</em>.</td>
</tr>
<tr data-line="3012">
<td>ERROR: NNNN</td>
<td>Where NNNN is numeric error code. <br>You exceeded request limit and your account is temporary suspended.</td>
<td>You should set proper timeouts. Please refer to <a href="#limits">Request limits</a> for more info.</td>
</tr>
<tr data-line="3013">
<td>ERROR_BAD_PARAMETERS</td>
<td>The error code is returned if some required parameters are missing in your request or the values have incorrect format. Or in case if you have SandBox mode and 100% recognition options enabled at the same time. <br>For example if you submit <a href="#grid">Grid images</a> but your request is missing an instruction for workers. Or if you submit <a href="#solving_recaptchav2_new">reCAPTCHA V2</a> or <a href="#solving_tiktok">TikTok</a> captcha with cookies string that has incorrect format.</td>
<td>Check that your request contains all the required parameters and the values are in proper format. <br>Use <a href="#debugging">debug mode</a> to see which values you send to our API.</td>
</tr>
<tr data-line="3014">
<td>ERROR_BAD_PROXY</td>
<td>You can get this error code when sending a captcha via proxy server which is marked as <em>BAD</em> by our API.</td>
<td>Use a different proxy server in your requests.</td>
</tr>
</tbody>
</table>
</section>
<section id="res_errors">
<h4 id="list-of-resphp-errors" tabindex="-1" data-line="3019"><a class="header-anchor" href="#list-of-resphp-errors">List of res.php errors</a></h4>
<table data-line="3021">
<thead data-line="3021">
<tr data-line="3021">
<th><strong>Error code</strong></th>
<th><strong>Description</strong></th>
<th><strong>Action</strong></th>
</tr>
</thead>
<tbody data-line="3023">
<tr data-line="3023">
<td>CAPCHA_NOT_READY</td>
<td>Your captcha is not solved yet.</td>
<td><strong>Make 5 seconds timeout</strong> and repeat your request.</td>
</tr>
<tr data-line="3024">
<td>ERROR_CAPTCHA_UNSOLVABLE</td>
<td>We are unable to solve your captcha - three of our workers were unable solve it or we didn't get an answer within 90 seconds (300 seconds for reCAPTCHA V2). <br>We will not charge you for that request.</td>
<td>You can retry to send your captcha.</td>
</tr>
<tr data-line="3025">
<td>ERROR_WRONG_USER_KEY</td>
<td>You've provided <em>key</em> parameter value in incorrect format, it should contain 32 symbols.</td>
<td>Stop sending requests. Check <a href="#solving_captchas">your API key</a>.</td>
</tr>
<tr data-line="3026">
<td>ERROR_KEY_DOES_NOT_EXIST</td>
<td>The key you've provided does not exists.</td>
<td>Stop sending requests. Check <a href="#solving_captchas">your API key</a>.</td>
</tr>
<tr data-line="3027">
<td>ERROR_WRONG_ID_FORMAT</td>
<td>You've provided captcha ID in wrong format. The ID can contain numbers only.</td>
<td>Check the ID of captcha or your code that gets the ID.</td>
</tr>
<tr data-line="3028">
<td>ERROR_WRONG_CAPTCHA_ID</td>
<td>You've provided incorrect captcha ID.</td>
<td>Check the ID of captcha or your code that gets the ID.</td>
</tr>
<tr data-line="3029">
<td>ERROR_BAD_DUPLICATES</td>
<td>Error is returned when 100% accuracy feature is enabled. The error means that max numbers of tries is reached but min number of matches not found.</td>
<td>You can retry to send your captcha again.</td>
</tr>
<tr data-line="3030">
<td>ERROR_REPORT_NOT_RECORDED</td>
<td>Error is returned to your <a href="#complain">report request</a> if you already complained lots of correctly solved captchas (more than 40%). Or if more than 15 minutes passed after you submitted the captcha.</td>
<td>Make sure that you're sending <a href="#complain">complain requests</a> only for incorrectly solved captchas.</td>
</tr>
<tr data-line="3031">
<td>ERROR_DUPLICATE_REPORT</td>
<td>Error is returned to your <a href="#complain">report request</a> if you are trying to report the same captcha more than once.</td>
<td>Make sure that you're sending only one report for each captcha.</td>
</tr>
<tr data-line="3032">
<td>ERROR: NNNN</td>
<td>Where NNNN is numeric error code. <br>You exceeded request limit and your account is temporary suspended.</td>
<td>You should set proper timeouts. Please refer to <a href="#limits">Request limits</a> for more info.</td>
</tr>
<tr data-line="3033">
<td>ERROR_IP_ADDRES</td>
<td>You can receive this error code when registering a <a href="#pingback">pingback (callback)</a> IP or domain. <br>That happes if your request is coming from an IP address that doesn't match the IP address of your pingback IP or domain.</td>
<td>Make the request from the IP address matching your IP or domain for pingback.</td>
</tr>
<tr data-line="3034">
<td>ERROR_TOKEN_EXPIRED</td>
<td>You can receive this error code when sending <a href="#solving_geetest">Geetest</a>. <br>That error means that <code>challenge</code> value you provided is expired.</td>
<td>If you always receive this error code that means that we're unable to solve Geetest on this website.</td>
</tr>
<tr data-line="3035">
<td>ERROR_EMPTY_ACTION</td>
<td>Action parameter is missing or no value is provided for <code>action</code> parameter.</td>
<td>Check your request parameters and add the neccessary value, e.g. <code>get</code> or <code>getbalance</code>.</td>
</tr>
<tr data-line="3036">
<td>ERROR_PROXY_CONNECTION_FAILED</td>
<td>You can get this error code if we were unable to load a captcha through your proxy server. The proxy will be marked as <em>BAD</em> by our API and we will not accept requests with the proxy during 10 minutes. <br>You will recieve ERROR_BAD_PROXY code from <em>in.php</em> API endpoint in such case.</td>
<td>Use a different proxy server in your requests.</td>
</tr>
</tbody>
</table>
</section>
<section id="debugging">
<h3 id="debugging-api" tabindex="-1" data-line="3041"><a class="header-anchor" href="#debugging-api">Debugging API</a></h3>
<p data-line="3043">Sometimes it can be hard to find to undrestand why our API returns an <a href="#error_handling">error code</a> when you make a request that looks correct.</p>
<p data-line="3045">We provide a debugging method that can help you to find the root of the problem showing what exactly our API recevied from you.</p>
<p data-line="3047">The method can be used both on <code>in.php</code> and <code>res.php</code> API endpoints for any request.</p>
<p data-line="3049">Add an additional parameter <code>debug_dump=1</code> to your request and our server will return a dump of request parameters that received by our API.</p>
<p data-line="3051">Request example:</p>

        <details  data-line="3053" class="md-editor-code" open="">
          <summary class="md-editor-code-head">
            <div class="md-editor-code-flag"><span></span><span></span><span></span></div>
            <div class="md-editor-code-action">
              <span class="md-editor-code-lang"></span>
              <span class="md-editor-copy-button" data-tips="Copy">Copy</span>
              
              <span class="md-editor-collapse-tips"><svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="lucide lucide-circle-chevron-left md-editor-icon"><circle cx="12" cy="12" r="10"/><path d="m14 16-4-4 4-4"/></svg></span>
            </div>
          </summary>
          <pre><code class="language-" language=><span class="md-editor-code-block">https://2captcha.com/in.php?key=1abc234de56fab7c89012d34e56fa7b8&amp;method=userrecaptcha&amp;googlekey=6Le-wvkSVVABCPBMRTvw0Q4Muexq1bi0DJwx_mJ-&amp;json=1&amp;header_acao=1&amp;pageurl=http://mysite.com/page/with/recaptcha/&amp;pingback=http://1.2.3.4/pingback_handler/&amp;debug_dump=1</span><span rn-wrapper aria-hidden="true"><span></span></span></code></pre>

        </details>
      <p data-line="3055">Response example:</p>

        <details  data-line="3057" class="md-editor-code" open="">
          <summary class="md-editor-code-head">
            <div class="md-editor-code-flag"><span></span><span></span><span></span></div>
            <div class="md-editor-code-action">
              <span class="md-editor-code-lang"></span>
              <span class="md-editor-copy-button" data-tips="Copy">Copy</span>
              
              <span class="md-editor-collapse-tips"><svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="lucide lucide-circle-chevron-left md-editor-icon"><circle cx="12" cy="12" r="10"/><path d="m14 16-4-4 4-4"/></svg></span>
            </div>
          </summary>
          <pre><code class="language-" language=><span class="md-editor-code-block">array(8) {
[&quot;key&quot;]=&gt;
string(32) &quot;1abc234de56fab7c89012d34e56fa7b8&quot;
[&quot;method&quot;]=&gt;
string(13) &quot;userrecaptcha&quot;
[&quot;googlekey&quot;]=&gt;
string(40) &quot;6Le-wvkSVVABCPBMRTvw0Q4Muexq1bi0DJwx_mJ-&quot;
[&quot;json&quot;]=&gt;
string(1) &quot;1&quot;
[&quot;header_acao&quot;]=&gt;
string(1) &quot;1&quot;
[&quot;pageurl&quot;]=&gt;
string(38) &quot;http://mysite.com/page/with/recaptcha/&quot;
[&quot;pingback&quot;]=&gt;
string(32) &quot;http://1.2.3.4/pingback_handler/&quot;
[&quot;debug_dump&quot;]=&gt;
string(1) &quot;1&quot;
}
array(0) {
}
array(0) {
}
{&quot;status&quot;:0,&quot;request&quot;:&quot;ERROR_KEY_DOES_NOT_EXIST&quot;}</span><span rn-wrapper aria-hidden="true"><span></span><span></span><span></span><span></span><span></span><span></span><span></span><span></span><span></span><span></span><span></span><span></span><span></span><span></span><span></span><span></span><span></span><span></span><span></span><span></span><span></span><span></span><span></span></span></code></pre>

        </details>
      <p data-line="3081">Using this method you will be able to easily identify cases when your request contains invalid data or missing required parameters.</p>
</section>
<section id="limits">
<h3 id="request-limits" tabindex="-1" data-line="3086"><a class="header-anchor" href="#request-limits">Request limits</a></h3>
<p data-line="3088">Please remember and understand that each of your requests to our API generates multuple requests to our databases. That's why we ask to set proper timeouts for your requests and use proper <a href="#error_handling">error handling</a> for cases when server returns an error (error message, HTTP error or HTML page with error).</p>
<p data-line="3090">For example:</p>
<ul data-line="3092">
<li data-line="3092">If server returns ERROR_NO_SLOT_AVAILABLE make a 5 seconds timeout before sending next request.</li>
<li data-line="3093">If server returns ERROR_ZERO_BALANCE set the timeout to 60 seconds.</li>
<li data-line="3094">After uploading a captcha wait a least 5 seconds (10-20 for recaptcha) and only then try to get the answer.</li>
<li data-line="3095">If captcha is not solved yet - retry in 5 seconds.</li>
</ul>
<p data-line="3097">If your timeouts are configured incorrectly your account or IP address will be temporary blocked and server will return an error. See the list of error codes in the <a href="#limit_errors">table below</a>.</p>
</section>
<section id="limit_errors">
<h4 id="list-of-error-codes-for-request-limitations" tabindex="-1" data-line="3102"><a class="header-anchor" href="#list-of-error-codes-for-request-limitations">List of error codes for request limitations</a></h4>
<table data-line="3104">
<thead data-line="3104">
<tr data-line="3104">
<th><strong>Error code</strong></th>
<th><strong>Blocking time</strong></th>
<th><strong>Blocking reason</strong></th>
</tr>
</thead>
<tbody data-line="3106">
<tr data-line="3106">
<td>ERROR: 1001</td>
<td>10 minutes</td>
<td>You received 120 ERROR_NO_SLOT_AVAILABLE errors in one minute because your current bid is lower than current bid on the server</td>
</tr>
<tr data-line="3107">
<td>ERROR: 1002</td>
<td>5 minutes</td>
<td>You received 120 ERROR_ZERO_BALANCE errors in one minute because your balance is out</td>
</tr>
<tr data-line="3108">
<td>ERROR: 1003</td>
<td>30 seconds</td>
<td>You are getting ERROR_NO_SLOT_AVAILABLE because you are uploading many captchas and server has a long queue of your captchas that are not distributed to workers. <br>You received three times more errors than amount of captchas you sent (but not less than 120 errors). Increase the timeout if you see this error.</td>
</tr>
<tr data-line="3109">
<td>ERROR: 1004</td>
<td>10 minutes</td>
<td>Your IP address is blocked because there were 5 requests with incorrect API key from your IP.</td>
</tr>
<tr data-line="3110">
<td>ERROR: 1005</td>
<td>5 minutes</td>
<td>You are making too many requests to res.php to get answers. <br>We use the following rule to block your account: R &gt; C * 20 + 1200 <br>Where: <br>R - the amount of your requests <br>C - the amount of captchas you've uploaded <br>That means that you don't have to make more than 20 requests to res.php per each captcha. <br>Please remember that balance request sent to res.php also counts! <br>To get your answer faster without a risk to be blocked you can use <a href="#pingback">pingback feature</a> and we will send you the answer when your captcha is solved.</td>
</tr>
<tr data-line="3111">
<td>MAX_USER_TURN</td>
<td>10 seconds</td>
<td>You made more than 60 requests to <em>in.php</em> within 3 seconds. Set at least 100 ms timeout between requests to <em>in.php</em>.</td>
</tr>
</tbody>
</table>
</section>
<section id="proxies">
<h3 id="using-proxies" tabindex="-1" data-line="3116"><a class="header-anchor" href="#using-proxies">Using proxies</a></h3>
<p data-line="3118">Proxies can be used to solve most types of javascript-based captchas:</p>
<ul data-line="3120">
<li data-line="3120"><a href="#solving_recaptchav2_new">reCAPTCHA V2</a></li>
<li data-line="3121"><a href="#solving_recaptcha_enterprise">reCAPTCHA Enterpise V2</a></li>
<li data-line="3122"><a href="#solving_funcaptcha_new">Arkose Labs FunCaptcha</a></li>
<li data-line="3123"><a href="#solving_geetest">Geetest</a></li>
<li data-line="3124"><a href="#geetest-v4">Geetest v4</a></li>
<li data-line="3125"><a href="#solving_tiktok">TikTok</a></li>
</ul>
<p data-line="3127">Proxy allows to solve the captcha from the same IP address as you load the page.<br>
Using proxies is not obligatory in most cases. But for some kind of protection you should use it. For example: Cloudflare and Datadome protection pages require IP matching.<br>
Also good proxies with regular rotation can raise the speed and success rate for <a href="#solving_funcaptcha_new">Arkose Labs FunCaptcha</a>.</p>
<p data-line="3131">Proxies are not supported for reCAPTCHA V3 and Enterprise V3 as proxies dramatically decrease the success rate for this types of captcha.</p>
<p data-line="3133">If you send us the proxy, we check it's availability trying to open the website through you proxy, and if we can't do that we will not use your proxy.<br>
If we're able to use your proxy - we'll load the reCAPTCHA through it for solving.</p>
<p data-line="3136">We have our own proxies that we can offer you. <a href="https://2captcha.com/proxy/residential-proxies">Buy residential proxies</a> for avoid restrictions and blocks. <a href="https://2captcha.com/proxy?openAddTrafficModal=true">Quick start</a>.</p>
<p data-line="3138">We support the following proxy types: SOCKS4, SOCKS5, HTTP, HTTPS with authentication by IP address or login and password.</p>
<p data-line="3140">If your proxy uses IP authentication you have to add our IP addresses to the list of allowed IPs of the proxy:<br>
138.201.188.166</p>
<p data-line="3143">Then provide your proxy IP address and port as a value for <em>proxy</em> parameter.<br>
And the type of your proxy as a value for <em>proxytype</em> parameter.</p>
<p data-line="3146">If your proxy uses login/password authentication you have to include your credentials in <em>proxy</em> parameter.</p>
</section>
<section id="recaptchav2new_proxy">
<h4 id="post-parameters-for-proxies" tabindex="-1" data-line="3151"><a class="header-anchor" href="#post-parameters-for-proxies">POST parameters for proxies</a></h4>
<table data-line="3154">
<thead data-line="3154">
<tr data-line="3154">
<th><strong>POST parameter</strong></th>
<th><strong>Type</strong></th>
<th><strong>Required</strong></th>
<th><strong>Description</strong></th>
</tr>
</thead>
<tbody data-line="3156">
<tr data-line="3156">
<td>proxy</td>
<td>String</td>
<td>No</td>
<td>Format for IP authentication: <em>IP_address:PORT</em> <br>Example: <em>proxy=123.123.123.123:3128</em> <br>Format for login/password authentication: <em>login:password@IP_address:PORT</em> <br>Example: <em>proxy=proxyuser:strongPassword@123.123.123.123:3128</em></td>
</tr>
<tr data-line="3157">
<td>proxytype</td>
<td>String</td>
<td>No</td>
<td>Type of your proxy: HTTP, HTTPS, SOCKS4, SOCKS5. <br>Example: <em>proxytype=SOCKS4</em></td>
</tr>
</tbody>
</table>
</section>
<section id="cookies">
<h3 id="cookies-param" tabindex="-1" data-line="3162"><a class="header-anchor" href="#cookies-param">Cookies param</a></h3>
<p data-line="3164">Our API provides extended Cookies support for reCAPTCHA V2 and reCAPTCHA V2 Enterpise.</p>
<p data-line="3166">You can provide your cookies using the format below as the value of <code>json_cookies</code> parameter. We will set the cookies on our worker's browser.</p>
<p data-line="3168">After the captcha was solved succesfully, we will return all the cookies set for domains: <code>google.com</code> and the domain of your target website from <code>pageurl</code> parameter value.</p>
<p data-line="3170">You should use <code>json=1</code> parameter in your request to res.php endpoint to get the cookies.</p>
<h4 id="cookies-format" tabindex="-1" data-line="3172"><a class="header-anchor" href="#cookies-format">Cookies format:</a></h4>

        <details  data-line="3174" class="md-editor-code" open="">
          <summary class="md-editor-code-head">
            <div class="md-editor-code-flag"><span></span><span></span><span></span></div>
            <div class="md-editor-code-action">
              <span class="md-editor-code-lang"></span>
              <span class="md-editor-copy-button" data-tips="Copy">Copy</span>
              
              <span class="md-editor-collapse-tips"><svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="lucide lucide-circle-chevron-left md-editor-icon"><circle cx="12" cy="12" r="10"/><path d="m14 16-4-4 4-4"/></svg></span>
            </div>
          </summary>
          <pre><code class="language-" language=><span class="md-editor-code-block">{
&quot;json_cookies&quot;: [
{
    &quot;name&quot;: &quot;my-cookie-name-1&quot;,
    &quot;value&quot;: &quot;my-cookie-val-1&quot;,
    &quot;domain&quot;: &quot;example.com&quot;,
    &quot;hostOnly&quot;: true,
    &quot;path&quot;: &quot;\/&quot;,
    &quot;secure&quot;: true,
    &quot;httpOnly&quot;: false,
    &quot;session&quot;: false,
    &quot;expirationDate&quot;: 1665434653,
    &quot;sameSite&quot;: &quot;strict&quot;
},
{
    &quot;name&quot;: &quot;my-cookie-name-2&quot;,
    &quot;value&quot;: &quot;my-cookie-val-2&quot;,
    &quot;domain&quot;: &quot;.google.com&quot;,
    &quot;hostOnly&quot;: false,
    &quot;path&quot;: &quot;\/&quot;,
    &quot;secure&quot;: true,
    &quot;httpOnly&quot;: false,
    &quot;session&quot;: false,
    &quot;expirationDate&quot;: 1668015805.8028,
    &quot;sameSite&quot;: &quot;no_restriction&quot;
}
]
}</span><span rn-wrapper aria-hidden="true"><span></span><span></span><span></span><span></span><span></span><span></span><span></span><span></span><span></span><span></span><span></span><span></span><span></span><span></span><span></span><span></span><span></span><span></span><span></span><span></span><span></span><span></span><span></span><span></span><span></span><span></span><span></span><span></span></span></code></pre>

        </details>
      <p data-line="3203">The following properties are required for each cookie:</p>
<ul data-line="3205">
<li data-line="3205"><code>domain</code> (String) - the domain for cookie</li>
<li data-line="3206"><code>name</code> (String) - the cookie name</li>
<li data-line="3207"><code>value</code> (String) - the cookie value</li>
<li data-line="3208"><code>secure</code> (Boolean) - should we set secure attribute?</li>
</ul>
</section>
<section id="pingback">
<h3 id="pingback-callback" tabindex="-1" data-line="3213"><a class="header-anchor" href="#pingback-callback">Pingback (callback)</a></h3>
<p data-line="3215">We provide a pingback (callback) option that allows you to get the answer for your captcha automatically when it's ready.<br>
It allows you to get answers without making requests to <a href="https://2captcha.com/res.php">https://2captcha.com/res.php</a> and also allows you to avoid account suspension.</p>
<p data-line="3218">To receive automated pingback you have to:</p>
<ul data-line="3220">
<li data-line="3220"><a href="#manage_pingback">Register your pingback domain/IP address.</a></li>
<li data-line="3221">Provide your pingback URL as a value for <em>pingback</em> parameter of your request to <a href="https://2captcha.com/in.php">https://2captcha.com/in.php</a>.</li>
<li data-line="3222">Process <em>HTTP POST</em> request with URLencoded form data (application/x-www-form-urlencoded) coming from our server to your pingback URL. The request contains two parameters: <code>id</code> - captcha ID and <code>code</code> - the answer.</li>
</ul>
<p data-line="3224">Incoming pingback request example:</p>

        <details  data-line="3226" class="md-editor-code" open="">
          <summary class="md-editor-code-head">
            <div class="md-editor-code-flag"><span></span><span></span><span></span></div>
            <div class="md-editor-code-action">
              <span class="md-editor-code-lang"></span>
              <span class="md-editor-copy-button" data-tips="Copy">Copy</span>
              
              <span class="md-editor-collapse-tips"><svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="lucide lucide-circle-chevron-left md-editor-icon"><circle cx="12" cy="12" r="10"/><path d="m14 16-4-4 4-4"/></svg></span>
            </div>
          </summary>
          <pre><code class="language-" language=><span class="md-editor-code-block">id=51555263943&amp;code=ANSWER</span><span rn-wrapper aria-hidden="true"><span></span></span></code></pre>

        </details>
      <p data-line="3228">You can use any pingback URL pointing to your registered domain/IP address so your URL can include custom parameters.<br>
But there's one limitation: if you will submit your captcha with GET request and use URL that contains multiple parameters like <code>http://mysite.com/pingback/?myId=1&amp;myCat=2&amp;something_else=test</code> then you will receive pingback to URL with only the first parameter <code>?myId=1</code>. To avoid that use POST request with multipart/form-data.</p>
</section>
<section id="manage_pingback">
<h4 id="manage-pingback-addresses" tabindex="-1" data-line="3234"><a class="header-anchor" href="#manage-pingback-addresses">Manage pingback addresses</a></h4>
<p data-line="3236">You can manage your pingback addresses on <a href="/setting/pingback">pingback management page</a> or making <em>HTTP GET</em> requests to <code>https://2captcha.com/res.php</code><br>
Request parameters are described in the table below.</p>
<p data-line="3239"><strong>Important:</strong> pingback domain/IP address can be registered only from the same IP address so you got to send register request from your server.</p>
<p data-line="3241"><strong>List of <em>GET</em> request parameters for <a href="https://2captcha.com/res.php">https://2captcha.com/res.php</a></strong></p>
<table data-line="3244">
<thead data-line="3244">
<tr data-line="3244">
<th><strong>GET parameter</strong></th>
<th><strong>Type</strong></th>
<th><strong>Required</strong></th>
<th><strong>Description</strong></th>
</tr>
</thead>
<tbody data-line="3246">
<tr data-line="3246">
<td>key</td>
<td>String</td>
<td>Yes</td>
<td><a href="#solving_captchas">your API key</a></td>
</tr>
<tr data-line="3247">
<td>action</td>
<td>String</td>
<td>Yes</td>
<td>add_pingback - register new pingback URL <br>get_pingback - get the list of your pingback URLs <br>del_pingback - delete pingback URL</td>
</tr>
<tr data-line="3248">
<td>addr</td>
<td>String</td>
<td>-</td>
<td>Your pingback URL. <br>For example: <code>_http://mysite.com/pingback/url/_</code> or <code>_123.123.123.123/pingback/url/_</code> <br>You can use 'all' value together with del_pingback to delete all your URLs.</td>
</tr>
<tr data-line="3249">
<td>json</td>
<td>Integer <br>Default: 0</td>
<td>No</td>
<td>0 - server will send the response as plain text <br>1 - tells the server to send the response as JSON</td>
</tr>
</tbody>
</table>
</section>
<section id="pingback_examples">
<h4 id="request-examples" tabindex="-1" data-line="3254"><a class="header-anchor" href="#request-examples">Request examples</a></h4>
<p data-line="3256">Register pingback domain/IP:</p>

        <details  data-line="3258" class="md-editor-code" open="">
          <summary class="md-editor-code-head">
            <div class="md-editor-code-flag"><span></span><span></span><span></span></div>
            <div class="md-editor-code-action">
              <span class="md-editor-code-lang"></span>
              <span class="md-editor-copy-button" data-tips="Copy">Copy</span>
              
              <span class="md-editor-collapse-tips"><svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="lucide lucide-circle-chevron-left md-editor-icon"><circle cx="12" cy="12" r="10"/><path d="m14 16-4-4 4-4"/></svg></span>
            </div>
          </summary>
          <pre><code class="language-" language=><span class="md-editor-code-block">https://2captcha.com/res.php?key=1abc234de56fab7c89012d34e56fa7b8&amp;action=add_pingback&amp;addr=mysite.com</span><span rn-wrapper aria-hidden="true"><span></span></span></code></pre>

        </details>
      <p data-line="3260">List pingback domains/IPs:</p>

        <details  data-line="3262" class="md-editor-code" open="">
          <summary class="md-editor-code-head">
            <div class="md-editor-code-flag"><span></span><span></span><span></span></div>
            <div class="md-editor-code-action">
              <span class="md-editor-code-lang"></span>
              <span class="md-editor-copy-button" data-tips="Copy">Copy</span>
              
              <span class="md-editor-collapse-tips"><svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="lucide lucide-circle-chevron-left md-editor-icon"><circle cx="12" cy="12" r="10"/><path d="m14 16-4-4 4-4"/></svg></span>
            </div>
          </summary>
          <pre><code class="language-" language=><span class="md-editor-code-block">https://2captcha.com/res.php?key=1abc234de56fab7c89012d34e56fa7b8&amp;action=get_pingback&amp;json=1</span><span rn-wrapper aria-hidden="true"><span></span></span></code></pre>

        </details>
      <p data-line="3264">Delete all pingback domains/IP:</p>

        <details  data-line="3266" class="md-editor-code" open="">
          <summary class="md-editor-code-head">
            <div class="md-editor-code-flag"><span></span><span></span><span></span></div>
            <div class="md-editor-code-action">
              <span class="md-editor-code-lang"></span>
              <span class="md-editor-copy-button" data-tips="Copy">Copy</span>
              
              <span class="md-editor-collapse-tips"><svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="lucide lucide-circle-chevron-left md-editor-icon"><circle cx="12" cy="12" r="10"/><path d="m14 16-4-4 4-4"/></svg></span>
            </div>
          </summary>
          <pre><code class="language-" language=><span class="md-editor-code-block">https://2captcha.com/res.php?key=1abc234de56fab7c89012d34e56fa7b8&amp;action=del_pingback&amp;addr=all</span><span rn-wrapper aria-hidden="true"><span></span></span></code></pre>

        </details>
      </section>
<section id="complain">
<h3 id="reporting-answers" tabindex="-1" data-line="3271"><a class="header-anchor" href="#reporting-answers">Reporting answers</a></h3>
<p data-line="3273">Reporting answers is not required to solve capthcas. But it can help you to cut expenses and increase the accuracy. We described why it is important to report answers in <a href="https://2captcha.com/blog/reportgood-reportbad">our blog</a>.</p>
<p data-line="3275">We recommend to report both correct and incorrect asnwers for all types of captchas.</p>
<p data-line="3277">If the answer is not accepted by target website use <code>reportbad</code> method to inform us about that. The answer will be rechecked and you will receive a refund for incorrect answer.</p>
<p data-line="3279">If the answer was accepted successfully use <code>reportgood</code> method to indicate that. That will allow us to increase the accuracy for future requests.</p>
<blockquote data-line="3281">
<p data-line="3281"><strong>Important:</strong> don't try to report correct answers with <code>reportbad</code>. If you will do that then we will block this method for your account.</p>
</blockquote>
<blockquote data-line="3283">
<p data-line="3283">Reports for captchas with token like reCAPTCHA V2/V3, FunCaptcha are not visible in the user interface or the dashboard. But we gather the statistics on these reports to increase the success rate for these captchas.</p>
</blockquote>
<blockquote data-line="3285">
<p data-line="3285">Reports can not be used if 100% recognition feature is enabled.</p>
</blockquote>
<p data-line="3287"><strong>Request examples:</strong></p>
<p data-line="3289">ReportBAD</p>

        <details  data-line="3291" class="md-editor-code" open="">
          <summary class="md-editor-code-head">
            <div class="md-editor-code-flag"><span></span><span></span><span></span></div>
            <div class="md-editor-code-action">
              <span class="md-editor-code-lang"></span>
              <span class="md-editor-copy-button" data-tips="Copy">Copy</span>
              
              <span class="md-editor-collapse-tips"><svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="lucide lucide-circle-chevron-left md-editor-icon"><circle cx="12" cy="12" r="10"/><path d="m14 16-4-4 4-4"/></svg></span>
            </div>
          </summary>
          <pre><code class="language-" language=><span class="md-editor-code-block">https://2captcha.com/res.php?key=1abc234de56fab7c89012d34e56fa7b8&amp;action=reportbad&amp;id=2122988149</span><span rn-wrapper aria-hidden="true"><span></span></span></code></pre>

        </details>
      <p data-line="3293">ReportGOOD</p>

        <details  data-line="3295" class="md-editor-code" open="">
          <summary class="md-editor-code-head">
            <div class="md-editor-code-flag"><span></span><span></span><span></span></div>
            <div class="md-editor-code-action">
              <span class="md-editor-code-lang"></span>
              <span class="md-editor-copy-button" data-tips="Copy">Copy</span>
              
              <span class="md-editor-collapse-tips"><svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="lucide lucide-circle-chevron-left md-editor-icon"><circle cx="12" cy="12" r="10"/><path d="m14 16-4-4 4-4"/></svg></span>
            </div>
          </summary>
          <pre><code class="language-" language=><span class="md-editor-code-block">https://2captcha.com/res.php?key=1abc234de56fab7c89012d34e56fa7b8&amp;action=reportgood&amp;id=2122988149</span><span rn-wrapper aria-hidden="true"><span></span></span></code></pre>

        </details>
      <p data-line="3297"><strong>List of <em>GET</em> request parameters for <a href="https://2captcha.com/res.php">https://2captcha.com/res.php</a></strong></p>
<table data-line="3299">
<thead data-line="3299">
<tr data-line="3299">
<th><strong>GET parameter</strong></th>
<th><strong>Type</strong></th>
<th><strong>Required</strong></th>
<th><strong>Description</strong></th>
</tr>
</thead>
<tbody data-line="3301">
<tr data-line="3301">
<td>key</td>
<td>String</td>
<td>Yes</td>
<td><a href="#solving_captchas">your API key</a></td>
</tr>
<tr data-line="3302">
<td>action</td>
<td>String</td>
<td>Yes</td>
<td>reportbad - report incorrectly solved captcha <br>reportgood - confirm correct answer</td>
</tr>
<tr data-line="3303">
<td>id</td>
<td>String</td>
<td>Yes</td>
<td>captcha ID</td>
</tr>
<tr data-line="3304">
<td>json</td>
<td>Integer <br>Default: 0</td>
<td>No</td>
<td>0 - server will send the response as plain text <br>1 - tells the server to send the response as JSON</td>
</tr>
</tbody>
</table>
<p data-line="3306">Server will return <code>OK_REPORT_RECORDED</code> response to your request. Or an <a href="#error_handling">error code</a> if something went wrong.</p>
<p data-line="3308">If you're getting too many incorrectly solved captchas you may provide <a href="#normal_post">additional parameters</a> with your captcha to help wokers to solve it correctly</p>
</section>
<section id="additional">
<h3 id="additional-methods" tabindex="-1" data-line="3313"><a class="header-anchor" href="#additional-methods">Additional methods</a></h3>
<p data-line="3315">You can also get some additional information with our API, like balance, current rate, etc.<br>
Please check available parameters in the table below.</p>
<p data-line="3318"><strong>List of <em>GET</em> request parameters for <a href="https://2captcha.com/res.php">https://2captcha.com/res.php</a></strong></p>
<table data-line="3321">
<thead data-line="3321">
<tr data-line="3321">
<th><strong>GET parameter</strong></th>
<th><strong>Type</strong></th>
<th><strong>Required</strong></th>
<th><strong>Description</strong></th>
</tr>
</thead>
<tbody data-line="3323">
<tr data-line="3323">
<td>key</td>
<td>String</td>
<td>Yes</td>
<td><a href="#solving_captchas">your API key</a></td>
</tr>
<tr data-line="3324">
<td>action</td>
<td>String</td>
<td>Yes</td>
<td>getbalance — get your balance <br>get — get answers for multiple captchas with one request. <br>Requires the list of captcha IDs in <em>ids</em> parameter. <br>get2 — get the price of sent captcha and the answer. <br>Requires captcha ID in <em>id</em> parameter.</td>
</tr>
<tr data-line="3325">
<td>ids</td>
<td>String</td>
<td>-</td>
<td>Comma separated IDs of your captchas.</td>
</tr>
<tr data-line="3326">
<td>json</td>
<td>Integer <br>Default: 0</td>
<td>No</td>
<td>0 - server will send the response as plain text <br>1 - tells the server to send the response as JSON</td>
</tr>
</tbody>
</table>
<p data-line="3328">Example request (plain text):</p>

        <details  data-line="3330" class="md-editor-code" open="">
          <summary class="md-editor-code-head">
            <div class="md-editor-code-flag"><span></span><span></span><span></span></div>
            <div class="md-editor-code-action">
              <span class="md-editor-code-lang"></span>
              <span class="md-editor-copy-button" data-tips="Copy">Copy</span>
              
              <span class="md-editor-collapse-tips"><svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="lucide lucide-circle-chevron-left md-editor-icon"><circle cx="12" cy="12" r="10"/><path d="m14 16-4-4 4-4"/></svg></span>
            </div>
          </summary>
          <pre><code class="language-" language=><span class="md-editor-code-block">https://2captcha.com/res.php?key=1abc234de56fab7c89012d34e56fa7b8&amp;action=get2&amp;id=2122988149</span><span rn-wrapper aria-hidden="true"><span></span></span></code></pre>

        </details>
      <p data-line="3332">Example response (plain text):</p>

        <details  data-line="3334" class="md-editor-code" open="">
          <summary class="md-editor-code-head">
            <div class="md-editor-code-flag"><span></span><span></span><span></span></div>
            <div class="md-editor-code-action">
              <span class="md-editor-code-lang"></span>
              <span class="md-editor-copy-button" data-tips="Copy">Copy</span>
              
              <span class="md-editor-collapse-tips"><svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="lucide lucide-circle-chevron-left md-editor-icon"><circle cx="12" cy="12" r="10"/><path d="m14 16-4-4 4-4"/></svg></span>
            </div>
          </summary>
          <pre><code class="language-" language=><span class="md-editor-code-block">OK|ABCDE|0.00085</span><span rn-wrapper aria-hidden="true"><span></span></span></code></pre>

        </details>
      <p data-line="3336">Example request (JSON):</p>

        <details  data-line="3338" class="md-editor-code" open="">
          <summary class="md-editor-code-head">
            <div class="md-editor-code-flag"><span></span><span></span><span></span></div>
            <div class="md-editor-code-action">
              <span class="md-editor-code-lang"></span>
              <span class="md-editor-copy-button" data-tips="Copy">Copy</span>
              
              <span class="md-editor-collapse-tips"><svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="lucide lucide-circle-chevron-left md-editor-icon"><circle cx="12" cy="12" r="10"/><path d="m14 16-4-4 4-4"/></svg></span>
            </div>
          </summary>
          <pre><code class="language-" language=><span class="md-editor-code-block">https://2captcha.com/res.php?key=1abc234de56fab7c89012d34e56fa7b8&amp;action=get2&amp;id=2122988149&amp;json=1</span><span rn-wrapper aria-hidden="true"><span></span></span></code></pre>

        </details>
      <p data-line="3340">Example response (JSON):</p>

        <details  data-line="3342" class="md-editor-code" open="">
          <summary class="md-editor-code-head">
            <div class="md-editor-code-flag"><span></span><span></span><span></span></div>
            <div class="md-editor-code-action">
              <span class="md-editor-code-lang"></span>
              <span class="md-editor-copy-button" data-tips="Copy">Copy</span>
              
              <span class="md-editor-collapse-tips"><svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="lucide lucide-circle-chevron-left md-editor-icon"><circle cx="12" cy="12" r="10"/><path d="m14 16-4-4 4-4"/></svg></span>
            </div>
          </summary>
          <pre><code class="language-" language=><span class="md-editor-code-block">{
&quot;status&quot;:1,
&quot;request&quot;:&quot;ABCDE&quot;,
&quot;price&quot;:&quot;0.00085&quot;
}</span><span rn-wrapper aria-hidden="true"><span></span><span></span><span></span><span></span><span></span></span></code></pre>

        </details>
      </section>
<section id="examples">
<h3 id="code-examples" tabindex="-1" data-line="3351"><a class="header-anchor" href="#code-examples">Code Examples</a></h3>
<p data-line="3353">We invite you to explore our <a href="https://github.com/2captcha/">GitHub repository</a> where you can find libraries and modules for easy integration with our API:</p>
<ul data-line="3355">
<li data-line="3355">PHP <a href="https://github.com/2captcha/2captcha-php">[GitHub]</a> <a href="https://packagist.org/packages/2captcha/2captcha">[Packageist]</a></li>
<li data-line="3356">Java <a href="https://github.com/2captcha/2captcha-java">[GitHub]</a> <a href="https://search.maven.org/artifact/com.github.2captcha/2captcha-java">[Maven]</a></li>
<li data-line="3357">C# <a href="https://github.com/2captcha/2captcha-csharp">[GitHub]</a> <a href="https://www.nuget.org/packages/2captcha-csharp/">[Nuget]</a></li>
<li data-line="3358">Python <a href="https://github.com/2captcha/2captcha-python">[GitHub]</a> <a href="https://pypi.org/project/2captcha-python/">[PyPi]</a></li>
<li data-line="3359">JavaScript <a href="https://github.com/2captcha/2captcha-javascript">[GitHub]</a> <a href="https://www.npmjs.com/package/@2captcha/captcha-solver">[NPM]</a></li>
<li data-line="3360">GO <a href="https://github.com/2captcha/2captcha-go">[GitHub]</a></li>
<li data-line="3361">Ruby <a href="https://github.com/2captcha/2captcha-ruby">[GitHub]</a> <a href="https://rubygems.org/gems/ruby-2captcha">[RubyGems]</a></li>
<li data-line="3362">C++ <a href="https://github.com/2captcha/2captcha-cpp">[GitHub]</a></li>
</ul>
<p data-line="3364">You can find even more code examples and libraries simply searching <a href="https://github.com/search?q=2captcha+OR+rucaptcha">2captcha OR rucaptcha</a> on GitHub. If code is made for <a href="http://rucaptcha.com">rucaptcha.com</a> just replace the URL to <a href="http://2captcha.com">2captcha.com</a>, API is the same.</p>
</section>
<section id="sandbox">
<h3 id="sandbox-mode" tabindex="-1" data-line="3369"><a class="header-anchor" href="#sandbox-mode">Sandbox mode</a></h3>
<p data-line="3371">We provide Sandbox mode that allows you to see and solve your captchas by yourself.<br>
You can enable Sandbox mode in your <a href="https://2captcha.com/setting">settings</a></p>
<p data-line="3374">When Sandbox mode is enabled your captchas will not be distributed to wokers.</p>
<p data-line="3376">Normal captchas will be availble in <a href="https://2captcha.com/cabinet/">Workers Cabinet</a></p>
<p data-line="3378">Token-based captchas like reCAPTCHA V2, Geetest, etc are available in <a href="https://2captcha.com/workers-software">Workers' software</a></p>
<p data-line="3380"><strong>Important:</strong> to use wokers' software you need to switch to &quot;Worker&quot; mode using the top right dropdown menu. Then copy workers' key and use it in the software.</p>
<p data-line="3382"><strong>reCAPTCHA V3 is not supported</strong> in SandBox and will be distributed to workers.</p>
</section></div></div></div></div><div id="api-docs-sidebar" class="scrollbar-hide group absolute right-15 top-20 lg:sticky lg:left-0 lg:right-0 lg:top-0 lg:flex lg:max-h-screen lg:w-[270px] lg:flex-col lg:overflow-y-auto lg:px-30 lg:py-40"><div class="fixed left-0 top-0 hidden h-full w-full bg-cool-gray bg-opacity-50 group-[&amp;.open]:block lg:hidden lg:group-[&amp;.open]:hidden" aria-hidden="true"></div><button type="button" class="flex size-40 items-center justify-center rounded-5 bg-cool-gray text-base text-dark lg:hidden"><svg class="icon icon-ellipsis-vertical"><use xlink:href="/dist/web/assets/symbol-defs-Ba5hjZu8.svg#icon-ellipsis-vertical" href="/dist/web/assets/symbol-defs-Ba5hjZu8.svg#icon-ellipsis-vertical"></use></svg><span class="sr-only">Toggle API docs navigation</span></button><div class="lg:rounded-0 invisible absolute right-0 top-0 max-h-[620px] w-[300px] overflow-y-auto rounded-5 border-2 border-frost-gray bg-white px-30 py-15 text-dark group-[&amp;.open]:visible lg:visible lg:static lg:right-auto lg:top-auto lg:flex lg:max-h-none lg:w-full lg:flex-grow lg:flex-col lg:overflow-y-visible lg:border-0 lg:px-0 lg:py-0"><div class="-mx-10 mb-15 flex items-center py-[2px] pl-10 pr-[2px] text-dark bg-cool-gray rounded-5 text-sm"><span class="mr-auto">API version:</span><p class="flex items-center"><a aria-current="page" class="min-w-0 rounded-5 bg-transparent px-10 py-[6px] text-steel-gray [&amp;.active]:bg-steel-gray [&amp;.active]:text-white active" href="/2captcha-api">API v1</a><a class="min-w-0 rounded-5 bg-transparent px-10 py-[6px] text-steel-gray [&amp;.active]:bg-steel-gray [&amp;.active]:text-white" href="/api-docs">API v2</a></p></div><ul><li class="mb-5 last:mb-0"><a aria-current="page" class="relative -mx-10 flex items-center rounded-5 bg-transparent px-10 py-5 text-dark transition-colors hover:bg-cool-gray [&amp;.active]:bg-cool-gray active" href="/2captcha-api"><span aria-hidden="true" class="absolute -left-10 bottom-5 top-5 w-5 rounded-5 bg-teal"></span><span class="font-semibold">API v1</span></a></li><li class="mb-5 last:mb-0"><a aria-current="page" class="relative -mx-10 flex items-center rounded-5 bg-transparent px-10 py-5 text-dark transition-colors hover:bg-cool-gray [&amp;.active]:bg-cool-gray" href="/2captcha-api#intro"><span class="font-semibold">Introduction</span></a></li><li class="mb-5 last:mb-0"><a aria-current="page" class="relative -mx-10 flex items-center rounded-5 bg-transparent px-10 py-5 text-dark transition-colors hover:bg-cool-gray [&amp;.active]:bg-cool-gray" href="/2captcha-api#recent_changes"><span class="font-semibold">Recent Changes</span></a></li><li class="mb-5 last:mb-0"><a aria-current="page" class="relative -mx-10 flex items-center rounded-5 bg-transparent px-10 py-5 text-dark transition-colors hover:bg-cool-gray [&amp;.active]:bg-cool-gray" href="/2captcha-api#rates"><span class="font-semibold">Rates</span></a></li><li class="mb-5 last:mb-0"><a aria-current="page" class="relative -mx-10 flex items-center rounded-5 bg-transparent px-10 py-5 text-dark transition-colors hover:bg-cool-gray [&amp;.active]:bg-cool-gray" href="/2captcha-api#demo"><span class="font-semibold">Demo page</span></a></li><li class="mb-5 last:mb-0"><a aria-current="page" class="relative -mx-10 flex items-center rounded-5 bg-transparent px-10 py-5 text-dark transition-colors hover:bg-cool-gray [&amp;.active]:bg-cool-gray" href="/2captcha-api#solving_captchas"><span class="font-semibold">Solving Captchas</span></a><ul class="hidden"><li><a aria-current="page" class="relative -mx-10 flex rounded-5 bg-transparent px-10 py-5 text-sm text-dark transition-colors hover:bg-cool-gray [&amp;.active]:bg-cool-gray" href="/2captcha-api#solving_normal_captcha"><span>Normal Captcha</span></a></li><li><a aria-current="page" class="relative -mx-10 flex rounded-5 bg-transparent px-10 py-5 text-sm text-dark transition-colors hover:bg-cool-gray [&amp;.active]:bg-cool-gray" href="/2captcha-api#solving_text_captcha"><span>Text Captcha</span></a></li><li><a aria-current="page" class="relative -mx-10 flex rounded-5 bg-transparent px-10 py-5 text-sm text-dark transition-colors hover:bg-cool-gray [&amp;.active]:bg-cool-gray" href="/2captcha-api#solving_recaptchav2_new"><span>reCAPTCHA V2</span></a></li><li><a aria-current="page" class="relative -mx-10 flex rounded-5 bg-transparent px-10 py-5 text-sm text-dark transition-colors hover:bg-cool-gray [&amp;.active]:bg-cool-gray" href="/2captcha-api#callback"><span>reCAPTCHA Callback</span></a></li><li><a aria-current="page" class="relative -mx-10 flex rounded-5 bg-transparent px-10 py-5 text-sm text-dark transition-colors hover:bg-cool-gray [&amp;.active]:bg-cool-gray" href="/2captcha-api#invisible"><span>Invisible reCAPTCHA V2</span></a></li><li><a aria-current="page" class="relative -mx-10 flex rounded-5 bg-transparent px-10 py-5 text-sm text-dark transition-colors hover:bg-cool-gray [&amp;.active]:bg-cool-gray" href="/2captcha-api#solving_recaptchav3"><span>reCAPTCHA V3</span></a></li><li><a aria-current="page" class="relative -mx-10 flex rounded-5 bg-transparent px-10 py-5 text-sm text-dark transition-colors hover:bg-cool-gray [&amp;.active]:bg-cool-gray" href="/2captcha-api#solving_recaptcha_enterprise"><span>reCAPTCHA Enterprise</span></a></li><li><a aria-current="page" class="relative -mx-10 flex rounded-5 bg-transparent px-10 py-5 text-sm text-dark transition-colors hover:bg-cool-gray [&amp;.active]:bg-cool-gray" href="/2captcha-api#grid"><span>Grid</span></a></li><li><a aria-current="page" class="relative -mx-10 flex rounded-5 bg-transparent px-10 py-5 text-sm text-dark transition-colors hover:bg-cool-gray [&amp;.active]:bg-cool-gray" href="/2captcha-api#coordinates"><span>Coordinates</span></a></li><li><a aria-current="page" class="relative -mx-10 flex rounded-5 bg-transparent px-10 py-5 text-sm text-dark transition-colors hover:bg-cool-gray [&amp;.active]:bg-cool-gray" href="/2captcha-api#solving_rotatecaptcha"><span>RotateCaptcha</span></a></li><li><a aria-current="page" class="relative -mx-10 flex rounded-5 bg-transparent px-10 py-5 text-sm text-dark transition-colors hover:bg-cool-gray [&amp;.active]:bg-cool-gray" href="/2captcha-api#solving_funcaptcha_new"><span>Arkose Labs FunCaptcha</span></a></li><li><a aria-current="page" class="relative -mx-10 flex rounded-5 bg-transparent px-10 py-5 text-sm text-dark transition-colors hover:bg-cool-gray [&amp;.active]:bg-cool-gray" href="/2captcha-api#solving_geetest"><span>Geetest</span></a></li><li><a aria-current="page" class="relative -mx-10 flex rounded-5 bg-transparent px-10 py-5 text-sm text-dark transition-colors hover:bg-cool-gray [&amp;.active]:bg-cool-gray" href="/2captcha-api#geetest-v4"><span>Geetest v4</span></a></li><li><a aria-current="page" class="relative -mx-10 flex rounded-5 bg-transparent px-10 py-5 text-sm text-dark transition-colors hover:bg-cool-gray [&amp;.active]:bg-cool-gray" href="/2captcha-api#solving_capy"><span>Capy Puzzle</span></a></li><li><a aria-current="page" class="relative -mx-10 flex rounded-5 bg-transparent px-10 py-5 text-sm text-dark transition-colors hover:bg-cool-gray [&amp;.active]:bg-cool-gray" href="/2captcha-api#solving_tiktok"><span>TikTok</span></a></li><li><a aria-current="page" class="relative -mx-10 flex rounded-5 bg-transparent px-10 py-5 text-sm text-dark transition-colors hover:bg-cool-gray [&amp;.active]:bg-cool-gray" href="/2captcha-api#lemin"><span>Lemin Cropped Captcha</span></a></li><li><a aria-current="page" class="relative -mx-10 flex rounded-5 bg-transparent px-10 py-5 text-sm text-dark transition-colors hover:bg-cool-gray [&amp;.active]:bg-cool-gray" href="/2captcha-api#turnstile"><span>Cloudflare Turnstile</span></a></li><li><a aria-current="page" class="relative -mx-10 flex rounded-5 bg-transparent px-10 py-5 text-sm text-dark transition-colors hover:bg-cool-gray [&amp;.active]:bg-cool-gray" href="/2captcha-api#amazon-waf"><span>Amazon WAF</span></a></li><li><a aria-current="page" class="relative -mx-10 flex rounded-5 bg-transparent px-10 py-5 text-sm text-dark transition-colors hover:bg-cool-gray [&amp;.active]:bg-cool-gray" href="/2captcha-api#mtcaptcha"><span>MTCaptcha</span></a></li><li><a aria-current="page" class="relative -mx-10 flex rounded-5 bg-transparent px-10 py-5 text-sm text-dark transition-colors hover:bg-cool-gray [&amp;.active]:bg-cool-gray" href="/2captcha-api#cutcaptcha"><span>Cutcaptcha</span></a></li><li><a aria-current="page" class="relative -mx-10 flex rounded-5 bg-transparent px-10 py-5 text-sm text-dark transition-colors hover:bg-cool-gray [&amp;.active]:bg-cool-gray" href="/2captcha-api#friendly-captcha"><span>Friendly Captcha</span></a></li><li><a aria-current="page" class="relative -mx-10 flex rounded-5 bg-transparent px-10 py-5 text-sm text-dark transition-colors hover:bg-cool-gray [&amp;.active]:bg-cool-gray" href="/2captcha-api#atb-captcha"><span>atbCAPTCHA</span></a></li><li><a aria-current="page" class="relative -mx-10 flex rounded-5 bg-transparent px-10 py-5 text-sm text-dark transition-colors hover:bg-cool-gray [&amp;.active]:bg-cool-gray" href="/2captcha-api#tencent"><span>Tencent</span></a></li><li><a aria-current="page" class="relative -mx-10 flex rounded-5 bg-transparent px-10 py-5 text-sm text-dark transition-colors hover:bg-cool-gray [&amp;.active]:bg-cool-gray" href="/2captcha-api#datadome"><span>DataDome</span></a></li><li><a aria-current="page" class="relative -mx-10 flex rounded-5 bg-transparent px-10 py-5 text-sm text-dark transition-colors hover:bg-cool-gray [&amp;.active]:bg-cool-gray" href="/2captcha-api#audio"><span>Audio Recognition</span></a></li><li><a aria-current="page" class="relative -mx-10 flex rounded-5 bg-transparent px-10 py-5 text-sm text-dark transition-colors hover:bg-cool-gray [&amp;.active]:bg-cool-gray" href="/2captcha-api#bounding_box"><span>Bounding Box Method</span></a></li><li><a aria-current="page" class="relative -mx-10 flex rounded-5 bg-transparent px-10 py-5 text-sm text-dark transition-colors hover:bg-cool-gray [&amp;.active]:bg-cool-gray" href="/2captcha-api#prosopo-procaptcha"><span>Prosopo Procaptcha</span></a></li><li><a aria-current="page" class="relative -mx-10 flex rounded-5 bg-transparent px-10 py-5 text-sm text-dark transition-colors hover:bg-cool-gray [&amp;.active]:bg-cool-gray" href="/2captcha-api#captchafox"><span>CaptchaFox</span></a></li><li><a aria-current="page" class="relative -mx-10 flex rounded-5 bg-transparent px-10 py-5 text-sm text-dark transition-colors hover:bg-cool-gray [&amp;.active]:bg-cool-gray" href="/2captcha-api#vkcaptcha"><span>VK Captcha</span></a></li><li><a aria-current="page" class="relative -mx-10 flex rounded-5 bg-transparent px-10 py-5 text-sm text-dark transition-colors hover:bg-cool-gray [&amp;.active]:bg-cool-gray" href="/2captcha-api#temucaptcha"><span>Temu Captcha</span></a></li><li><a aria-current="page" class="relative -mx-10 flex rounded-5 bg-transparent px-10 py-5 text-sm text-dark transition-colors hover:bg-cool-gray [&amp;.active]:bg-cool-gray" href="/2captcha-api#altchacaptcha"><span>Altcha Captcha</span></a></li></ul></li><li class="mb-5 last:mb-0"><a aria-current="page" class="relative -mx-10 flex items-center rounded-5 bg-transparent px-10 py-5 text-dark transition-colors hover:bg-cool-gray [&amp;.active]:bg-cool-gray" href="/2captcha-api#language"><span class="font-semibold">Language support</span></a></li><li class="mb-5 last:mb-0"><a aria-current="page" class="relative -mx-10 flex items-center rounded-5 bg-transparent px-10 py-5 text-dark transition-colors hover:bg-cool-gray [&amp;.active]:bg-cool-gray" href="/2captcha-api#error_handling"><span class="font-semibold">Error Handling</span></a><ul class="hidden"><li><a aria-current="page" class="relative -mx-10 flex rounded-5 bg-transparent px-10 py-5 text-sm text-dark transition-colors hover:bg-cool-gray [&amp;.active]:bg-cool-gray" href="/2captcha-api#in_errors"><span>List of in.php errors</span></a></li><li><a aria-current="page" class="relative -mx-10 flex rounded-5 bg-transparent px-10 py-5 text-sm text-dark transition-colors hover:bg-cool-gray [&amp;.active]:bg-cool-gray" href="/2captcha-api#res_errors"><span>List of res.php errors</span></a></li></ul></li><li class="mb-5 last:mb-0"><a aria-current="page" class="relative -mx-10 flex items-center rounded-5 bg-transparent px-10 py-5 text-dark transition-colors hover:bg-cool-gray [&amp;.active]:bg-cool-gray" href="/2captcha-api#debugging"><span class="font-semibold">Debugging &amp; Sandbox</span></a></li><li class="mb-5 last:mb-0"><a aria-current="page" class="relative -mx-10 flex items-center rounded-5 bg-transparent px-10 py-5 text-dark transition-colors hover:bg-cool-gray [&amp;.active]:bg-cool-gray" href="/2captcha-api#limits"><span class="font-semibold">Request limits</span></a><ul class="hidden"><li><a aria-current="page" class="relative -mx-10 flex rounded-5 bg-transparent px-10 py-5 text-sm text-dark transition-colors hover:bg-cool-gray [&amp;.active]:bg-cool-gray" href="/2captcha-api#limit_errors"><span>List of error codes for request limitations</span></a></li></ul></li><li class="mb-5 last:mb-0"><a aria-current="page" class="relative -mx-10 flex items-center rounded-5 bg-transparent px-10 py-5 text-dark transition-colors hover:bg-cool-gray [&amp;.active]:bg-cool-gray" href="/2captcha-api#proxies"><span class="font-semibold">Using proxies</span></a><ul class="hidden"><li><a aria-current="page" class="relative -mx-10 flex rounded-5 bg-transparent px-10 py-5 text-sm text-dark transition-colors hover:bg-cool-gray [&amp;.active]:bg-cool-gray" href="/2captcha-api#recaptchav2new_proxy"><span>POST parameters for proxies</span></a></li></ul></li><li class="mb-5 last:mb-0"><a aria-current="page" class="relative -mx-10 flex items-center rounded-5 bg-transparent px-10 py-5 text-dark transition-colors hover:bg-cool-gray [&amp;.active]:bg-cool-gray" href="/2captcha-api#cookies"><span class="font-semibold">Cookies</span></a></li><li class="mb-5 last:mb-0"><a aria-current="page" class="relative -mx-10 flex items-center rounded-5 bg-transparent px-10 py-5 text-dark transition-colors hover:bg-cool-gray [&amp;.active]:bg-cool-gray" href="/2captcha-api#pingback"><span class="font-semibold">Pingback (callback)</span></a><ul class="hidden"><li><a aria-current="page" class="relative -mx-10 flex rounded-5 bg-transparent px-10 py-5 text-sm text-dark transition-colors hover:bg-cool-gray [&amp;.active]:bg-cool-gray" href="/2captcha-api#manage_pingback"><span>Manage pingback addresses</span></a></li><li><a aria-current="page" class="relative -mx-10 flex rounded-5 bg-transparent px-10 py-5 text-sm text-dark transition-colors hover:bg-cool-gray [&amp;.active]:bg-cool-gray" href="/2captcha-api#pingback_examples"><span>Request examples</span></a></li></ul></li><li class="mb-5 last:mb-0"><a aria-current="page" class="relative -mx-10 flex items-center rounded-5 bg-transparent px-10 py-5 text-dark transition-colors hover:bg-cool-gray [&amp;.active]:bg-cool-gray" href="/2captcha-api#complain"><span class="font-semibold">Reporting answers</span></a></li><li class="mb-5 last:mb-0"><a aria-current="page" class="relative -mx-10 flex items-center rounded-5 bg-transparent px-10 py-5 text-dark transition-colors hover:bg-cool-gray [&amp;.active]:bg-cool-gray" href="/2captcha-api#additional"><span class="font-semibold">Additional methods</span></a></li><li class="mb-5 last:mb-0"><a aria-current="page" class="relative -mx-10 flex items-center rounded-5 bg-transparent px-10 py-5 text-dark transition-colors hover:bg-cool-gray [&amp;.active]:bg-cool-gray" href="/2captcha-api#examples"><span class="font-semibold">Code Examples</span></a></li><li class="mb-5 last:mb-0"><a aria-current="page" class="relative -mx-10 flex items-center rounded-5 bg-transparent px-10 py-5 text-dark transition-colors hover:bg-cool-gray [&amp;.active]:bg-cool-gray" href="/2captcha-api#sandbox"><span class="font-semibold">Sandbox</span></a></li></ul><div class="-mx-10"><span class="mb-30 mt-20 block h-px w-full rounded-[1px] bg-frost-gray"></span><a href="https://github.com/2captcha" class="mb-20 inline-flex"><img src="/dist/web/assets/github-BZW_9BSG.svg" width="75" height="20" alt="Logo of «GitHub»"/></a><ul class="_list_1pb95_1 _listCompact_1pb95_38"><li class="_listItem_1pb95_17"><a href="https://github.com/2captcha/2captcha-php" class="_link_1pb95_22 bg-cool-gray"><img src="/dist/web/assets/php-XQrDwDyD.svg" alt="We support API for «PHP» language" width="30" height="16" loading="lazy"/></a></li><li class="_listItem_1pb95_17"><a href="https://github.com/2captcha/2captcha-python" class="_link_1pb95_22 bg-cool-gray"><img src="/dist/web/assets/python-DZun8qE4.svg" alt="We support API for «Python» language" width="63" height="16" loading="lazy"/></a></li><li class="_listItem_1pb95_17"><a href="https://github.com/2captcha/2captcha-go" class="_link_1pb95_22 bg-cool-gray"><img src="/dist/web/assets/go-BqCBfcdO.svg" alt="We support API for «Go» language" width="42" height="16" loading="lazy"/></a></li><li class="_listItem_1pb95_17"><a href="https://github.com/2captcha/2captcha-ruby" class="_link_1pb95_22 bg-cool-gray"><img src="/dist/web/assets/ruby-D6Su2XHV.svg" alt="We support API for «Ruby» language" width="55" height="16" loading="lazy"/></a></li><li class="_listItem_1pb95_17"><a href="https://github.com/2captcha/2captcha-csharp" class="_link_1pb95_22 bg-cool-gray"><img src="/dist/web/assets/csharp-aoRVdVjr.svg" alt="We support API for «C#» language" width="18" height="16" loading="lazy"/></a></li><li class="_listItem_1pb95_17"><a href="https://github.com/2captcha/2captcha-java" class="_link_1pb95_22 bg-cool-gray"><img src="/dist/web/assets/java-z9GNaYHD.svg" alt="We support API for «Java» language" width="30" height="16" loading="lazy"/></a></li><li class="_listItem_1pb95_17"><a href="https://github.com/2captcha/2captcha-javascript" class="_link_1pb95_22 bg-cool-gray"><img src="/dist/web/assets/javascript-BYoBKPQd.svg" alt="We support API for «JavaScript» language" width="16" height="16" loading="lazy"/></a></li></ul></div></div></div></div><aside class="_section_1gqi2_1"><div class="container _sectionInner_1gqi2_76"><div class="_mainContent_1gqi2_81"><h2 class="_title_1gqi2_13"><span><b>Enterprise support plan.</b> For more comprehensive needs.</span></h2><ul class="_list_1gqi2_32"><li class="_listItem_1gqi2_39"><svg class="icon icon-code-settings-2 _listItemIcon_1gqi2_49"><use xlink:href="/dist/web/assets/symbol-defs-Ba5hjZu8.svg#icon-code-settings-2" href="/dist/web/assets/symbol-defs-Ba5hjZu8.svg#icon-code-settings-2"></use></svg><span>Assistance with integrating custom API solutions</span></li><li class="_listItem_1gqi2_39"><svg class="icon icon-lightning-2 _listItemIcon_1gqi2_49"><use xlink:href="/dist/web/assets/symbol-defs-Ba5hjZu8.svg#icon-lightning-2" href="/dist/web/assets/symbol-defs-Ba5hjZu8.svg#icon-lightning-2"></use></svg><span>Faster response times for your requests</span></li><li class="_listItem_1gqi2_39"><svg class="icon icon-magnifier-2 _listItemIcon_1gqi2_49"><use xlink:href="/dist/web/assets/symbol-defs-Ba5hjZu8.svg#icon-magnifier-2" href="/dist/web/assets/symbol-defs-Ba5hjZu8.svg#icon-magnifier-2"></use></svg><span>Code review and debugging support</span></li></ul></div><a class="_actionBtn_1gqi2_64 _button_1cbf7_1 _buttonSecondaryWhite_1cbf7_165 _buttonMd_1cbf7_30" href="/support/enterprise#features">Read more</a><button type="button" class="_closeBtn_1gqi2_57 _button_1cbf7_1 _buttonService_1cbf7_186 _buttonMd_1cbf7_30"><svg class="icon icon-x"><use xlink:href="/dist/web/assets/symbol-defs-Ba5hjZu8.svg#icon-x" href="/dist/web/assets/symbol-defs-Ba5hjZu8.svg#icon-x"></use></svg><span class="visually-hidden">Hide widget</span></button></div></aside></div></main><footer class="pt-25 pb-25 bg-charcoal-blue px-10 text-white lg:px-0 lg:pt-40"><div class="container"><div class="lg:mb-30 lg:flex"><div class="mb-40 lg:order-1 lg:mb-0 lg:flex lg:flex-col lg:w-[680px]"><div class="mb-35 rounded-10 bg-midnight-blue px-15 pb-20 pt-15 text-white lg:flex lg:items-center lg:justify-between lg:py-10 lg:pl-20 lg:pr-10"><p class="_header_tarhc_1 mb-10 lg:mb-0">Scale up your business with 2Captcha</p><button type="button" class="_button_1cbf7_1 _buttonPrimary_1cbf7_40 _buttonMd_1cbf7_30">Contact sales</button></div><nav class="mb-35 gap-x-15 gap-y-25 lg:gap-x-40 grid grid-cols-[repeat(auto-fit,165px)] lg:flex-grow lg:grid-cols-[repeat(auto-fit,200px)]"><div class="row-span-1"><span class="block mb-15 text-base font-medium text-silver-blue"><a href="/" class="flex hover:underline focus:underline _link_1kv8l_1">Captcha solver</a></span><ul><li class="mb-15 last:mb-0"><a href="/api-docs" class="flex hover:underline focus:underline _link_1kv8l_1">Captcha solver API</a></li><li class="mb-15 last:mb-0"><a href="/captcha-bypass-extension" class="flex hover:underline focus:underline _link_1kv8l_1">Browser extension</a></li><li class="mb-15 last:mb-0"><a href="/p/puppeteer-captcha-solver" class="flex hover:underline focus:underline _link_1kv8l_1">Puppeteer</a></li><li class="mb-15 last:mb-0"><a href="/p/selenium-captcha-solver" class="flex hover:underline focus:underline _link_1kv8l_1">Selenium</a></li><li class="mb-15 last:mb-0"><a href="/h" class="flex hover:underline focus:underline _link_1kv8l_1">How-to tutorials</a></li></ul></div><div class="row-span-2"><span class="block mb-15 text-base font-medium text-silver-blue"><a href="/p/break-captcha" class="flex hover:underline focus:underline _link_1kv8l_1">Captcha supported</a></span><ul><li class="mb-15 last:mb-0"><a href="/p/bypass-recaptcha" class="flex hover:underline focus:underline _link_1kv8l_1">reCAPTCHA</a></li><li class="mb-15 last:mb-0"><a href="/p/image-picture-captcha-solver" class="flex hover:underline focus:underline _link_1kv8l_1">Image Captcha</a></li><li class="mb-15 last:mb-0"><a href="/p/cloudflare-turnstile" class="flex hover:underline focus:underline _link_1kv8l_1">Cloudflare Turnstile</a></li><li class="mb-15 last:mb-0"><a href="/p/funcaptcha" class="flex hover:underline focus:underline _link_1kv8l_1">Arkose Labs captcha (FunCaptcha)</a></li><li class="mb-15 last:mb-0"><a href="/p/amazon-captcha-bypass" class="flex hover:underline focus:underline _link_1kv8l_1">Amazon Captcha</a></li><li class="mb-15 last:mb-0"><a href="/p/break-captcha" class="flex hover:underline focus:underline _link_1kv8l_1">More types</a></li></ul></div><div class="row-span-3"><span class="block mb-15 text-base font-medium text-silver-blue"><a href="/lang" class="flex hover:underline focus:underline _link_1kv8l_1">Captcha solver SDK</a></span><ul><li class="mb-15 last:mb-0"><a href="/lang/python" class="flex hover:underline focus:underline _link_1kv8l_1">Python</a></li><li class="mb-15 last:mb-0"><a href="/lang/php" class="flex hover:underline focus:underline _link_1kv8l_1">PHP</a></li><li class="mb-15 last:mb-0"><a href="/lang/java" class="flex hover:underline focus:underline _link_1kv8l_1">Java</a></li><li class="mb-15 last:mb-0"><a href="/lang/csharp" class="flex hover:underline focus:underline _link_1kv8l_1">C#</a></li><li class="mb-15 last:mb-0"><a href="/lang/go" class="flex hover:underline focus:underline _link_1kv8l_1">Go</a></li><li class="mb-15 last:mb-0"><a href="/lang/javascript" class="flex hover:underline focus:underline _link_1kv8l_1">JavaScript</a></li><li class="mb-15 last:mb-0"><a href="/lang/ruby" class="flex hover:underline focus:underline _link_1kv8l_1">Ruby</a></li></ul></div><div class="row-span-3"><span class="block mb-15 text-base font-medium text-silver-blue">Company</span><ul><li class="mb-15 last:mb-0"><a href="/pricing" class="flex hover:underline focus:underline _link_1kv8l_1">Pricing</a></li><li class="mb-15 last:mb-0"><a href="/support/enterprise" class="flex hover:underline focus:underline _link_1kv8l_1">Enterprise support</a></li><li class="mb-15 last:mb-0"><a href="/affiliate" class="flex hover:underline focus:underline _link_1kv8l_1">Affiliate program</a></li><li class="mb-15 last:mb-0"><a href="/about" class="flex hover:underline focus:underline _link_1kv8l_1">About</a></li><li class="mb-15 last:mb-0"><a href="/blog" class="flex hover:underline focus:underline _link_1kv8l_1">Blog</a></li><li class="mb-15 last:mb-0"><a href="/software" class="flex hover:underline focus:underline _link_1kv8l_1">Software</a></li></ul></div><div class="row-span-1"><span class="block mb-15 text-base font-medium text-silver-blue"><a href="/proxy" class="flex hover:underline focus:underline _link_1kv8l_1">Proxy Services</a></span><ul><li class="mb-15 last:mb-0"><a href="/proxy/residential-proxies" class="flex hover:underline focus:underline _link_1kv8l_1">Residential proxies</a></li><li class="mb-15 last:mb-0"><a href="/proxy/socks5-proxies" class="flex hover:underline focus:underline _link_1kv8l_1">SOCKS5 proxies</a></li></ul></div><div class="row-span-1"><span class="block mb-15 text-base font-medium text-silver-blue"><a href="/data" class="flex hover:underline focus:underline _link_1kv8l_1">Data annotation service</a></span><ul><li class="mb-15 last:mb-0"><a href="/data/dataset-annotation" class="flex hover:underline focus:underline _link_1kv8l_1">Dataset API</a></li></ul></div></nav><button type="button" class="_trigger_1eybx_5 _languageSwitcherTrigger_1r36p_1"><img data-testid="circle-country-flag" class="_languageIcon_1eybx_12" width="24" height="24" loading="lazy" title="us" src="https://hatscripts.github.io/circle-flags/flags/us.svg"/><span>English</span></button></div><div class="-mx-15 mb-40 h-[1px] bg-steel-gray lg:hidden" aria-hidden="true"></div><div class="mx-auto mb-40 flex w-[260px] flex-col lg:ml-0 lg:mb-0 lg:mr-auto"><a class="mb-15 mx-auto flex lg:mx-0 lg:mr-auto _link_1kv8l_1" href="/"><img src="/dist/web/assets/twocaptcha-logo-CEPhBusg.svg" alt="Logo of «2Captcha»" width="150" height="32" loading="lazy"/><span class="sr-only">To home page</span></a><p class="mb-25 text-center text-sm text-silver-blue lg:mb-35 lg:text-left">Copying any part of this website without the explicit permission of the website owner is illegal.</p><ul class="mb-20 grid grid-cols-5 gap-20 lg:mb-30"><li><img src="/dist/web/assets/gdpr-q9ePlZ-U.svg" width="36" height="36" alt="«GDPR» logo" loading="lazy"/></li><li><img src="/dist/web/assets/ssl-D7tggeHC.svg" width="36" height="36" alt="«SSL secured» logo" loading="lazy"/></li><li><img src="/dist/web/assets/google-privacy-policy-DHj6kKJ1.svg" width="36" height="36" alt="«Google privacy policy» logo" loading="lazy"/></li><li><img src="/dist/web/assets/smime-lbrwT8_L.svg" width="36" height="36" alt="«S/MIME» logo" loading="lazy"/></li><li><img src="/dist/web/assets/ccpa-BvZQ0fAu.svg" width="36" height="36" alt="«CCPA» logo" loading="lazy"/></li></ul><ul class="mb-20 grid grid-cols-2 items-center border-x border-[#304562] lg:mb-30"><li class="border-r border-[#304562]"><a href="https://sourceforge.net/software/product/2Captcha" class="flex justify-center"><img src="/dist/web/assets/sourceforge-ITBVPTIi.svg" width="99" height="35" alt="«SourceForge» rating - 4.5 out of 5 stars" loading="lazy"/></a></li><li><a href="https://www.g2.com/products/2captcha/reviews" class="flex justify-center"><img src="/dist/web/assets/g2-fYXYZ5sD.svg" width="68" height="35" alt="«G2» rating — 4.5 out of 5 stars" loading="lazy"/></a></li></ul><a class="mb-30 rounded-5 flex items-center border border-[#304562] bg-charcoal-blue hover:bg-midnight-blue focus:bg-midnight-blue transition-colors py-[8px] pl-20 pr-[11px] lg:mb-auto" href="https://captchathecat.com/service/2captcha"><img class="mr-20" src="/dist/web/assets/number-one-wb0-0nq8.svg" width="57" height="32" alt="#1" loading="lazy"/><div class="leading-none"><span class="mb-5 block text-[7px] uppercase leading-none tracking-widest text-[#469DFF]">In the monitoring service rating</span><img src="/dist/web/assets/captchathecat-logo-xCdqRum_.svg" width="150" height="18" alt="«CaptchaTheCat» logo" loading="lazy"/></div></a><div class="flex flex-col items-center text-silver-blue mb-25 lg:items-start"><span class="mb-15">Follow us</span><ul class="grid grid-cols-4 gap-x-15"><li><a class="block group" href="https://github.com/2captcha"><img class="block group-hover:hidden group-focus:hidden" src="/dist/web/assets/github-DR3vTvSc.svg" width="26" height="26" alt="«2Captcha» on GitHub" loading="lazy"/><img class="hidden group-hover:block group-focus:block" src="/dist/web/assets/github-active-BraKMO-t.svg" width="26" height="26" alt="«2Captcha» on GitHub" loading="lazy"/></a></li><li><a class="block group" href="https://www.linkedin.com/company/2captcha"><img class="block group-hover:hidden group-focus:hidden" src="/dist/web/assets/linkedin-BKbJnIZ7.svg" width="26" height="26" alt="«2Captcha» on LinkedIn" loading="lazy"/><img class="hidden group-hover:block group-focus:block" src="/dist/web/assets/linkedin-active-DYHFnMi-.svg" width="26" height="26" alt="«2Captcha» on LinkedIn" loading="lazy"/></a></li><li><a class="block group" href="https://x.com/2captcha"><img class="block group-hover:hidden group-focus:hidden" src="/dist/web/assets/x-Dlk7_GIL.svg" width="26" height="26" alt="«2Captcha» on x" loading="lazy"/><img class="hidden group-hover:block group-focus:block" src="/dist/web/assets/x-active-BWmb0OWV.svg" width="26" height="26" alt="«2Captcha» on x" loading="lazy"/></a></li><li><a class="block group" href="https://www.youtube.com/@2captcha_official"><img class="block group-hover:hidden group-focus:hidden" src="/dist/web/assets/youtube-DrkktqZK.svg" width="26" height="26" alt="«2Captcha» YouTube channel" loading="lazy"/><img class="hidden group-hover:block group-focus:block" src="/dist/web/assets/youtube-active-Da88tfIV.svg" width="26" height="26" alt="«2Captcha» YouTube channel" loading="lazy"/></a></li></ul></div><div class="flex flex-col items-center text-silver-blue lg:items-start"><span class="mb-15">Contact us</span><div class="flex items-center px-10 py-px rounded-full bg-silver-blue text-sm text-charcoal-blue select-none"><svg class="icon icon-mail-opened mr-10"><use xlink:href="/dist/web/assets/symbol-defs-Ba5hjZu8.svg#icon-mail-opened" href="/dist/web/assets/symbol-defs-Ba5hjZu8.svg#icon-mail-opened"></use></svg>info@2captcha.com</div></div></div></div><div class="-mx-15 lg:mb-30 mb-40 h-[1px] bg-steel-gray lg:mx-auto" aria-hidden="true"></div><div class="mb-30 lg:mb-25 grid grid-cols-1 gap-10 lg:grid-cols-2"><div class="rounded-10 bg-midnight-blue p-10 md:mb-0 md:grid md:grid-cols-2 md:gap-x-10"><a class="rounded-5 mb-10 block bg-teal-dark hover:bg-teal focus:bg-teal transition-colors p-[2px] focus:no-underline md:mb-0 md:flex md:flex-col md:items-start _link_1kv8l_1" href="/captcha-bypass-extension"><span class="w-full px-15 flex items-center rounded-[3px] bg-charcoal-blue bg-opacity-50 py-10 text-white md:flex-grow md:py-5"><img class="mr-10" src="/dist/web/assets/supported-browsers-CbecHGU3.svg" width="50" height="30" alt="Captcha bypass extension supported in Chrome and Firefox browsers" loading="lazy"/><span class="text-base font-medium leading-[20px]">Captcha bypass extension</span></span><span class="block px-[8px] pb-[1px] pt-[3px] text-[12px] leading-[18px] text-dark">Recommended extension</span></a><div class="rounded-5 bg-charcoal-blue p-[2px]"><a class="flex items-center rounded-[3px] bg-midnight-blue bg-opacity-50 hover:bg-opacity-100 focus:bg-opacity-100 transition-colors px-[10px] py-15" href="https://chrome.google.com/webstore/detail/recaptcha-solver-auto-cap/infdcenbdoibcacogknkjleclhnjdmfh"><img class="mr-10" src="/dist/web/assets/recaptcha-BOgYs7Ni.svg" width="16" height="16" loading="lazy" alt="reCAPTCHA logo"/><span class="text-[12px] font-medium leading-[20px] text-white">reCAPTCHA Solver Extension</span></a><span class="block px-[8px] pb-[1px] pt-[3px] text-[12px] leading-[18px] text-silver-blue">Alternative extensions</span></div></div><div class="rounded-10 bg-midnight-blue px-10 pb-10 pt-5 text-[12px] leading-[18px] md:flex md:flex-col"><span class="mb-5 block text-silver-blue">New features</span><ul class="md:grid md:flex-grow md:grid-cols-2 md:gap-x-10"><li class="mb-10 last:mb-0 md:mb-0 md:flex md:flex-col"><a class="pr-15 rounded-5 md:px-15 flex items-center bg-charcoal-blue bg-opacity-50 hover:bg-opacity-100 focus:bg-opacity-100 transition-colors py-[8px] pl-10 font-medium text-white md:flex-grow _link_1kv8l_1" href="/p/altcha-solver"><span class="mr-15">ALTCHA solver</span><svg class="icon icon-altcha ml-auto text-[24px] md:text-[30px] flex-shrink-0"><use xlink:href="/dist/web/assets/symbol-defs-Ba5hjZu8.svg#icon-altcha" href="/dist/web/assets/symbol-defs-Ba5hjZu8.svg#icon-altcha"></use></svg></a></li><li class="mb-10 last:mb-0 md:mb-0 md:flex md:flex-col"><a class="pr-15 rounded-5 md:px-15 flex items-center bg-charcoal-blue bg-opacity-50 hover:bg-opacity-100 focus:bg-opacity-100 transition-colors py-[8px] pl-10 font-medium text-white md:flex-grow _link_1kv8l_1" href="/p/temu-captcha-solver"><span class="mr-15">Temu Captcha solver</span><svg class="icon icon-temu-captcha ml-auto text-[24px] md:text-[30px] flex-shrink-0"><use xlink:href="/dist/web/assets/symbol-defs-Ba5hjZu8.svg#icon-temu-captcha" href="/dist/web/assets/symbol-defs-Ba5hjZu8.svg#icon-temu-captcha"></use></svg></a></li></ul></div></div><div class="lg:flex lg:items-center"><img class="mb-25 mx-auto lg:order-1 lg:mx-0 lg:mb-0" src="/dist/web/assets/twocaptcha-payment-methods-BToCKYKW.svg" alt="We support Visa, Mastercard, Airtm, PayPal, Alipay, BTC, USDT payment systems" width="411" height="16" loading="lazy"/><ul class="flex flex-wrap items-center justify-center text-sm text-silver-blue lg:mr-auto"><li class="group relative mr-20 last:mr-0"><a href="/terms-of-service" class="hover:underline focus:underline aria-[current=page]:underline _link_1kv8l_1">Terms of service</a><span aria-hidden="true" class="absolute -right-[10px] top-[4px] h-[16px] w-[1px] rounded-[1px] bg-silver-blue group-last:hidden"></span></li><li class="group relative mr-20 last:mr-0"><a href="/payment-policy" class="hover:underline focus:underline aria-[current=page]:underline _link_1kv8l_1">Payment policy</a><span aria-hidden="true" class="absolute -right-[10px] top-[4px] h-[16px] w-[1px] rounded-[1px] bg-silver-blue group-last:hidden"></span></li><li class="group relative mr-20 last:mr-0"><a href="/privacy-policy" class="hover:underline focus:underline aria-[current=page]:underline _link_1kv8l_1">Privacy policy</a><span aria-hidden="true" class="absolute -right-[10px] top-[4px] h-[16px] w-[1px] rounded-[1px] bg-silver-blue group-last:hidden"></span></li></ul></div></div></footer></div><!--/$--></div>
    <script nomodule>!function(){var e=document,t=e.createElement("script");if(!("noModule"in t)&&"onbeforeload"in t){var n=!1;e.addEventListener("beforeload",(function(e){if(e.target===t)n=!0;else if(!e.target.hasAttribute("nomodule")||!n)return;e.preventDefault()}),!0),t.type="module",t.src=".",e.head.appendChild(t),t.remove()}}();</script>
    <script nomodule crossorigin id="vite-legacy-polyfill" src="/dist/web/assets/polyfills-legacy-DdDzAmT6.js"></script>
    <script nomodule crossorigin id="vite-legacy-entry" data-src="/dist/web/assets/index-legacy-CrtVJXBe.js">System.import(document.getElementById('vite-legacy-entry').getAttribute('data-src'))</script>
  <script defer src="https://static.cloudflareinsights.com/beacon.min.js/vcd15cbe7772f49c399c6a5babf22c1241717689176015" integrity="sha512-ZpsOmlRQV6y907TI0dKBHq9Md29nnaEIPlkf84rnaERnq6zvWvPUqr2ft8M1aS28oN72PdrCzSjY4U6VaAw1EQ==" data-cf-beacon='{"version":"2024.11.0","token":"c2ce8cb0fb464bb1a66f48dc9bf19c21","server_timing":{"name":{"cfCacheStatus":true,"cfEdge":true,"cfExtPri":true,"cfL4":true,"cfOrigin":true,"cfSpeedBrain":true},"location_startswith":null}}' crossorigin="anonymous"></script>
</body>
</html>

