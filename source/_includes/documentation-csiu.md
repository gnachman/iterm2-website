`CSI u` mode is no longer recommended. Applications should implement the Kitty key reporting protocol instead.

`CSI u` is a mechanism for reporting keystrokes that is more powerful than the standard used in Unix.

The specification may be found at <a href="http://www.leonerd.org.uk/hacks/fixterms/">Fix Keyboard Input on Terminals - Please</a>.

The protocol is sometimes referred to as `libtermkey` or `libtickit`.

When you enable `CSI u` mode you may be prompted to remove incompatible key mappings. iTerm2 has various built-in default key mappings for function keys and arrow keys that are not needed in CSI u mode. You can restore them by selecting the appropriate configuration from **Load Preset**.

A few items of note:

  * On macOS, the Insert key is not supported. The Help key, which usually takes its place, acts like Insert.
  * The numeric keypad Enter key is treated the same as the regular Enter key.
  * F16 through F24 do nothing in CSI u mode. Regular keyboards don't have them, but the Touch Bar does.

In version 3.4 of iTerm2, CSI u mode adheres to the standard and does away with some backward compatibility control sequences that 3.3 supported in a deviation from the standard. These were for the following characters when combined with Control: `-, _, / ,?, 2, 6, [, and ]`. If you prefer to use the non-CSI-u sequences for these codes, import this keymap file in to your profile by choosing **Prefs > Profiles > Keys > Key Bindings > Presets… > Import…**.

[CSIu-Backward-Compat.itermkeymap](/keymaps/CSIu-Backward-Compat.itermkeymap)

### Applications

  * neovim supports CSI u out of the box with no additional configuration needed.
