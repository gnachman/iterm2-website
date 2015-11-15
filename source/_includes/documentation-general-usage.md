#### Tabs

When you first start iTerm2, a window opens showing a terminal session. If you want to open more that one session at a time, you have a few options: You can create a new window (Shell > New Window), you can create a new tab (Shell > New Tab), or you can split the current session into two panes (Shell > Split Horizontally, Shell > Split Vertically), each of which is a separate session.

Tabs in iTerm2 behave like tabs in other programs, most notably web browsers like Safari, Firefox, and Google Chrome. Note that you can drag and drop tabs to reorder them within a window. You can drag tabs from one window to another, and you can drag a tab from a window into a new window by dropping it outside any iTerm2 window's tab bar.

By default, the label of each tab is the name of the job that's running in that session. Some systems are configured to augment this with additional information such as the hostname you're logged in to or your current directory (this is done by sending a special code of ESC]0;string ^G).

Tab labels are colored to indicate their status. When new output is received in a tab other than the currently selected tab, its label changes color to magenta. After a few seconds it becomes red to indicate not-so-fresh output. When a tab's session terminates, the label turns gray. You can disable this coloring in Preferences > Appearance > Color tab labels on activity.
#### Toolbar
The toolbar provides quick access to some commonly used features.
<ul>
<li>The New button allows you to open a new tab. If you have configured multiple profiles, it allows you to select one from a list.</li>
<li>The Info button allows you to change the appearance of the current session.</li>
<li>The Close button closes the current session, and may close the current window if it was the only session.</li>
<li>The Execute field lets you to type in a command locally before sending it to the terminal. You can also type in a URL (including the scheme, such as http://), in which case the URL will be opened by the appropriate application. If you press TAB key instead of Enter after you type in the command, a new tab will be launched with your command.</li>
</ul>
#### Info Panel
Info Panel lets you modify the appearance of a single session. Note that after you open this panel, your changes will not be reflected in the profile and profile changes will not be reflected in this session.
#### Pointer
The primary use of the mouse in iTerm2 is to select text, and (by default) text is copied to the clipboard immediately upon being selected. You can click and drag to perform a normal selection. Double-clicking selects a whole word. Triple-clicking selects an entire line. Quadruple-clicking performs a "smart select", matching recognized strings such as URLs and email addresses.

If you hold shift while clicking the existing selection is extended.

If you hold cmd and click on a URL it will be opened. If you hold cmd and click on a filename, it will be opened. There is special support for MacVim, TextMate, and BBEdit when you cmd-click on a text file's name: if it is followed by a colon and line number, the file will be opened at that line number. The current directory is tracked if you have your shell prompt set the window title, <a href="http://www.faqs.org/docs/Linux-mini/Xterm-Title.html#toc4">as described here</a>.

If you hold cmd you can drag and drop selected text.

If you hold cmd and option while selecting, a rectangular selection will be made.

If mouse reporting is enabled (in Preferences > Profile > Terminal) and the currently running terminal application is using it, pressing option will temporarily disable it so you can make a selection.

If you hold the control key and click, that simulates a right click. If you'd prefer to send this combination to applications using mouse reporting, check "Report ctrl-click to apps instead of opening menu" in Preferences > General.

Moving the mouse's scroll wheel scrolls up and down.

A three-finger swipe left or right on a trackpad (if configured to "navigate") will select an adjacent tab.
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

iTerm2 allows you to define a global hotkey. This is a single keystroke that iTerm2 listens for even when another application has keyboard focus. When it is pressed, iTerm2 comes to the front. Press it again, and iTerm2 goes away. You can choose to bind the hotkey to a single dedicated window. This feature is similar to other programs like Visor, Guake, and Yakuake.
#### Context menus
By right-clicking in a session a context menu opens. You can use it to open a new session, perform various actions on selected text, or access frequently used features to affect the clicked-on session.
#### Profiles
Many settings are stored in profiles. A profile is a named collection of settings, and you can have as many of them as you like. Most users only have one profile, but if you find that you often connect to different servers, they may be useful for you. A key feature of a profile is that you can associate a command with it that is run when it begins. For instance, if you often ssh to a particular host, you could create a profile with the command "ssh example.com" to automate that process.
