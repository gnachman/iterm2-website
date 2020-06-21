#### View > Show Tabs in Fullscreen
If enabled, tabs are shown in fullscreen windows.

#### View > Toggle Full Screen
Enters or exists full screen mode. iTerm2 supports both the standard macoS full screen mode, where the window occupies its own Space, and its traditional full screen mode that shares a Space with other windows. You can control which is used in **Preferences > General > Native full screen windows**.

#### View > Use Transparency
This toggles transparency. It only has an effect if you have configured your session to be transparent under Preferences > Profiles > Window > Transparency. When Full Screen mode is entered, transparency is turned off by default, but you can select this menu item to re-enable it.

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

#### View > Auto Command Completion
Automatically shows a window with command completion suggestions as you type. Only usable when you have command history built up with <a href="documentation-shell-integration.html">Shell Integration</a>.

#### View > Open Quickly
If you have lots of sessions you can quickly find the one you're looking for with Open Quickly. Select the View > Open Quickly menu item (cmd-shift-O) and then enter a search query. You can search by tab title, command name, host name, user name, profile name, directory name, badge label, and more. Queries are scored according to relevance and sorted by score. Open Quickly also lets you create new tabs, change the current session's profile, open arrangements, and change the color preset. If you start your query with a / then that gives you a shortcut to various commands. /a followed by an arrangement name restores the arrangement. /f restricts the query to existing sessions, excluding options to open new tabs, etc. /p restrics the query to profile names to switch the current session to. /t restricts the results to "open new tab" for matching profile names. /c restricts the results to color presets.

#### View > Maximize Active Pane
When there are split panes present, this toggles whether a given pane expands to fill the tab. When a maximized pane is present, the tab will be inscribed with a dotted outline.

#### View > Start Instant Replay
Stepping through time allows you to see what was on the screen at a previous time. This is different than going back through the scrollback buffer, as interactive programs sometimes overwrite the screen contents without having them scroll back. Once in this mode, you can use the left and right arrow keys to step back and forward, respectively. The "esc" key exits this mode, as does clicking the close button in the bar that appears on the bottom. You can adjust the amount of memory dedicated to this feature in Preferences > Instant Replay uses xx MB per session. The more memory you assign, the further back in time you can step. The instant replay UI also lets you choose to export a section of your terminal history to share with other iTerm2 users.

#### View > Size Changes Update Profile
When enabled, changes made to the text size in this session (by selecting Make Text Bigger/Smaller) will be reflected in its profile.

#### View > Tab Color
Allows you to select a tint color for the tab, to make it easier to distinguish. You can also change the tab color in Profiles > Preferences > Colors.

