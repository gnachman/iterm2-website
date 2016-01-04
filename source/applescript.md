---
layout: default
title: Applescript - iTerm2 - Mac OS Terminal Replacement
---

## Applescript

This is an example of the new Applescript syntax available in versions 2.9 and up.

Please note that as of 2.9.20150414, "terminal window" has been replaced with "window" to improve compliance with standard Applescript conventions.

<pre>
tell application iTerm
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
    write text (contents)
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
  end tell
end tell

</pre>
