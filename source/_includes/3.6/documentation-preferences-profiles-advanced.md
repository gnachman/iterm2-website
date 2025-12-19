### Profiles > Advanced

#### Triggers
Triggers are actions that are performed when text matching a regular expression is received. Each trigger has a regular expression, which defines when it runs. It has an action, which defines what it performs, and it has an optional parameter, whose meaning depends on the action. When the parameter is textual, \0 is replaced with the entire match, and \1...\9 are replaced with match groups. Each trigger has a checkbox in the "Instant" column. Instant triggers run as soon as text matching the regular expression is matched; triggers that are not instant only match after the cursor moves off the current line (such as whena newline is received).

Full details can be found at <a href="documentation-triggers.html">Triggers</a>.

#### Smart Selection
[Smart Selection](/documentation-smart-selection.html) defines regular expressions that are used to select text on quad-click. 

#### Automatic Profile Switching
You can specify rules that, when satisfied, changes any session's profile to this one. See <a href="documentation-automatic-profile-switching.html">Automatic Profile Switching</a> for all the details.
</p>

#### Snippets Filter
The Snippets feature lets you save a collection of strings to re-send later on. Each snippet may have one or more tags associated with it. If you would like to show only certain snippets when working in a particular profile, you can name tags in the Snippets Filter that are required for a snippet to be available in the context of a session with this profile.

#### Semantic History
Semantic history is used to open a file when you Cmd-Click on it. The current working directory for each line in the terminal is tracked to help find files. If Semantic History is set to "Open with default app," then files are passed to the OS to be opened with whatever is associated. Alternatively, you can choose "Open URL..." to open a specific URL (with \1 replaced with the filename and \2 replaced with the line number, if applicable). If you choose "Open with editor..." then text files will be opened with the designated editor, while other files are opened with the default app for their file type. For more flexibility, choose "Run command..." and specify a command to execute. \1 will be replaced with the file name, \2 will be replaced with the line number (if applicable), \3 with text in the line prior to the click location, \4 with text in the line subsequent to the click location, and \5 for the working directory of the line clicked on. Finally, "Always run command..." is like "Run command...," but takes effect even if the object clicked on is not an existing filename.

