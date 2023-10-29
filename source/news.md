---
layout: default
title: iTerm2 - macOS Terminal Replacement
active-state: news
---

#### Security updates for 3.4 and 3.5 beta
<i>Sunnyvale, CA&mdash;August 10, 2023</i>

Version 3.4.20 and 3.5.0beta11 have been released today. They address security vulnerabilities related to control sequences that send responses which can be used to cause iTerm2 to issue commands under certain circumstances. Credit goes to Github user solid-snail for the discovery. Please read <a href="https://blog.solidsnail.com/posts/2023-08-28-iterm2-rce">From Terminal Output to Arbitrary Remote Code Execution</a> for more information.

Updated 10/29/2023: The CVE numbers finally came in. They are:

  * CVE-2023-46300
  * CVE-2023-46301

#### iTerm2 Version 3.4 Released
<i>Sunnyvale, CA&mdash;November 10, 2020</i>

iTerm2 version 3.4 has been released, featuring a number of improvements to performance, core functionality, and polish. For all the details, please see the <a href="https://iterm2.com/downloads/stable/iTerm2-3_4_0.changelog">change log</a>.

Get it from <a href="/downloads.html">the Downloads page</a> in the "Stable Releases" section.

#### Security update released. Please upgrade.
<i>Sunnyvale, CA&mdash;October 9, 2019</i>
A serious bug (CVE-2019-9535) was fixed in version 3.3.6. Users on older versions should upgrade right away. More details can be found here: https://groups.google.com/forum/#!topic/iterm2-discuss/57k_AuLdQa4

#### iTerm2 Version 3.3 Released
<i>Sunnyvale, CA&mdash;July 31, 2019</i>

iTerm2 version 3.3 has been released, featuring two new themes, a status bar, and a very powerful Python scripting API. Many core features have been improved, such as how titles are displayed, how keyboard input is transmitted, how background images are drawn, and more. For all the details, please see the <a href="https://iterm2.com/downloads/stable/iTerm2-3_3_0.changelog">change log</a>.

Get it from <a href="/downloads.html">the Downloads page</a> in the "Stable Releases" section.

#### iTerm2 GPU Renderer Released
<i>Sunnyvale, CA&mdash;August 7, 2018</i>

iTerm2 version 3.2 has been released, featuring a new drawing engine that uses Metal to improve rendering performance by using the GPU. Screen updates are much faster, leaving your CPU free to do more. Scrolling is buttery smooth! Many new features and bug fixes are also included. Read the <a href="https://iterm2.com/downloads/stable/iTerm2-3_2_0.changelog">change log</a> for details.

Get it from <a href="/downloads.html">the Downloads page</a> in the "Stable Releases" section.

#### Important Security Update

Version 3.1.1 of iTerm2 has been released and contains an important security update. Prior versions could leak private data over DNS requests. Please update to 3.1.1 or later. For more information, please see the <a href="https://gitlab.com/gnachman/iterm2/wikis/dnslookupissue">official statement</a>.

#### iTerm2 Version 3.1 Released
<i>Sunnyvale, CA&mdash;September 18, 2017</i>

Version 3.1 of iTerm2 is now in stable release. It adds many notable features:

  * Touch Bar support
  * Ligature font support
  * Many improvements to Hotkey Windows
  * Copy Mode

...and scores of small new features (like hyperlinks and new shell integration utilities) and bug fixes. You can see all the details in the <a href="https://iterm2.com/downloads/stable/iTerm2-3_1_0.changelog">change log</a>.

#### iTerm2 Version 3 Stable Released
<i>Sunnyvale, CA&mdash;July 4, 2016</i>

After eighteen months of development and a four month beta period, the third major version of iTerm2 has been released. <a href="/version3.html">Read the full announcement here.</a>

Get it from <a href="/downloads.html">the Downloads page</a> in the "Stable Releases" section.

#### iTerm2 2.0 Released
<i>Sunnyvale, CA&mdash;July 14, 2014</i>

After three years of development, the second major version of iTerm2 has been released. It adds dozens of new features, countless bug fixes, and smells April fresh. Here are just a few of the new features you'll find:
 
  * Deep tmux integration. iTerm2 can speak directly to tmux and display its virtual windows as native windows or tabs, making tmux much easier to navigate.

  * A <i>toolbelt</i> has been added. The toolbelt a drawer that opens to the right of a window and shows running jobs, paste history, a field for taking notes, and facilitates opening new sessions.

  * iTerm2 now supports <i>triggers</i>. A trigger defines an action that is performed when text matching a regular expression is received. For example, it can highlight errors in red, bounce the dock icon when a build finishes, or respond to prompts for you automatically.

  * Literally dozens of new preferences let you customize every aspect of your terminal.

  * New proprietary escape sequences integrate terminal apps, allowing you to change a session's profile automatically, manipulate the pasteboard remotely, bounce the dock icon, and much more.

For a full list of changes, please see the <a href="/appcasts/full_changes.txt">change log</a>. Downloads are available at <a href="/downloads.html">the Downloads page</a>.

