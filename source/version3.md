---
layout: default
title: Version 3 Beta - iTerm2 - Mac OS Terminal Replacement
---
## iTerm2 Version 3 Now in Beta

Version 3 of iTerm2 is now in Beta. There are a few things you should know before jumping in.

### What do I need to know?

There are dozens of new features. Many bugs have been fixed. Performance is significantly improved. The look and feel has been updated. Applescript support has been updated, but it's not backwards compatible.

### Where do I get it?

<a href="https://iterm2.com/downloads/beta/iTerm2-2_9_20160426.zip">Download the beta version here.</a>

### Major New Features

There are a lot of new features in 3.0. It represents about eighteen months of development. Here are the highlights.

#### A Fresh Look

iTerm2 has been updated for the modern Mac OS X "flat" look and is stunningly beautiful.

#### Shell Integration

Shell Integration is a modification to your shell's login script that informs iTerm2 of which commands you're running, which host you're logged in to, what your user name is, and what your current directory is. This enables all kinds of cool features, such as easily navigating to preceding shell prompts, getting a notification when a long-running job finishes, drag-dropping files to upload and download on remote hosts, and much more. All the details are at the <a href="/shell_integration.html">Shell Integration</a> document.

#### Automatic Profile Switching

iTerm2 can change your profile (for example, affecting the color of your terminal) when you ssh to a remote host, when you run sudo, or even depending on your current directory. Automatic Profile Switching is part of <a href="https://iterm2.com/shell_integration.html">Shell integration.</a>

#### Session Restoration

Session Restoration allows your jobs to keep running after iTerm2 upgrades, is force-quit, or crashes. It's like tmux without tmux!

#### Inline Images

Using the <a href="/imgcat">imgcat</a> script, iTerm2 can display image files right in the terminal--even animated GIFs. See the <a href="/images.html">Inline Images</a> document for details.

#### Badges

iTerm2 version 3 introduces the concept of a *Badge*. A badge is user-defined text that goes in the top-right of your terminal behind its content and can display information like your current host name or git branch. <a href="/badges.html">Learn more about badges.</a>

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

#### Timestamps

iTerm2 tracks the last-modified time of each line in history so you can see how long commands took to run or when error messages were printed.

#### Captured Output

Use iTerm2 as your IDE. You can define regular expressions to match lines of text like error messages from a compiler. The matching lines are shown in the toolbelt on the side of your terminal. You can click to jump to the line or double-click to run a coprocess, which can open the file in your favorite editor right to the line number you need. <a href="/captured_output.html">Learn more about Captured Output.</a>

#### All the Small Things

Performance is greatly improved by parsing the incoming bytes off the main thread. Hundreds of bugs have been fixed. Lots of details have been improved: for example, if you print a binary file to the console, you're offered the option to silence the bell. You can edit strings before you paste them. You get warned before pasting tabs at your shell prompt. And much more!

### Applescript Not Backwards Compatible

The good news is that iTerm2's Applescript makes a lot more sense than it used to. You can manipulate split panes, and scripting will receive more love and support in the future.

The bad news is that existing Applescript won't work any more.

The good news is that it's pretty easy to fix. <a href="/applescript.html">The new Applescript syntax is described here.</a>
<hr>

### Alfred Support

Although Applescript has changed, you can still get Alfred to work. Go to Alfred Preferences and choose Features. Pick *Terminal/Shell* and for *Application* choose *Custom*. Then paste the <a href="https://gist.githubusercontent.com/gnachman/4cbe6743baa7fe07536b/raw/f07c15d3417e8704d617c4fa939e918265f105ba/gistfile1.txt">iTerm2 3.0 Alfred Script</a> into the text field. <a href="/images/AlfredForiTerm2Version3.png">Perhaps a crude illustration will help.</a></p>

### Docker Support
The Docker Quickstart Terminal uses Applescript and is not compatible with iTerm2 version 2.9 and later. You can fix it by copying this version of <a href="https://gist.github.com/gnachman/f61614d0335e185787b0">iterm.scpt</a> over the following file:
<pre>/Applications/Docker/Docker Quickstart Terminal.app/Contents/Resources/Scripts/iterm.scpt</pre>

<script>
function show(name) {
  document.getElementById("bash").style.display="none";
  document.getElementById("fish").style.display="none";
  document.getElementById("tcsh").style.display="none";
  document.getElementById("zsh").style.display="none";
  document.getElementById(name).style.display="";
}
</script>
