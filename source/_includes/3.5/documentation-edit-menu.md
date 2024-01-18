#### Edit > Undo Close Session/Tab/Window
After you close a session, tab, or window then you have five seconds to undo it. The amount of time is configurable in PReferences > Profiles > Session.

#### Edit > Copy (With Styles)
Hold down Option to turn Copy into Copy With Styles, which includes fonts and color information in the copied text.

#### Edit > Copy with Control Sequences
Copies the selected text, including control sequences that will reproduce the appearance (bold, colors, etc.) of the copied text when pasted into a terminal. Note that these will not be exactly the control sequences that were originally received, but instead a reconstruction that has the same effect.

#### Edit > Copy Mode
Enters *Copy Mode* which lets you make selections using the keyboard. See <a href="documentation-copymode.html">Copy Mode</a> for details.

#### Edit > Paste Special > Advanced Paste
This opens the Advanced Paste window which lets you select a string from the pasteboard in recent history, select different representations of the current pasteboard, and modify the string before pasting it. You can modify it by appling a regex substitution, using various built-in modifiers (such as base-64 encoding), or edit it by hand.

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

#### Edit > Paste Special > Prompt to Convert Tabs to Spaces When Pasting
When enabled, you'll be asked how many spaces to convert tabs to (or whether to convert at all) when pasting a string containing tab characters.

#### Edit > Paste Special > Limit Multi-Line Paste To Shell Prompt
If *Warn Before Multi-Line Paste* is on, then this restricts it to warn only when you're at the shell prompt. It only works if shell integration is installed, since otherwise iTerm2 cannot tell when you're at the shell prompt.

#### Edit > Paste Special > Warn Before Pasting One Line Ending in a Newline at Shell Prompt
This requires shell integration to be installed to work. If you try to paste one line that ends in a newline while at the shell prompt and this is enabled, you'll get a confirmation dialog before the text is pasted.

#### Edit > Render Selection
Replace the selection with a natively rendered view. For example, markdown can be rendered with proper fonts. This also allows you to enable horizontal scrolling of the rendered area, which is useful for viewing logs.

#### Edit > Engage Artificial Intelligence
Opens the Composer with the output of an AI system. If the composer is already open, the contents of the composer are used as the natural language request. Otherwise, it uses the current selection or the current command. For example, you could write "Create a zip file of the current directory" at the command line and then Engage Artifical Intelligence to open the composer with the appropriate command. You'll be prompted to provide an OpenAI API key the first time you use this, since this uses ChatGPT's API which is not free.

#### Edit > Snippets
Gives access to Snippets, which are saved bits of text that can be pasted quickly. You can change snippets in **Prefs&gt;Shortcuts&gt;Snippets**.

#### Edit > Actions
Gives access to Actions, which are user-defined actions similar to those that can be bound to a keystroke. You can change actions in **Prefs&gt;Shortcuts&gt;Actions**.

#### Edit > Open Selection
Open the selected URL.

#### Edit > Jump to Selection
Scroll to the selected text.

#### Edit > Select All
Select all text. If the selected area is really large, it will be added to the system pasteboard in the background to avoid hanging the app.

#### Edit > Selection Respects Soft Boundaries
When enabled, vertical lines of pipe characters `|` will be interpreted as pane dividers (as in vim or emacs) and selection will wrap at them.

#### Edit > Select Output of Last Command
Requires shell integration to be installed. Selects the output of the last command.

#### Edit > Select Current Command
Requires shell integration to be installed. Selects the text of the current command entered at the command prompt.

#### Edit > Find > Find
Opens or focuses the find panel. Select the down arrow to the left of the search field to open the options menu, which lets you select case insensitivity and regular expression options. The default case sensitivity option of "Smart Case Sensitivity" performs a case-sensitive search if the search query contains any upper case letters. Otherwise, a case-insensitive search is performed.

#### Edit > Find > Find Next/Previous
Note that the direction of next and previous is reversed relative to the standard macOS search direction. If you prefer for *Next* to mean down and *Previous* to mean up, set *Preferences>Advanced>Swap Find Next and Find Previous* to *No*.

#### Edit > Find > Find Globally
Opens a window that lets you search all tabs at once.

#### Edit > Find > Select Matches
Convert find matches to selections.

#### Edit > Find > Find URLs
Searches the current session for URLish looking strings.

#### Edit > Pick Result to Open
Assigns a number to each visible search result and the terminal enters a mode where you can type that number to open a search result assuming it's a URL.

#### Edit > Find > Filter
Opens the filter panel, where you can enter a phrase to hide lines that do not contain that phrase.

#### Edit > Marks and Annotations > Set Mark
Records the current scroll position. Use Edit > Jump to Mark to restore the scroll position.

#### Edit > Marks and Annotations > Jump to Mark
Scrolls to the location of the last mark.

#### Edit > Marks and Annotations > Next/Previous Mark
Navigates to the next or previous mark.

#### Edit > Marks and Annotations > Add Annotation at Cursor
Adds an annotation to the word beginning at the cursor. An annotation is a scratchpad for you to write notes about a chunk of text in your history.

#### Edit > Marks and Annotations > Next/Previous Annotation
Navigates to the next or previous annotation.

#### Edit > Marks and Annotations > Alerts > Alert on Next Mark
When a mark is set (typically by <a href="shell_integration.html">Shell Integration</a> when the currently running shell command terminates) then show an alert. 
#### Edit > Marks and Annotations > Alerts > Alert on Marks in Offscreen Sessions
Controls whether you get alerts for marks in sessions in other tabs.

#### Edit > Set Named Mark
Assigns a name to the current scroll position.

#### Edit > Named Marks
Lists the named marks. Selecting one scrolls to it.

#### Edit > Clear Buffer
Clears the entire terminal history and the mutable area.

#### Edit > Clear Instant Replace
Erase the instant replay buffer.

#### Edit > Clear Scrollback Buffer
Clears scrollback history, preserving the mutable area.

#### Edit > Clear to Start of Selection
Clears between the start of selection and the end of the buffer.

#### Edit > Clear to Last Mark
Clears from the last mark to the end of the buffer.
