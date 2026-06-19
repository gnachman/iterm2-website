Clippings are a panel of saved text snippets you can send to the terminal or copy to the clipboard. Each Clipping has a title and a body, and the body can use Markdown. The panel is handy for collecting things you want to reuse or hand off, such as commands, notes, or review comments.

## Showing the Panel

Toggle the Clippings panel with **View > Show Clippings** (`⇧⌘=`). It appears on the right side of the window. Drag its left edge to make it wider or narrower; iTerm2 remembers the width per machine.

## Adding, Sending, and Copying

Click the **+** button to open the New Clipping dialog, give the Clipping a title and a body, and click **Add**. To remove one, select it and click **−** (or press Delete).

Select one or more Clippings and use the panel's buttons to send them to the terminal or copy them to the clipboard. When a Clipping has a title, iTerm2 formats the title as a bold Markdown heading above the body. When you send or copy several at once, iTerm2 joins them with the **Clipping Separator**, an advanced setting that defaults to a line of two dashes. (You can change it in **Settings > Advanced**; search for "Clipping Separator.")

## History

The archive button snapshots the current list and clears it, which gives you a fresh list while keeping the old one. The back and forward buttons walk through your archived snapshots, and a counter shows where you are in the history. From a script you can archive with the `it2 archive-clippings` command or the `iterm2.archive_clippings` API call, and add Clippings with `iterm2.add_clipping`.

## Clippings in Workgroups

Every session in a [Workgroup](documentation-workgroups.html) shares one Clippings panel. iTerm2 routes each session's Clippings to the Workgroup's main session, so all of its sessions see the same list. This is what lets a Code Review session hand its findings to a coding-assistant session: the review adds Clippings, and the agent's session sees them in the same panel.
