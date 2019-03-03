Session titles are highly configurable. There are several concepts to understand:

### Session Title

This is the label that is shown in split pane title bars (if present). By default the *session title* is also the tab title. You can override this default, which will be discussed later.

The session title may be composed of one or more built-in elements. Alternately, it may be provided by a Python script using the <a href="/python-api/registration.html#iterm2.registration.TitleProviderRPC">Session Title Provider</a> facility.

### Elements

A menu in **Preferences > Profiles > General** labeled **Title** allows you to select the elements that will appear in the session title. The first three options are mutually exclusive.

#### Session Name

The **Session Name** is initialized to the **Profile Name** when a new session is created. Various mechanisms may change it:

  * Changing the **Session Name** field in the **General** pane of the **Edit Session** dialog, opened from the menu item **Session > Edit Session**.
  * Activating a **Set Title** <a href="/documentation-triggers.html">trigger</a>.
  * Renaming the underlying profile, provided the session name hasn't been overridden by another mechanism (such as those described in this section).
  * Receiving a control sequence that updates the "icon title". These are OSC 0 and OSC 1.

The **Session Name** is stored in the `autoNameFormat` <a href="documentation-variables.html">variable</a>. It is an <a href="documentation-scripting-fundamentals.html">interpolated string</a>. The evaluated value is stored in the `autoName` variable.

The titles set by control sequences get escaped so they cannot cause function invocations.

#### Profile Name

The **Profile Name** is the name of the underlying profile. The only way it can change is by renaming the profile.

#### Session &amp; Profile Name

When this element is selected, the Profile Name is shown until the Session Name becomes different. Then, both are shown.

#### Job

This is the name of the current foreground job.

#### User

This is the current user name. If you use <a href="documentation-shell-integration.html">Shell Integration</a> this will update when sshing or sudoing.

#### Host

This is the current host name. If you use <a href="documentation-shell-integration.html">Shell Integration</a> this will update when sshing.

#### PWD

This is the current working directory. If you use <a href="documentation-shell-integration.html">Shell Integration</a> this will update when sshing.

#### TTY

This is the name of the tty device assigned to this session.

### Session Title Providers

When a Python script that provides a session title is running, its offerings will appear at the bottom of the *Session Title* menu. The script must remain running for the session title to be kept up to date. When the script is not running the title will be an ellipsis.
