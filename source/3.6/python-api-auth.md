---
layout: default
title: Python API Security - iTerm2 - macOS Terminal Replacement
---

## Python API Security

Note: This document applies to iTerm2 version 3.4.0 and later.

The Python API aims to provide a safe and reliable way for programs to control
iTerm2. The data in iTerm2 is particularly sensitive because a compromise would
affect not only the local machine but also on remote hosts that you connect to
with ssh. This document describes how the Python API works on version 3.4 and
later.

By default, the Python API is disabled. No program can use it when in this state.

The user may choose to enable it in settings. When enabled, a unix domain
socket is created. While running, iTerm2 listens and accepts connections on
this socket. Any program running on the local machine may open the socket and
attempt to use it. By default, a connection must be authenticated in order to
be allowed to use the API.

Programs can authenticate themselves by providing a valid cookie. A cookie is a
128-bit random number. When iTerm2 launches a Python script (such as from the
Scripts menu), it sets the `ITERM2_COOKIE` environment variable. When the
Python script connects to the unix domain socket, it passes along the cookie
from its environment.

When a program outside iTerm2 wishes to use the API, it needs to request a
cookie. iTerm2 vends cookies using an AppleScript API. The reason is that macOS
provides a permission system that manages which pairs of apps can communicate
with AppleScript. By requiring an external program to acquire permission to use
AppleScript (formally known as "Automation" permission) before using the Python
API, the macOS-standard level of security is delivered.

Some users may experience problems with AppleScript, either due to bugs in
macOS or limitations in the OS's ability to grant certain apps permission to
use it. iTerm2 offers an escape hatch: you can elect to disable the cookie
requirement by selecting **Allow all apps to connect** in **Prefs > General >
Magic**. Only a user with Administrator access may change this setting. The way the
setting is enabled is to create a file in `$HOME/Library/Application
Support/iTerm2/disable-automation-auth` that meets the following criteria:

 * It must be owned by `root`.
 * Its contents must consist of the absolute path to the file, hex-encoded, followed by the magic string ` 61DF88DC-3423-4823-B725-22570E01C027`.

The reasons for these restrictions are to make it impossible for other
non-administrator users on the system to change the setting, even by creating a
hard link.

iTerm2 verifies that the file is properly crafted before allowing a connection
to the API that lacks a proper cookie.

If your home directory changes location or the file is modified, you'll be
warned and the Python API will be disabled. You can re-enable it in **Prefs >
General > Magic > Enable Python API**.

Additional information about the iTerm2 security model and the Python API is
available  at <a
href="https://gitlab.com/gnachman/iterm2/-/wikis/iTerm2-Version-3.3-Security-Updates">iTerm2
Version 3.3 Security Updates</a>.
