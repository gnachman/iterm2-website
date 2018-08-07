A hotkey is a keypress that iTerm2 responds to even if another application is active. iTerm2 recognizes three kinds of hotkeys: Toggle All Windows, Session Hotkeys, and Profile Hotkeys.

### Toggle All Windows

This hotkey shows or hides all iTerm2 windows. It does not change their positions. It is meant for quickly switching between iTerm2 and other applications. Configure this in **Preferences > Keys > Show/hide all windows with a system-wide hotkey**. Turn on the checkbox and then click in the text field beneath it and type the hotkey you'd like to use.

### Session Hotkeys

You can assign a hotkey to a particular session. Select **Session > Edit Session** to modify properties of the current session. The preference window will open, and at the bottom of the *General* tab is a field where you can set a hotkey that opens iTerm2 to reveal that session.

### Dedicated Hotkey Windows

A dedicated hotkey window is a window that is associated with a profile and has a hotkey attached to it. By pressing the hotkey, the window opens or closes. This is similar to the old Visor app. In its simplest form, it's a system-wide terminal window that you can open with a hotkey. iTerm2 allows you to assign multiple hotkeys to a single profile or even a single hotkey to multiple profiles. You can also assign the double-tap of a modifier.

To create your first dedicated hotkey window, go to **Preferences > Keys** and click **Create a Dedicated Hotkey Window**. This will create a new profile called **Hotkey Window**. You'll be prompted to configure the window. The following settings are available:

  * Pin hotkey window: If selected, the hotkey window remains open when another window gets keyboard focus. When off, the window will automatically hide when you select another window (whether in iTerm2 or another app)
  * Automatically reopen on app activation: If selected, this dedicated hotkey window will reveal itself when iTerm2 is activated (such as by clicking the dock icon or another iTerm2 window).
  * Animate showing and hiding: Controls whether hotkey windows animate in and out or quickly jump-cut in and out.
  * Floating window: When selected, the dedicated hotkey window can appear over other apps' full screen windows (provided the profile's **Window > Space** setting is **All Spaces**). Floating windows overlap the dock.
  * On Dock icon click: This setting configures what happens when the dock icon is clicked.

If you want to assign multiple hotkeys to a single dedicated hotkey window, add them by clicking **Additional Hotkeys**.

You can configure an existing hotkey window by clicking **Configure Hotkey Window** in **Prefs > Profiles > Keys**.
