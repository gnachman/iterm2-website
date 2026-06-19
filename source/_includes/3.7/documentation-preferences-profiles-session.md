## Profiles
### Session

#### Warn about short-lived sessions
When enabled, you'll be given a warning if a session ends within a short time after it starts. This gives you a chance to see what went wrong and fix it.

#### "Undo" can revive a session that has been closed for up to X seconds
When you close a session, window, or tab the shell is not terminated until X seconds pass. While that time period has not elapsed, *Undo* will reopen the session, tab, or window.

#### After a session ends
Defines what happens when a session ends.

 * *No Action* - The session stays open and you will be prompted to restart it.
 * *Close* - The session is automatically closed.
 * *Restart* - The session is automatically restarted with the same command that launched it.

#### Prompt before closing
When a session will close, you can choose when to be prompted with a modal alert. If you select *If there are jobs besides* then the prompt will only be shown when an app besides those specified (which are often present when nothing is happening) is running.

#### Enable automatic session logging
If enabled, every session's output will be logged to a file in the specified directory. The filename format can also be specified here as an interpolated string.

#### Log format
You can log in the following formats:

 * *Raw data* - An exact copy of the input that was received including control sequences.
 * *Plain text* - Excludes control sequences. Just text and newlines. This is very readable when running CLI apps but becomes utter chaos for interactive programs like vim or emacs.
 * *HTML* - Like *Plain text*, it excludes control sequences. Colors and various font attributes are preserved. The resulting file can be viewed in a web browser.
 * *asciinema* - Produces a file viewable with <a href="https://asciinema.org/">asciinema</a>, which preserves time as well as more font attributes.

#### Folder
The folder in which to place logs. This is an [interpolated string](https://iterm2.com/documentation-scripting-fundamentals.html#interpolated-strings).

#### Filename
The name to give the log file. This is an [interpolated string](https://iterm2.com/documentation-scripting-fundamentals.html#interpolated-strings).

#### Open password manager automatically
If enabled the password manager will be opened when a session with this profile is created.

#### Timestamps
When enabled, the last modified date and time of each line is shown on the right-hand side of the terminal. You can also select whether timestamps should overlap contents or sit next to them.

#### Status bar enabled
See <a href="documentation-status-bar.html">Status Bar</a> for details on the status bar.

#### When idle, send ASCII code X every Y seconds.
If selected, the specified ASCII code "X" (a number from 0 to 255) will be transmitted every Y seconds while nothing is happening. Don't use this unless you know what you're doing as it can have unexpected consequences. Seriously, it's probably not what you want.

#### Avoid repainting while cursor is hidden to reduce flicker while scrolling
When selected, the screen will slightly delay redraws while the cursor is hidden. This improves the visual appearance of scrolling in many programs but might introduce noticeable delays for some users.
