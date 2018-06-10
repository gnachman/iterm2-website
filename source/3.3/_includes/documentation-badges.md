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

### Variables

A badge may reference variables. See
<a href="documentation-variables.html">iTerm2 Variables</a>
for details on using variables.

The syntax for referencing a variable is to place the variable name between *\\(* and *)*. For example:

<pre>
\(session.username)@\(session.hostname)
</pre>

User-defined badges can be very powerful. For example:

<pre>
Current git branch on \(session.hostname) is \(user.gitBranch)
</pre>

Undefined variables evaluate to an empty string.

### Color

The badge's color may be set in *Preferences&gt;Profiles&gt;Colors*.

### Escape Sequences

The badge may be set with the following escape sequence:

<pre>
OSC 1337 ; SetBadgeFormat=<i>Base-64 encoded badge format</i> ST
</pre>

Here's an example that works in bash:

<pre style="white-space: pre">
# Set badge to show the current session name and git branch, if any is set.
printf "\e]1337;SetBadgeFormat=%s\a" \
  $(echo -n "\(session.name) \(user.gitBranch)" | base64)
</pre>


