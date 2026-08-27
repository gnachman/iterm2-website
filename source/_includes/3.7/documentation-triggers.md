A trigger is an action that is performed when something happens in a terminal session. Most often the something is text matching a regular expression being received, but triggers can also fire in response to *events* such as a command finishing, the working directory changing, or a particular job starting.

#### How to Create a Trigger
To create a trigger, open the **Settings** panel. Select the **Profiles** tab. Choose the profile to which you wish to add a trigger. Then select the **Advanced** tab. Click the **Edit** button in the **Triggers** section. A panel opens that displays any existing triggers. You can click the **+** button to add a new trigger.

Every trigger has a *match type*, an action, and an optional parameter. The match type determines what causes the trigger to fire. When you add a trigger you choose its match type from a popup menu. There are two broad categories:

<ul>
        <li><b>Regular Expression</b>: the trigger fires when received text matches a regular expression. This is the default and most common kind of trigger. Regex triggers may also be marked as <i>Instant</i>.</li>
        <li><b>Events</b>: the trigger fires when a session event occurs, independent of any text on the screen. See <a href="#events">Event Triggers</a> below.</li>
</ul>

#### Regular Expression
Regular expressions conform to the <a href="https://unicode-org.github.io/icu/userguide/strings/regexp.html">ICU regular expressions</a> rules. Text that is written to the screen including the BEL control code are sent to the regex matcher for evaluation. Only one line at a time is matched. By default, matching is performed when a newline or cursor-moving escape code is processed. If a line is very long, then only the *last* three wrapped lines are used (that is, the last three lines as seen on the display). This is done for performance reasons. You can change this limit in Advanced Settings &gt; Number of screen lines to match against trigger regular expressions.

#### Actions
The following actions are available:
<ul>
        <li>Annotate: Associates a note with a matching text.</li>
        <li>Bounce Dock Icon: Makes the dock icon bounce until the iTerm2 window becomes key.</li>
        <li>Capture Output: Save the line to the Captured Output toolbelt tool. See <a href="documentation-captured-output.html">Captured Output</a>. The parameter is text to send (as though it had been typed) when you double-click on an entry in the Captured Output tool.</li>
        <li>Change Style: Modifies the style of matching text.
        <li>Fold to Named Mark: Collapses all lines between the matching line and a preceding named mark with a given name.</li>
        <li>Highlight Line: The entire line containing text matching the regex in the trigger will change color. The parameter sets the color.</li>
        <li>Highlight Text: The text matching the regex in the trigger will change color. The parameter sets the color.</li>
        <li>Inject Data: Inserts bytes into the input stream. These can be text or control sequences.</li>
        <li>Invoke Script Function: Executes a function call defined using the Python API.</li>
        <li>Make Hyperlink: The text matching the regex in the trigger will become a hyperlink which you can open with Cmd-Click. The parameter sets the URL.</li>
        <li>Open Password Manager: Opens the password manager. You can specify which account to select by default.</li>
        <li>Post Notification: Posts a notification with Notification Center.</li>
        <li>Prompt Detected: Informs iTerm2 that the shell prompt begins at the start of the match. Used to emulate Shell Integration features. If the prompt is one line long then use Instant.</li>
        <li>Report Directory: Tells iTerm2 what your current directory is. You can use this to enable <a href="documentation-shell-integration.html">Shell Integration</a> features without installing the scripts. The parameter is your current directory.</li>
        <li>Report User & Host: Tells iTerm2 what your user or host name is. You can use this to enable <a href="documentation-shell-integration.html">Shell Integration</a> features without installing the scripts. To specify just a user name, say `user@`. For just a host, say `@host`. For both, say `user@host`.</li>
        <li>Ring Bell: Plays the standard system bell sound once.</li>
        <li>Run Command: Runs a user-defined command.</li>
        <li>Run Coprocess: Runs a <a href="documentation-coprocesses.html">Coprocess</a>.</li>
        <li>Run Silent Coprocess: Runs a <a href="documentation-coprocesses.html">Coprocess</a> but do not show text that's being received (it only goes to the coprocess).</li>
        <li>Send Text: Sends user-defined text back to the terminal as though the user had typed it.</li>
        <li>Set Mark: Sets a mark. You can specify whether you'd like the display to stop scrolling after the trigger fires.</li>
        <li>Set Named Mark: Associates a name with the matching range. Various features help you navigate to named marks such as the Toolbelt tool and Open Quickly.</li>
        <li>Set Title: Sets the session's title.</li>
        <li>Set User Variable: Assigns a value to a user-defined [variable](https://iterm2.com/documentation-variables.html).</li>
        <li>Show Alert: Shows an alert box with user-defined text.</li>
        <li>Stop Processing Triggers: When this action is invoked no triggers further down the list will be invoked for the current text.</li>
</ul>

#### Parameter?
Various actions (Run Command, Run Coprocess, Post Notification, Send Text, and Show Alert) require additional information. This is specified in the "Parameters" field. When the parameter is a text field with freeform entry, some special values are defined:

For event triggers, `\0` is not defined (there is no matched text), but `\1`, `\2`, and so on refer to values captured from the event as described in the [Event Triggers](#events) table.
<table>
        <thead>
                <tr>
                        <th>Value</th>
                        <th>Meaning</th>
                </tr>
        </thead>
        <tbody>
                <tr>
                        <td>\0</td>
                        <td>The entire value matched by the regular expression.</td>
                </tr>
                <tr>
                        <td>\1, \2, ..., \9</td>
                        <td>The nth value captured by the regular expression.</td>
                </tr>
                <tr>
                        <td>\a</td>
                        <td>A BEL character (^G).</td>
                </tr>
                <tr>
                        <td>\b</td>
                        <td>A backspace character ^H.</td>
                </tr>
                <tr>
                        <td>\e</td>
                        <td>An ESC character (ascii 27).</td>
                </tr>
                <tr>
                        <td>\n</td>
                        <td>A newline character.</td>
                </tr>
                <tr>
                        <td>\r</td>
                        <td>A linefeed character.</td>
                </tr>
                <tr>
                        <td>\t</td>
                        <td>A tab character.</td>
                </tr>
                <tr>
                        <td>\xNN</td>
                        <td>A hex value NN (for example: \x1b sends ascii code 27, an ESC).</td>
                </tr>
        </tbody>
</table>

#### Instant
When <i>Instant</i> is set, the trigger will fire once per line as soon as the match occurs, without waiting for a newline. This was added for the benefit of the <i>Open Password Manager</i> trigger, since password prompts usually are not followed by a newline. This may cause certain regular expressions (for example, ".*") to match less than they otherwise might. <i>Instant</i> applies only to regular-expression triggers.

<a name="events"></a>
#### Event Triggers
Instead of matching a regular expression, a trigger can fire in response to a session *event*. Choose an event from the match-type popup when creating or editing a trigger. Any trigger action may be used with any event.

Most events have an optional filter so the trigger fires only for events you care about (for example, only when a command exits non-zero, or only when a process named `claude` starts). Leave a filter blank to match every occurrence. Each event also provides captured values that you can reference in the action's parameter as `\1`, `\2`, and so on.

The available events are:
<table>
        <thead>
                <tr>
                        <th>Event</th>
                        <th>Fires when</th>
                        <th>Filter</th>
                        <th>Captures</th>
                </tr>
        </thead>
        <tbody>
                <tr>
                        <td>Prompt Detected</td>
                        <td>Shell integration detects a new prompt.</td>
                        <td>None</td>
                        <td>None</td>
                </tr>
                <tr>
                        <td>Command Finished</td>
                        <td>A command exits. Requires shell integration.</td>
                        <td>Exit code: any, zero (success), non-zero (failure), or a specific value.</td>
                        <td>\1 = exit code</td>
                </tr>
                <tr>
                        <td>Directory Changed</td>
                        <td>The working directory changes.</td>
                        <td>Regular expression matching the directory path.</td>
                        <td>\1 = new directory</td>
                </tr>
                <tr>
                        <td>Host Changed</td>
                        <td>You connect to a different host (for example, via SSH).</td>
                        <td>Regular expression matching the hostname.</td>
                        <td>\1 = new host</td>
                </tr>
                <tr>
                        <td>User Changed</td>
                        <td>The current user changes (for example, su or sudo).</td>
                        <td>Regular expression matching the username.</td>
                        <td>\1 = new user</td>
                </tr>
                <tr>
                        <td>Idle (Silence)</td>
                        <td>No output is received for the specified duration.</td>
                        <td>Timeout in seconds (default 30).</td>
                        <td>\1 = timeout in seconds</td>
                </tr>
                <tr>
                        <td>Activity After Idle</td>
                        <td>Output resumes after the session was idle.</td>
                        <td>Timeout in seconds that defines "idle" (default 30).</td>
                        <td>None</td>
                </tr>
                <tr>
                        <td>Session Ended</td>
                        <td>The session terminates.</td>
                        <td>None</td>
                        <td>None</td>
                </tr>
                <tr>
                        <td>Bell Received</td>
                        <td>A terminal bell (\a) is received.</td>
                        <td>None</td>
                        <td>None</td>
                </tr>
                <tr>
                        <td>Long-Running Command</td>
                        <td>A command has been running longer than the threshold.</td>
                        <td>Threshold in seconds (default 60) and an optional regular expression matching the command line.</td>
                        <td>\1 = command, \2 = elapsed seconds</td>
                </tr>
                <tr>
                        <td>Custom Escape Sequence</td>
                        <td>A custom escape sequence is received.</td>
                        <td>Regular expression matching the sequence identifier.</td>
                        <td>\1 = identifier, \2 = payload</td>
                </tr>
                <tr>
                        <td>Notification Posted</td>
                        <td>A notification is posted by a control sequence (OSC 9).</td>
                        <td>Regular expression matching the notification message.</td>
                        <td>\1, \2, ... = notification text values</td>
                </tr>
                <tr>
                        <td>Progress Bar Changed</td>
                        <td>A progress bar appears or disappears.</td>
                        <td>Fire when the bar appears, disappears, or either.</td>
                        <td>\1 = "appeared" or "disappeared"</td>
                </tr>
                <tr>
                        <td>Job Started</td>
                        <td>A process matching the job filter enters the foreground-job ancestry chain.</td>
                        <td>Job: process name to watch for (case-insensitive). Required.</td>
                        <td>\1 = job name</td>
                </tr>
                <tr>
                        <td>Job Ended</td>
                        <td>A process matching the job filter leaves the foreground-job ancestry chain.</td>
                        <td>Job: process name to watch for (case-insensitive). Required.</td>
                        <td>\1 = job name</td>
                </tr>
                <tr>
                        <td>Variable Changed</td>
                        <td>A session variable changes value.</td>
                        <td>Variable name to watch, plus an optional regular expression the new value must match.</td>
                        <td>\1 = new value, \2 = variable name</td>
                </tr>
        </tbody>
</table>

#### Example
The [iTerm2-zmodem](https://github.com/RobberPhex/iTerm2-zmodem) project demonstrates hooking up iTerm2 to zmodem upload and download.

