## Appearance

<hr>
### General

#### Theme
Allows you to select the theme. The theme affects how the areas outside the main terminal view are drawn, including colors and fonts.

On macOS 10.13 and earlier, the options are Light, Dark, Light High Contrast, and Dark High Contrast.

On macOS 10.14 and later, there are two additional options:

  * *Regular* - The standard macOS theme. Switches between dark and light mode automatically based on the system setting.
  * *Minimal* - This is inspired by the appearance of Electron apps. It is modern and streamlined.
  * *Compact* - A combination of Regular and Minimal. The standard colors are used, but the title bar is eliminated to save space.

In Minimal and Compact, tabs go in the title bar if the tabs are on top. The
area between the red, yellow, and green buttons and the first tab can be used
to drag the window. If tabs are on the bottom or the left, you can move the
mouse to the top left of the window to reveal the red, yellow, and green buts.
The area around them, when revealed, can be used to drag the window.

#### Tab Bar Location
Defines whether tabs appear at the top, bottom, or left side of your windows.

#### Status Bar Location
Defines where the status bar appears, if enabled.

#### Auto-hide menu bar in non-native fullscreen
When native fullscreen mode is disabled (in **Prefs > General**), this option is available. If you'd like the menu bar to remain visible when a fullscreen window is present on a screen with a menu bar, turn this on.

#### Exclude from Dock and Cmd-Tab Application Switcher
When this setting is enabled, iTerm2 will disappear from the dock and you won't be able to switch to it with Cmd-Tab. An icon will be added to the right side of the menu bar that lets you get back to iTerm2's preferences. This is useful if you only use hotkey windows and you want iTerm2 to keep a low profile.

<hr>
### Windows

#### Show window number in title bar
If selected, window titles include the window number. You can navigate to a window by pressing cmd-opt-N where N is the window number. You can also change which modifiers are used in **Preferences > Keys**.

#### Show border around window
If selected, a 1-pixel border will be shown around the edges of terminal windows. On macOS 10.14, window borders are only drawn for windows with some transparency. Opaque windows get a border drawn by the OS.

#### Hide scrollbars
If selected, scrollbars will be hidden in terminal windows.

#### Disable transparency for fullscreen windows by default
If enabled, entering fullscreen mode will automatically turn off transparency for that window.

#### Show line under title bar when tab bar is not visible
Turn this off for a sleek appearance with the dark theme.

#### Show proxy icon in window title bar
When enabled, an icon representing the current directory is added to the window's title bar. You can drag it.

<hr>
### Tabs

#### Show tab bar even when there is only one tab
If selected, the tab bar will remain visible when a window contains exactly one tab.

#### Preserve window size when tab bar shows or hides
When enabled, the window will not change size as the tab bar is shown or hidden. Instead, the number of rows of text inside the window may change.

#### Show tab numbers
If selected, tabs will indicate their keyboard shortcut.

#### Show tab close buttons
If selected, tabs show close buttons. If not selected, the close buttons only appear when the mouse hovers over the tab.

#### Show activity indicator
If selected, the activity indicator in each tab will be displayed when new output is received and the tab is not selected.

#### Show new-output indicator
If selected, non-selected tabs will indicate they have unseen output with a blue circle in the tab.

#### Flash tab bar when switching tabs in fullscreen
If selected, the tab bar will show briefly when switching tabs in a fullscreen window. It will also show briefly when the number of tabs changes.

#### Show tab bar in fullscreen
If selected the tab bar will be visible in fullscreen windows.

#### Stretch tabs to fill bar
If selected, tabs will grow large enough to fill the entire tab bar, like system native tab bars. This is on by default.

<hr>
### Panes

#### Show per-pane title bar with split panes
When a tab has split panes, this option controls whether each split pane will have its own title bar.

#### Separate status bars per pane
When enabled, each pane gets its own status bar. When disabled, the window has a single status bar that shows information pertaining to the current pane.

#### Separate background images per pane
When disabled, the current pane's background image fills the window, spanning all panes.

<hr>
### Dimming

#### Dimming amount
This slider controls how much to dim inactive windows or panes.

#### Dim inactive split panes
If selected, split panes that do not have keyboard focus will be slightly dimmed.

#### Dim background windows
If enabled, windows in the background (that is, those not receiving keyboard input) are dimmed according to the above settings.

#### Dimming affects only text, not background
When a window or pane is dimmed, this option controls whether the background color is dimmed or only the text colors.


