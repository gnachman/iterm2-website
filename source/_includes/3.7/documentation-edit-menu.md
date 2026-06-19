#### Edit > Undo Close Session/Tab/Window
After you close a session, tab, or window then you have five seconds to undo it. The amount of time is configurable in Settings > Profiles > Session.

#### Edit > Copy (With Styles)
Hold down Option to turn Copy into Copy With Styles, which includes fonts and color information in the copied text.

#### Edit > Copy with Control Sequences
Copies the selected text, including control sequences that will reproduce the appearance (bold, colors, etc.) of the copied text when pasted into a terminal. Note that these will not be exactly the control sequences that were originally received, but instead a reconstruction that has the same effect.

#### Edit > Copy Mode
Enters *Copy Mode* which lets you make selections using the keyboard. See <a href="documentation-copymode.html">Copy Mode</a> for details.

#### Edit > Paste Special > Advanced Paste
This opens the Advanced Paste window which lets you select a string from the pasteboard in recent history, select different representations of the current pasteboard, and modify the string before pasting it. You can modify it by applying a regex substitution, using various built-in modifiers (such as base-64 encoding), or edit it by hand.

#### Edit > Paste Special > Paste Selection
Pastes the currently selected text (which may differ from the text in the pasteboard).

#### Edit > Paste Special > Paste File Base64-Encoded
If there is a file on the pasteboard then this is enabled. When invoked, it base64-encodes the file and pastes the encoded value.

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

#### Edit > Paste Special > Prompt to Convert Tabs to Spaces when Pasting
If *Prompt to Convert Tabs to Spaces when Pasting* is enabled, you'll be asked whether to convert tabs to spaces when pasting text containing tab characters.

#### Edit > Paste Special > Warn Before Pasting One Line Ending in a Newline at Shell Prompt
This requires shell integration to be installed to work. If you try to paste one line that ends in a newline while at the shell prompt and this is enabled, you'll get a confirmation dialog before the text is pasted.

#### Edit > Replace Selection > Render Selection Natively
Replaces the selection with a native rendering. For example, Markdown is replaced with formatted text with different font sizes, weights, etc.

#### Edit > Replace Selection > Replace with Pretty-Printed JSON
Replaces the selection with nicely formatted JSON. You can click in the margin to collapse sections.

#### Edit > Replace Selection > Replace with Base 64-Encoded/Decoded Value
Replaces the selection by encoding or decoding its value. Note the selection must be an entire line, not a portion of a line.

#### Edit > Engage Artificial Intelligence
Passes the value at the cursor to AI as a prompt. If there is no value, you'll be asked to provide a prompt. If you have shell integration installed and keyboard focus is on the terminal, then iTerm2 will use what you've typed so far at the command prompt as the input to the AI.

#### Edit > Explain Output with AI
This is available when there is a selection or a selected command. That text will be sent to AI to explain. The terminal contents will be modified, adding annotations detailing what parts of the text mean. The chat window will open so you can drill down more.

#### Edit > Snippets
Gives access to Snippets, which are saved bits of text that can be pasted quickly. You can change snippets in **Prefs&gt;Shortcuts&gt;Snippets**.

#### Edit > Actions
Gives access to Actions, which are user-defined actions similar to those that can be bound to a keystroke. You can change actions in **Prefs&gt;Shortcuts&gt;Actions**.

#### Edit > Open Selection
Opens the selected text using semantic history or as a URL, if it is URL-like.

#### Edit > Jump to Selection
Scrolls the selection to be visible.

#### Edit > Selection Respects Soft Boundaries
When enabled, vertical lines of pipe characters `|` will be interpreted as pane dividers (as in vim or emacs) and selection will wrap at them.

#### Edit > Select Output of Last Command
Requires shell integration to be installed. Selects the output of the last command.

#### Edit > Select Current Command
Requires shell integration to be installed. Selects the text of the current command entered at the command prompt.

#### Edit > Find > Find
Opens or focuses the find panel. Select the down arrow to the left of the search field to open the options menu, which lets you select case insensitivity and regular expression options. The default case sensitivity option of "Smart Case Sensitivity" performs a case-sensitive search if the search query contains any upper case letters. Otherwise, a case-insensitive search is performed.

#### Edit > Find > Find Next/Previous
Next and previous are, by default, reversed from the macOS standard because in a terminal you generally want to search backwards. You can use **Settings > Advanced > Swap Find Next and Find Previous** to get the standard behavior.

#### Edit > Find > Find Globally
Opens a window that lets you search all tabs at once.

#### Edit > Find > Select Matches
Converts Find matches into selections.

#### Edit > Find > Find URLs
Searches the current session for URLish looking strings.

#### Edit > Find > Find All Smart Selection Matches
Searches for all smart selection regular expressions at once.

#### Edit > Find > Pick Result to Open
Shows a shortcut next to each find match. Typing the shortcut opens it using smart selection or, if it is URL-like, using the default URL handler.

#### Edit > Find > Filter
Opens a panel where you can enter text to filter by. Non-matching lines are temporarily hidden until the filter panel is closed.

#### Edit > Marks and Annotations > Set Mark
Records the current scroll position. Use Edit > Jump to Mark to restore the scroll position.

#### Edit > Marks and Annotations > Jump to Mark
Makes the last mark (either created by **Set Mark** or by shell integration) visible by scrolling to it.

#### Edit > Marks and Annotations > Next/Previous Mark
Reveals the next/previous mark by scrolling and highlighting it in blue or red (red if it was tagged as a failing command).

#### Edit > Marks and Annotations > Add Annotation at Cursor
Adds an annotation to the word beginning at the cursor. An annotation is a scratchpad for you to write notes about a chunk of text in your history.

#### Edit > Marks and Annotations > Next/Previous Annotations
Reveals the next/previous annotation.

Adds an annotation to the word beginning at the cursor. An annotation is a scratchpad for you to write notes about a chunk of text in your history.
#### Edit > Marks and Annotations > Alerts > Alert on Next Mark
When a mark is set (typically by <a href="documentation-shell-integration.html">Shell Integration</a> when the currently running shell command terminates) then show an alert. 

#### Edit > Marks and Annotations > Alerts > Alert on Marks in Offscreen Sessions
When disabled, **Alert on Next Mark** alerts even if the session is not currently visible. When enabled, only visible sessions (those that are in a non-hidden window in a selected tab) will alert.

#### Edit > Clear Buffer
Clears the entire terminal history and the mutable area.

#### Edit > Clear Instant Replay
Erases instant replay history for the current session.

### Edit > Clear Scrollback Buffer
Clears scrollback history, preserving the mutable area.

#### Edit > Clear to Start Of Selection
Erases text between the start of the selection and the end.

#### Edit > Clear to Last Mark
Erases text between the last mark and the end.

