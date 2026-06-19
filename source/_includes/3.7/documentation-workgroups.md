A Workgroup defines how to build a constellation of related sessions from a single one. When a session *enters* a Workgroup, iTerm2 constructs that constellation: it creates the related sessions, each with its own command and toolbar, and you can move between them with a keystroke. Some sessions can have special roles, such as showing diffs in a git repo. When the session *exits* the Workgroup, iTerm2 terminates those created sessions and leaves the original (main) session running on its own.

Workgroups save you from manually splitting panes and opening tabs every time you start a task: you define the layout once, then enter it on demand (or automatically, with a trigger).

A good example is the Claude Code Workgroup the [Claude Code integration](claude-code-integration.html) installs: a main session for your conversation, a Peer that shows a live diff of your changes, and a Peer for code review, all sharing one toolbar.

## How a Workgroup is Built

Every Workgroup has one **main session**, which is the session you are in when you enter the Workgroup. You can add any number of related sessions of three kinds:

#### Peers
Peers are multiple sessions that share a single pane, as though they were tabs within that pane. Only one Peer is visible at a time, and you switch among them in place, instantly and without disturbing their scrollback. The main session and its Peers occupy the same pane and share one toolbar with a row of buttons for switching among them. Peers are the heart of the feature: in the Claude Code Workgroup, the conversation, the diff, and the code-review sessions are all Peers in one pane. Each Peer has a name, which labels its button.

#### Splits
A split is an independent pane that sits alongside its parent. You choose its orientation (vertical or horizontal), which side it goes on, and how much of the parent's area it takes.

#### Tabs
A tab is a new tab that opens when you enter the Workgroup. Like splits, each tab is an independent session with its own toolbar.

## Entering and Leaving a Workgroup

To enter a Workgroup by hand, choose it from **Shell > Workgroups**. Entering spawns the Workgroup's Peers, splits, and tabs and wires up the toolbars. The session you were in becomes the main session.

To leave, select **Shell > Workgroups > Exit Workgroup**. This closes the sessions the Workgroup created and returns the main session to its normal toolbar. The main session itself keeps running.

You can also enter and exit automatically using triggers (see [Automatic Entry with Triggers](#automatic-entry-with-triggers) below).

## Switching Between Peers

When a Workgroup has Peers, its toolbar shows a Peer switcher: a row of buttons, one per Peer. Click a Peer's button to switch to it, or use the keyboard:

- `⌥⇧⌘1` through `⌥⇧⌘8` activate the first eight Peers (`⌥⇧⌘9` activates the last Peer when there are nine or more).
- **Shell > Workgroups > Previous Peer** (`⌥⌘[`) and **Next Peer** (`⌥⌘]`) step through the Peers in order.

Each Peer can also define its own custom shortcut in place of the default.

## Toolbars

A defining feature of Workgroups is that every session in one, the main session and its Peers, splits, and tabs alike, has its own toolbar, and that toolbar can hold tools specific to that session's purpose. In a Diff session, for example, the toolbar lets you set the git base and pick a file to diff. You build each session's toolbar from these items:

#### Peer switcher
The row of buttons, one per Peer, for switching between them. It only appears on Peer toolbars.

#### Git status
Shows the working directory's current git status and updates it live.

#### Changed-file selector
A popup of the files that have changed. Picking one runs that session's per-file command, for example to show the diff of just that file.

#### Git-base selector
Chooses the git revision to diff against. It defaults to `HEAD`, and commands can read the chosen value as the `gitBase` variable.

#### Navigation and reload
Back, forward, and reload buttons for stepping through the changed-file list, plus a standalone reload button. Each has an optional keyboard shortcut.

#### Spacer
Flexible whitespace for arranging the other items.

A session's toolbar always shows its name automatically.

## Session Modes

Each session in a Workgroup runs in one of three modes:

#### Regular
Runs its command immediately when you enter the Workgroup. This is the default.

#### Diff
Waits until there are pending changes in the working directory before running its command. This avoids launching a diff tool against a clean tree. As soon as changes appear, the command runs.

#### Code Review
Shows a prompt overlay before the command runs. You type a free-form instruction (or pick a saved one from the Prompts menu) and click **Start**. iTerm2 exposes the text you enter to the command as the `codeReviewPrompt` variable, so the session can pass it to whatever program it launches. The Claude Code Workgroup uses this mode to hand your review request to Claude.

A Code Review session can also add items to the [Clippings](documentation-clippings.html) panel, which every session in the Workgroup shares. This is how you pass comments from the review to a coding-assistant session: the review adds its findings as Clippings, and the other sessions in the Workgroup see the same panel.

## Configuring Workgroups

Open **Settings > Arrangements > Workgroups**. The left side lists your Workgroups; use `+` and `-` to add or remove them, and the **Add Preset** popup to start from a built-in template (see below).

Select a Workgroup to edit it on the right. A Workgroup has a name and a tree of sessions. Select a session in the tree to set its:

- **Profile**: which iTerm2 profile the session uses.
- **Mode**: Regular, Diff, or Code Review.
- **Command**: the command to run (for terminal sessions), or a starting **URL** for browser sessions.
- **File command**: the command that runs when you pick a file in the changed-file selector. It can interpolate the picked file and the git base. This setting appears only when the session's toolbar includes the changed-file selector.
- **Name** and **Shortcut** (Peers only): the label that appears on the Peer's switch button and an optional custom keyboard shortcut.
- For splits: **orientation**, **side**, and the fraction of the parent the split occupies.

Workgroups you create from a preset are ordinary, fully editable settings; the presets are just starting points.

## Presets

Two built-in presets appear in the **Add Preset** popup:

- **Coding Agent + Diff**: a main session plus a Diff Peer that shows `git diff` of your changes and lets you drill into individual files.
- **Coding Agent + Diff + Code Review**: the same, plus a Code Review Peer that prompts you for a review request and runs a coding agent against it.

## Variables

Commands and file commands support iTerm2's variable interpolation with the `\(name)` syntax. The variables most useful in Workgroups are:

- `\(gitBase)`: the revision you choose in the git-base selector (default `HEAD`).
- `\(file)`: the file you pick in the changed-file selector, for use in a session's file command.
- `\(codeReviewPrompt)`: the text you enter in a Code Review session's prompt overlay.

iTerm2 shell-escapes file and git-base values before substitution, so names with spaces or special characters are safe.

## Automatic Entry with Triggers

Two triggers let a Workgroup come and go on its own:

- **Enter Workgroup** enters a Workgroup you choose when its condition matches.
- **Exit Workgroup** leaves the current Workgroup.

In terminal profiles these can fire on matching output or on session events such as a job starting or ending. That is how the Claude Code integration auto-enters its Workgroup: an Enter Workgroup trigger fires when the `claude` job starts, and an Exit Workgroup trigger fires when it ends. Both triggers also work on browser profiles, where they fire on a URL that matches a regular expression. Re-entering a Workgroup you are already in does nothing, so the triggers are safe to fire repeatedly.

For a concrete, ready-made example of Workgroups in action, see the [Claude Code integration](claude-code-integration.html).
