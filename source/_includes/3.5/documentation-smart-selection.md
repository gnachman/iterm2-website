iTerm2 offers a Smart Selection feature that simplifies making selections on semantically recognizable objects.
#### How do I use Smart Selection?
A quad-click (four clicks of the left mouse button in quick succession) activates Smart Selection at the mouse cursor's position. By default, the following kinds of strings are recognized:
<ul>
        <li>Words bounded by whitespace or line boundaries.</li>
        <li>C++-style pairs of identifiers separated by double colons, such as "namespace::identifier".</li>
        <li>Filesystem paths, such as "/foo/bar/baz.txt".</li>
        <li>Quoted strings such as "foo bar".</li>
        <li>Java or Python-style include paths, such as "foo.bar.baz".</li>
        <li>URIs with the schemes: mailto, http, https, ssh, or telnet.</li>
        <li>Objective-C selectors like "@selector(foo:bar:)".</li>
        <li>Email addresses.</li>
</ul>
#### How do I Change Smart Selection Rules?
Under Settings>Profiles>Advanced, you may edit the smart selection rules. In addition to a regular expression, each rule also has a Precision attribute, which takes a value of Very Low, Low, Normal, High, or Very High. Intuitively, it refers to how sure one can be that when a rule's regular expression finds a match that it is what the user intended. For example, the "Word" rule is low precision (it matches almost every time), while the "HTTP URL" rule is very high precision (it almost never produces false positives). This allows the "HTTP URL" rule to take precedence when both match, unless the "Word" rule matches a much longer string. That might happen, for instance, if there were a non-URL character after a URL followed by a lot more text. The precision levels have a very strong effect, so it's very rare for a lower precision rule to take precedence over a higher precision rule.

When editing rules, it is advised that you experiment with different precision levels and different kinds of strings to find one that works well. A collection of test cases may be found at smart_selection_cases.txt.

When Smart Selection is activated, iTerm2 tries each regular expression. For a given regex, various strings on the screen are tested until the longest match is found. Only matches that include the character under the cursor are of interest. The longest such match is added to a pool of "selection candidates". Each candidate is assigned a score equal to its length in characters. Among the candidates in the highest precision class (where Very High is the highest class and Very Low is the lowest) with any matches, the higheset scoring one is used as the selection.

#### Actions
Actions may be associated with smart selection rules. When you right click in a terminal, smart selection is performed at the cursor's location. Any smart selection rule that matches that location will be searched for associated actions, and those actions will be added to the context menu. A cmd-click on text matching a smart selection rule will invoke the first rule.

Each action has a parameter, which is an [interpolated string](documentation-scripting-fundamentals.html). The use of the parameter is dependent on the action. For example, it may give the name of a file, the value of a string, or the command to act on.

The following actions are defined:

 * Open File: Opens the file using the default system application.
 * Open URL: Opens the URL using the default system browser.
 * Run Command: Runs the command using `/bin/sh -c` in the background. Output goes to the Script Console.
 * Run Coprocess: Starts a [coprocess](documentation-coprocesses.html).
 * Send Text: Sends text as though it was typed by the user.
 * Run Command in Window: Opens a new window and runs the command in it.
 * Copy: Copies the string to the pasteboard.

</ul>

#### Regular Expressions
Regular expressions conform to the <a href="https://unicode-org.github.io/icu/userguide/strings/regexp.html">ICU regular expressions</a> rules.
