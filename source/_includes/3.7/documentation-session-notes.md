A Session Note is a floating, resizable panel of freeform text attached to a session. Use it to jot down anything you want to keep alongside the terminal, such as a reminder, a snippet of output, or a running to-do list. The note floats above the terminal content and stays with the session.

## Showing a Session Note

Select **View > Show Session Note** (`⌥⌘G`) to show the note for the current session and put the keyboard focus in it. If the note is collapsed, this expands it first. The menu item shows a checkmark while the note is visible; selecting it again hides the note.

Each session has its own single note. A new note starts near the top-right corner of the session, out of the way of the prompt.

## Editing

The note holds plain, multiline text. It has its own undo stack, and it uses the session's font, so it tracks changes to the font. Pasted content is inserted as plain text, and automatic substitutions such as smart quotes, dash replacement, and link detection are turned off so the text stays exactly as you type it. When the content is taller than the note, a scroller appears. Press Escape to move focus out of the note and back to the terminal.

A note with no text is not kept: if you leave an empty note, iTerm2 removes it.

## Moving, Resizing, and Collapsing

Drag the title bar to move the note anywhere within the session. Drag any edge or corner to resize it. The note is constrained to stay inside the session's bounds.

Click the chevron button in the title bar to collapse the note down to just its title bar, or press **Shift-Return** while editing. When collapsed, the title bar shows the first line of the note instead of the label "Session Note," and you can still drag it and resize it horizontally. Click the chevron again to expand it.

## When the Session Resizes

The note keeps its distance from the top-right corner of the session rather than the bottom-left. When you resize the window or split pane, the note moves along with that corner so it stays in the same relative spot near the top-right. If the session becomes smaller than the note, the note is clamped to fit.

## Persistence

A note that has text is saved with the session, so it survives restarts and is stored in [saved arrangements](documentation-preferences-arrangements.html). Its text, size and position, and collapsed state are all preserved. An empty note is not saved.
