A session archive is a saved copy of a session's scrollback that you can restore later. It captures the session's contents so you can set aside a terminal's history and reopen it whenever you need it.

## Saving and Restoring Archives

The archive commands live under **Shell > Archives**.

Choose **Save Archive of Current Session…** to write the current session's scrollback to a file. Choose **Restore Archive…** to pick a saved archive and reopen it. iTerm2 remembers your ten most recent archives and lists them in the **Archives** submenu, so you can restore a recent one without hunting for the file.

Restoring an archive reopens the session's scrollback in a new window.

## Archiving Sessions Automatically

You can have iTerm2 archive a session for you when it closes. In **Settings > Profiles > Session**, turn on **Archive sessions on closure** and choose a destination directory. When a session using that profile closes, iTerm2 automatically writes an archive of its scrollback to that directory. See [Profiles > Session](documentation-preferences-profiles-session.html) for the related settings.
