# Documentation
iTerm2 should require little explanation for users accustomed to terminal emulators. Even if you are an experienced user, take the time to read through the <a href="#/section/documentation/highlights">highlights</a> section of this document. It will familiarize you with some features of iTerm2 that you may not have seen in other terminal emulators that can make a real difference in the way you work.

## Table of Contents
<ul>
  <li><a href="#/section/documentation/general">General Usage</a></li>
  <li><a href="#/section/documentation/highlights">Highlights for New Users</a></li>
  <li><a href="#/section/documentation/menu_items">Menu Items</a></li>
  <li><a href="#/section/documentation/preferences">Preferences</a></li>
  <li><a href="#/section/documentation/hidden_settings">Hidden Settings</a></li>
  <li><a href="#/section/documentation/scripting">Scripting</a></li>
  <li><a href="#/section/documentation/fonts">Fonts</a></li>
  <li><a href="#/section/documentation/escape_codes">Proprietary Escape Codes</a></li>
</ul>

<br/>
<a name="/section/documentation/general"> </a>
## General Usage
<hr/>

#### Tabs

When you first start iTerm2, a window opens showing a terminal session. If you want to open more that one session at a time, you have a few options: You can create a new window (Shell &gt; New Window), you can create a new tab (Shell &gt; New Tab), or you can split the current session into two panes (Shell  &gt; Split Horizontally, Shell &gt; Split Vertically), each of which is a separate session.

Tabs in iTerm2 behave like tabs in other programs, most notably web browsers like Safari, Firefox, and Google Chrome. Note that you can drag and drop tabs to reorder them within a window. You can drag tabs from one window to another, and you can drag a tab from a window into a new window by dropping it outside any iTerm2 window's tab bar.

By default, the label of each tab is the name of the job that's running in that session. Some systems are configured to augment this with additional information such as the hostname you're logged in to or your current directory (this is done by sending a special code of <code>ESC]0;string ^G</code>).

Tab labels are colored to indicate their status. When new output is received in a tab other than the currently selected tab, its label changes color to magenta. After a few seconds it becomes red to indicate not-so-fresh output. When a tab's session terminates, the label turns gray. You can disable this coloring in Preferences &gt; Appearance &gt; Color tab labels on activity.

<br/>
<br/>
#### Toolbar

The toolbar provides quick access to some commonly used features.

* The <i>New</i> button allows you to open a new tab. If you have configured multiple profiles, it allows you to select one from a list.
* The <i>Info</i> button allows you to change the appearance of the current session.
* The <i>Close</i> button closes the current session, and may close the current window if it was the only session.
* The <i>Execute</i> field lets you to type in a command locally before sending it to the terminal. You can also type in a URL (including the scheme, such as <i>http://</i>), in which case the URL will be opened by the appropriate application. If you press TAB key instead of Enter after you type in the command, a new tab will be launched with your command. 

<br/>
<br/>
#### Info Panel

Info Panel lets you modify the apperance of a single session. Note that after you open this panel, your changes will not be reflected in the profile and profile changes will not be reflected in this session. 

<br/>
<br/>
#### Pointer

The primary use of the pointer in iTerm2 is to select text, and (by default) text is copied to the clipboard immediately upon being selected. You can click and drag to perform a normal selection. Double-clicking selects a whole word. Triple-clicking selects an entire line. Quadruple-clicking performs a "smart select", matching recognized strings such as URLs and email addresses.

If you hold shift while clicking the existing selection is extended.

If you hold cmd and click on a URL it will be opened. If you hold cmd and click on a filename, it will be opened if it exists. There is special support for Macvim, Textmate, and BBEdit when you cmd-click on a text file's name: if it is followed by a colon and line number, the file will be opened at that line number. The current directory is tracked if you have your shell prompt set the window title, <a href="http://www.faqs.org/docs/Linux-mini/Xterm-Title.html#toc4">as described here</a>. 

If you hold cmd you can drag and drop selected text.

If you hold cmd and option while selecting, a rectangular selection will be made.

If mouse reporting is enabled (in Preferences &gt; Profile &gt; Terminal) and the currently running terminal application is using it, pressing option will temporarily disable it so you can make a selection.

If you hold the control key and click, that simulates a right click. If you'd prefer to send this combination to applications using mouse reporting, check "Report ctrl-click to apps instead of opening menu" in Preferences &gt; General.

Moving the mouse's scroll wheel scrolls up and down.

A three-finger swipe left or right on a trackpad (if configured to "navigate") will select an adjacent tab.

<br/>
<br/>
#### Keyboard

Every aspect of the keyboard can be configured in iTerm2. These keystrokes may be useful to remember:

 * Cmd+left arrow, Cmd+right arrow navigates among tabs. So does Cmd-{ and Cmd-}.
 * Cmd+number navigates directly to a tab.
 * Cmd+Option+Number navigates directly to a window.
 + Cmd+Option+Arrow keys navigate among split panes.
 * Cmd+] and Cmd+[ navigates among split panes in order of use.

You can configure any key combination to perform any action in two places: in Preferences &gt; Keys, you can define global key shortcuts that affect all profiles. In Preferences &gt; Profiles &gt; Keys, you can define key shortcuts that affect only a single profile.

You can remap modifiers like Option and Cmd within iTerm2. Some users find that pressing Option frequently is uncomfortable, and configure iTerm2 to swap the function of the Option and Cmd keys. This is done in Preferences &gt; Keys under Remap Modifier Keys. If there is some key combination that you don't want to be affected by this change (such as Cmd-tab) add a new global shortcut key with the action Do Not Remap.

iTerm2 allows you to define a global hotkey. This is a single keystroke that iTerm2 listens for even when another application has keyboard focus. When it is pressed, iTerm2 comes to the front. Press it again, and iTerm2 goes away. You can choose to bind the hotkey to a single dedicated window. This feature is similar to other programs like Visor, Guake, and Yakuake.

<br/>
<br/>
#### Context menus

By right-clicking in a session a context menu opens. You can use it to open a new session, perform various actions on selected text, or access frequently used features to affect the clicked-on session.

<br/>
<br/>
#### Profiles

Many settings are stored in <i>profiles</i>. A profile is a named collection of settings, and you can have as many of them as you like. Most users only have one profile, but if you find that you often connect to different servers, they may be useful for you. A key feature of a profile is that you can associate a command with it that is run when it begins. For instance, if you often ssh to a particular host, you could create a profile with the command "ssh example.com" to automate that process.

<br/>
<br/>
<br/>
<a name="/section/documentation/highlights">
</a>
## Highlights for New Users
<hr />

iTerm2 has many features that will change the way you interact with your terminal. This section outlines them briefly.
<br/>
<br/>

#### Text Selection
There are two ways to select text to copy to the clipboard: you can use the mouse, or you can use the find feature's "mouseless copy" feature. Text selection by mouse is described above in <a href="#/section/documentation/general">General Usage</a> section.

To select text without using the mouse, press cmd-f to open the find field. Enter the beginning fo the text you wish to copy and the find feature will select it in your window. Then press tab and the end of the selection will advance by a word. To advance the beginning of the selection to the left, press shift-tab. At most one line of text can be selected this way

<br/>
<br/>
#### Split Panes
iTerm2 allows you to divide a tab into many rectangular "panes", each of which is a different terminal session. The shortcuts cmd-d and cmd-shift-d divide an existing session vertically or horizontally, respectively. You can navigate among split panes with cmd-opt-<i>arrow</i> or cmd-[ and cmd-]. You can "maximize" the current pane--hiding all others in that tab--with cmd-shift-enter. Pressing the shortcut again restores the hidden panes.

<br/>
<br/>
#### Hotkey Window
iTerm2 offers a special terminal window that is always available with a single keystroke. This window is called the "hotkey window" and is most commonly used for occasional administrative tasks. To enable this feature, go to Preferences &gt; Keys. Enable "Show/Hide iTerm2 with a system-wide hotkey". Click in the field and enter the key combination you'd like to use. Then check "hotkey toggles a dedicated window with profile:". A new profile will be created that is optimized for the feature. Pressing the hotkey will drop a terminal window down from the top of the screen, and pressing it again (or clicking in any other window) causes it to disappear.

<br/>
<br/>
#### Swap Cmd and Option
iTerm2 allows you to remap modifiers. You have separate control over left and right command and option keys. One common need is to exchange cmd and option. To do this, go to Preferences &gt; Keys. Set Left option key to Left command key and Left command key to Left option key (and do the same for Right command and Right option if you please). You can add exceptions if you don't want certain combinations to be remapped (for example, cmd-tab) by adding a new global shortcut with the action "Do Not Remap" and the keystroke of the (unremapped) key you wish to keep unaffected by modifier remapping.

<br/>
<br/>
#### Save Mark/Jump to Mark
You can mark a location in a session with cmd-shift-M and then jump back to it with cmd-shift-J. This is useful, for instance, if you suspend your editor to compile a program and it emits errors. You can save a mark at that point and then return to your editor to fix the errors. As you work, you can jump back to the compilation errors with cmd-shift-J.

<br/>
<br/>
#### Regular Expression Search
When you open the find field (cmd-f) there is a down-arrow on the left of the field by the magnifying glass. Clicking it opens a menu of options in which you can enable regular expression search. The [ICU syntax](http://userguide.icu-project.org/strings/regexp#TOC-Regular-Expression-Metacharacters) is used.

<br/>
<br/>
<a name="/section/documentation/autocomplete"></a>
#### Autocomplete
Any text that exists in a tab or its scrollback buffer can be autocompleted in that tab. To use autocomplete, type the beginning of a word and then press cmd-;. An autocomplete window opens showing the top 20 choices for words beginning what what you have entered. The list can be filtered by typing a subsequence. The filter can be reset by pressing backspace. If you make a selection and press return, it will be entered for you. If you make a selection and press tab, your autocomplete will be extended with the selection.

<br/>
<br/>
#### Paste History
Whenever text is copied or pasted in iTerm2 it is added to the paste history. You can access paste history with cmd-shift-H. It can be filtered by typing a subsequence, and the filter can be cleared by pressing backspace. You can choose to have your paste history saved to disk by turning that option on under Preferences &gt; General &gt; Save copy/paste history to disk.

<br/>
<br/>
#### Instant Replay
Sometimes interactive programs will overwrite something of interest on the screen (for example, top(1) does this all the time). Normally, this would be lost forever. With Instant Replay, you can step back in time to see exactly what was on your screen at some point in the recent past. To enable, press cmd-opt-B. Once you are in instant replay mode, you can use the left and right arrow keys to navigate back and forward through time. Esc exits instant replay mode. By default, each session uses up to 4MB to save its instant replay history, and this can be adjusted under Preferences &gt; General &gt; Instant Replay uses __ MB per session.

Another benefit of Instant Replay is that it shows you the exact time that something appeared on your screen down to the second. This is useful when trying to figure out when an error occurred, for example.

<br/>
<br/>
#### Full Screen
You can press cmd-enter and iTerm2 will take up the entire screen. If you had a transparent background configured, it will be turned off upon entering full screen mode to reduce distractions. You can re-enable it with cmd-U.

<br/>
<br/>
#### 256 Color Mode
iTerm2 supports 256 color mode. To enable this for csh shells, set your terminal to xterm-256color (under Preferences &gt; Profiles &gt; Terminal &gt; Report Terminal Type). Some applications may need to be configured to support this mode. In vim, add this to your .vimrc:

<pre>
set t_Co=256
</pre>

<br/>
<br/>
#### Focus Follows Mouse
This option is off by default, but can be enabled under Preferences &gt; General &gt; Focus follows mouse. It only affects iTerm2 windows.

<br/>
<br/>
#### Middle Button Paste
If you have a three-button mouse, by default the middle button performs "paste".

<br/>
<br/>
#### Smart Cursor Color
When using a block cursor, it's hard to pick a cursor color that's visible against every background color. If you enable Smart cursor color (under Preferences &gt; Profiles &gt; Colors) then the cursor color will be dynamically chosen to be visible against the text it is over and the adjacent cells. 

<br/>
<br/>
#### Minimum Contrast
Sometimes an application will display text with a color combination that is hard to read. Colorblind users in particular may find certain combinations hard to see if the colors differ only in hue and not brightness. If you enable minimum contrast (under Preferences &gt; Profiles &gt; Colors &gt; Minimum contrast, then iTerm2 will guarantee a minimum level of brightness difference between the foreground and background color of every character. If you set this to its maximum value, then all text will be black or white.

<br/>
<br/>
#### Growl Support
If you enable Growl (Preferences &gt; Profiles &gt; Terminal &gt; Enable Growl Notifications) and you have [Growl](http://growl.info/) installed then you'll receive messages when a terminal beeps, has output after a period of silence, or terminates.

<br/>
<br/>
#### Exposé Tabs
If you have too many tabs and are unable to find the one you're looking for, you can use the Exposé Tabs feature to find it. Press cmd-opt-E and all your tabs will be shown at once. You can then perform a search over all tabs simultaneously to find what you're looking for.

<br/>
<br/>
#### Window Arrangements
You can take a snapshot of your open windows, tabs, and panes with the menu option Window &gt; Save Window Arrangement. You can restore this configuration with Window &gt; Restore Window Arrangement, or you can choose to have it automatically restored when you start iTerm2 with Preferences &gt; General &gt; Open saved window arrangement.

<br/>
<br/>
#### Smart Selection
Performing a quad-click does a "smart selection," which selects text under the pointer in a way appropriate to its content. For example, URLs, quoted strings, and email addresses (among many other objects) are recognized and selected in their entirety.

<br/>
<br/>
#### Triggers
Triggers are user-configurable regular expressions with associated actions that run when text is received that matches the regex. Actions include highlighting the matching text, showing an alert, sending text back, and more.

<br/>
<br/>
#### Tmux Integration
iTerm2 is tightly integrated with tmux. The integration allows you to see tmux windows as native iTerm2 windows or tabs. The tmux prefix key is not needed, as native menu commands operate on tmux windows. For more information, please see the <a href="https://code.google.com/p/iterm2/wiki/TmuxIntegration">iTerm2-tmux Integration</a> document.

<br/>
<br/>
#### Coprocesses
Coprocesses are programs that run alongside iTerm2 and are bound to a single session. All output bound for the session is also routed as input to the coprocess. The coprocess's output acts like the user typing at the keyboard. Coprocesses can be used to automate tasks. For more information, see the <a href="http://www.iterm2.com/coprocesses.html#/section/home">Coprocess</a> document.

<br/>
<br/>
<a name="/section/documentation/menu_items">
</a>
## Menu Items
<hr/>
<br/><br/>
#### iTerm &gt; Secure Keyboard Entry
When this is enabled, the operating system will prevent other programs running on your computer from being able to see what you are typing. If you're concerned that untrusted programs might try to steal your passwords, you can turn this on, but it may disable global hotkeys in other programs.

<br/><br/>
#### Shell &gt; New Tab with Current Profile
This creates a new tab using the same profile as the current session rather than the default profile.

#### Shell &gt; New Window/Tab
This creates a new window or tab with the default profile. If the current session is a tmux integration session, then the new window or tab will be a tmux window.

#### Shell &gt; Split Vertically/Horizontally
These menu items allow you to divide a tab into two or more split panes. The panes can be adjusted by dragging the line that divides them. They will use the default profile.

#### Shell &gt; Split Vertically/Horizontally with Current Profile
These menu items allow you to divide a tab into two or more split panes. The panes can be adjusted by dragging the line that divides them. They will use the profile of the current session.

#### Shell &gt; Broadcast Input &gt; ...
These options allow you to send keyboard input to more than one session.

#### Shell &gt; Run/Stop Coprocess
Allows you to start and stop a coprocess linked to the current session. <a href="http://www.iterm2.com/coprocesses.html#/section/home">Learn more about coprocesses.</a>

#### Shell &gt; tmux &gt; ...
These commands let you interact with the tmux integration. The tmux dashboard is a view that lets you see all your tmux sessions and windows at a glance, adjust which are visible, rename them, and change the current tmux session.

#### Shell &gt; Log &gt; Start/Stop
Logging saves all input received in a session to a file on disk.

<br/><br/>
#### Edit &gt; Paste Special &gt; Paste Escaping Special Characters
"Paste Escaping Special Characters" pastes the current string in the clipboard, but places a backslash before spaces and backslashes.

#### Edit &gt; Paste Slowly
"Paste Slowly" pastes the current string in the clipboard, but it doesn't send the whole string at once. It is sent in batches of 16 bytes with a 125ms delay between batches. These values can be tweaked with hidden settings. For example:

<pre>
    defaults write com.googlecode.iterm2 SlowPasteBytesPerCall -int 16
    defaults write com.googlecode.iterm2 SlowPasteDelayBetweenCalls -float 0.125
</pre>

#### Edit &gt; Open Paste History...
"Open Paste History" opens a window showing up to the last 20 values that were copied or pasted in iTerm2. You can search its contents by typing a (non-necessarily-consecutive) subsequence of characters that appear in the value. You can use arrow keys and enter to make a selection, or you can click on an item to choose it, and it will be pasted. If you enable the <b>Save copy/pate history to disk</b> preference then these values will persist across sessions of iTerm2.

#### Edit &gt; Open Autocomplete...
Shows the autocomplete window, which offers to finish typing a word that you've begun. <a href="#/section/documentation/autocomplete">Learn more about autocomplete.</a>

#### Edit &gt; Set Mark
Records the current scroll position. Use Edit &gt; Jump to Mark to restore the scroll position.

<br/><br/>
#### View &gt; Show Tabs in Fullscreen
If enabled, tabs are shown in fullscreen windows.

#### View &gt; Use Transparency
This toggles transparency. It only has an effect if you have configured your session to be transparent under Preferences &gt; Profiles &gt; Window &gt; Transparency. When Full Screen mode is entered, transparency is turned off by default, but you can select this menu item to re-enable it.

#### View &gt; Find Cursor
Reveals the current cursor position.

#### View &gt; Maximize Active Pane
When there are split panes present, this toggles whether a given pane expands to fill the tab. When a maximized pane is present, the tab will be inscribed with a dotted outline.

#### View &gt; Edit Current Session
This opens a window that lets you change the settings of the current session without affecting any other sessions. Once this has been done, changes to the profile will not affect this session.

#### View &gt; Step Back/Forward in Time
Stepping through time allows you to see what was on the screen at a previous time. This is different than going back through the scrollback buffer, as interactive programs sometimes overwrite the screen contents without having them scroll back. Once in this mode, you can use the left and right arrow keys to step back and forward, respectively. The "esc" key exits this mode, as does clicking the close button in the bar that appears on the bottom. You can adjust the amount of memory dedicated to this feature in Preferences &gt; Instant Replay uses <b>xx</b> MB per session. The more memory you assign, the further back in time you can step.

#### View &gt; Tab Color
Allows you to select a tint color for the tab, to make it easier to distinguish.

<br/><br/>
#### Profiles &gt; Open Profiles...
This opens the "Profiles Window" which allows you to create new windows, tabs, or panes from one or more profiles. You can perform a search by entering text in the search field. Profile names and tags are searched, and the listed profiles are filtered as you type. You can use the up and down arrow keys to make a selection. Pressing enter will open a new tab, while shift-enter will open a new window. You can make multiple selections by holding down shift or cmd and clicking on profiles. The "New Tabs in New Window" button is enabled only when more than one profile is selected: it will open a new window and create a new tab for each profile selected.

<br/><br/>
#### Toolbelt &gt; Show Toolbelt
This toggles the visibility of the Toolbelt on the right side of all windows.

#### Toolbelt &gt; Jobs
This toggles the visibility of the Jobs tool, which shows the running jobs in the current session, and allows you to send them signals.

#### Toolbelt &gt; Notes
This toggles the visibility of the Notes tool, which provides a freeform scratchpad in the toolbelt.

#### Toolbelt &gt; Paste History
This toggles the visibility of the Paste History tool, which shows recently pasted strings in the toolbelt.

#### Toolbelt &gt; Profiles
This toggles the visibility of the Profiles tool, which lets you select profiles to open new windows, tabs, and split panes.

<br/><br/>
#### Window &gt; Exposé All Tabs
All iTerm2 tabs will be shown tiled on the main screen. You can mouse over a tab to see it larger, and clicking on it will restore the windows and select that tab and bring its window to the front. You can search the contents of all tabs by typing in the search field that appears on the left. Making a selection from the results below it will highlight the tab that contains that text. This is useful when you have many tabs open and can't find the one you're looking for.

#### Window &gt; Save/Restore Window Arrangement
The current state and positions of windows, tabs, and spit panes is recorded and saved to disk with Save Window Arrangement. Restore Window Arrangement opens a new collection of windows having the saved state. You can automatically restore the arrangement in Preferences &gt; General &gt; Open saved window arrangement.

<a name="/section/documentation/preferences">
</a>
## Preferences
<hr>
<br/>
### General
<br/>
#### Open profiles window
If selected, the Profiles Window will automatically open when iTerm2 is started.

<br/>
#### Open default window arrangement
If selected, the default saved window arrangement will be restored when iTerm2 starts. This is disabled if you haven't yet saved a window arrangement with Window &gt; Save Window Arrangement. If you'd like iTerm2 to open without any windows, create an empty default window arrangement and turn this option on.

<br/>
#### Quit when all windows are closed
If selected, iTerm2 will automatically quit when its last terminal window is closed.

<br/>
#### Confirm closing multiple sessions
If selected, commands that close one session will not be confirmed, but commands that close multiple sessions (such as clicking the red button on a window with two or more tabs) will be confirmed with an alert box.

<br/>
#### Confirm Quit iTerm2 Command
If selected, the Quit iTerm2 (cmd-Q) command will be confirmed if any terminal windows are open.

<br/>
#### Instant Replay Uses X MB per Session
This setting specifies the maximum amount of memory allocated to instant replay for each tab or split pane. More memory means instant replay is able to go farther back into the past. You can enter instant replay with View &gt; Step Back in Time.

<br/>
#### Save copy/paste history to disk
If selected, every time text is copied or pasted in iTerm2 it will be saved to disk. The last 20 values are recorded. They can be accessed with Edit &gt; Open Paste History....

<br/>
#### Add bonjour hosts to profiles
If selected, all bonjour hosts on the local network have a profile created for them as long as they're around.

<br/>
#### Check for updates automatically
If enabled, iTerm2 will periodically check if a new version of iTerm2 exists, and if so it will prompt you to download and upgrade.

<br/>
#### Prompt for test-release updates
If enabled, iTerm2 will periodically check if a new unstable version of iTerm2 exists, and if so it will prompt you to download and upgrade.

<br/>
#### Load preferences from a custom folder or URL:
If enabled, iTerm2 will load its preferences from the specified folder or URL. After setting this, you'll be prompted when you quit iTerm2 if you'd like to save changes to the folder.

<br/>
#### Copy to clipboard on selection
If enabled, text is copied to the clipboard immediately upon selection. If not selected, you must select Edit &gt; Copy to copy it.

<br/>
#### Copied text includes trailing newline
If enabled, a terminal newline will be copied to the pasteboard when the selection includes one; otherwise, no selection will ever include a terminal newline.

<br/>
#### Allow clipboard access to terminal apps
If enabled, clipboard access will be granted via escape code to programs running in iTerm2. They will be able to retreive and set the contents of the system pasteboard.

<br/>
#### Characters considered part of a word for selection
When you double-click in the terminal window, a "word" is selected. A word is defined as a string delimited by characters of a different class. The classes of characters are whitespace, word characters, and non-word characters. The characters in this field define the set of non-word characters.

<br/>
#### Smart window placement
If enabled, new windows will be opened where they least overlap existing windows.

<br/>
#### Adjust window when changing font size
If enabled, a change to a session's font will cause the window to grow or shrink.

<br/>
#### Zoom button maximizes vertically only
If enabled, the green "Zoom" button expands a terminal window vertically but does not affect its width. This can be overridden by holding down shift while clicking the zoom button.

<br/>
#### Closing hotkey window restores focus to last window, but may switch spaces.
If enabled, the act of closing a hotkey window will restore focus to the window that last had it. As a side effect, the current desktop/space may change.

<br/>
#### Use Lion-style Fullscreen windows
If enabled, fullscreen windows will animate into a special desktop, as is typical in OS X 10.7 and later. If disabled, fullscreen windows will instantly go fullscreen without changing desktops.

<br/>
#### When attaching, open unrecognized windows in...
When attaching to a new tmux session with the tmux integration, tmux windows not seen by iTerm2 before will open in either new windows or tabs, as specified by this preference.

<br/>
#### Open dashboard if there are more than...tmux windows
When attaching to a tmux session with the tmux integration, windows are normally opened automaticaly. If there are too many of them, then the tmux dashboard is opened instead.

<br/>
#### Automatically hide the tmux client session after connecting
When the tmux integration is entered by running <b>tmux -CC</b>, the window in which that command was run will miniaturize into the dock if this option is enabled.

<br/>
### Appearance

<br/>
#### Tab Style
Select from a list of tab looks.

<br/>
#### Tab Position
Defines whether tabs appear at the top or bottom of a window.

<br/>
#### Hide tab bar when there is only one tab
If selected, the tab bar will become invisible when a window contains exactly one tab.

<br/>
#### Color tab labels on activity
If selected, tab labels become purple when a non-selected tab has new output, and red when a non-selected tab has output you haven't seen but that is not very recent.

<br/>
#### Hide tab number and tab close button
If selected, only the tab name appears in a tab.

<br/>
#### Hide tab activity indicator
If selected, the progress indicator in each tab will not be displayed.

<br/>
#### Show tabs in fullscreen by holding cmd for
When in fullscreen mode, holding down the cmd key will cause the tab bar to show. This setting allows you to specify how long cmd must be held down before the tab bar is shown.

<br/>
#### Show per-pane title bar with split panes
When a tab has split panes, this option controls whether each split pane will have its own title bar.

<br/>
#### Auto-hide menu bar in non-Lion fullscreen
When Lion-style fullscreen is disabled, this option is in effect. If you'd like the menu bar to remain visible when a fullscreen window is present on a screen with a menu bar, turn this on.

<br/>
#### Show window number
If selected, window titles include the window number. You can navigate to a window by pressing cmd-opt-N where N is the window number.

<br/>
#### Show current job name
If selected, tab and window titles will show the name of the foreground job.

<br/>
#### Show profile name
If selected, tab and window titles will show profile names.

<br/>
#### Dimming affects only text, not background
When a window or pane is dimmed, this option controls whether the background color is dimmed or only the text colors.

<br/>
#### Dimming amount
This slider controls how much to dim inactive windows or panes.

<br/>
#### Dim inactive split panes
If selected, split panes that do not have keyboard focus will be slightly dimmed.

<br/>
#### Dim background windows
If enabled, windows in the background (that is, those not receiving keyboard input) are dimmed according to the above settings.

<br/>
#### Animate dimming
If enabled, window dimming effects are animated.

<br/>
#### Show border around window
If selected, a 1-pixel border will be shown around the edges of terminal windows.

<br/>
#### Hide scrollbar and resize control
If selected, the scrollbar and resize control (for OS 10.5 and 10.6) will not be visible.

<br/>
#### Disable transparency for fullscreen windows by default
If enabled, entering fullscreen mode will automatically turn off transparency for that window.


<br/>
<br/>
### Profiles &gt; General

#### Name
Gives the name of the profile which is shown in menus, preferences, and the profiles window.

<br/>
#### Shortcut key
This shortcut can be used to open a new window or tab. By default, it opens a new tab, but if you hold down the option key while pressing the shortcut, a new window will be opened in stead.

<br/>
#### Tags
Tags are a collection of words or phrases that annotate a profile. When you search your profiles (for instance, in the profiles window), the tag names are searched in addition to the profile name.

<br/>
#### Command
This is the command that is executed when a new session with the profile is created. If login shell is chosen, then your shell is run with '-' as the first character of argv[0]. You can put special terms surrounded by $$ in this field (example: $$USERNAME$$). When a new session is created, you will be prompted to enter a value for each such term. See the description of URL Schemes below for details about the special "$$" value that can go in this field.

<br/>
#### Working directory
Normally, new sessions begin in your home directory. You can choose to open new sessions in the same directory as the current session, or you can specify a starting directory. If you choose <i>Advanced Configuration</i> then you can specify different behaviors for the initial directory when opening a new window, tab, or split pane by tapping the edit button to its right.

<br/>
#### URL Schemes
You can configure a profile to handle a URL scheme, such as ssh. When a hyperlink is clicked on with that scheme, a new tab is opened with the selected profile. It is recommended that you set the command to "$$", in which case an ssh command line will be auto-generated. For other schemes, you can uses these variables in the Command field and they will be replaced with the appropriate part of the URL:

* $$URL$$ The complete url
* $$HOST$$ The host portion of a url like scheme://host/
* $$USER$$ The username portion of a url like scheme://user@host/
* $$PASSWORD$$ The password portion of a url like scheme://user:password@host/
* $$PORT$$ The port number of a url like scheme://host:port/
* $$PATH$$ The path portion of a url like scheme://host/path
* $$RES$$ The portion of a url following the scheme.

Please note that each application is responsible for setting its URL schemes and iTerm2 does not offer the option to set any other application as the handler for a scheme.

<br/>
### Profiles &gt; Colors
Clicking on any of the color wells opens a color picker that lets you change the setting for the selected color.

<br/>
#### Smart cursor color
When selected, a block cursor will be displayed in reverse video. If this would result in confusion, then a different color is chosen that will be most visible given the surrounding cells' background colors.

<br/>
#### Minimum contrast
If text is displayed against a similar background color, the minimum contrast setting will move the text color towards black or towards white to ensure some minimum level of visibility. Setting this slider all the way to maximum will make all text black and white.

<br/>
#### Load Presets
iTerm2 ships with some color presets, which you may load from this popup menu. You can import and export color presets to files with the extension "itermcolors". There is an online color gallery where users may share color presets, and a link to it is provided in this menu. When importing a color preset, the name it is assigned is based on the filename imported.

<br/>
### Profiles &gt; Text
<br/>
#### Cursor
This lets you select a cursor shape.

<br/>
#### Blinking cursor
If checked, the cursor will blink slowly to improve visibility.

<br/>
#### Draw bold text in bold font
If selected, bold text will be drawn in a bold version of the selected font. If the font does not have a bold version, then a bold appearance is simulated by "double striking" the text: that is, drawing it twice, shifting it one pixel horizontally the second time.

<br/>
#### Draw bold text in bright colors
If selected, bold text will be drawn in a bright version of its color.

<br/>
#### Blinking text allowed
If selected, text with the blink attribute set will actually blink. Oh, the humanity.

<br/>
#### Italic text allowed
If selected, text with the italic attribute set will be rendered in italics. The font you select must have an italic face.

<br/>
#### Regular font
ASCII text (latin letters, numbers, and some symbols) will be drawn using this font, as well letters with combining marks. Select "Anti-aliased" to draw the text with smooth edges.

<br/>
#### Non-ASCII font
All non-ASCII text (many accented Latin letters, non-Latin text, less-common symbols, and thousands of miscellaneous unicode characters) will be drawn with this font. It is recommended that you use the same point size for both regular and non-ASCII fonts. Select "Anti-aliased" to draw the text with smooth edges.

<br/>
#### Treat ambiguous-width characters as double width
Some characters (e.g., Chinese ideograms) are double-width, and take two cells to display. Other characters (e.g., Latin letters) are single width and take only one cell to display. There is another category of characters known as "ambiguous width". One example of ambiguous-width characters are Greek letters. Depending on your application, you may prefer to display them as double-width or single-width. If most of the text you deal with is double-width, then you should enable this setting as it will help things to line up correctly in that context.

<br/>
### Profiles &gt; Window

<br/>
#### Transparency
This sets the transparency of the window background. It can be temporarily disabled with View &gt; Use Transparency.

<br/>
#### Blur
If selected, the window background is blurred provided the background has some transparency. Selecting a large radius will blur the background more, but (especially on Retina displays) comes with a performance penalty.

<br/>
#### Rows/Columns
When creating a new window with this profile, it will be created with this many rows and columns.

<br/>
#### Background Image
This allows you to select an image to display behind the terminal's text. If <i>Tile image</i> is selected, then the image will be shown at its actual size and tesselated; otherwise, it will be stretched to fit the whole pane. The <i>blending</i> slider determines how strongly the image dominates over the text's background color.

<br/>
#### Style
This defines the window style. Bottom- and Top-of-screen windows will disregard the columns setting. Left-of-screen windows will disregard the rows setting. Full-screen windows only respect the rows and columns setting when full-screen mode is exited.

<br/>
#### Screen
If you have more than one screen connected, this lets you select the screen on which a new window should open. It is particularly useful for fullscreen and top-of-screen window styles.

<br/>
#### Space
If you have enabled Spaces (or your OS uses Desktops instead of spaces) and have set Spaces/Mission Control to use Control+Number to switch spaces/desktops, then you can use this setting to select the initial space/desktop to open a new window using this profile.

<br/>
#### If showing profile name in tab title, keep it when the title is changed
You can specify that profile names are shown in window and tab titles under Preferences &gt; Appearance &gt; Show Profile Name. If that is not set, then this option is irrelevant. When in use, a host may send an escape code that changes the window title. This setting causes the profile name to be preserved in that session-set title.

<br/>
#### Disable session-initiated window resizing
If the host sends an escape code to resize the window, it will be ignored if this option is selected..

<br/>
### Profiles &gt; Terminal

<br/>
#### Scrollback lines
The number of lines of scrollback buffer to keep above the visible part of the screen. Unlimited scrollback will allow it to grow indefinitely, possibly using all available memory.

<br/>
#### Save lines to scrollback when an app status bar is present
Some programs (such as vim or tmux) keep a status bar at the bottom of the screen. For some applications (like vim) it is undesirable to save lines to the scrollback buffer when the application scrolls. For others (like tmux) you may want to save scrolled-off lines into the scrollback buffer. When this setting is enabled, lines scrolled off the top of the screen in the presence of a status bar are added to the scrollback buffer. The screen is considered to have a status bar if it has a scroll region whose top is the first line of the screen and whose bottom is above the bottom of the screen.

<br/>
#### Save lines to scrollback in alternate screen mode
When in alternate screen mode, lines that scroll off the top of the screen will be saved to the scrollback buffer only if this option is enabled.

<br/>
#### Character encoding
The encoding to send and receive in. For most people, "Unicode (UTF-8)" is the right choice.

<br/>
#### Report terminal type
The TERM variable will be set to this value by default. If xterm-256color is selected and your system is missing the terminfo file, you will be prompted to install it when you open a new session.

<br/>
#### Enable xterm mouse reporting
If selected, applications may choose to receive information about the mouse. This can be temporarily disabled by holding down Option.

<br/>
#### Allow terminal to report window title
Programs running in a terminal may send an escape code to request the current window title. You may disable this feature by enabling this option. It should be disabled if you're communicating with an untrusted party, as there are possible injection attacks.

<br/>
#### Use modern parser (experimental)
iTerm2 includes an experimental parser for CSI codes that should produce more correct results, but it isn't tested enough to be on by default. Enable this option to use it.

<br/>
#### Disable session-initiated printing
If enabled, escape codes that initiate printing will be ignored.

<br/>
#### Disable save/restore alternate screen
Some programs (such as vim, tmux, and less) switch into a so-called "alternate screen". A characteristic of this behavior is that when these programs terminate the screen's contents are restored to their state from before the program was run. If this option is selected, alternate screen mode is disabled and the screen cannot be restored by an application.

<br/>
#### Silence bell
If selected, the bell (control-G) will not make an audible sound.

<br/>
#### Enable Growl notifications
If selected and Growl is installed, iTerm2 will post a Growl notification when sessions receive output, become idle, ring the bell, or close. 

<br/>
#### Flash visual bell
If selected, a bell graphic will be flashed when the bell character is received.

<br/>
#### Show bell icon in tabs
If selected, tabs will indicate that a bell has rung by displaying a bell graphic.

<br/>
#### Set locale variables automatically
If enabled, LANG and LC_CTYPE ennvironment variables will be set based on your machine's language settings.

<br/>
### Profiles &gt; Session

<br/>
#### Automatically close a session when it ends
If selected, a session's pane, tab, or window will automatically close when the session ends.

<br/>
#### Prompt before closing
When a session will close, you can choose when to be prompted with a modal alert.

<br/>
#### Automatically log session input to files in:
If enabled, every session's output will be logged to a file in the specified directory. File names are formatted as <i>Date_Time.ProfileName.TerminalID.ProcessId.RandomNumber.log</i>.

<br/>
#### When idle, send ASCII code
If selected, the specified ASCII code will be transmitted every 30 seconds while nothing is happening. Don't use this unless you know what you're doing as it can have unexpected consequences.

<br/>
### Profiles &gt; Keys
This panel shows key mappings. You can double-click on a mapping to edit it. When the "Keyboard Shortcut" field has focus, you should press the keystroke that you want to modify (even if it involves modifiers like Cmd). The following actions are available:

<br/>
#### ignore
The keypress will do nothing.

<br/>
#### Do not remap modifiers
If modifier remapping is in effect (set under Preferences &gt; Keys), it can be disabled for certain key combinations. When you choose this action, modifier remapping is temporarily disabled so you can press the key combination unremapped in the key field.

<br/>
#### Remap modifiers in iTerm2 only
If modifier remapping is in effect (set under Preferences &gt; Keys), it can be set to not affect other applications that may listen for global hotkeys. When you choose this action, modifier remapping is temporarily disabled so you can press the key combination unremapped in the key field.

<br/>
#### Split/New Window/Tab with Profile
These actions allow you to create a new session with a specified profile when a key is pressed.

<br/>
#### Backward in Time/Forward in Time
This is equivalent to the menu item View &gt; Step Backward/Forward in Time

<br/>
#### Cycle Tabs Forward
This implements tab switching the same way Cmd-Tab switches windows, with the most-recently-used stack.

<br/>
#### Next/Previous Tab/Window
These actions navigate among tabs and windows.

<br/>
#### Move tab left/right
Changes the tab's position in the order.

<br/>
#### Scroll to End/Top/Up/Down
These actions move through the scrollback buffer.

<br/>
#### Select Split Pane Above/Below/Left/Right
These actions navigate split panes.

<br/>
#### Send ^? / ^H Backspace
Modern systems use ^? for backspace, while some legacy systems use ^H.

<br/>
#### Send Escape Sequence
This action allows you to enter some text that will be sent when the associated key is pressed. First, the ESC character is sent, and then the text you entered is sent.

<br/>
#### Send Hex Code
This action allows you to enter a sequence of hex codes that will be sent. Each value should begin with "0x" followed by one or two hex digits (0-9, a-f, or A-F). Each code should be separated by a space. You can see a list of hex codes on http://asciitable.com/ in the "Hx" column.

<br/>
#### Send Text
This action allows you to enter a text string that will be sent when the associated key is pressed. The following escape characters are supported: \n (newline), \e (escape), \a (bell), \t (tab).

<br/>
#### Toggle Fullscreen
This action enters or exits full screen mode.

<br/>
#### Run Coprocess
This action launches a Coprocess. <a href="http://www.iterm2.com/coprocesses.html#/section/home">Learn more about coprocesses.</a>

<br/>
#### Select Menu Item...
This action allows you to select an item from the iTerm2 menu to run. All the menu items are presented in a drop-down list.

You can add a new keymapping by pressing "+". You can remove an existing mapping by selecting it and pressing "-". Three presets are provided: "Xterm defaults" is the normal key mappings, while "Xterm defaults with numeric keypad" disables the "application keypad" in favor of the numbers and symbols that the numeric keypad typically emits. "Terminal.app Compatability" tries to emulate the way that Terminal.app sends keys by default.

<br/>
#### Left/Right Option Key Acts As
It is common to use a modifier to send so-called "meta keys". For most users, selecting "+Esc" here is the right choice. The "Meta" option sets the high bit of the input character, and is not compatible with modern systems.

<br/>
#### Delete key sends ^H
If you are on a legacy system that does not accept ^? for backspace, select this and it will add a key mapping for you.

<br/>
### Profiles &gt; Advanced

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

<br/>
#### Smart Selection
Smart selection allows you to define a set of regular expressions, each with an assigned priority, that are used for making the best possible selection. By default, a quad-click invokes smart selection. Smart selection is described in full in the <a href="http://www.iterm2.com/smartselection.html#/section/home">Smart Selection</a> document.

<br/>
#### Semantic History
Semantic history is used to open a file when you Cmd-Click on it. The current working directory for each line in the terminal is tracked to help find files. If Semantic History is set to "Open with default app," then files are passed to the OS to be opened with whatever is associated. Alternatively, you can choose "Open URL..." to open a specific URL (with \1 replaced with the filename and \2 replaced with the line number, if applicable). If you choose "Open with editor..." then text files will be opened with the designated editor, while other files are opened with the default app for their file type. For more flexibility, choose "Run command..." and specify a command to execute. \1 will be replaced with the file name, \2 will be replaced with the line number (if applicable), \3 with text in the line prior to the click location, \4 with text in the line subsequent to the click location, and \5 for the working directory of the line clicked on. Finally, "Always run command..." is like "Run command...," but takes effect even if the object clicked on is not an existing filename.

<br/>
### Keys
<br/>
#### Remap modifier keys
iTerm2 allows you to change the meanings of the modifier keys only within iTerm2. This is useful, for example, if you find it difficult to press "option" for "meta" and would prefer to use "command" for that purpose.

<br/>
#### To switch tabs
Tabs are normally navigated with cmd+number, but you can change the modifier used for that function here.

<br/>
#### To switch windows
Windows are normally navigated with cmd+opt+number, but you can change the modifier used for that function here.

<br/>
#### Show/Hide iTerm2 with a system-wide hotkey
When enabled, you can focus the Hotkey: field and press a keystroke. From then on, pressing that keystroke (even when iTerm2 is not the front application) will cause iTerm2 to come to the front. If it is the foreground app, it will be sent to the back. This requires that you enable access for assistive devices in the Universal Access panel of System Preferences.

<br/>
#### Hotkey toggles a dedicated window with profile
If enabled, the hotkey set above will toggle a single window with a specific profile. This provides an always-available terminal.

<br/>
#### Global shortcut keys
This interface works like the keyboard shortcut system in profiles (described above) but it affects all profiles. Settings here are overridden by those in a profile's key mappings.

<br/>
### Pointer

<br/>
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
This is identical to Edit &gt; Paste.

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

<br/>
#### Focus follows mouse
If enabled, moving the mouse over an inactive window will cause it to receive keyboard focus.

<br/>
#### Cmd-Click Opens Filename/URL
If enabled, then clicking on a filename (of an existing file on the local machine) or a URL will open it.

<br/>
#### Report ctrl-click to apps instead of opening menu
If enabled, ctrl-click will be sent to applications that support Xterm mouse reporting (if mouse reporting is enabled).

<br/>
#### Three-finger tap reports middle click to apps
If enabled, a three-finger tap acts like a middle click for the purposes of mouse reporting.

<br/>
#### Triple-click selects full wrapped lines
If enabled, a triple click selects a whole line, even if it was longer than one row in the terminal. If off, then triple click selects exactly one row.

<br/>
#### Middle button pastes from clipboard
If enabled, clicking the mouse's middle button will paste. Otherwise, it may be reported to the application if Xterm mouse reporting is on and the application supports it.

<br/>
### Arrangements
This tab lets you view saved window arrangements. You can delete them with the minus button and select the default arrangement.

<br/>
<br/>

<a name="/section/documentation/hidden_settings">
</a>
## Hidden Settings
<hr>

There are a few settings that you cannot access via iTerm2's own Preferences panel. However, you can use the "defaults" command to change them. To change a hidden setting, quit iTerm2. In terminal, run the defaults command. Then restart iTerm2.

To change the number of entries in the autocomplete menu:
<pre>
    defaults write com.googlecode.iterm2 AutocompleteMaxOptions -int 10
</pre>

To change the number of coprocess commands remembered:
<pre>
    defaults write com.googlecode.iterm2 "Coprocess MRU" -int 10
</pre>

To preserve whitespace in selections copied to the pasteboard:
<pre>
    defaults write com.googlecode.iterm2 TrimWhitespaceOnCopy -bool false
</pre>

When you open a file from the finder in iTerm2 (e.g., by double-clicking a shell script), it will either open in a window or a tab. By default, it opens in a tab. You can change this with:

<pre>
    defaults write com.googlecode.iterm2 OpenFileInNewWindows -bool true
</pre>

You can configure iTerm2 to quit when the last session is closed, and you can also configure sessions to close automatically when they end. If something is broken (like a bad command set in the default profile), it's possible for a session to start and end almost immediately, causing iTerm2 to quit very soon after launch and not giving you time to fix the problem. To prevent this issue, there is a 10-second safety valve during which iTerm2 won't quit automatically when the last session is closed. To change the time of this safety valve:

<pre>
    defaults write com.googlecode.iterm2 MinRunningTime -float 10.0
</pre>

When an external monitor is connected, sometimes it needs a few seconds to be recognized by the system. If iTerm2 isn't handling this well, you can increase the delay before it attempts to reconfigure itself after a change of monitors.

<pre>
    defaults write com.googlecode.iterm2 UpdateScreenParamsDelay -float 1.0
</pre>

To change the number of paste history entries saved:

<pre>
    defaults write com.googlecode.iterm2 MaxPasteHistoryEntries -int 20
</pre>

Pastes (both regular and slow) are done by splitting the text to paste into chunks. There is a delay between the transmission of each chunk. To change the speed that "paste" pastes at:
<pre>
    defaults write com.googlecode.iterm2 QuickPasteBytesPerCall -int 1024
    defaults write com.googlecode.iterm2 QuickPasteDelayBetweenCalls -float 0.01
</pre>

To change the speed that "paste slowly" pastes at:
<pre>
    defaults write com.googlecode.iterm2 SlowPasteBytesPerCall -int 16
    defaults write com.googlecode.iterm2 SlowPasteDelayBetweenCalls -float 0.125
</pre>

To disable using the pinch gesture to change font size:
<pre>
    defaults write com.googlecode.iterm2 PinchToChangeFontSizeDisabled -bool true
</pre>

To keep LC_CTYPE from being set when locale environment variables are set:
<pre>
    defaults write com.googlecode.iterm2 DoNotSetCtype -bool true
</pre>

To allow Growl notifications to be posted for the current tab:
<pre>
    defaults write com.googlecode.iterm2 GrowlOnForegroundTabs -bool true
</pre>

To tune smart cursor color settings:
<pre>
    defaults write com.googlecode.iterm2.plist SmartCursorColorBgThreshold -float 0.5
    defaults write com.googlecode.iterm2.plist SmartCursorColorFgThreshold -float 0.75
</pre>
SmartCursorColorBgThreshold: If the cursor's background color is too close to nearby background colors, force it to the "most different" color. This is the difference threshold that triggers that change. 0 means always trigger, 1 means never trigger.

SmartCursorColorFgThreshold: The cursor's text is forced to black or white if it is too similar to the background. If the brightness difference is below a threshold then the B/W text mode is triggered. 0 means always trigger, 1 means never trigger.

To allow a three-finger tap to act like a three-finger click:
<pre>
    defaults write com.googlecode.iterm2.plist ThreeFingerTapEmulatesThreeFingerClick -bool true
</pre>

To change the set of characters that are considered part of a URL (besides alphanumerics):
<pre>
    defaults write com.googlecode.iterm2.plist URLCharacterSet -string ".?\\/:;%=&_-,+~#@!*'()|[]"
</pre>

To use some experimental optimizations that will improve performance (safety not guaranteed):
<pre>
    defaults write com.googlecode.iterm2.plist ExperimentalOptimizationsEnabled -bool true
</pre>

To tweak tab sizes:
<pre>
    defaults write com.googlecode.iterm2 UseUnevenTabs -bool false
    defaults write com.googlecode.iterm2 MinTabWidth -int 75
    defaults write com.googlecode.iterm2 MinCompactTabWidth -int 60
    defaults write com.googlecode.iterm2 OptimumTabWidth -int 175
</pre>

To change your search engine:
<pre>
    defaults write com.googlecode.iterm2 SearchCommand -string "http://google.com/search?q=%@"
</pre>

To adjust the speed of the animation of the hotkey window's appearance and disappearance:
<pre>
    defaults write com.googlecode.iterm2 HotkeyTermAnimationDuration \
            -float 0.25
</pre>

To adjust the amount of dimming of split panes. Set the value to a floating-point number between 0 (no dimming) and 1 (complete dimming). The default is 0.15:
<pre>
    defaults write com.googlecode.iterm2 SplitPaneDimmingAmount \
            -float 0.25
</pre>

<br/>
<br/>
<br/>
<a name="/section/documentation/scripting">
</a>
## Scripting
<hr/>

iTerm2 features Applescript support which allows you to automate many aspects of its behavior. Quite a bit of customization is also possible by writing shell scripts.

### Applescript

iTerm2 has sophisticated Applescript support allowing one to write stand-alone
scripts to launch the application and open multiple sessions with profiles
into either new tabs or new windows. You can also set some other
parameters for a session such as foreground and background colors, and
transparency.

Sample scripts may be found at the <a href="https://code.google.com/p/iterm2/wiki/AppleScript">iTerm2 Applescript Examples</a> page.

These scripts can then be saved as stand-alone executable applications.

<br/><br/>
#### Autolaunching Scripts

iTerm2 also supports autolaunching of an Applescript on startup. On startup, iTerm2 looks for an Applescript file in "~/Library/Application Support/iTerm2/AutoLaunch.scpt". If it is found, the "AutoLauch.scpt" script is launched and executed.

<br/><br/>
#### User-Defined Scripts

iTerm2 also supports launching of user defined scripts from the "Scripts"
menu. The scripts need to be stored under the
`~/Library/Application Support/iTerm/Scripts` directory. You can create
this directory if it does not already exist. iTerm2 checks this directory
on startup.

<br/>
<br/>
<br/>
<a name="/section/documentation/fonts">
</a>
## Fonts
<hr/>

While iTerm2 does not require monospaced fonts, they look much better than proportionately spaced fonts. If you want to use Consolas, you'll need to correct its baseline offset as described at [how to fix Consolas baseline](http://mbauman.net/geek/2009/03/15/minor-truetype-font-editing-on-a-mac/).

<br/>
<br/>
<br/>
<a name="/section/documentation/shell_tips">
</a>
## Proprietary Escape Codes
<hr/>

iTerm2 supports several non-standard escape codes. These may not work properly in tmux or screen, and may have unknown effects on other terminal emulators. Proceed with caution.

<br/>
<br/>
#### Set cursor shape
<pre>
^[]50;CursorShape=N^G
</pre>

where N=0, 1, or 2.

* 0: Block
* 1: Vertical bar
* 2: Underline

Add this to your .vimrc to change cursor shape in insert mode:
<pre>
let &t_SI = "\&lt;Esc&gt;]50;CursorShape=1\x7"
let &t_EI = "\&lt;Esc&gt;]50;CursorShape=0\x7"
</pre>

This is derived from [Konsole](http://vim.wikia.com/wiki/Change_cursor_shape_in_different_modes).

<br/>
<br/>
#### Set Mark
The "Set Mark" (cmd-shift-M) command allows you to record a location and then jump back to it later (with cmd-shift-J). The following escape code has the same effect as that command:

<pre>
^[]50;SetMark^G
</pre>

<br/>
<br/>
#### Steal Focus
To bring iTerm2 to the foreground:

<pre>
^[]50;StealFocus^G
</pre>

<br/>
<br/>
#### Clear Scrollback History
To erase the scrollback history:

<pre>
^[]50;ClearScrollback^G
</pre>

<br/>
<br/>
#### Set curent directory
To inform iTerm2 of the current directory to help semantic history:

<pre>
^[]50;CurrentDir=/the/current/directory^G
</pre>

<br/>
<br/>
#### Change profile
To change the session's profile on the fly:

<pre>
^[]50;SetProfile=NewProfileName^G
</pre>

<br/>
<br/>
#### Copy to clipboard
To place text in the pasteboard:

<pre>
^[]50;CopyToClipboard=name^G
</pre>
Where name is one of "rule", "find", "font", or empty to mean the general pasteboard (which is what you normally want). After this is sent, all text received is placed in the pasteboard until this code comes in:

<pre>
^[]50;EndCopy^G
</pre>

<br/>
<br/>
#### Set window title and tab chrome background color

To set the window title and tab color use this escape sequence:

<pre>
^[]6;1;bg;red;brightness;N^G
^[]6;1;bg;green;brightness;N^G
^[]6;1;bg;blue;brightness;N^G
</pre>

Replace N with a decimal value in 0 to 255.

Example in bash that turns the background purple:
<pre>
echo -e "\033]6;1;bg;red;brightness;255\a"
echo -e "\033]6;1;bg;green;brightness;0\a"
echo -e "\033]6;1;bg;blue;brightness;255\a"
</pre>

<br/>
<br/>
#### Change the color palette

<pre>
^[]Pnrrggbb^[\
</pre>

Replace "n" with:

*  0-f (hex) = ansi color
*  g = foreground
*  h = background
*  i = bold color
*  j = selection color
*  k = selected text color
*  l = cursor
*  m = cursor text

rr, gg, bb are 2-digit hex value (for example, "ff").

Example in bash that changes the foreground color blue:
<pre>
echo -e "\033]Pg4040ff\033\\"
</pre>
