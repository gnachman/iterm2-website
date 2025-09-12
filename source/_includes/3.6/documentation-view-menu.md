#### View > Show Tabs in Fullscreen
If enabled, tabs are shown in fullscreen windows.

#### View > Toggle Full Screen
Enters or exists full screen mode. iTerm2 supports both the standard macoS full screen mode, where the window occupies its own Space, and its traditional full screen mode that shares a Space with other windows. You can control which is used in **Settings > General > Native full screen windows**.

#### View > Toolbelt > Set Default Width
Saves the current window's toolbelt width as the default width for new windows' toolbelts.

#### View > Toolbelt > Show Toolbelt
This toggles the visibility of the Toolbelt on the right side of all windows.

#### View > Toolbelt > Actions
This toggles the visibility of the Actions tool, which shows actions you have configured under **Settings > Shortcuts > Actions**.

#### View > Toolbelt > Captured Output
This toggles the visibilty of the Captured Output tool. It shows captured output located with the Capture Output trigger. See <a href="documentation-captured-output.html">Captured Output</a> for more information.

#### View > Toolbelt > Codecierge
This toggle the visibility of an AI assitant that helps you complete tasks in the terminal.

#### View > Toolbelt > Command History
This toggles the visibility of the Command History tool. It shows recently used commands. You must install <a href="documentation-shell-integration.html">Shell Integration</a> for this to know your command history.

#### View > Toolbelt > Jobs
This toggles the visibility of the Jobs tool, which shows the running jobs in the current session, and allows you to send them signals.

#### View > Toolbelt > Named Marks
This toggles the visibility of the Named Marks tool, which helps you navigate to saved locations in the current session's history. In browser sessions, named marks take you to saved locations on a web page.

#### View > Toolbelt > Notes
This toggles the visibility of the Notes tool, which provides a freeform scratchpad in the toolbelt. Notes persist across restarts of the app and are saved in `~/Library/Application Support/iTerm2/notes.rtfd`.

#### View > Toolbelt > Paste History
This toggles the visibility of the Paste History tool, which shows recently pasted strings in the toolbelt.

#### View > Toolbelt > Profiles
This toggles the visibility of the Profiles tool, which lets you select profiles to open new windows, tabs, and split panes.

#### View > Toolbelt > Recent Directories
This toggles the visibility of the Recent Directories tool. It shows recently used directories sorted by a combination of recency and frequency of use. You must install <a href="documentation-shell-integration.html">Shell Integration</a> for this to know your directory history. You can right click a directory to open a context menu that allows you to "start" a directory. This keeps it pinned at the bottom of the list so it's easy to find.

#### View > Toolbelt > Snippets
This toggles the visibility of the Snippets tool, which helps you send frequently used text strings.

#### View > Use Transparency
This toggles transparency. It only has an effect if you have configured your session to be transparent under Settings > Profiles > Window > Transparency. When Full Screen mode is entered, transparency is turned off by default, but you can select this menu item to re-enable it.

#### View > Disable Transparency for Active Window
When enabled, the active window will never be transparent. Inactive windows will respect the transparency setting from **Settings > Profiles > Window > Transparency**.

#### View > Zoom In on Selection
When a selection is present this is enabled. Zooming on a selection removes all other text from the session and lets you focus on just the zoomed-in-on text. Pressing escape will invoke Zoom Out when you are in the Zoom In state.

#### View > Zoom Out
Exits the *Zoom In on Selection* mode.

#### View > Find Cursor
Reveals the current cursor position.

#### View > Show Cursor Guide
Toggles the visiblity of the cursor guide which is a horizontal rule showing the location of the cursor.

#### View > Show Timestamps
Indicate the time of last modification of each line on the screen.

#### View > Show Annotations
Toggles the visibility of annotations.

#### View > Show Composer
Toggles the visibility of the Composer, a text area that you can edit using native macOS keystrokes. This is convenient for preparing complex inputs.

#### View > Auto Command Completion
Automatically shows a window with command completion suggestions as you type. Only usable when you have command history built up with <a href="documentation-shell-integration.html">Shell Integration</a>.

#### View > Auto Composer
Replaces the shell prompt with a macOS native text editing control. It offers filename and command completion, including over ssh when using SSH Integration. It requires <a href="documentation-shell-integration.html">Shell Integration</a> to be installed in order to work.

#### View > Open Quickly
If you have lots of sessions you can quickly find the one you're looking for with Open Quickly. Select the View > Open Quickly menu item (cmd-shift-O) and then enter a search query. You can search by tab title, command name, host name, user name, profile name, directory name, badge label, and more. Queries are scored according to relevance and sorted by score. Open Quickly also lets you create new tabs, change the current session's profile, and open arrangements. If you start your query with a / then that gives you a shortcut to various commands. /a followed by an arrangement name restores the arrangement. /f restricts the query to existing sessions, excluding options to open new tabs, etc. /p restrics the query to profile names to switch the current session to. /t restricts the results to "open new tab" for matching profile names.

#### View > Maximize Active Pane
When there are split panes present, this toggles whether a given pane expands to fill the tab. When a maximized pane is present, the tab will be inscribed with a dotted outline.

#### View > Size Changes Update Profile
If enabled, modifying the text size using **View > Make Text Bigger** or **View > Make Text Smaller** will cause the session's profile to be updated with the new font size.

#### View > Start Instant Replay
Stepping through time allows you to see what was on the screen at a previous time. This is different than going back through the scrollback buffer, as interactive programs sometimes overwrite the screen contents without having them scroll back. Once in this mode, you can use the left and right arrow keys to step back and forward, respectively. The "esc" key exits this mode, as does clicking the close button in the bar that appears on the bottom. You can adjust the amount of memory dedicated to this feature in Settings > Instant Replay uses xx MB per session. The more memory you assign, the further back in time you can step.

#### View > Tab Color
Allows you to select a tint color for the tab, to make it easier to distinguish. You can also change the tab color in Settings > Profiles > Colors.
