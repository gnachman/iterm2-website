Variables are used to communicate information between components such as Python
scripts and shell scripts. They are described in depth in
<a href="documentation-scripting-fundamentals.html">Scripting Fundamentals</a>.

## Reference

Jump to context:
<a href="#session-context">Session</a> | <a href="#tab-context">Tab</a> | <a href="#window-context">Window</a> | <a href="#global-context">Global</a>

<hr/>
<a name="session-context"></a>
### Session Context

The following variables are defined in the context of a session:

#### Session Name
  * `autoNameFormat` - This is an interpolated string from which the `autoName` variable is computed. It can be modified by changing the "Session Name" field in **Edit Session…**, by a trigger that sets the session name, or by an OSC control sequence that sets the icon title. It is initialized to the profile name when a new session is created.
  * `autoName` - The result of evaluating the `autoNameFormat` interpolated string. This attempts to match the user's intuition of the what the session's name is.
  * `name` - The formatted name as it appears in the tab bar (excluding tmux integration decoration). For example, if the profile is configured to show the session name and job, this would take a value like `My Profile (vim)`.
  * `presentationName` - The session name exactly as it appears in the session title bar.
  * `terminalIconName` - The "icon" title, as set by the control sequence OSC 0 or OSC 1.
  * `terminalWindowName` - The "window" title, as set by the control sequence OSC 0 or OSC 2.
  * `triggerName` - The last session name set by a trigger.

#### Terminal
  * `columns` - Session's width in columns
  * `commandLine` - Command line of the current foreground job (job name including arguments)
  * `jobName` - The name of the current foreground job (e.g., "emacs")
  * `jobPid` - The process ID of the current foreground job in this session.
  * `mouseReportingMode` - A number indicating how mouse events are reported. -1: Not reported, 0: button clicks reported, 1: not currently implemented, 2: reports clicks and drags, 3: reports clicks, drags, and movement
  * `pid` - The process ID of the root process in this session (typically `login`).
  * `rows` - The session's height in rows
  * `termid` - Window, tab, and pane number as used in the `$TERM_SESSION_ID` environment variable.
  * `tty` - The path to the local TTY device

#### Shell Integration

These values require shell integration to be installed.

  * `hostname` - The current hostname
  * `lastCommand` - The last command run in the session
  * `path` - The current working directory (this works without shell integration, but not if you ssh elsewhere)
  * `username` - The current user name

#### Auto-Logging
  * `autoLogId` - When automatic logging is enabled, this is the random number portion of the filename.
  * `creationTimeString` - A string giving the initial creation time of the session, used as part of the filename when automatic logging is enabled

#### tmux Integration
  * `tmuxClientName` - The name of the tmux session when tmux integration is in use (e.g., `user@localhost`).
  * `tmuxRole` - Unset if tmux integration is not in use. Otherwise, is "gateway" for the session in which `tmux -CC` is running or "client" in tmux integration sessions.
  * `tmuxStatusLeft` - In tmux integration, the value of the left side of the status bar.
  * `tmuxStatusRight` - In tmux integration, the value of the right side of the status bar.
  * `tmuxWindowPane` - In tmux integration, this gives the window pane number.
  * `tmuxWindowTitle` - If tmux integration is in use, this gives the name of the window title from tmux.

#### References to Other Contexts
  * `iterm2` - A reference to the variables belonging to the application (i.e., the global context)
  * `tab` - A reference to the variables belonging to the tab containing this session.
  * `user` - A context for user-set variables. Variables may be set with a custom control sequence or by using the [Python scripting API](https://www.iterm2.com/python-api). They are often set when using shell integration. See <a href="#user-defined-variables">**User-Defined Variables**</a> for more information.

#### Other
  * `badge` - The value of the badge. Note that the user can enter an interpolated string in the UI, but this value contains the string result of evaluating it.
  * `id` - A unique identifier for the session
  * `profileName` - The name of the current profile.

<a name="user-defined-variables" />
#### User-Defined Variables

The only variables that users may directly control are those in the "user"
scope of a session. For example, you could set a variable named "gitBranch" to
the name of the current git branch. This value would then be available to
display in the session title, badge, or other places, and would be available to
Python API scripts. You'd reference it as `user.gitBranch`.

See <a href="documentation-scripting-fundamentals.html#setting-user-defined-variables">"Setting User-Defined Variables" in *Scripting Fundamentals*</a>
for details on setting them.

<hr/>
<a name="tab-context"></a>
### Tab Context
  * `id` - The unique identifier for this tab.
  * `titleOverrideFormat` - An interpolated string giving the title to use for the tab. If not set, the session's title will be used. Note the session's title is configurable in **Prefs > Profiles > General > Title** and is not necessarily equal to the `autoName`, but may be derived from it (or not).
  * `titleOverride` - The value of `titleOverrideFormat` after evaluating it as an interpolated string.
  * `tmuxWindow` - In tmux integration, this is the tmux window number this tab represents.

#### References to Other Contexts
  * `currentSession` - A reference to the context of the active session in this tab.
  * `iterm2` - A reference to the variables belonging to the application (i.e., the global context)
  * `window` - A reference to the context of the enclosing window

<hr/>
<a name="window-context"></a>
### Window Context

#### References to Other Contexts
  * `currentTab` - A reference to the context of the active tab.
  * `iterm2` - A reference to the variables belonging to the application (i.e., the global context)

#### Window Title
  * `titleOverride` - The value from evaluating the interpeted string in `titleOverrideFormat`, if set.
  * `titleOverrideFormat` - The window's interpolated string title. If not set, the current tab's title is used.

<hr/>
<a name="global-context"></a>
### Global Context
  * `effectiveTheme` - A space-delimited list of words describing the OS theme (e.g., "dark",  "light highContrast", "dark minimal")
  * `localhostName` - The best guess of what localhost's hostname is
  * `pid` - The process ID of the iTerm2 app

