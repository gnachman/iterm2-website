iTerm2 has some basic web browsing capabilities. To enable them, create a profile and in **Settings > Profiles > General** set **Profile Type** to **Web Browser**.

The web browser pretends to be Safari. It is based on WKWebView. Its reasons for existing are, in no particular order:

 * A lot of iTerm2's features seemed to me like they would be useful in a web browser. See below for details on this.
 * A former colleague suggested this idea in 2014 and I haven't been able to stop thinking about it.
 * I am maybe having a midlife crisis and this is cheaper than a sports car.

Since iTerm2 is still mostly a terminal, you'll need to install a [plugin to enable browser functionality](https://iterm2.com/browser-plugin.html). This is meant to make life easier on enterprise administrators who need to keep things locked down. They can block bundle ID `com.googlecode.iterm2.iTermBrowserPlugin` to prevent its installation.

If the presence of a browser offends you, set **Settings > Advanced > Enable browser-style profiles** to **No** and the feature will be completely hidden from view.

I doubt this will be many people's primary browser, but my hunch is that it will still be useful enough to keep around. Time will tell!

## Features

A web browser profile fits into the existing window > tab > split pane hierarchy just like a terminal session. That means that the existing navigation features work almost identically. The only exception is ⌘-[ and ⌘-], which normally navigate among split panes, is overridden to do Back and Forward in browser sessions. That notwithstanding, you can use hotkey windows, Open Quickly, navigation shortcuts, per-session hotkeys, and so on just as you would with a terminal session.

Instant Replay is available in browser sessions. It uses macOS's Screen Capture API to make a screen recording. When you enable Instant Replay, you'll be asked to grant Screen Capture permission. This will cost a bit of CPU and a configurable amount of RAM. The CPU hit depends on your hardware; on my M4 Pro it is barely noticeable.

AI chat is integrated with the browser. You can link a browser session to an AI chat and discuss a web page, such as to summarize it.

Copy to clipboard on selection works in the browser in the same was as in a terminal window.

If you use SSH Integration the browser can view files on remote hosts using URLs of the form `iterm2-ssh://example.com/home/gnachman/puppy.jpg`.

You can configure a profile to use **/dev/null mode**, which is a browsing mode in which no data is saved to disk.

Named Marks in browser profiles behave like a bookmark for a particular part of a web page. You can select some text, right click, and choose Add Named Mark. Existing features like Open Quickly or the Named Marks Toolbelt tool work as you would expect.

Key Bindings work in browser profiles. Some actions are unavailable since they wouldn't make sense in a web context.

Triggers work by performing matching when the page finishes loading. Trigger actions are different for web profiles since few of the terminal trigger actions would make sense.

Smart Selection works in browser sessions the same was as it does in terminal sessions. Smart selection actions are available in the context menu.

Pointer bindings work the same as in a terminal window, minus a few actions that didn't make sense. Same with Actions.

Snippets work as you'd expect. They insert text into the focused field.

Find works like in the terminal. That means you get regular expression search, case sensitive search, and so on.

The password manager works. Browser passwords are stored separately from terminal passwords. If you use the 1Password or LastPass integrations, that should also work and your existing passwords will already be available.

You can click the hamburger menu in the browser toolbar and select **Ask AI** to create a new AI chat with a reader-mode copy of the current page as an attachment that you can converse with it about.

Simple ad blocking functionality is available using WebKit content blocker rules. You can configure this by clicking the hamburger menu in the browser toolbar and selecting **Settings**. You can configure a CONNECT proxy in settings if you use a proxy-based adblocker. Popups not initiated by user action are always blocked.

The browser supports bookmarks. You can add or manage them with the hamburger menu in the browser toolbar.

Copy Mode works in the browser. It uses the same keystrokes as in the terminal.

Basic auto-fill functionality exists. The browser users your contact card to get name, address, phone number, etc. to fill forms with.

Jump to Selection works the same as in a terminal session.

Global Search is able to search browser sessions.

Broadcast Input works with browser sessions.

Advanced Paste works in browser sessions, minus a few features that don't make sense there.

The Composer works in browser sessions.

Under the hamburger menu you will find a toggle for Reader Mode.

You can right click on an element and select "Remove Element" to get rid of cookie panels and the like. There is also a distration removal mode similar to Safari's which you can activate from the hamburger menu.

**Shell > Save Contents** saves the web page and its resources, as you would expect.

The browser detects when audio is playing and mutes it automatically.

The URL bar supports search suggestions.

Hold cmd to open a link in a new tab. Hold cmd+shift to open a link in a new vertical split pane. Hold cmd+shift+option to open a link in a new horizontal split pane.

## Limitations

The Python API does not yet have any APIs specific to browser features. [File an issue](https://iterm2.com/bugs) and let me know what you would find useful.

Passkeys can't be supported because Apple has blocked browsers built on WKWebView from implementing them, except for the developer's own site.

Similarly, adblocking functionality is limited because Apple doesn't expose hooks into resource fetching. You can kind of work around it with a proxy but without knowing what a resource is (image, HTML, Javascript, etc.) an adblocker is hamstrung. Such a proxy would need a trusted root cert to be able to adblock on secure sites, which is too scary to consider.
