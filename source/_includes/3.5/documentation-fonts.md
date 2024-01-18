While iTerm2 does not require monospaced fonts, they look much better than proportionately spaced fonts.

iTerm2 has the capability of rendering text with thin strokes to improve readability. You can change how this works in the **Text** panel of the **Profiles** tab of **Preferences**.

You can also specify the a "non-ASCII" font in the **Text** panel of profile preferences. This font will be used for all code points greater than or equal to 128 or for characters with combining marks.

Some fonts, such as FiraCode, support ligatures if enabled in iTerm2. You can enable ligatures in **Prefs > Profiles > Text**. Ligatures are rendered using CoreText, which is significantly slower than Core Graphics; ligatures are also not supported by the GPU renderer, which is also much faster than the legacy renderer.

You can specify "special exceptions" where give fonts to use for particular ranges of Unicode code points. In the presence of combining marks, only the base code is considered. This is particularly useful for so-called "Nerd" fonts. iTerm2 has the built-in capability to install a bundle of nerd fonts and to create special exceptions for them to provide a wide variety of powerline characters.

Additionally, you can enable built-in Powerline glyphs. This natively renders some of the most commonly used Powerline characters so they look perfect.
