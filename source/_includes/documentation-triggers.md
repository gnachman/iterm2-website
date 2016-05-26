A trigger is an action that is performed when text matching some regular expression is received in a terminal session.

#### How to Create a Trigger
To create a trigger, open the **Preferences** panel. Select the **Profiles** tab. Choose the profile to which you wish to add a trigger. Then select the **Advanced** tab. Click the **Edit** button in the **Triggers** section. A panel opens that displays any existing triggers. You can click the **+** button to add a new trigger.

Triggers have a regular expression, an action, an optional parameter, and may be marked as *Instant*.

#### Regular Expression
Regular expressions conform to the <a href="http://userguide.icu-project.org/strings/regexp">ICU regular expressions</a> rules. Text that is written to the screen including the BEL control code are sent to the regex matcher for evaluation. Only one line at a time is matched. By default, matching is performed when a newline or cursor-moving escape code is processed. Lines longer than 1024 characters are truncated at the 1024th character for performance reasons.

#### Actions
The following actions are available:
<ul>
        <li>Bounce Dock Icon: Makes the dock icon bounce until the iTerm2 window becomes key.</li>
        <li>Capture Output: Save the line to the Captured Output toolbelt tool. See <a href="captured_output.html">Captured Output</a>. The parameter is text to send (as though it had been typed) when you double-click on an entry in the Captured Output tool.</li>
        <li>Highlight Text: The text matching the regex in the trigger will change color. The parameter sets the color.</li>
        <li>Open Password Manager: Opens the password manager. You can specify which account to select by default.</li>
        <li>Post Notification: Posts a notification with Growl (if available) or Notification Center.</li>
        <li>Report Directory: Tells iTerm2 what your current directory is. You can use this to enable <a href="shell_integration.html">Shell Integration</a> features without installing the scripts. The parameter is your current directory.</li>
        <li>Report User & Host: Tells iTerm2 what your user or host name is. You can use this to enable <a href="shell_integration.html">Shell Integration</a> features without installing the scripts. To specify just a user name, say `user@`. For just a host, say `@host`. For both, say `user@host`.</li>
        <li>Ring Bell: Plays the standard system bell sound once.</li>
        <li>Run Command: Runs a user-defined command.</li>
        <li>Run Coprocess: Runs a <a href="coprocesses.html">Coprocess</a>.</li>
        <li>Send Text: Sends user-defined text back to the terminal as though the user had typed it.</li>
        <li>Set Mark: Sets a mark. You can specify whether you'd like the display to stop scrolling after the trigger fires.</li>
        <li>Show Alert: Shows an alert box with user-defined text.</li>
        <li>Stop Processing Triggers: When this action is invoked no triggers further down the list will be invoked for the current text.</li>
</ul>

#### Parameter?
Various actions (Run Command, Run Coprocess, Send Growl Alert, Send Text, and Show Alert) require additional information. This is specified in the "Parameters" field. When the paramter is a text field with freeform entry, some special values are defined:
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
When <i>Instant</i> is set, the trigger will fire once per line as soon as the match occurs, without waiting for a newline. This was added for the benefit of the <i>Open Password Manager</i> trigger, since password prompts usually are not followed by a newline. This may cause certain regular expressions (for example, ".*") to match less than they otherwise might.

#### Example
The <a href="https://github.com/mmastrac/iterm2-zmodem">iTerm2-zmodem</a> project demonstrates hooking up iTerm2 to zmodem upload and download.

