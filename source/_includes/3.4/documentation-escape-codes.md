iTerm2 supports several non-standard escape codes. These may not work properly in tmux or screen, and may have unknown effects on other terminal emulators. Proceed with caution.

The control sequences use the following notation:

* `ESC` means "Escape" (hex code 0x1b) .
* `ST` means either `BEL` (hex code 0x07) or `ESC \\`.
* Spaces in control sequences are to be ignored.
* Values in [brackets] are variable parameters, not literals.
* `OSC` means `ESC ]`
* `CSI` means `ESC [`
* `SP` means a literal "space" character (not ignored!)

The OSC command `50` used to be used but it conflicts with xterm, so it is now `1337`.

#### Report Foreground/Background Colors (OSC 4)

The xterm-defined OSC 4 control sequence has a mode where it reports the RGB
value of a color. iTerm2 extends its reporting mode to add two additional color
indices representing the default foreground and background color.

To get the background color:

    OSC 4 ; -2; ? ST

And this gets the foreground color:

    OSC 4 ; -1 ; ? ST

For background and foreground respectively, the terminal will write back:

    OSC 4 ; -2 ; rgb : [red] / [green] / [blue] ST
    OSC 4 ; -1 ; rgb : [red] / [green] / [blue] ST

Where `[red]`, `[green]`, and `[blue]` are either 2 or 4-digit hex values like `14a7`
or `ff`. For 4-digit values, you can get an approximation of the 2-digit value
by taking the first two digits.

#### Anchor (OSC 8)

VTE and iTerm2 support OSC 8 for defining hyperlinks, much like HTML's anchor tag.

    OSC 8 ; [params] ; [url] ST

`[params]` consists of zero or more colon-delimited key-value pairs. A key-value pair is formatted as **key=value**. The only currently defined key is **id**. Two adjacent hyperlinks with the same URL but different **id**s will highlight separately when Command is pressed during hover.

If the **url** is absent then that ends the hyperlink. Typical usage would look like:

    OSC 8 ; ; https://example.com/ ST Link to example website OSC 8 ; ; ST

To open a link, hold Command and click the link.

Note: in iTerm2 version 3.4 and later, if the URL has the `file` scheme and
a `#` fragment is present then the semantic history rules will apply for
opening the file. It may optionally include a line number, like
`file:///tmp/file.txt#123` or line number and column number like
`file:///tmp/file.txt#123:45`.

#### Set cursor shape

    OSC 1337 ; CursorShape=[N] ST

where `[N]`=0, 1, or 2.
<ul>
        <li>0: Block</li>
        <li>1: Vertical bar</li>
        <li>2: Underline</li>
</ul>
Add this to your `.vimrc` to change cursor shape in insert mode:

    let &t_SI = "\<Esc>]1337;CursorShape=1\x7"
    let &t_EI = "\<Esc>]1337;CursorShape=0\x7"

This is derived from <a href="https://vim.wikia.com/wiki/Change_cursor_shape_in_different_modes">Konsole</a>.
#### Set Mark
The "Set Mark" (cmd-shift-M) command allows you to record a location and then jump back to it later (with cmd-shift-J). The following escape code has the same effect as that command:

    OSC 1337 ; SetMark ST

#### Steal Focus
To bring iTerm2 to the foreground:

    OSC 1337 ; StealFocus ST

#### Clear Scrollback History
To erase the scrollback history:

    OSC 1337 ; ClearScrollback ST

#### Set current directory
To inform iTerm2 of the current directory to help semantic history:

    OSC 1337 ; CurrentDir=[current directory] ST

#### Post a notification
To post a notification:

    OSC 9 ; [Message content goes here] ST

#### Change profile
To change the session's profile on the fly:

    OSC 1337 SetProfile=[new profile name] ST

#### Copy to clipboard
There are three ways to copy text to the clipboard for reasons that have been lost to history.

**OSC 1337 CopyToClipboard**

This method allows you to copy to various macOS-specific pasteboards. This is probably not useful to you unless you have very specialized needs. It is also the worst in terms of backwards compatibility because other terminals will simply display the text you wished to copy.

To place text in the pasteboard:

    OSC 1337 ; CopyToClipboard=[clipboard name] ST

Where name is one of "rule", "find", "font", or empty to mean the general pasteboard (which is what you normally want). After this is sent, all text received is placed in the pasteboard until this code comes in:

    OSC 1337 ; EndCopy ST

**OSC 1337 Copy**

This is an alternative to OSC 52. The implementation is a bit more efficient for very large values.

You can place a string in the system's pasteboard with this sequence:

    OSC 1337 ; Copy=:[base64] ST

Where `[base64]` is the base64-encoded string to copy to the pasteboard.

**OSC 52**

This is not a proprietary control sequence. It's probably your best choice since it'll work with other terminal emulators.

To write to the pasteboard:

    OSC 52 ; Pc ; [base64 encoded string] ST

The `Pc` parameter is ignored. xterm uses it to choose among various clipboards, most of which do not exist in macOS.

In version 3.5 and later, iTerm2 supports the sequence to query the clipboard:

    OSC 52 ; Pc ; ? ST

The clipboard contents are reported with:

    OSC 52 ; Pc; [base64 encoded string] ST

Where Pc is the same as in the request.

User consent is required both to read and write the pasteboard.


#### Set window title and tab chrome background color
To set the window title and tab color use this escape sequence:

    OSC 6 ; 1 ; bg ; red ; brightness ; [N] ST
    OSC 6 ; 1 ; bg ; green ; brightness ; [N] ST
    OSC 6 ; 1 ; bg ; blue ; brightness ; [N] ST

Replace `[N]` with a decimal value in 0 to 255.

Example in bash that turns the background purple:

    echo -e "\033]6;1;bg;red;brightness;255\a"
    echo -e "\033]6;1;bg;green;brightness;0\a"
    echo -e "\033]6;1;bg;blue;brightness;255\a"

To reset the window title and tab color, use this code:

    OSC 6 ; 1 ; bg ; * ; default ST

For example:

    echo -e "\033]6;1;bg;*;default\a"

#### Change the color palette

To change the current session's colors use this code:

    OSC 1337 ; SetColors=[key]=[value] ST

`[key]` gives the color to change. The accepted values are: fg bg bold link selbg selfg curbg curfg underline tab" black red green yellow blue magenta cyan white br\_black br\_red br\_green br\_yellow br\_blue br\_magenta br\_cyan br\_white

`[value]` gives the new color. The following formats are accepted:

  * RGB (three hex digits, like `fff`)
  * RRGGBB (six hex digits, like `f0f0f0`)
  * cs:RGB (like RGB but `cs` gives a color space)
  * cs:RRGGBB (like RRGGBB but `cs` gives a color space)

If a color space is given, it should be one of:

  * srgb (the standard sRGB color space)
  * rgb (the device-specific color space)
  * p3 (the standard P3 color space, whose gamut is supported on some newer hardware)

The following alternate schemes are also supported:
  * If `key` is `preset` then `value` should be the name of a color preset.
  * If `key` is `tab` then a value of `default` removes the tab color and restores it to the system default.

A second escape sequence is also supported, but its use is not recommended:

    OSC P [n] [rr] [gg] [bb] ST

Replace `[n]` with:
<ul>
        <li>`0`-`f` (hex) = ansi color</li>
        <li>`g` = foreground</li>
        <li>`h` = background</li>
        <li>`i` = bold color</li>
        <li>`j` = selection color</li>
        <li>`k` = selected text color</li>
        <li>`l` = cursor</li>
        <li>`m` = cursor text</li>
</ul>
`[rr]`, `[gg]`, `[bb]` are 2-digit hex value (for example, "ff").
Example in bash that changes the foreground color blue:

    echo -e "\033]Pg4040ff\033\\"

#### Annotations

To add an annotation use on of these sequences:

    OSC 1337 ; AddAnnotation=[message] ST
    OSC 1337 ; AddAnnotation=[length] | [message] ST
    OSC 1337 ; AddAnnotation=[message] | [length] | [x-coord] | [y-coord] ST
    OSC 1337 ; AddHiddenAnnotation=[message] ST
    OSC 1337 ; AddHiddenAnnotation=[length] | [message] ST
    OSC 1337 ; AddHiddenAnnotation=[message] | [length] | [x-coord] | [y-coord] ST

<ul>
<li>`[message]`: The message to attach to the annotation.</li>
<li>`[length]`: The number of cells to annotate. Defaults to the rest of the line beginning at the start of the annotation.</li>
<li>`[x-coord]` and `[y-coord]`: The starting coordinate for the annotation. Defaults to the cursor's coordinate.</li>
</ul>

*AddHiddenAnnotation* does not reveal the annotation window at the time the escape sequence is received, while *AddAnnotation* opens it immediately.

#### Cursor Guide

    OSC 1337 ; HighlightCursorLine=[boolean] ST

The `[boolean]` should be `yes` or `no`. This shows or hides the cursor guide.

#### Attention

    OSC 1337 ; RequestAttention=[value] ST

The `[value]` should be `yes` to request attention by bouncing the dock icon indefinitely, `once` to bounce it a single time, or `no` to cancel a previous request. If it is `fireworks` then fireworks explode at the cursor's location. 


#### Background Image

    OSC 1337 ; SetBackgroundImageFile=[base64] ST

The value of `[base64]` is a base64-encoded filename to display as a background image. If it is an empty string then the background image will be removed. User confirmation is required as a security measure.

#### Report Cell Size

    OSC 1337 ; ReportCellSize ST

The terminal responds with either:

    OSC 1337 ; ReportCellSize=[height];[width] ST

Or, in newer versions:

    OSC 1337 ; ReportCellSize=[height];[width];[scale] ST

`[scale]` gives the number of pixels (physical units) to points (logical units). 1.0 means non-retina, 2.0 means retina. It could take other values in the future.

`[height]` and `[width]` are floating point values giving the size in points of a single character cell. For example:

    OSC 1337 ; ReportCellSize=17.50;8.00;2.0 ST

#### Report Variable

Each iTerm2 session has internal variables (as described in <a href="documentation-scripting-fundamentals.html">Scripting Fundamentals</a>). This escape sequence reports a variable's value:

    OSC 1337 ; ReportVariable=[base64] ST

Where `[base64]` is a base64-encoded variable name, like `session.name`. It responds with:

    OSC 1337 ; ReportVariable=[base64] ST

Where `[base64]` is a base64-encoded value.

#### Badge

The badge has custom escape sequences described <a href="documentation-badges.html">here</a>.

#### Downloads

For information on file downloads and inline images, see <a href="documentation-images.html">here</a>.

#### Uploads

To request the user select one or more files to upload, send:

    OSC 1337 ; RequestUpload=format=[type] ST

In the future the `[type]` may be configurable, but for now it must always be `tgz`, which is a tar and gzipped file.

When iTerm2 receives this it will respond with a status of `ok` or `abort` followed by a newline. If the status is `ok` then it will be followed by a base-64 encoded tar.gz file.

If the user selects multiple files they will be placed in a directory within the tar file.

#### Set Touch Bar Key Labels

You can configure touch bar key labels for function keys and for the "status" button. The code used is:

    OSC 1337 ; SetKeyLabel=[key]=[value] ST

Where `[key]` is one of `F1`, `F2`, ..., `F24`, to adjust a function key label; or it can be `status` to adjust the touch bar status button. You can also save and restore sets of key labels using a stack. To push the current key labels on the stack use:

    OSC 1337 ; PushKeyLabels ST

To pop them:

    OSC 1337 ; PopKeyLabels ST

You can optionally label the entry in the stack when you push so that pop will pop multiple sets of key labels if needed. This is useful if a program crashes or an ssh session exits unexpectedly. The corresponding codes with labels are:

    OSC 1337 ; PushKeyLabels=[label] ST
    OSC 1337 ; PopKeyLabels=[label] ST

Where `[label]` is an ASCII string that works best if it is unique in the stack.

#### Unicode Version

iTerm2 by default uses Unicode 9's width tables. The user can opt to use Unicode 8's tables with a preference (for backward compatibility with older locale databases). Since not all apps will be updated at the same time, you can tell iTerm2 to use a particular set of width tables with:

    OSC 1337 ; UnicodeVersion=[n] ST

Where `[n]` is 8 or 9

You can push the current value on a stack and pop it off to return to the previous value by setting `n` to `push` or `pop`. Optionally, you may affix a label after `push` by setting `n` to something like `push mylabel`. This attaches a label to that stack entry. When you pop the same label, entries will be popped until that one is found. Set `n` to `pop mylabel` to effect this. This is useful if a program crashes or an ssh session ends unexpectedly.

#### File Transfer

   OSC 1337 ; File=[args] ST

See <a href="documentation-images.html">Images</a> for details.

#### Custom Control Sequences

iTerm2 allows scripts to define custom control sequences. See the <a href="https://iterm2.com/python-api/examples/create_window.html">Create Window</a> example for a working demo. The control sequence is:

    OSC 1337 ; Custom=id=[secret]:[pattern] ST

Where `[secret]` is a secret shared between the script implementing the control
sequence and the program producing it, as a security measure to make it more
difficult for untrusted text to invoke a custom control sequence. `[pattern]` is
used to identify the sequence and may contain any parameters the script needs
to handle it.

## Shell Integration/FinalTerm

iTerm2's <a href="documentation-shell-integration.html">Shell Integration</a> feature is made
possible by proprietary escape sequences pioneered by the FinalTerm emulator.
FinalTerm is defunct, but the escape sequences are documented here.

### Concepts

The goal of the FinalTerm escape sequences is to mark up a shell's output with
semantic information about where the prompt begins, where the user-entered
command begins, and where the command's output begins and ends.

**[PROMPT]**prompt% **[COMMAND_START]** ls -l<br>
**[COMMAND_EXECUTED]**<br>
-rw-r--r--  1 user group   127 May  1  2016 filename<br>
**[COMMAND_FINISHED]**

### Escape Sequences

FinalTerm originally defined various escape sequences in its original spec that
are not supported by iTerm2 and are not described in this document. The best
remaining references to these codes are in iTerm2's source code.

#### FTCS_PROMPT

    OSC 133 ; A ST

Sent just before start of shell prompt.

#### FTCS_COMMAND_START

    OSC 133 ; B ST

Sent just after end of shell prompt, before the user-entered command.

#### FTCS_COMMAND_EXECUTED

    OSC 133 ; C ST

Sent just before start of command output. All text between `FTCS_COMMAND_START`
and `FTCS_COMMAND_EXECUTED` at the time `FTCS_COMMAND_EXECUTED` is received
excluding terminal whitespace is considered the command the user entered. It is
expected that user-entered commands will be edited interactively, so the screen
contents are captured without regard to how they came to contain their state.
If the cursor's location is before (above, or if on the same line, left of) its
location when `FTCS_COMMAND_START` was received, then the command will be
treated as the empty string.

#### FTCS_COMMAND_FINISHED

    OSC 133 ; D ; [Ps] ST
    OSC 133 ; D ST

The interpretation of this command depends on which `FTCS` was most recently
received prior to `FTCS_COMMAND_FINISHED`.

This command may be sent after `FTCS_COMMAND_START` to indicate that a command
was aborted. All state associated with the preceding prompt and the command
until its receipt will be deleted. Either form is accepted for an abort. If the
`[Ps]` argument is provided to an abort it will be ignored.

If this command is sent after `FTCS_COMMAND_EXECUTED`, then it indicates the
end of command prompt. Only the first form with `[Ps]` should be used in this
case. `[Ps]` is the command's exit status, a number in the range
0-255 represented as one or more ASCII decimal digits. A status of 0 is
considered "success" and nonzero indicates "failure." The terminal may choose
to indicate this visually.

If neither `FTCS_COMMAND_START` nor `FTCS_COMMAND_EXECUTED` was sent prior to
`FTCS_COMMAND_FINISHED` it should be ignored.

### iTerm2 Extensions

iTerm2 extends FinalTerm's suite of escape sequences.

#### SetUserVar

    OSC 1337 ; SetUserVar=[Ps1]=[Ps2] ST

Sets the value of a user-defined variable. iTerm2 keeps a dictionary of
key-value pairs which may be used within iTerm2 as string substitutions.
See <a href="documentation-scripting-fundamentals.html">Scripting
Fundamentals</a> for more information on variables and how they can be used.

`[Ps1]` is the key.

`[Ps2]` is the base64-encoded value.

#### ShellIntegrationVersion

Two forms are accepted. The second form is deprecated and should not be used:

    OSC 1337 ; ShellIntegrationVersion=[Pn] ; [Ps] ST
    OSC 1337 ; ShellIntegrationVersion=[Pn] ST

Reports the current version of the shell integration script.

`[Pn]` is the version.

`[Ps]` is the name of the shell (e.g., `bash`).

iTerm2 has a baked-in notion of the "current" version and if it sees a lower
number the user will be prompted to upgrade. The version number is specific to
the shell.

#### RemoteHost

    OSC 1337 ; RemoteHost=[Ps1]@[Ps2] ST

Reports the user name and hostname.

`[Ps1]` is username.
`[Ps2]` is fully-qualified hostname.

The following synonym is available as a combination of RemoteHost and CurrentDir:

    OSC 7 [Ps] ST

where `[Ps]` is a file URL with a hostname and a path, like `file://example.com/usr/bin`.

#### CurrentDir

    OSC 1337 ; CurrentDir=[Ps1] ST

Reports the current directory.

`[PS1]` is the current directory.

The following synonym is available as a combination of RemoteHost and CurrentDir:

    OSC 7 ; [Ps] ST

where `[Ps]` is a file URL with a hostname and a path, like `file://example.com/usr/bin`.

#### ClearCapturedOutput

    OSC 1337 ; ClearCapturedOutput ST

Erases the current captured output.

#### DECSCUSR 0

    CSI 0 SP q 

This will reset the cursor to its default appearance. This is an intentional deviation from the behavior of DEC virtual terminals.

#### Curly Underlines

    CSI 4 : 3 m

This turns on curly underlines.

#### Extended Device Attributes

Report terminal name and version.

    CSI > q

iTerm2 will respond with:

    ESC P > | iTerm2 [version] ST

Where [version] is the version of iTerm2, such as `3.4.0`.
