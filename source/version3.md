---
layout: default
title: Version 3 Beta - iTerm2 - Mac OS Terminal Replacement
---
<script>
function show(name) {
  document.getElementById("bash").style.display="none";
  document.getElementById("fish").style.display="none";
  document.getElementById("tcsh").style.display="none";
  document.getElementById("zsh").style.display="none";
  document.getElementById(name).style.display="";
}
</script>
## iTerm2 Version 3 Now in Beta

Version 3 of iTerm2 is now in Beta. There are a few things you should know before jumping in.

### What do I need to know?

There are dozens of new features. Many bugs have been fixed. Performance is significantly improved. The look and feel has been updated for Yosemite. Applescript support has been updated, but it's not backwards compatible.

### Major New Features

There are a lot of new features in 3.0. It represents about eighteen months of development. Here are the highlights.

#### A Fresh Look

iTerm2 has been updated for the new Mac OS X Yosemite flat look and is stunningly beautiful.

#### Shell Integration

Shell Integration is a modification to your shell's login script that informs iTerm2 of which commands you're running, which host you're logged in to, what your user name is, and what your current directory is. This enables all kinds of cool features, such as easily navigating to preceding shell prompts, getting a notification when a long-running job finishes, drag-dropping files to upload and download on remote hosts, and much more. All the details are at the <a href="/shell_integration.html">Shell Integration</a> document.

#### Session Restoration

Session Restoration allows your jobs to keep running after iTerm2 upgrades, is force-quit, or crashes. It's like tmux without tmux!

#### Inline Images

Using the <a href="/imgcat">imgcat</a> script, iTerm2 can display image files right in the terminal--even animated GIFs. See the <a href="/images.html">Inline Images</a> document for details.

#### Password Manager

The built-in Password Manager saves you from having to remember lots of passwords. It uses Mac OS's keychain to securely store them, and has built-in guards to prevent them from being accidentally transmitted when not at a password prompt. You can even write a Trigger that automatically opens the Password Manager at the password prompt.

#### Undo Close

Undo closing sessions, tabs, and windows. If you close a session by accident, you get five seconds to hit Cmd-Z to undo it.

#### Tab Bar on Left

Have lots of tabs? Put the tab bar on the left. Quickly search them by recent commands, directories, current host name, profile name, and more with the Open Quickly feature.

#### Dynamic Profiles

Dynamic Profiles allow you to store profiles in JSON files. This is really handy if you have lots of profiles or want to auto-generate them. See the <a href="/dynamic-profiles.html">Dynamic Profiles</a> document for details.

#### Cursor Location Assistance

Never lose your cursor. An optional cursor guide highlights the entire row your cursor is on and Cursor Boost dims all colors other than the cursor to make it really stand out.

#### All the Small Things

Performance is greatly improved by parsing the incoming bytes off the main thread. Hundreds of bugs have been fixed. Lots of details have been improved: for example, if you print a binary file to the console, you're offered the option to silence the bell. You can edit strings before you paste them. You get warned before pasting tabs at your shell prompt. And much more!

### Alfred Support

Although Applescript has changed, you can still get Alfred to work. Go to Alfred Preferences and choose Features. Pick *Terminal/Shell* and for *Application* choose *Custom*. Then paste the <a href="https://gist.githubusercontent.com/gnachman/4cbe6743baa7fe07536b/raw/466b24deb91b8c7dde396023f327326ca1fa3661/gistfile1.txt">iTerm2 3.0 Alfred Script</a> into the text field. <a href="/images/AlfredForiTerm2Version3.png">Perhaps a crude illustration will help.</a></p>

### Applescript Not Backwards Compatible

The good news is that iTerm2's Applescript makes a lot more sense than it used to. You can manipulate split panes, and scripting will receive more love and support in the future.

The bad news is that existing Applescript won't work any more.

The good news is that it's pretty easy to fix.

<a href="/applescript.html">The new Applescript syntax is described here.</a>
