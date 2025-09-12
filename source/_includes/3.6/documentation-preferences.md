## General

<hr>
### Startup

#### Window restoration policy

This setting determines how windows will be opened when iTerm2 is launched. Most users will want *Use System Window Restoration Setting* as it works best with <a href="restoration.html">Session Restoration</a>. Users who exclusively use the Hotkey Window may prefer *Only Restore Hotkey Window*, which will not restore regular windows but will restore the hotkey window. If you have a default window arrangement saved then *Open Default Window Arrangement* will be available.

#### Open profiles window
If selected, the Profiles Window will automatically open when iTerm2 is started.

#### Restore windows to same Spaces
macOS apps do not typically restore windows to the same Space (aka Desktop) that they were originally on except on system restart. When this setting is enabled, iTerm2 will attempt to restore windows to their original Spaces.

#### Always open at least one terminal window at startup
If you have a hotkey window defined then iTerm2 won't open a regular window on launch. If you'd prefer to always have a visible window in addition to the hotkey window, enable this setting.

<hr>
### Closing

#### Quit when all windows are closed
If selected, iTerm2 will automatically quit when its last terminal window is closed.

#### Confirm closing multiple sessions
If selected, commands that close one session will not be confirmed, but commands that close multiple sessions (such as clicking the red button on a window with two or more tabs) will be confirmed with an alert box.

#### Confirm Quit iTerm2 Command
If selected, the Quit iTerm2 (cmd-Q) command will be confirmed if any terminal windows are open.

#### Even if there are no windows
Modifies *Confirm Quit iTerm2 COmmand* to disable the prompt when there are no open windows.

#### Disable all confirmations on system shutdown, restart, and log out
When enabled, iTerm2 will never block system shutdown, restart, and log out by asking for confirmation. Enabling this setting could cause you to lose work.

<hr>
### Magic

#### Add Bonjour hosts to profiles
If selected, all Bonjour hosts on the local network have a profile created for them as long as they're around.

#### Instant Replay Uses X MB per Session
This setting specifies the maximum amount of memory allocated to instant replay for each tab or split pane. More memory means instant replay is able to go farther back into the past. You can enter instant replay with **View > Step Back in Time**.

#### Save copy/paste and command history to disk
If selected, every time text is copied or pasted in iTerm2 it will be saved to disk. The last 20 values are recorded. They can be accessed with **Edit > Open Paste History...**. If you use <a href="shell_integration.html">Shell Integration</a> then when this is enabled your command history, directory history, and remote hostname and usernames will also be saved to disk. Unchecking this will erase all of the saved information.

#### Enable Python API
Toggles the availability of the Pythono API. See <a href="/python-api-auth.html">Python API Authentication</a> for details on the security model.

#### Custom Python API Scripts Folder
Normally Python API scripts go in `~/Library/Application Support/iTerm2/Scripts` but if you'd prefer to have them elsewhere you can specify the path with this setting.

#### GPU Rendering
The GPU renderer improves drawing performance, but it may use more energy. You can also configure when it is enabled in *Advanced GPU Settings*.

The advanced settings are:

  * *Disable GPU renderer when disconnected from power* - Use this to conserve energy when not plugged in and to get the best drawing performance when connected to power.
  * *Prefer integrated to discrete GPU* - If your machine has two GPUs, enable this to use the slower but less power-hungry GPU.

#### Maximize throughput at the cost of higher latency
When this is enabled:

 * The frame rate will be reduced when a lot of data is being received.
 * Input handling is prioritized over redrawing, reducing the maximum frame rate.

You probably need to disable this to hit 120 FPS.

#### Compress scrollback history in the background
When enabled, scrollback history gets compressed when the app is idle. This causes slightly higher CPU utilization when the app is not in use but can significantly reduce memory usage when there are large scrollback buffers.

<hr>
### AI > General

#### Plugin
To use AI features you must install the [AI plugin](https://iterm2.com/ai-plugin.html).

#### Consent
You must consent to AI features before they can be used. This is a secure user default which requires you to enter an administrator password to change.

#### API Key
Because AI features depend on your provider's API, users must provide their own API keys. Unlike most settings (which are saved in user defaults), the AI key is stored in the keychain to prevent unauthorized access.

#### Always use the recommended model from
Enable this to automatically use the most current model from the selected provider. If disabled, click Configure AI Model Manually to tweak values yourself.

#### Timeout
The maximum time to wait for a response to an AI query.

### AI > General > Configure AI Model Manually

#### Model
The name of the model to use. This value is sent in the API request.

#### Token Limit
Gives the maximum number of tokens in the context and in a response. If this value is too high your requests may fail.

#### The URL of the endpoint to send requests to.

#### API
Which style API to use.

#### Features
The following features are available. Not all APIs support all features.

 * Hosted File Search - OpenAI Responses API only
 * Hosted Web Search - OpenAI Responses API only
 * Function Calling - Most APIs support this
 * Streaming Responses - Most APIs support this
 * Code Interpreter - OpenAI Responses API Only
 * File Upload and Vector Store -OpenAI Responses API only. Vector store is not currently used.

### AI > General > Prompts

Here you can edit the prompts. Values in `\(...)` are substituted. The exact substitutions depend on which prompt it is. For more information on interpolated strings, see [Variables](https://iterm2.com/documentation-variables.html).

 * Edit > Engage Artificial Intelligence - This prompt is sent when you select the Engage Artificial Intelligence menu item. `ai.prompt` is replaced with the text at the cursor or the manually entered prompt.
 * AI Chat + (options) - These prompts are used depending on which permissions are enabled. 

### AI > Features

#### Check Terminal State
This exposes information about the linked terminal to AI, including the current directory, user shell, the current or last command and its exit status, the size of the terminal window, the host you are SSHed to (if any), and the current username.

#### Run Commands
This makes functions available to AI that let it execute commands on your behalf.

#### Type for You
This makes functions available to AI that let it send keystrokes to the terminal.

#### View History
This exposes your command history in the linked session to AI

#### View Manpages
This lets AI view manpages. If you are using ssh integration, man pages from the remote host may be viewed by it.

#### Write to Clipboard
This makes functions available to AI that let it write to the clipboard.

#### Write to filesystem
This makes functions available to AI that let it write to the filesystem.

#### Act in Web Browser
This makes functions available to AI that let it view the contents of the current web page (applicable only in browser profiles).

#### Offer AI command suggestion in Composer and Auto Composer
When enabled, as you type in the composer what you have entered and relevant files or commands are sent to AI so it can make suggested completions. This is disabled by default because it is not very privacy-friendly.

<hr>
### Software Update

#### Update to Beta test releases
If enabled, iTerm2 will periodically check if a new unstable version of iTerm2 exists, and if so it will prompt you to download and upgrade.

#### Check for updates automatically
If enabled, iTerm2 will periodically check if a new version of iTerm2 exists, and if so it will prompt you to download and upgrade.

#### Ignore non-critical shell integration updates
If enabled, you won't be notified of updates to shell integration unless there is a security problem or other critical issue. Shell integration update notificationss are shown when the shell integration script is loaded (when you log in or ssh somewhere that has it installed).

#### Notify only for cricial shell integration updates
When disabled, iTerm2 will let you know whenever your shell integration scripts are out of date. When enabled, it will warn you only when a very important update is available (e.g., because of a security issue).

<hr>
### Selection

#### Copy to clipboard on selection
If enabled, text is copied to the clipboard immediately upon selection. If not selected, you must select **Edit > Copy** to copy it.

#### Copied text includes trailing newline
If enabled, a terminal newline will be copied to the pasteboard when the selection includes one; otherwise, no selection will ever include a terminal newline.

#### Applications in terminal may access clipboard
If enabled, clipboard access will be granted via escape code to programs running in iTerm2. They will be able to set the contents of the system pasteboard. For more details, see <a href="documentation-utilities.html">Shell Integration Utilities</a>.

#### Allow sending of clipboard contents?
An app running in the terminal can request that the terminal transmit the clipboard contents to it. Since this is a security risk, it normally requires you to consent each time.

#### Triple-click selects full wrapped lines
If enabled, a triple click selects a whole line, even if it was longer than one row in the terminal. If off, then triple click selects exactly one row.

#### Double-click performs smart selection
If enabled, double click performs smart selection instead of word selection as is standard on macOS.

#### Automatically enter copy mode on Shift+Arrow Key with selection
If enabled, pressing shift-left or shift-right will enter copy mode when a selection exists.

#### Characters considered part of a word for selection
When you double-click in the terminal window, a "word" is selected. The OS's algorithm for word selection is used, but it's extended to also include characters in this set. For example, by adding `/` to this field, double-clicking on a `path/like/this` would select the entire path instead of just one component.

#### Clicking on a command selects it to restrict Find and Filter
When enabled, clicking on a command dims other commands and then Find, Filter, and Select All operate only on the selected command. This requires shell integration.

#### When pasting a dropped filename, wrap it in double quotes
When enabled, dropping a file into a terminal will ensure that its name is always quoted with `"`.

<hr>
### Window

#### Smart window placement
If enabled, new windows will be opened where they least overlap existing windows.

#### Remember the size and position of previously closed windows
When enabled, new windows use the size and position of recently closed windows.

#### Adjust window when changing font size
If enabled, a change to a session's font will cause the window to grow or shrink.

#### Zoom maximizes vertically only
If enabled, the green "Zoom" button expands a terminal window vertically but does not affect its width. This can be overridden by holding down shift while clicking the zoom button.

#### Native full screen windows
If enabled, fullscreen windows will animate into a special desktop, as is typical in macOS 10.7 and later. If disabled, fullscreen windows will instantly go fullscreen without changing desktops.

#### Each tab may have its own window title
The OSC 0 and OSC 2 control sequences set the window title. This setting controls whether such a control sequence changes the window title associated with all sessions in the window, or only with the one in which it was received.

<hr>
### Settings

#### Load settings from a custom folder or URL:
If enabled, iTerm2 will load its settings from the specified folder or URL. After setting this, you'll be prompted when you quit iTerm2 if you'd like to save changes to the folder.

#### Save changes to folder when iTerm2 quits
When you've turned on *Load settings from a custom folder* and this is on then any changes you make to your settings will be written to the custom folder.

#### Export/Import All Settings and Data
If you need to back up/restore all of your settings, such as when moving to a new computer, use these buttons. The following are included:

 * Python API Runtimes
 * Secure user defaults (settings that require your password to change)
 * Everything in the Settings window
 * The contents `~/.iterm2`, such as shell integration scripts.
 * The contents of `~/Library/Application Support/iTerm2` which has your toolbelt notes, dynamic profiles, and more.
 * Python API scripts

<hr>
### tmux

#### When attaching, restore windows as…
The first dropdown box in the **tmux Integration** section allows you to define how tmux windows should be mapped to native constructs. When attaching to a new tmux session with the tmux integration, tmux windows not seen by iTerm2 before will open in either new windows or tabs, as specified by this preference.

#### Automatically bury the tmux client session after connecting
When the tmux integration is entered by running tmux -CC, the window in which that command was run will be <a href="documentation-buried-sessions.html">buried</a>.

#### Use "tmux" profile rather than profile of connecting session
This used to on by default, but is no longer so as of version 3.3. When enabled, a copy of the Default profile is created, called `tmux`. When using tmux integration all tmux sessions will use this profile.

When disabled, the profile of the session in which you ran `tmux -CC` will be used for all tmux sessions.

#### Status bar shows tmux status bar content, not native components.
When enabled, the status bar will contain the same content as the tmux status bar in its text-mode UI. When disabled, the status bar defined in the profile used for a tmux integration session will be used.

#### Pause a pane if it would take more than X seconds to catch up.
When both a tmux integration and tmux text-mode UI client are attached to the same tmux session, the text-mode UI can sink data much faster than tmux integration can because it drops information between frames. In this case, a large buffer can grow in the tmux integration window. Once the time to catch up exceeds this number of seconds, the tmux integration session will be paused. That means it stops receiving new data. While paused, no more data will be added to its buffer and may be lost forever. You will be prompted by a notification at the top of the window to unpause the session. This feature is only available in tmux 3.2 and later.

#### Warn Before Pausing
If enabled, a notification is shown when a pause is projected to occur within half of the pause deadline. See *Pause a pane if it would take more than X seconds to catch up* for more detail on pausing.

#### Unpause Automatically
When enabled, this unpauses the tmux session as quickly as possible after it is paused by tmux. It does not completely eliminate the possibility of data loss.

#### Mirror tmux paste buffer to local clipboard
tmux has a "paste buffer" which acts like its clipboard. When this option is enabled, the contents of the tmux paste buffer and copied into the system clipbloard.

### Experimental

#### Enable support for right-to-left scripts
When enabled, RTL scripts such as Arabic are drawn properly instead of as left-to-right text. Selection will behave a little weird.

#### Use SSH integration for ssh: URLs
If enabled, use [SSH integration](https://gitlab.com/gnachman/iterm2/-/wikis/SSH-Integration) when opening an SSH URL.
## Appearance

<hr>
### General

#### Theme
Allows you to select the theme. The theme affects how the areas outside the main terminal view are drawn, including colors and fonts.

The options are:

  * *Regular* - The standard macOS theme. Switches between dark and light mode automatically based on the system setting.
  * *Minimal* - This is inspired by the appearance of Electron apps. It is modern and streamlined.
  * *Compact* - A combination of Regular and Minimal. The standard colors are used, but the title bar is eliminated to save space.
  * *Light* - Regular theme but ignores system light/dark mode.
  * *Dark* - Regular theme but ignores system light/dark mode.
  * *Light High Contrast* - High contrast version of Light
  * *Dark High Contrast* - High contrast version of Dark

In Minimal and Compact, tabs go in the title bar if the tabs are on top. The
area between the red, yellow, and green buttons and the first tab can be used
to drag the window. If tabs are on the bottom or the left, you can move the
mouse to the top left of the window to reveal the red, yellow, and green buts.
The area around them, when revealed, can be used to drag the window.

#### Tab Bar Location
Defines whether tabs appear at the top, bottom, or left side of your windows.

#### Status Bar Location
Defines where the status bar appears, if enabled.

#### Auto-hide menu bar in non-native fullscreen
When native fullscreen mode is disabled (in **Prefs > General**), this option is available. If you'd like the menu bar to remain visible when a fullscreen window is present on a screen with a menu bar, turn this on.

#### Exclude from Dock and Cmd-Tab Application Switcher
When this setting is enabled, iTerm2 will disappear from the dock and you won't be able to switch to it with Cmd-Tab. An icon will be added to the right side of the menu bar that lets you get back to iTerm2's Settings. This is useful if you only use hotkey windows and you want iTerm2 to keep a low profile. You should be warned that this is a buggy part of macOS and sometimes things misbehave in small ways when this is enabled.

When selected, you can also enable **but only if all windows are hotkey windows** to bring back the dock icon when a non-hotkey window exists.

<hr>
### Windows

#### Show window number in title bar
If selected, window titles include the window number. You can navigate to a window by pressing cmd-opt-N where N is the window number. You can also change which modifiers are used in **Settings > Keys**.

#### Heavy border around windows in light mode
In light mode (or when there is a pane with transparency), window borders can be hard to see. Enabling this setting draws a thicker border around windows.

#### Hide scrollbars
If selected, scrollbars will be hidden in terminal windows.

#### Disable transparency for fullscreen windows by default
If enabled, entering fullscreen mode will automatically turn off transparency for that window.

#### Show line under title bar when tab bar is not visible
Turn this off for a sleek appearance with the dark theme.

#### Show proxy icon in window title bar
When enabled, an icon representing the current directory is added to the window's title bar. You can drag it.

<hr>
### Tabs

#### Show tab bar even when there is only one tab
If selected, the tab bar will remain visible when a window contains exactly one tab.

#### Preserve window size when tab bar shows or hides
When enabled, the window will not change size as the tab bar is shown or hidden. Instead, the number of rows of text inside the window may change.

#### Show tab numbers
If selected, tabs will indicate their keyboard shortcut.

#### Tabs have close buttons
If selected, tabs show close buttons. If not selected, the close buttons only appear when the mouse hovers over the tab.

#### Show activity indicator
If selected, the activity indicator in each tab will be displayed when new output is recevied and the tab is not selected.

#### Show new-output indicator
If selected, non-selected tabs will indicate they have unseen output with a blue circle in the tab.

#### Flash tab bar when switching tabs in fullscreen
If selected, the tab bar will show briefly when switching tabs in a fullscreen window. It will also show briefly when the number of tabs changes.

#### Show tab bar in fullscreen
If selected the tab bar will be visible in fullscreen windows.

#### Stretch tabs to fill bar
If selected, tabs will grow large enough to fill the entire tab bar, like system native tab bars. This is on by default.

#### Support basic HTML tags in tab titles
When enabled the following HTML tags are supported in tab titles: `<b>`, `<i>`, `<u>`.

<hr>
### Panes

#### Show per-pane title bar with split panes
When a tab has split panes, this option controls whether each split pane will have its own title bar.

#### Separate status bars per pane
When enabled, each pane gets its own status bar. When disabled, the window has a single status bar that shows information pertaining to the current pane.

#### Separate background images per pane
When disabled, the current pane's background image fills the window, spanning all panes.

#### Side/Top & Bottom margins
Margins are the area around terminal content that is usually empty. This values are in points. Note that the right and bottom margins may be larger than the value you specify here if the window size is not evenly divisible by the size of a single character. These values are in points.

<hr>
### Dimming

#### Dimming amount
This slider controls how much to dim inactive windows or panes.

#### Dim inactive split panes
If selected, split panes that do not have keyboard focus will be slightly dimmed.

#### Dim background windows
If enabled, windows in the background (that is, those not receiving keyboard input) are dimmed according to the above settings.

#### Dimming affects only text, not background
When a window or pane is dimmed, this option controls whether the background color is dimmed or only the text colors.


## Profiles
### General

#### Name
Gives the name of the profile which is shown in menus, Settings, and the profiles window. This serves as the default session name for sessions created with this profile, which is an interpolated string.

#### Profile Type
If the browser extension is installed this lets you define whether this session is for a terminal emulator or web browser session. See [Web Browser](/documentation-web.html) for more information.

#### Shortcut key
This shortcut can be used to open a new window or tab. By default, it opens a new tab, but if you hold down the option key while pressing the shortcut, a new window will be opened instead.

#### Tags
Tags are a collection of words or phrases that annotate a profile. When you search your profiles (for instance, in the profiles window), the tag names are searched in addition to the profile name. If a tag name contains a slash that defines a hierarchy of menu items in the **Profiles** menu.

#### Badge
The badge is a large label visible in the top right of a terminal session behind its text. For more information see <a href="badges.html">Badges</a>. This is an interpolated string.

Click the *Edit...* button to configure the position, maximum size, and typeface of the badge.

#### Title
This menu contains items which may be separately enabled. They are combined to form the session's title. The session's title is shown in per-pane title bars, when visible; it is also the default tab title. The current tab title also serves as the window title. The standard items in this menu are:

  * *Session Name* - The session name defaults to the profile name but may be changed later through the **Edit Session** dialog.
  * *Profile Name* - Gives the current name of the profile the session uses. If the session's profile changes, this profile name will be updated.
  * *Profile &amp; Session Name* - Shows both names if they are different or just the shared name if they are the same.
  * *Job* - The name of the foreground job.
  * *User* - The current user name. Use Shell Integration to enable this to work when connected to a remote machine.
  * *Host* - The current host name. Use Shell Integration to set the host name.
  * *PWD* - The present working directory. Use Shell Integration to enable this to work when connected to a remote machine.
  * *TTY* - The path to the TTY device associated with this session.

If a script that installs a custom title provider is running, its offerings will be added to the bottom of the list. For a working demo, see the <a href="https://iterm2.com/python-api/examples/georges_title.html">George's Title Algorithm</a> example.

<a href="https://iterm2.com/documentation-session-title.html">Learn more about session titles.</a>

#### Applications in terminal may change the title
When enabled, a control sequence can change a session's or window's title.

#### Subtitle
A tab's subtitle is a second line in a smaller typeface beneath the main title. It can be set by a control sequence or you can define it as an interpolated string. If your configuration has a legacy "short tabs" setting then you'll be prompted to enable "tall tabs" first, to make room for subtitles. That makes room for the second line of text and brings tab height up to the standard used by the most recent version of macOS.

#### Icon
You may assign an icon to the profile, elect to use the built-in icon (which is based on the foreground application), or to have no icon at all. Icons appear in the tab bar and the window title bar.

#### Command
This is the command that is executed when a new session with the profile is created. If *login shell* is chosen, then `login` is invoked. You can put special terms surrounded by $$ in this field (example: $$USERNAME$$). When a new session is created, you will be prompted to enter a value for each such term. See the description of URL Schemes below for details about the special "$$" value that can go in this field.

When *custom shell* is selected, you should enter the path to a shell (e.g., `/usr/local/bin/bash`) and it will be run as a login shell.

If *Command* is set to `SSH` then [SSH Integration](https://gitlab.com/gnachman/iterm2/-/wikis/SSH-Integration) will be used. SSH integration adds some features that regular SSH does not have:

  * Set environment variables automatically
  * Load shell integration automatically
  * Copy over local files to remote host
  * Features like CPU utilization in the status bar will show values from the remote host.

Consider SSH integration to be a beta quality feature.

To take full advantage of it the remote host must have Python 3 installed.

It is not recommended for SSHing to non-Unix hosts.

When you have selected SSH you can click the *Configure* button to further configure the SSH connection.

In this configuration window you can turn off `SSH Integration` to fall back to the system ssh command. You can also list environment variables to copy to the remote host. The values come from the current session. You can also edit the list of files to copy upon connection and where to place them on the remote host.

#### Load shell integration automatically
When enabled, [Shell Integration](/documentation-shell-integration.html) will be loaded into your shell when a new session is created. This is available for zsh, bash, and fish.

#### Send Text at Start
This text will be sent when a session begins. If it is not empty then a newline will be sent afterwards. It does not accept any special characters or require any escaping.

#### Initial Directory
Normally, new sessions begin in your home directory. You can choose to open new sessions in the same directory as the current session (but only when creating a new tab), or you can specify a starting directory.

#### URL Schemes
You can configure a profile to handle a URL scheme, such as ssh. When a hyperlink is clicked on with that scheme, a new tab is opened with the selected profile. It is recommended that you set the command to "$$", in which case an ssh command line will be auto-generated. For other schemes, you can uses these variables in the Command field and they will be replaced with the appropriate part of the URL:
<ul>
      <li>$$URL$$ The complete url</li>
      <li>$$HOST$$ The host portion of a url like scheme://host/</li>
      <li>$$USER$$ The username portion of a url like scheme://user@host/</li>
      <li>$$PASSWORD$$ The password portion of a url like scheme://user:password@host/</li>
      <li>$$PORT$$ The port number of a url like scheme://host:port/</li>
      <li>$$PATH$$ The path portion of a url like scheme://host/path</li>
      <li>$$RES$$ The portion of a url following the scheme.</li>
</ul>


## Profiles

#### Modes
Profiles may have different colors configured for light and dark mode. If you select *Use separate colors for light and dark mode* then you can switch between modes using the *Editing* control. Otherwise, only one set of colors will be assigned to this profile.

#### Color Presets...
iTerm2 ships with some color presets, which you may load from this popup menu. You can import and export color presets to files with the extension "itermcolors". There is an online color gallery where users may share color presets, and a link to it is provided in this menu. When importing a color preset, the name it is assigned is based on the filename imported.

### Colors

Clicking on any of the color wells opens a color picker that lets you change the setting for the selected color. iTerm2 has a custom color picker. If you don't like it you can revert to the system color picker by clicking the rectangular icon to the right of the eyedropper.

#### Context-aware cursor color
When selected, a box cursor will be displayed in reverse video. If this would result in confusion because nearby background colors would be very similar to the cursor's color, then a different color is chosen that will be most visible.

#### Cursor Boost
Cursor Boost dims all colors other than the cursor colors to make the cursor stand out more.

#### Cursor Guide
The cursor guide is a horizontal rule that indicates the vertical position of the cursor. You can adjust its color, including alpha value, to make it more visible against your background color.

#### Bold
When enabled, this color is used for bold text.

#### Underline Color
If enabled, this color will be used for all underlining, independent of the color that underlined characters have themselves.

#### Faint text opacity
Selects how prominent "faint" text is.

#### Minimum Contrast
Sometimes text in a terminal can be hard to read because the background and text colors are too similar. Because ANSI colors are configurable, apps have a hard time avoiding this problem. To ensure legibility, you can increase the Minimum Contrast setting. It has the effect of shifting text colors that are similar to their background colors closer to black or white. As this setting is increased, more colors are affected and the effect is greater. At 100, all text will be pure black or pure white. Minimum contrast never modifies background colors.

#### Selection
When enabled, you can specify a color for selected text. When disabled, the regular color is used (which may be difficult to read if the text color is similar to the selection color).

#### Use custom color for selected text
When enabled, the color you specify here for *Foreground* will be used for selected text. Otherwise, text color won't change when a selection is made.

#### ANSI Colors
These are the 16 standard colors most often used in terminal emulators. To the right is a visualization in polar coordinates where the angle gives the hue and the distance from center gives the saturation. This can help you configure colors that cover the color space consistently.

#### Tab Color
If enabled, this color will decorate the tab control. Tabs indicate the color of their current session if there is more than one split pane.

## Web

#### Page Zoom
Turn this up to increase the size of web pages to improve legibility.

#### Use /dev/null mode
A profile in this mode will be ephemeral. Information such as browsing history, cookies, or bookmarks are not saved to disk and disappear when the session is closed.

#### Enable Instant Replay
When enabled a screen capture video is constantly collected of the browser window. It respects the memory constraint in **Settings > General > Magic**. As with a terminal window you can review the video with **View > Start Instant Replay**
## Profiles
### Text

#### Cursor
This lets you select a cursor shape.

#### Shadow
This option is available for the underline and vertical bar cursors. It improves their visibility by adding a second line in a constrasting colorr next to the regular cursor.

#### Blink
If checked, the cursor will blink slowly to improve visibility.

#### Animate movement
If enabled, cursor movement in interactive apps will use a stretching animation to make it easier to follow.

#### Hide when keyboard focus lost
If enabled, the cursor will become invisible when the terminal does not have keyboard focus.

#### Italic text
If selected, text with the italic attribute set will be rendered in italics. The font you select must have an italic face.

#### Blinking text
If selected, text with the blink attribute set will actually blink. Oh, the humanity.

#### Draw bold text in bold font
If selected, bold text will be drawn in a bold version of the selected font. If the font does not have a bold version, then a bold appearance is simulated by "double striking" the text: that is, drawing it twice, shifting it one pixel horizontally the second time.

#### Use built-in Powerline glyphs
When enabled, iTerm2 renders Powerline glyphs itself rather than using what is built-in to the font. These glyphs tend to line up better with other elements than font-provided glyphs.

#### Use thin strokes for anti-aliased text
Anti-aliased text will be drawn with thinner strokes by default on Retina displays when the background color is darker than the foreground color. The effect may be more or less visible depending on your particular hardware and OS version. You can configure when thin strokes are used depending on display type and colors.

#### Use Unicode Version 9+ Widths
Unicode version 9 offers better formatting for Emoji. If your applications have been updated to use these tables, you should enable this setting.

#### Ambiguous characters are double-width
Some characters (e.g., Chinese ideograms) are double-width, and take two cells to display. Other characters (e.g., Latin letters) are single width and take only one cell to display. There is another category of characters known as "ambiguous width". One example of ambiguous-width characters are Greek letters. Depending on your application, you may prefer to display them as double-width or single-width. If most of the text you deal with is double-width, then you should enable this setting as it will help things to line up correctly in that context.

#### Normalization
This affects how text is processed on input. Most users will want no normalization. HFS+ normalization preserves the fullwidth attribute of composed characters. 
#### Regular font
ASCII text (latin letters, numbers, and some symbols) will be drawn using this font. Select "Anti-aliased" to draw the text with smooth edges.

#### Non-ASCII font
All non-ASCII text (many accented Latin letters, non-Latin text, less-common symbols, and thousands of miscellaneous unicode characters) will be drawn with this font. It is recommended that you use the same point size for both regular and non-ASCII fonts. Select "Anti-aliased" to draw the text with smooth edges.

#### Ligatures
When enabled and you have a font that supports ligatures (such as FiraCode) then text will be rendered with ligatures. This makes drawing much slower for two reasons: first, it disables the GPU renderer. Second, it uses a slower API. Users on less-than-stellar hardware may not want to enable it.

#### Special Exceptions
When the non-ASCII font is enabled you'll have the option to manage special exceptions. A special exception is a rule that maps a range of codes from another font into the terminal, possibly at a different range. This is useful if you work in multiple languages. For example, if you want to use a different font for Korean versus Chinese, you could create sepcial exceptions for Korean characters to pull from a different font.

This is more frequently used by Powerline (or "nerd font") users to mix graphical characters from different fonts. After opening the Special Exceptions panel, you can use the `Install Nerd Font Bundle` to get a good default configuration of powerline glyphs from a number of fonts.

You can import and export special exceptions to share them with others.

## Profiles
### Window

#### Transparency
This sets the transparency of the window background. It can be temporarily disabled with **View > Use Transparency**.

#### Keep background colors opaque
If selected, non-default background colors will be opaque. This is only available when transparency is greater than zero.

#### Blur
If selected, the window background is blurred provided the background has some transparency. Selecting a large radius will blur the background more, but (especially on Retina displays on older machines) comes with a performance penalty.

#### Rows/Columns
When creating a new window with this profile, it will be created with this many rows and columns.

#### Hide after opening
If enabled, a window created with this profile will immediately miniaturize after its creation.

#### Open Toolbelt
If enabled, a window created with this profile will feature an open toolbelt.

#### Custom window title
New windows created with this profile will use this title by default, overriding the default behavior of using the current tab's title as the window's title. This is an <a href="documentation-scripting-fundamentals.html">interpolated string</a>.

#### Force this profile to always open in a new window, never in a tab.
If you ask for a new tab with this profile, it will just open in a window instead. This is for people who hate tabs.

#### Use Transparency
Sets whether the transparency setting is respected for new windows created with this profile. It can then be toggled with *View > Use Transparency*.

#### Custom Tab Title
New tabs created with this profile will use this tab title by default. This is an <a href="documentation-scripting-fundamentals.html">interpolated string</a>.

#### Background Image
This allows you to select an image to display behind the terminal's text.

#### Mode
This allows you to select how the image is scaled to fit the window:

  * *Stretch* - The image is distorted to exactly fill the window.
  * *Tile* - The image is not scaled. It is tessellated.
  * *Scale to Fill* - The image is scaled up or down preserving the aspect ratio so that it completely fills the window. Parts of the image may be cropped out.
  * *Scale to Fit* - The image is scaled to exactly fill the window either horizontally or vertically. Its aspect raio is preserved. Letterboxes or pillarboxes may be added.

See also: *Settings > Appearance > Panes > Separate background images per pane*.

#### Blending
The blending slider determines how strongly the image dominates over the text's background color.

#### Style
This defines the window style.

  * *Normal* - A regular window with a title bar.
  * *Full Screen* - A full screen window. See *Settings>General>Window>Native full screen windows*.
  * *Maximized* - The window has a normal title bar but is forced to be as large as possible on the the screen it is on.
  * *No title bar* - A window without a title bar. It is hard to move but is as minimal as can be.
  * *Full-width bottom/left/top/right of screen* - A window that fills the display edge-to-edge along one dimension and is stuck to one edge of the screen. The rows or columns setting will be disregarded.
  * *Bottom/left/top/right of screen* - A window that is stuck to one edge of the screen.

#### Screen
If you have more than one screen connected, this lets you select the screen on which a new window should open. It is particularly useful for fullscreen and top-of-screen window styles. The *Screen with Cursor* option affects the initial screen of the window, but it won't follow your cursor from screen to screen.

#### Space
If you have enabled Spaces (or your OS uses Desktops instead of spaces) and have set Spaces/Mission Control to use Control+Number to switch spaces/desktops, then you can use this setting to select the initial space/desktop to open a new window using this profile.

Current Space means the window opens on the visible Space at the time it was created. For hotkey windows, Current Space causes them to move to the current Space each time they are opened.

All Spaces means the window follows you around from Space to Space.
## Profiles
### Terminal

#### Scrollback lines
The number of lines of scrollback buffer to keep above the visible part of the screen. Unlimited scrollback will allow it to grow indefinitely, possibly using all available memory.

#### Save lines to scrollback when an app status bar is present
Some programs (such as vim or tmux) keep a status bar at the bottom of the screen. For some applications (like vim) it is undesirable to save lines to the scrollback buffer when the application scrolls. For others (like tmux) you may want to save scrolled-off lines into the scrollback buffer. When this setting is enabled, lines scrolled off the top of the screen in the presence of a status bar are added to the scrollback buffer. The screen is considered to have a status bar if it has a scroll region whose top is the first line of the screen and whose bottom is above the bottom of the screen.

#### Save lines to scrollback in alternate screen mode
When in alternate screen mode, lines that scroll off the top of the screen will be saved to the scrollback buffer only if this option is enabled.

#### Drag-to-scroll disabled in alternate screen mode
Normally you can use the mouse to scroll by starting a selection and moving the pointer above or below the session's bounds with the button pressed. Interactive apps (like vim or emacs) signal their interactivity by entering alternate screen mode. When this setting is enabled, you won't be able to accidentally scroll by dragging in an interactive app.

#### Character encoding
The encoding to send and receive in. For most people, "Unicode (UTF-8)" is the right choice.

#### Report terminal type
The TERM variable will be set to this value by default. If xterm-256color is selected and your system is missing the terminfo file, you will be prompted to install it when you open a new session.

#### ENQ answer back
Text to send when the ENQ sequence is received. Not normally used.

#### Enable mouse reporting
If selected, applications may choose to receive information about the mouse. This can be temporarily disabled by holding down Option.

#### Report mouse wheel events
If disabled, the mouse wheel will always perform its default action (such as scrolling history) rather than being reported to an app that has enabled mouse reporting.

#### Report mouse clicks & drags
If disabled, the mouse buttons will always perform their default action (such as making a selection) rather than being reported to an app that has enabled mouse reporting.

#### Terminal may enable alternate mouse scroll
Alternate mouse scroll is a feature where the scroll wheel sends arrow up/down keys rather than navigating history. If enabled, a program may switch into alternate mouse scroll.

#### Automatically enable alternate mouse scroll
When enabled, alternate mouse scroll will be turned on any time you're in an interactive application.

#### Restrict alternate mouse scroll to vertical scrolling
When enabled, a horizontal scroll gesture will never send arrow keys when alternate mouse scroll is on.

#### Restrict mouse reporting to alternate screen mode
When enabled, mouse movements or clicks will be reported only when in an interactive application.

#### Terminal may report window title
Programs running in a terminal may send an escape code to request the current window title. You may disable this feature by enabling this option. It should be disabled if you're communicating with an untrusted party, as there are possible injection attacks.

#### Terminal may change cursor blink
If enabled apps running in the terminal can cause the cursor to start or stop blinking with a control sequence.

#### Disable session-initiated printing
If enabled, escape codes that initiate printing will be ignored.

#### Disable save/restore alternate screen
Some programs (such as vim, tmux, and less) switch into a so-called "alternate screen". A characteristic of this behavior is that when these programs terminate the screen's contents are restored to their state from before the program was run. If this option is selected, alternate screen mode is disabled and the screen cannot be restored by an application.

#### A session may cause the window to resize
If enabled, the window size can be changed by a program sending a control sequence.

#### ...even if it is in an unselected tab or split pane
If enabled, programs running non-selected tabs or split panes without keyboard focus may resize the window.

#### Terminal may enable paste bracketing
Paste bracketing is a feature that can be enabled by an app running in iTerm2 by sending a control sequence. When enabled, iTerm2 transmits a control sequence before and after paste operations (e.g., pressing Cmd-V). This can be useful because editors like vim may disable auto-indenting when pasting already-indented code. Sometimes paste bracketing can be left on, causing unexpected behavior when you paste. For example, if a program running in an ssh session enables paste bracketing and then your ssh connection ends unexpectedly it won't have a chance to turn it off. Your next paste will include the bracketing control sequences, which will be mishandled by whatever program receives them. For that reason, some people prefer to disable paste bracketing. If you install Shell Integration it can detect when this occurs and automatically disable paste bracketing for you, making it safe to leave it enabled here.

#### Silence bell
If selected, the bell (control-G) will not make an audible sound.

#### Flash visual bell
If selected, a bell graphic will be flashed when the bell character is received.

#### Show bell icon in tabs
If selected, tabs will indicate that a bell has rung by displaying a bell graphic.

#### Notification Center alerts
If selected, iTerm2 will post a notifications when sessions receive output, become idle, ring the bell, close, or get a proprietary escape sequence to post a notification.

#### Filter Alerts
This button opens a panel that lets you customize which notifications will be posted.

#### Environment
You have the following options:

 * `Set locale environment variables automatically` - If enabled, LANG and LC_CTYPE environment variables will be set based on your machine's language settings.
 * `Do not set locale environment variables` - LANG and LC_CTYPE will be unset.
 * `Use custom locale...` - Lets you specify the locale variables you wish to use. You will be limited to those that are supported by your Mac.

The current locale is shown beneath this setting.

#### Insert newline before start of command prompt if needed
If you have <a href="documentation-shell-integration.html">Shell Integration</a> installed and a command's output does not end in a newline, this setting will ensure your prompt does not begin in the middle of the line.

#### Show mark indicators
If you have <a href="documentation-shell-integration.html">Shell Integration</a> and this setting is selected then a blue or red arrow appears next to each shell prompt. Turn this off to hide the arrow.

#### Show offscreen command line at top of session
When the session shows part of a command's output but the command is above the top of the screen, the command can be shown in a box  at the top when this is enabled.

#### Click on a path in a shell prompt to open Navigator
If enabled and your shell prompt contains something directory-like (for example, `/Users/george% `) then clicking on that directory opens a Navigator window that lets you browse the file system.

#### Send newline rather than carriage return to terminal commands
Some obscure or ancient systems expect newlines as line terminators. Unfortunately there is no way to detect this automatically. If tmux integration simply hangs for you on certain hosts, enabling this setting may fix it.
## Profiles
### Session

#### Warn about short-lived sessions
When enabled, you'll be given a warning if a session ends within a short time after it starts. This gives you a chance to see what went wrong and fix it.

#### "Undo" can revive a session that has been closed for up to X seconds
When you close a session, window, or tab the shell is not terminated until X seconds pass. While that time period has not elapsed, *Undo* will reopen the session, tab, or window.

#### After a session ends
Defines what happens when a session ends.

 * *No Action* - The session stays open and you will be prompted to restart it.
 * *Close* - The session is automatically closed.
 * *Restart* - The session is automatically restarted with the same command that launched it.

#### Prompt before closing
When a session will close, you can choose when to be prompted with a modal alert. If you select *If there are jobs besides* then the prompt will only be shown when an app besides those specified (which are often present when nothing is happening) is running.

#### Enable automatic session logging
If enabled, every session's output will be logged to a file in the specified directory. The filename format can also be specified here as an interpolated string.

#### Log format
You can log in the following formats:

 * *Raw data* - An exact copy of the input that was received including control sequences.
 * *Plain text* - Excludes control sequences. Just text and newlines. This is very readable when running CLI apps but becomes utter chaos for interactive programs like vim or emacs.
 * *HTML* - Like *Plain text*, it excludes control sequences. Colors and various font attributes are preserved. The resulting file can be viewed in a web browser.
 * *asciinema* - Produces a file viewable with <a href="https://asciinema.org/">asciinema</a>, which preserves time as well as more font attributes.

#### Folder
The folder in which to place logs. This is an [interpolated string](https://iterm2.com/documentation-scri
pting-fundamentals.html#interpolated-strings).

#### Filename
The name to give the log file. This is an [interpolated string](https://iterm2.com/documentation-scri
pting-fundamentals.html#interpolated-strings).

#### Open password manager automatically
If enabled the password manager will be opened when a session with this profile is created.

#### Timestamps
When enabled, the last modified date and time of each line is shown on the right-hand side of the terminal. You can also select whether timestamps should overlap contents or sit next to them.

#### Status bar enabled
See <a href="documentation-status-bar.html">Status Bar</a> for details on the status bar.

#### When idle, send ASCII code X every Y seconds.
If selected, the specified ASCII code "X" (a number from 0 to 255) will be transmitted every Y seconds while nothing is happening. Don't use this unless you know what you're doing as it can have unexpected consequences. Seriously, it's probably not what you want.

#### Avoid repainting while cursor is hidden to reduce flicker while scrolling
When selected, the screen will slightly delay redraws while the cursor is hidden. This improves the visual appearance of scrolling in many programs but might introduce noticeable delays for some users.
## Profiles
### Keys > General

#### Allow Application Keypad Mode
Some full-screen progarms (like emacs) switch the keyboard into application keypad mode, which changes how the numeric keypad behaves. Disabling this option causes iTerm2 to never enter application keypad mode.

#### Report modifiers using CSI u
Enables a more powerful keyboard reporting algorithm that some applications may use to enable the use of modifiers on more keys and more combinations of modifiers. This is not recommended. Applications should use the [Kitty keyboard protocol](https://sw.kovidgoyal.net/kitty/keyboard-protocol/#functional-key-definitions) instead.

#### Apps can change how keys are reported
When enabled apps running in the terminal can change the key reporting mode.

#### Page up, page down, home and end scroll outside interactive apps
When enabled, these keys move the viewport unless you are running an interactive application.

#### Treat option as Alt for special keys like arrows
When reporting function keys (such as arrows) to apps running in the terminal, the specifications are ambiguous about whether the Mac Option key should behave like Alt or Meta. When this setting is enabled, it is treated as alt. When disabled, it is treated as Meta.

#### Left/Right Option Key
It is common to use a modifier to send so-called "meta keys". For most users, selecting "+Esc" here is the right choice. The "Meta" option sets the high bit of the input character, and is not compatible with modern systems.

The corresponding *Apps can change this* setting can be disabled to prevent apps in the terminal from modifiying your setting with a control sequence.

#### Left/Right Control/Command, fn key
Some programs support extended modifier keys of Hyper, Meta, and Super. You can configure existing modifier keys to act as these extended keys. This setting will be in effect only when running a program that uses the Kitty keyboard protocol; otherwise, they will act like regular control, command, and fn keys.

#### A hotkey opens a dedicated window with this profile
When enabled, a dedicated hotkey window is attached to this profile. The **Configure Hotkey Window** button lets you configure the hotkey and other attributes of the window. For more information, see <a href="documentation-hotkey.html">Hotkey Windows</a>.



### Keys > Key Mappings

This panel shows key mappings. You can double-click on a mapping to edit it. When the "Keyboard Shortcut" field has focus, you should press the keystroke that you want to modify (even if it involves modifiers like Cmd). The following actions are available:

  * *Ignore* - The keypress will do nothing.
  * *Bypass Terminal* - Prevents the keystroke from being sent to the terminal while allowing macOS to handle it normally. For example, if F1 triggers a macOS Shortcut, binding F1 to Bypass Terminal stops it from sending a control sequence to the terminal but still lets the system shortcut work.
  * *Select Menu Item...* - This action allows you to enter the name of an iTerm2 menu item. It must be entered exactly the same as it appears in the menu. Ellipses can be typed with option-semicolon.

  * *Do not remap modifiers* - This action lets you exempt a keystroke from modifier remapping. For example, if you remap ⌘ to ⌥ but you want ⌘-Tab to work as though ⌘ were unmapped just for that keystroke, you would use this action and set the keyboard shortcut to ⌘-Tab.
  * *Remap modifiers in iTerm2 only* - This action applies modifier remapping but prevents other programs from seeing the keystroke. For example, if you've swapped ⌘ and ^ and want physical ^-tab to switch tabs in iTerm2 instead of triggering the app switcher: bind ^-tab to this action. The system won't see the remapped ⌘-tab (so no app switcher), but iTerm2 receives it and can switch tabs.

  * *Cycle Tabs Forward/Backward* - This implements tab switching the same way Cmd-Tab (or Cmd-Shift-Tab) switches windows, with the most-recently-used stack.

  * *Run Coprocess* - This action launches a Coprocess. <a href="documentation-coprocesses.html">Learn more about coprocesses</a>.
  * *Start Instant Replay* - This is equivalent to the menu item **View > Start Instant Replay**.
  * *Undo* - Invokes the Undo action. Could be used to undo closing a session/tab/window.
  * *Send tmux command* - Used in tmux integration to send a command directly to the tmux server of the current session.
  * *Alert on next mark* - Toggles the Alert on next mark feature.

  * *New Window with Profile* - Creates a new window with a profile you specify here.
  * *New Tab with Profile* - Creates a new tab with a profile you specify here.
  * *Duplicate Tab* - Creates another tab exactly like the current one.

  * *Split horizontally/vertically with Profile* - Creates a new split pane by cleaving the current session. Uses the profile you specify here.
  * *Split/New Window/Tab with Profile* - These actions allow you to create a new session with a specified profile when a key is pressed.

  * *Change Profile* - This action changes the profile of the current session.
  * *Load Color Preset* - This action changes the colors of the current session using the specified preset.

  * *Next/Previous Tab/Window/Pane* - These actions navigate among tabs, windows, and split panes.
  * *Move tab left/right* - Changes the tab's position in the order.
  * *Next/Previous Window* - Selects the next or previous window in window order.
  * *Next/Previous Pane* - Selects the next or previous pane in left-to-right, top-to-bottom order.
  * *Select Split Pane Above/Below/Left/Right* - These actions navigate split panes.

  * *Increase/Decrease Width/Height* - Changes the size of the current session.

  * *Scroll to End/Top/Up/Down* - These actions move through the scrollback buffer.
  * *Scroll one Line/Page Up/Down* - These actions move through the scrollback buffer.

  * *Swap with Split Pane Above/Below/Left/Right* - Exchanges the current session with an adjacent session in a split pane in the same tab.
  * *Swap with Next/Previous Pane* - Exchanges the current session with the next/previous pane in the same tab.
  * *Move Session to Split Pane* - After invoking this, click a different session. The current pane will be moved to share half its former space.

  * *Send ^? / ^H Backspace* - Modern systems use ^? for backspace, while some legacy systems use ^H.
  * *Send Escape Sequence* - This action allows you to enter some text that will be sent when the associated key is pressed. First, the ESC character is sent, and then the text you entered is sent. There are no special characters and no escaping is necessary.
  * *Send Hex Code* - This action allows you to enter a sequence of hex codes that will be sent. Each value should begin with "0x" followed by one or two hex digits (0-9, a-f, or A-F). Each code should be separated by a space. You can see a list of hex codes on http://asciitable.com/ in the "Hx" column.
  * *Send Text* - This action allows you to enter a text string that will be sent when the associated key is pressed. The following escape characters are supported: \n (newline), \e (escape), \a (bell), \t (tab).
  * *Send Text with "vim" Special Characters* - This action allows you to enter a text string that will be sent when the associated key is pressed. The following special sequences are supported, where the "." characters are placeholders: \... (three-digit octal number), \.. (two-digit octal number; must be followed by non-digit), \. (one-digit octal number; must be followed by non-digit), \x.. (two-digit hex number), \x. (one-digit hex number), \u.... (four-digit hex number), \b (backspace), \e (escape), \f (form feed), \n (newline), \r (carriage return), \t (tab), \\ (backslash), \" (double quote), \\\<C-.> (control key), \\\<M-.> (meta key)
  * *Send Snippet* - You can choose a snippet to send.
  * *Compose...* - Open the Composer.

  * *Find Regular Expression* - Performs a search for a saved regular expression.
  * *Find Again Up/Down* - Repeats the search, finding the next result at an earlier/later position.

  * *Paste* - Like **Edit > Paste**, but you can set advanced paste settings to use.
  * *Paste From Selection* - Like **Edit > Paste and Edit > Paste Special > Paste Selection**, but you can set advanced paste settings to use.
  * *Copy or send ^C* - If there is a selection, copy it. Otherwise, send the literal Control-C keystroke.
  * *Paste or send ^V* - If there is text in the pasteboard, paste it. Otherwise, send a literal Control-V keystroke.
  * *Copy Interpolated String* - Evaluates the [interpolated string](https://iterm2.com/documentation-scripting-fundamentals.html#interpolated-strings) you provide it and copies it to the clipboard.
  * *Copy Mode Commands* - Takes as a parameter a sequence of commands that you would normally use interactively in [Copy Mode](https://iterm2.com/documentation-copymode.html). For example, you could give it `<space>` `k` `<space>` `y` to select the line above the cursor.
  * *Toggle Fullscreen* - This action enters or exits full screen mode
  * *Toggle Pin Hotkey Window* - Toggles whether the hotkey window hides when it loses focus.
  * *Toggle Mouse Reporting* - Temporarily enable or disable mouse reporting.

  * *Move Start/End of Selection Back/Forward* - Adjusts the range of selected text.

  * *Invoke Script Function* - Calls a function registered by a script. See <a href="documentation-scripting-fundamentals.html">Scripting Fundamentals</a> for details on functions.

  * *Sequence...* - Lets you create a keybinding from a sequence of key bindings.

You can add a new keymapping by pressing "+". You can remove an existing mapping by selecting it and pressing "-". Three presets are provided: "Xterm defaults" is the normal key mappings, while "Xterm defaults with numeric keypad" disables the "application keypad" in favor of the numbers and symbols that the numeric keypad typically emits. "Terminal.app Compatibility" tries to emulate the way that Terminal.app sends keys by default.

You can also import and export your key bindings to share with others.

#### Delete sends ^H
If you are on a legacy system that does not accept ^? for backspace, select this and it will add a key mapping for you.

### Profiles > Advanced

#### Triggers
Triggers are actions that are performed when text matching a regular expression is received. Each trigger has a regular expression, which defines when it runs. It has an action, which defines what it performs, and it has an optional parameter, whose meaning depends on the action. When the parameter is textual, \0 is replaced with the entire match, and \1...\9 are replaced with match groups. Each trigger has a checkbox in the "Instant" column. Instant triggers run as soon as text matching the regular expression is matched; triggers that are not instant only match after the cursor moves off the current line (such as whena newline is received).

Full details can be found at <a href="documentation-triggers.html">Triggers</a>.

#### Smart Selection
[Smart Selection](/documentation-smart-selection.html) defines regular expressions that are used to select text on quad-click. 

#### Automatic Profile Switching
You can specify rules that, when satisified, changes any session's profile to this one. See <a href="automatic-profile-switching.html">Automatic Profile Switching</a> for all the details.
</p>

#### Snippets Filter
The Snippets feature lets you save a collection of strings to re-send later on. Each snippet may have one or more tags associated with it. If you would like to show only certain snippets when working in a particular profile, you can name tags in the Snippets Filter that are required for a snippet to be available in the context of a session with this profile.

#### Semantic History
Semantic history is used to open a file when you Cmd-Click on it. The current working directory for each line in the terminal is tracked to help find files. If Semantic History is set to "Open with default app," then files are passed to the OS to be opened with whatever is associated. Alternatively, you can choose "Open URL..." to open a specific URL (with \1 replaced with the filename and \2 replaced with the line number, if applicable). If you choose "Open with editor..." then text files will be opened with the designated editor, while other files are opened with the default app for their file type. For more flexibility, choose "Run command..." and specify a command to execute. \1 will be replaced with the file name, \2 will be replaced with the line number (if applicable), \3 with text in the line prior to the click location, \4 with text in the line subsequent to the click location, and \5 for the working directory of the line clicked on. Finally, "Always run command..." is like "Run command...," but takes effect even if the object clicked on is not an existing filename.

## Keys
<hr>

### Key Bindings

This interface works like the keyboard shortcut system in profiles (described above) but it affects all profiles. Settings here are overridden by those in a profile's key mappings.

See the list of key binding actions at <a href="documentation-preferences-profiles-keys.html">Settings&nbsp;>&nbsp;Profiles&nbsp;>&nbsp;Keys</a>.

#### Add Touch Bar Item
This button is only visible if your OS version supports touch bars. By pressing this button, you can define a new custom touch bar button with any of the actions you can assign to a key (see below). You can then add the custom button to your touch bar with **View > Customize Touch Bar**.

#### Touch Bar Mitigations
This opens a panel with these options:

 * *Haptic feedback when pressing esc* When you press esc on a touchbar, this makes the trackpad vibrate to provide feedback.
 * *Key click for virtual esc key* When you press esc on a touchbar, this causes a click sound to be played.
 * *Visual esc key indicator* When you press esc on a touchbar, make the cursor change shape briefly to provid feedback.

#### Presets > Factory Defaults
Restores key bindings to the iTerm2 defaults.

#### Presets > Import/Export
Lets you share key bindings with others.

#### Interpret key bindings based on physical key, ignoring input language
When enabled key bindings refer to a particular key rather than a particular character. For example, suppose you have bound Cmd-Opt-A to perform some action while using a US keyboard and then switch to an AZERTY layout. With this setting enabled, you'd press Cmd-Opt-Q to invoke the action since the AZERTY `Q` is where the QWERTY `A` goes.

Note that only key bindings created with iTerm2 version 3.5.0beta19 or later will adapt to different keyboard layouts. Older key bindings did not store the keycode and will continue to behave as though this setting was not enabled.

#### Leader

By defining a "leader" key you can create shortcuts that consist of two keystrokes. Command-B is the recommended leader. After setting the leader, you can define a new keybinding by pressing `Leader` followed by another keystroke. For example, if your leader is Command-B, you could define a key binding as the sequence `Command-B` `N`.

In tmux integration key bindings are automatically created for you based on tmux's configured command key bindings. For example, if tmux is configured for `C-b c` to create a new window, then in tmux integration `[leader] c` will do the same.

### Navigation Shortcuts

#### Shortcut to activate a tab
Tabs are normally navigated with cmd+number, but you can change the modifier used for that function here.

#### Shortcut to activate a window
Windows are normally navigated with cmd+opt+number, but you can change the modifier used for that function here.

#### Shortcut to choose a split pane
You can use this to configure a modifier+number shortcut to select a split pane in the current tab.

#### Emulate US Keyboard
If your keyboard layout requires you to hold Shift (or some other modifier) to press a number, enable this to treat the top row of keys as number keys even when Shift is not pressed. This only affects switching panes, tabs, and windows by keyboard as configure in the preceding settings.

### Hotkey

#### Create a Dedicated Hotkey Window
Sets up a new hotkey window profile if you don't already have one. For more information, see <a href="documentation-hotkey.html">Hotkey Windows</a>.

#### Show/Hide iTerm2 all windows with a system-wide hotkey
When enabled, you can focus the Hotkey: field and press a keystroke. From then on, pressing that keystroke (even when iTerm2 is not the front application) will cause iTerm2 to come to the front. If it is the foreground app, it will be sent to the back. This requires that you enable access for assistive devices in the Universal Access panel of System Settings. For more information, see <a href="documentation-hotkey.html">Hotkey Windows</a>.

### Remap Modifiers

iTerm2 allows you to change the meanings of the modifier keys only within iTerm2. This is useful, for example, if you find it difficult to press "option" for "meta" and would prefer to use "command" for that purpose.

### Input Locale

#### Force keyboard
You can enable this setting to force iTerm2 to use a specific keyboard layout rather than the current system keyboard.
## Arrangements
<hr>
This tab lets you view saved window arrangements. You can delete them with the minus button and select the default arrangement.


## Pointer
<hr>

### General

#### Cmd-Click Opens Filename/URL
If enabled, then clicking on a filename (of an existing file on the local machine) or a URL will open it.

#### Ctrl-click reported to apps, does not open menu
If enabled, ctrl-click will be sent to applications that support Xterm mouse reporting (if mouse reporting is enabled).

#### Option-Click moves cursor
If enabled, option-click will move the cursor to where the mouse pointer is. If you install shell integration, this will be well-behaved at the shell prompt by not sending up and down arrow keys.

#### Three-finger tap reports middle click to apps
If enabled, a three-finger tap acts like a middle click for the purposes of mouse reporting.

#### Focus follows mouse
If enabled, moving the mouse over an inactive window will cause it to receive keyboard focus.

#### Focus window after right or middle click
When enabled, right-clicking or middle-clicking on a window will give it keyboard focus.

### Bindings

#### Mouse Button and Trackpad Gesture Actions
You may assign custom actions to mouse clicks and trackpad gestures. The left mouse button is not configurable because its behavior is rather complex, however. This is especially useful if you have a mouse with many buttons. Any combination of mouse button + number of clicks + modifiers may be assigned an action. For gestures, three finger taps and swipes may be configured in combination with modifiers. The following actions are available:

  * *Extend selection* - The text selection will grow, either from its beginning or end, to the location of the pointer.
  * *Ignore* - Perform no action
  * *Invoke script function* - Call a Python API-defined function.
  * *Move pane* - The current pane will turn green. Click in another window's tab bar or in another pane to split to move the now-green pane.
  * *New Horizontal/Vertical split with profile* - The pane under the pointer will be split and the new split will use the specified profile.
  * *New Split/Tab/Window With Profile* - A new split pane/tab/window will be opened with the specified profile.
  * *Next/Previous Tab/Window* - Navigates through tabs and windows.
  * *Open Context Menu* - Opens the menu normally opened by a right click.
  * *Open URL in background* - Opens the URL under the pointer in your web browser without bringing the browser to the foreground.
  * *Open URL/Semantic History* - Opens the URL under the pointer, bringing the web browser to the foreground. If what's under the cursor is a filename on the local machine, it will be opened with Semantic History.
  * *Paste from Clipboard* - Pastes the contents of the pasteboard (like *Edit > Paste*) but you can also configure advanced paste settings.
  * *Paste from Selection* - Pastes the most recent selection made in iTerm2, even if it's not what's in the pasteboard. Allows you to configure advanced paste settings.
  * *Quicklook* - Defines the word under the cursor or, if it's a URL, opens it in a web browser popover.
  * *Select Next/Previous Pane* - Navigates panes according to how recently they were used.
  * *Select menu item* - Select an item from the app's main menu.
  * *Select pane Above/Below/Left/Right* - Navigates panes by their layout.
  * *Send Escape Sequence...* - This action allows you to enter some text that will be sent when the associated key is pressed. First, the ESC character is sent, and then the text you entered is sent.
  * *Send Hex Code* - This action allows you to enter a sequence of hex codes that will be sent. Each value should begin with "0x" followed by one or two hex digits (0-9, a-f, or A-F). Each code should be separated by a space. You can see a list of hex codes on http://asciitable.com/ in the "Hx" column.
  * *Send Text* - This action allows you to enter a text string that will be sent when the associated key is pressed. The following escape characters are supported: \n (newline), \e (escape), \a (bell), \t (tab).
  * *Smart Selection* - Performs smart selection on the text under the pointer.
  * *Smart Selection ignoring Newlines* - Performs smart selection on the text under the pointer, ignoring newlines (e.g., if a URL is split by a hard newline, it can still be selected as a single item).

<hr/>

