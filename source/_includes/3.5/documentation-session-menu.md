#### Session > Edit Session
This opens a window that lets you change the settings of the current session without affecting any other sessions. Changes made in this panel will not be overridden by subsequent changes to the profile. Settings *not* cahnged in this panel will be affected by changes to the profile.

#### Session > Run/Stop Coprocess
Allows you to start and stop a coprocess linked to the current session. <a href="/documentation-coprocesses.html">Learn more about coprocesses</a>.

#### Session > Restart Session
After a session ends (e.g., because the shell exits) this menu item becomes enabled. It will re-run your profile's command in the same viewport as the terminated session.

#### Session > Duplicate Session
Creates a new session that is a copy of the current session. The following attributes are preserved:

 * If SSH integration is in use, the new session will connect to the same remote host.
 * The program that launched the original session (e.g., your login shell or a custom command) will launch the duplicate.
 * The working directory will be preserved, if possible.
 * The same profile will be used.

#### Session > Open Autocomplete...
Shows the autocomplete window, which offers to finish typing a word that you've begun. <a href="documentation-highlights.html">Learn more about autocomplete on highlights page</a>.

#### Session > Open Command History...
If you use <a href="documentation-shell-integration.html">Shell Integration</a> then Open Command History presents a list of recently used commands to select from.

#### Session > Open Recent Directories...
If you use <a href="documentation-shell-integration.html">Shell Integration</a> then Open Recent Directories presents a list of recently used directories to select from.

#### Session > Open Paste History...
"Open Paste History" opens a window showing up to the last 20 values that were copied or pasted in iTerm2. You can search its contents by typing a (non-necessarily-consecutive) subsequence of characters that appear in the value. You can use arrow keys and enter to make a selection, or you can click on an item to choose it, and it will be pasted. If you enable the Save copy/pate history to disk preference then these values will persist across sessions of iTerm2.

#### Triggers > Add Trigger
Adds a <a href="documentation-triggers.html">trigger</a>, defaulting to highlighting the currently selected text.

#### Triggers > Edit Triggers
Opens the settings dialog to edit triggers for this session.

#### Triggers > Enable Triggers in Interactive Apps
Toggles whether triggers are in effect when you are in an interactive app such as vim or emacs. Interactivity is inferred from the app's request to use alternate screen mode.

#### Session > Reset
Resets the internal state of the emulator and clears the screen. Use this if you get wedged in a bad state, like the wrong character set or mouse reporting mode is stuck.

#### Session > Reset CharacterSet
Resets only the session's character set.

#### Session > Log > Start/Stop
Logging saves all input received in a session to a file on disk.

#### Session > Log > Import/Export Recording...
The Instant Replay feature allows you to view the past window state. The import/export feature allows you to save that state to an `itr` file and share it with others. For more control, enter instant replay by selecting *View > Start Instant Replay* and click the *Export* button there; it will allow you to clip the recording by selecting its start and end points separately.

#### Session > Terminal State

Shows the internal state of the terminal emulator and lets you directly manipulate it.

#### Session > Bury Session/Buried Sessions
Buries or unburies a session. See <a href="documentation-buried-sessions.html">Buried Sessions</a> for details.
