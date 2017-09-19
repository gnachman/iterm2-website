As with many applications, you may customize the controls on the touch bar with **View > Customize Touch Bar**. The following controls are available:

#### Man Page

Opens the manpage for the command behind the cursor.

#### Color Preset

When selected, this opens a scrollable list of color presets. Choosing one changes the current terminal's colors to use the preset.

#### Function Keys

There are two function keys controls. The first, labeled *Function Keys Popover*, opens a scrollable list of function keys when pressed. It is compact but requires two taps to press a function key. The second, labeled *Function Keys*, shows a scrollable list of function keys at all times. It takes more space but is quicker to use.

If you install <a href="https://www.iterm2.com/documentation-shell-integration.html">Shell Integration</a> and <a href="https://www.iterm2.com/documentation-utilities.html">Utilities</a>, then you'll get a command *it2setkeylabel* that lets you configure what each function key's label says. You can configure each application you use (such as vim or emacs) to set the labels appropriately.

#### Add Mark

The *Add Mark* touch bar control saves the current location in history. You can navigate among marks with Cmd-Shift-Up and Cmd-Shift-Down. There are also touch bar controls to navigate marks.

#### Next/Previous Mark

Navigates to the next or previous mark. If you have <a href="https://www.iterm2.com/documentation-shell-integration.html">Shell Integration</a> installed, each command prompt inserts a mark, so the previous mark is usually the previous shell prompt.

#### Autocomplete Suggestions

If you have <a href="https://www.iterm2.com/documentation-shell-integration.html">Shell Integration</a> installed, iTerm2 can remember you command history. That history is used to make suggestions for commands, which appear in this touch bar control.

#### Status

The status touch bar control shows a user-configurable message. If you install <a href="https://www.iterm2.com/documentation-shell-integration.html">Shell Integration</a> and <a href="https://www.iterm2.com/documentation-utilities.html">Utilities</a>, then you'll get a command *it2setkeylabel* that lets you configure what the status control says. For example, it could display the git branch of the current directory. Tapping it scrolls to the location where the status was last changed.

#### Custom Buttons
You can define custom touch bar buttons in **Prefs > Keys > Add Touch Bar Item**. You can then add the item to you touch bar from **View > Customize Touch Bar**.
