iTerm2 supports several non-standard escape codes. These may not work properly in tmux or screen, and may have unknown effects on other terminal emulators. Proceed with caution.

A quick comment on notation: in this document, ^[ means "Escape" (hex code 0x1b) and ^G means "bel" (hex code 0x07).

The OSC command `50` used to be used but it conflicts with xterm, so it is now `1337`.

#### Set cursor shape

    ^[]1337;CursorShape=N^G

where N=0, 1, or 2.
<ul>
        <li>0: Block</li>
        <li>1: Vertical bar</li>
        <li>2: Underline</li>
</ul>
Add this to your .vimrc to change cursor shape in insert mode:

    let &t_SI = "\<Esc>]1337;CursorShape=1\x7"
    let &t_EI = "\<Esc>]1337;CursorShape=0\x7"

This is derived from <a href="http://vim.wikia.com/wiki/Change_cursor_shape_in_different_modes">Konsole</a>.
#### Set Mark
The "Set Mark" (cmd-shift-M) command allows you to record a location and then jump back to it later (with cmd-shift-J). The following escape code has the same effect as that command:

    ^[]1337;SetMark^G

#### Steal Focus
To bring iTerm2 to the foreground:

    ^[]1337;StealFocus^G

#### Clear Scrollback History
To erase the scrollback history:

    ^[]1337;ClearScrollback^G

#### Set curent directory
To inform iTerm2 of the current directory to help semantic history:

    ^[]1337;CurrentDir=/the/current/directory^G

#### Post a Growl notification
To post a Growl notification:

    ^[]9;Message content goes here^G

This will have no effect if Growl is not running.

#### Change profile
To change the session's profile on the fly:

    ^[]1337;SetProfile=NewProfileName^G

#### Copy to clipboard
To place text in the pasteboard:

    ^[]1337;CopyToClipboard=name^G

Where name is one of "rule", "find", "font", or empty to mean the general pasteboard (which is what you normally want). After this is sent, all text received is placed in the pasteboard until this code comes in:

    ^[]1337;EndCopy^G

#### Set window title and tab chrome background color
To set the window title and tab color use this escape sequence:

    ^[]6;1;bg;red;brightness;N^G
    ^[]6;1;bg;green;brightness;N^G
    ^[]6;1;bg;blue;brightness;N^G

Replace N with a decimal value in 0 to 255.

Example in bash that turns the background purple:

    echo -e "\033]6;1;bg;red;brightness;255\a"
    echo -e "\033]6;1;bg;green;brightness;0\a"
    echo -e "\033]6;1;bg;blue;brightness;255\a"

To reset the window title and tab color, use this code:

    ^[]6;1;bg;*;default^G

For example:

    echo -e "\033]6;1;bg;*;default\a"

#### Change the color palette
    ^[]Pnrrggbb^[\
Replace "n" with:
<ul>
        <li>0-f (hex) = ansi color</li>
        <li>g = foreground</li>
        <li>h = background</li>
        <li>i = bold color</li>
        <li>j = selection color</li>
        <li>k = selected text color</li>
        <li>l = cursor</li>
        <li>m = cursor text</li>
</ul>
rr, gg, bb are 2-digit hex value (for example, "ff").
Example in bash that changes the foreground color blue:

    echo -e "\033]Pg4040ff\033\\"

#### Annotations

To add an annotation use on of these sequences:

    ^[]1337;AddAnnotation=message^G
    ^[]1337;AddAnnotation=length|message^G
    ^[]1337;AddAnnotation=message|length|x-coord|y-coord^G
    ^[]1337;AddHiddenAnnotation=message^G
    ^[]1337;AddHiddenAnnotation=length|message^G
    ^[]1337;AddHiddenAnnotation=message|length|x-coord|y-coord^G

<ul>
<li>message: The message to attach to the annotation.</li>
<li>length: The number of cells to annotate. Defaults to the rest of the line beginning at the start of the annotation.</li>
<li>x-coord and y-coord: The starting coordinate for the annotation. Defaults to the cursor's coordinate.</li>
</ul>

*AddHiddenAnnotation* does not reveal the annotation window at the time the escape sequence is received, while *AddAnnotation* opens it immediately.

#### Cursor Guide

    ^[]1337;HighlightCursorLine=boolean^G

The *boolean* should be *yes* or *no*. This shows or hides the cursor guide.

#### Attention

    ^[]1337;RequestAttention=boolean^G

The boolean should be *yes* to request attention by bouncing the dock icon and *no* to cancel a previous request.

#### Background Image

    ^[]1337;SetBackgroundImageFile=base64^G

The value of *base64* is a base64-encoded filename to display as a background image. If it is an empty string then the background image iwll be removed. User confirmation is required as a security measure.

#### Report Cell Size

    ^[]1337;ReportCellSize^G

The terminal responds with:

    ^[]1337;ReportCellSize=height;width^G

Where *height* and *width* are floating point values giving the size in points of a single character cell. For example:

    ^[]1337;ReportCellSize=17.50;8.00^[\

#### Badge

The badge has custom escape sequences described at <a href="badges.html">.

#### Downloads

For information on file downloads and inline images, see <a href="images.html">.

#### Shell Integration/FinalTerm

The FinalTerm-derived escape sequences used for Shell Integration are described in the <a href="finalterm.html">FinalTerm Escape Sequences</a> document.

