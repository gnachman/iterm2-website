There are two kinds of variables: user-defined variables and iTerm2-defined
variables. User-defined variables may be set by an escape sequence described
below. They may also be set by Python scripts. See
<a href="/python-api">iTerm2 Python API</a> for details.

### iTerm2-Defined Variables

The following variables are defined by iTerm2:

<table style="background: white">
  <tr class="tableheader">
    <th style="width: 100pt">Variable Name</th>
    <th>Description</th>
  </tr>

  <tr>
    <td>session.name</td>
    <td>The session name excluding markup like the tmux integration arrow.</td>
  </tr>

  <tr>
    <td>session.columns</td>
    <td>The number of columns in the current session.</td>
  </tr>

  <tr>
    <td>session.rows</td>
    <td>The number of rows in the current session.</td>
  </tr>

  <tr>
    <td>session.hostname</td>
    <td>The current hostname. Only set if <a href="shell_integration.html">Shell Integration</a> is installed.</td>
  </tr>

  <tr>
    <td>session.username</td>
    <td>The current username. Only set if <a href="shell_integration.html">Shell Integration</a> is installed.</td>
  </tr>

  <tr>
    <td>session.path</td>
    <td>The current path. Works best if <a href="shell_integration.html">Shell Integration</a> is installed.</td>
  </tr>

  <tr>
    <td>session.profileName</td>
    <td>The name of the profile that created the session.</td>
  </tr>

  <tr>
    <td>session.terminalIconName</td>
    <td>The "icon title", as set by an escape sequence. This can be understood as the session name (as opposed to the terminal-set window name, below)</td>
  </tr>

  <tr>
    <td>session.triggerName</td>
    <td>The title as set by a trigger with the "Set Title" action.</td>
  </tr>

  <tr>
    <td>session.terminalWindowName</td>
    <td>The "window title", as set by an escape sequence.</td>
  </tr>

  <tr>
    <td>session.jobName</td>
    <td>The name of the currently running foreground job.</td>
  </tr>

  <tr>
    <td>session.presentationName</td>
    <td>The session name, including annotations such as the arrow indicating a tmux integration session.</td>
  </tr>

  <tr>
    <td>session.tmuxWindowTitle</td>
    <td>The window title for a tmux window this session belongs to.</td>
  </tr>

  <tr>
    <td>session.autoName</td>
    <td>Starts as the profile name, and then holds the most recent title as set manually, by escape sequence, or by trigger.</td>
  </tr>

</table>

### User-Defined Variables

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

Variables are used in various places:

 * <a href="documentation-badges.html">Badges</a>

### Escape Sequences

User-defined variables may be set with the following escape sequence:

<pre>
OSC 1337 ; SetUserVar=<i>name</i>=<i>Base64-encoded value</i> ST
</pre>

This is what iterm2_set_user_var sends. Generally you should use the *iterm2_print_user_vars* mechanism described above instead of sending this escape sequence directly.

