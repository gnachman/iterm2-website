## Profiles
### Keys
This panel shows key mappings. You can double-click on a mapping to edit it. When the "Keyboard Shortcut" field has focus, you should press the keystroke that you want to modify (even if it involves modifiers like Cmd). The following actions are available:

  * *Ignore* - The keypress will do nothing.
  * *Do not remap modifiers* - If modifier remapping is in effect (set under **Preferences > Keys**), it can be disabled for certain key combinations. When you choose this action, modifier remapping is temporarily disabled so you can press the key combination unremapped in the key field.
  * *Remap modifiers in iTerm2 only* - If modifier remapping is in effect (set under **Preferences > Keys**), it can be set to not affect other applications that may listen for global hotkeys. When you choose this action, modifier remapping is temporarily disabled so you can press the key combination unremapped in the key field.
  * *New Window with Profile* - Creates a new window with a profile you specify here.
  * *New Tab with Profile* - Creates a new tab with a profile you specify here.
  * *Duplicate Tab* - Creates another tab exactly like the current one.
  * *Move Session to Split Pane* - After invoking this, click a different session. The current pane will be moved to share half its former space.
  * *Split horizontally/vertically with Profile* - Creates a new split pane by cleaving the current session. Uses the profile you specify here.
  * *
  * *Change Profile* - This action changes the profile of the current session.
  * *Load Color Preset* - This action changes the colors of the current session using the specified preset.
  * *Split/New Window/Tab with Profile* - These actions allow you to create a new session with a specified profile when a key is pressed.
  * *Start Instant Replay* - This is equivalent to the menu item **View > Start Instant Replay**.
  * *Cycle Tabs Forward/Backward* - This implements tab switching the same way Cmd-Tab (or Cmd-Shift-Tab) switches windows, with the most-recently-used stack.
  * *Next/Previous Tab/Window/Pane* - These actions navigate among tabs, windows, and split panes.
  * *Move tab left/right* - Changes the tab's position in the order.
  * *Next/Previous Window* - Selects the next or previous window in window order.
  * *Next/Previous Pane* - Selects the next or previous pane in left-to-right, top-to-bottom order.
  * *Increase/Decrease Width/Height* - Changes the size of the current session.
  * *Scroll to End/Top/Up/Down* - These actions move through the scrollback buffer.
  * *Select Split Pane Above/Below/Left/Right* - These actions navigate split panes.
  * *Swap Split Pane Above/Below/Left/Right* - Exchanges the current session with an adjacent session in a split pane in the same tab.
  * *Send ^? / ^H Backspace* - Modern systems use ^? for backspace, while some legacy systems use ^H.
  * *Send Escape Sequence* - This action allows you to enter some text that will be sent when the associated key is pressed. First, the ESC character is sent, and then the text you entered is sent. There are no special characters and no escaping is necessary.
  * *Send Hex Code* - This action allows you to enter a sequence of hex codes that will be sent. Each value should begin with "0x" followed by one or two hex digits (0-9, a-f, or A-F). Each code should be separated by a space. You can see a list of hex codes on http://asciitable.com/ in the "Hx" column.
  * *Send Text* - This action allows you to enter a text string that will be sent when the associated key is pressed. The following escape characters are supported: \n (newline), \e (escape), \a (bell), \t (tab).
  * *Send Text with "vim" Special Characters* - This action allows you to enter a text string that will be sent when the associated key is pressed. The following special sequences are supported, where the "." characters are placeholders: \... (three-digit octal number), \.. (two-digit octal number; must be followed by non-digit), \. (one-digit octal number; must be followed by non-digit), \x.. (two-digit hex number), \x. (one-digit hex number), \u.... (four-digit hex number), \b (backspace), \e (escape), \f (form feed), \n (newline), \r (carriage return), \t (tab), \\ (backslash), \" (double quote), \\\<C-.> (control key), \\\<M-.> (meta key)
  * *Find Regular Expression* - Performs a search for a saved regular expression.
  * *Find Again Up/Down* - Repeats the search, finding the next result at an earlier/later position.
  * *Undo* - Invokes the Undo action. Could be used to undo closing a session/tab/window.
  * *Paste* - Like **Edit > Paste**, but you can set advanced paste preferences to use.
  * *Paste From Selection* - Like **Edit > Paste and Edit > Paste Special > Paste Selection**, but you can set advanced paste preferences to use.
  * *Toggle Fullscreen* - This action enters or exits full screen mode.
  * *Toggle Pin Hotkey Window* - Toggles whether the hotkey window hides when it loses focus.
  * *Toggle Mouse Reporting* - Temporarily enable or disable mouse reporting.
  * *Run Coprocess* - This action launches a Coprocess. <a href="documentation-coprocesses.html">Learn more about coprocesses</a>.
  * *Move Start/End of Selection Back/Forward* - Adjusts the range of selected text.
  * *Invoke Script Function* - Calls a function registered by a script. See <a href="documentation-scripting-fundamentals.html">Scripting Fundamentals</a> for details on functions.
  * *Select Menu Item...* - This action allows you to enter the name of an iTerm2 menu item. It must be entered exactly the same as it appears in the menu. Ellipses can be typed with option-semicolon.


You can add a new keymapping by pressing "+". You can remove an existing mapping by selecting it and pressing "-". Three presets are provided: "Xterm defaults" is the normal key mappings, while "Xterm defaults with numeric keypad" disables the "application keypad" in favor of the numbers and symbols that the numeric keypad typically emits. "Terminal.app Compatibility" tries to emulate the way that Terminal.app sends keys by default.

#### Delete sends ^H
If you are on a legacy system that does not accept ^? for backspace, select this and it will add a key mapping for you.

#### Allow Application Keypad Mode
Some full-screen programs (like emacs) switch the keyboard into application keypad mode, which changes how the numeric keypad behaves. Disabling this option causes iTerm2 to never enter application keypad mode.

#### Report modifiers using CSI u
Enables a more powerful keyboard reporting algorithm that some applications may use to enable the use of modifiers on more keys and more combinations of modifiers.

#### Left/Right Option Key Acts As
It is common to use a modifier to send so-called "meta keys". For most users, selecting "+Esc" here is the right choice. The "Meta" option sets the high bit of the input character, and is not compatible with modern systems.

#### A hotkey opens a dedicated window with this profile
When enabled, a dedicated hotkey window is attached to this profile. The **Configure Hotkey Window** button lets you configure the hotkey and other attributes of the window. For more information, see <a href="documentation-hotkey.html">Hotkey Windows</a>.


