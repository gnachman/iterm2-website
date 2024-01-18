Session restoration works by running your jobs within a long-lived daemon process rather than as child processes of iTerm2. If iTerm2 crashes or upgrades, the daemon keep going. When iTerm2 restarts, it searches for running daemons and connects to them. The OS's window restoration feature preserves the content of your window, including scrollback history. iTerm2 marries the restored session to the appropriate server so you can pick up where you were.

tl;dr watch this:
<a href="/misc/restoration-demo.mov">Demo Video</a>

### Notes

 * You must turn off **System Settings &gt; Desktop and Dock &gt; Close windows when quitting an application**. For more information on system window restoration, please see <a href="https://support.apple.com/en-us/HT204005">Apple's docs</a>.

 * You must set **Settings &gt; General &gt; Startup** to **Use system window restoration settings**.

 * Force quitting iTerm2, causing it to crash, or upgrading it when prompted should restore your sessions. *NOTE: Quitting iTerm2 with Cmd-Q will terminate your jobs and they won't be restored.* There is an advanced preference to change this behavior, though.

 * You can toggle this feature with <b>Settings&gt;Advanced&gt;Enable session restoration.</b>, but you *must restart iTerm2 after changing this setting*.
 * A session that has had only its window contents restored and not the running processes will get a reverse video *Session Restored* banner. A properly restored session will pick up right where you left it.

 * If you reboot, your jobs will terminate and not be restored. The window contents should be restored.

