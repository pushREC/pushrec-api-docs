---
source: https://2captcha.com/2captcha-api
scraped: '2026-01-08'
api_provider: 2Captcha
discovery_tier: 3
verified: false
---

# 2Captcha API Documentation

CAPTCHA solving service API for browser automation and web scraping.

## Overview

2Captcha provides an API for solving various types of CAPTCHAs:
- Image CAPTCHA (text recognition)
- reCAPTCHA v2/v3
- hCaptcha
- FunCaptcha
- GeeTest
- Cloudflare Turnstile

## Quick Start

### Authentication
```
API Key: Your 2Captcha API key
Base URL: https://2captcha.com/in.php (submit)
          https://2captcha.com/res.php (result)
```

### Basic Flow
1. Submit CAPTCHA to `/in.php`
2. Get request ID
3. Poll `/res.php` for solution
4. Use solution in your automation

## Documentation

- [[2captcha/api-reference|API Reference]] - Complete endpoint documentation

## Links

- [Official Docs](https://2captcha.com/2captcha-api)
- [Dashboard](https://2captcha.com/enterpage)

---

*Scraped: 2026-01-08*
*Provider: 2Captcha*
