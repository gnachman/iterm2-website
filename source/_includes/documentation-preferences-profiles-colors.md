## Profiles
### Colors

Clicking on any of the color wells opens a color picker that lets you change the setting for the selected color. iTerm2 has a custom color picker. If you don't like it you can revert to the system color picker by clicking the rectangular icon to the right of the eyedropper.

#### Use different colors for light mode and dark mode
When enabled, a second set of color settings becomes available which takes effect in dark mode. When enabled, the colors will be the same regardless of the mode.

#### Editing: Light/Dark Mode
When *Use different colors for light mode and dark mode* is enabled, use this to select which colors you're editing.

#### Smart cursor color
When selected, a block cursor will be displayed in reverse video. If this would result in confusion, then a different color is chosen that will be most visible given the surrounding cells' background colors.

#### Minimum contrast
If text is displayed against a similar background color, the minimum contrast setting will move the text color towards black or towards white to ensure some minimum level of visibility. Setting this slider all the way to maximum will make all text black and white.

#### Cursor Boost
Cursor Boost dims all colors other than the cursor colors to make the cursor stand out more.

#### Tab Color
If enabled, this color will decorate the tab control. Tabs indicate the color of their current session if there is more than one split pane.

#### Underline Color
If enabled, this color will be used for all underlining, independent of the color that underlined characters have themselves.

#### Cursor Guide
The cursor guide is a horizontal rule that indicates the vertical position of the cursor. You can adjust its color, including alpha value, to make it more visible against your background color.

#### Color Presets...
iTerm2 ships with some color presets, which you may load from this popup menu. You can import and export color presets to files with the extension "itermcolors". There is an online color gallery where users may share color presets, and a link to it is provided in this menu. When importing a color preset, the name it is assigned is based on the filename imported.

#### Bold
When enabled, this color is used for bold text.

#### Selected Text
When enabled, you can specify a color for selected text. When disabled, the regular color is used (which may be difficult to read if the text color is similar to the selection color).

#### Faint text opacity
Selects how prominent "faint" text is.

#### Minimum Contrast
Sometimes text in a terminal can be hard to read because the background and text colors are too similar. Because ANSI colors are configurable, apps have a hard time avoiding this problem. To ensure legibility, you can increase the Minimum Contrast setting. It has the effect of shifting text colors that are similar to their background colors closer to black or white. As this setting is increased, more colors are affected and the effect is greater. At 100, all text will be pure black or pure white. Minimum contrast never modifies background colors.
