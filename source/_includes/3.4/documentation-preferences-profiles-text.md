## Profiles
### Text

#### Cursor
This lets you select a cursor shape.

#### Blinking cursor
If checked, the cursor will blink slowly to improve visibility.

#### Draw bold text in bold font
If selected, bold text will be drawn in a bold version of the selected font. If the font does not have a bold version, then a bold appearance is simulated by "double striking" the text: that is, drawing it twice, shifting it one pixel horizontally the second time.

#### Blinking text
If selected, text with the blink attribute set will actually blink. Oh, the humanity.

#### Italic text
If selected, text with the italic attribute set will be rendered in italics. The font you select must have an italic face.

#### Use thin strokes for anti-aliased text
Anti-aliased text will be drawn with thinner strokes by default on Retina displays when the background color is darker than the foreground color. The effect may be more or less visible depending on your particular hardware and OS version. You can configure when thin strokes are used depending on display type and colors.

#### Use built-in Powerline glyphs
When enabled, iTerm2 renders Powerline glyphs itself rather than using what is built-in to the font. These glyphs tend to line up better with other elements than font-provided glyphs.

#### Enable subpixel anti-aliasing (macOS 10.14 and 10.15 only)
When enabled, subpixel anti-aliasing is enabled throughout the application. You must restart iTerm2 for this to take effect. Subpixel anti-aliasing uses artifacts of LCD displays to improve the perceived resolution. Enabling this incurs a minor performance penalty for drawing operations.

This is not available in macOS 11.0 and later because Apple has removed support for it.

#### Use Unicode Version 9 Widths
Unicode version 9 offers better formatting for Emoji. If your applications have been updated to use these tables, you should enable this setting.

#### Treat ambiguous-width characters as double width
Some characters (e.g., Chinese ideograms) are double-width, and take two cells to display. Other characters (e.g., Latin letters) are single width and take only one cell to display. There is another category of characters known as "ambiguous width". One example of ambiguous-width characters are Greek letters. Depending on your application, you may prefer to display them as double-width or single-width. If most of the text you deal with is double-width, then you should enable this setting as it will help things to line up correctly in that context.

#### Unicode normalization form
This affects how text is processed on input. Most users will want no normalization. HFS+ normalization preserves the fullwidth attribute of composed characters. 

#### Regular font
ASCII text (latin letters, numbers, and some symbols) will be drawn using this font. Select "Anti-aliased" to draw the text with smooth edges.

#### Non-ASCII font
All non-ASCII text (many accented Latin letters, non-Latin text, less-common symbols, and thousands of miscellaneous unicode characters) will be drawn with this font. It is recommended that you use the same point size for both regular and non-ASCII fonts. Select "Anti-aliased" to draw the text with smooth edges.

#### Ligatures
When enabled and you have a font that supports ligatures (such as FiraCode) then text will be rendered with ligatures. This makes drawing much slower for two reasons: first, it disables the GPU renderer. Second, it uses a slower API. Users on less-than-stellar hardware may not want to enable it.

