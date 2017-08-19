<script>
function show(name) {
  document.getElementById("bash").style.display="none";
  document.getElementById("fish").style.display="none";
  document.getElementById("tcsh").style.display="none";
  document.getElementById("zsh").style.display="none";
  document.getElementById(name).style.display="";
}
</script>

A *badge* is a large text label that appears in the top right of a terminal session to provide dynamic status, such as the current host name or git branch. Its initial value is defined in <strong>Preferences&gt;Profiles&gt;General&gt;Badge</strong> and it can be changed by an iTerm2-proprietary escape sequence. It may also reference iTerm2- and user-defined variables.

Here is an example of a session with a badge indicating the current user and host name.

<img src="images/Badge.png">

### Availability

Support for badges is available in version 2.9 and later, currently distributed in the <a href="/nightly/latest">nightly builds</a> and is in the master branch of the <a href="https://github.com/gnachman/iTerm2">GitHub repo</a>. It is not in version 2.1.1.

### Variables

A badge may reference variables. There are two kinds of variables: user-defined variables and iTerm2-defined variables. User-defined variables may be set by an escape sequence described below.

The syntax for referencing a variable is to place the variable name between *\\(* and *)*. For example:

<pre>
\(session.username)@\(session.hostname)
</pre>

Undefined variables evaluate to an empty string.

### iTerm2-Defined Variables

The following variables are defined by iTerm2:

<table style="background: white">
  <tr class="tableheader">
    <th style="width: 100pt">Variable Name</th>
    <th>Description</th>
  </tr>

  <tr>
    <td>session.name</td>
    <td>The current session's name. Defaults to the profile name. May be changed with the escape sequence <strong>OSC 1 ; <i>name</i> ST</strong>, or by editing the session title in <strong>View&gt;Edit Current Session</strong>.</td>
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
To reference a user-defined variable, refer to it as *\\(user.variableName)*. For example, to use the example above, you could set your profile's badge to:

<pre>
Current git branch on \(session.hostname) is \(user.gitBranch)
</pre>

### Escape Sequences

User-defined variables may be set with the following escape sequence:

<pre>
OSC 1337 ; SetUserVar=<i>name</i>=<i>Base64-encoded value</i> ST
</pre>

This is what iterm2_set_user_var sends. Generally you should use the *iterm2_print_user_vars* mechanism described above instead of sending this escape sequence directly.

The badge itself may be set with the following escape sequence:

<pre>
OSC 1337 ; SetBadgeFormat=<i>Base-64 encoded badge format</i> ST
</pre>

Here's an example that works in bash:

<pre style="white-space: pre">
# Set badge to show the current session name and git branch, if any is set.
printf "\e]1337;SetBadgeFormat=%s\a" \
  $(echo -n "\(session.name) \(user.gitBranch)" | base64)
</pre>

### Color

The badge's color may be set in *Preferences&gt;Profiles&gt;Colors*.

