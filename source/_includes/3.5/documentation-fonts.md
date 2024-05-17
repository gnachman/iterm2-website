While iTerm2 does not require monospaced fonts, they look much better than proportionately spaced fonts. If you want to use Consolas, you'll need to correct its baseline offset as described at <a href="https://wincent.com/wiki/Fixing_the_baseline_on_the_Consolas_font_on_OS_X">how to fix Consolas baseline</a>.

iTerm2 has the capability of rendering text with thin strokes to improve readability. You can change how this works in the **Text** panel of the **Profiles** tab of **Preferences**.

You can also specify the a "non-ASCII" font in the **Text** panel of profile preferences. This font will be used for all code points greater than or equal to 128 or for characters with combining marks.

Some fonts, such as FiraCode, support ligatures if enabled in iTerm2. You can enable ligatures in **Prefs > Profiles > Text**. Ligatures are rendered using CoreText, which is significantly slower than Core Graphics. **NOTE:** Ligatures are not supported by the GPU renderer and will reduce performance.
