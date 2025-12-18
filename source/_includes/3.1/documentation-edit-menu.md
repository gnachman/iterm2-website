#### Edit > Undo Close Session/Tab/Window
After you close a session, tab, or window then you have five seconds to undo it. The amount of time is configurable in PReferences > Profiles > Session.

#### Edit > Copy (With Styles)
Hold down Option to turn Copy into Copy With Styles, which includes fonts and color information in the copied text.

#### Edit > Copy Mode
Enters *Copy Mode* which lets you make selections using the keyboard. See <a href="documentation-copymode.html">Copy Mode</a> for details.

#### Edit > Paste Special > Advanced Paste
This opens the Advanced Paste window which lets you select a string from the pasteboard in recent history, select different representations of the current pasteboard, and modify the string before pasting it. You can modify it by applying a regex substitution, using various built-in modifiers (such as base-64 encoding), or edit it by hand.

#### Edit > Paste Special > Paste Selection
Pastes the currently selected text (which may differ from the text in the pasteboard).

#### Edit  > Paste Special > Paste File Base64-Encoded
If there is a file on the pasteboard then this is enabled. When invoked, it base64-encodes the file and pastes the encoded value.

#### Edit > Paste Special > Paste Escaping Special Characters
"Paste Escaping Special Characters" pastes the current string in the clipboard, but places a backslash before spaces and backslashes.

#### Edit > Paste Special > Paste Slowly
"Paste Slowly" pastes the current string in the clipboard, but it doesn't send the whole string at once. It is sent in batches of 16 bytes with a 125ms delay between batches.

#### Edit > Paste Special > Paste Faster/Slower
Adjusts the speed of pasting to be faster or slower.

#### Edit > Paste Special > Paste Slowly Faster/Slower
Adjusts the speed of slow pasting to be faster or slower. You must hold down option for this menu item to be visible.

#### Edit > Paste Special > Warn Before Multi-Line Paste
When enabled, you'll be warned before pasting more than one line.

#### Edit > Paste Special > Limit Multi-Line Paste To Shell Prompt
If *Warn Before Multi-Line Paste* is on, then this restricts it to warn only when you're at the shell prompt. It only works if shell integration is installed, since otherwise iTerm2 cannot tell when you're at the shell prompt.

#### Edit > Paste Special > Warn Before Pasting One Line Ending in a Newline at Shell Prompt
This requires shell integration to be installed to work. If you try to paste one line that ends in a newline while at the shell prompt and this is enabled, you'll get a confirmation dialog before the text is pasted.

#### Edit > Selection Respects Soft Boundaries
When enabled, vertical lines of pipe characters `|` will be interpreted as pane dividers (as in vim or emacs) and selection will wrap at them.

#### Edit > Select Output of Last Command
Requires shell integration to be installed. Selects the output of the last command.

#### Edit > Select Current Command
Requires shell integration to be installed. Selects the text of the current command entered at the command prompt.

#### Edit > Find > Find
Opens or focuses the find panel. Select the down arrow to the left of the search field to open the options menu, which lets you select case insensitivity and regular expression options. The default case sensitivity option of "Smart Case Sensitivity" performs a case-sensitive search if the search query contains any upper case letters. Otherwise, a case-insensitive search is performed.

#### Edit > Find > Find URLs
Searches the current session for URLish looking strings.

#### Edit > Marks and Annotations > Set Mark
Records the current scroll position. Use Edit > Jump to Mark to restore the scroll position.

#### Edit > Marks and Annotations > Add Annotation at Cursor
Adds an annotation to the word beginning at the cursor. An annotation is a scratchpad for you to write notes about a chunk of text in your history.

#### Edit > Marks and Annotations > Alerts > Alert on Next Mark
When a mark is set (typically by <a href="documentation-shell-integration.html">Shell Integration</a> when the currently running shell command terminates) then show an alert. 

#### Edit > Clear Buffer
Clears the last screenful of the terminal.

### Edit > Clear Scrollback Buffer
Clears the entire terminal history.

