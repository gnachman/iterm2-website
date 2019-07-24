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

<img src="/images/Badge.png">

### Badge Format

The badge format is an interpolated string. See <a
href="documentation-scripting-fundamentals.html">Scripting Fundamentals</a> for
more information on how to use interpolated strings to include information from
the terminal state in the badge. It also describes how you can set user-defined
variables, such as the current git branch, which may appear in the badge.

Here are some examples of interpolated strings:

<pre>
\(session.username)@\(session.hostname)
</pre>

User-defined badges can be very powerful. For example:

<pre>
Current git branch on \(session.hostname) is \(user.gitBranch)
</pre>

Undefined variables evaluate to an empty string.

### Appearance

The badge's color may be set in *Preferences&gt;Profiles&gt;Colors*. Its position and typeface may be set in *Preferences>Profiles>General*. Note that the position is always relative to the top right of the session's viewport.

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


