## Deprecation Warning

AppleScript in iTerm2 is deprecated. It will continue to receive bug fixes, but new features will not be added. Please see the <a href="/python-api">Python API docs</a> for a much better alternative.

Note: AppleScript support is in maintenance mode. New code should use the <a href="/python-api">Python API</a> if possible.

### AppleScript
iTerm2 features AppleScript support which allows you to automate many aspects of its behavior. Quite a bit of customization is also possible by writing shell scripts.

iTerm2 has sophisticated AppleScript support allowing one to write stand-alone scripts to launch the application and open multiple sessions with profiles into either new tabs or new windows. You can also set some other parameters for a session such as foreground and background colors, and transparency.

These scripts can then be saved as stand-alone executable applications.

#### Autolaunching Scripts
iTerm2 also supports autolaunching of an AppleScript on startup. On startup, iTerm2 looks for an AppleScript file in "~/Library/Application Support/iTerm2/Scripts/AutoLaunch.scpt". If it is found, the "AutoLaunch.scpt" script is launched and executed.

If that folder does not exist, the legacy path of "~/Library/Application Support/iTerm/Scripts/AutoLaunch.scpt" will be used.

#### User-Defined Scripts
iTerm2 also supports launching of user defined scripts from the "Scripts" menu. The scripts need to be stored under the ~/Library/Application Support/iTerm/Scripts directory. You can create this directory if it does not already exist. iTerm2 checks this directory on startup. Scripts must be named with the extension .scpt or .app.

# Reference

## Objects

The basic objects are: window, tab, and session. The application has zero or more windows, each window has one or more tabs, and each tab has one or more sessions. Multiple sessions in a tab happen when there are split panes.

<hr/>
### Application

The application exposes various properties and provides functions that are described in this section. For example:

    tell application "iTerm2"
      create window with default profile
    end tell

#### Bridges to Python API

<p class="script-entry">invoke API expression "<i>expression</i>"<br/>
Invokes a Python API expression. This creates a bridge from AppleScript to the <a href="/python-api">Python API</a>. You can use it to call a <a href="https://iterm2.com/python-api/tutorial/rpcs.html">registered RPC</a>, or to evaluate other kinds of expressions used in the Python API, such as <a href="documentation-variables.html">variables</a> in the global scope.

Example:

    invoke API expression "myRegisteredFunction()"

<p class="script-entry">launch API script named "<i>name</i>"<br/>
Runs a script. The *name* can specify any script in the **Scripts** menu. First, it searches for a script with that exact path relative to `~/Library/Application Support/iTerm2/Scripts`. Then it tries again, but ignores the path extension (like `.py`). Then it tries again, but only searches the file's base name (like `helloworld.py`). Finally, it tries again searching only the base name without path extension (like `helloworld`).

Example:

    launch API script named "helloworld"

#### Other Application-Level Actions

<p class="script-entry">create hotkey window with profile "<i>name</i>"<br/>
Creates a hotkey window with the specified profile. The profile must be configured to have a hotkey.

Example:

    create hotkey window with profile "Hotkey Window"

<p class="script-entry">create window with default profile<br/>
create window with default profile command "<i>command</i>"</p>

These commands create a window with the default profile. If you specify a command, it overrides the profile's command (which by default is to invoke `login`).

Examples:

    set newWindow to (create window with default profile)
    set newWindow to (create window with default profile command "ls -l -R /")

<p class="script-entry">create window with profile "<i>name</i>"<br/>
create window with profile "<i>name</i>" command "<i>command</i>"</p>

These commands create a window with a named profile. If you specify a command, it overrides the profile's command (which by default is to invoke `login`).

Returns a reference to the new window.

Examples:

    set newWindow to (create window with profile "Name Of Some Profile")
    set newWindow to (create window with profile "Name Of Some Profile" command "ls -l -R /")


<p class="script-entry">current window</p>

A reference to the window that most recently had keyboard focus.

    tell current window
    ...
    end tell

<p class="script-entry">windows</p></p>

A `windows` property exposes an array of terminal windows. Other windows, like the preferences panel, are not included.
The following are standard AppleScript idioms for accessing elements of an array of objects:

    tell first window
    ...
    end tell

    repeat with aWindow in windows
    ...
    end repeat

<hr/>
### Windows

These functions and properties are provided by windows. For example:

    tell application "iTerm2"
      tell current window
        create tab with default profile
      end tell
    end tell

There are many standard AppleScript functions (e.g., to get the window's size and position) that are not documented here.

<p class="script-entry">create tab with default profile<br/>
create tab with default profile command "<i>command</i>"
create tab with profile "<i>name</i>"</br>
create tab with profile "<i>name</i>" command "<i>command</i>"
</p>

Creates a tab with the default profile or a profile by name. If the command is specified, it is run instead of the profile's command/login shell.

Returns a reference to the new tab.

<p class="script-entry">current session</p>

The `current session` is the session that would receive keyboard input if the window had keyboard focus.

<p class="script-entry">current tab</p>

The `current tab` is the tab that is selected in the window.

<p class="script-entry">hide hotkey window</p>

If this is a hotkey window, it hides it with the standard hotkey window animation and makes the previously active application active, if appropriate.

<p class="script-entry">hotkey window profile</p>

Returns the name of the hotkey window profile associated with this window, if any.

<p class="script-entry">id</p>

The window ID. Useful for commands like `screencapture`.

<p class="script-entry">is hotkey window</p>

Returns a boolean value which is true if the window is a hotkey window associated with a profile.

<p class="script-entry">name</p>

The window's name, as appears in the title bar.

<p class="script-entry">reveal hotkey window</p>

If this is a hotkey window, it reveals it with the standard hotkey window animation and makes it key and the application active.

<p class="script-entry">select</p>

Gives the window keyboard focus and brings it to the front.

<p class="script-entry">tabs</p>

An array of tabs. See the methods on Tab, below.

<p class="script-entry">toggle hotkey window</p>

Either shows or hides the hotkey window, if this is a hotkey window, using the standard animation. May make the app active or inactive.

<hr/>
### Sessions

These functions and properties are provided by sessions. For example:

    tell application "iTerm2"
      tell current session of current window
        split horizontally with default profile
      end tell
    end tell

<p class="script-entry">background image</p>

This is a string property that gives a path to the background image of the session.

<p class="script-entry">close</p>

Terminates the session and closes its pane.

<p class="script-entry">Color properties</p>

Various properties which are readable and settable affect the session's colors:

  * background color
  * bold color
  * cursor color
  * cursor text color
  * foreground color
  * selected text color
  * selection color
  * ANSI black color
  * ANSI red color
  * ANSI green color
  * ANSI yellow color
  * ANSI blue color
  * ANSI magenta color
  * ANSI cyan color
  * ANSI white color
  * ANSI bright black color
  * ANSI bright red color
  * ANSI bright green color
  * ANSI bright yellow color
  * ANSI bright blue color
  * ANSI bright magenta color
  * ANSI bright cyan color
  * ANSI bright white color

An example:

    set foreground color to {65535, 0, 0, 0}

Because AppleScript is kind of a dumpster fire, the standard syntax for a color is `{red, green, blue, alpha}` where each value is a number between 0 and 65535.

<p class="script-entry">answerback string</p>

The string sent when the `ENQ` escape sequence is received.

<p class="script-entry">columns</p>

The width of the session in character cells.

<p class="script-entry">contents</p>

Returns the visible contents of the session as a string. Each row is terminated with a newline.

<p class="script-entry">id</p>

Returns the session's unique identifier.

<p class="script-entry">is at shell prompt</p>

Indicates if the session is at a shell prompt accepting a command. Only works if <a href="/shell_integration.html">Shell Integration</a> is installed; if not it will return false.

<p class="script-entry">is processing</p>

Returns a boolean indicating if the session received output recently.

<p class="script-entry">name</p>

A string property with the session's name as seen in its title bar.

<p class="script-entry">profile name</p>

The name of the profile the session was created with. A string. Read-only.

<p class="script-entry">rows</p>

The height of the session in character cells.

<p class="script-entry">set columns to <i>number</i><br/>
set rows to <i>number</i></p>

Changes the size of the session.

<p class="script-entry">split horizontally with default profile<br/>
split vertically with default profile<br/>
split horizontally with default profile command "<i>command</i>"<br/>
split vertically with default profile command "<i>command</i>"</p>

Splits the session either horizontally or vertically. If the optional *command* is provided then it is run in place of the profile's command. A horizontal split has a horizontal divider, while a vertical split has a vertical divider.

Returns a reference to a session.

<p class="script-entry">split horizontally with profile "<i>name</i>"<br/>
split vertically with profile "<i>name</i>"<br/>
split horizontally with profile "<i>name</i>" command "<i>command</i>"<br/>
split vertically with profile "<i>name</i>" command "<i>command</i>"</p>

Like the "default profile" commands, but uses a named profile instead of the default profile.

<p class="script-entry">split horizontally with same profile<br/>
split vertically with same profile<br/>
split horizontally with same profile command "<i>command</i>"<br/>
split vertically with same profile command "<i>command</i>"</p>

Like the "default profile" commands, but uses the current session's profile.

<p class="script-entry">select</p>

Makes the session active in its tab. Does not affect which tab is selected or which window has keyboard focus.

<p class="script-entry">text</p>

A synonym for `contents`.

<p class="script-entry">transparency</p>

A floating-point value from 0 to 1 giving how transparent the session is.

<p class="script-entry">tty</p>

The name of the session's tty (e.g., /dev/ttys01). Returns a string.

<p class="script-entry">unique id</p>

A string uniquely identifying the session.

<p class="script-entry">variable "<i>name</i>"<br/>
set variable named "<i>name</i>" to "<i>value</i>"</p>

Gets and sets the value of a variable by name. Variables are described in <a href="documentation-scripting-fundamentals.html">Scripting Fundamentals</a>. You may only set user-defined variables, whose names always begin with `user.`.

<p class="script-entry">write text "<i>text</i>"<br/>
write text "<i>text</i>" newline NO</p>

Writes text to the session, as though you had typed it. Optionally without a newline.

<p class="script-entry">write contents of file "<i>filename</i>"</p>

Writes the contents of a file to the session as though you had typed it.

<hr/>
### Tabs

These functions and properties are provided by tabs. For example:

    tell application "iTerm2"
      tell current tab of current window
        select
      end tell
    end tell

<p class="script-entry">close</p>

Closes the tab.

<p class="script-entry">current session</p>

The session in this tab that most recently had keyboard focus.

<p class="script-entry">index</p>

The index of the tab in the window, starting from 0.

<p class="script-entry">select</p>

Selects the tab, making it the current tab for the window.

<p class="script-entry">sessions</p>

An array of sessions.

<p class="script-entry">sessions</p>

An array of sessions in this tab.

The index from 0 of the tab in its window.


## Supporting both old and new versions of iTerm2

If your application needs to support both the old and new AppleScript syntax, this is the recommended technique:

<pre>
on theSplit(theString, theDelimiter)
    set oldDelimiters to AppleScript's text item delimiters
    set AppleScript's text item delimiters to theDelimiter
    set theArray to every text item of theString
    set AppleScript's text item delimiters to oldDelimiters
    return theArray
end theSplit

on IsModernVersion(version)
    set myArray to my theSplit(version, ".")
    set major to item 1 of myArray
    set minor to item 2 of myArray
    set veryMinor to item 3 of myArray
    
    if major < 2 then
        return false
    end if
    if major > 2 then
        return true
    end if
    if minor < 9 then
        return false
    end if
    if minor > 9 then
        return true
    end if
    if veryMinor < 20140903 then
        return false
    end if
    return true
end IsModernVersion

on NewScript()
    -- Return the modern script as a string here; what follows is an example.
    return "create window with default profile"
end NewScript

on OldScript()
    -- Return the legacy script as a string here; what follows is an example.
    return "
    set myTerm to (make new terminal)
    tell myTerm
        launch session \"Default\"
    end tell"
end OldScript

tell application "iTerm"
    if my IsModernVersion(version) then
        set myScript to my NewScript()
    else
        set myScript to my OldScript()
    end if
end tell

set fullScript to "tell application \"iTerm\"
" & myScript & "
end tell"

run script fullScript
</pre>


