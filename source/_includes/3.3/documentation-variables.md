Sessions, tabs, windows, and the iTerm2 application itself each have bits of
information that are useful to users and script writers. For example: a session
has a working directory, a tab or a window may have a custom title, and the
iTerm2 process has a theme such as light or dark mode.

The mechanism for managing this information is called "variables". A variable
has a name, such as "hostname", and a value. The value is any data type
encodable in JSON: numbers, booleans, strings, dictionaries, arrays, and null.
A variable also exists in some context. Each session, tab, and window has its
own context. The application itself also has a context, called the global
context. There is also a special kind of variable that references a different
context instead of holding a JSON-encodable value.

iTerm2 defines a number of built-in variables. There are also special contexts
for user-defined variables. A user-defined variable has a value set by a
control sequence or a script.

Variables were originally invented for
[Badges](https://www.iterm2.com/documentation-badges.html) as a way for users
to embed text in a badge. For example, this might be the current git branch.

As the [Python scripting API](https://www.iterm2.com/python-api) was developed,
it became clear that variables were a useful tool for sharing information
between iTerm2 and scripts.

### Function Calls

Scripts may register functions which users can invoke through various hooks.
For example, you can bind the invocation of function call to a keypress or a
trigger.

An *invocation* names the function, its arguments, and the values being passed
to the function.

For example, let us consider a hypothetical function that creates a new window
using a passed-in initial working directory and profile. We'll name our
function `create_window`. Every function has a name.

A function may take parameters. Every parameter has a name. Let's call the
parameter names for our example `initialDirectory` and `profileName`.

To open a window with the initial working directory of `/etc` and profile
`Default` we would use the following invocation syntax:

```
create_window(initialDirectory: "/etc", profileName: "Default")
```

Because every parameter is named the order of parameters does not matter. You
could exchange them and it would work the same.

If you wanted to use the working directory of the user's current session and
you knew the function would be invoked in the session context (which is the
context in which almost all function invocations occur) you could write:

```
create_window(initialDirectory: path, profileName: "Default")
```

The identifier `path` refers to a variable in the session context which holds
the user's current working directory.

A function may also return a value. That will be discussed in the section on
interpolated strings below.

### Interpolated Strings

Another way that varibles are exposed in iTerm2's user interface is through
*inteprolated strings*. An interpolated string is a string of text that
contains embedded function calls or references to variables.

iTerm2 borrows some of the Swift language's syntax for interpolated strings.
This is not an attempt to implement the full Swift language, nor will iTerm2
ever contain a full-fledged language of its own. To embed an expression in a
string, place it in `\(…)`. For example, you could set a session's name to:

```
The current host name is \(hostname)
```

The expression `hostname` will be replaced with its value. Since `hostname` is
a variable defined in the session context, and iTerm2 defines it to be the name
of the current hostname, the session's name will appear as something like
`The current host name is example.com`.

You may place function calls in interpolated strings. Functions may return a
value. The function's return value will be converted to a string and expanded
just as an expression referencing a variable is replaced with the variable's
value.

For example, suppose you have a function `add(x,y)` that adds two numbers.
Let's set the session name to:

```
Two plus three is \(add(x: 2, y: 3))
```

The session's name as it appears in the tab bar would be `Two plus three is 5`.

Interpolated strings may be nested. For example, imagine a function `cat(x,y)`
that concatenates the value of `x` to the value of `y`. This would be a legal
interpolated string:

```
\(cat(x: "Lorem \(cat(x: "ipsum ", y: "dolor")) sit ", y: "amet"))
```

Its value would be `Lorem ipsum dolor sit amet`.

### Following Context References

Some variables reference another context. For example, the session context has
a variable named `tab` that references the session's containing tab's context.
Likewise, the tab context has a `currentSession` variable that references the
current session's context.

You can chain variable references with `.`. For example, the working directory
of the current session of the containing tab is given by:

```
tab.currentSession.path
```

### Session Context

The following variables are defined in the context of a session:

#### Session Name
  * autoNameFormat - This is an interpolated string form which the `autoName` variable is computed. It can be modified by changing the "Session Name" field in **Edit Session…**, by a trigger that sets the session name, or by an OSC control sequence that sets the icon title. It is initialized to the profile name when a new session is created.
  * autoName - The result of evaluating the `autoNameFormat` interpolated string. This attempts to match the user's intuition of the what the session's name is.
  * name - The session's name, which is what's shown in the tab bar (excluding tmux integration decoration).
  * presentationName - The session name exactly as it appears in the session title bar.
  * terminalIconName - The "icon" title, as set by the control sequence OSC 0 or OSC 1.
  * terminalWindowName - The "window" title, as set by the control sequence OSC 0 or OSC 2.
  * triggerName - The last session name set by a trigger.

#### Terminal
  * columns - Session's width in columns
  * rows - The session's height in rows
  * tty - The path to the local TTY device
  * jobName - The name of the current foreground job (e.g., "emacs")
  * jobPid - The process ID of the current foreground job in this session.
  * mouseReportingMode - A number indicating how mouse events are reported. -1: Not reported, 0: button clicks reported, 1: not currently implemented, 2: reports clicks and drags, 3: reports clicks, drags, and movement
  * pid - The process ID of the root process in this session (typically `login`).
  * termid - Window, tab, and pane number as used in the `$TERM_SESSION_ID` environment variable.

#### Shell Integration

These values require shell integration to be installed.

  * hostname - The current hostname
  * lastCommand - The last command run in the session
  * username - The current user name
  * path - The current working directory (this works without shell integration, but not if you ssh elsewhere)

#### Auto-Logging
  * autoLogId - When automatic logging is enabled, this is the random number portion of the filename.
  * creationTimeString - A string giving the initial creation time of the session, used as part of the filename when automatic logging is enabled

#### tmux Integration
  * tmuxClientName - The name of the tmux session when tmux integration is in use (e.g., `user@localhost`).
  * tmuxRole - Unset if tmux integration is not in use. Otherwise, is "gateway" for the session in which `tmux -CC` is running or "client" in tmux integration sessions.
  * tmuxStatusLeft - In tmux integration, the value of the left side of the status bar.
  * tmuxStatusRight - In tmux integration, the value of the right side of the status bar.
  * tmuxWindowPane - In tmux integration, this gives the window pane number.
  * tmuxWindowTitle - If tmux integration is in use, this gives the name of the window title from tmux.

#### References to Other Contexts
  * tab - A reference to the variables belonging to the tab containing this session.
  * user - A context for user-set variables. Variables may be set with a custom control sequence or by using the [Python scripting API](https://www.iterm2.com/python-api). They are often set when using shell integration. See the section on **User-Defined Variables** below.
  * iterm2 - A reference to the variables belonging to the application (i.e., the global context)

#### Other
  * badge - The value of the badge. Note that the user can enter an interpolated string in the UI, but this value contains the string result of evaluating it.
  * id - A unique identifier for the session
  * profileName - The name of the current profile.

### Tab Context

  * titleOverrideFormat - An interpolated string giving the title to use for the tab. If not set, the session's title will be used. Note the session's title is configurable in **Prefs > Profiles > General > Title** and is not necessarily equal to the `autoName`, but may be derived from it (or not).
  * titleOverride - The value of `titleOverrideFormat` after evaluating it as an interpolated string.
  * tmuxWindow - In tmux integration, this is the tmux window number this tab represents.
  * id - The unique identifier for this tab.

#### References to Other Contexts
  * iterm2 - A reference to the variables belonging to the application (i.e., the global context)
  * window - A reference to the context of the enclosing window
  * currentSession - A reference to the context of the active session in this tab.

### Window Context

#### References to Other Contexts
  * currentTab - A reference to the context of the active tab.
  * iterm2 - A reference to the variables belonging to the application (i.e., the global context)

  * titleOverrideFormat - The window's interpolated string title. If not set, the current tab's title is used.
  * titleOverride - The value from evaluating the interpeted string in `titleOverrideFormat`, if set.

### Global Context

  * effectiveTheme - A space-delimited list of words describing the OS theme (e.g., "dark",  "light highContrast", "dark minimal")
  * localhostName - The best guess of what localhost's hostname is
  * pid - The process ID of the iTerm2 app


## User-Defined Variables

You can provide additional information in the form of user-defined variables. To create a user-defined variable you must modify your shell's rc script by defining a function named iterm2_print_user_vars that calls iterm2_set_user_var one or more times. See the example below.

Here's an example that sets a user-defined variable called "gitBranch" to the git branch of the current directory. Pick your shell to see the version you need: <a style="cursor:pointer" onclick="show('bash')">bash</a> | 
<a style="cursor:pointer" onclick="show('fish')">fish</a> | 
<a style="cursor:pointer" onclick="show('tcsh')">tcsh</a> | 
<a style="cursor:pointer" onclick="show('zsh')">zsh</a>

<pre id="bash">
# bash: Place this in .bashrc.
function iterm2_print_user_vars() {
  iterm2_set_user_var gitBranch $((git branch 2> /dev/null) | grep \* | cut -c3-)
}
</pre>
<pre id="fish" style="display: none">
# fish: Place this in ~/.config/fish/config.fish after the line
# "source ~/.iterm2_shell_integration.fish".
function iterm2_print_user_vars
  set -l git_branch (git branch ^/dev/null | sed -n '/\* /s///p')
  iterm2_set_user_var gitBranch "$git_branch"
end
</pre>
<pre id="tcsh" style="display: none">
# tcsh: Place this in .tcshrc
alias get_current_branch "bash -c '((git branch 2> /dev/null) | grep \* | cut -c3-)'"
alias _iterm2_user_defined_vars \
    'iterm2_set_user_var gitBranch `get_current_branch | base64`'

# Note: you always need to manually base64 encode the second argument to
# iterm2_set_user_var. If you want to define more than one variable,
# use the pattern:
# alias _iterm2_user_defined_vars \
#   '(iterm2_set_user_var key1 value1; iterm2_set_user_var key2 value2; ...)'
</pre>
<pre id="zsh" style="display: none">
# zsh: Place this in .zshrc after "source /Users/georgen/.iterm2_shell_integration.zsh".
iterm2_print_user_vars() {
  iterm2_set_user_var gitBranch $((git branch 2> /dev/null) | grep \* | cut -c3-)
}
</pre>
<br/>

### Escape Sequences

User-defined variables may be set with the following escape sequence:

<pre>
OSC 1337 ; SetUserVar=<i>name</i>=<i>Base64-encoded value</i> ST
</pre>

This is what iterm2_set_user_var sends. Generally you should use the
*iterm2_print_user_vars* mechanism described above instead of sending this
escape sequence directly.

