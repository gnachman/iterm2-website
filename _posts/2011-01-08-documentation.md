# Menu Items
### iTerm &gt; Secure Keyboard Entry
When this is enabled, the operating system will prevent other programs running on your computer from being able to see what you are typing. If you're concerned that untrusted programs might try to steal your passwords, you can turn this on, but it may disable global hotkeys in other programs.

### Shell &gt; Split Vertically/Horizontally
These menu items allow you to divide a tab into two or more split panes. The panes can be adjusted by dragging the line that divides them.

### Shell &gt; Send Input to All Sessions
When this is enabled, keybard input will be sent to all tabs in the current window. Other windows are not affected.

### Shell &gt; Log &gt; Start/Stop
Logging saves all input received in a session to a file on disk.

### Edit &gt; Paste Special &gt; Paste Escaping Special Characters
"Paste Escaping Special Characters" pastes the current string in the clipboard, but places a backslash before spaces and backslashes.

### Edit &gt; Paste Slowly
"Paste Slowly" pastes the current string in the clipboard, but it doesn't send the whole string at once. It is sent in batches of 16 bytes with a 125ms delay between batches. These values can be tweaked with hidden settings. For example:

<pre>
    defaults write com.googlecode.iterm2 SlowPasteBytesPerCall -int 16
    defaults write com.googlecode.iterm2 SlowPasteDelayBetweenCalls -float 0.125
</pre>

### Edit &gt; Open Paste History...
"Open Paste History" opens a window showing up to the last 20 values that were copied or pasted in iTerm2. You can search its contents by typing a (non-necessarily-consecutive) subsequence of characters that appear in the value. You can use arrow keys and enter to make a selection, or you can click on an item to choose it, and it will be pasted. If you enable the <b>Save copy/pate history to disk</b> preference then these values will persist across sessions of iTerm2.

### Edit &gt; Special Characters...
"Special Characters" opens a window that facilitates entering any unicode character.

### View &gt; Use Transparency
This toggles transparency. It only has an effect if you have configured your session to be transparent under Preferences &gt; Profiles &gt; Window &gt; Transparency. When Full Screen mode is entered, transparency is turned off by default, but you can select this menu item to re-enable it.

### View &gt; Edit Current Session
This opens a window that lets you change the settings of the current session without affecting any other sessions. Once this has been done, changes to the profile will not affect this session.

### View &gt; Step Back/Forward in Time
Stepping through time allows you to see what was on the screen at a previous time. This is different than going back through the scrollback buffer, as interactive programs sometimes overwrite the screen contents without having them scroll back. Once in this mode, you can use the left and right arrow keys to step back and forward, respectively. The "esc" key exits this mode, as does clicking the close button in the bar that appears on the bottom. You can adjust the amount of memory dedicated to this feature in Preferences &gt; Instant Replay uses <b>xx</b> MB per session. The more memory you assign, the further back in time you can step.

### Profiles &gt; Open Profiles...
This opens the "Profiles Window" which allows you to create new windows, tabs, or panes from one or more profiles. You can perform a search by entering text in the search field. Profile names and tags are searched, and the listed profiles are filtered as you type. You can use the up and down arrow keys to make a selection. Pressing enter will open a new tab, while shift-enter will open a new window. You can make multiple selections by holding down shift or cmd and clicking on profiles. The "New Tabs in New Window" button is enabled only when more than one profile is selected: it will open a new window and create a new tab for each profile selected.

### Window &gt; Exposé All Tabs
All iTerm2 tabs will be shown tiled on the main screen. You can mouse over a tab to see it larger, and clicking on it will restore the windows and select that tab and bring its window to the front. You can search the contents of all tabs by typing in the search field that appears on the left. Making a selection from the results below it will highlight the tab that contains that text. This is useful when you have many tabs open and can't find the one you're looking for.

### Window &gt; Save/Restore Window Arrangement
The current state and positions of windows, tabs, and spit panes is recorded and saved to disk with Save Window Arrangement. Restore Window Arrangement opens a new collection of windows having the saved state. You can automatically restore the arrangement in Preferences &gt; General &gt; Open saved window arrangement.

<hr>
# Preferences
## General
### Open profiles window
If selected, the Profiles Window will automatically open when iTerm2 is started.

### Open saved window arrangement
If selected, the saved window arrangement will be restored when iTerm2 starts. This is diabled if you haven't yet saved a window arrangement with Window &gt; Save Window Arrangement.

### Quit when all windows are closed
If selected, iTerm2 will automatically quit when its last terminal window is closed.

### Confirm commands that close a session
If selected, commands such as "Shell &gt; Close" will require confirmation via an alert box before being executed.

### Only when multiple sessions close
If selected, commands that close one session will not be confirmed, but commands that close multiple sessions (such as clicking the red button on a window with two or more tabs) will be confirmed with an alert box.

### Confirm Quit iTerm2 Command
If selected, the Quit iTerm2 (cmd-Q) command will be confirmed if any terminal windows are open.

### Smart window placement
If enabled, new windows will be opened where they least overlap existing windows.

### Green button zooms vertically only
If selected, the green "Zoom" button expands a terminal window vertically but does not affect its width. This can be overriden by holding down shift while clicking the zoom button.

### Instant Replay Uses X MB per Session
This setting specifies the maximum amount of memory allocated to instant replay for each tab or split pane. More memory means instant replay is able to go farther back into the past. You can enter instant replay with View &gt; Step Back in Time.

### Save copy/paste history to disk
If selected, every time text is copied or pasted in iTerm2 it will be saved to disk. The last 20 values are recorded. They can be accessed with Edit &gt; Open Paste History....

### Copy to clipboard on selection
If selected, text is copied to the clipboard immediately upon selection. If not selected, you must select Edit &gt; Copy to copy it.

### Focus follows mouse
If selected, moving the mouse over an inactive window will cause it to receive keyboard focus.

### Middle button pastes from clipboard
If selected, clicking the mouse's middle button will paste. Otherwise, it may be reported to the application if Xterm mouse reporting is on and the application supports it.

### Report ctrl-click to apps instead of opening menu
If selected, ctrl-click will be sent to applications that support Xterm mouse reporting (if mouse reporting is enabled).

### Characters considered part of a word for selection
When you double-click in the terminal window, a "word" is selected. A word is defined as a string delimited by characters of a different class. The classes of characters are whitespace, word characters, and non-word characters. The characters in this field define the set of non-word characters.

### Add bonjour hosts to profiles
If selected, all bonjour hosts on the local network have a profile created for them as long as they're around.

### Check for updates automatically
If enabled, iTerm2 will periodically check if a new version of iTerm2 exists, and if so it will prompt you to download and upgrade.

### Prompt for test releases
If enabled, iTerm2 will periodically check if a new unstable version of iTerm2 exists, and if so it will prompt you to download and upgrade.

## Appearance

### Tab Style
Select from a list of tab looks.

### Tab Position
Defines whether tabs appear at the top or bottom of a window.

### Hide tab bar when there is only one tab
If selected, the tab bar will become invisible when a window contains exactly one tab.

### Color tab labels on activity
If selected, tab labels become purple when a non-selected tab has new output, and red when a non-selected tab has output you haven't seen but that is not very recent.

### Hide tab number and tab close button
If selected, only the tab name appears in a tab.

### Tabs show in fullscreen mode when cmd is held down for a period of time
When in fullscreen mode, holding down the cmd key will cause the tab bar to show. This setting allows you to specify how long cmd must be held down before the tab bar is shown.

### Hide scrollbar and resize control
If selected, the scrollbar and resize control will not be visible.

### Dim inactive split panes
If selected, split panes that do not have keybaord focus will be slightly dimmed.

### Show border around window
If selected, a 1-pixel border will be shown around the edges of terminal windows.

### Show window number
If selected, window titles include the window number. You can navigate to a window by pressing cmd-opt-N where N is the window number.

### Show current job name
If selected, tab and window titles will show the name of the foreground job.

### Show profile name
If selected, tab and window titles will show profile names.

## Profiles &gt; General

### Name
Gives the name of the profile which is shown in menus, preferences, and the profiles window.

### Shortcut
This shortcut can be used to open a new window or tab. By default, it opens a new tab, but if you hold down the option key while pressing the shortcut, a new window will be opened in stead.

### Tags
Tags are a collection of words or phrases that annotate a profile. When you search your profiles (for instance, in the profiles window), the tag names are searched in addition to the profile name.

### Command
This is the command that is executed when a new session with ths profile is created. If login shell is chosen, then your shell is run with '-' as the first character of argv[0].

### Working directory
Normally, new sessions begin in your home directory. You can choose to open new sessions in the same directory as the current session (but only when creating a new tab), or you can specify a starting directory.

### URL Schemes
You can configure a profile to handle a URL scheme, such as ssh. When a hyperlink is clicked on with that scheme, a new tab is opened with the selected bookmark. It is recommended that you set the command to "$$", in which case an ssh command line will be auto-generated.

## Profiles &gt; Colors
Clicking on any of the color wells opens a color picker that lets you change the setting for the selected color.

### Smart cursor color
When selected, a block cursor will be displayed in reverse video. If this would result in confusion, then a different color is chosen that will be most visible given the surrounding cells' background colors.

### Minimum contrast
If text is displayed against a similar background color, the minimum contrast setting will move the text color towards black or towards white to ensure some minimum level of visibility. Setting this slider all the way to maximum will make all text black and white.

### Load Presets
iTerm2 ships with some color presets, which you may load from this popup menu. You can import and export color presets to files with the extension "itermcolors". There is an online color gallery where users may share color presets, and a link to it is provided in this menu. When importing a color preset, the name it is assigned is based on the filename imported.

## Profiles &gt; Text
### Cursor
This lets you select a cursor shape.

### Blinking cursor
If checked, the cursor will blink slowly to improve visibility.

### Draw bold text in bold font
If selected, bold text will be drawn in a bold version of the selected font. If the font does not have a bold version, then a bold appearance is simluated by "double striking" the text: that is, drawing it twice, shifting it one pixel horizontally the second time.

### Draw bold text in bright colors
If selected, bold text will be drawn in a bright version of its color.

### Regular font
ASCII text (latin letters, numbers, and some symbols) will be drawn using this font. Select "Anti-aliased" to draw the text with smooth edges.

### Non-ASCII font
All non-ASCII text (many accented Latin letters, non-Latin text, less-common symbols, and thousands of miscellaneous unicode characters) will be drawn with this font. It is recommended that you use the same point size for both regular and non-ASCII fonts. Select "Anti-alised" to draw the text with smooth edges.

### Treat ambiguous-width characters as double width
Some characters (e.g., Chinese ideograms) are double-width, and take two cells to display. Other characters (e.g., Latin letters) are single width and take only one cell to display. There is another category of characters known as "ambiguous width". One example of ambiguous-width characters are Greek letters. Depending on your application, you may prefer to display them as double-width or single-width. If most of the text you deal with is double-width, then you should enable this setting as it will help things to line up correctly in that context.

## Profiles &gt; Window

### Rows/Columns
When creating a new window with this profile, it will be created with this many rows and columns.

### Style
This defines the window style. Top-of-screen windows will disregard the columns settting, while full-screen windows only respect the rows and columns setting when full-screen mode is exited.

### Screen
If you have more than one screen connected, this lets you select the screen on which a new window should open. It is particularly useful for fullscreen and top-of-screen window styles.

### Space
If you have enabled Spaces and have set Spaces to use Control+Number to switch spaces, then you can use this setting to select the initial space to open a new window using this profile.

### Transparency
This sets the transparency of the window background. It can be temporarily disabled with View &gt; Use Transparency.

### Blur
If selected, the window background is blurred provided the background has some transparency.

### Background Image
This allows you to select an image to display behind the terminal's text.

### Server-set tab title preserve profile name (if shown)
You can specify that profile names are shown in window and tab titles under Preferences &gt; Appearance &gt; Show Profile Name. If that is not set, then this option is irrelevant. When in use, a host may send an escape code that changes the window title. This setting causes the profile name to be preserved in that session-set title.

### Disable session-initiated window resizing
If the host sends an escape code to resize the window, it will be ignored if this option is selected..

## Profiles &gt; Keys
This panel shows key mappings. You can double-click on a mapping to edit it. When the "Keyboard Shortcut" field has focus, you should press the keystroke that you want to modifiy (even if it involves modifiers like Cmd). The following actions are available:

### ignore
The keypress will do nothing.

### Do not remap modifiers
If modifier remapping is in effect (set under Preferences &gt; Keys), it can be disabled for certain key combinations. When you choose this action, modifier remapping is temporarily disabled so you can press the key combination unremapped in the key field.

### Remap modifiers in iTerm2 only
If modifier remapping is in effect (set under Preferences &gt; Keys), it can be set to not affect other applications that may listen for global hotkeys. When you choose this action, modifier remapping is temporarily disabled so you can press the key combination unremapped in the key field.

### Split/New Window/Tab with Profile
These actions allow you to create a new session with a specified profile when a key is pressed.

### Backward in Time/Forward in Time
This is equivalent to the menu item View &gt; Step Backward/Forward in Time

### Next/Previous Tab/Window
These actions navigate among tabs and windows.

### Scroll to End/Top/Up/Down
These actions move through the scrollback buffer.

### Select Split Pane Above/Below/Left/Right
These actions navigate split panes.

### Send ^? / ^H Backspace
Modern systems use ^? for backspace, while some legacy systems use ^H.

### Send Escape Sequence
This action allows you to enter some text that will be sent when the associated key is pressed. First, the ESC character is sent, and then the text you entered is sent.

### Send Hex Code
This action allows you to enter a sequence of hex codes that will be sent. Each value should begin with "0x" followed by one or two hex digits (0-9, a-f, or A-F). Each code should be separated by a space. You can see a list of hex codes on http://asciitable.com/ in the "Hx" column.

### Send Text
This action allows you to enter a text string that will be sent when the associated key is pressed.

### Toggle Fullscreen
This action enters or exits full screen mode.

### Select Menu Item...
This action allows you to enter the name of an iTerm2 menu item. It must be entered exactly the same as it appears in the menu. Ellipses can be typed with option-semicolon.

You can add a new keymapping by pressing "+". You can remove an existing mapping by selecting it and pressing "-". Two presets are provided: "Xterm defaults" is the normal key mappings, while "Xterm defaults with numeric keypad" disables the "application keypad" in favor of the numbers and symbols that the numeric keypad typically emits.

### Left/Right Option Key Acts As
It is common to use a modifier to send so-called "meta keys". For most users, selecting "+Esc" here is the right choice. The "Meta" option sets the high bit of the input character, and is not compatible with modern systems.

### Delete sends ^H
If you are on a legacy system that does not accept ^? for backspace, select this and it will add a key mapping for you.

## Keys
### Remap modifier keys
iTerm2 allows you to change the meanings of the modifier keys only within iTerm2. This is useful, for example, if you find it difficult to press "option" for "meta" and would prefer to use "command" for that purpose.

### To switch tabs
Tabs are normally navigated with cmd+number, but you can change the modifier used for that function here.

### To switch windows
Windows are normally navigated with cmd+opt+number, but you can change the modifier used for that function here.

### Show/Hide iTerm2 with a system-wide hotkey
When enabled, you can focus the Hotkey: field and press a keystroke. From then on, pressing that keystroke (even when iTerm2 is not the front application) will cause iTerm2 to come to the front. If it is the foreground app, it will be sent to the back. This requires that you enable access for assitive devices in the Universal Access panel of System Preferences.

### Hotkey toggles a dedicated window with profile
If enabled, the hotkey set above will toggle a single window with a specific profile. This provides an always-available terminal.

### Global shortcut keys
This interface works like the keyboard shortcut system in profiles (described above) but it affects all profiles. Settings here are overridden by those in a profile's key mappings.

<hr>
## Hidden Settings

There are a few settings that you cannot access via iTerm2's own Preferences
panel. However, you can use 'defaults" command to change them to your taste.

The first four are for setting the tab size:

<pre>
    defaults write com.googlecode.iterm2 UseUnevenTabs -bool false
    defaults write com.googlecode.iterm2 MinTabWidth -int 75
    defaults write com.googlecode.iterm2 MinCompactTabWidth -int 60
    defaults write com.googlecode.iterm2 OptimumTabWidth -int 175
</pre>

The last one is for the search command launched from the contextual menu.
The default is to use google. You can set it to anything you want.

<pre>
    defaults write com.googlecode.iterm2 SearchCommand \
            -string "http://google.com/search?q=%@"
</pre>

For example, if you like Yahoo, here is the command:

<pre>
    defaults write com.googlecode.iterm2 SearchCommand \
            -string "http://search.yahoo.com/search?p=%@"
</pre>

## AppleScript

### Example Script

iTerm2 has sophisticated Applescript support allowing one to write stand-alone
scripts to launch the application and open multiple sessions from the
addressbook into either new tabs or new windows. You can also set some other
parameters for a session such as foreground and background colors, and
transparency. Here is a sample script:

    -- A sample iTerm2 Applescript

    tell application "iTerm"
      activate

      -- close the first session
      terminate the first session of the first terminal

      -- make a new terminal
      set myterm to (make new terminal)

      -- talk to the new terminal
      tell myterm

        -- set size
        set number of columns to 100
        set number of rows to 50
        -- make a new session
        set mysession to (make new session at the end of sessions)

        -- talk to the session
        tell mysession

          -- set some attributes
          set name to "tcsh"
          set foreground color to "red"
          set background color to "blue"
          set transparency to "0.6"

          -- execute a command
          exec command "/bin/tcsh"

        end tell -- we are done talking to the session

        -- we are back to talking to the terminal

        -- launch a default shell in a new tab in the same terminal
        launch session "Default Session"

        -- launch a saved session from the addressbook.
        launch session "Root Shell"
        -- select the previous session
        select mysession
        -- get the tty name of a session
        set myttyname to the tty of the first session
        -- refer to a session by its tty/id
        tell session id myttyname
            set foreground color to "yellow"
        end tell

      end tell

      -- talk to the first terminal
      tell the first terminal

        -- launch a default shell in a new tab in the same terminal
        launch session "Default Session"

        tell the last session

          -- write some text
          write text "cd Projects/Cocoa/iTerm2"
          -- write the contents of a file
          write contents of file "/path/to/file/"

        end tell

      end tell

      -- reposition window and name it
      set the bounds of the first window to {100, 100, 700, 700}
      set the name of the first window to "A Window Title"


    end tell

These scripts can then be saved as stand-alone executable applications.

### Autolanching Scripts

iTerm2 also supports autolaunching of an Applescript on startup. On startup,
iTerm2 looks for an Applescript called `AutoLaunch.scpt` under
`~/Library/Application Support/iTerm2`. If it is found, the `AutoLauch.scpt`
is launched and executed. This feature can be used to launch multiple
sessions in defined windows and tabs when iTerm2 starts up.

### User-Defined Scripts

iTerm2 also supports launching of user defined scripts from the "Scripts"
menu. The scripts need to be stored under the
`~/Library/Application Support/iTerm/Scripts` directory. You can create
this directory if it does not already exist. iTerm2 checks this directory
on startup.

## Interesting Links

Here are some links to some iTerm2-related websites.

* [Applescripts for executing a command and connecting to a remote server](http://homepage.mac.com/denao/scripts/)
  by Denis A.V. Jr.
* [Applescript for opening a session](http://damonparker.org/blog/2005/09/14/iterm-tricks/)
  by Damon Parker
* [A Growl trick](http://damonparker.org/blog/2006/11/13/iterm-and-growl/)
  by Damon Parker
* [A collection of iTerm Shell Customizations for bash, zsh and tcsh](http://xanana.ucsc.edu/xtal/iterm_tab_customization.html)
  from William G. Scott
* [Use iTerm with OnMyCommand](http://www.macosxhints.com/article.php?story=20030609222910699)
  from macosxhints
* [Open current directory in iTerm](http://www.bigbold.com/snippets/tag/iTerm)
* [iTerm plugin](http://docs.blacktree.com/quicksilver/plug-ins/iterm?DokuWiki=)
  for Quicksilver.
* [iTerm Here](http://www.tco.net/~dscott/software/itermhere/)
* [WidgetTerm](http://widgetterm.sourceforge.net/):
  A mini terminal in your dash board.

## Fonts

While iTerm2 does not require monospaced fonts, they look much better than proportionately spaced fonts. Here are some recommended fonts:

* VT100 Comes with OS X, rather ugly though
* Lucide Console Comes with Office v.X
* SImPL A very nice font made by Phil Chastney. Download from
  [here](http://www.vector.org.uk/resource/simpl02.zip)
* APL385 Another font from Dyalog.NET. Get it from
  [here](http://www.vector.org.uk/resource/apl385.zip)
* FreeMono A nice font made available by Free UCS Outline Fonts project. It
  is bundled with iTerm.app starting from version 0.70. Visit their
  [website](http://www.nongnu.org/freefont/).
* Wen Ding Chinese fonts A set of simplified and traditional Chinese fonts.
  Download from [here](http://www.arphic.net/tw/service/resource_cont.asp?id=1&toppage=2).
  Thanks to Miyang Lin for providing us information.

One **non**-recommended font is Consolas. It has an improperly set baseline offset and
appears too high. It can be fixed, though; please see this page on
[how to fix Consolas baseline](http://mbauman.net/geek/2009/03/15/minor-truetype-font-editing-on-a-mac/).

## UTF-8 patch for tcsh 6.12.00

By Yuichi Ohkawa.

The tcsh pre-installed in Mac OS X has many problems dealing with UTF-8. If
you input mult-bytes characters to tcsh, this patch may help you to edit the characters.

Download from [here](ftp://ftp.tba.org.tohoku.ac.jp/pub/tcsh-6.12-utf8.patch.gz)

## Tips for using zsh with iTerm2

Provided by Marius Wyx.

There are people with hints on ways to customize the title bar and tabs, a
much simpler way when using zsh is to do the following:


    precmd () {
      echo -n "\033]1;$USERNAME@$HOST^G\033]2;$PWD>    - $USERNAME@$HOST
      ($status)^G"
    }
    PROMPT='%m %B%3c%(#.#.>)%b '
    RPROMPT=''

(NOTE: `^G` is CTRL-G, you need to enter it using `^V^G`)

Much simpler and does not require anything special. (apart from zsh)

Also in zsh, the command line completion I have expanded to be
`/Applications/` aware:


    if [ "`uname`" = "Darwin" ]; then
       compctl -f -x 'p[2]' -s "`/bin/ls -d1 /Applications/*/*.app
    /Applications/*.app | sed 's|^.*/\([^/]*\)\.app.*|\\1|;s/ /\\\\ /g'`"
    -- open
       alias run='open -a'
    fi

typing: "open -a " and then pressing tab will try and complete any
application... (added an alias run as well)
