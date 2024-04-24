#### Tabs

When you first start iTerm2, a window opens showing a terminal session. If you want to open more that one session at a time, you have a few options: You can create a new window (Shell > New Window), you can create a new tab (Shell > New Tab), or you can split the current session into two panes (Shell > Split Horizontally, Shell > Split Vertically), each of which is a separate session.

Tabs in iTerm2 behave like tabs in other programs, most notably web browsers like Safari, Firefox, and Google Chrome. Note that you can drag and drop tabs to reorder them within a window. You can drag tabs from one window to another, and you can drag a tab from a window into a new window by dropping it outside any iTerm2 window's tab bar.

By default, the label of each tab is the name of the job that's running in that session. Some systems are configured to augment this with additional information such as the hostname you're logged in to or your current directory (this is done by sending a special code of ESC]0;string ^G).

Tab labels have indicators that tell you their status. A blue dot means new input was received. An activity indicator means new out is being received. When the session ends, a  ⃠ icon appears in the tab. You can customize these indicators in Preferences > Appearance.

#### Edit Current Session
The *Edit Current Session* panel (accessible from the Session menu) lets you modify the appearance of a single session. If you customize some attribute of the session (for example, by changing the default text color) then subsequent changes to that same attribute in the profile will not affect the customized session. However, changes to other attributes of the profile will affect the customized session.

#### Pointer
The primary use of the mouse in iTerm2 is to select text, and (by default) text is copied to the clipboard immediately upon being selected. You can click and drag to perform a normal selection. Double-clicking selects a whole word. Triple-clicking selects an entire line. Quadruple-clicking performs a "smart select", matching recognized strings such as URLs and email addresses. You can add custom pointer actions in Preferences > Pointer. I recommend using three-finger tap for smart selection, but you must ensure that *System Preferences > Trackpad* does not have any other action already assigned to three-finger tap.

If you hold shift while clicking the existing selection is extended. In fact, you can single click in one location and shift click in an other location to make a selection: no dragging needed.

If you hold cmd while dragging it will create a noncontinguous selection.

If you hold cmd and click on a URL it will be opened. If you hold cmd and click on a filename, it will be opened. There is special support for MacVim, TextMate, and BBEdit when you cmd-click on a text file's name: if it is followed by a colon and line number, the file will be opened at that line number. The current directory is tracked if you have your shell prompt set the window title, <a href="http://www.faqs.org/docs/Linux-mini/Xterm-Title.html#toc4">as described here</a>, or if you have <a href="documentation-shell-integration.html">Shell Integration</a> installed.

If you hold cmd and option while selecting, a rectangular selection will be made.

If mouse reporting is enabled (in Preferences > Profile > Terminal) and the currently running terminal application is using it, pressing option will temporarily disable it so you can make a selection.

Right clicking on certain values shows helpful information in the context menu:

  * Right-clicking on a number shows its conversion to or from hex, or if it looks like a unix timestamp its representation in local time will be shown. 
  * Right-clicking on a non-ASCII character shows its code point and UTF-8 representation.

You can configure your pointing device's scroll gesture to send arrow keys in interactive programs by turning on Preferences > Advanced > Scroll wheel sends arrow keys when in alternate screen mode, but it will only work if **Preferences > Profiles > Terminal > Disable save/restore alternate screen** is turned off.

A three-finger swipe left or right on a trackpad (if configured to "navigate") will select an adjacent tab.

Middle clicking on a tab (if your pointing device has a middle button) closes it.

#### Keyboard
Every aspect of the keyboard can be configured in iTerm2. These keystrokes may be useful to remember:
<ul>
<li>Cmd+left arrow, Cmd+right arrow navigates among tabs. So does Cmd-{ and Cmd-}.
</li>
<li>Cmd+number navigates directly to a tab.</li>
<li>Cmd+Option+Number navigates directly to a window.</li>
<li>Cmd+Option+Arrow keys navigate among split panes.</li>
<li>Cmd+] and Cmd+[ navigates among split panes in order of use.</li>
</ul>
You can configure any key combination to perform any action in two places: in Preferences > Keys, you can define global key shortcuts that affect all profiles. In Preferences > Profiles > Keys, you can define key shortcuts that affect only a single profile.

You can remap modifiers like Option and Cmd within iTerm2. Some users find that pressing Option frequently is uncomfortable, and configure iTerm2 to swap the function of the Option and Cmd keys. This is done in Preferences > Keys under Remap Modifier Keys. If there is some key combination that you don't want to be affected by this change (such as Cmd-tab) add a new global shortcut key with the action Do Not Remap.

iTerm2 allows you to define a global hotkey. This is a single keystroke that iTerm2 listens for even when another application has keyboard focus. When it is pressed, iTerm2 comes to the front. Press it again, and iTerm2 goes away. You can choose to bind the hotkey to a single dedicated window. For more on the hotkey window and other uses of hotkeys, see <a href="documentation-hotkey.html">Hotkeys</a>.

#### Context menus
By right-clicking in a session a context menu opens. You can use it to open a new session, perform various actions on selected text, or access frequently used features to affect the clicked-on session.

#### Profiles
Many settings are stored in profiles. A profile is a named collection of settings, and you can have as many of them as you like. Most users only have one profile, but if you find that you often connect to different servers, they may be useful for you. A key feature of a profile is that you can associate a command with it that is run when it begins. For instance, if you often ssh to a particular host, you could create a profile with the command "ssh example.com" to automate that process.
