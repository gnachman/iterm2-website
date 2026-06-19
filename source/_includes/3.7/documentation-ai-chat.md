AI Chat offers a chat window with a large language model that can optionally interact with iTerm2's windows.

When you create a new chat by selecting **Window > AI Chat** or clicking the `+` in the AI Chat window, the AI agent is not offered any visibility into iTerm2's windows.

## Linked Sessions

You may link a session to a chat. This may give the AI information about the contents of your windows depending on which permissions are enabled.

To view permissions, click the info button in the chat toolbar. Any permission with a check mark is granted. Any permission with a dash is "ask before using". Permissions with neither mean "always deny" and the AI agent will not be offered functions related to those categories.

Selecting an item in the info menu rotates the permission setting to the next value. The order is Never -> Ask -> Always -> Never.

The permission categories are:

#### Check Terminal State
This exposes information about the linked terminal to AI, including the current directory, user shell, the current or last command and its exit status, the size of the terminal window, the host you are SSHed to (if any), and the current username.

#### Run Commands
This makes functions available to AI that let it execute commands on your behalf.

#### Type for You
This makes functions available to AI that let it send keystrokes to the terminal.

#### View History
This exposes your command history in the linked session to AI

#### View Manpages
This lets AI view manpages. If you are using ssh integration, man pages from the remote host may be viewed by it.

#### Write to Clipboard
This makes functions available to AI that let it write to the clipboard.

#### Write to filesystem
This makes functions available to AI that let it write to the filesystem.

#### Act in Web Browser
This makes functions available to AI that let it view the contents of the current web page (applicable only in browser profiles).

### Send Commands and Output Automatically

When enabled, terminal contents are automatically sent to AI. This can be useful when you need a lot of help completing a task. Consider also the Codecierge tool in the Toolbelt, which is intended specifically for completing multi-step tasks.

## Explain Output

When you select **Edit > Explain Output with AI** then a new chat is created and the session is automatically linked. The terminal contents may be annotated with explanations.

## Toolbar

The AI Chat window's toolbar shows different icons depending on the capabilities of the current model.

When **Settings > General > AI > Always use the recommended model from: ...** is enabled you will get a model selector in the toolbar.

A globe icon allows you to grant web search permission.

If the selected model supports reasoning then a lightbulb icon in the toolbar allows you to enable reasoning mode. This is generally pretty slow.

## Context Menu

You can right-click on a message that you sent to edit, copy, or fork the conversation. Edit is destructive and well erase messages below that point. Fork creates a new chat with messages prior to the clicked-on message.

## Prompts

You can edit the prompts in **Settings > General > AI > Prompts**. You'll see that there are different prompts depending on what kind of access the agent has to the window contents.

