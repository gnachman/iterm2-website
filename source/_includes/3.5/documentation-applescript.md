This is an example of the Applescript syntax available in version 3.0 and later.

Note: Applescript support is no longer receiving improvements. Use the <a href="/python-api">Python API</a> instead.

<pre>
tell application iTerm2
  -- application-level commands
  -- These commands return a window.
  set newWindow to (create window with default profile)
  set newWindow to (create window with default profile command "ls -l -R /")

  select first window
  set newWindow to (create window with profile "Default")
  set newWindow to (create window with profile "Default" command "ls -l -R /")

  -- window-level commands
  repeat with aWindow in windows
    tell aWindow
      tell current session
        set newSession to (split horizontally with default profile)
        -- Optional command argument added 12/5/2015
        set newSession to (split horizontally with default profile command "ssh example.com")
      end tell
    end tell
  end repeat
  tell current window
    -- These commands return a tab
    set newTab to (create tab with default profile)
    set newTab to (create tab with profile "Projection")
  end tell
  tell current window
    tell current session
      set columns to 40
      set rows to 40
    end tell
  end tell

  -- tab-level commands
  tell current window
    tell second tab
      select
    end tell
    tell first tab
      close
    end tell
    tell current tab
      log title
      repeat with aSession in sessions
        tell aSession
          write text "Hello"
        end tell
      end repeat
       end tell
   end tell

  -- session-level commands
  tell current session of first window
    write text "cat > /dev/null"
    write text "cat > /dev/null" newline NO
    write contents of file "/etc/passwd"
    -- Get the path to the current session's tty and write it
    write text (tty)
    -- Get the content of the session and write it back
    write text (text)
    -- Get the session's unique identifier and write it back
    write text (unique ID)

    -- These commands return a session
    set newSession to (split vertically with default profile)
    set newSession to (split vertically with profile "Default")
    set newSession to (split vertically with same profile)
    
    -- Optional command argument added 12/5/2015
    set newSession to (split vertically with default profile command "ssh example.com")
    set newSession to (split vertically with profile "Default" command "ssh example.com")
    set newSession to (split vertically with same profile command "ssh example.com")

    set newSession to (split horizontally with default profile)
    set newSession to (split horizontally with profile "Default")
    set newSession to (split horizontally with same profile)

    -- Optional command argument added 12/5/2015
    set newSession to (split horizontally with default profile command "ssh example.com")
    set newSession to (split horizontally with profile "Default" command "ssh example.com")
    set newSession to (split horizontally with same profile command "ssh example.com")

    set foreground color to {65535, 0, 0, 0}
    set background color to {65535, 0, 0, 0}
    set bold color to {65535, 0, 0, 0}
    set cursor color to {65535, 0, 0, 0}
    set cursor text color to {65535, 0, 0, 0}
    set selected text color to {65535, 0, 0, 0}
    set selection color to {65535, 0, 0, 0}
    set underline color to {65535, 0, 0, 0}
    set ANSI black color to {65535, 0, 0, 0}
    set ANSI red color to {65535, 0, 0, 0}
    set ANSI green color to {65535, 0, 0, 0}
    set ANSI yellow color to {65535, 0, 0, 0}
    set ANSI blue color to {65535, 0, 0, 0}
    set ANSI magenta color to {65535, 0, 0, 0}
    set ANSI cyan color to {65535, 0, 0, 0}
    set ANSI white color to {65535, 0, 0, 0}

    set ANSI bright black color to {65535, 0, 0, 0}
    set ANSI bright red color to {65535, 0, 0, 0}
    set ANSI bright green color to {65535, 0, 0, 0}
    set ANSI bright yellow color to {65535, 0, 0, 0}
    set ANSI bright blue color to {65535, 0, 0, 0}
    set ANSI bright magenta color to {65535, 0, 0, 0}
    set ANSI bright cyan color to {65535, 0, 0, 0}
    set ANSI bright white color to {65535, 0, 0, 0}

    set background image to "/usr/share/httpd/icons/small/rainbow.png"
    set name to "New Name"
    set transparency to 0.5
    -- The name of the session's profile (different from the
    -- session's name, which can be changed by editing the Session
    -- Title field in Edit Session or by an escape sequence).
    -- Added 10/6/15.
    write text (profile name)

    -- is processing means it has received output in the last two seconds.
    if (is processing) then
      set foreground color to { 65535, 65535, 65535, 65535 }
    end if

    -- This will only work if shell integration is installed.
    -- Otherwise it always returns false.
    if (is at shell prompt) then
      set background color to { 65535, 0, 65535, 65535 }
    end if

    -- New in 2.9.20160104
    set answerback string to "Hello world"

    -- New in 2.9.201601. See https://iterm2.com/badges.html for more on variables.
    variable named "session.name"
    set variable named "user.phaseOfTheMoon" to "Gibbous"
  end tell
end tell

</pre>

### Supporting both old and new versions of iTerm2

If your application needs to support both the old and new Applescript syntax, this is the recommended technique:

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

### Legacy Note

**Note:** in iTerm2 3.0.0, sessions had a property called *contents*. That
conflicted with a reserved word, and has been renamed to *text*. The example
below reflects proper usage for version 3.0.1 and up.


