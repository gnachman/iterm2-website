## Profiles

#### Modes
Profiles may have different colors configured for light and dark mode. If you select *Use separate colors for light and dark mode* then you can switch between modes using the *Editing* control. Otherwise, only one set of colors will be assigned to this profile.

#### Color Presets...
iTerm2 ships with some color presets, which you may load from this popup menu. You can import and export color presets to files with the extension "itermcolors". There is an online color gallery where users may share color presets, and a link to it is provided in this menu. When importing a color preset, the name it is assigned is based on the filename imported.

### Colors

Clicking on any of the color wells opens a color picker that lets you change the setting for the selected color. iTerm2 has a custom color picker. If you don't like it you can revert to the system color picker by clicking the rectangular icon to the right of the eyedropper.

#### Context-aware cursor color
When selected, a box cursor will be displayed in reverse video. If this would result in confusion because nearby background colors would be very similar to the cursor's color, then a different color is chosen that will be most visible.

#### Cursor Boost
Cursor Boost dims all colors other than the cursor colors to make the cursor stand out more.

#### Cursor Guide
The cursor guide is a horizontal rule that indicates the vertical position of the cursor. You can adjust its color, including alpha value, to make it more visible against your background color.

#### Bold
When enabled, this color is used for bold text.

#### Underline Color
If enabled, this color will be used for all underlining, independent of the color that underlined characters have themselves.

#### Faint text opacity
Selects how prominent "faint" text is.

#### Minimum Contrast
Sometimes text in a terminal can be hard to read because the background and text colors are too similar. Because ANSI colors are configurable, apps have a hard time avoiding this problem. To ensure legibility, you can increase the Minimum Contrast setting. It has the effect of shifting text colors that are similar to their background colors closer to black or white. As this setting is increased, more colors are affected and the effect is greater. At 100, all text will be pure black or pure white. Minimum contrast never modifies background colors.

#### Selection
When enabled, you can specify a color for selected text. When disabled, the regular color is used (which may be difficult to read if the text color is similar to the selection color).

#### Use custom color for selected text
When enabled, the color you specify here for *Foreground* will be used for selected text. Otherwise, text color won't change when a selection is made.

#### ANSI Colors
These are the 16 standard colors most often used in terminal emulators. To the right is a visualization in polar coordinates where the angle gives the hue and the distance from center gives the saturation. This can help you configure colors that cover the color space consistently.

#### Tab Color
If enabled, this color will decorate the tab control. Tabs indicate the color of their current session if there is more than one split pane.

