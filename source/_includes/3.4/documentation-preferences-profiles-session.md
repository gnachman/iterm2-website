## Profiles
### Session

#### Automatically close a session when it ends
If selected, a session's pane, tab, or window will automatically close when the session ends.

#### "Undo" can revive a session that has been closed for up to X seconds
When you close a session, window, or tab the shell is not terminated until X seconds pass. While that time period has not elapsed, *Undo* will reopen the session, tab, or window.

#### Prompt before closing
When a session will close, you can choose when to be prompted with a modal alert.

#### Automatically log session input to files in:
If enabled, every session's output will be logged to a file in the specified directory. File names are formatted as Date_Time.ProfileName.TerminalID.ProcessId.RandomNumber.log. You can customize the filename in **Preferences > Advanced > Format for automatic session log filenames**.

#### When idle, send ASCII code X every Y seconds.
If selected, the specified ASCII code "X" (a number from 0 to 255) will be transmitted every Y seconds while nothing is happening. Don't use this unless you know what you're doing as it can have unexpected consequences. Seriously, it's probably not what you want.

#### Avoid repainting while cursor is hidden to reduce flicker while scrolling
When selected, the screen will slightly delay redraws while the cursor is hidden. This improves the visual appearance of scrolling in many programs but might introduce noticeable delays for some users.

#### Status bar enabled
See <a href="documentation-status-bar.html">Status Bar</a> for details on the status bar.


