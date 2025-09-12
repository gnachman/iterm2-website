## Keys
<hr>

### Key Bindings

This interface works like the keyboard shortcut system in profiles (described above) but it affects all profiles. Settings here are overridden by those in a profile's key mappings.

See the list of key binding actions at <a href="documentation-preferences-profiles-keys.html">Settings&nbsp;>&nbsp;Profiles&nbsp;>&nbsp;Keys</a>.

#### Add Touch Bar Item
This button is only visible if your OS version supports touch bars. By pressing this button, you can define a new custom touch bar button with any of the actions you can assign to a key (see below). You can then add the custom button to your touch bar with **View > Customize Touch Bar**.

#### Touch Bar Mitigations
This opens a panel with these options:

 * *Haptic feedback when pressing esc* When you press esc on a touchbar, this makes the trackpad vibrate to provide feedback.
 * *Key click for virtual esc key* When you press esc on a touchbar, this causes a click sound to be played.
 * *Visual esc key indicator* When you press esc on a touchbar, make the cursor change shape briefly to provid feedback.

#### Presets > Factory Defaults
Restores key bindings to the iTerm2 defaults.

#### Presets > Import/Export
Lets you share key bindings with others.

#### Interpret key bindings based on physical key, ignoring input language
When enabled key bindings refer to a particular key rather than a particular character. For example, suppose you have bound Cmd-Opt-A to perform some action while using a US keyboard and then switch to an AZERTY layout. With this setting enabled, you'd press Cmd-Opt-Q to invoke the action since the AZERTY `Q` is where the QWERTY `A` goes.

Note that only key bindings created with iTerm2 version 3.5.0beta19 or later will adapt to different keyboard layouts. Older key bindings did not store the keycode and will continue to behave as though this setting was not enabled.

#### Leader

By defining a "leader" key you can create shortcuts that consist of two keystrokes. Command-B is the recommended leader. After setting the leader, you can define a new keybinding by pressing `Leader` followed by another keystroke. For example, if your leader is Command-B, you could define a key binding as the sequence `Command-B` `N`.

In tmux integration key bindings are automatically created for you based on tmux's configured command key bindings. For example, if tmux is configured for `C-b c` to create a new window, then in tmux integration `[leader] c` will do the same.

### Navigation Shortcuts

#### Shortcut to activate a tab
Tabs are normally navigated with cmd+number, but you can change the modifier used for that function here.

#### Shortcut to activate a window
Windows are normally navigated with cmd+opt+number, but you can change the modifier used for that function here.

#### Shortcut to choose a split pane
You can use this to configure a modifier+number shortcut to select a split pane in the current tab.

#### Emulate US Keyboard
If your keyboard layout requires you to hold Shift (or some other modifier) to press a number, enable this to treat the top row of keys as number keys even when Shift is not pressed. This only affects switching panes, tabs, and windows by keyboard as configure in the preceding settings.

### Hotkey

#### Create a Dedicated Hotkey Window
Sets up a new hotkey window profile if you don't already have one. For more information, see <a href="documentation-hotkey.html">Hotkey Windows</a>.

#### Show/Hide iTerm2 all windows with a system-wide hotkey
When enabled, you can focus the Hotkey: field and press a keystroke. From then on, pressing that keystroke (even when iTerm2 is not the front application) will cause iTerm2 to come to the front. If it is the foreground app, it will be sent to the back. This requires that you enable access for assistive devices in the Universal Access panel of System Settings. For more information, see <a href="documentation-hotkey.html">Hotkey Windows</a>.

### Remap Modifiers

iTerm2 allows you to change the meanings of the modifier keys only within iTerm2. This is useful, for example, if you find it difficult to press "option" for "meta" and would prefer to use "command" for that purpose.

### Input Locale

#### Force keyboard
You can enable this setting to force iTerm2 to use a specific keyboard layout rather than the current system keyboard.
