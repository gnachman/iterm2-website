## General

<hr>
### Startup

#### Window restoration policy

This setting determines how windows will be opened when iTerm2 is launched. Most users will want *Use System Window Restoration Setting* as it works best with <a href="restoration.html">Session Restoration</a>. Users who exclusively use the Hotkey Window may prefer *Only Restore Hotkey Window*, which will not restore regular windows but will restore the hotkey window. If you have a default window arrangement saved then *Open Default Window Arrangement* will be available.

#### Open profiles window
If selected, the Profiles Window will automatically open when iTerm2 is started.

<hr>
### Closing

#### Quit when all windows are closed
If selected, iTerm2 will automatically quit when its last terminal window is closed.

#### Confirm closing multiple sessions
If selected, commands that close one session will not be confirmed, but commands that close multiple sessions (such as clicking the red button on a window with two or more tabs) will be confirmed with an alert box.

#### Confirm Quit iTerm2 Command
If selected, the Quit iTerm2 (cmd-Q) command will be confirmed if any terminal windows are open.

<hr>
### Magic

#### Instant Replay Uses X MB per Session
This setting specifies the maximum amount of memory allocated to instant replay for each tab or split pane. More memory means instant replay is able to go farther back into the past. You can enter instant replay with **View > Step Back in Time**.

#### Save copy/paste and command history to disk
If selected, every time text is copied or pasted in iTerm2 it will be saved to disk. The last 20 values are recorded. They can be accessed with **Edit > Open Paste History...**. If you use <a href="shell_integration.html">Shell Integration</a> then when this is enabled your command history, directory history, and remote hostname and usernames will also be saved to disk. Unchecking this will erase all of the saved information.

#### GPU Rendering
The GPU renderer improves drawing performance, but it may use more energy. You can also configure when it is enabled in *Advanced GPU Settings*.

The advanced settings are:

  * *Disable GPU renderer when disconnected from power* - Use this to conserve energy when not plugged in and to get the best drawing performance when connected to power.
  * *Maximize throughput (may increase latency)* - This setting reduces the frame rate from 60 FPS to 30 FPS. It improves the rate at which data can be processed.
  * *Prefer integrated to discrete GPU* - If your machine has two GPUs, enable this to use the slower but less power-hungry GPU.

<hr>
### Services

#### Add Bonjour hosts to profiles
If selected, all Bonjour hosts on the local network have a profile created for them as long as they're around.

#### Check for updates automatically
If enabled, iTerm2 will periodically check if a new version of iTerm2 exists, and if so it will prompt you to download and upgrade.

#### Prompt for test-release updates
If enabled, iTerm2 will periodically check if a new unstable version of iTerm2 exists, and if so it will prompt you to download and upgrade.

<hr>
### Selection

#### Characters considered part of a word for selection
When you double-click in the terminal window, a "word" is selected. The OS's algorithm for word selection is used, but it's extended to also include characters in this set. For example, by adding `/` to this field, double-clicking on a `path/like/this` would select the entire path instead of just one component.

#### Copy to pasteboard on selection
If enabled, text is copied to the clipboard immediately upon selection. If not selected, you must select **Edit > Copy** to copy it.

#### Copied text includes trailing newline
If enabled, a terminal newline will be copied to the pasteboard when the selection includes one; otherwise, no selection will ever include a terminal newline.

#### Applications in terminal may access clipboard
If enabled, clipboard access will be granted via escape code to programs running in iTerm2. They will be able to set the contents of the system pasteboard. For more details, see <a href="documentation-utilities.html">Shell Integration Utilities</a>.

<hr>
### Window

#### Smart window placement
If enabled, new windows will be opened where they least overlap existing windows.

#### Adjust window when changing font size
If enabled, a change to a session's font will cause the window to grow or shrink.

#### Zoom button maximizes vertically only
If enabled, the green "Zoom" button expands a terminal window vertically but does not affect its width. This can be overridden by holding down shift while clicking the zoom button.

#### Native full screen windows
If enabled, fullscreen windows will animate into a special desktop, as is typical in macOS 10.7 and later. If disabled, fullscreen windows will instantly go fullscreen without changing desktops.

#### Separate window title per tab
The OSC 0 and OSC 2 control sequences set the window title. This setting controls whether such a control sequence changes the window title associated with all sessions in the window, or only with the one in which it was received.

<hr>
### Preferences

#### Load preferences from a custom folder or URL:
If enabled, iTerm2 will load its preferences from the specified folder or URL. After setting this, you'll be prompted when you quit iTerm2 if you'd like to save changes to the folder.

#### Save changes to folder when iTerm2 quits
When you've turned on *Load preferences from a custom folder* and this is on then any changes you make to your settings will be written to the custom folder.

<hr>
### tmux

#### Open tmux windows as
The first dropdown box in the **tmux Integration** section allows you to define how tmux windows should be mapped to native constructs. When attaching to a new tmux session with the tmux integration, tmux windows not seen by iTerm2 before will open in either new windows or tabs, as specified by this preference.

#### Automatically bury the tmux client session after connecting
When the tmux integration is entered by running tmux -CC, the window in which that command was run will be <a href="documentation-buried-sessions.html">buried</a>.

#### Use "tmux" profile rather than profile of connecting session
This used to on by default, but is no longer so as of version 3.3. When enabled, a copy of the Default profile is created, called `tmux`. When using tmux integration all tmux sessions will use this profile.

When disabled, the profile of the session in which you ran `tmux -CC` will be used for all tmux sessions.

