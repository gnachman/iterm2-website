iTerm2 has a collection of shell scripts that help you take advantage of some of its unique features. When you install <a href="documentation-shell-integration.html">Shell Integration</a> from the **iTerm2 > Install Shell Integration** menu, you're asked if you'd like to install the Utilities Package as well. This page describes these utilities.

If you prefer to install only the utilities (without also installing Shell Integration) you can find them <a href="https://github.com/gnachman/iTerm2-shell-integration/tree/main/utilities">here</a>. Most of the utilities work without Shell Integration.
 
### Components

The Utilities Package contains the following programs:

#### imgcat

The `imgcat` program displays images inline in your terminal.

<img src="/images/inline_image_sparky_demo.png">

It supports all standard image formats, including animated GIFs.

Usage:

`imgcat filename [filename...]`

or

`cat image | imgcat`

#### imgls

Lists the files in a directory with thumbnail previews for images.

Usage:

`imgls [filename...]`

#### it2attention

Requests attention. Can bounce the dock icon or show a fireworks animation at the application cursor position.

Usage:

<ul>
<li>`it2attention start`
<br/>
Begin bouncing the dock icon if another app is active
</li>

<li>`it2attention stop`
<br/>
Stop bouncing the dock icon if another app is active
</li>
<li>
`it2attention fireworks`
<br/>
how an explosion animation at the cursor
</li>
</ul>

#### it2check

Checks if the terminal emulator is iTerm2.

Example:

<pre>
it2check && echo This is iTerm2 || echo This is not iTerm2
</pre>

#### it2copy

Copies text to the pasteboard. Works over ssh. Accepts either standard input or a named file.

Examples:

<pre>
cat file.txt | it2copy
it2copy file.txt
</pre>

For this to work you must enable **Prefs > General > Applications in terminal may access clipboard**.

#### it2dl

The `it2dl` program downloads files. This is useful when you are ssh'ed to a remote host. The downloaded files are placed in your *Downloads* folder.

#### it2getvar

Fetches a session variable. For information about variables, see <a href="documentation-scripting-fundamentals.html">Scripting Fundamentals</a>.

Example:

<pre>
it2getvar session.name
</pre>

#### it2setcolor

Configures iTerm2's colors.

Usage:

<ol>
<li>To set a specific color to an RGB value:
<pre>
  it2setcolor name color [name color...]
</pre>
For example:
<pre>
  it2setcolor fg fff
</pre>

name is one of:
<ul>
<li>`fg`</li>
<li>`bg`</li>
<li>`bold`</li>
<li>`link`</li>
<li>`selbg`</li>
<li>`selfg`</li>
<li>`curbg`</li>
<li>`curfg`</li>
<li>`underline`</li>
<li>`tab`</li>
<li>`black`</li>
<li>`red`</li>
<li>`green`</li>
<li>`yellow`</li>
<li>`blue`</li>
<li>`magenta`</li>
<li>`cyan`</li>
<li>`white`</li>
<li>`br_black`</li>
<li>`br_red`</li>
<li>`br_green`</li>
<li>`br_yellow`</li>
<li>`br_blue`</li>
<li>`br_magenta`</li>
<li>`br_cyan`</li>
<li>`br_white`</li>
</ul>

color is of the format:
<ul>
<li>`RGB`       (three hex digits, like fff)</li>
<li>`RRGGBB`    (six hex digits, like f0f0f0)</li>
<li>`cs:RGB`    (cs is a color space name)</li>
<li>`cs:RRGGBB` (cs is a color space name)</li>
</ul>

The color space names accepted in the color are:
<ul>
<li>`srgb`      (sRGB, the default if none is specified)</li>
<li>`rgb`       (Apple's old device-independent colorspace)</li>
<li>`p3`        (Apple's fancy large-gamut colorspace)</li>
</ul>
</li>

<li>To switch to a named color preset:
<pre>
  it2setcolor preset name
</pre>

For example:
<pre>
  it2setcolor preset 'Light Background'
</pre>
</li>

<li>To reset the current tab's color to the system default:
<pre>
  it2setcolor tab default
</pre>
</li>

#### it2setkeylabel

Configures touch bar function key labels.

Usage:

<ul>
<li>`it2setkeylabel set Fn Label`<br/>
     Where n is a value from 1 to 20</li>
<li>`it2setkeylabel set status Label`<br/>
     Sets the Touch Bar "status" button's label</li>
<li>`it2setkeylabel push [name]`<br/>
     Saves the current labels with an optional name. Resets labels to their default value, unless name begins with a . character.</li>
<li>`it2setkeylabel pop [name]`<br/>
     If name is given, all key labels up to and including the one with the matching name are popped.</li>
</ul>

Recommended usage for customizing an application is to set key labels and then push with a *name* of a concatenation of the app's name (e.g., "emacs") and a random number. When the app exists, pop to that same name.

#### it2ul

Uploads a file. Works over ssh.

Usage:

<pre>
it2ul [destination [tar flags]]
</pre>

If given, the `destination` specifies the directory to place downloaded files.
Further options are passed through to tar. See your system's manpage for tar for details.

If used without arguments, the file goes to the current directory. When you run this, you'll be prompted to select one or more files. Next, iTerm2 creates a `tar.gz` file containing those files and base-64 encodes them. The it2ul script receives it, decodes it, and untars it with `-xzfC`. Any arguments you provide go after a lone `-` argument,

#### it2universion

Sets the unicode version for the current session. The key difference is that unicode 8 and unicode 9 use different width tables for emoji. Most apps aren't updated to use the unicode 9 tables, but Unicode 9 produces nicer results with fewer overlapping characters.

Usage:

<ul>
<li>`it2universion set 8`</li>
<li>`it2universion set 9`</li>
<li>`it2universion push [name]`<br/>
     Saves the current version with an optional `name`.</li>
<li>`it2universion pop [name]`<br/>
     If `name` is given, all versions up to and including the one with the matching name are popped.</li>
</ul>

#### it2dl

Usage:

<pre>
it2dl filename
</pre>

### Location

The Utilities Package places shell scripts in `$HOME/.iterm2/` and creates aliases to them at the bottom of `$HOME/.iterm2_shell_integration.$SHELL`.

