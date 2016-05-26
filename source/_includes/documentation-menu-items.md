# iTerm2 Menu

#### iTerm2 > Secure Keyboard Entry
When this is enabled, the operating system will prevent other programs running on your computer from being able to see what you are typing. If you're concerned that untrusted programs might try to steal your passwords, you can turn this on, but it may disable global hotkeys in other programs.

#### iTerm2 > Show Tip of the Day
When you start using iTerm2 it will offer to show you a daily tip describing a feature. You can show a tip immediately by selecting this item.

#### iTerm2 > Check for Updates
Checks to see if a new version of iTerm2 is available. If Preferences > General > Prompt for test-release updates is turned on then this includes beta versions; otherwise only stable versions are downloaded.

#### iTerm2 > Toggle Debug Logging
This saves helpful debugging information in memory. When it is toggled off it is saved to /tmp/debuglog.txt.

#### iTerm2 > Install Shell Integration
Runs a shell script that modifies your .bash_profile (or other startup script) and enables the <a href="/shell_integration.html">Shell Integration</a> features.

# Shell Menu

#### Shell > New Tab with Current Profile
This creates a new tab using the same profile as the current session rather than the default profile.

#### Shell > New Window/Tab
This creates a new window or tab with the default profile. If the current session is a tmux integration session, then you will be prompted for whether to create a local or tmux session.

#### Shell > Duplicate Tab
Creates another tab with the same arrangement of split panes, profile, etc.

#### Shell > Split Vertically/Horizontally
These menu items allow you to divide a tab into two or more split panes. The panes can be adjusted by dragging the line that divides them. They will use the default profile.

#### Shell > Split Vertically/Horizontally with Current Profile
These menu items allow you to divide a tab into two or more split panes. The panes can be adjusted by dragging the line that divides them. They will use the profile of the current session.

#### Shell > Restart Session
After a session ends (e.g., because the shell exits) this menu item becomes enabled. It will re-run your profile's command in the same viewport as the terminated session.

#### Shell > Broadcast Input > ...
These options allow you to send keyboard input to more than one session. Be careful.

#### Shell > Run/Stop Coprocess
Allows you to start and stop a coprocess linked to the current session. Learn more about coprocesses.

#### Shell > tmux > ...
These commands let you interact with the tmux integration. The tmux dashboard is a view that lets you see all your tmux sessions and windows at a glance, adjust which are visible, rename them, and change the current tmux session.

#### Shell > Log > Start/Stop
Logging saves all input received in a session to a file on disk.

# Edit Menu

#### Edit > Undo Close Session/Tab/Window
After you close a session, tab, or window then you have five seconds to undo it. The amount of time is configurable in PReferences > Profiles > Session.

#### Edit > Paste Special > Advanced Paste
This opens the Advanced Paste window which lets you select a string from the pasteboard in recent history, select different representations of the current pasteboard, and modify the string before pasting it. You can modify it by appling a regex substitution, using various built-in modifiers (such as base-64 encoding), or edit it by hand.

#### Edit > Paste Special > Paste Selection
Pastes the currently selected text (which may differ from the text in the pasteboard).

#### Edit  > Paste Special > Paste File Base64-Encoded
If there is a file on the pasteboard then this this is enabled. When invoked, it base64-encodes the file and pastes the encoded value.

#### Edit > Paste Special > Paste Escaping Special Characters
"Paste Escaping Special Characters" pastes the current string in the clipboard, but places a backslash before spaces and backslashes.

#### Edit > Paste Special > Paste Slowly
"Paste Slowly" pastes the current string in the clipboard, but it doesn't send the whole string at once. It is sent in batches of 16 bytes with a 125ms delay between batches.

#### Edit > Paste Special > Paste Faster/Slower
Adjusts the speed of pasting to be faster or slower.

#### Edit > Paste Special > Paste Slowly Faster/Slower
Adjusts the speed of slow pasting to be faster or slower. You must hold down option for this menu item to be visible.

#### Edit > Paste Special > Warn Before Multi-Line Paste
When enabled, you'll be warned before pasting more than one line.

#### Edit > Selection Respects Soft Boundaries
When enabled, vertical lines of pipe characters `|` will be interpreted as pane dividers (as in vim or emacs) and selection will wrap at them.

#### Edit > Open Autocomplete...
Shows the autocomplete window, which offers to finish typing a word that you've begun. <a href="documentation-highlights.html">Learn more about autocomplete on highlights page</a>.

#### Edit > Edit Current Session
This opens a window that lets you change the settings of the current session without affecting any other sessions. Changes made in this panel will not be overridden by subsequent changes to the profile. Settings *not* cahnged in this panel will be affected by changes to the profile.

#### Edit > Open Command History...
If you use <a href="shell_integration.html">Shell Integration</a> then Open Command History presents a list of recently used commands to select from.

#### Edit > Open Recent Directories...
If you use <a href="shell_integration.html">Shell Integration</a> then Open Recent Directories presents a list of recently used directories to select from.

#### Edit > Open Paste History...
"Open Paste History" opens a window showing up to the last 20 values that were copied or pasted in iTerm2. You can search its contents by typing a (non-necessarily-consecutive) subsequence of characters that appear in the value. You can use arrow keys and enter to make a selection, or you can click on an item to choose it, and it will be pasted. If you enable the Save copy/pate history to disk preference then these values will persist across sessions of iTerm2.

#### Edit > Find > Fine URLs
Searches the current session for URLish looking strings.

#### Edit > Marks and Annotations > Set Mark
Records the current scroll position. Use Edit > Jump to Mark to restore the scroll position.

#### Edit > Marks and Annotations > Add Annotation at Cursor
Adds an annotation to the word beginning at the cursor. An annotation is a scratchpad for you to write notes about a chunk of text in your history.

#### Edit > Marks and Annotations > Alerts > Alert on Next Mark
When a mark is set (typically by <a href="shell_integration.html">Shell Integration</a> when the currently running shell command terminates) then show an alert. 

# View Menu

#### View > Show Tabs in Fullscreen
If enabled, tabs are shown in fullscreen windows.

#### View > Use Transparency
This toggles transparency. It only has an effect if you have configured your session to be transparent under Preferences > Profiles > Window > Transparency. When Full Screen mode is entered, transparency is turned off by default, but you can select this menu item to re-enable it.

#### View > Find Cursor
Reveals the current cursor position.

#### View > Zoom In on Selection/Zoom Out
When a selection is present this is enabled. Zooming on a selection removes all other text from the session and lets you focus on just the zoomed-in-on text. Pressing escape will invoke Zoom Out when you are in the Zoom In state.

#### View > Show Cursor Guide
Toggles the visiblity of the cursor guide which is a horizontal rule showing the location of the cursor.

#### View > Show Timestamps
Indicate the time of last modification of each line on the screen.

#### View > Show Annotations
Toggles the visibility of annotations.

#### View > Auto Command Completion
Automatically shows a window with command completion suggestions as you type. Only usable when you have command history built up with <a href="shell_integration.html">Shell Integration</a>.

#### View > Open Quickly
If you have lots of sessions you can quickly find the one you're looking for with Open Quickly. Select the View > Open Quickly menu item (cmd-shift-O) and then enter a search query. You can search by tab title, command name, host name, user name, profile name, directory name, badge label, and more. Queries are scored according to relevance and sorted by score. Open Quickly also lets you create new tabs, change the current session's profile, and open arrangements. If you start your query with a / then that gives you a shortcut to various commands. /a followed by an arrangement name restores the arrangement. /f restricts the query to existing sessions, excluding options to open new tabs, etc. /p restrics the query to profile names to switch the current session to. /t restricts the results to "open new tab" for matching profile names.

#### View > Maximize Active Pane
When there are split panes present, this toggles whether a given pane expands to fill the tab. When a maximized pane is present, the tab will be inscribed with a dotted outline.

#### View > Start Instant Replay
Stepping through time allows you to see what was on the screen at a previous time. This is different than going back through the scrollback buffer, as interactive programs sometimes overwrite the screen contents without having them scroll back. Once in this mode, you can use the left and right arrow keys to step back and forward, respectively. The "esc" key exits this mode, as does clicking the close button in the bar that appears on the bottom. You can adjust the amount of memory dedicated to this feature in Preferences > Instant Replay uses xx MB per session. The more memory you assign, the further back in time you can step.

#### View > Tab Color
Allows you to select a tint color for the tab, to make it easier to distinguish. You can also change the tab color in Profiles > Preferences > Colors.

# Profiles Menu

#### Profiles > Open Profiles...
This opens the "Profiles Window" which allows you to create new windows, tabs, or panes from one or more profiles. You can perform a search by entering text in the search field. Profile names and tags are searched, and the listed profiles are filtered as you type. You can use the up and down arrow keys to make a selection. Pressing enter will open a new tab, while shift-enter will open a new window. You can make multiple selections by holding down shift or cmd and clicking on profiles. The "New Tabs in New Window" button is enabled only when more than one profile is selected: it will open a new window and create a new tab for each profile selected.

# Scripts Menu

If you have scripts located in `$HOME/Library/Application Support/iTerm/Scripts` they'll be added to this menu. The menu will not exist if there are no scripts.

# Toolbelt Menu

#### Tolbelt > Captured Output
This toggles the visibilty of the Captured Output tool. It shows captured output located with the Capture Output trigger. See <a href="captured_output.html">Captured Output</a> fo r more information.

#### Toolbelt > Command History
This toggles the visibility of the Command History tool. It shows recently used commands. You must install <a href="shell_integration.html">Shell Integration</a> for this to know your command history.

#### Toolbelt > Show Toolbelt
This toggles the visibility of the Toolbelt on the right side of all windows.

#### Toolbelt > Jobs
This toggles the visibility of the Jobs tool, which shows the running jobs in the current session, and allows you to send them signals.

#### Toolbelt > Notes
This toggles the visibility of the Notes tool, which provides a freeform scratchpad in the toolbelt.

#### Toolbelt > Paste History
This toggles the visibility of the Paste History tool, which shows recently pasted strings in the toolbelt.

#### Toolbelt > Profiles
This toggles the visibility of the Profiles tool, which lets you select profiles to open new windows, tabs, and split panes.

#### Toolbelt > Recent Directories
This toggles the visibility of the Recent Directories tool. It shows recently used directories sorted by a combination of recency and frequency of use. You must install <a href="shell_integration.html">Shell Integration</a> for this to know your directory history.

# Window Menu

#### Window > Exposé All Tabs
All iTerm2 tabs will be shown tiled on the main screen. You can mouse over a tab to see it larger, and clicking on it will restore the windows and select that tab and bring its window to the front. You can search the contents of all tabs by typing in the search field that appears on the left. Making a selection from the results below it will highlight the tab that contains that text. This is useful when you have many tabs open and can't find the one you're looking for.

#### Window > Save/Restore Window Arrangement
The current state and positions of windows, tabs, and spit panes is recorded and saved to disk with Save Window Arrangement. Restore Window Arrangement opens a new collection of windows having the saved state. You can automatically restore the arrangement in Preferences > General > Open saved window arrangement.

#### Window > Password Manager
Opens the password manager.

