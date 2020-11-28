This chapter describes features of iTerm2 that go beyond basic usage and are not generally found in other terminal emulators.

#### Text Selection
There are several ways to select text to copy to the clipboard:

  * You can <a href="documentation-general-usage.html">use the mouse</a>.
  * You can use the find feature's "mouseless copy" feature.  
To select text without using the mouse, press cmd-f to open the find field. Enter the beginning of the text you wish to copy and the find feature will select it in your window. Then press tab and the end of the selection will advance by a word. To move the beginning of the selection to the left, press shift-tab. At most one line of text can be selected this way.
  * You can use <a href="documentation-copymode.html">Copy Mode</a>.
  * You can bind keystrokes to create and adjust selections.  
In Prefs > Profiles > Keys you can assign keys to move the beginning or end of the selection by a single character, word, or line. No such keys are bound by default.

#### Split Panes
iTerm2 allows you to divide a tab into many rectangular "panes", each of which is a different terminal session. The shortcuts cmd-d and cmd-shift-d divide an existing session vertically or horizontally, respectively. You can navigate among split panes with cmd-opt-arrow or cmd-[ and cmd-]. You can "maximize" the current pane--hiding all others in that tab--with cmd-shift-enter. Pressing the shortcut again restores the hidden panes.

#### Hotkey Window
iTerm2 offers a special terminal window that is always available with a single keystroke. This window is called the "hotkey window" and is most commonly used for occasional administrative tasks. It is described in <a href="documentation-hotkey.html">Hotkeys</a>.

#### Swap Cmd and Option
iTerm2 allows you to remap modifiers. You have separate control over left and right command and option keys. One common need is to exchange cmd and option. To do this, go to Preferences > Keys. Set Left option key to Left command key and Left command key to Left option key (and do the same for Right command and Right option if you please). You can add exceptions if you don't want certain combinations to be remapped (for example, cmd-tab) by adding a new global shortcut with the action "Do Not Remap" and the keystroke of the (unremapped) key you wish to keep unaffected by modifier remapping.

#### Save Mark/Jump to Mark
You can mark a location in a session with cmd-shift-M and then jump back to it with cmd-shift-J. This is useful, for instance, if you suspend your editor to compile a program and it emits errors. You can save a mark at that point and then return to your editor to fix the errors. As you work, you can jump back to the compilation errors with cmd-shift-J.

#### Regular Expression Search
When you open the find field (cmd-f) there is a down-arrow on the left of the field by the magnifying glass. Clicking it opens a menu of options in which you can enable regular expression search. The <a href="http://userguide.icu-project.org/strings/regexp#TOC-Regular-Expression-Metacharacters">ICU syntax</a> is used.

#### Autocomplete
Any text that exists in a tab or its scrollback buffer can be autocompleted in that tab. To use autocomplete, type the beginning of a word and then press cmd-;. An autocomplete window opens showing the top 20 choices for words beginning what you have entered. The list can be filtered by typing a subsequence. The filter can be reset by pressing backspace. If you make a selection and press return, it will be entered for you. If you make a selection and press tab, your autocomplete will be extended with the selection.

#### Paste History
Whenever text is copied or pasted in iTerm2 it is added to the paste history. You can access paste history with cmd-shift-H. It can be filtered by typing a subsequence, and the filter can be cleared by pressing backspace. You can choose to have your paste history saved to disk by turning that option on under Preferences > General > Save copy/paste history to disk.

#### Instant Replay
Sometimes interactive programs will overwrite something of interest on the screen (for example, top(1) does this all the time). Normally, this would be lost forever. With Instant Replay, you can step back in time to see exactly what was on your screen at some point in the recent past. To enable, press cmd-opt-B. Once you are in instant replay mode, you can use the left and right arrow keys to navigate back and forward through time. Esc exits instant replay mode. By default, each session uses up to 4MB to save its instant replay history, and this can be adjusted under Preferences > General > Instant Replay uses __ MB per session.

Another benefit of Instant Replay is that it shows you the exact time that something appeared on your screen down to the second. This is useful when trying to figure out when an error occurred, for example.

#### Full Screen
You can press cmd-enter and iTerm2 will take up the entire screen. If you had a transparent background configured, it will be turned off upon entering full screen mode to reduce distractions. You can re-enable it with cmd-U. Unlike most macOS apps, iTerm2 can open a fullscreen window in the same desktop with no annoying animation if you disable Preferences > General > Native full screen windows.

#### High-Color Modes
iTerm2 supports 256 color mode. To enable this for csh shells, set your terminal to xterm-256color (under Preferences > Profiles > Terminal > Report Terminal Type). Some applications may need to be configured to support this mode. In vim, add this to your .vimrc:

    set t_Co=256

iTerm2 also supports 24-bit color.

#### Focus Follows Mouse
This option is off by default, but can be enabled under Preferences > Pointer > Focus follows mouse. It only affects iTerm2 windows.

#### Middle Button Paste
If you have a three-button mouse, by default the middle button performs "paste". You can configure the behavior of the middle button, as well as many other kinds of clicks and gestures, in Prefs > Pointer.

#### Cursor Finery
When using a block cursor, it's hard to pick a cursor color that's visible against every background color. If you enable Smart cursor color (under Preferences > Profiles > Colors) then the cursor color will be dynamically chosen to be visible against the text it is over and the adjacent cells.

If you prefer a white or black cursor, you can use the "cursor boost" feature (under Preferences > Profiles > Colors) to make all colors other than the cursor dimmer.

Do you have trouble finding your cursor? You can turn on the cursor guide by toggling the View > Show Cursor Guide menu item or turning on Preferences > Profiles > Colors > Cursor Guide. This can also be toggled by an escape sequence. For example, add this to your .vimrc:

    let &t_ti.="\<Esc>]1337;HighlightCursorLine=true\x7"
    let &t_te.="\<Esc>]1337;HighlightCursorLine=false\x7"

If you've lost your cursor, press Cmd-/ or select View > Find Cursor and the cursor's position on the screen will be indicated very clearly

#### Minimum Contrast
Sometimes an application will display text with a color combination that is hard to read. Colorblind users in particular may find certain combinations hard to see if the colors differ only in hue and not brightness. If you enable minimum contrast (under Preferences > Profiles > Colors > Minimum contrast, then iTerm2 will guarantee a minimum level of brightness difference between the foreground and background color of every character. If you set this to its maximum value, then all text will be black or white.

#### Notification Center Support
If you enable notifications (Preferences > Profiles > Terminal > Send Notification Center alerts) then you'll receive messages when a terminal beeps, has output after a period of silence, or terminates. There's also <a href="documentation-escape-codes.html">a proprietary escape sequence</a> to send a notification. You can adjust the kinds of notifications that get posted in Preferences > Profiles > Terminal > Filter Alerts.

#### Window Arrangements
You can take a snapshot of your open windows, tabs, and panes with the menu option Window > Save Window Arrangement. You can restore this configuration with Window > Restore Window Arrangement, or you can choose to have it automatically restored when you start iTerm2 with Preferences > General > Open saved window arrangement.

#### Smart Selection
Performing a quad-click does a "smart selection," which selects text under the pointer in a way appropriate to its content. For example, URLs, quoted strings, and email addresses (among many other objects) are recognized and selected in their entirety. You can also bind actions to a smart selection rule. The first action takes effect when you cmd-click on text matching the rule. All actions are added to the context menu when you right click on text matching the rule.

#### Triggers
Triggers are user-configurable regular expressions with associated actions that run when text is received that matches the regex. Actions include highlighting the matching text, showing an alert, sending text back, and more.

One advanced use of a trigger is to capture output matching a regex and display just those matching lines in the toolbelt. For example, you could create a trigger that matches compiler errors. When you run Make the errors will appear on the side of your window and you can click each to jump right to it. More information is available at the <a href="captured_output.html">Captured Output</a> manual.

#### Tmux Integration
iTerm2 is tightly integrated with tmux. The integration allows you to see tmux windows as native iTerm2 windows or tabs. The tmux prefix key is not needed, as native menu commands operate on tmux windows. For more information, please see the <a href="documentation-tmux-integration.html">iTerm2-tmux Integration</a> document.

#### Coprocesses
Coprocesses are programs that run alongside iTerm2 and are bound to a single session. All output bound for the session is also routed as input to the coprocess. The coprocess's output acts like the user typing at the keyboard. Coprocesses can be used to automate tasks. For more information, see the <a href="documentation-coprocesses.html">Coprocess</a> document.

#### Dynamic Profiles
If you have hundreds or thousands of profiles, look in to <a href="documentation-dynamic-profiles.html">Dynamic Profiles</a>. This feature allows you to define profiles in JSON.

#### Automatic Profile Switching
You can automatically change the current session's profile using <a href="documentation-automatic-profile-switching.html">Automatic Profile Switching</a>. For example, this would allow you to change the background color when you are on a production system.

#### Inline Images
iTerm2 can display images inline, including animated GIFs. The easiest way to use this feature is to install <a href="documentation-utilities.html">Shell Integration and Utilities</a>, which adds an `imgcat` script.

#### Undo Close
If you accidentally close a session, you get five seconds (by default; configurable in Preferences > Profiles > Session) to undo it by pressing Cmd-Z.

#### Shell Integration
Shell Integration is a feature exclusive to iTerm2 that uses knowledge about your shell prompt to help you navigate from one shell prompt to another, record your command history, suggest most used directories, helps you re-run commands, download files from remote hosts with a click, upload files to remote hosts with drag and drop, and more. See the <a href="shell_integration.html">Shell Integration</a> documentation for all the details.

#### Password Manager
iTerm2 can save your passwords in the Keychain. Use the Window > Password Manager menu item to open the password manager and enter your passwords.

#### Timestamps
Toggle View > Show Timestamps to indicate the time each line was last modified. This is useful for telling how long operations took or when a message was printed.

#### Tab Bar on Left
You can position the tab bar on the left side of the window. This is useful if you have a really large number of tabs.

#### Open Quickly
If you have lots of sessions you can quickly find the one you're looking for with Open Quickly. Select the View > Open Quickly menu item (cmd-shift-O) and then enter a search query. You can search by tab title, command name, host name, user name, profile name, directory name, badge label, and more. Open Quickly also lets you create new tabs, change the current session's profile, and open arrangements. If you start your query with a / then that gives you a shortcut to various commands. Enter a query of / to see them.

#### Shell Integration and Utilities
Shell integration consists of a shell script that's loaded when you create a new session or ssh to a remote host. It modifies your prompt so iTerm2 knows where it is. This enables a number of features, such as Copy Output of Last Command, Automatic Profile Switching when changing hosts, and more as described in <a href="documentation-shell-integration.html">Shell Integration</a>. When you install Shell Integration you'll be prompted to also install its Utilities. The Utilities are a collection of shell scripts that use iTerm2's unique features and make them easy to use. For example, you can upload or download files from a remote host, copy to the pasteboard from the command line (even over ssh!), and make fireworks explode from the cursor. It's described in <a href="documentation-utilities.html">Utilities</a>.

