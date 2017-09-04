#### Shell > New Window/Tab
This creates a new window or tab with the default profile. If the current session is a tmux integration session, then you will be prompted for whether to create a local or tmux session.

#### Shell > New Tab with Current Profile
This creates a new tab using the same profile as the current session rather than the default profile.

#### Shell > Duplicate Tab
Creates another tab with the same arrangement of split panes, profile, etc.

#### Shell > Split Vertically/Horizontally
These menu items allow you to divide a tab into two or more split panes. The panes can be adjusted by dragging the line that divides them. They will use the default profile.

#### Shell > Split Vertically/Horizontally with Current Profile
These menu items allow you to divide a tab into two or more split panes. The panes can be adjusted by dragging the line that divides them. They will use the profile of the current session.

#### Shell > Save Selected Text
Saves the selected text to a file.

#### Shell > Close
Terminates the current session.

#### Shell > Close Terminal Window
Terminates all sessions in the current window.

#### Shell > Close All Panes in Tab
Terminates all sessions in the current tab.

#### Shell > Broadcast Input > ...
These options allow you to send keyboard input to more than one session. Be careful.

  * **Send input to current session only**: The default setting.
  * **Broadcast to all panes in all tabs**: Anything you type on the keyboard goes to all sessions in this window.
  * **Broadcast to all panes in current tab**: Anything you type on the keyboard goes to all sessions in this tab.
  * **Toggle broadcast input to current session**: Toggles whether this session receives broadcasted keystrokes within this window.
  * **Show Background Pattern Indicator**: If selected, sessions receiving broadcast input get an obnoxious red-stripe background.

#### Shell > tmux > ...
These commands let you interact with the tmux integration

  * **Detach**: Detaches from the tmux session associated with the current pane. It remains running in the tmux server.
  * **New tmux Window/Tab**: Creates a new tmux window, which appears in either a native window or tab, as requested.
  8 **Dashboard**: The tmux dashboard is a view that lets you see all your tmux sessions and windows at a glance, adjust which are visible, rename them, and change the current tmux session.

