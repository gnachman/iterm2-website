A session can report a *status*: a short bit of state that iTerm2 surfaces on the session's tab as a custom subtitle, a colored dot indicator, and a subtitle color. Status lets you see at a glance which of your sessions is working, which is waiting for you, and which is idle, without switching to each one.

Status is most useful when you run many long-lived sessions at once, such as several coding agents. The [Claude Code integration](claude-code-integration.html) uses Session Status to show, tab by tab, whether Claude is thinking, waiting for your input, or done.

## Setting a Session's Status

There are three ways to set a session's status. Each one can set the status text, the dot color, and the subtitle text color independently, and clearing a field removes just that piece.

#### Control Sequence

A program running in a session can set its own status with the `OSC 21337` control sequence. The payload is a list of `key=value` pairs separated by semicolons:

    OSC 21337 ; status=[text] ; indicator=[color] ; status-color=[color] ; detail=[text] ST

The keys are:

- `status`: the subtitle text (for example, `Working` or `Waiting`).
- `indicator`: the color of the dot shown on the tab.
- `status-color`: the color of the subtitle text.
- `detail`: optional extra text shown alongside the status in the [Session Status tool](#the-session-status-tool) and the Cockpit.

Colors use xterm's format: either `#RRGGBB` or `rgb:RR/GG/BB`. Set any key to an empty value to clear it, and unknown keys are ignored. For example, to mark a session as working with an orange dot:

    printf '\e]21337;status=Working;indicator=#ffa500\a'

And to clear everything:

    printf '\e]21337;status=;indicator=;status-color=\a'

See [Proprietary Escape Codes](documentation-escape-codes.html) for the conventions used above.

#### The it2 Command Line

The [`it2`](documentation-utilities.html) command-line tool sets the status of any session from a script:

    it2 session set-status --session [id] --status Working --dot-color '#ffa500'

The options are `--status` (the status text, such as `idle`, `working`, or `waiting`), `--dot-color` and `--text-color` (each a `#rrggbb` value), and `--detail` (optional detail text). Pass an empty value to clear a field.

#### The Set Tab Status Trigger

A [trigger](documentation-triggers.html) can set the status when a session's output matches a regular expression. Add a **Set Tab Status** trigger in **Settings > Profiles > Advanced > Triggers**. It gives you a combo box for the status text (with `Working`, `Waiting`, and `Idle` as suggestions) plus two color wells, one for the dot color and one for the subtitle text color. This is handy for programs that don't set status themselves: match their output and label the tab automatically.

## The Session Status Tool

The Session Status tool shows the status of every session in a window in one place. Add it with **View > Toolbelt > Session Status** (open the toolbelt first with **View > Toggle Toolbelt** if it isn't showing). Each row lists a session's name, its colored dot, its status text, and a keyboard shortcut that jumps to that session. Click a row to reveal the session it names. Rows are sorted by priority, so the sessions that need attention rise to the top; the default order is waiting, then working, then idle.

The tool's gear button opens a settings popover with:

- **Show status in tab subtitle**: turn this off to hide the status text on tabs while keeping the colored dot.
- **Merge workgroup statuses**: collapse every session in a [Workgroup](documentation-workgroups.html) to a single representative row.
- A priority list you can edit to control which status keywords sort highest.

Right-click a row and choose **Snooze** to move it below a divider at the bottom of the list and dim it. A snoozed session automatically un-snoozes the next time its status changes, so you can quiet a session you're done with and still be shown when something new happens.

The bell button at the bottom of the tool arms notify-on-status-change. With a row selected it watches that session; with nothing selected it watches the whole window. The next time the target's status changes, iTerm2 shows an alert and disarms the bell.

## Notify on Status Change

**Window > Notify on Status Change** (`⇧⌘X`) arms an alert for the current window. The next time any session in the window changes its status, iTerm2 shows a notification. The alert has a **Reveal** button that jumps straight to the session that changed. This is the menu-driven equivalent of the Session Status tool's bell, and the two stay in sync.

## The Cockpit

The Cockpit is a floating panel that shows session status across every window at once, not just the front one. Open it with **Window > Cockpit** (`⌥⌘C`). It floats above your terminal windows while iTerm2 is active and gets out of the way when you switch to another app.

The Cockpit organizes its list three ways, selectable from the toolbar:

- **Status**: grouped by window, then by state (Waiting, Working, Idle).
- **Window**: grouped by window, then by tab and split pane.
- **Workgroup**: only sessions that belong to a Workgroup, grouped by Workgroup.

A search field filters the list to sessions whose name matches what you type, keeping the grouping you chose. Click any row to jump to that session, tab, window, or Workgroup. The bell in the toolbar arms notify-on-status-change for the selected row, per window or per session, and armed rows show a bell so you can see at a glance what you're watching.
