---
layout: default
title: Automatic Profile Switching - iTerm2 - Mac OS Terminal Replacement
---
### Automatic Profile Switching
iTerm2 can use information it knows about your current path, host name, and user name to change profiles. For example, your window's background color or the terminal's character encoding could change when connecting to different hosts.

### Prerequisites
This feature is only available in iTerm2 version 2.9 and later (known as the beta release of version 3). You must install <a href="/shell_integration.html">Shell Integration</a> on all machines and all user accounts where you plan to use Automatic Profile Siwtching.

#### Rule Syntax
In *Preferences&gt;Profiles&gt;Advanced*, you may specify a set of rules.

<img src="/images/AutomaticProfileSwitching.png">

When any session satisfies a rule in a given profile, it will switch to that profile. Rules consist of three optional components: the user name, the hostname, and the path. At least one component must be present, since an empty rule is not allowed. The hostname is required only when both a user name and a path are specified.

A user name is a unix accont name (e.g., *root*) followed by an `@`.

A path always begins with a `/`. Any time a hostname is followed by a path, they are separated by a `:`. For example, `iterm2.com:/users/george`.

A hostname can be a DNS name, like `iterm2.com` or an IP address like `127.0.0.1`. A hostname may contain one or more `*` characters, which act as a wildcard (like globbing in Unix).

Some examples:

  * george@iterm2.com:/users/george
  * george@*:/users/george
  * *:/users/george
  * *.iterm2.com:/users/george
  * dev.*.com:/users/george
  * george@iterm2.com
  * iterm2.com
  * george@
  * iterm2.com:/users/george
  * /users/george

Because more than one rule may match at any given time, more complex rules will take priority over less complex rules. The priority order is defined like this:

  * A username, hostname, and path. For example, "george@iterm2.com:/Users/george".
  * A username and path, using "*" for the hostname. For example, "george@*:/Users/george".
  * A combination of username and hostname. For example, "george@iterm2.com".
  * A hostname and path. For example, "iterm2.com:/Users/george".
  * A hostname. For example, "iterm2.com".
  * A username alone. For example, "george@".
  * A path alone. For example, "/Users/george".

The UI tries to prevent you from entering the same rule in two different profiles, but if that does happen then one profile is chosen arbitrarily.

### Triggers

Since it's impractical to install shell integration everywhere (for example, as *root*), there will be times when you need to write a trigger to detect the current username or hostname. Please see the *Triggers* section of <a href="/shell_integration.html">Shell Integration</a> for details.

### Troubleshooting

There are a few ways things can go wrong. Please see the <a href="https://gitlab.com/gnachman/iterm2/wikis/scp-not-connecting">Why doesn't secure copy/automatic profile switching work?</a> document for help diagnosing and fixing these issues.

