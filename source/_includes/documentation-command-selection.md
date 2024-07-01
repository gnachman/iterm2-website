If you have [Shell Integration](documentation-smart-selection.html) installed, you can click on a command or its output to select it.

The selection is indicated by drawing a colored line around the command and its output. Other areas are dimmed.

When a command is selected:

 * Search is restricted to the selected region.
 * Filtering is restricted to the selected region.
 * `Select All` is restricted to the selected region.

Additionally, various buttons appear at the top right of the selected region:

 * An Info button, which opens the Command Info panel. This reveals information about the command such as how long it ran and its exit status and gives you controls to re-send, copy, share, and more.
 * A Share button, which opens a menu allowing you to save, copy, or share the command.
 * A bookmark button, which allows you to create a "named mark". You can find named marks under `Edit > Named Marks` or in the `Named Marks` tool in the toolbelt. This makes it easy to navigate back to a command later on.
 * A copy button, which lets you copy the command or its output.

### Disabling

To disable command selection turn off `Settings > General > Selection > Clicking on a command selects it to restrict Find and Filter`.

### Command URLs

The share button introduces the concept of command URLs. Here is a simple example of a command URL: `iterm2:/command?c=date`.

The scheme is always `iterm2` and the path is always `/command`.

If a hostname is present, iTerm2 will attempt to ssh to the host to run the command. For exmaple, `iterm2:gnachman@example.com/command?c=date` runs `date` on host `example.com` as user `gnachman`.

The optional `d` query parameter gives a directory to change into prior to running the command.

Normally when you open a command URL you are presented with a window that describes what will be done and offers options on how to run it (e.g., in a new tab, a new window, or in the current session). The optional `silent` query parameter suppresses this window. A confirmation dialog is shown instead. If the user consents, the command runs in the background and its output is not shown. This query parameter does not take a value.

