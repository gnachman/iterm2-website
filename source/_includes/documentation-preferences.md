### General
<hr>
#### Open profiles window
If selected, the Profiles Window will automatically open when iTerm2 is started.
#### Open default window arrangement
If selected, the default saved window arrangement will be restored when iTerm2 starts. This is disabled if you haven't yet saved a window arrangement with Window > Save Window Arrangement. If you'd like iTerm2 to open without any windows, create an empty default window arrangement and turn this option on.
#### Quit when all windows are closed
If selected, iTerm2 will automatically quit when its last terminal window is closed.
#### Confirm closing multiple sessions
If selected, commands that close one session will not be confirmed, but commands that close multiple sessions (such as clicking the red button on a window with two or more tabs) will be confirmed with an alert box.
#### Confirm Quit iTerm2 Command
If selected, the Quit iTerm2 (cmd-Q) command will be confirmed if any terminal windows are open.
#### Only when multiple sessions close
If selected, commands that close one session will not be confirmed, but commands that close multiple sessions (such as clicking the red button on a window with two or more tabs) will be confirmed with an alert box.
#### Confirm Quit iTerm2 Command
If selected, the Quit iTerm2 (cmd-Q) command will be confirmed if any terminal windows are open.
#### Instant Replay Uses X MB per Session
This setting specifies the maximum amount of memory allocated to instant replay for each tab or split pane. More memory means instant replay is able to go farther back into the past. You can enter instant replay with View > Step Back in Time.
#### Save copy/paste history to disk
If selected, every time text is copied or pasted in iTerm2 it will be saved to disk. The last 20 values are recorded. They can be accessed with Edit > Open Paste History....
#### Add bonjour hosts to profiles
If selected, all bonjour hosts on the local network have a profile created for them as long as they're around.
#### Check for updates automatically
If enabled, iTerm2 will periodically check if a new version of iTerm2 exists, and if so it will prompt you to download and upgrade.
#### Prompt for test-release updates
If enabled, iTerm2 will periodically check if a new unstable version of iTerm2 exists, and if so it will prompt you to download and upgrade.
#### Load preferences from a custom folder or URL:
If enabled, iTerm2 will load its preferences from the specified folder or URL. After setting this, you'll be prompted when you quit iTerm2 if you'd like to save changes to the folder.
#### Copy to clipboard on selection
If enabled, text is copied to the clipboard immediately upon selection. If not selected, you must select Edit > Copy to copy it.
#### Copied text includes trailing newline
If enabled, a terminal newline will be copied to the pasteboard when the selection includes one; otherwise, no selection will ever include a terminal newline.
#### Allow clipboard access to terminal apps
If enabled, clipboard access will be granted via escape code to programs running in iTerm2. They will be able to retreive and set the contents of the system pasteboard.
#### Characters considered part of a word for selection
When you double-click in the terminal window, a "word" is selected. A word is defined as a string delimited by characters of a different class. The classes of characters are whitespace, word characters, and non-word characters. The characters in this field define the set of non-word characters.
#### Smart window placement
If enabled, new windows will be opened where they least overlap existing windows.
#### Adjust window when changing font size
If enabled, a change to a session's font will cause the window to grow or shrink.
#### Zoom button maximizes vertically only
If enabled, the green "Zoom" button expands a terminal window vertically but does not affect its width. This can be overridden by holding down shift while clicking the zoom button.
#### Closing hotkey window restores focus to last window, but may switch spaces.
If enabled, the act of closing a hotkey window will restore focus to the window that last had it. As a side effect, the current desktop/space may change.
#### Use Lion-style Fullscreen windows
If enabled, fullscreen windows will animate into a special desktop, as is typical in OS X 10.7 and later. If disabled, fullscreen windows will instantly go fullscreen without changing desktops.
#### When attaching, open unrecognized windows in...
When attaching to a new tmux session with the tmux integration, tmux windows not seen by iTerm2 before will open in either new windows or tabs, as specified by this preference.
#### Open dashboard if there are more than...tmux windows
When attaching to a tmux session with the tmux integration, windows are normally opened automaticaly. If there are too many of them, then the tmux dashboard is opened instead.
#### Automatically hide the tmux client session after connecting
When the tmux integration is entered by running tmux -CC, the window in which that command was run will miniaturize into the dock if this option is enabled.
<hr>
### Appearance
<hr>
#### Tab Style
Select from a list of tab looks.
#### Tab Position
Defines whether tabs appear at the top or bottom of a window.
#### Hide tab bar when there is only one tab
If selected, the tab bar will become invisible when a window contains exactly one tab.
#### Color tab labels on activity
If selected, tab labels become purple when a non-selected tab has new output, and red when a non-selected tab has output you haven't seen but that is not very recent.
#### Hide tab number and tab close button
If selected, only the tab name appears in a tab.
#### Hide tab activity indicator
If selected, the progress indicator in each tab will not be displayed.
#### Show tabs in fullscreen by holding cmd for
When in fullscreen mode, holding down the cmd key will cause the tab bar to show. This setting allows you to specify how long cmd must be held down before the tab bar is shown.
#### Show per-pane title bar with split panes
When a tab has split panes, this option controls whether each split pane will have its own title bar.
#### Auto-hide menu bar in non-Lion fullscreen
When Lion-style fullscreen is disabled, this option is in effect. If you'd like the menu bar to remain visible when a fullscreen window is present on a screen with a menu bar, turn this on.
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
#### Animate dimming
If enabled, window dimming effects are animated.
#### Show border around window
If selected, a 1-pixel border will be shown around the edges of terminal windows.
#### Hide scrollbar and resize control
If selected, the scrollbar and resize control (for OS 10.5 and 10.6) will not be visible.
#### Disable transparency for fullscreen windows by default
If enabled, entering fullscreen mode will automatically turn off transparency for that window.
<hr>
### Profiles > General
<hr>
#### Name
Gives the name of the profile which is shown in menus, preferences, and the profiles window.
#### Shortcut key
This shortcut can be used to open a new window or tab. By default, it opens a new tab, but if you hold down the option key while pressing the shortcut, a new window will be opened instead.
#### Tags
Tags are a collection of words or phrases that annotate a profile. When you search your profiles (for instance, in the profiles window), the tag names are searched in addition to the profile name.
#### Command
This is the command that is executed when a new session with the profile is created. If login shell is chosen, then your shell is run with '-' as the first character of argv[0]. You can put special terms surrounded by $$ in this field (example: $$USERNAME$$). When a new session is created, you will be prompted to enter a value for each such term. See the description of URL Schemes below for details about the special "$$" value that can go in this field.
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
<hr>
### Profiles > Colors
<hr>
Clicking on any of the color wells opens a color picker that lets you change the setting for the selected color.
#### Smart cursor color
When selected, a block cursor will be displayed in reverse video. If this would result in confusion, then a different color is chosen that will be most visible given the surrounding cells' background colors.
#### Minimum contrast
If text is displayed against a similar background color, the minimum contrast setting will move the text color towards black or towards white to ensure some minimum level of visibility. Setting this slider all the way to maximum will make all text black and white.
#### Load Presets
iTerm2 ships with some color presets, which you may load from this popup menu. You can import and export color presets to files with the extension "itermcolors". There is an online color gallery where users may share color presets, and a link to it is provided in this menu. When importing a color preset, the name it is assigned is based on the filename imported.
<hr>
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
#### Regular font
ASCII text (latin letters, numbers, and some symbols) will be drawn using this font. Select "Anti-aliased" to draw the text with smooth edges.
#### Non-ASCII font
All non-ASCII text (many accented Latin letters, non-Latin text, less-common symbols, and thousands of miscellaneous unicode characters) will be drawn with this font. It is recommended that you use the same point size for both regular and non-ASCII fonts. Select "Anti-aliased" to draw the text with smooth edges.
#### Treat ambiguous-width characters as double width
Some characters (e.g., Chinese ideograms) are double-width, and take two cells to display. Other characters (e.g., Latin letters) are single width and take only one cell to display. There is another category of characters known as "ambiguous width". One example of ambiguous-width characters are Greek letters. Depending on your application, you may prefer to display them as double-width or single-width. If most of the text you deal with is double-width, then you should enable this setting as it will help things to line up correctly in that context.
<hr>
### Profiles > Window
<hr>
#### Transparency
This sets the transparency of the window background. It can be temporarily disabled with View > Use Transparency.
#### Blur
If selected, the window background is blurred provided the background has some transparency. Selecting a large radius will blur the background more, but (especially on Retina displays) comes with a performance penalty.
#### Rows/Columns
When creating a new window with this profile, it will be created with this many rows and columns.
#### Background Image
This allows you to select an image to display behind the terminal's text. If Tile image is selected, then the image will be shown at its actual size and tesselated; otherwise, it will be stretched to fit the whole pane. The blending slider determines how strongly the image dominates over the text's background color.
#### Style
This defines the window style. Bottom- and Top-of-screen windows will disregard the columns setting. Left-of-screen windows will disregard the rows setting. Full-screen windows only respect the rows and columns setting when full-screen mode is exited.
#### Screen
If you have more than one screen connected, this lets you select the screen on which a new window should open. It is particularly useful for fullscreen and top-of-screen window styles.
#### Space
If you have enabled Spaces (or your OS uses Desktops instead of spaces) and have set Spaces/Mission Control to use Control+Number to switch spaces/desktops, then you can use this setting to select the initial space/desktop to open a new window using this profile.
#### If showing profile name in tab title, keep it when the title is changed
You can specify that profile names are shown in window and tab titles under Preferences > Appearance > Show Profile Name. If that is not set, then this option is irrelevant. When in use, a host may send an escape code that changes the window title. This setting causes the profile name to be preserved in that session-set title.
#### Disable session-initiated window resizing
If the host sends an escape code to resize the window, it will be ignored if this option is selected..
<hr>
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
#### Enable xterm mouse reporting
If selected, applications may choose to receive information about the mouse. This can be temporarily disabled by holding down Option.
#### Allow terminal to report window title
Programs running in a terminal may send an escape code to request the current window title. You may disable this feature by enabling this option. It should be disabled if you're communicating with an untrusted party, as there are possible injection attacks.
#### Use modern parser (experimental)
iTerm2 includes an experimental parser for CSI codes that should produce more correct results, but it isn't tested enough to be on by default. Enable this option to use it.
#### Disable session-initiated printing
If enabled, escape codes that initiate printing will be ignored.
#### Disable save/restore alternate screen
Some programs (such as vim, tmux, and less) switch into a so-called "alternate screen". A characteristic of this behavior is that when these programs terminate the screen's contents are restored to their state from before the program was run. If this option is selected, alternate screen mode is disabled and the screen cannot be restored by an application.
#### Silence bell
If selected, the bell (control-G) will not make an audible sound.
#### Enable Growl notifications
If selected and Growl is installed, iTerm2 will post a Growl notification when sessions receive output, become idle, ring the bell, or close.
#### Flash visual bell
If selected, a bell graphic will be flashed when the bell character is received.
#### Show bell icon in tabs
If selected, tabs will indicate that a bell has rung by displaying a bell graphic.
#### Set locale variables automatically
If enabled, LANG and LC_CTYPE ennvironment variables will be set based on your machine's language settings.
<hr>
### Profiles > Session
<hr>
#### Automatically close a session when it ends
If selected, a session's pane, tab, or window will automatically close when the session ends.
#### Prompt before closing
When a session will close, you can choose when to be prompted with a modal alert.
#### Automatically log session input to files in:
If enabled, every session's output will be logged to a file in the specified directory. File names are formatted as Date_Time.ProfileName.TerminalID.ProcessId.RandomNumber.log.
#### When idle, send ASCII code
If selected, the specified ASCII code will be transmitted every 30 seconds while nothing is happening. Don't use this unless you know what you're doing as it can have unexpected consequences.
<hr>
### Profiles > Keys
<hr>
This panel shows key mappings. You can double-click on a mapping to edit it. When the "Keyboard Shortcut" field has focus, you should press the keystroke that you want to modify (even if it involves modifiers like Cmd). The following actions are available:
#### Ignore
The keypress will do nothing.
#### Do not remap modifiers
If modifier remapping is in effect (set under Preferences > Keys), it can be disabled for certain key combinations. When you choose this action, modifier remapping is temporarily disabled so you can press the key combination unremapped in the key field.
#### Remap modifiers in iTerm2 only
If modifier remapping is in effect (set under Preferences > Keys), it can be set to not affect other applications that may listen for global hotkeys. When you choose this action, modifier remapping is temporarily disabled so you can press the key combination unremapped in the key field.
#### Split/New Window/Tab with Profile
These actions allow you to create a new session with a specified profile when a key is pressed.
#### Backward in Time/Forward in Time
This is equivalent to the menu item View > Step Backward/Forward in Time
#### Cycle Tabs Forward
This implements tab switching the same way Cmd-Tab switches windows, with the most-recently-used stack.
#### Next/Previous Tab/Window
These actions navigate among tabs and windows.
#### Move tab left/right
Changes the tab's position in the order.
#### Scroll to End/Top/Up/Down
These actions move through the scrollback buffer.
#### Select Split Pane Above/Below/Left/Right
These actions navigate split panes.
#### Send ^? / ^H Backspace
Modern systems use ^? for backspace, while some legacy systems use ^H.
#### Send Escape Sequence
This action allows you to enter some text that will be sent when the associated key is pressed. First, the ESC character is sent, and then the text you entered is sent.
#### Send Hex Code
This action allows you to enter a sequence of hex codes that will be sent. Each value should begin with "0x" followed by one or two hex digits (0-9, a-f, or A-F). Each code should be separated by a space. You can see a list of hex codes on http://asciitable.com/ in the "Hx" column.
#### Send Text
This action allows you to enter a text string that will be sent when the associated key is pressed. The following escape characters are supported: \n (newline), \e (escape), \a (bell), \t (tab).
#### Toggle Fullscreen
This action enters or exits full screen mode.
#### Run Coprocess
This action launches a Coprocess. <a href="documentation-coprocesses.html">Learn more about coprocesses</a>.
#### Select Menu Item...
This action allows you to enter the name of an iTerm2 menu item. It must be entered exactly the same as it appears in the menu. Ellipses can be typed with option-semicolon.

You can add a new keymapping by pressing "+". You can remove an existing mapping by selecting it and pressing "-". Three presets are provided: "Xterm defaults" is the normal key mappings, while "Xterm defaults with numeric keypad" disables the "application keypad" in favor of the numbers and symbols that the numeric keypad typically emits. "Terminal.app Compatability" tries to emulate the way that Terminal.app sends keys by default.
#### Left/Right Option Key Acts As
It is common to use a modifier to send so-called "meta keys". For most users, selecting "+Esc" here is the right choice. The "Meta" option sets the high bit of the input character, and is not compatible with modern systems.
#### Delete sends ^H
If you are on a legacy system that does not accept ^? for backspace, select this and it will add a key mapping for you.
<hr>
### Profiles > Advanced
<hr>
#### Triggers
Triggers are actions that are performed when text matching a regular expression is received. Each trigger has a regular expression, which defines when it runs. It has an action, which defines what it performs, and it has an optional parameter, whose meaning depends on the action. When the parameter is textual, \0 is replaced with the entire match, and \1...\9 are replaced with match groups.
#### Action: Bounce Dock Icon
This action causes the dock icon to bounce when text matching the trigger is received. The dock icon only bounces if iTerm2 is in the background.
#### Action: Highlight Text
The text matching the regex in the trigger will change color. The parameter sets the color.
#### Action: Ring Bell
The system bell rings when text matching the trigger is received.
#### Action: Run Command
When text matching the trigger is received, a command is executed. Its output is dropped. The parameter gives the command to run.
#### Action: Run Coprocess
When text matching the trigger is received, a coprocess is started. The parameter gives a command to run as the coprocess.
#### Action: Run Silent Coprocess
When text matching the trigger is received, a silent coprocess is started. A silent coprocess differs from a regular coprocess in that input goes only to the coprocess and not to the terminal display. This is useful, for example, for ZModem transfers. The parameter gives a command to run as the coprocess.
#### Action: Send Growl Alert
When text matching the trigger is received, a growl alert is posted with the text inthe parameter.
#### Action: Send Text
When text matching the trigger is received, text in the parameter is written to the terminal.
#### Action: Show Alert
When text matching the trigger is received, a modal alert is shown with text in the parameter.
#### Smart Selection
Smart selection allows you to define a set of regular expressions, each with an assigned priority, that are used for making the best possible selection. By default, a quad-click invokes smart selection. Smart selection is described in full in the Smart Selection document.
#### Semantic History
Semantic history is used to open a file when you Cmd-Click on it. The current working directory for each line in the terminal is tracked to help find files. If Semantic History is set to "Open with default app," then files are passed to the OS to be opened with whatever is associated. Alternatively, you can choose "Open URL..." to open a specific URL (with \1 replaced with the filename and \2 replaced with the line number, if applicable). If you choose "Open with editor..." then text files will be opened with the designated editor, while other files are opened with the default app for their file type. For more flexibility, choose "Run command..." and specify a command to execute. \1 will be replaced with the file name, \2 will be replaced with the line number (if applicable), \3 with text in the line prior to the click location, \4 with text in the line subsequent to the click location, and \5 for the working directory of the line clicked on. Finally, "Always run command..." is like "Run command...," but takes effect even if the object clicked on is not an existing filename.
</p>		
<hr>
### Keys
<hr>
#### Remap modifier keys
iTerm2 allows you to change the meanings of the modifier keys only within iTerm2. This is useful, for example, if you find it difficult to press "option" for "meta" and would prefer to use "command" for that purpose.
#### To switch tabs
Tabs are normally navigated with cmd+number, but you can change the modifier used for that function here.
#### To switch windows
Windows are normally navigated with cmd+opt+number, but you can change the modifier used for that function here.
#### Show/Hide iTerm2 with a system-wide hotkey
When enabled, you can focus the Hotkey: field and press a keystroke. From then on, pressing that keystroke (even when iTerm2 is not the front application) will cause iTerm2 to come to the front. If it is the foreground app, it will be sent to the back. This requires that you enable access for assistive devices in the Universal Access panel of System Preferences.
#### Hotkey toggles a dedicated window with profile
If enabled, the hotkey set above will toggle a single window with a specific profile. This provides an always-available terminal.
#### Global shortcut keys
This interface works like the keyboard shortcut system in profiles (described above) but it affects all profiles. Settings here are overridden by those in a profile's key mappings.
<hr>
### Pointer
<hr>
#### Mouse Button and Trackpad Gesture Actions
You may assign custo actions to mouse clicks and trackpad gestures. The left mouse button is not configurable because its behavior is rather complex, however. This is especially useful if you have a mouse with many buttons. Any combination of mouse button + number of clicks + modifiers may be assigned an action. For gestures, three finger taps and swipes may be configured in combination with modifiers. The following actions are available:
#### Extend selection
The text selection will grow, either from its beginning or end, to the location of the pointer.
#### Move pane
The current pane will turn green. Click in another window's tab bar or in another pane to split to move the now-green pane.
#### New Horizontal/Vertical split with profile
The pane under the pointer will be split and the new split will use the specified profile.
#### New Window With Profile
A new window will be opened with the specified profile.
#### Next/Previous Tab/Window
Navigates through tabs and windows.
#### Open Context Menu
Opens the menu normally opened by a right click.
#### Open URL in background
Opens the URL under the pointer in your web browser without bringing the browser to the foreground.
#### Open URL/Semantic History
Opens the URL under the pointer, bringing the web browser to the foreground. If what's under the cursor is a filename on the local machine, it will be opened with Semantic History.
#### Paste from Clipboard
This is identical to Edit > Paste.
#### Paste from Selection
Pastes the most recent selection made in iTerm2, even if it's not what's in the pasteboard.
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
#### Focus follows mouse
If enabled, moving the mouse over an inactive window will cause it to receive keyboard focus.
#### Cmd-Click Opens Filename/URL
If enabled, then clicking on a filename (of an existing file on the local machine) or a URL will open it.
#### Report ctrl-click to apps instead of opening menu
If enabled, ctrl-click will be sent to applications that support Xterm mouse reporting (if mouse reporting is enabled).
#### Three-finger tap reports middle click to apps
If enabled, a three-finger tap acts like a middle click for the purposes of mouse reporting.
#### Triple-click selects full wrapped lines
If enabled, a triple click selects a whole line, even if it was longer than one row in the terminal. If off, then triple click selects exactly one row.
#### Middle button pastes from clipboard
If enabled, clicking the mouse's middle button will paste. Otherwise, it may be reported to the application if Xterm mouse reporting is on and the application supports it.
<hr>
### Arrangements
<hr>
This tab lets you view saved window arrangements. You can delete them with the minus button and select the default arrangement.
