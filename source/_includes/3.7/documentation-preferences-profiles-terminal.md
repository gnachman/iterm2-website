## Profiles
### Terminal

#### Scrollback lines
The number of lines of scrollback buffer to keep above the visible part of the screen. Unlimited scrollback will allow it to grow indefinitely, possibly using all available memory.

#### Save lines to scrollback when an app status bar is present
Some programs (such as vim or tmux) keep a status bar at the bottom of the screen. For some applications (like vim) it is undesirable to save lines to the scrollback buffer when the application scrolls. For others (like tmux) you may want to save scrolled-off lines into the scrollback buffer. When this setting is enabled, lines scrolled off the top of the screen in the presence of a status bar are added to the scrollback buffer. The screen is considered to have a status bar if it has a scroll region whose top is the first line of the screen and whose bottom is above the bottom of the screen.

#### Save lines to scrollback in alternate screen mode
When in alternate screen mode, lines that scroll off the top of the screen will be saved to the scrollback buffer only if this option is enabled.

#### Drag-to-scroll disabled in alternate screen mode
Normally you can use the mouse to scroll by starting a selection and moving the pointer above or below the session's bounds with the button pressed. Interactive apps (like vim or emacs) signal their interactivity by entering alternate screen mode. When this setting is enabled, you won't be able to accidentally scroll by dragging in an interactive app.

#### Character encoding
The encoding to send and receive in. For most people, "Unicode (UTF-8)" is the right choice.

#### Report terminal type
The TERM variable will be set to this value by default. If xterm-256color is selected and your system is missing the terminfo file, you will be prompted to install it when you open a new session.

#### ENQ answer back
Text to send when the ENQ sequence is received. Not normally used.

#### Enable mouse reporting
If selected, applications may choose to receive information about the mouse. This can be temporarily disabled by holding down Option.

#### Report mouse wheel events
If disabled, the mouse wheel will always perform its default action (such as scrolling history) rather than being reported to an app that has enabled mouse reporting.

#### Report mouse clicks & drags
If disabled, the mouse buttons will always perform their default action (such as making a selection) rather than being reported to an app that has enabled mouse reporting.

#### Terminal may enable alternate mouse scroll
Alternate mouse scroll is a feature where the scroll wheel sends arrow up/down keys rather than navigating history. If enabled, a program may switch into alternate mouse scroll.

#### Automatically enable alternate mouse scroll
When enabled, alternate mouse scroll will be turned on any time you're in an interactive application.

#### Restrict alternate mouse scroll to vertical scrolling
When enabled, a horizontal scroll gesture will never send arrow keys when alternate mouse scroll is on.

#### Restrict mouse reporting to alternate screen mode
When enabled, mouse movements or clicks will be reported only when in an interactive application.

#### Terminal may report window title
Programs running in a terminal may send an escape code to request the current window title. You may disable this feature by enabling this option. It should be disabled if you're communicating with an untrusted party, as there are possible injection attacks.

#### Terminal may change cursor blink
If enabled apps running in the terminal can cause the cursor to start or stop blinking with a control sequence.

#### Disable session-initiated printing
If enabled, escape codes that initiate printing will be ignored.

#### Disable save/restore alternate screen
Some programs (such as vim, tmux, and less) switch into a so-called "alternate screen". A characteristic of this behavior is that when these programs terminate the screen's contents are restored to their state from before the program was run. If this option is selected, alternate screen mode is disabled and the screen cannot be restored by an application.

#### A session may cause the window to resize
If enabled, the window size can be changed by a program sending a control sequence.

#### ...even if it is in an unselected tab or split pane
If enabled, programs running non-selected tabs or split panes without keyboard focus may resize the window.

#### Terminal may enable paste bracketing
Paste bracketing is a feature that can be enabled by an app running in iTerm2 by sending a control sequence. When enabled, iTerm2 transmits a control sequence before and after paste operations (e.g., pressing Cmd-V). This can be useful because editors like vim may disable auto-indenting when pasting already-indented code. Sometimes paste bracketing can be left on, causing unexpected behavior when you paste. For example, if a program running in an ssh session enables paste bracketing and then your ssh connection ends unexpectedly it won't have a chance to turn it off. Your next paste will include the bracketing control sequences, which will be mishandled by whatever program receives them. For that reason, some people prefer to disable paste bracketing. If you install Shell Integration it can detect when this occurs and automatically disable paste bracketing for you, making it safe to leave it enabled here.

#### Silence bell
If selected, the bell (control-G) will not make an audible sound.

#### Flash visual bell
If selected, a bell graphic will be flashed when the bell character is received.

#### Show bell icon in tabs
If selected, tabs will indicate that a bell has rung by displaying a bell graphic.

#### Notification Center alerts
If selected, iTerm2 will post a notifications when sessions receive output, become idle, ring the bell, close, or get a proprietary escape sequence to post a notification.

#### Filter Alerts
This button opens a panel that lets you customize which notifications will be posted.

#### Environment
You have the following options:

 * `Set locale environment variables automatically` - If enabled, LANG and LC_CTYPE environment variables will be set based on your machine's language settings.
 * `Do not set locale environment variables` - LANG and LC_CTYPE will be unset.
 * `Use custom locale...` - Lets you specify the locale variables you wish to use. You will be limited to those that are supported by your Mac.

The current locale is shown beneath this setting.

#### Insert newline before start of command prompt if needed
If you have <a href="documentation-shell-integration.html">Shell Integration</a> installed and a command's output does not end in a newline, this setting will ensure your prompt does not begin in the middle of the line.

#### Show mark indicators
If you have <a href="documentation-shell-integration.html">Shell Integration</a> and this setting is selected then a blue or red arrow appears next to each shell prompt. Turn this off to hide the arrow.

#### Show offscreen command line at top of session
When the session shows part of a command's output but the command is above the top of the screen, the command can be shown in a box  at the top when this is enabled.

#### Click on a path in a shell prompt to open Navigator
If enabled and your shell prompt contains something directory-like (for example, `/Users/george% `) then clicking on that directory opens a Navigator window that lets you browse the file system.

#### Send newline rather than carriage return to terminal commands
Some obscure or ancient systems expect newlines as line terminators. Unfortunately there is no way to detect this automatically. If tmux integration simply hangs for you on certain hosts, enabling this setting may fix it.
