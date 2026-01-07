---
created: 2026-01-06
type: research
status: complete
tags:
  - type/research
  - topic/playwright
  - topic/browser-automation
  - project/native-playwright-skill
---

# Playwright Complete API Surface Research

## Executive Summary

This document provides an exhaustive technical catalog of Playwright's capabilities for building a Claude Code native browser automation tool. Playwright is Microsoft's open-source framework for Web Testing and Automation, supporting Chromium, Firefox, and WebKit with a single API.

**Current Version:** Playwright 2.10 (late 2025), Python package 1.57.0

**Key Differentiators:**
- Cross-browser support (Chromium, Firefox, WebKit)
- Auto-waiting and retry-ability built into every action
- Browser context isolation (incognito-like profiles)
- Network interception and mocking
- Mobile device emulation
- Tracing and debugging tools

---

## 1. Core Browser Operations

### 1.1 Browser Launch and Management

#### Browser Types
Playwright supports three browser engines:

| Browser | Engine | Use Case |
|---------|--------|----------|
| Chromium | Blink/V8 | Chrome, Edge, most web apps |
| Firefox | Gecko | Cross-browser compatibility |
| WebKit | WebCore | Safari compatibility testing |

#### Launch Options

```python
# Python Async API
from playwright.async_api import async_playwright

async with async_playwright() as p:
    browser = await p.chromium.launch(
        headless=True,              # Run without UI (default)
        slow_mo=100,                # Slow down operations by 100ms
        devtools=False,             # Open DevTools automatically
        channel='chrome',           # Use installed Chrome instead of Chromium
        timeout=30000,              # Launch timeout in milliseconds
        args=['--start-maximized'], # Additional browser arguments
        downloads_path='/path/to/downloads',
        proxy={
            'server': 'http://myproxy.com:3128',
            'username': 'user',
            'password': 'password',
            'bypass': '.example.com'
        }
    )
```

**Priority for Claude Code: MUST**

### 1.2 Page Navigation

#### Core Navigation Methods

| Method | Description | Priority |
|--------|-------------|----------|
| `page.goto(url, options)` | Navigate to URL | MUST |
| `page.reload(options)` | Reload current page | MUST |
| `page.go_back(options)` | Navigate back in history | SHOULD |
| `page.go_forward(options)` | Navigate forward in history | SHOULD |

#### Navigation Options

```python
await page.goto('https://example.com',
    wait_until='load',       # 'load', 'domcontentloaded', 'networkidle', 'commit'
    timeout=30000,           # Navigation timeout
    referer='https://google.com'  # Referer header
)
```

**waitUntil Options:**
- `load` (default): Wait for load event
- `domcontentloaded`: Wait for DOMContentLoaded event
- `networkidle`: Wait for no network connections for 500ms (discouraged)
- `commit`: Wait for network response received

**Priority for Claude Code: MUST**

### 1.3 Browser Context and Session Isolation

Browser contexts provide isolated browser sessions equivalent to incognito profiles.

```python
# Create isolated context
context = await browser.new_context(
    viewport={'width': 1280, 'height': 720},
    user_agent='Custom User Agent',
    locale='en-US',
    timezone_id='America/New_York',
    geolocation={'latitude': 40.7128, 'longitude': -74.0060},
    permissions=['geolocation'],
    storage_state='auth.json',  # Reuse authentication
    record_video={'dir': 'videos/'},
    record_har={'path': 'network.har'}
)

# Save authentication state for reuse
await context.storage_state(path='auth.json')
```

**Key Features:**
- Each context has its own cookies, localStorage, sessionStorage
- Contexts don't share data with each other
- Fast and cheap to create
- Tabs within same context share session data

**Priority for Claude Code: MUST**

### 1.4 Tab and Window Management

```python
# Create new page (tab) in context
page = await context.new_page()

# Handle popups
async with page.expect_popup() as popup_info:
    await page.click('a[target="_blank"]')
popup = await popup_info.value

# Get all pages in context
pages = context.pages

# Handle multiple windows with separate contexts
context1 = await browser.new_context()
context2 = await browser.new_context()  # Completely isolated
```

**Priority for Claude Code: MUST**

### 1.5 Frame and IFrame Handling

```python
# Using frameLocator (recommended - lazy, auto-waits)
frame_locator = page.frame_locator('.frame-class')
await frame_locator.get_by_label('Username').fill('user')

# Using frame() for direct access
frame = page.frame(name='frame-name')
frame = page.frame(url=re.compile(r'.*example\.com.*'))

# Converting between Locator and FrameLocator
iframe_locator = page.locator('iframe').content_frame()
frame_element = frame_locator.owner()

# Frame tree navigation
main_frame = page.main_frame()
child_frames = main_frame.child_frames
```

**Shadow DOM:** All locators pierce shadow DOM by default (except XPath).

**Priority for Claude Code: MUST**

---

## 2. DOM Interaction

### 2.1 Locator System (Primary API)

Playwright's locators are dynamic, auto-waiting pointers to elements.

#### Built-in Locator Methods

| Method | Description | Priority |
|--------|-------------|----------|
| `page.get_by_role(role, options)` | ARIA role-based (recommended) | MUST |
| `page.get_by_text(text, options)` | Text content | MUST |
| `page.get_by_label(text)` | Form control by label | MUST |
| `page.get_by_placeholder(text)` | Input by placeholder | MUST |
| `page.get_by_alt_text(text)` | Image by alt text | SHOULD |
| `page.get_by_title(text)` | Element by title attribute | SHOULD |
| `page.get_by_test_id(testId)` | data-testid attribute | SHOULD |
| `page.locator(selector)` | CSS/XPath selector | MUST |

#### getByRole Options

```python
await page.get_by_role('button',
    name='Submit',           # Accessible name
    exact=True,              # Exact match
    disabled=False,          # Filter by disabled state
    expanded=True,           # ARIA expanded state
    checked=True,            # Checkbox/radio state
    selected=True,           # Option selected state
    level=2,                 # Heading level (1-6)
    include_hidden=False     # Include hidden elements
)
```

**Selector Priority (Recommended):**
1. `getByRole` - Aligns with accessibility, most stable
2. `getByText` - Good for content-based selection
3. CSS Selector - For structural selection
4. XPath - Last resort for complex DOM traversal

#### CSS and XPath Selectors

```python
# CSS selector
await page.locator('button.submit-btn').click()

# XPath (auto-detected with // or ..)
await page.locator('//button[@type="submit"]').click()

# Explicit prefix
await page.locator('css=button.submit-btn').click()
await page.locator('xpath=//button[@type="submit"]').click()
```

**Priority for Claude Code: MUST**

### 2.2 Locator Filtering and Chaining

```python
# Filter by text
await page.get_by_role('listitem').filter(has_text='orange').click()

# Filter by child element
await page.get_by_role('listitem').filter(
    has=page.get_by_role('button', name='Buy')
).click()

# Chain locators
await page.get_by_role('dialog').get_by_role('button', name='Submit').click()

# Nth element
await page.locator('.item').first.click()
await page.locator('.item').last.click()
await page.locator('.item').nth(2).click()

# Count elements
count = await page.locator('.item').count()
```

**Priority for Claude Code: MUST**

### 2.3 User Actions

#### Click Actions

```python
await locator.click(
    button='left',           # 'left', 'right', 'middle'
    click_count=1,           # Single, double, triple click
    delay=100,               # Delay between mousedown and mouseup
    force=False,             # Skip actionability checks
    modifiers=['Shift'],     # Keyboard modifiers
    no_wait_after=False,     # Don't wait for navigation
    position={'x': 10, 'y': 20},  # Click position relative to element
    timeout=30000,
    trial=False              # Just check actionability, don't click
)

# Other click methods
await locator.dblclick()
await locator.click(click_count=3)  # Triple-click
await locator.tap()  # Touch tap (requires hasTouch context)
```

**Priority for Claude Code: MUST**

#### Form Input Actions

```python
# Fill (clears existing content first)
await locator.fill('text value')

# Type (character by character, with delay)
await locator.type('text value', delay=100)

# Press and input
await locator.press('Enter')
await locator.press_sequentially('text', delay=50)

# Clear input
await locator.clear()

# Select dropdown options
await locator.select_option('value')
await locator.select_option(label='Option Text')
await locator.select_option(index=2)
await locator.select_option(['value1', 'value2'])  # Multi-select

# Checkbox and radio
await locator.check()
await locator.uncheck()
await locator.set_checked(True)
```

**Priority for Claude Code: MUST**

#### Hover and Focus

```python
await locator.hover(
    force=False,
    modifiers=['Shift'],
    position={'x': 10, 'y': 20},
    timeout=30000,
    trial=False
)

await locator.focus()
await locator.blur()
```

**Priority for Claude Code: SHOULD**

#### Drag and Drop

```python
# Drag locator to another locator
await source_locator.drag_to(target_locator)

# Manual drag sequence
await page.mouse.move(100, 100)
await page.mouse.down()
await page.mouse.move(200, 200)
await page.mouse.up()
```

**Priority for Claude Code: SHOULD**

#### File Upload

```python
# Single file
await locator.set_input_files('file.pdf')

# Multiple files
await locator.set_input_files(['file1.pdf', 'file2.pdf'])

# Clear files
await locator.set_input_files([])

# File chooser dialog
async with page.expect_file_chooser() as fc_info:
    await page.click('button#upload')
file_chooser = await fc_info.value
await file_chooser.set_files('file.pdf')
```

**Priority for Claude Code: SHOULD**

### 2.4 Keyboard and Mouse Emulation

#### Keyboard

```python
# Press key
await page.keyboard.press('Enter')
await page.keyboard.press('Control+A')
await page.keyboard.press('Meta+C')  # Command on Mac

# Type text
await page.keyboard.type('Hello World', delay=100)

# Key down/up for modifiers
await page.keyboard.down('Shift')
await page.keyboard.press('ArrowRight')
await page.keyboard.up('Shift')

# Insert text directly
await page.keyboard.insert_text('Hello')
```

**Priority for Claude Code: SHOULD**

#### Mouse

```python
# Move mouse
await page.mouse.move(100, 200)

# Click at position
await page.mouse.click(100, 200, button='left', click_count=1)

# Mouse down/up
await page.mouse.down(button='left')
await page.mouse.up(button='left')

# Scroll
await page.mouse.wheel(delta_x=0, delta_y=300)
```

**Priority for Claude Code: SHOULD**

### 2.5 Touch Gestures (Mobile)

```python
# Create context with touch support
context = await browser.new_context(
    **p.devices['iPhone 12'],
    has_touch=True
)

# Tap
await page.touchscreen.tap(100, 200)

# Touch events via locator
await locator.tap()

# Complex gestures via CDP (Chromium only)
cdp_session = await page.context.new_cdp_session(page)
await cdp_session.send('Input.dispatchTouchEvent', {
    'type': 'touchStart',
    'touchPoints': [{'x': 100, 'y': 200}]
})
```

**Limitation:** Playwright's Touchscreen class is limited to tap gestures. Pinch-to-zoom and swipe require CDP commands.

**Priority for Claude Code: COULD**

---

## 3. Content Extraction

### 3.1 Element Content Methods

```python
# Text content (includes hidden text)
text = await locator.text_content()

# Inner text (visible text only)
text = await locator.inner_text()

# Inner HTML
html = await locator.inner_html()

# Outer HTML (includes element itself)
html = await page.locator('div').evaluate('el => el.outerHTML')

# Attribute value
href = await locator.get_attribute('href')

# Input value
value = await locator.input_value()

# All text contents (for multiple elements)
texts = await locator.all_text_contents()

# All inner texts
texts = await locator.all_inner_texts()
```

**Priority for Claude Code: MUST**

### 3.2 JavaScript Evaluation

```python
# Evaluate in page context
result = await page.evaluate('document.title')

# Evaluate with locator
result = await locator.evaluate('el => el.dataset.customValue')

# Evaluate all matched elements
results = await locator.evaluate_all('elements => elements.map(el => el.textContent)')

# Pass arguments to evaluate
result = await page.evaluate('([a, b]) => a + b', [1, 2])

# Evaluate handle (returns element handle)
handle = await page.evaluate_handle('document.body')
```

**Priority for Claude Code: MUST**

### 3.3 Screenshots

```python
# Full page screenshot
await page.screenshot(
    path='screenshot.png',
    full_page=True,
    type='png',              # 'png' or 'jpeg'
    quality=80,              # JPEG quality (0-100)
    omit_background=True,    # Transparent background (PNG)
    clip={'x': 0, 'y': 0, 'width': 800, 'height': 600},
    timeout=30000,
    animations='disabled',   # Freeze animations
    caret='hide',            # Hide text caret
    scale='device'           # 'css' or 'device'
)

# Element screenshot
await locator.screenshot(path='element.png')

# Screenshot as bytes
bytes_data = await page.screenshot()
```

**Priority for Claude Code: MUST**

### 3.4 PDF Generation (Chromium Headless Only)

```python
await page.pdf(
    path='page.pdf',
    format='A4',                    # 'Letter', 'Legal', 'Tabloid', 'A0'-'A6'
    width='8.5in',                  # Custom width (overrides format)
    height='11in',                  # Custom height
    scale=1,                        # Scale 0.1 to 2
    print_background=True,          # Include background graphics
    landscape=False,                # Orientation
    page_ranges='1-5',              # Specific pages
    margin={'top': '1cm', 'bottom': '1cm', 'left': '1cm', 'right': '1cm'},
    header_template='<div>Header</div>',
    footer_template='<div>Page <span class="pageNumber"></span></div>',
    prefer_css_page_size=False
)
```

**Priority for Claude Code: SHOULD**

### 3.5 Network Interception and Mocking

```python
# Route handler
async def handle_route(route):
    if 'api' in route.request.url:
        await route.fulfill(
            status=200,
            content_type='application/json',
            body='{"mocked": true}'
        )
    else:
        await route.continue_()

await page.route('**/*', handle_route)

# Block resources
await page.route('**/*.{png,jpg,jpeg}', lambda route: route.abort())

# Modify request
await page.route('**/api/*', lambda route: route.continue_(
    headers={**route.request.headers, 'X-Custom': 'value'}
))

# Modify response
async def modify_response(route):
    response = await route.fetch()
    body = await response.json()
    body['modified'] = True
    await route.fulfill(response=response, json=body)

await page.route('**/api/data', modify_response)

# HAR file mocking
await page.route_from_har('network.har', url='**/api/*')
```

**Priority for Claude Code: SHOULD**

### 3.6 Console Message Capture

```python
# Listen to console messages
def handle_console(msg):
    print(f'{msg.type}: {msg.text}')
    for arg in msg.args:
        print(f'  Arg: {arg.json_value()}')

page.on('console', handle_console)

# Listen to page errors
def handle_error(error):
    print(f'Page error: {error}')

page.on('pageerror', handle_error)

# Context-level console capture
context.on('console', handle_console)
```

**Priority for Claude Code: SHOULD**

---

## 4. Wait Strategies

### 4.1 Auto-Waiting (Built-in)

Playwright automatically waits for elements to be actionable before performing actions.

**Actionability Checks:**

| Check | Description |
|-------|-------------|
| Attached | Element is connected to DOM |
| Visible | Non-empty bounding box, not visibility:hidden |
| Stable | Same bounding box for 2+ animation frames |
| Enabled | Not disabled |
| Receives Events | Not obscured by other elements |

**Actions and Their Checks:**

| Action | Attached | Visible | Stable | Enabled | Editable |
|--------|----------|---------|--------|---------|----------|
| click | Yes | Yes | Yes | Yes | - |
| fill | Yes | Yes | - | Yes | Yes |
| check | Yes | Yes | Yes | Yes | - |
| select_option | Yes | Yes | Yes | Yes | - |
| hover | Yes | Yes | Yes | - | - |
| scroll_into_view_if_needed | Yes | - | Yes | - | - |

**Priority for Claude Code: MUST**

### 4.2 Explicit Waits

```python
# Wait for selector
await page.wait_for_selector('#element',
    state='visible',         # 'attached', 'detached', 'visible', 'hidden'
    timeout=30000
)

# Wait for navigation
async with page.expect_navigation(
    url='**/success',
    wait_until='load',
    timeout=30000
):
    await page.click('button#submit')

# Wait for URL
await page.wait_for_url('**/dashboard')

# Wait for load state
await page.wait_for_load_state('networkidle')  # 'load', 'domcontentloaded', 'networkidle'

# Wait for function
await page.wait_for_function('document.querySelector(".loaded")')
```

**Priority for Claude Code: MUST**

### 4.3 Network Waits

```python
# Wait for request
async with page.expect_request('**/api/login') as request_info:
    await page.click('button#login')
request = await request_info.value

# Wait for response
async with page.expect_response('**/api/data') as response_info:
    await page.click('button#load')
response = await response_info.value
data = await response.json()

# Wait for download
async with page.expect_download() as download_info:
    await page.click('a#download')
download = await download_info.value
await download.save_as('file.pdf')
```

**Priority for Claude Code: MUST**

### 4.4 Timeout Configuration

```python
# Global defaults
browser_context.set_default_timeout(60000)
browser_context.set_default_navigation_timeout(60000)

page.set_default_timeout(60000)
page.set_default_navigation_timeout(60000)

# Disable timeout (use 0)
await page.wait_for_selector('#element', timeout=0)
```

**Priority Hierarchy:**
1. Action-level timeout
2. `page.set_default_navigation_timeout()` (for navigation)
3. `page.set_default_timeout()`
4. `browserContext.set_default_navigation_timeout()`
5. `browserContext.set_default_timeout()`

**Priority for Claude Code: MUST**

---

## 5. Assertions (Web-First)

### 5.1 Locator Assertions

```python
from playwright.sync_api import expect

# Visibility
await expect(locator).to_be_visible()
await expect(locator).to_be_hidden()
await expect(locator).to_be_attached()

# State
await expect(locator).to_be_enabled()
await expect(locator).to_be_disabled()
await expect(locator).to_be_editable()
await expect(locator).to_be_checked()
await expect(locator).to_be_focused()
await expect(locator).to_be_empty()

# Content
await expect(locator).to_have_text('expected text')
await expect(locator).to_have_text(re.compile(r'regex'))
await expect(locator).to_contain_text('partial')

# Attributes
await expect(locator).to_have_attribute('href', '/link')
await expect(locator).to_have_class('active')
await expect(locator).to_have_id('element-id')
await expect(locator).to_have_value('input value')
await expect(locator).to_have_css('color', 'rgb(0, 0, 0)')

# Count
await expect(locator).to_have_count(5)

# Negation
await expect(locator).not_to_be_visible()

# Custom timeout
await expect(locator).to_be_visible(timeout=10000)
```

**Priority for Claude Code: MUST**

### 5.2 Page Assertions

```python
await expect(page).to_have_title('Page Title')
await expect(page).to_have_title(re.compile(r'.*Dashboard'))
await expect(page).to_have_url('https://example.com/page')
await expect(page).to_have_url(re.compile(r'.*page$'))
```

**Priority for Claude Code: MUST**

### 5.3 Soft Assertions

```python
# Soft assertions don't stop test execution
await expect.soft(locator).to_have_text('Expected')
await expect.soft(locator).to_be_visible()
# Test continues even if assertions fail
```

**Priority for Claude Code: COULD**

---

## 6. Advanced Features

### 6.1 Tracing and Debugging

```python
# Start tracing
await context.tracing.start(
    screenshots=True,
    snapshots=True,
    sources=True
)

# ... perform actions ...

# Stop and save trace
await context.tracing.stop(path='trace.zip')

# View trace: npx playwright show-trace trace.zip
```

**Trace Contents:**
- Timeline of all actions
- DOM snapshots at each step
- Screenshots
- Console logs
- Network requests
- Source code

**Priority for Claude Code: SHOULD**

### 6.2 Video Recording

```python
context = await browser.new_context(
    record_video={
        'dir': 'videos/',
        'size': {'width': 1280, 'height': 720}
    }
)

page = await context.new_page()
# ... perform actions ...

# Get video path
video_path = await page.video.path()

# Must close context to save video
await context.close()
```

**Priority for Claude Code: COULD**

### 6.3 HAR Generation

```python
context = await browser.new_context(
    record_har={
        'path': 'network.har',
        'omit_content': False,      # Include response bodies
        'url_filter': '**/api/*'    # Only record matching URLs
    }
)

# ... perform actions ...

await context.close()  # HAR saved on close
```

**Priority for Claude Code: COULD**

### 6.4 Device Emulation

```python
# Use predefined device
iphone = p.devices['iPhone 12']
context = await browser.new_context(**iphone)

# Custom device configuration
context = await browser.new_context(
    viewport={'width': 375, 'height': 667},
    user_agent='Mozilla/5.0 (iPhone; CPU iPhone OS 14_0 like Mac OS X)...',
    device_scale_factor=2,
    is_mobile=True,
    has_touch=True
)

# Available devices include:
# 'iPhone 12', 'iPhone 13', 'iPhone 14', 'Pixel 5', 'iPad Pro', etc.
```

**Priority for Claude Code: SHOULD**

### 6.5 Geolocation and Permissions

```python
context = await browser.new_context(
    geolocation={'latitude': 40.7128, 'longitude': -74.0060},
    permissions=['geolocation', 'notifications', 'camera', 'microphone']
)

# Update geolocation
await context.set_geolocation({'latitude': 37.7749, 'longitude': -122.4194})

# Clear permissions
await context.clear_permissions()
```

**Priority for Claude Code: SHOULD**

### 6.6 Authentication and Storage State

```python
# Login and save state
context = await browser.new_context()
page = await context.new_page()
await page.goto('https://example.com/login')
await page.fill('#username', 'user')
await page.fill('#password', 'pass')
await page.click('button[type="submit"]')
await page.wait_for_url('**/dashboard')

# Save authentication state
await context.storage_state(path='auth.json')
await context.close()

# Reuse authentication state
context = await browser.new_context(storage_state='auth.json')
# User is now logged in
```

**Storage State Includes:**
- Cookies
- localStorage
- sessionStorage

**Priority for Claude Code: MUST**

### 6.7 Dialog Handling

```python
# Handle dialogs (must be set before triggering)
async def handle_dialog(dialog):
    print(f'Dialog type: {dialog.type}')       # 'alert', 'confirm', 'prompt', 'beforeunload'
    print(f'Message: {dialog.message}')
    print(f'Default value: {dialog.default_value}')  # For prompts

    if dialog.type == 'confirm':
        await dialog.accept()
    elif dialog.type == 'prompt':
        await dialog.accept('User input')
    else:
        await dialog.dismiss()

page.on('dialog', handle_dialog)
await page.click('button#show-alert')

# IMPORTANT: If no handler is registered, dialogs are auto-dismissed
```

**Priority for Claude Code: MUST**

### 6.8 Download Handling

```python
async with page.expect_download() as download_info:
    await page.click('a#download-link')

download = await download_info.value

# Get download info
filename = download.suggested_filename
url = download.url
failure = await download.failure()

# Save download
await download.save_as(f'/downloads/{filename}')

# Get temporary path
temp_path = await download.path()

# Cancel download
await download.cancel()

# Delete download
await download.delete()
```

**Priority for Claude Code: SHOULD**

### 6.9 Clock API (Time Manipulation)

```python
# Install fake timers
await page.clock.install(time=datetime(2024, 1, 1, 10, 0, 0))

# Set fixed time
await page.clock.set_fixed_time(datetime(2024, 1, 1, 12, 0, 0))

# Set system time (time still progresses)
await page.clock.set_system_time(datetime(2024, 1, 1, 12, 0, 0))

# Advance time
await page.clock.run_for(60000)  # 1 minute in milliseconds

# Fast forward
await page.clock.fast_forward('01:00:00')  # 1 hour

# Pause at specific time
await page.clock.pause_at(datetime(2024, 1, 1, 15, 0, 0))

# Resume
await page.clock.resume()
```

**Priority for Claude Code: COULD**

### 6.10 API Testing (Request Context)

```python
from playwright.async_api import async_playwright

async with async_playwright() as p:
    # Create request context (no browser needed)
    request_context = await p.request.new_context(
        base_url='https://api.example.com',
        extra_http_headers={
            'Authorization': 'Bearer token',
            'Content-Type': 'application/json'
        }
    )

    # GET request
    response = await request_context.get('/users')
    data = await response.json()

    # POST request
    response = await request_context.post('/users', data={
        'name': 'John',
        'email': 'john@example.com'
    })

    # PUT request
    response = await request_context.put('/users/1', data={'name': 'Jane'})

    # DELETE request
    response = await request_context.delete('/users/1')

    # Generic fetch
    response = await request_context.fetch('/endpoint', method='PATCH')

    await request_context.dispose()
```

**Priority for Claude Code: SHOULD**

### 6.11 Component Testing (Experimental)

```python
# React example
from playwright.sync_api import expect
from playwright.experimental.ct_react import test, mount

def test_component():
    component = mount(<Button label="Click me" />)
    expect(component).to_contain_text('Click me')
    component.click()
    expect(component).to_have_class('clicked')
```

**Supported Frameworks:**
- React
- Vue
- Svelte
- Angular (via @jscutlery/playwright-ct-angular)

**Priority for Claude Code: COULD**

---

## 7. Anti-Detection and Stealth

### 7.1 Detection Vectors

Websites detect Playwright through:

| Vector | Description |
|--------|-------------|
| `navigator.webdriver` | Set to `true` in automated browsers |
| CDP Detection | Chrome DevTools Protocol signals |
| Browser fingerprint | WebGL, fonts, plugins |
| User-Agent | Default Playwright UA |
| Behavior patterns | Inhuman timing, no mouse movement |

### 7.2 Playwright Stealth

```python
# Python: playwright-stealth package
from playwright.async_api import async_playwright
from playwright_stealth import stealth_async

async with async_playwright() as p:
    browser = await p.chromium.launch()
    page = await browser.new_page()
    await stealth_async(page)
    await page.goto('https://example.com')
```

**Evasions Applied:**
- Patches `navigator.webdriver` to `undefined`
- Real Chrome user agent
- Realistic WebGL renderer
- Plugin/MIME type spoofing
- Timezone consistency
- Canvas fingerprint randomization

### 7.3 Playwright-Extra (Node.js)

```javascript
const { chromium } = require('playwright-extra');
const stealth = require('puppeteer-extra-plugin-stealth')();

chromium.use(stealth);

const browser = await chromium.launch();
```

### 7.4 Human-Like Behavior

```python
import random
import asyncio

# Random delays
await asyncio.sleep(random.uniform(0.5, 2.0))

# Type with varying speed
await page.type('#input', 'text', delay=random.randint(50, 150))

# Mouse movement with jitter
async def human_mouse_move(page, x, y, steps=10):
    current = await page.evaluate('() => ({x: 0, y: 0})')
    for i in range(steps):
        next_x = current['x'] + (x - current['x']) * (i + 1) / steps + random.randint(-3, 3)
        next_y = current['y'] + (y - current['y']) * (i + 1) / steps + random.randint(-3, 3)
        await page.mouse.move(next_x, next_y)
        await asyncio.sleep(random.uniform(0.01, 0.03))

# Random scroll
await page.mouse.wheel(0, random.randint(200, 500))
```

### 7.5 Limitations

- Stealth plugins don't defeat all anti-bot systems
- Cloudflare, PerimeterX, DataDome may still detect
- CDP usage itself can be detected
- No guarantee of evasion

**Priority for Claude Code: SHOULD (stealth basics), COULD (advanced evasion)**

---

## 8. Browser Compatibility Matrix

| Feature | Chromium | Firefox | WebKit |
|---------|----------|---------|--------|
| Basic navigation | Yes | Yes | Yes |
| DOM interaction | Yes | Yes | Yes |
| Network interception | Yes | Yes | Yes |
| Screenshots | Yes | Yes | Yes |
| PDF generation | Yes | No | No |
| Video recording | Yes | Yes | Yes |
| Tracing | Yes | Yes | Yes |
| CDP access | Yes | No | No |
| Touch emulation | Limited | Limited | Limited |
| Component testing | Yes | Yes | Yes |
| Storage state | Yes | Yes | Yes |
| Geolocation | Yes | Yes | Yes |
| Device emulation | Yes | Yes | Yes |

---

## 9. Performance Considerations

### 9.1 Browser Launch

| Operation | Approximate Time |
|-----------|-----------------|
| Browser launch (cold) | 500-2000ms |
| Browser launch (warm) | 100-500ms |
| New context | 50-100ms |
| New page | 50-100ms |

### 9.2 Optimization Strategies

```python
# Reuse browser instance
browser = await p.chromium.launch()
for task in tasks:
    context = await browser.new_context()
    page = await context.new_page()
    # ... work ...
    await context.close()
await browser.close()

# Block unnecessary resources
await page.route('**/*.{png,jpg,jpeg,gif,svg,woff,woff2}',
    lambda route: route.abort())

# Use headless mode
browser = await p.chromium.launch(headless=True)

# Disable JavaScript when not needed
context = await browser.new_context(java_script_enabled=False)
```

### 9.3 Memory Management

```python
# Always close contexts and browsers
await context.close()
await browser.close()

# Use context managers
async with async_playwright() as p:
    async with await p.chromium.launch() as browser:
        context = await browser.new_context()
        # ...
```

---

## 10. Priority Ranking for Claude Code Integration

### MUST Have (Core Functionality)

| Category | Methods |
|----------|---------|
| Browser | `launch`, `new_context`, `close` |
| Context | `new_page`, `storage_state`, `set_default_timeout` |
| Navigation | `goto`, `reload`, `wait_for_url` |
| Locators | `get_by_role`, `get_by_text`, `locator`, `filter` |
| Actions | `click`, `fill`, `type`, `check`, `select_option` |
| Extraction | `text_content`, `inner_html`, `get_attribute`, `evaluate` |
| Screenshots | `screenshot` (page and element) |
| Waits | `wait_for_selector`, `wait_for_load_state` |
| Assertions | `to_be_visible`, `to_have_text`, `to_have_count` |
| Dialogs | `page.on('dialog')`, `dialog.accept/dismiss` |
| Auth | `storage_state` save/load |
| Frames | `frame_locator`, `content_frame` |

### SHOULD Have (Enhanced Functionality)

| Category | Methods |
|----------|---------|
| Navigation | `go_back`, `go_forward` |
| Locators | `get_by_label`, `get_by_placeholder`, `get_by_test_id` |
| Actions | `hover`, `drag_to`, `set_input_files` |
| Keyboard/Mouse | `keyboard.press`, `mouse.click`, `mouse.wheel` |
| Network | `route`, `route.fulfill`, `route.abort` |
| Extraction | `evaluate_all`, `pdf` |
| Console | `page.on('console')`, `page.on('pageerror')` |
| Downloads | `expect_download`, `download.save_as` |
| Emulation | `devices`, `viewport`, `geolocation` |
| Tracing | `tracing.start`, `tracing.stop` |
| Stealth | Basic `navigator.webdriver` patch |
| API Testing | `request.new_context`, `get`, `post` |

### COULD Have (Advanced/Specialized)

| Category | Methods |
|----------|---------|
| Touch | `tap`, CDP touch events |
| Video | `record_video` |
| HAR | `record_har`, `route_from_har` |
| Clock | `clock.install`, `clock.run_for` |
| Component Testing | `mount` for React/Vue/Svelte |
| Advanced Stealth | Full fingerprint masking |
| Soft Assertions | `expect.soft` |

---

## 11. API Design Recommendations for Claude Code

### 11.1 Suggested Tool Interface

```python
# High-level actions for Claude Code
class PlaywrightTool:
    async def navigate(self, url: str, wait_until: str = 'load') -> dict
    async def click(self, selector: str, timeout: int = 30000) -> dict
    async def fill(self, selector: str, value: str) -> dict
    async def extract_text(self, selector: str) -> str
    async def extract_html(self, selector: str) -> str
    async def screenshot(self, full_page: bool = False) -> bytes
    async def wait_for(self, selector: str, state: str = 'visible') -> dict
    async def evaluate(self, script: str) -> Any
    async def get_page_info(self) -> dict  # title, url, cookies
```

### 11.2 Error Handling

```python
# Playwright exceptions to handle
from playwright.async_api import TimeoutError, Error

try:
    await page.click('#element', timeout=5000)
except TimeoutError:
    # Element not found or not actionable within timeout
    pass
except Error as e:
    # General Playwright error
    pass
```

### 11.3 Session Management

```python
# Recommended session lifecycle
class BrowserSession:
    def __init__(self):
        self.browser = None
        self.context = None
        self.page = None

    async def start(self, headless=True, storage_state=None):
        self.browser = await playwright.chromium.launch(headless=headless)
        self.context = await self.browser.new_context(
            storage_state=storage_state
        )
        self.page = await self.context.new_page()

    async def save_state(self, path='session.json'):
        await self.context.storage_state(path=path)

    async def close(self):
        await self.context.close()
        await self.browser.close()
```

---

## 12. References

### Official Documentation
- [Playwright Official Docs](https://playwright.dev/)
- [Playwright API Reference](https://playwright.dev/docs/api/class-playwright)
- [Playwright Python Docs](https://playwright.dev/python/docs/api/class-playwright)
- [Playwright GitHub Repository](https://github.com/microsoft/playwright)

### Key Documentation Pages
- [Locators Guide](https://playwright.dev/docs/locators)
- [Auto-waiting](https://playwright.dev/docs/actionability)
- [Network Interception](https://playwright.dev/docs/network)
- [Browser Contexts](https://playwright.dev/docs/browser-contexts)
- [Emulation](https://playwright.dev/docs/emulation)
- [Assertions](https://playwright.dev/docs/test-assertions)
- [Page Class](https://playwright.dev/docs/api/class-page)
- [Frame Handling](https://playwright.dev/docs/frames)
- [Dialog Handling](https://playwright.dev/docs/dialogs)

### Anti-Detection Resources
- [Playwright Stealth (Python)](https://pypi.org/project/playwright-stealth/)
- [Playwright-Extra (Node.js)](https://www.npmjs.com/package/playwright-extra)
- [Avoiding Bot Detection](https://brightdata.com/blog/how-tos/avoid-bot-detection-with-playwright-stealth)

### Community Resources
- [Playwright Best Practices](https://playwright.dev/docs/best-practices)
- [Checkly Navigation Guide](https://www.checklyhq.com/docs/learn/playwright/navigation/)
- [BrowserStack Playwright Guide](https://www.browserstack.com/guide/playwright-selectors)
- [Component Testing Guide](https://playwright.dev/docs/test-components)

---

*Research completed: 2026-01-06*
*Word count: ~6,500 words*
*Coverage: Comprehensive API surface for Claude Code native tool development*
