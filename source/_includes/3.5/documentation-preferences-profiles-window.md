## Profiles
### Window

#### Transparency
This sets the transparency of the window background. It can be temporarily disabled with **View > Use Transparency**.

#### Keep background colors opaque
If selected, non-default background colors will be opaque. This is only available when transparency is greater than zero.

#### Blur
If selected, the window background is blurred provided the background has some transparency. Selecting a large radius will blur the background more, but (especially on Retina displays on older machines) comes with a performance penalty.

#### Rows/Columns
When creating a new window with this profile, it will be created with this many rows and columns.

#### Hide after opening
If enabled, a window created with this profile will immediately miniaturize after its creation.

#### Open Toolbelt
If enabled, a window created with this profile will feature an open toolbelt.

#### Custom window title
New windows created with this profile will use this title by default, overriding the default behavior of using the current tab's title as the window's title. This is an <a href="documentation-scripting-fundamentals.html">interpolated string</a>.

#### Force this profile to always open in a new window, never in a tab.
If you ask for a new tab with this profile, it will just open in a window instead. This is for people who hate tabs.

#### Use Transparency
Sets whether the transparency setting is respected for new windows created with this profile. It can then be toggled with *View > Use Transparency*.

#### Custom Tab Title
New tabs created with this profile will use this tab title by default. This is an <a href="documentation-scripting-fundamentals.html">interpolated string</a>.

#### Background Image
This allows you to select an image to display behind the terminal's text.

#### Mode
This allows you to select how the image is scaled to fit the window:

  * *Stretch* - The image is distorted to exactly fill the window.
  * *Tile* - The image is not scaled. It is tessellated.
  * *Scale to Fill* - The image is scaled up or down preserving the aspect ratio so that it completely fills the window. Parts of the image may be cropped out.
  * *Scale to Fit* - The image is scaled to exactly fill the window either horizontally or vertically. Its aspect raio is preserved. Letterboxes or pillarboxes may be added.

See also: *Settings > Appearance > Panes > Separate background images per pane*.

#### Blending
The blending slider determines how strongly the image dominates over the text's background color.

#### Style
This defines the window style.

  * *Normal* - A regular window with a title bar.
  * *Full Screen* - A full screen window. See *Settings>General>Window>Native full screen windows*.
  * *Maximized* - The window has a normal title bar but is forced to be as large as possible on the the screen it is on.
  * *No title bar* - A window without a title bar. It is hard to move but is as minimal as can be.
  * *Full-width bottom/left/top/right of screen* - A window that fills the display edge-to-edge along one dimension and is stuck to one edge of the screen. The rows or columns setting will be disregarded.
  * *Bottom/left/top/right of screen* - A window that is stuck to one edge of the screen.

#### Screen
If you have more than one screen connected, this lets you select the screen on which a new window should open. It is particularly useful for fullscreen and top-of-screen window styles. The *Screen with Cursor* option affects the initial screen of the window, but it won't follow your cursor from screen to screen.

#### Space
If you have enabled Spaces (or your OS uses Desktops instead of spaces) and have set Spaces/Mission Control to use Control+Number to switch spaces/desktops, then you can use this setting to select the initial space/desktop to open a new window using this profile.

Current Space means the window opens on the visible Space at the time it was created. For hotkey windows, Current Space causes them to move to the current Space each time they are opened.

All Spaces means the window follows you around from Space to Space.
