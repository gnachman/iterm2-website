iTerm2 has many features that will change the way you interact with your terminal. This section outlines them briefly.
#### Text Selection
There are two ways to select text to copy to the clipboard: you can use the mouse, or you can use the find feature's "mouseless copy" feature. Text selection by mouse is described later in General Usage section.

To select text without using the mouse, press cmd-f to open the find field. Enter the beginning of the text you wish to copy and the find feature will select it in your window. Then press tab and the end of the selection will advance by a word. To move the beginning of the selection to the left, press shift-tab. At most one line of text can be selected this way.
#### Split Panes
iTerm2 allows you to divide a tab into many rectangular "panes", each of which is a different terminal session. The shortcuts cmd-d and cmd-shift-d divide an existing session vertically or horizontally, respectively. You can navigate among split panes with cmd-opt-arrow or cmd-[ and cmd-]. You can "maximize" the current pane--hiding all others in that tab--with cmd-shift-enter. Pressing the shortcut again restores the hidden panes.
#### Hotkey Window
iTerm2 offers a special terminal window that is always available with a single keystroke. This window is called the "hotkey window" and is most commonly used for occasional administrative tasks. To enable this feature, go to Preferences > Keys. Enable "Show/Hide iTerm2 with a system-wide hotkey". Click in the field and enter the key combination you'd like to use. Then check "hotkey toggles a dedicated window with profile:". A new profile will be created that is optimized for the feature. Pressing the hotkey will drop a terminal window down from the top of the screen, and pressing it again (or clicking in any other window) causes it to disappear.
#### Swap Cmd and Option
iTerm2 allows you to remap modifiers. You have separate control over left and right command and option keys. One common need is to exchange cmd and option. To do this, go to Preferences > Keys. Set Left option key to Left command key and Left command key to Left option key (and do the same for Right command and Right option if you please). You can add exceptions if you don't want certain combinations to be remapped (for example, cmd-tab) by adding a new global shortcut with the action "Do Not Remap" and the keystroke of the (unremapped) key you wish to keep unaffected by modifier remapping.
#### Save Mark/Jump to Mark
You can mark a location in a session with cmd-shift-M and then jump back to it with cmd-shift-J. This is useful, for instance, if you suspend your editor to compile a program and it emits errors. You can save a mark at that point and then return to your editor to fix the errors. As you work, you can jump back to the compilation errors with cmd-shift-J.
#### Regular Expression Search
When you open the find field (cmd-f) there is a down-arrow on the left of the field by the magnifying glass. Clicking it opens a menu of options in which you can enable regular expression search. The <a href="http://userguide.icu-project.org/strings/regexp#TOC-Regular-Expression-Metacharacters">ICU syntax</a> is used.
#### Autocomplete
Any text that exists in a tab or its scrollback buffer can be autocompleted in that tab. To use autocomplete, type the beginning of a word and then press cmd-;. An autocomplete window opens showing the top 20 choices for words beginning what what you have entered. The list can be filtered by typing a subsequence. The filter can be reset by pressing backspace. If you make a selection and press return, it will be entered for you. If you make a selection and press tab, your autocomplete will be extended with the selection.
#### Paste History
Whenever text is copied or pasted in iTerm2 it is added to the paste history. You can access paste history with cmd-shift-H. It can be filtered by typing a subsequence, and the filter can be cleared by pressing backspace. You can choose to have your paste history saved to disk by turning that option on under Preferences > General > Save copy/paste history to disk.
#### Instant Replay
Sometimes interactive programs will overwrite something of interest on the screen (for example, top(1) does this all the time). Normally, this would be lost forever. With Instant Replay, you can step back in time to see exactly what was on your screen at some point in the recent past. To enable, press cmd-opt-B. Once you are in instant replay mode, you can use the left and right arrow keys to navigate back and forward through time. Esc exits instant replay mode. By default, each session uses up to 4MB to save its instant replay history, and this can be adjusted under Preferences > General > Instant Replay uses __ MB per session.

Another benefit of Instant Replay is that it shows you the exact time that something appeared on your screen down to the second. This is useful when trying to figure out when an error occurred, for example.
#### Full Screen
You can press cmd-enter and iTerm2 will take up the entire screen. If you had a transparent background configured, it will be turned off upon entering full screen mode to reduce distractions. You can re-enable it with cmd-U. Unlike most OS X apps, iTerm2 can open a fullscreen window in the same desktop with no annoying animation.
#### 256 Color Mode
iTerm2 supports 256 color mode. To enable this for csh shells, set your terminal to xterm-256color (under Preferences > Profiles > Terminal > Report Terminal Type). Some applications may need to be configured to support this mode. In vim, add this to your .vimrc:

    set t_Co=256


#### Focus Follows Mouse
This option is off by default, but can be enabled under Preferences > Pointer > Focus follows mouse. It only affects iTerm2 windows.
#### Middle Button Paste
If you have a three-button mouse, by default the middle button performs "paste".
#### Smart Cursor Color
When using a block cursor, it's hard to pick a cursor color that's visible against every background color. If you enable Smart cursor color (under Preferences > Profiles > Colors) then the cursor color will be dynamically chosen to be visible against the text it is over and the adjacent cells.
#### Minimum Contrast
Sometimes an application will display text with a color combination that is hard to read. Colorblind users in particular may find certain combinations hard to see if the colors differ only in hue and not brightness. If you enable minimum contrast (under Preferences > Profiles > Colors > Minimum contrast, then iTerm2 will guarantee a minimum level of brightness difference between the foreground and background color of every character. If you set this to its maximum value, then all text will be black or white.
#### Growl Support
If you enable Growl (Preferences > Profiles > Terminal > Enable Growl Notifications) and you have Growl installed then you'll receive messages when a terminal beeps, has output after a period of silence, or terminates.
#### Exposé Tabs
If you have too many tabs and are unable to find the one you're looking for, you can use the Exposé Tabs feature to find it. Press cmd-opt-E and all your tabs will be shown at once. You can then perform a search over all tabs simultaneously to find what you're looking for.
#### Window Arrangements
You can take a snapshot of your open windows, tabs, and panes with the menu option Window > Save Window Arrangement. You can restore this configuration with Window > Restore Window Arrangement, or you can choose to have it automatically restored when you start iTerm2 with Preferences > General > Open saved window arrangement.
#### Smart Selection
Performing a quad-click does a "smart selection," which selects text under the pointer in a way appropriate to its content. For example, URLs, quoted strings, and email addresses (among many other objects) are recognized and selected in their entirety.
#### Triggers
Triggers are user-configurable regular expressions with associated actions that run when text is received that matches the regex. Actions include highlighting the matching text, showing an alert, sending text back, and more.
#### Tmux Integration
iTerm2 is tightly integrated with tmux. The integration allows you to see tmux windows as native iTerm2 windows or tabs. The tmux prefix key is not needed, as native menu commands operate on tmux windows. For more information, please see the <a href="https://gitlab.com/gnachman/iterm2/wikis/TmuxIntegration">iTerm2-tmux Integration</a> document.
#### Coprocesses
Coprocesses are programs that run alongside iTerm2 and are bound to a single session. All output bound for the session is also routed as input to the coprocess. The coprocess's output acts like the user typing at the keyboard. Coprocesses can be used to automate tasks. For more information, see the <a href="documentation-coprocesses.html">Coprocess</a> document.
