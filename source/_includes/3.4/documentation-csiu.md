`CSI u` is a mechanism for reporting keystrokes that is more powerful than the standard used in Unix.

The specification may be found at <a href="http://www.leonerd.org.uk/hacks/fixterms/">Fix Keyboard Input on Terminals - Please</a>.

The protocol is sometimes referred to as `libtermkey` or `libtickit`.

When you enable `CSI u` mode you may be prompted to remove incompatible key mappings. iTerm2 has various built-in default key mappings for function keys and arrow keys that are not needed in CSI u mode. You can restore them by selecting the appropriate configuration from **Load Preset**.

A few items of note:

  * On macOS, the Insert key is not supported. The Help key, which usually takes its place, acts like Insert.
  * The numeric keypad Enter key is treated the same as the regular Enter key.
  * F16 through F24 do nothing in CSI u mode. Regular keyboards don't have them, but the Touch Bar does.

### Applications

  * neovim supports CSI u out of the box with no additional configuration needed.
