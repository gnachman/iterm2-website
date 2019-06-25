## Profiles
### Terminal

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

#### ENQ answer back
Text to send when the ENQ sequence is received. Not normally used.

#### Enable mouse reporting
If selected, applications may choose to receive information about the mouse. This can be temporarily disabled by holding down Option.

#### Enable mouse wheel events
If disabled, the mouse will always perform its default action (such as scrolling history) rather than being reported to an app that has enabled mouse reporting.

#### Terminal may report window title
Programs running in a terminal may send an escape code to request the current window title. You may disable this feature by enabling this option. It should be disabled if you're communicating with an untrusted party, as there are possible injection attacks.

#### Terminal may set tab/window title
If enabled the terminal may set the window or tab title with an escape sequence.

#### Disable session-initiated printing
If enabled, escape codes that initiate printing will be ignored.

#### Disable save/restore alternate screen
Some programs (such as vim, tmux, and less) switch into a so-called "alternate screen". A characteristic of this behavior is that when these programs terminate the screen's contents are restored to their state from before the program was run. If this option is selected, alternate screen mode is disabled and the screen cannot be restored by an application.

#### Disable session-initiated window resizing
If the host sends an escape code to resize the window, it will be ignored if this option is selected..

#### Silence bell
If selected, the bell (control-G) will not make an audible sound.

#### Send Growl/Notification Center alerts
If selectedinstalled, iTerm2 will post a notifications when sessions receive output, become idle, ring the bell, close, or get a proprietary escape sequence to post a notification. If Growl is installed it is preferred over Notification Center.

#### Filter Alerts
This button opens a panel that lets you customize which notifications will be posted.

#### Flash visual bell
If selected, a bell graphic will be flashed when the bell character is received.

#### Show bell icon in tabs
If selected, tabs will indicate that a bell has rung by displaying a bell graphic.

#### Set locale variables automatically
If enabled, LANG and LC_CTYPE environment variables will be set based on your machine's language settings.

#### Insert newline before start of command prompt if needed
If you have <a href="documentation-shell-integration.html">Shell Integration</a> installed and a command's output does not end in a newline, this setting will ensure your prompt does not begin in the middle of the line.

#### Show mark indicators
If you have <a href="documentation-shell-integration.html">Shell Integration</a> and this setting is selected then a blue or red arrow appears next to each shell prompt. Turn this off to hide the arrow.


