AI Chat offers a chat window with a large language model that can optionally interact with iTerm2's windows.

You create a new chat by selecting **Session > Open AI Chat** or clicking the `+` in the AI Chat window. A plain chat has no visibility into your terminal at all: it is simply a conversation with the model. You can also create chats that reach into iTerm2. A chat may be linked to a single terminal or web browser session, or it may be an *orchestration* chat that can see all of your sessions and operate iTerm2 on your behalf. What a chat is allowed to see and do is always governed by the permissions described below.

## Kinds of Chats

Every chat is one of three kinds:

- **Unlinked.** A private conversation with the model. It has no access to any of your sessions.
- **Linked to a session.** The chat is bound to one terminal session, or to one web browser session (which gets a browser-appropriate system prompt). The permissions below govern what it may see and do in that session.
- **Orchestration.** The chat can see all of your sessions and operate iTerm2 for you. See [Orchestration Chats](#orchestration-chats) below.

You choose the kind when you create a chat, and you can change it afterward from the info button menu in the chat toolbar. When you open a chat from a session, iTerm2 offers to **Link** the chat to that session or to **Enable Orchestration**. The info menu offers **Link Terminal Session** / **Link Browser Session**, **Enable Orchestration**, and the matching unlink and **Disable Orchestration** items. A single chat may be linked to a terminal session and a browser session at the same time.

## Linked Sessions

You may link a session to a chat. This may give the AI information about the contents of your windows depending on which permissions are enabled.

To view permissions, click the info button in the chat toolbar. Any permission with a check mark is granted. Any permission with a dash is "ask before using". Permissions with neither mean "always deny" and the AI agent will not be offered functions related to those categories.

Selecting an item in the info menu rotates the permission setting to the next value. The order is Never -> Ask -> Always -> Never.

The permission categories are:

#### Check Terminal State
This exposes information about the linked terminal to AI, including the current directory, user shell, the current or last command and its exit status, the size of the terminal window, the host you are SSHed to (if any), and the current username.

#### Run Commands
This makes functions available to AI that let it execute commands on your behalf.

#### View Contents
This exposes the contents of the linked session to AI: your command history, the output of an earlier command, the partially typed command line, and the visible screen. When this is set to Always Allow, the terminal's visible screen is attached to every message you send in this chat (not only your command history). The history tools remain available on request so the AI can reach content that has scrolled off screen.

#### Control Terminal
This makes functions available to AI that let it send keystrokes to the terminal, erase the current command line, and restart the session.

#### View Manpages
This lets AI view manpages. If you are using ssh integration, man pages from the remote host may be viewed by it.

#### Write to the Clipboard
This makes functions available to AI that let it write to the clipboard.

#### Write to the File System
This makes functions available to AI that let it write to the filesystem.

#### Act in Web Browser
This makes functions available to AI that let it view the contents of the current web page (applicable only in browser profiles).

### Sending Contents Automatically

Check Terminal State and View Contents can send their information to AI automatically. When you set either one to Always Allow, iTerm2 offers to send that data (the terminal's state, or its visible screen) with every message you send in this chat. This can be useful when you need a lot of help completing a task. Consider also the Codecierge tool in the Toolbelt, which is intended specifically for completing multi-step tasks.

## Watches

A chat that is linked to a session can watch that session for you instead of polling it. Ask the AI to tell you when the session reaches some state. You can describe it as a specific condition ("when the build finishes") or as any plain-English situation the AI can recognize by reading the screen ("when emacs has exited and a shell prompt is showing"). The watch returns immediately and fires later, when the AI, reading the session's screen in the background, decides the condition has been met. If you have paired your phone with iTerm2's companion app, a watch can push a notification to it when it fires, so you learn about it even when you are away from your Mac.

## Inline Chat

A chat that is linked to a terminal or browser session can be hosted inline, in a panel along the right margin of that session, instead of in the separate AI Chat window. Toggle the inline panel with **View > Show Inline Chat**. From a chat in the AI Chat window, the info menu's **Put Chat in Linked Terminal Session** or **Put Chat in Linked Browser Session** moves the chat into its linked session's inline panel.

## Orchestration Chats

An orchestration chat is not tied to a single session: it can see all of your sessions and workgroups and can operate iTerm2 for you. By default it may read the contents of any session, but it must ask permission before typing into one.

To give an orchestration chat standing permission to control a particular session or workgroup, @-mention it in your message. Mentioning a target pre-approves it, so the AI can act there without prompting you each time. Each grant appears as a message with a **Revoke** button that returns that target to asking first. An orchestration chat can also start new sessions; opening a new session always asks for your approval.

## Explain Output

When you select **Edit > Explain Output with AI** then a new chat is created and the session is automatically linked. The terminal contents may be annotated with explanations.

## Toolbar

The AI Chat window's toolbar shows different icons depending on the capabilities of the current model.

New chats let you pick their provider and model from the toolbar. Once a chat has started the picker locks (see [Models and Providers](#models-and-providers) below).

A globe icon allows you to grant web search permission.

If the selected model supports reasoning then a lightbulb icon in the toolbar allows you to enable reasoning mode. This is generally pretty slow.

## Models and Providers

AI settings live in **Settings > General > AI**. The provider and model you choose there are the defaults for *new* chats only. Once a chat has started it is pinned to its provider for the rest of its life: you may switch to another model from the same provider, but not to a different provider. To use a different provider, start a new chat.

You can define your own models in the manual model editor. It includes presets for common OpenAI-compatible providers (Ollama, OpenRouter, z.ai, Qwen, and MiniMax) that fill in the endpoint URL for you. You can also set custom HTTP headers, use the **Test Connection** button to check that a model works, and set the **Supports temperature** and **Configurable thinking** checkboxes to match the model's capabilities. AI chat can connect to models hosted on your LAN over plain HTTP, not only HTTPS.

You can keep several manual models and mark one as the **economy** model (the leaf icon). iTerm2 uses the economy model for cheap, frequent background jobs such as command-safety checks and screen-idle detection, so those do not run up costs on your main model. If you use on-device Apple Intelligence for command-safety checks, those run on Apple Intelligence instead.

## Zero Data Retention

If your OpenAI organization has Zero Data Retention enabled, turn on **Settings > General > AI > Enable "zero data retention"**. Such organizations cannot have responses retained server-side, so iTerm2 sends the whole conversation with each message rather than referencing a previous response.

## Context Menu

You can right-click on a message that you sent to edit, copy, or fork the conversation. Edit is destructive and well erase messages below that point. Fork creates a new chat with messages prior to the clicked-on message.

## Prompts

You can edit the prompts in **Settings > General > AI > Prompts**. You'll see that there are different prompts depending on what kind of access the agent has to the window contents: an unlinked chat, a read-only or read-write terminal, a linked browser, and an orchestration chat each have their own.
