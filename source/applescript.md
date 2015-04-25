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
        create window with default profile
        create window with default profile command "ls -l -R /"
        select first window
        create window with profile "Default"
        create window with profile "Default" command "ls -l -R /"

        -- window-level commands
        repeat with aWindow in windows
                tell aWindow
                        tell current session
                                split horizontally with default profile
                        end tell
                end tell
        end repeat
        tell current window
                create tab with default profile
                create tab with profile "Projection"
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
                write contents of file "/etc/passwd"
                write text (tty)
                write text (contents)
                write text (unique ID)

                split vertically with default profile
                split vertically with profile "Default"
                split vertically with same profile
                
                split horizontally with default profile
                split horizontally with profile "Default"
                split horizontally with same profile


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

                -- is processing means it has received output in the last two seconds.
                if (is processing) then
                  set foreground color to { 65535, 65535, 65535, 65535 }
                end if

                -- This will only work if shell integration is installed.
                -- Otherwise it always returns false.
                if (is at shell prompt) then
                  set background color to { 65535, 0, 65535, 65535 }
                end if
        end tell
end tell

</pre>
