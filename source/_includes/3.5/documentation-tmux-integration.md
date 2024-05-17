iTerm2 is integrated with tmux, allowing you to enjoy a native user interface with all the benefits of tmux's persistence.

### Introduction

Normally, when you use tmux, multiple virtual windows are displayed in a single "physical" window. You can manipulate the environment by issuing commands to tmux. This poses a few problems:

  * Some keystroke must be dedicated to tmux to enter its command mode (&#94;B, by default, which means moving the cursor to the left in emacs or an interactive shell becomes more difficult).
  * You have to ssh to the remote host more than once to get more than one view of your tmux session's window.
  * You have to learn tmux commands.
  * To adjust split panes, you have to enable mouse reporting, even if you don't want it otherwise.
  * Some built-in features of your terminal emulator don't work as well as they would if you weren't using tmux: for instance, you can't access tmux's scrollback history as easily or quickly as you can in a normal terminal window. Also, tmux's find feature isn't as good as iTerm2's.

For many users, a terminal multiplexer would be a great way to work, but they don't want to accept the drawbacks.

iTerm2's tmux integration solves these problems.

When you run "tmux -CC", a new tmux session is created. An iTerm2 window opens and it acts like a normal iTerm2 window. The difference is that when iTerm2 quits or the ssh session is lost, tmux keeps running. You can return to the host you were ssh'ed into and run "tmux -CC attach" and the iTerm2 windows will reopen in the same state they were in before. A few use cases come to mind:

For users who do most of their work in ssh:

  * Restore the environment you had at work when you get home.
  * No more anxiety about letting System Update reboot!

For everyone:

  * Collaborate with another user by having two people attach to the same tmux session.

### Usage

You should be able to use tmux as always. Just add the -CC argument to its invocation. In practice, this means running one of these commands:

  * tmux -CC
  * tmux -CC attach

When you run tmux -CC, what you'll see on that terminal is a menu:

<pre>
** tmux mode started **

Command Menu
----------------------------
esc    Detach cleanly.
  X    Force-quit tmux mode.
  L    Toggle logging.
  C    Run tmux command.
</pre>

  * If you press esc, the tmux windows will close and the tmux client will exit.
  * If you press esc and nothing happens, then the tmux client may have crashed or something else has gone wrong. Press "X" to force iTerm2 to exit tmux mode. You may need to run "stty sane" to restore your terminal's state if the tmux client did crash.
  * If you want to report a bug, press L and reproduce the issue. The tmux protocol commands will be written to the screen.
  * If you want to run a tmux command that isn't available through the menus, you can press C. A dialog box opens and you can enter a command. For example, "new-window".

In general, you don't need to run commands to perform the most common actions. The following iTerm2 actions affect tmux:

  * Close a session, tab, or window: Kills the tmux session or window.
  * Split a pane: Splits the tmux window using the split-window command.
  * Resize a split pane: Resizes tmux split panes using the resize-pane command.
  * Resize a window: Tells tmux that the client size has changed, causing all windows to resize. Windows are never larger than the smallest attached client. A gray area on the right or bottom of a window indicates that a physical window is larger than the maximum allowed tmux window size. One consequence of this rule is that all tmux windows/tabs will contain the same number of rows and columns.
  * Create a window or tab using the Shell->tmux menu: Creates a new tmux window.
  * Detach using Shell->tmux->Detach: Detaches from the tmux session. All tmux windows are closed. You can get them back with tmux -CC attach.

### Limitations

There are a few limitations of tmux integration which are related to the design of tmux.

  * A tab with a tmux window may not contain non-tmux split panes.
  * A tab with split panes may have "empty" areas. This is because tmux wants every tmux window to be the same size, but our split pane dividers are not exactly one cell by one cell in size.

### Configuration

Check *Settings > General > tmux* for configuration settings. You can also adjust whether to open the tmux Dashboard when connecting to a session with a large number of windows. You can open the tmux Dashboard by selecting the menu item *Shell > tmux > Dashboard*.

See also the tmux section of <a href="documentation-preferences-general.html">General Settings</a>.

### Best Practices

For practical tips on how to configure iTerm2 for use with tmux integration in the real world, please
see <a href="https://gitlab.com/gnachman/iterm2/wikis/tmux-Integration-Best-Practices">tmux Integration Best Practices</a>.
