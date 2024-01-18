## Profiles
### General

#### Name
Gives the name of the profile which is shown in menus, preferences, and the profiles window. This serves as the default session name for sessions created with this profile, which is an interpolated string.

#### Shortcut key
This shortcut can be used to open a new window or tab. By default, it opens a new tab, but if you hold down the option key while pressing the shortcut, a new window will be opened instead.

#### Tags
Tags are a collection of words or phrases that annotate a profile. When you search your profiles (for instance, in the profiles window), the tag names are searched in addition to the profile name. If a tag name contains a slash that defines a hierarchy of menu items in the **Profiles** menu.

#### Badge
The badge is a large label visible in the top right of a terminal session behind its text. For more information see <a href="badges.html">Badges</a>. This is an interpolated string.

Click the *Edit...* button to configure the position, maximum size, and typeface of the badge.

#### Title
This menu contains items which may be separately enabled. They are combined to form the session's title. The session's title is shown in per-pane title bars, when visible; it is also the default tab title. The current tab title also serves as the window title. The standard items in this menu are:

  * *Session Name* - The session name defaults to the profile name but may be changed later through the **Edit Session** dialog.
  * *Profile Name* - Gives the current name of the profile the session uses. If the session's profile changes, this profile name will be updated.
  * *Profile &amp; Session Name* - Shows both names if they are different or just the shared name if they are the same.
  * *Job* - The name of the foreground job.
  * *User* - The current user name. Use Shell Integration to enable this to work when connected to a remote machine.
  * *Host* - The current host name. Use Shell Integration to set the host name.
  * *PWD* - The present working directory. Use Shell Integration to enable this to work when connected to a remote machine.
  * *TTY* - The path to the TTY device associated with this session.

If a script that installs a custom title provider is running, its offerings will be added to the bottom of the list. For a working demo, see the <a href="https://iterm2.com/python-api/examples/georges_title.html">George's Title Algorithm</a> example.

<a href="https://iterm2.com/documentation-session-title.html">Learn more about session titles.</a>

#### Applications in terminal may change the title
When enabled, a control sequence can change a session's or window's title.

#### Subtitle
A tab's subtitle is a second line in a smaller typeface beneath the main title. It can be set by a control sequence or you can define it as an interpolated string. If your configuration has a legacy "short tabs" setting then you'll be prompted to enable "tall tabs" first, to make room for subtitles. That makes room for the second line of text and brings tab height up to the standard used by the most recent version of macOS.

#### Icon
You may assign an icon to the profile, elect to use the built-in icon (which is based on the foreground application), or to have no icon at all. Icons appear in the tab bar and the window title bar.

#### Command
This is the command that is executed when a new session with the profile is created. If *login shell* is chosen, then `login` is invoked. You can put special terms surrounded by $$ in this field (example: $$USERNAME$$). When a new session is created, you will be prompted to enter a value for each such term. See the description of URL Schemes below for details about the special "$$" value that can go in this field.

When *custom shell* is selected, you should enter the path to a shell (e.g., `/usr/local/bin/bash`) and it will be run as a login shell.

If *Command* is set to `SSH` then SSH integration will be used. SSH integration adds some features that regular SSH does not have:

  * Set environment variables automatically
  * Load shell integration automatically
  * Copy over local files to remote host
  * Features like CPU utilization in the status bar will show values from the remote host.

Consider SSH integration to be a beta quality feature.

To take full advantage of it the remote host must have Python 3 installed.

It is not recommended for SSHing to non-Unix hosts.

When you have selected SSH you can click the *Configure* button to further configure the SSH connection.

In this configuration window you can turn off `SSH Integration` to fall back to the system ssh command. You can also list environment variables to copy to the remote host. The values come from the current session. You can also edit the list of files to copy upon connection and where to place them on the remote host.

#### Send Text at Start
This text will be sent when a session begins. If it is not empty then a newline will be sent afterwards. It does not accept any special characters or require any escaping.

#### Working directory
Normally, new sessions begin in your home directory. You can choose to open new sessions in the same directory as the current session (but only when creating a new tab), or you can specify a starting directory.

#### URL Schemes
You can configure a profile to handle a URL scheme, such as ssh. When a hyperlink is clicked on with that scheme, a new tab is opened with the selected profile. It is recommended that you set the command to "$$", in which case an ssh command line will be auto-generated. For other schemes, you can uses these variables in the Command field and they will be replaced with the appropriate part of the URL:
<ul>
      <li>$$URL$$ The complete url</li>
      <li>$$HOST$$ The host portion of a url like scheme://host/</li>
      <li>$$USER$$ The username portion of a url like scheme://user@host/</li>
      <li>$$PASSWORD$$ The password portion of a url like scheme://user:password@host/</li>
      <li>$$PORT$$ The port number of a url like scheme://host:port/</li>
      <li>$$PATH$$ The path portion of a url like scheme://host/path</li>
      <li>$$RES$$ The portion of a url following the scheme.</li>
</ul>


