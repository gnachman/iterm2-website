---
layout: default
title: Downloads - iTerm2 - Mac OS Terminal Replacement
active-state: downloads
---

<h3>Stable Releases</h3>
<h4><a target="_blank" href="/downloads/stable/iTerm2_v2_0.zip"><img src="/img/small-download.png" align="left">&nbsp;iTerm2 2.0 (OS 10.6+, Intel-only)
</a></h4>
<p>
iTerm2 v2.0: this is the recommended for most users. It requires OS X 10.7+ and an Intel CPU.

<br>
<p><a href="javascript:showId('1020684951754796022')" id='show1020684951754796022'>▶ Show Changelog</a>
<a href="javascript:hideId('1020684951754796022')" id='hide1020684951754796022' style="display: none">▼ Hide Changelog</a>
<pre id="changelist1020684951754796022" style="display: none">Major New Features
------------------
- Deep tmux integration!
  Have you ever had an ssh session lost because you had to reboot, had a network
  failure, or the power went out? Are you tired of giving up a keystroke to tmux
  or screen? Suffer no longer! iTerm2 and tmux are now deeply integrated. By
  installing a special version of tmux, it gains the ability to speak directly to
  iTerm2. When you run tmux with -CC, iTerm2 will open real, native windows or
  tabs for each tmux window. The whole state of your tmux session is reflected in
  native iTerm2 windows. As you interact with a window, your typing is sent back
  to tmux. Any time you resize a window, add a split pane, close a split pane,
  close a window, or open a window (with Shell-&gt;tmux-&gt;new window), that
  action happens in tmux as well as in iTerm2.
  All the details are at https://code.google.com/p/iterm2/wiki/TmuxIntegration

- A "Toolbelt" has been added. It's a drawer that opens to the right of a
  window and shows running jobs, paste history, a field for taking notes, and
  lets you open new windows/tabs/splits. Look for the Toolbelt menu.

- Add "triggers." A trigger is an action that is performed when text matching
  some regular expression is received in a terminal session. More info here:
  http://www.iterm2.com/triggers.html

- Add "coprocesses." A coprocess is a process, such as a script, that receives
  input from a terminal and whose output is fed into the terminal session as
  though the user were typing it. You can use them to automate interaction with
  scripts, download files with ZModem, and more. More info here:
  http://iterm2.com/coprocesses.html

- You can now edit the smart selection regexes in
  Prefs&gt;Profiles&gt;Advanced. You can also assign actions that are added to
  the context menu when you right click on text that matches a smart selection
  rule.  More info here:
  http://www.iterm2.com/smartselection.html

- Support for OS 10.7 features including fullscreen, retina graphics, and
  window restoration.


New Preferences
---------------
- Add support for tiled background images (Foy Savas)
- Add a preference to toggle hiding of the menu bar in non-Lion fullscreen.
  Useful in Mavericks multi-monitor setups.
- Make tabview toggleable in fullscreen.
- Add option to dim background windows.
- Add option to dim only foreground colors.
- Add UI for adjusting dimming amount.
- Add UI to make blur radius configurable.
- Add hidden pref MaxPasteHistoryEntries.
- Add preference to hide tab's activity indicator.
- Add option to draw red stripes in the background to indicate input being sent
  to all terminals.
- Add preference to disable dimming animation.
- Add option to profiles to send text to shell at startup.
- Add option to disable session-initiated printing.
- Add support for loading prefs from a custom folder (e.g., Dropbox) or URL.
  This makes it easy to share a config between multiple machines or people.
- Add auto logging of sessions. When enabled (per-profile), all input received
  from the host in a session is saved to a file tagged with the window, tag,
  and pane number, plus the time and date of initiation.
- Add next/previous pane action.
- Change around prompt-to-quit options, adding "always/never/only if jobs
  besides ... are running" to profiles-sessions.
- Add option to copy trailing newlines when making a selection that includes a
  whole line at its end.
- Add preference to disable transparency when entering fullscreen mode.
- Improve "Terminal.app Compatibility" key preset to more accurately emulate
  Terminal.
- You can now configure what happens when you cmd-click on a filename in
  Prefs&gt;Profiles&gt;Advanced.
- Add key action to move tab left/right.
- Add "advanced" directory settings for separate tab, window, and pane settings.
- Add preference for setting locale vars.
- Add preference to disable saving lines to the scrollback buffer while in
  alternate screen mode.
- Add option to always copy preferences to prefs stored in a custom folder.
- Add a new panel to prefs to make mouse actions configurable.
- Add option to make triple-click select a whole wrapped line rather than just
  one row.
- Add hidden option AutocompleteMaxOptions to adjust number of autocomplete
  entries.
- Add hidden option PasteHistoryMaxOptions to adjust number of paste history
  entries.
- Add hidden variable URLCharacterSet that defines characters that are part of
  a URL.
- Disable title reporting unless hidden pref AllowInsecureTitleReporting is set
  to true.
- Add general preference "Adjust window for font size change". Turn it off so
  that the window size stays fixed as the font grows or shrinks (thanks,
  keeyipchan!).
- Add hidden preference PinchToChangeFontSizeDisabled to turn off pinch to
  change font size
- Ask for confirmation before deleting a profile.
- Add boolean hidden pref, OpenFileInNewWindows. When you open a file (e.g., a
  shell script) in finder with iTerm2, this controls whether it opens in a new
window or tab.
- Additional window styles: bottom and left of screen.

New Terminal Features
---------------------
- Add support for italics (Stefan Schüßler)
- Change RIS code to move the cursor to the origin (saitoha).
- Convert text to NFC form more aggressively, which should lead to latin
  characters with accents rendering more consistently with certain fonts like
  Inconsolata, which lacks some combining marks.
- Add ITERM_SESSION_ID environment variable that identifiers the window, tab,
  and pane number of each session.
- Add escape code "Esc c" to reset terminal.
- Add new escape code ESC ]6;1;bg;*;default^G to restore tab color to default.
- Add support for reporting focus lost/gained. esc[?1004h turns it on; then the
  terminal sends esc[I when focusing, esc[O when de-focusing. Send esc[?1004l
  to disable.
- Implemented bracketed paste mode (this is cool, see vim script here:
  http://stackoverflow.com/questions/5585129
- Define VLNEXT and VDISCARD in the term by default.
- Add support for the "screen" terminal's way of setting the window title.
- Support SGR (1006) mouse reporting.
- Allow OSC 4 to set color of first 16 palette entries.
- Add support for OSC 52 (clipboard integration--thanks, saitoha!).
- Add support for DECSCUSR which lets the terminal change the cursor shape and
  blink.
- Add support for DECSTR (esc [!p)

Other Features
--------------
- Improve rendering on glyphs with multiple combining marks.
- When you cmd-click on a filename in a diff, remove the a/ or b/ prefix and
  replace with the real directory to open the file.
- Cmd-opt click on a URL to open it without bringing the browser to the front.
- Improve "send input to all sessions", adding new modes: 1) send to all panes
  in current tab, 2) to all sessions in current window, and 3) to an arbitrary
  collection of panes (toggled with context menu).
- You can toggle send input to all tabs/panes by re-pressing the keystroke that
  got you into that mode.
- Draw a dotted line around maximized sessions.
- Add support for multiple saved window arrangements.
- Add decimal <-> hex conversion to right-click context menu when a number is
  selected.
- Add new cmd-opt-shift-H and cmd-opt-shift-v interface for opening a split
  pane with a particular profile.
- Allow pinch gesture to change font size.
- Make cmd-[ and cmd-] work when a pane is maximized.
- Add "find cursor" feature (cmd-/) that highlights the cursor location. Useful
  when you have a huge terminal, this makes it easy to quickly find a lost
  cursor. If activated with the shortcut cmd-/, continuing to hold cmd will keep
  the highlighting active.
- Add ability to drag split panes around by pressing cmd-opt-shift and drgging.
- Add ability to split a pane by dragging a tab into a terminal session.
- Add "move session to split pane" option to context menu.
- Add "restore arrangement" to dock menu.
- Add cmd-= as shortcut for duplicating a profile
- By default, a three-finger click on a trackpad emulates the middle button
  (which by default performs Paste).
- Add ability to change profile from Edit Current Session.
- Change mouse cursor to indicate that mouse reporting is on.
- Add cmd-shift-opt-T to open a new tab using the current session's profile.
- Change default global key bindings to cmd-shift-arrows to move tab left/right.
- Add menu item to move tab left/right.
- Add title bars to split panes that show the title. You can drag panes by
  their titles, and there is a menu and a close button in it as well.
- If no window is open, you can now select multiple items in the profiles and
  window and choose split horizontally/vertically to open a new window with the
  split.
- Add tab colors to view menu and tab context menu (thanks, andreax79)
- Add 'move session to window' context menu item.
- When closing a session, free its scrollback buffer in a background thread to
  avoid hanging.
- Alt-click moves the cursor to the click position.
- Press cmd-9 to go to the last tab.
- Add menu item to toggle broadcasting input to the current pane (make
  pane-by-pane toggling available to focus-follows-mouse users who couldn't
  open a context menu in a deselected pane)
- "Find" continues to search as new text appears.

System Integration
------------------
- In Mavericks, when system prefs are set such that multiple screens share one
  space, we only hide the dock and menu when a fullscreen iTerm2 window is on
  the first screen.
- Handle inserting emoji text in mavericks with cmd-ctrl-space.
- Make dock and menu bar appear by moving mouse to top/bottom of screen in
  non-Lion fullscreen mode. Remove hold-cmd-for-tabs.
- Make it possible to launch iTerm2 from Applescript so it won't open any
  windows automatically.
- Add support for Growl 1.3.
- Support Lion's Restore functionality.
- For new users under Lion, xterm-256color will be the default terminal.
- Add ability to open .itermcolors files by double clicking on them.
- Add 'New Window (Default Profile)' to dock menu.
- Make growl alerts clickable (thanks, soul.cake.tuesday.duck and bauerb).
- Make find text typed in one tab appear in all tabs' find bars.
- App bundle is now signed.
- When a file or folder is dragged onto the dock icon, open it in a new tab
  (not a new window).
- Retina graphics

Proprietary Escape Codes
------------------------
- Add escape code <Esc>]50;SetMark^G to perform Edit > Set Mark command.
- Add escape code to steal focus: ESC ]50;StealFocus^G  (thanks, gordolio).
- Add proprietary escape code esc]50;ClearScrollback^G to erase screen and
  scrollback buffer.
- Add proprietary escape code esc]50;CurrentDir=/Path/To/Directory^G to notify
  iTerm2 of the current directory (so you can cmd-click on relative filenames
  and we'll know where they are).
- Add proprietary escape code <esc>]50;SetProfile=X^G to set the current
  session's profile to the one named X.- Add proprietary escape code to send
  text to clipboard. To use, send esc]50;CopyToClipboard=X^G followed by text
  followed by esc]50;EndCopy^G, where X is a clipboard name from the set: ruler,
  find, font, or general. If not specified, general is used.
- Add esc]50;RequestAttention=x^G, where if x=1 the dock icon bounces and if
  x=0 it stops.

</pre></p>
</p>
<h4><a target="_blank" href="/downloads/stable/iTerm2_v2_0-LeopardPPC.zip"><img src="/img/small-download.png" align="left">&nbsp;iTerm2 2.0 (OS 10.5, Intel, PPC)
</a></h4>
<p>
This build has a limited set of features but supports OS 10.5 and PowerPC. If you have an Intel Mac that runs OS 10.6 or newer, you don't want this.

<br>
</p>
<p><a href="javascript:showId('stable')" id='showstable'>▶ Show Older Versions</a>
<a href="javascript:hideId('stable')" id='hidestable' style="display: none">▼ Hide Older Versions</a>
<div id="changeliststable" style="margin-left: 15pt; display: none"><h3>Older Stable Releases</h3>
<h4><a target="_blank" href="/downloads/stable/iTerm2_v1_0_0.zip"><img src="/img/small-download.png" align="left">&nbsp;iTerm2 1.0.0 - first stable version
</a></h4>
<p>
This is iTerm2 version 1.0.0, the first full releases of iTerm2.

<br>
</p>
</div>
<h3>Test Releases</h3>
<h4><a target="_blank" href="/downloads/beta/iTerm2-1_0_0_20140629.zip"><img src="/img/small-download.png" align="left">&nbsp;iTerm2 1.0.0.20140629 beta (OS 10.6+, Intel-only)
</a></h4>
<p>
This is the recommended beta build for most users. It is a release candidate for v2.0.

<br>
<p><a href="javascript:showId('3638926240937100174')" id='show3638926240937100174'>▶ Show Changelog</a>
<a href="javascript:hideId('3638926240937100174')" id='hide3638926240937100174' style="display: none">▼ Hide Changelog</a>
<pre id="changelist3638926240937100174" style="display: none">- Update online help.
- Build with 10.9 SDK to fix a bug on secondary displays in 10.9.
- Add a delay after switching spaces so the animation can finish. Fixes bug 3015.
- Change how environment variables are set to avoid a bug in 10.10.
</pre></p>
</p>
<h4><a target="_blank" href="/downloads/beta/iTerm2-1_0_0_20140629-LeopardPPC.zip"><img src="/img/small-download.png" align="left">&nbsp;iTerm2 1.0.0.20140629 beta (OS 10.5, Intel, PPC)
</a></h4>
<p>
This build has a limited set of features but supports OS 10.5 and PowerPC. If you have an Intel Mac that runs OS 10.6 or newer, you don't want this.

<br>
</p>
<p><a href="javascript:showId('beta')" id='showbeta'>▶ Show Older Versions</a>
<a href="javascript:hideId('beta')" id='hidebeta' style="display: none">▼ Hide Older Versions</a>
<div id="changelistbeta" style="margin-left: 15pt; display: none"><h3>Older Test Releases</h3>
<h4><a target="_blank" href="/downloads/beta/iTerm2-1_0_0_20140518.zip"><img src="/img/small-download.png" align="left">&nbsp;iTerm2 1.0.0.20140518 beta (OS 10.6+, Intel-only)
</a></h4>
<p>
This is the version 2.0 release candidate.

<br>
<p><a href="javascript:showId('6114662122794527769')" id='show6114662122794527769'>▶ Show Changelog</a>
<a href="javascript:hideId('6114662122794527769')" id='hide6114662122794527769' style="display: none">▼ Hide Changelog</a>
<pre id="changelist6114662122794527769" style="display: none">- Removes an unncessary test for whether Growl is running, which caused crashes.
- Removes assertions.
</pre></p>
</p>
<h4><a target="_blank" href="/downloads/beta/iTerm2-1_0_0_20140518-LeopardPPC.zip"><img src="/img/small-download.png" align="left">&nbsp;iTerm2 1.0.0.20140518 beta (OS 10.5, Intel, PPC)
</a></h4>
<p>
This build has a limited set of features but supports OS 10.5 and PowerPC. If you have an Intel Mac that runs OS 10.6 or newer, you don't want this.

<br>
</p>
<h4><a target="_blank" href="/downloads/beta/iTerm2-1_0_0_20140422-LeopardPPC.zip"><img src="/img/small-download.png" align="left">&nbsp;iTerm2 1.0.0.20140422 beta (OS 10.5, Intel, PPC)
</a></h4>
<p>
This build has a limited set of features but supports OS 10.5 and PowerPC. If you have an Intel Mac that runs OS 10.6 or newer, you don't want this.

<br>
<p><a href="javascript:showId('8378464786801815463')" id='show8378464786801815463'>▶ Show Changelog</a>
<a href="javascript:hideId('8378464786801815463')" id='hide8378464786801815463' style="display: none">▼ Hide Changelog</a>
<pre id="changelist8378464786801815463" style="display: none">- Remove assertions.
</pre></p>
</p>
<h4><a target="_blank" href="/downloads/beta/iTerm2-1_0_0_20140421.zip"><img src="/img/small-download.png" align="left">&nbsp;iTerm2 1.0.0.20140421 beta (OS 10.6+, Intel-only)
</a></h4>
<p>
This is the recommended beta build for most users. It contains a bunch of bug fixes, including fixes for some crashers.

<br>
<p><a href="javascript:showId('7938730690443435388')" id='show7938730690443435388'>▶ Show Changelog</a>
<a href="javascript:hideId('7938730690443435388')" id='hide7938730690443435388' style="display: none">▼ Hide Changelog</a>
<pre id="changelist7938730690443435388" style="display: none">There was a build with version 1.0.0.20140403 that was not placed on autho-update which included the following changes:

- Fix the crash reporter to use newer crash report location since 10.7.
- Remove assertions.
- Fix backward compatibility with preferences files from the nightly build.
- Handle inserting emoji text in mavericks with cmd-ctrl-space.

In addition, this version adds:
- Fix problem with Lion-style fullscreen windows on external displays on Mavericks where displays have separate spaces in which a gray bar would appear on top of the window.
- Don't ask for permission to use contacts at startup.
</pre></p>
</p>
<h4><a target="_blank" href="/downloads/beta/iTerm2-1_0_0_20140403.zip"><img src="/img/small-download.png" align="left">&nbsp;iTerm2 1.0.0.20140403 beta (OS 10.6+, Intel-only)
</a></h4>
<p>
This is the recommended beta build for most users. It contains a bug fixes, including fixes for some crashers.

<br>
<p><a href="javascript:showId('7009268780238555992')" id='show7009268780238555992'>▶ Show Changelog</a>
<a href="javascript:hideId('7009268780238555992')" id='hide7009268780238555992' style="display: none">▼ Hide Changelog</a>
<pre id="changelist7009268780238555992" style="display: none">- Fix the crash reporter to use newer crash report location since 10.7.
- Remove assertions.
- Fix backward compatibility with preferences files from the nightly build.
- Handle inserting emoji text in mavericks with cmd-ctrl-space.
</pre></p>
</p>
<h4><a target="_blank" href="/downloads/beta/iTerm2-1_0_0_20140403-LeopardPPC.zip"><img src="/img/small-download.png" align="left">&nbsp;iTerm2 1.0.0.20140403 beta (OS 10.5, Intel, PPC)
</a></h4>
<p>
This build has a limited set of features but supports OS 10.5 and PowerPC. If you have an Intel Mac that runs OS 10.6 or newer, you don't want this.

<br>
<p><a href="javascript:showId('4827932922692241390')" id='show4827932922692241390'>▶ Show Changelog</a>
<a href="javascript:hideId('4827932922692241390')" id='hide4827932922692241390' style="display: none">▼ Hide Changelog</a>
<pre id="changelist4827932922692241390" style="display: none">- Fix the crash reporter to use newer crash report location since 10.7.
- Remove assertions.
- Fix backward compatibility with preferences files from the nightly build.
- Handle inserting emoji text in mavericks with cmd-ctrl-space.
</pre></p>
</p>
<h4><a target="_blank" href="/downloads/beta/iTerm2-1_0_0_20140112.zip"><img src="/img/small-download.png" align="left">&nbsp;iTerm2 1.0.0.20140112 beta (OS 10.6+, Intel-only)
</a></h4>
<p>
This is the recommended beta build for most users. It contains a bunch of bug fixes, including a fix for a crashing bug.

<br>
<p><a href="javascript:showId('6168396214142122797')" id='show6168396214142122797'>▶ Show Changelog</a>
<a href="javascript:hideId('6168396214142122797')" id='hide6168396214142122797' style="display: none">▼ Hide Changelog</a>
<pre id="changelist6168396214142122797" style="display: none">- Fix a rare crash in ProcessCache.
- Convert text to NFC form more aggressively, which should lead to latin characters with accents rendering more consistently with certain fonts like Inconsolata, which lacks some combining marks.
- Update window titles immediately during live resize (bug 2812).
- Don't underline null characters, and fix a bug where underlined characters weren't always drawn correctly in the presence of non-ASCII characters.
- Fix tab order for controls in preferences.
- Update help text for v2.

</pre></p>
</p>
<h4><a target="_blank" href="/downloads/beta/iTerm2-1_0_0_20140112-LeopardPPC.zip"><img src="/img/small-download.png" align="left">&nbsp;iTerm2 1.0.0.20140112 beta (OS 10.5, Intel, PPC)
</a></h4>
<p>
This build has a limited set of features but supports OS 10.5 and PowerPC. If you have an Intel Mac that runs OS 10.6 or newer, you don't want this.

<br>
</p>
<h4><a target="_blank" href="/downloads/beta/iTerm2-1_0_0_20131228.zip"><img src="/img/small-download.png" align="left">&nbsp;iTerm2 1.0.0.20131228 beta (OS 10.6+, Intel-only)
</a></h4>
<p>
This is the recommended beta build for most users. It contains a bunch of bug fixes, including fixes for some crashers, plus some minor performance improvements.

<br>
<p><a href="javascript:showId('3179748488182277823')" id='show3179748488182277823'>▶ Show Changelog</a>
<a href="javascript:hideId('3179748488182277823')" id='hide3179748488182277823' style="display: none">▼ Hide Changelog</a>
<pre id="changelist3179748488182277823" style="display: none">- Fix a rare crashing bug.
- Fix two bugs where non-ascii characters would sometimes draw incorrectly.
- Fix a bug where changing prefs/closing the prefs window would reset the 256-color color table.
- In Mavericks, when system prefs are set such that multiple screens share one space, we only hide the dock and menu when a fullscreen iTerm2 window is on the first screen.
- Revert to older method of drawing non-ascii characters except when combining marks are present, for performance.
- Be more permissive about parsing colors in prefs file to resolve an incompatibility with prefs files touched by the nightly build, which adds a colorspace element.

</pre></p>
</p>
<h4><a target="_blank" href="/downloads/beta/iTerm2-1_0_0_20131228-LeopardPPC.zip"><img src="/img/small-download.png" align="left">&nbsp;iTerm2 1.0.0.20131228 beta (OS 10.5, Intel, PPC)
</a></h4>
<p>
This build has a limited set of features but supports OS 10.5 and PowerPC. If you have an Intel Mac that runs OS 10.6 or newer, you don't want this.

<br>
</p>
<h4><a target="_blank" href="/downloads/beta/iTerm2-1_0_0_20131218.zip"><img src="/img/small-download.png" align="left">&nbsp;iTerm2 1.0.0.20131218 beta (OS 10.6+, Intel-only)
</a></h4>
<p>
This is the recommended beta build for most users. It contains a bunch of bug fixes.

<br>
<p><a href="javascript:showId('7659830349075358626')" id='show7659830349075358626'>▶ Show Changelog</a>
<a href="javascript:hideId('7659830349075358626')" id='hide7659830349075358626' style="display: none">▼ Hide Changelog</a>
<pre id="changelist7659830349075358626" style="display: none">iTerm2 1.0.0.20131218
Bug fixes.

- Fix a rare crashing bug.
- Fix a bug where non-ascii characters would sometimes draw incorrectly.
- Fix a bug where changing prefs/closing the prefs window would reset the 256-color color table.
- In Mavericks, when system prefs are set such that multiple screens share one space, we only hide the dock and menu when a fullscreen iTerm2 window is on the first screen.
- Revert to older method of drawing non-ascii characters except when combining marks are present, for performance.
- Be more permissive about parsing colors in prefs file to resolve an incompatibility with prefs files touched by the nightly build, which adds a colorspace element.
</pre></p>
</p>
<h4><a target="_blank" href="/downloads/beta/iTerm2-1_0_0_20131218-LeopardPPC.zip"><img src="/img/small-download.png" align="left">&nbsp;iTerm2 1.0.0.20131218 beta (OS 10.5, Intel, PPC)
</a></h4>
<p>
This build has a limited set of features but supports OS 10.5 and PowerPC. If you have an Intel Mac that runs OS 10.6 or newer, you don't want this.

<br>
</p>
<h4><a target="_blank" href="/downloads/beta/iTerm2-1_0_0_20131124.zip"><img src="/img/small-download.png" align="left">&nbsp;iTerm2 1.0.0.20131124 beta (OS 10.6+, Intel-only)
</a></h4>
<p>
This is the recommended beta build for most users.

<br>
<p><a href="javascript:showId('6397814190177344872')" id='show6397814190177344872'>▶ Show Changelog</a>
<a href="javascript:hideId('6397814190177344872')" id='hide6397814190177344872' style="display: none">▼ Hide Changelog</a>
<pre id="changelist6397814190177344872" style="display: none">- Fix bug where thousands separators in the scrollback lines field would cause the number to be truncated.
- Fix bug in OS 10.6 that broke text drawing.
- Work around OS bug that sometimes causes input to be sent to multiple windows.
- Fix bug where hotkey windows don't scroll up off the screen in 10.9.
</pre></p>
</p>
<h4><a target="_blank" href="/downloads/beta/iTerm2-1_0_0_20131124-LeopardPPC.zip"><img src="/img/small-download.png" align="left">&nbsp;iTerm2 1.0.0.20131124 beta (OS 10.5, Intel, PPC)
</a></h4>
<p>
This build has a limited set of features but supports OS 10.5 and PowerPC. If you have an Intel Mac that runs OS 10.6 or newer, you don't want this.

<br>
</p>
<h4><a target="_blank" href="/downloads/beta/iTerm2-1_0_0_20131116.zip"><img src="/img/small-download.png" align="left">&nbsp;iTerm2 1.0.0.20131116 beta (OS 10.6+, Intel-only)
</a></h4>
<p>
This is the recommended beta build for most users. It contains a bug fixes and improvements for Mavericks users.

<br>
<p><a href="javascript:showId('9107267244167064633')" id='show9107267244167064633'>▶ Show Changelog</a>
<a href="javascript:hideId('9107267244167064633')" id='hide9107267244167064633' style="display: none">▼ Hide Changelog</a>
<pre id="changelist9107267244167064633" style="display: none">- Fix a crash associated with using "minimum constrast".
- Fix a bug where commas in the "number of scrollback lines" field would cause part of the number to get cut off.
- Fix a bug where hotkey windows don't disappear completely off the screen.
- Fix a bug where making a window fullscreen in Mavericks might cause another window to receive keystrokes.
- Add a preference to toggle hiding of the menu bar in non-Lion fullscreen. Useful in Mavericks multi-monitor setups.
- Make it possible for applescript to write text to tmux sessions.
- Fix a bug where smart selection would sometimes select too much.
- Fix assertion when using smart selection on a line with double width characters.
- Improve rendering on glyphs with multiple combining marks.
</pre></p>
</p>
<h4><a target="_blank" href="/downloads/beta/iTerm2-1_0_0_20131116-LeopardPPC.zip"><img src="/img/small-download.png" align="left">&nbsp;iTerm2 1.0.0.20131116 beta (OS 10.5, Intel, PPC)
</a></h4>
<p>
This build has a limited set of features but supports OS 10.5 and PowerPC. If you have an Intel Mac that runs OS 10.6 or newer, you don't want this.

<br>
</p>
<h4><a target="_blank" href="/downloads/beta/iTerm2-1_0_0_20131112.zip"><img src="/img/small-download.png" align="left">&nbsp;iTerm2 1.0.0.20131112 beta (OS 10.6+, Intel-only)
</a></h4>
<p>
This is the recommended beta build for most users. It contains a few bug fixes, including fixes for some crashers, and improves Unicode text rendering.

<br>
<p><a href="javascript:showId('432266644668133853')" id='show432266644668133853'>▶ Show Changelog</a>
<a href="javascript:hideId('432266644668133853')" id='hide432266644668133853' style="display: none">▼ Hide Changelog</a>
<pre id="changelist432266644668133853" style="display: none">- Fixes a bug that would cause an occasional crash when using the minimum contrast feature.
- Enables writing to tmux sessions with Applescript.
- Fixes a bug with smart selection that would cause it to selct too much text prior to the true star
t of the semantic object.
- Fixes a crash when using smart selection with double-width characters.
- Improve rendering of characters with multiple combining marks.
</pre></p>
</p>
<h4><a target="_blank" href="/downloads/beta/iTerm2-1_0_0_20131109.zip"><img src="/img/small-download.png" align="left">&nbsp;iTerm2 1.0.0.20131109 beta (OS 10.6+, Intel-only)
</a></h4>
<p>
This is the recommended beta build for most users. It contains a bunch of bug fixes, including fixes for some crashers, plus some minor performance improvements.

<br>
<p><a href="javascript:showId('5106474520863269195')" id='show5106474520863269195'>▶ Show Changelog</a>
<a href="javascript:hideId('5106474520863269195')" id='hide5106474520863269195' style="display: none">▼ Hide Changelog</a>
<pre id="changelist5106474520863269195" style="display: none">Changes present in 1.0.0.20131109:
- Fix a crash when remapping modifiers or requesting permission to register a hotkey on OS 10.7 and 10.8.

Changes present in 1.0.0.20131108:
- Fix bug where arrange horizontally computed the wrapping position incorrecly if the screen's visible frame wasn't 0
- Set coprocess file descriptors nonblocking to avoid deadlock in bug 2576
- Revert to old text drawing methods
- Fix bug where the char under the cursor wasn't drawn
- Fix bug where cursor blinked while moving
- Fix crash in tmux with line drawing characters.
- Fix a bug where a session would split using its old profile after its profile was changed.
- Improve how font width is computed.
- Fix occasional hang when a session terminates.
- Hide menu bar on all screens in Mavericks in non-Lion fullscreen mode.
- Speed up drawing in instant replay.
- Update instructions for enabling access for asssitive devices on Mavericks.
- Changes how text is drawn for improved performance.

</pre></p>
</p>
<h4><a target="_blank" href="/downloads/beta/iTerm2-1_0_0_20131109-LeopardPPC.zip"><img src="/img/small-download.png" align="left">&nbsp;iTerm2 1.0.0.20131109 beta (OS 10.5, Intel, PPC)
</a></h4>
<p>
This build has a limited set of features but supports OS 10.5 and PowerPC. If you have an Intel Mac that runs OS 10.6 or newer, you don't want this.

<br>
</p>
<h4><a target="_blank" href="/downloads/beta/iTerm2-1_0_0_20131108.zip"><img src="/img/small-download.png" align="left">&nbsp;iTerm2 1.0.0.20131108 beta (OS 10.6+, Intel-only)
</a></h4>
<p>
This is the recommended beta build for most users. It contains a bunch of bug fixes (improving Mavericks compatibility) plus some performance improvements.

<br>
<p><a href="javascript:showId('3336487347497385286')" id='show3336487347497385286'>▶ Show Changelog</a>
<a href="javascript:hideId('3336487347497385286')" id='hide3336487347497385286' style="display: none">▼ Hide Changelog</a>
<pre id="changelist3336487347497385286" style="display: none">- Fix bug where arrange horizontally computed the wrapping position incorrecly if the screen's visible frame wasn't 0
- Set coprocess file descriptors nonblocking to avoid deadlock in bug 2576
- Revert to old text drawing methods
- Fix bug where the char under the cursor wasn't drawn
- Fix bug where cursor blinked while moving
- Fix crash in tmux with line drawing characters.
- Fix a bug where a session would split using its old profile after its profile was changed.
- Improve how font width is computed.
- Fix occasional hang when a session terminates.
- Hide menu bar on all screens in Mavericks in non-Lion fullscreen mode.
- Speed up drawing in instant replay.
- Update instructions for enabling access for asssitive devices on Mavericks.
- Changes how text is drawn for improved performance.
</pre></p>
</p>
<h4><a target="_blank" href="/downloads/beta/iTerm2-1_0_0_20131108-LeopardPPC.zip"><img src="/img/small-download.png" align="left">&nbsp;iTerm2 1.0.0.20131108 beta (OS 10.5, Intel, PPC)
</a></h4>
<p>
This build has a limited set of features but supports OS 10.5 and PowerPC. If you have an Intel Mac that runs OS 10.6 or newer, you don't want this.

<br>
</p>
<h4><a target="_blank" href="/downloads/beta/iTerm2-1_0_0_20131106.zip"><img src="/img/small-download.png" align="left">&nbsp;iTerm2 1.0.0.20131106 beta (OS 10.6+, Intel-only)
</a></h4>
<p>
This is the recommended beta build for most users. It contains a bunch of bug fixes (improving Mavericks compatibility) plus some performance improvements.

<br>
<p><a href="javascript:showId('5775915012317146128')" id='show5775915012317146128'>▶ Show Changelog</a>
<a href="javascript:hideId('5775915012317146128')" id='hide5775915012317146128' style="display: none">▼ Hide Changelog</a>
<pre id="changelist5775915012317146128" style="display: none">- Fix bug where arrange horizontally computed the wrapping position incorrecly if the screen's visible frame wasn't 0
- Set coprocess file descriptors nonblocking to avoid deadlock in bug 2576
- Revert to old text drawing methods
- Fix bug where the char under the cursor wasn't drawn
- Fix bug where cursor blinked while moving
- Fix crash in tmux with line drawing characters.
- Split sessions that have have had their profiles changed with the new profile.
- Improve how font width is computed.
- Fix occasional hang when a session terminates.
- Switch to 10.9 SDK to fix fullscreen on second monitor bug in Mavericks.
- Speed up drawing in instant replay.
</pre></p>
</p>
<h4><a target="_blank" href="/downloads/beta/iTerm2-1_0_0_20131103.zip"><img src="/img/small-download.png" align="left">&nbsp;iTerm2 1.0.0.20131103 beta (OS 10.6+, Intel-only)
</a></h4>
<p>
This is the recommended beta build for most users. It includes performance improvements and is the first build to support Mavericks.

<br>
<p><a href="javascript:showId('7104456616407109427')" id='show7104456616407109427'>▶ Show Changelog</a>
<a href="javascript:hideId('7104456616407109427')" id='hide7104456616407109427' style="display: none">▼ Hide Changelog</a>
<pre id="changelist7104456616407109427" style="display: none">
- Hide menu bar on all screens in Mavericks in non-Lion fullscreen mode.
- Update instructions for enabling access for asssitive devices on Mavericks.
- Changes how text is drawn for improved performance.
- Fix a bug where a session would split using its old profile after its profile was changed.
- Refuse to connect to tmux in aggressive resize mode.
- Improve how font sizes are measured.
- Fix occasional hang when a session dies.
- Improve drawing performance on instant replay.
</pre></p>
</p>
<h4><a target="_blank" href="/downloads/beta/iTerm2-1_0_0_20130811.zip"><img src="/img/small-download.png" align="left">&nbsp;iTerm2 1.0.0.20130811 beta (OS 10.6+, Intel-only)
</a></h4>
<p>
This is the recommended beta build for most users. It contains a bunch of bug fixes, including fixes for some crashers, plus some minor performance improvements.

<br>
<p><a href="javascript:showId('2485065041652993418')" id='show2485065041652993418'>▶ Show Changelog</a>
<a href="javascript:hideId('2485065041652993418')" id='hide2485065041652993418' style="display: none">▼ Hide Changelog</a>
<pre id="changelist2485065041652993418" style="display: none">iTerm2 1.0.0.20130811
Bug fixes.

- Fix bug where tmux logging didn't always work.
- Fix a crash due to an assert in VT100Screen.m.
- Fix crashes that occur when a window closes while a modal dialog is open.
- Fix a crash due to an assert in accessibility code.
- Fix a crash when performing Find On Page while receiving new content.
- Fix messed up icons in Prefs.
- Fix "Reset" to preserve the prompt on the top of the screen.
- Fix how locations a reported to accessibility to fix things like three-finger-tap for dictionary lookup.
- Fix bug where Cmd-0 would leave the profile in an inconsistent state.
- Fix bug where iTerm2 hangs on a broken pipe sometimes.
- Fix a bug where cmd-opt-click would move the cursor.
- Fix a bug where importing or deleting a color scheme didn't update all preference panels.
- Fix ipv6 support for bonjour hosts.
- Strip trailing spaces from history in tmux integration mode.
- Increase threshold for slowing down screen updates due to too much input.
- Improve performance while holding down a key.
- Add hidden boolean preference "ExperimentalOptimizationsEnabled", which speeds up screen drawing. It's off by default.
</pre></p>
</p>
<h4><a target="_blank" href="/downloads/beta/iTerm2-1_0_0_20130811-LeopardPPC.zip"><img src="/img/small-download.png" align="left">&nbsp;iTerm2 1.0.0.20130324-LeopardPPC beta (for OS 10.5 or PowerPC only)
</a></h4>
<p>
This build has a limited set of features but supports OS 10.5 and PowerPC. If you have an Intel Mac that runs OS 10.6 or newer, you don't want this.

<br>
</p>
<h4><a target="_blank" href="/downloads/beta/iTerm2-1_0_0_20130624.zip"><img src="/img/small-download.png" align="left">&nbsp;iTerm2 1.0.0.20130624 beta (OS 10.6+, Intel-only)
</a></h4>
<p>
This is the recommended beta build for most users. It fixes a bug with drawing Emoji on OS 10.7, plus fixes a few rare crashes.

<br>
<p><a href="javascript:showId('3405613229788531264')" id='show3405613229788531264'>▶ Show Changelog</a>
<a href="javascript:hideId('3405613229788531264')" id='hide3405613229788531264' style="display: none">▼ Hide Changelog</a>
<pre id="changelist3405613229788531264" style="display: none">iTerm2 1.0.0.20130624
Follow-up release to 1.0.0.20130622, primarily to fix Emoji rendering on 10.7.

- Fix a bug where Emoji chars didn't render on OS 10.7.
- Update screen more often, unless a lot of data is being read quickly.
- Change RIS code to move the cursor to the origin (saitoha).
- Fix bug where session logging didn't work with tmux sessions.
- Prevent crash when a selection disappears while resizing the screen.
- Fix a crash that happens when a window closes while a modal dialog is open.
- Fix a crash that happens when using a screen reader.
- Fix a crash that happens when doing a find and part of the history scrolls off at just the wrong time.
</pre></p>
</p>
<h4><a target="_blank" href="/downloads/beta/iTerm2-1_0_0_20130624-LeopardPPC.zip"><img src="/img/small-download.png" align="left">&nbsp;iTerm2 1.0.0.20130624-LeopardPPC beta (for OS 10.5 or PowerPC only)
</a></h4>
<p>
This build has a limited set of features but supports OS 10.5 and PowerPC. If you have an Intel Mac that runs OS 10.6 or newer, you don't want this.

<br>
</p>
<h4><a target="_blank" href="/downloads/beta/iTerm2-1_0_0_20130622.zip"><img src="/img/small-download.png" align="left">&nbsp;iTerm2 1.0.0.20130622 beta (OS 10.6+, Intel-only)
</a></h4>
<p>
This is the recommended beta build for most users. It contains a large number of bug fixes since the last beta, plus added support for italics and tiled background images.

<br>
<p><a href="javascript:showId('144854126226499582')" id='show144854126226499582'>▶ Show Changelog</a>
<a href="javascript:hideId('144854126226499582')" id='hide144854126226499582' style="display: none">▼ Hide Changelog</a>
<pre id="changelist144854126226499582" style="display: none">iTerm2 1.0.0.20130622
Follow-up release to fix a nasty bug in 1.0.0.20130613.

Changes:
- Fix a bug where, with certain fonts, ligatures would be drawn (turning "fi" into one character)
- Fix a bug where certain characters wouldn't work in hotkey codes.
- Fix rendering emoji characters.
- Show the window number in the title even if it's 9 or greater
- Fix crash when a trigger highlights part of a line that wraps off the screen
- Updated prefs icons (Reda Lemeden)
</pre></p>
</p>
<h4><a target="_blank" href="/downloads/beta/iTerm2-1_0_0_20130622-LeopardPPC.zip"><img src="/img/small-download.png" align="left">&nbsp;iTerm2 1.0.0.20130622-LeopardPPC beta (for OS 10.5 or PowerPC only)
</a></h4>
<p>
This build has a limited set of features but supports OS 10.5 and PowerPC. If you have an Intel Mac that runs OS 10.6 or newer, you don't want this.

<br>
</p>
<h4><a target="_blank" href="/downloads/beta/iTerm2-1_0_0_20130613.zip"><img src="/img/small-download.png" align="left">&nbsp;iTerm2 1.0.0.20130613 beta (OS 10.6+, Intel-only)
</a></h4>
<p>
This is the recommended beta build for most users. It contains a large number of bug fixes since the last beta, plus added support for italics and tiled background images.

<br>
<p><a href="javascript:showId('3714082346670608310')" id='show3714082346670608310'>▶ Show Changelog</a>
<a href="javascript:hideId('3714082346670608310')" id='hide3714082346670608310' style="display: none">▼ Hide Changelog</a>
<pre id="changelist3714082346670608310" style="display: none">These release notes are for the development builds of iTerm2. The last stable release was 1.0.0.

iTerm2 1.0.0.20130613
Bug fixes. This release is a follow-on to 1.0.0.20130601, which was not put on auto-update, and will include its changes in the change log.

Changes new in 1.0.0.20130613
- Fix breakage with top-of-tree tmux
- Improve performance in alternate screen mode by eliding unnecessary screen refreshes
- Ignore extra CSI params (saitoha)
- Fix bug where lines with multiple colors were rendered incorrectly.
- Fix build breakage on 10.5/ppc
- Fix a memory leak

Changes carried over from 1.0.0.20130601
Enhancements:
- Add support for tiled background images (Foy Savas)
- Add support for italics (Stefan Schüßler)

Bug Fixes:
- Fix a crash when a window closes after a session ends.
- Fix crash when trying to find a filename in an empty string
- Fix bug where bottom-of-screen windows resized incorrectly on screen change.
- Disallow column mode (DECSET/DECRST 3) by default.
- Move cursor back into last column (out of the virtual last+1 column) when moving cursor up or down. Fixes bug 2405
- Detect Textmate 2 as Textmate
- Fix problems with toolbar not remembering its state properly
- Add any-event mouse tracking (DECSET 1003)
- Fix bug where global prefs were considered when diffing prefs vs remote to see if anything changed
- Add support for Sublime Text 3 (tinystatemachine)
- Fix a bug in Exposé where the Exposé window was in the wrong place; also hide the dock and menu bar in Exposé.
- Fix bug where we can't get a process's ppid if it's setuid (e.g., top). The fix only works on 10.7 and up.
- Right clicking a profile in the "Profiles" dialog offers the option to "Edit Bookmark..." which is outdated and confusing terminology.
- Prevent various bogus things from getting focus when cmd-tab'ing back to iTerm2.
- Make setting highlight colors that affect only fg/bg actually affect only fg/bg. Fixes bug 2429
- Fix accessibility breakage in OS 10.8 (Boris Dušek)
- Remove calls to deprecated convertPointFromBase: which logged warning messages.
- Fix bug where adding a tab when there are no tab stops causes a hang. Fixes bug 2437
- Remove control chars before pasting
- Fix bug where menu/dock showed when the number of tabs changed in fullscreen
- Always use the Unicode font for non-ASCII (Aaron Meurer)
- Save tab colors in arrangements
- Fix bug where an unassigned hotkey maps to 'a' with no modifier
- Restore support for G1..G3 character sets to fix line drawing chars.
- Add Edit>Reset Character Set to fix what happens when line drawing escape codes go awry
- When erasing a line, replace soft newlines with hard newlines (fixes copying out of vim combining multiple lines into one).
- Don't lock auto scrolling on a first-mouse mouseDown event
- Fix bug where XTERMCC_WINDOWPOS swapped its x and y args and make XTERMCC_REPORT_WIN_POS report the Y coordinate in a more traditional way (distance from top of screen to top of window)
- Fix bug where alt-click didn't use the right condition to determine whether to move the cursor.

Tmux integration bug fixes:
- Fix bug where new tmux windows would open in a tab
- Support an optional flag at the end of %begin and %end to fix post-tmux 1.8 bug
- Fix bug where dragging a split pane to the left in tmux doesn't resize anything
- Make cmd-t and cmd-w open a tmux window/tab if the current session is tmux
- Work around bug in tmux 1.8 where unlink-window will print %exit without %end
- Turn off tmux verbose logging
- Fix bug where dragging a tmux split vertically computes the wrong splitter index and wrong distance moved, probably beacuse convertPointFromBase: does crazy things on retina
- Fix bug where tmux window jumps to its previous coordinate when layout changes.
- Work around bugs in post-1.8 tmux protocol
- Split long send-keys commands into sub-1024-byte chunks to avoid crashing tmux 1.8
- Fix problem where you can't open a tmux tab/window while not in a tmux window.
</pre></p>
</p>
<h4><a target="_blank" href="/downloads/beta/iTerm2-1_0_0_20130613-LeopardPPC.zip"><img src="/img/small-download.png" align="left">&nbsp;iTerm2 1.0.0.20130613-LeopardPPC beta (for OS 10.5 or PowerPC only)
</a></h4>
<p>
This build has a limited set of features but supports OS 10.5 and PowerPC. If you have an Intel Mac that runs OS 10.6 or newer, you don't want this.

<br>
</p>
<h4><a target="_blank" href="/downloads/beta/iTerm2-1_0_0_20130602.zip"><img src="/img/small-download.png" align="left">&nbsp;iTerm2 1.0.0.20130602 beta (OS 10.6+, Intel-only)
</a></h4>
<p>
This is the recommended beta build for most users. It contains a large number of bug fixes since the last beta, plus added support for italics and tiled background images.

<br>
<p><a href="javascript:showId('5493136172302482124')" id='show5493136172302482124'>▶ Show Changelog</a>
<a href="javascript:hideId('5493136172302482124')" id='hide5493136172302482124' style="display: none">▼ Hide Changelog</a>
<pre id="changelist5493136172302482124" style="display: none">Enhancements:
- Add support for tiled background images (Foy Savas)
- Add support for italics (Stefan Schüßler)

Bug Fixes:
- Fix a crash when a window closes after a session ends.
- Fix crash when trying to find a filename in an empty string
- Fix bug where bottom-of-screen windows resized incorrectly on screen change.
- Disallow column mode (DECSET/DECRST 3) by default.
- Move cursor back into last column (out of the virtual last+1 column) when moving cursor up or down. Fixes bug 2405
- Detect Textmate 2 as Textmate
- Fix problems with toolbar not remembering its state properly
- Add any-event mouse tracking (DECSET 1003)
- Fix bug where global prefs were considered when diffing prefs vs remote to see if anything changed
- Add support for Sublime Text 3 (tinystatemachine)
- Fix a bug in Exposé where the Exposé window was in the wrong place; also hide the dock and menu bar in Exposé.
- Fix bug where we can't get a process's ppid if it's setuid (e.g., top). The fix only works on 10.7 and up.
- Right clicking a profile in the "Profiles" dialog offers the option to "Edit Bookmark..." which is outdated and confusing terminology.
- Prevent various bogus things from getting focus when cmd-tab'ing back to iTerm2.
- Make setting highlight colors that affect only fg/bg actually affect only fg/bg. Fixes bug 2429
- Fix accessibility breakage in OS 10.8 (Boris Dušek)
- Remove calls to deprecated convertPointFromBase: which logged warning messages.
- Fix bug where adding a tab when there are no tab stops causes a hang. Fixes bug 2437
- Remove control chars before pasting
- Fix bug where menu/dock showed when the number of tabs changed in fullscreen
- Always use the Unicode font for non-ASCII (Aaron Meurer)
- Save tab colors in arrangements
- Fix bug where an unassigned hotkey maps to 'a' with no modifier
- Restore support for G1..G3 character sets to fix line drawing chars.
- Add Edit>Reset Character Set to fix what happens when line drawing escape codes go awry
- When erasing a line, replace soft newlines with hard newlines (fixes copying out of vim combining multiple lines into one).
- Don't lock auto scrolling on a first-mouse mouseDown event
- Fix bug where XTERMCC_WINDOWPOS swapped its x and y args and make XTERMCC_REPORT_WIN_POS report the Y coordinate in a more traditional way (distance from top of screen to top of window)
- Fix bug where alt-click didn't use the right condition to determine whether to move the cursor.

Tmux integration bug fixes:
- Fix bug where new tmux windows would open in a tab
- Support an optional flag at the end of %begin and %end to fix post-tmux 1.8 bug
- Fix bug where dragging a split pane to the left in tmux doesn't resize anything
- Make cmd-t and cmd-w open a tmux window/tab if the current session is tmux
- Work around bug in tmux 1.8 where unlink-window will print %exit without %end
- Turn off tmux verbose logging
- Fix bug where dragging a tmux split vertically computes the wrong splitter index and wrong distance moved, probably beacuse convertPointFromBase: does crazy things on retina
- Fix bug where tmux window jumps to its previous coordinate when layout changes.
- Work around bugs in post-1.8 tmux protocol
- Split long send-keys commands into sub-1024-byte chunks to avoid crashing tmux 1.8
- Fix problem where you can't open a tmux tab/window while not in a tmux window.
</pre></p>
</p>
<h4><a target="_blank" href="/downloads/beta/iTerm2-1_0_0_20130324-LeopardPPC.zip"><img src="/img/small-download.png" align="left">&nbsp;iTerm2 1.0.0.20130324-LeopardPPC beta (for OS 10.5 or PowerPC only)
</a></h4>
<p>
This build has a limited set of features but supports OS 10.5 and PowerPC. If you have an Intel Mac that runs OS 10.6 or newer, you don't want this.

<br>
</p>
</div>
<h3>Nightly builds</h3>
<h4><a target="_blank" href="/downloads/nightly/iTerm2-1_0_0_20140714-nightly.zip"><img src="/img/small-download.png" align="left">&nbsp;iTerm2-1_0_0_20140714-nightly</a></h4>
<p>

<br>
</p>
<h4><a target="_blank" href="/downloads/nightly/iTerm2-1_0_0_20140713-nightly.zip"><img src="/img/small-download.png" align="left">&nbsp;iTerm2-1_0_0_20140713-nightly</a></h4>
<p>

<br>
</p>
<h4><a target="_blank" href="/downloads/nightly/iTerm2-1_0_0_20140711-nightly.zip"><img src="/img/small-download.png" align="left">&nbsp;iTerm2-1_0_0_20140711-nightly</a></h4>
<p>

<br>
</p>
<h4><a target="_blank" href="/downloads/nightly/iTerm2-1_0_0_20140709-nightly.zip"><img src="/img/small-download.png" align="left">&nbsp;iTerm2-1_0_0_20140709-nightly</a></h4>
<p>

<br>
</p>
<h4><a target="_blank" href="/downloads/nightly/iTerm2-1_0_0_20140708-nightly.zip"><img src="/img/small-download.png" align="left">&nbsp;iTerm2-1_0_0_20140708-nightly</a></h4>
<p>

<br>
</p>
<p><a href="javascript:showId('nightly')" id='shownightly'>▶ Show Older Versions</a>
<a href="javascript:hideId('nightly')" id='hidenightly' style="display: none">▼ Hide Older Versions</a>
<div id="changelistnightly" style="margin-left: 15pt; display: none"><h3>Older Nightly builds</h3>
<h4><a target="_blank" href="/downloads/nightly/iTerm2-1_0_0_20140705-nightly.zip"><img src="/img/small-download.png" align="left">&nbsp;iTerm2-1_0_0_20140705-nightly</a></h4>
<p>

<br>
</p>
<h4><a target="_blank" href="/downloads/nightly/iTerm2-1_0_0_20140704-nightly.zip"><img src="/img/small-download.png" align="left">&nbsp;iTerm2-1_0_0_20140704-nightly</a></h4>
<p>

<br>
</p>
<h4><a target="_blank" href="/downloads/nightly/iTerm2-1_0_0_20140629-nightly.zip"><img src="/img/small-download.png" align="left">&nbsp;iTerm2-1_0_0_20140629-nightly</a></h4>
<p>

<br>
</p>
<h4><a target="_blank" href="/downloads/nightly/iTerm2-1_0_0_20140628-nightly.zip"><img src="/img/small-download.png" align="left">&nbsp;iTerm2-1_0_0_20140628-nightly</a></h4>
<p>

<br>
</p>
<h4><a target="_blank" href="/downloads/nightly/iTerm2-1_0_0_20140626-nightly.zip"><img src="/img/small-download.png" align="left">&nbsp;iTerm2-1_0_0_20140626-nightly</a></h4>
<p>

<br>
</p>
<h4><a target="_blank" href="/downloads/nightly/iTerm2-1_0_0_20140623-nightly.zip"><img src="/img/small-download.png" align="left">&nbsp;iTerm2-1_0_0_20140623-nightly</a></h4>
<p>

<br>
</p>
<h4><a target="_blank" href="/downloads/nightly/iTerm2-1_0_0_20140622-nightly.zip"><img src="/img/small-download.png" align="left">&nbsp;iTerm2-1_0_0_20140622-nightly</a></h4>
<p>

<br>
</p>
<h4><a target="_blank" href="/downloads/nightly/iTerm2-1_0_0_20140619-nightly.zip"><img src="/img/small-download.png" align="left">&nbsp;iTerm2-1_0_0_20140619-nightly</a></h4>
<p>

<br>
</p>
<h4><a target="_blank" href="/downloads/nightly/iTerm2-1_0_0_20140618-nightly.zip"><img src="/img/small-download.png" align="left">&nbsp;iTerm2-1_0_0_20140618-nightly</a></h4>
<p>

<br>
</p>
<h4><a target="_blank" href="/downloads/nightly/iTerm2-1_0_0_20140617-nightly.zip"><img src="/img/small-download.png" align="left">&nbsp;iTerm2-1_0_0_20140617-nightly</a></h4>
<p>

<br>
</p>
<h4><a target="_blank" href="/downloads/nightly/iTerm2-1_0_0_20140616-nightly.zip"><img src="/img/small-download.png" align="left">&nbsp;iTerm2-1_0_0_20140616-nightly</a></h4>
<p>

<br>
</p>
<h4><a target="_blank" href="/downloads/nightly/iTerm2-1_0_0_20140612-nightly.zip"><img src="/img/small-download.png" align="left">&nbsp;iTerm2-1_0_0_20140612-nightly</a></h4>
<p>

<br>
</p>
<h4><a target="_blank" href="/downloads/nightly/iTerm2-1_0_0_20140610-nightly.zip"><img src="/img/small-download.png" align="left">&nbsp;iTerm2-1_0_0_20140610-nightly</a></h4>
<p>

<br>
</p>
<h4><a target="_blank" href="/downloads/nightly/iTerm2-1_0_0_20140608-nightly.zip"><img src="/img/small-download.png" align="left">&nbsp;iTerm2-1_0_0_20140608-nightly</a></h4>
<p>

<br>
</p>
<h4><a target="_blank" href="/downloads/nightly/iTerm2-1_0_0_20140606-nightly.zip"><img src="/img/small-download.png" align="left">&nbsp;iTerm2-1_0_0_20140606-nightly</a></h4>
<p>

<br>
</p>
<h4><a target="_blank" href="/downloads/nightly/iTerm2-1_0_0_20140601-nightly.zip"><img src="/img/small-download.png" align="left">&nbsp;iTerm2-1_0_0_20140601-nightly</a></h4>
<p>

<br>
</p>
<h4><a target="_blank" href="/downloads/nightly/iTerm2-1_0_0_20140530-nightly.zip"><img src="/img/small-download.png" align="left">&nbsp;iTerm2-1_0_0_20140530-nightly</a></h4>
<p>

<br>
</p>
<h4><a target="_blank" href="/downloads/nightly/iTerm2-1_0_0_20140529-nightly.zip"><img src="/img/small-download.png" align="left">&nbsp;iTerm2-1_0_0_20140529-nightly</a></h4>
<p>

<br>
</p>
<h4><a target="_blank" href="/downloads/nightly/iTerm2-1_0_0_20140528-nightly.zip"><img src="/img/small-download.png" align="left">&nbsp;iTerm2-1_0_0_20140528-nightly</a></h4>
<p>

<br>
</p>
<h4><a target="_blank" href="/downloads/nightly/iTerm2-1_0_0_20140527-nightly.zip"><img src="/img/small-download.png" align="left">&nbsp;iTerm2-1_0_0_20140527-nightly</a></h4>
<p>

<br>
</p>
<h4><a target="_blank" href="/downloads/nightly/iTerm2-1_0_0_20140525-nightly.zip"><img src="/img/small-download.png" align="left">&nbsp;iTerm2-1_0_0_20140525-nightly</a></h4>
<p>

<br>
</p>
<h4><a target="_blank" href="/downloads/nightly/iTerm2-1_0_0_20140516-nightly.zip"><img src="/img/small-download.png" align="left">&nbsp;iTerm2-1_0_0_20140516-nightly</a></h4>
<p>

<br>
</p>
<h4><a target="_blank" href="/downloads/nightly/iTerm2-1_0_0_20140514-nightly.zip"><img src="/img/small-download.png" align="left">&nbsp;iTerm2-1_0_0_20140514-nightly</a></h4>
<p>

<br>
</p>
<h4><a target="_blank" href="/downloads/nightly/iTerm2-1_0_0_20140513-nightly.zip"><img src="/img/small-download.png" align="left">&nbsp;iTerm2-1_0_0_20140513-nightly</a></h4>
<p>

<br>
</p>
<h4><a target="_blank" href="/downloads/nightly/iTerm2-1_0_0_20140512-nightly.zip"><img src="/img/small-download.png" align="left">&nbsp;iTerm2-1_0_0_20140512-nightly</a></h4>
<p>

<br>
</p>
<h4><a target="_blank" href="/downloads/nightly/iTerm2-1_0_0_20140510-nightly.zip"><img src="/img/small-download.png" align="left">&nbsp;iTerm2-1_0_0_20140510-nightly</a></h4>
<p>

<br>
</p>
<h4><a target="_blank" href="/downloads/nightly/iTerm2-1_0_0_20140508-nightly.zip"><img src="/img/small-download.png" align="left">&nbsp;iTerm2-1_0_0_20140508-nightly</a></h4>
<p>

<br>
</p>
<h4><a target="_blank" href="/downloads/nightly/iTerm2-1_0_0_20140507-nightly.zip"><img src="/img/small-download.png" align="left">&nbsp;iTerm2-1_0_0_20140507-nightly</a></h4>
<p>

<br>
</p>
<h4><a target="_blank" href="/downloads/nightly/iTerm2-1_0_0_20140506-nightly.zip"><img src="/img/small-download.png" align="left">&nbsp;iTerm2-1_0_0_20140506-nightly</a></h4>
<p>

<br>
</p>
<h4><a target="_blank" href="/downloads/nightly/iTerm2-1_0_0_20140504-nightly.zip"><img src="/img/small-download.png" align="left">&nbsp;iTerm2-1_0_0_20140504-nightly</a></h4>
<p>

<br>
</p>
<h4><a target="_blank" href="/downloads/nightly/iTerm2-1_0_0_20140503-nightly.zip"><img src="/img/small-download.png" align="left">&nbsp;iTerm2-1_0_0_20140503-nightly</a></h4>
<p>

<br>
</p>
<h4><a target="_blank" href="/downloads/nightly/iTerm2-1_0_0_20140502-nightly.zip"><img src="/img/small-download.png" align="left">&nbsp;iTerm2-1_0_0_20140502-nightly</a></h4>
<p>

<br>
</p>
<h4><a target="_blank" href="/downloads/nightly/iTerm2-1_0_0_20140430-nightly.zip"><img src="/img/small-download.png" align="left">&nbsp;iTerm2-1_0_0_20140430-nightly</a></h4>
<p>

<br>
</p>
<h4><a target="_blank" href="/downloads/nightly/iTerm2-1_0_0_20140429-nightly.zip"><img src="/img/small-download.png" align="left">&nbsp;iTerm2-1_0_0_20140429-nightly</a></h4>
<p>

<br>
</p>
<h4><a target="_blank" href="/downloads/nightly/iTerm2-1_0_0_20140428-nightly.zip"><img src="/img/small-download.png" align="left">&nbsp;iTerm2-1_0_0_20140428-nightly</a></h4>
<p>

<br>
</p>
<h4><a target="_blank" href="/downloads/nightly/iTerm2-1_0_0_20140423-nightly.zip"><img src="/img/small-download.png" align="left">&nbsp;iTerm2-1_0_0_20140423-nightly</a></h4>
<p>

<br>
</p>
<h4><a target="_blank" href="/downloads/nightly/iTerm2-1_0_0_20140421-nightly.zip"><img src="/img/small-download.png" align="left">&nbsp;iTerm2-1_0_0_20140421-nightly</a></h4>
<p>

<br>
</p>
<h4><a target="_blank" href="/downloads/nightly/iTerm2-1_0_0_20140407-nightly.zip"><img src="/img/small-download.png" align="left">&nbsp;iTerm2-1_0_0_20140407-nightly</a></h4>
<p>

<br>
</p>
<h4><a target="_blank" href="/downloads/nightly/iTerm2-1_0_0_20140406-nightly.zip"><img src="/img/small-download.png" align="left">&nbsp;iTerm2-1_0_0_20140406-nightly</a></h4>
<p>

<br>
</p>
<h4><a target="_blank" href="/downloads/nightly/iTerm2-1_0_0_20140404-nightly.zip"><img src="/img/small-download.png" align="left">&nbsp;iTerm2-1_0_0_20140404-nightly</a></h4>
<p>

<br>
</p>
<h4><a target="_blank" href="/downloads/nightly/iTerm2-1_0_0_20140403-nightly.zip"><img src="/img/small-download.png" align="left">&nbsp;iTerm2-1_0_0_20140403-nightly</a></h4>
<p>

<br>
</p>
<h4><a target="_blank" href="/downloads/nightly/iTerm2-1_0_0_20140402-nightly.zip"><img src="/img/small-download.png" align="left">&nbsp;iTerm2-1_0_0_20140402-nightly</a></h4>
<p>

<br>
</p>
<h4><a target="_blank" href="/downloads/nightly/iTerm2-1_0_0_20140401-nightly.zip"><img src="/img/small-download.png" align="left">&nbsp;iTerm2-1_0_0_20140401-nightly</a></h4>
<p>

<br>
</p>
<h4><a target="_blank" href="/downloads/nightly/iTerm2-1_0_0_20140331-nightly.zip"><img src="/img/small-download.png" align="left">&nbsp;iTerm2-1_0_0_20140331-nightly</a></h4>
<p>

<br>
</p>
<h4><a target="_blank" href="/downloads/nightly/iTerm2-1_0_0_20140330-nightly.zip"><img src="/img/small-download.png" align="left">&nbsp;iTerm2-1_0_0_20140330-nightly</a></h4>
<p>

<br>
</p>
<h4><a target="_blank" href="/downloads/nightly/iTerm2-1_0_0_20140327-nightly.zip"><img src="/img/small-download.png" align="left">&nbsp;iTerm2-1_0_0_20140327-nightly</a></h4>
<p>

<br>
</p>
<h4><a target="_blank" href="/downloads/nightly/iTerm2-1_0_0_20140326-nightly.zip"><img src="/img/small-download.png" align="left">&nbsp;iTerm2-1_0_0_20140326-nightly</a></h4>
<p>

<br>
</p>
<h4><a target="_blank" href="/downloads/nightly/iTerm2-1_0_0_20140324-nightly.zip"><img src="/img/small-download.png" align="left">&nbsp;iTerm2-1_0_0_20140324-nightly</a></h4>
<p>

<br>
</p>
<h4><a target="_blank" href="/downloads/nightly/iTerm2-1_0_0_20140319-nightly.zip"><img src="/img/small-download.png" align="left">&nbsp;iTerm2-1_0_0_20140319-nightly</a></h4>
<p>

<br>
</p>
<h4><a target="_blank" href="/downloads/nightly/iTerm2-1_0_0_20140318-nightly.zip"><img src="/img/small-download.png" align="left">&nbsp;iTerm2-1_0_0_20140318-nightly</a></h4>
<p>

<br>
</p>
<h4><a target="_blank" href="/downloads/nightly/iTerm2-1_0_0_20140317-nightly.zip"><img src="/img/small-download.png" align="left">&nbsp;iTerm2-1_0_0_20140317-nightly</a></h4>
<p>

<br>
</p>
<h4><a target="_blank" href="/downloads/nightly/iTerm2-1_0_0_20140316-nightly.zip"><img src="/img/small-download.png" align="left">&nbsp;iTerm2-1_0_0_20140316-nightly</a></h4>
<p>

<br>
</p>
</div>
<h3>Nightly Builds</h3>
<h4><a target="_blank" href="/nightly/latest"><img src="/img/small-download.png" align="left">&nbsp;Latest nightly build</a></h4>
<p>
A nightly build is begun at midnight PST every day and uploaded upon successful completion. If no changes were made, no new build is created.
The change log may be seen <a href="https://github.com/gnachman/iTerm2/commits/master">on Github.</a>
</p>
<br>
