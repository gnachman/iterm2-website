Copy Mode allows you to make selections using the keyboard. To enter or exit Copy Mode, select *Edit &gt; Copy Mode*. You can also enter copy mode by pressing Shift+Arrow key immediately after making a selection with the mouse. A special cursor rendered as a downward-pointing arrow is visible while in Copy Mode. 

While in Copy Mode, the session's contents will not change. You can use the keyboard to move the cursor and modify the selection.

Like in vim, by entering a number prior to a command, you can repeat the command. For example, `5l` moves the cursor right five times.

You can customize the shortcuts by placing a file in `~/Library/Application Support/iTerm2/CopyModeKeyBindings.dict`. Its format is similar to that of macOS's `DefaultKeyBindings`. [Here's the default configuration which you can use to build your own](https://github.com/gnachman/iTerm2/blob/master/OtherResources/iTermCopyModeKeyBindings.dict).

### Changing Modes

<table style="background: white">
  <tr class="tableheader">
    <th style="width: 100pt">Keystroke</th>
    <th>Action</th>
  </tr>
  <tr><td>`Control-Space`</td><td>Toggle selection</td></tr>
  <tr><td>`Control-c, Control-g, q, Esc`</td><td>Exit copy mode</td></tr>
  <tr><td>`Control-v`</td><td>Toggle rectangular selection</td></tr>
  <tr><td>`Space, v`</td><td>Toggle selection by character</td></tr>
  <tr><td>`V`</td><td>Toggle selection by line</td></tr>
</table>

### Basic movement

<table style="background: white">
  <tr class="tableheader">
    <th style="width: 100pt">Keystroke</th>
    <th>Action</th>
  </tr>
  <tr><td>`h, Left Arrow`</td><td>Move left</td></tr>
  <tr><td>`j, Down Arrow`</td><td>Move down</td></tr>
  <tr><td>`k, Up Arrow`</td><td>Move up</td></tr>
  <tr><td>`l, Right Arrow`</td><td>Move right</td></tr>
</table>

### Content-based movement

<table style="background: white">
  <tr class="tableheader">
    <th style="width: 100pt">Keystroke</th>
    <th>Action</th>
  </tr>
  <tr><td>`Option-b, Option-Left Arrow, Shift-tab, b`</td><td>Move backward by one word</td></tr>
  <tr><td>`Option-f, Option-Right Arrow, Tab, w`</td><td>Move forward by one word</td></tr>
  <tr><td>`B`</td><td>Move backward by one word plus punctuation</td></tr>
  <tr><td>`W`</td><td>Move forward by one word plus punctuation</td></tr>
  <tr><td>`[`</td><td>Move to previous mark</td></tr>
  <tr><td>`]`</td><td>Move to next mark</td></tr>
</table>

### Screen movement

<table style="background: white">
  <tr class="tableheader">
    <th style="width: 100pt">Keystroke</th>
    <th>Action</th>
  </tr>
  <tr><td>`Page Up, Control-b`</td><td>Page up</td></tr>
  <tr><td>`Page Down, Control-f`</td><td>Page down</td></tr>
  <tr><td>`Control-d`</td><td>Page down by half a screen</td></tr>
  <tr><td>`Control-u`</td><td>Page up by half a screen</td></tr>
  <tr><td>`H`</td><td> Move to the top of the visible area</td></tr>
  <tr><td>`L`</td><td>Move to the bottom of the visible area</td></tr>
  <tr><td>`M`</td><td>Move to the center of the visible area</td></tr>
</table>

### Line movement

<table style="background: white">
  <tr class="tableheader">
    <th style="width: 100pt">Keystroke</th>
    <th>Action</th>
  </tr>
  <tr><td>`Return`</td><td>Move to the start of the next line</td></tr>
  <tr><td>`Control-e`</td><td>Scroll down without moving cursor</td></tr>
  <tr><td>`Control-y`</td><td>Scroll up without moving cursor</td></tr>
  <tr><td>`Option-m, ^`</td><td>Move to start of indented line</td></tr>
  <tr><td>`0, Cmd-left arrow`</td><td>Move to start of line</td></tr>
  <tr><td>`Cmd-right arrow, $`</td><td>Move to end of line</td></tr>
</table>

### Document movement

<table style="background: white">
  <tr class="tableheader">
    <th style="width: 100pt">Keystroke</th>
    <th>Action</th>
  </tr>
  <tr><td>`Cmd-Home, Cmd-Up, Home, g`</td><td>Move to start</td></tr>
  <tr><td>`Cmd-End, Cmd-Down, End, G`</td><td>Move to end</td></tr>
</table>

### Other commands

<table style="background: white">
  <tr class="tableheader">
    <th style="width: 100pt">Keystroke</th>
    <th>Action</th>
  </tr>
  <tr><td>`Control-k, y`</td><td>Copy selection</td></tr>
  <tr><td>`o`</td><td>Swap cursor and other selection endpoint</td></tr>
  <tr><td>`/`</td><td>Show Find panel</td></tr>
</table>

