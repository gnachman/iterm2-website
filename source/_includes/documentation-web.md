## Overview

iTerm2 includes built-in web browsing capabilities. Web browser sessions fit into iTerm2's existing window > tab > split pane hierarchy just like terminal sessions, allowing you to browse the web alongside your terminal work.

## Getting Started

### Enabling the Browser

1. Install the [browser plugin](https://iterm2.com/browser-plugin.html) to enable full functionality
2. Create a new profile
3. Go to **Settings > Profiles > General**
4. Set **Profile Type** to **Web Browser**

**Note for Enterprise Users:** Administrators can block the browser plugin by restricting bundle ID `com.googlecode.iterm2.iTermBrowserPlugin`.

### Disabling Browser Features

If you prefer not to use browser features, you can completely hide them by setting **Settings > Advanced > Enable browser-style profiles** to **No**.

## Core Features

### Navigation and Window Management

- Browser profiles work within iTerm2's standard window/tab/split pane hierarchy.
- Use hotkey windows, Open Quickly, navigation shortcuts, and per-session hotkeys as with terminal sessions.
- **Exception:** ⌘-[ and ⌘-] perform Back/Forward navigation instead of pane switching in browser sessions.
- **Cmd+click** opens links in new tabs.
- **Cmd+Shift+click** opens links in new vertical split panes.
- **Cmd+Shift+Option+click** opens links in new horizontal split panes.

### Text and Selection

- **Copy on selection** works identically to terminal windows.
- **Smart Selection** works identically to terminal windows. Smart Selection Actions appear in the context menu.
- **Copy Mode** uses the same keystrokes as terminal sessions.
- **Jump to Selection** functions as in terminal sessions.
- **Find** supports regular expressions and case-sensitive search, just like in a terminal.

### AI Integration

- Link browser sessions to AI chat to discuss web pages.
- Click hamburger menu → **Ask AI** to create a new AI chat with the reader-mode content of the current page attached.
- Summarize, analyze, or ask questions about the current page.

### Privacy and Security

- **/dev/null mode** is a mode for browsing privately that prevents any data from being saved to disk.
- Built-in popup blocking blocks popups not initiated by user action.
- Simple ad blocking using WebKit content blocker rules (configure via hamburger menu → **Settings**).
- CONNECT proxy support for proxy-based adblockers.
- The existing password manager has been integrated. Browser passwords are stored separately from terminal passwords.
- Password manager integration for 1Password, and LastPass will use your existing web passwords.

### Remote Access

- View files on remote hosts via SSH Integration using URLs like: `iterm2-ssh://example.com/home/user/file.jpg`

## Advanced Features

### Bookmarks and Organization

- **Named Marks** act as bookmarks for specific page sections (right-click → Add Named Mark).
- Standard bookmarks available via hamburger menu.
- Named Marks and Bookmarks work with Open Quickly and the Named Marks Toolbelt tool.

### Recording and History

- **Instant Replay** captures browser sessions using macOS Screen Capture API.
- Like instant replay in terminal windows, the RAM limit is respected.
- **Global Search** can search across browser sessions.

### Automation and Customization

- **Key Bindings** work in browser profiles (some terminal-specific actions are unavailable).
- **Triggers** match when pages finish loading with web-specific actions.
- **Pointer bindings** and **Actions** available, minus some terminal-specific options.
- **Snippets** insert text into a focused form field.
- **Broadcast Input** works across browser sessions.
- **Advanced Paste** available, minus some terminal-specific features.
- **Composer** functions in browser sessions.

### Content Management

- **Reader Mode** is avilable in the hamburger menu.
- **Distraction removal mode** similar to Safari's is also in the hamburger menu.
- Right-click → **Remove Element** to hide cookie panels or other unwanted elements.
- **Shell > Save Contents** saves web pages with resources.
- Basic auto-fill of form fields is available, using your contact card information.
- Search suggestions in URL bar.
- Automatic audio detection and muting.

## Technical Details

The browser is built on WKWebView and identifies as Safari to ensure compatibility with most websites.

## Limitations

- **Python API** No browser-specific APIs yet. [File a feature request](https://iterm2.com/bugs) if you have ideas.
- **Passkeys** Not supported due to Apple-imposed WKWebView restrictions.
- **Advanced ad blocking:** Limited by Apple's resource fetching API restrictions.

## About This Feature

This feature exists because:
- Many iTerm2 features translate well to web browsing
- It provides a unified terminal and browser experience
- A former colleague suggested this idea in 2014 and I haven't been able to stop thinking about it.
- I am maybe having a midlife crisis and this is cheaper than a sports car.

While not intended as a primary browser, iTerm2's web capabilities provide a useful tool for integrated terminal and web workflows.
