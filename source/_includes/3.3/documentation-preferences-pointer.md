## Pointer
<hr>

#### Mouse Button and Trackpad Gesture Actions
You may assign custom actions to mouse clicks and trackpad gestures. The left mouse button is not configurable because its behavior is rather complex, however. This is especially useful if you have a mouse with many buttons. Any combination of mouse button + number of clicks + modifiers may be assigned an action. For gestures, three finger taps and swipes may be configured in combination with modifiers. The following actions are available:

  * *Extend selection* - The text selection will grow, either from its beginning or end, to the location of the pointer.
  * *Move pane* - The current pane will turn green. Click in another window's tab bar or in another pane to split to move the now-green pane.
  * *New Horizontal/Vertical split with profile* - The pane under the pointer will be split and the new split will use the specified profile.
  * *New Split/Tab/Window With Profile* - A new split pane/tab/window will be opened with the specified profile.
  * *Next/Previous Tab/Window* - Navigates through tabs and windows.
  * *Open Context Menu* - Opens the menu normally opened by a right click.
  * *Open URL in background* - Opens the URL under the pointer in your web browser without bringing the browser to the foreground.
  * *Open URL/Semantic History* - Opens the URL under the pointer, bringing the web browser to the foreground. If what's under the cursor is a filename on the local machine, it will be opened with Semantic History.
  * *Paste from Clipboard* - Pastes the contents of the pasteboard (like *Edit > Paste*) but you can also configure advanced paste settings.
  * *Paste from Selection* - Pastes the most recent selection made in iTerm2, even if it's not what's in the pasteboard. Allows you to configure advanced paste settings.
  * *Quicklook* - Defines the word under the cursor or, if it's a URL, opens it in a web browser popover.
  * *Select Next/Previous Pane* - Navigates panes according to how recently they were used.
  * *Select pane Above/Below/Left/Right* - Navigates panes by their layout.
  * *Send Escape Sequence...* - This action allows you to enter some text that will be sent when the associated key is pressed. First, the ESC character is sent, and then the text you entered is sent.
  * *Send Hex Code* - This action allows you to enter a sequence of hex codes that will be sent. Each value should begin with "0x" followed by one or two hex digits (0-9, a-f, or A-F). Each code should be separated by a space. You can see a list of hex codes on http://asciitable.com/ in the "Hx" column.
  * *Send Text* - This action allows you to enter a text string that will be sent when the associated key is pressed. The following escape characters are supported: \n (newline), \e (escape), \a (bell), \t (tab).
  * *Smart Selection* - Performs smart selection on the text under the pointer.
  * *Smart Selection ignoring Newlines* - Performs smart selection on the text under the pointer, ignoring newlines (e.g., if a URL is split by a hard newline, it can still be selected as a single item).

<hr/>

#### Cmd-Click Opens Filename/URL
If enabled, then clicking on a filename (of an existing file on the local machine) or a URL will open it.

#### Ctrl-click reported to apps, does not open menu
If enabled, ctrl-click will be sent to applications that support Xterm mouse reporting (if mouse reporting is enabled).

#### Option-Click moves cursor
If enabled, option-click will move the cursor to where the mouse pointer is. If you install shell integration, this will be well-behaved at the shell prompt by not sending up and down arrow keys.

#### Focus follows mouse
If enabled, moving the mouse over an inactive window will cause it to receive keyboard focus.

#### Double-click performs smart selection
If enabled, double click performs smart selection instead of word selection as is standard on macOS.

#### Triple-click selects full wrapped lines
If enabled, a triple click selects a whole line, even if it was longer than one row in the terminal. If off, then triple click selects exactly one row.

#### Three-finger tap reports middle click to apps
If enabled, a three-finger tap acts like a middle click for the purposes of mouse reporting.

