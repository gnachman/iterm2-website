
### General
<hr>
#### Startup
The first dropdown box lets you select how windows will be opened when iTerm2 is launched. Most users will want *Use System Window Restoration Setting* as it works best with <a href="restoration.html">Session Restoration</a>. Users who exclusively use the Hotkey Window may prefer *Only Restore Hotkey Window*, which will not restore regular windows but will restore the hotkey window. If you have a default window arrangement saved then *Open Default Window Arrangement* will be available.

#### Open profiles window
If selected, the Profiles Window will automatically open when iTerm2 is started.

#### Quit when all windows are closed
If selected, iTerm2 will automatically quit when its last terminal window is closed.

#### Confirm closing multiple sessions
If selected, commands that close one session will not be confirmed, but commands that close multiple sessions (such as clicking the red button on a window with two or more tabs) will be confirmed with an alert box.

#### Confirm Quit iTerm2 Command
If selected, the Quit iTerm2 (cmd-Q) command will be confirmed if any terminal windows are open.

#### Instant Replay Uses X MB per Session
This setting specifies the maximum amount of memory allocated to instant replay for each tab or split pane. More memory means instant replay is able to go farther back into the past. You can enter instant replay with **View > Step Back in Time**.

#### Save copy/paste and command history to disk
If selected, every time text is copied or pasted in iTerm2 it will be saved to disk. The last 20 values are recorded. They can be accessed with **Edit > Open Paste History...**. If you use <a href="shell_integration.html">Shell Integration</a> then when this is enabled your command history, directory history, and remote hostname and usernames will also be saved to disk. Unchecking this will erase all of the saved information.

#### GPU rendering
Starting in iTerm2 version 3.2.0, text may be drawn with GPU acceleration. This should improve performance. You can turn it off with this control. Most users will want to leave it on.

##### Advanced GPU Settings > Disable GPU renderer when disconnected from power
The GPU renderer uses more energy than the legacy renderer so you may prefer not to use it when your laptop is not charging.

##### Advanced GPU Settings > Maximize Throughput
This reduces the frame rate to 30 fps when a lot of text is being printed (such as when you `cat` a large file). It reduces the time it takes to process such input.

##### Advanced GPU Settings > Prefer integrated to discrete GPU
If your machine has two GPUs, this setting lets you pick which one to use. The integrated GPU is slower but uses less energy. You must restart iTerm2 after changing this setting.

#### Add Bonjour hosts to profiles
If selected, all Bonjour hosts on the local network have a profile created for them as long as they're around.

#### Check for updates automatically
If enabled, iTerm2 will periodically check if a new version of iTerm2 exists, and if so it will prompt you to download and upgrade.

#### Prompt for test-release updates
If enabled, iTerm2 will periodically check if a new unstable version of iTerm2 exists, and if so it will prompt you to download and upgrade.

#### Load preferences from a custom folder or URL:
If enabled, iTerm2 will load its preferences from the specified folder or URL. After setting this, you'll be prompted when you quit iTerm2 if you'd like to save changes to the folder.

#### Save changes to folder when iTerm2 quits
When you've turned on *Load preferences from a custom folder* and this is on then any changes you make to your settings will be written to the custom folder.

#### Copy to pasteboard on selection
If enabled, text is copied to the clipboard immediately upon selection. If not selected, you must select **Edit > Copy** to copy it.

#### Copied text includes trailing newline
If enabled, a terminal newline will be copied to the pasteboard when the selection includes one; otherwise, no selection will ever include a terminal newline.

#### Applications in terminal may access clipboard
If enabled, clipboard access will be granted via escape code to programs running in iTerm2. They will be able to set the contents of the system pasteboard. For more details, see <a href="documentation-utilities.html">Shell Integration Utilities</a>.

#### Characters considered part of a word for selection
When you double-click in the terminal window, a "word" is selected. The OS's algorithm for word selection is used, but it's extended to also include characters in this set. For example, by adding `/` to this field, double-clicking on a `path/like/this` would select the entire path instead of just one component.

#### Smart window placement
If enabled, new windows will be opened where they least overlap existing windows.

#### Adjust window when changing font size
If enabled, a change to a session's font will cause the window to grow or shrink.

#### Zoom button maximizes vertically only
If enabled, the green "Zoom" button expands a terminal window vertically but does not affect its width. This can be overridden by holding down shift while clicking the zoom button.

#### Native full screen windows
If enabled, fullscreen windows will animate into a special desktop, as is typical in macOS 10.7 and later. If disabled, fullscreen windows will instantly go fullscreen without changing desktops.

#### tmux Integration
The first dropdown box in the **tmux Integration** section allows you to define how tmux windows should be mapped to native constructs. When attaching to a new tmux session with the tmux integration, tmux windows not seen by iTerm2 before will open in either new windows or tabs, as specified by this preference.

#### Open dashboard if there are more than...tmux windows
When attaching to a tmux session with the tmux integration, windows are normally opened automatically. If there are too many of them, then the tmux dashboard is opened instead.

#### Automatically bury the tmux client session after connecting
When the tmux integration is entered by running tmux -CC, the window in which that command was run will be <a href="documentation-buried-sessions.html">buried</a>.

### Appearance
<hr>

#### Tab Bar Location
Defines whether tabs appear at the top, bottom, or left side of your windows.
Select from a list of tab looks.

#### Theme
Allows you to select the theme. Light and Dark options are available, along with high-contrast versions that are easier to read.

#### Show tab bar even when there is only one tab
If selected, the tab bar will remain visible when a window contains exactly one tab.

#### Show tab numbers
If selected, tabs will indicate their keyboard shortcut.

#### Show tab close buttons
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
If selected, tabs will grow large enough to fill the entire tab bar, like system native tab bars.

#### Show per-pane title bar with split panes
When a tab has split panes, this option controls whether each split pane will have its own title bar.

#### Auto-hide menu bar in non-native fullscreen
When native fullscreen mode is disabled (in **Prefs > General**), this option is available. If you'd like the menu bar to remain visible when a fullscreen window is present on a screen with a menu bar, turn this on.

#### Exclude from Dock and Cmd-Tab Application Switcher
When this setting is enabled, iTerm2 will disappear from the dock and you won't be able to switch to it with Cmd-Tab. An icon will be added to the right side of the menu bar that lets you get back to iTerm2's preferences. This is useful if you only use hotkey windows and you want iTerm2 to keep a low profile.

#### Show window number
If selected, window titles include the window number. You can navigate to a window by pressing cmd-opt-N where N is the window number.

#### Show current job name
If selected, tab and window titles will show the name of the foreground job.

#### Show profile name
If selected, tab and window titles will show profile names.

#### Dimming affects only text, not background
When a window or pane is dimmed, this option controls whether the background color is dimmed or only the text colors.

#### Dimming amount
This slider controls how much to dim inactive windows or panes.

#### Dim inactive split panes
If selected, split panes that do not have keyboard focus will be slightly dimmed.

#### Dim background windows
If enabled, windows in the background (that is, those not receiving keyboard input) are dimmed according to the above settings.

#### Show border around window
If selected, a 1-pixel border will be shown around the edges of terminal windows.

#### Hide scrollbars
If selected, scrollbars will be hidden in terminal windows.

#### Disable transparency for fullscreen windows by default
If enabled, entering fullscreen mode will automatically turn off transparency for that window.

#### Show line under title bar when tab bar is not visible
Turn this off for a sleek appearance with the dark theme.

#### Show proxy icon in window title bar
When enabled, an icon representing the current directory is added to the window's title bar. You can drag it.

### Profiles > General
<hr>

#### Name
Gives the name of the profile which is shown in menus, preferences, and the profiles window.

#### Shortcut key
This shortcut can be used to open a new window or tab. By default, it opens a new tab, but if you hold down the option key while pressing the shortcut, a new window will be opened instead.

#### Tags
Tags are a collection of words or phrases that annotate a profile. When you search your profiles (for instance, in the profiles window), the tag names are searched in addition to the profile name. If a tag name contains a slash that defines a hierarchy of menu items in the **Profiles** menu.

#### Badge
The badge is a large label visible in the top right of a terminal session behind its text. For more information see <a href="badges.html">Badges</a>.

#### Command
This is the command that is executed when a new session with the profile is created. If *login shell* is chosen, then `login` is invoked. You can put special terms surrounded by $$ in this field (example: $$USERNAME$$). When a new session is created, you will be prompted to enter a value for each such term. See the description of URL Schemes below for details about the special "$$" value that can go in this field.

#### Send Text at Start
This text will be sent when a session begins. If it is not empty then a newline will be sent afterwards. It does not accept any special characters or require any escaping.

#### Working directory
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

### Profiles > Colors
<hr>
Clicking on any of the color wells opens a color picker that lets you change the setting for the selected color. iTerm2 has a custom color picker. If you don't like it you can revert to the system color picker by clicking the rectangular icon to the right of the eyedropper.

#### Smart cursor color
When selected, a block cursor will be displayed in reverse video. If this would result in confusion, then a different color is chosen that will be most visible given the surrounding cells' background colors.

#### Minimum contrast
If text is displayed against a similar background color, the minimum contrast setting will move the text color towards black or towards white to ensure some minimum level of visibility. Setting this slider all the way to maximum will make all text black and white.

#### Cursor Boost
Cursor Boost dims all colors other than the cursor colors to make the cursor stand out more.

#### Tab Color
If enabled, this color will decorate the tab control. Tabs indicate the color of their current session if there is more than one split pane.

#### Underline Color
If enabled, this color will be used for all underlining, independent of the color that underlined characters have themselves.

#### Cursor Guide
The cursor guide is a horizontal rule that indicates the vertical position of the cursor. You can adjust its color, including alpha value, to make it more visible against your background color.

#### Color Presets...
iTerm2 ships with some color presets, which you may load from this popup menu. You can import and export color presets to files with the extension "itermcolors". There is an online color gallery where users may share color presets, and a link to it is provided in this menu. When importing a color preset, the name it is assigned is based on the filename imported.

### Profiles > Text
<hr>

#### Cursor
This lets you select a cursor shape.

#### Blinking cursor
If checked, the cursor will blink slowly to improve visibility.

#### Draw bold text in bold font
If selected, bold text will be drawn in a bold version of the selected font. If the font does not have a bold version, then a bold appearance is simulated by "double striking" the text: that is, drawing it twice, shifting it one pixel horizontally the second time.

#### Draw bold text in bright colors
If selected, bold text will be drawn in a bright version of its color.

#### Blinking text allowed
If selected, text with the blink attribute set will actually blink. Oh, the humanity.

#### Italic text allowed
If selected, text with the italic attribute set will be rendered in italics. The font you select must have an italic face.

#### Use thin strokes for anti-aliased text
Anti-aliased text will be drawn with thinner strokes by default on Retina displays when the background color is darker than the foreground color. The effect may be more or less visible depending on your particular hardware and OS version. You can configure when thin strokes are used depending on display type and colors.

#### Enable sub-pixel antialiasing (available on macOS 10.14+)
Sub-pixel antialiasing is a technique that enhances the readability of text. It improves the smoothness of curves and seems to make text appear a bit thicker. The benefit is especially visible on non-retina displays. Prior to macOS 10.14, it was on by default and controlled by the system preference named "font smoothing". Beginning with macOS 10.14, it was disabled by default system-wide. iTerm2 offers the option to re-enable it for the iTerm2 app. All text in the app will be affected; no other applications will be changed. Note that turning this feature on incurs a performance penalty. The GPU renderer has to use a more complex blending algorithm and GPU rendering becomes unavailable in concert with transparent windows.

#### Unicode normalization form
This affects how text is processed on input. Most users will want no normalization. HFS+ normalization preserves the fullwidth attribute of composed characters. 

#### Use Unicode Version 9 Widths
Unicode version 9 offers better formatting for Emoji. If your applications have been updated to use these tables, you should enable this setting.

#### Treat ambiguous-width characters as double width
Some characters (e.g., Chinese ideograms) are double-width, and take two cells to display. Other characters (e.g., Latin letters) are single width and take only one cell to display. There is another category of characters known as "ambiguous width". One example of ambiguous-width characters are Greek letters. Depending on your application, you may prefer to display them as double-width or single-width. If most of the text you deal with is double-width, then you should enable this setting as it will help things to line up correctly in that context.

#### Regular font
ASCII text (latin letters, numbers, and some symbols) will be drawn using this font. Select "Anti-aliased" to draw the text with smooth edges.

#### Non-ASCII font
All non-ASCII text (many accented Latin letters, non-Latin text, less-common symbols, and thousands of miscellaneous unicode characters) will be drawn with this font. It is recommended that you use the same point size for both regular and non-ASCII fonts. Select "Anti-aliased" to draw the text with smooth edges.

#### Ligatures
When enabled and you have a font that supports ligatures (such as FiraCode) then text will be rendered with ligatures. This makes drawing much slower, so users on less-than-stellar hardware may not want to enable it.

### Profiles > Window
<hr>

#### Transparency
This sets the transparency of the window background. It can be temporarily disabled with **View > Use Transparency**.

#### Keep background colors opaque
If selected, non-default background colors will be opaque.

#### Blur
If selected, the window background is blurred provided the background has some transparency. Selecting a large radius will blur the background more, but (especially on Retina displays) comes with a performance penalty.

#### Rows/Columns
When creating a new window with this profile, it will be created with this many rows and columns.

#### Hide after opening
If enabled, a window created with this profile will immediately miniaturize after its creation.

#### Open Toolbelt
If enabled, a window created with this profile will feature an open toolbelt.

#### Preserve profile name in tab title
You can specify that profile names are shown in window and tab titles under **Preferences > Appearance > Show Profile Name**. If that is not set, then this option is irrelevant. When in use, a host may send an escape code that changes the window title. This setting causes the profile name to be preserved in that session-set title.

#### Background Image
This allows you to select an image to display behind the terminal's text. If Tile image is selected, then the image will be shown at its actual size and tessellated; otherwise, it will be stretched to fit the whole pane. The blending slider determines how strongly the image dominates over the text's background color.

#### Style
This defines the window style. Bottom- and Top-of-screen windows will disregard the columns setting. Left-of-screen windows will disregard the rows setting. Full-screen windows only respect the rows and columns setting when full-screen mode is exited. The full-width/full-height styles ignore the column or rows setting, respectively, to use all the available space except what is reserved by the system.

#### Screen
If you have more than one screen connected, this lets you select the screen on which a new window should open. It is particularly useful for fullscreen and top-of-screen window styles. The *Screen with Cursor* option affects the initial screen of the window, but it won't follow your cursor from screen to screen.

#### Space
If you have enabled Spaces (or your OS uses Desktops instead of spaces) and have set Spaces/Mission Control to use Control+Number to switch spaces/desktops, then you can use this setting to select the initial space/desktop to open a new window using this profile.

#### Open in a new window, never in a tab
If you ask for a new tab with this profile, it will just open in a window instead. This is for people who hate tabs.

### Profiles > Terminal
<hr>

#### Scrollback lines
The number of lines of scrollback buffer to keep above the visible part of the screen. Unlimited scrollback will allow it to grow indefinitely, possibly using all available memory.

#### Save lines to scrollback when an app status bar is present
Some programs (such as vim or tmux) keep a status bar at the bottom of the screen. For some applications (like vim) it is undesirable to save lines to the scrollback buffer when the application scrolls. For others (like tmux) you may want to save scrolled-off lines into the scrollback buffer. When this setting is enabled, lines scrolled off the top of the screen in the presence of a status bar are added to the scrollback buffer. The screen is considered to have a status bar if it has a scroll region whose top is the first line of the screen and whose bottom is above the bottom of the screen.

#### Save lines to scrollback in alternate screen mode
When in alternate screen mode, lines that scroll off the top of the screen will be saved to the scrollback buffer only if this option is enabled.

#### Character encoding
The encoding to send and receive in. For most people, "Unicode (UTF-8)" is the right choice.

#### Report terminal type
The TERM variable will be set to this value by default. If xterm-256color is selected and your system is missing the terminfo file, you will be prompted to install it when you open a new session.

#### ENQ answer back
Text to send when the ENQ sequence is received. Not normally used.

#### Enable mouse reporting
If selected, applications may choose to receive information about the mouse. This can be temporarily disabled by holding down Option.

#### Enable mouse wheel events
If disabled, the mouse will will always perform its default action (such as scrolling history) rather than being reported to an app that has enabled mouse reporting.

#### Terminal may report window title
Programs running in a terminal may send an escape code to request the current window title. You may disable this feature by enabling this option. It should be disabled if you're communicating with an untrusted party, as there are possible injection attacks.

#### Terminal may set tab/window title
If enabled the terminal may set the window or tab title with an escape sequence.

#### Disable session-initiated printing
If enabled, escape codes that initiate printing will be ignored.

#### Disable save/restore alternate screen
Some programs (such as vim, tmux, and less) switch into a so-called "alternate screen". A characteristic of this behavior is that when these programs terminate the screen's contents are restored to their state from before the program was run. If this option is selected, alternate screen mode is disabled and the screen cannot be restored by an application.

#### Disable session-initiated window resizing
If the host sends an escape code to resize the window, it will be ignored if this option is selected..

#### Silence bell
If selected, the bell (control-G) will not make an audible sound.

#### Send Growl/Notification Center alerts
If selectedinstalled, iTerm2 will post a notifications when sessions receive output, become idle, ring the bell, close, or get a proprietary escape sequence to post a notification. If Growl is installed it is preferred over Notification Center.

#### Filter Alerts
This button opens a panel that lets you customize which notifications will be posted.

#### Flash visual bell
If selected, a bell graphic will be flashed when the bell character is received.

#### Show bell icon in tabs
If selected, tabs will indicate that a bell has rung by displaying a bell graphic.

#### Set locale variables automatically
If enabled, LANG and LC_CTYPE environment variables will be set based on your machine's language settings.

#### Insert newline before start of command prompt if needed
If you have <a href="shell_integration.html">Shell Integration</a> installed and a command's output does not end in a newline, this setting will ensure your prompt does not begin in the middle of the line.

#### Show mark indicators
If you have <a href="shell_integration.html">Shell Integration</a> and this setting is selected then a blue or red arrow appears next to each shell prompt. Turn this off to hide the arrow.

### Profiles > Session
<hr>

#### Automatically close a session when it ends
If selected, a session's pane, tab, or window will automatically close when the session ends.

#### "Undo" can revive a session that has been closed for up to X seconds
When you close a session, window, or tab the shell is not terminated until X seconds pass. While that time period has not elapsed, *Undo* will reopen the session, tab, or window.

#### Prompt before closing
When a session will close, you can choose when to be prompted with a modal alert.

#### Automatically log session input to files in:
If enabled, every session's output will be logged to a file in the specified directory. File names are formatted as Date_Time.ProfileName.TerminalID.ProcessId.RandomNumber.log. You can customize the filename in **Preferences > Advanced > Format for automatic session log filenames**.

#### When idle, send ASCII code X every Y seconds.
If selected, the specified ASCII code "X" (a number from 0 to 255) will be transmitted every Y seconds while nothing is happening. Don't use this unless you know what you're doing as it can have unexpected consequences. Seriously, it's probably not what you want.

#### Avoid repainting while cursor is hidden to reduce flicker while scrolling
When selected, the screen will slightly delay redraws while the cursor is hidden. This improves the visual appearance of scrolling in many programs but might introduce noticeable delays for some users.

### Profiles > Keys
<hr>
This panel shows key mappings. You can double-click on a mapping to edit it. When the "Keyboard Shortcut" field has focus, you should press the keystroke that you want to modify (even if it involves modifiers like Cmd). The following actions are available:

#### Ignore
The keypress will do nothing.

#### Do not remap modifiers
If modifier remapping is in effect (set under **Preferences > Keys**), it can be disabled for certain key combinations. When you choose this action, modifier remapping is temporarily disabled so you can press the key combination unremapped in the key field.

#### Remap modifiers in iTerm2 only
If modifier remapping is in effect (set under **Preferences > Keys**), it can be set to not affect other applications that may listen for global hotkeys. When you choose this action, modifier remapping is temporarily disabled so you can press the key combination unremapped in the key field.

#### Change Profile
This action changes the profile of the current session.

#### Load Color Preset
This action changes the colors of the current session using the specified preset.

#### Split/New Window/Tab with Profile
These actions allow you to create a new session with a specified profile when a key is pressed.

#### Start Instant Replay
This is equivalent to the menu item **View > Start Instant Replay**.

#### Cycle Tabs Forward/Backward
This implements tab switching the same way Cmd-Tab (or Cmd-Shift-Tab) switches windows, with the most-recently-used stack.

#### Next/Previous Tab/Window/Pane
These actions navigate among tabs, windows, and split panes.

#### Move tab left/right
Changes the tab's position in the order.

#### Next/Previous Window
Selects the next or previous window in window order.

#### Next/Previous Pane
Selects the next or previous pane in left-to-right, top-to-bottom order.

#### Increase/Decrease Width/Height
Changes the size of the current session.

#### Scroll to End/Top/Up/Down
These actions move through the scrollback buffer.

#### Select Split Pane Above/Below/Left/Right
These actions navigate split panes.

#### Send ^? / ^H Backspace
Modern systems use ^? for backspace, while some legacy systems use ^H.

#### Send Escape Sequence
This action allows you to enter some text that will be sent when the associated key is pressed. First, the ESC character is sent, and then the text you entered is sent. There are no special characters and no escaping is necessary.

#### Send Hex Code
This action allows you to enter a sequence of hex codes that will be sent. Each value should begin with "0x" followed by one or two hex digits (0-9, a-f, or A-F). Each code should be separated by a space. You can see a list of hex codes on http://asciitable.com/ in the "Hx" column.

#### Send Text
This action allows you to enter a text string that will be sent when the associated key is pressed. The following escape characters are supported: \n (newline), \e (escape), \a (bell), \t (tab).

#### Send Text with "vim" Special Characters
This action allows you to enter a text string that will be sent when the associated key is pressed. The following special sequences are supported, where the "." characters are placeholders: \... (three-digit octal number), \.. (two-digit octal number; must be followed by non-digit), \. (one-digit octal number; must be followed by non-digit), \x.. (two-digit hex number), \x. (one-digit hex number), \u.... (four-digit hex number), \b (backspace), \e (escape), \f (form feed), \n (newline), \r (carriage return), \t (tab), \\ (backslash), \" (double quote), \\\<C-.> (control key), \\\<M-.> (meta key)

#### Find Regular Expression
Performs a search for a saved regular expression.

#### Find Again Up/Down
Repeats the search, finding the next result at an earlier/later position.

#### Undo
Invokes the Undo action. Could be used to undo closing a session/tab/window.

#### Paste (from selection)
Same as **Edit > Paste and Edit > Paste Special > Paste Selection**.

#### Toggle Fullscreen
This action enters or exits full screen mode.

#### Toggle Pin Hotkey Window
Toggles whether the hotkey window hides when it loses focus.

#### Run Coprocess
This action launches a Coprocess. <a href="documentation-coprocesses.html">Learn more about coprocesses</a>.

#### Move Start/End of Selection Back/Forward
Adjusts the range of selected text.

#### Select Menu Item...
This action allows you to enter the name of an iTerm2 menu item. It must be entered exactly the same as it appears in the menu. Ellipses can be typed with option-semicolon.

<hr/>

You can add a new keymapping by pressing "+". You can remove an existing mapping by selecting it and pressing "-". Three presets are provided: "Xterm defaults" is the normal key mappings, while "Xterm defaults with numeric keypad" disables the "application keypad" in favor of the numbers and symbols that the numeric keypad typically emits. "Terminal.app Compatibility" tries to emulate the way that Terminal.app sends keys by default.

#### Delete sends ^H
If you are on a legacy system that does not accept ^? for backspace, select this and it will add a key mapping for you.

#### Allow Application Keypad Mode
Some full-screen progarms (like emacs) switch the keyboard into application keypad mode, which changes how the numeric keypad behaves. Disabling this option causes iTerm2 to never enter application keypad mode.

#### Left/Right Option Key Acts As
It is common to use a modifier to send so-called "meta keys". For most users, selecting "+Esc" here is the right choice. The "Meta" option sets the high bit of the input character, and is not compatible with modern systems.

#### A hotkey opens a dedicated window with this profile
When enabled, a dedicated hotkey window is attached to this profile. The **Configure Hotkey Window** button lets you configure the hotkey and other attributes of the window. For more information, see <a href="documentation-hotkey.md">Hotkey Windows</a>.

### Profiles > Advanced
<hr>

#### Triggers
Triggers are actions that are performed when text matching a regular expression is received. Each trigger has a regular expression, which defines when it runs. It has an action, which defines what it performs, and it has an optional parameter, whose meaning depends on the action. When the parameter is textual, \0 is replaced with the entire match, and \1...\9 are replaced with match groups. Each trigger has a checkbox in the "Instant" column. Instant triggers run as soon as text matching the regular expression is matched; triggers that are not instant only match after the cursor moves off the current line (such as whena newline is received).

Full details can be found at <a href="documentation-triggers.html">Triggers</a>.

#### Semantic History
Semantic history is used to open a file when you Cmd-Click on it. The current working directory for each line in the terminal is tracked to help find files. If Semantic History is set to "Open with default app," then files are passed to the OS to be opened with whatever is associated. Alternatively, you can choose "Open URL..." to open a specific URL (with \1 replaced with the filename and \2 replaced with the line number, if applicable). If you choose "Open with editor..." then text files will be opened with the designated editor, while other files are opened with the default app for their file type. For more flexibility, choose "Run command..." and specify a command to execute. \1 will be replaced with the file name, \2 will be replaced with the line number (if applicable), \3 with text in the line prior to the click location, \4 with text in the line subsequent to the click location, and \5 for the working directory of the line clicked on. Finally, "Always run command..." is like "Run command...," but takes effect even if the object clicked on is not an existing filename.

#### Automatic Profile Switching
You can specify rules that, when satisified, changes any session's profile to this one. See <a href="automatic-profile-switching.html">Automatic Profile Switching</a> for all the details.
</p>

### Keys
<hr>

#### Remap modifier keys
iTerm2 allows you to change the meanings of the modifier keys only within iTerm2. This is useful, for example, if you find it difficult to press "option" for "meta" and would prefer to use "command" for that purpose.

#### To switch tabs
Tabs are normally navigated with cmd+number, but you can change the modifier used for that function here.

#### To switch windows
Windows are normally navigated with cmd+opt+number, but you can change the modifier used for that function here.

#### Show/Hide iTerm2 all windows with a system-wide hotkey
When enabled, you can focus the Hotkey: field and press a keystroke. From then on, pressing that keystroke (even when iTerm2 is not the front application) will cause iTerm2 to come to the front. If it is the foreground app, it will be sent to the back. This requires that you enable access for assistive devices in the Universal Access panel of System Preferences. For more information, see <a href="documentation-hotkey.md">Hotkey Windows</a>.

#### Create a Dedicated Hotkey WIndow
Sets up a new hotkey window profile if you don't already have one. For more information, see <a href="documentation-hotkey.md">Hotkey Windows</a>.

#### Add Touch Bar Item
This button is only visible if your OS version supports touch bars. By pressing this button, you can define a new custom touch bar button with any of the actions you can assign to a key (see below). You can then add the custom button to your touch bar with **View > Customize Touch Bar**.

#### Global shortcut keys
This interface works like the keyboard shortcut system in profiles (described above) but it affects all profiles. Settings here are overridden by those in a profile's key mappings.

### Arrangements
<hr>
This tab lets you view saved window arrangements. You can delete them with the minus button and select the default arrangement.

### Pointer
<hr>

#### Mouse Button and Trackpad Gesture Actions
You may assign custom actions to mouse clicks and trackpad gestures. The left mouse button is not configurable because its behavior is rather complex, however. This is especially useful if you have a mouse with many buttons. Any combination of mouse button + number of clicks + modifiers may be assigned an action. For gestures, three finger taps and swipes may be configured in combination with modifiers. The following actions are available:

#### Extend selection
The text selection will grow, either from its beginning or end, to the location of the pointer.

#### Move pane
The current pane will turn green. Click in another window's tab bar or in another pane to split to move the now-green pane.

#### New Horizontal/Vertical split with profile
The pane under the pointer will be split and the new split will use the specified profile.

#### New Split/Tab/Window With Profile
A new split pane/tab/window will be opened with the specified profile.

#### Next/Previous Tab/Window
Navigates through tabs and windows.

#### Open Context Menu
Opens the menu normally opened by a right click.

#### Open URL in background
Opens the URL under the pointer in your web browser without bringing the browser to the foreground.

#### Open URL/Semantic History
Opens the URL under the pointer, bringing the web browser to the foreground. If what's under the cursor is a filename on the local machine, it will be opened with Semantic History.

#### Paste from Clipboard
This is identical to **Edit > Paste**.

#### Paste from Selection
Pastes the most recent selection made in iTerm2, even if it's not what's in the pasteboard.

#### Quicklook
Defines the word under the cursor or, if it's a URL, opens it in a web browser popover.

#### Select Next/Previous Pane
Navigates panes according to how recently they were used.

#### Select pane Above/Below/Left/Right
Navigates panes by their layout.

#### Send Escape Sequence...
This action allows you to enter some text that will be sent when the associated key is pressed. First, the ESC character is sent, and then the text you entered is sent.

#### Send Hex Code
This action allows you to enter a sequence of hex codes that will be sent. Each value should begin with "0x" followed by one or two hex digits (0-9, a-f, or A-F). Each code should be separated by a space. You can see a list of hex codes on http://asciitable.com/ in the "Hx" column.

#### Send Text
This action allows you to enter a text string that will be sent when the associated key is pressed. The following escape characters are supported: \n (newline), \e (escape), \a (bell), \t (tab).

#### Smart Selection
Performs smart selection on the text under the pointer.

#### Smart Selection ignoring Newlines
Performs smart selection on the text under the pointer, ignoring newlines (e.g., if a URL is split by a hard newline, it can still be selected as a single item).

<hr/>

#### Cmd-Click Opens Filename/URL
If enabled, then clicking on a filename (of an existing file on the local machine) or a URL will open it.

#### Ctrl-click reported to apps, does not open menu
If enabled, ctrl-click will be sent to applications that support Xterm mouse reporting (if mouse reporting is enabled).

#### Option-Click moves cursor
If enabled, option-click will move the cursor to where the mouse pointer is. If you install shell integration, this will be well-behaved at the shell prompt by not sending up and down arrow keys.

#### Focus follows mouse
If enabled, moving the mouse over an inactive window will cause it to receive keyboard focus.

#### Double-click performs smart selection
If enabled, double click performs smart selection instead of word selection as is standard on macOS.

#### Triple-click selects full wrapped lines
If enabled, a triple click selects a whole line, even if it was longer than one row in the terminal. If off, then triple click selects exactly one row.

#### Three-finger tap reports middle click to apps
If enabled, a three-finger tap acts like a middle click for the purposes of mouse reporting.
<hr>

