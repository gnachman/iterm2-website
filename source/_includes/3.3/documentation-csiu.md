`CSI u` is a mechanism for reporting keystrokes that is more powerful than the standard used in Unix.

The specification may be found at <a href="http://www.leonerd.org.uk/hacks/fixterms/">Fix Keyboard Input on Terminals - Please</a>.

The protocol is sometimes referred to as `libtermkey` or `libtickit`.

When you enable `CSI u` mode you may be prompted to remove incompatible key mappings. iTerm2 has various built-in default key mappings for function keys and arrow keys that are not needed in CSI u mode. You can restore them by selecting the appropriate configuration from **Load Preset**.

A few items of note:

  * On macOS, the Insert key is not supported. The Help key, which usually takes its place, acts like Insert.
  * The numeric keypad Enter key is treated the same as the regular Enter key.
  * F16 through F24 do nothing in CSI u mode. Regular keyboards don't have them, but the Touch Bar does.

For practical reasons, some deviations from the spec have been deemed useful. They are:

* Control-`[` sends `esc`. This is to mitigate the 2016-2019 Macbook Pro's horrid keyboard.
* Control-`@` sends `nul`. This is because by default macOS reserves Control-`2` to change desktops, making it impossible to send a `nul`.
* Control-`^` sends ASCII 30. This is because Control-`6` is unusable for the same reason as Control-`2`.
* Prior to version 3.4 of iTerm2, Control-`?` sent ASCII 127. That was removed because the backspace key already sends this.

To override these exceptions, import this keymap file in to your profile by choosing **Prefs > Profiles > Keys > Presets… > Import…**.

[Standard-CSI-u.itermkeymap](/keymaps/Standard-CSI-u.itermkeymap)

### Applications

  * neovim supports CSI u out of the box with no additional configuration needed.
