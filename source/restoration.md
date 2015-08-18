---
layout: default
title: Session Restoration - iTerm2 - Mac OS Terminal Replacement
---
## Session Restoration

Session restoration works by running your jobs within long-lived servers rather than as child processes of iTerm2. If iTerm2 crashes or upgrades, the servers keep going. When iTerm2 restarts, it searches for running servers and connects to them. The OS's window restoration feature preserves the content of your window, including scrollback history. iTerm2 marries the restored session to the appropriate server so you can pick up where you were.

tl;dr watch this:
<a href="/misc/restoration-demo.mov">Demo Video</a>

### Availability
This feature is available in the current 2.9 branch, including the nightly builds.

### Notes

 * You can toggle this feature with <b>Prefs&gt;Advanced&gt;Enable session restoration.</b>, but you *must restart iTerm2 after changing this setting*.

 * If you don't have system window restoration enabled (both in System Settings and also as iTerm2's startup mode under Prefs&gt;General) then history and screen contents will be lost.

 * Force quitting iTerm2, causing it to crash, or upgrading it when prompted should restore your sessions. *NOTE: Quitting iTerm2 with Cmd-Q will terminate your jobs and they won't be restored.* There is an advanced preference to change this behavior, though.

 * A session that has had only its window contents restored and not the running processes will get a reverse video *Session Restored* banner. A properly restored session will pick up right where you left it.

 * If something goes wrong (sessions not restoring or not starting at all), please send me the following info in a <a href="https://iterm2.com/bugs/">bug report</a>:
   * /tmp/log.txt
   * The output of *grep iTerm2 /var/log/system.log*
   * The output of *ps -aef|grep iTerm2*
   * The output of *ls /tmp/iTerm2**
