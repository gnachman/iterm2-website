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
### AI

#### OpenAI API Key
Because AI features depend on ChatGPT's API, which is not free, users must provide their own API keys. You can get one from https://platform.openai.com/api-keys after creating an account. Unlike most settings (which are saved in user defaults), the AI key is stored in the keychain to prevent unauthorized access.

#### AI Prompt
When using the "Engage Artificial Intelligence" feature, the text you've provided (such as an English sentence in the Composer) is transformed with this string. This value is an interpolated string. The variable `ai.prompt` is defined, containing the string the user entered. Other variables come from the session context. See https://iterm2.com/documentation-variables.html for a list of all variables.

#### Model
Gives the name of the ChatGPT model to use. Models have different capabilities and size limits. Since new models are released periodically, you can enter a free-form value. You can see a list of models and their token limits here: https://platform.openai.com/docs/models

#### Token Limit
Gives the maximum number of tokens that the selected ChatGPT model accepts. Since you are billed by the token, you can control costs by reducing this value. When a conversation gets too long iTerm2 will truncate the earlier parts of it to stay under the limit, which can reduce the quality of the AI experience.

<hr>
### Services

#### Add Bonjour hosts to profiles
If selected, all Bonjour hosts on the local network have a profile created for them as long as they're around.

#### Notify only for cricial shell integration updates
When disabled, iTerm2 will let you know whenever your shell integration scripts are out of date. When enabled, it will warn you only when a very important update is available (e.g., because of a security issue).

#### Check for updates automatically
If enabled, iTerm2 will periodically check if a new version of iTerm2 exists, and if so it will prompt you to download and upgrade.

#### Update to Beta test releases
If enabled, iTerm2 will periodically check if a new unstable version of iTerm2 exists, and if so it will prompt you to download and upgrade.

<hr>
### Selection

#### Copy to pasteboard on selection
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
