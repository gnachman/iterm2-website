<script>
function show(name) {
  document.getElementById("bash").style.display="none";
  document.getElementById("fish").style.display="none";
  document.getElementById("tcsh").style.display="none";
  document.getElementById("zsh").style.display="none";
  document.getElementById(name).style.display="";
}
</script>

A *badge* is a large text label that appears in the top right of a terminal session to provide dynamic status, such as the current host name or git branch. Its initial value is defined in <strong>Preferences&gt;Profiles&gt;General&gt;Badge</strong> and it can be changed by an iTerm2-proprietary escape sequence. This value is an <a href="documentation-scripting-fundamentals.html">interpolated string</a>, which means the badge can expose it can display the value of <a href="documentation-variables.html">variables</a>.

Here is an example of a session with a badge indicating the current user and host name.

<img src="images/Badge.png">

### Escape Sequences

The badge may be set with the following control sequence:

<pre>
OSC 1337 ; SetBadgeFormat=<i>Base-64 encoded badge format</i> ST
</pre>

Here's an example that works in bash:

```
# Set badge to show the current session name and git branch, if any is set.
printf "\e]1337;SetBadgeFormat=%s\a" \
  $(echo -n "\(session.name) \(user.gitBranch)" | base64)
```

### Color

The badge's color may be set in *Preferences&gt;Profiles&gt;Colors*. The font and size can be adjusted by selecting *Preferences&gt;Profiles&gt;General&gt;Edit…* next to the *Badge* field.

