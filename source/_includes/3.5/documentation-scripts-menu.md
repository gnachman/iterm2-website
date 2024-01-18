If you have scripts located in `$HOME/Library/Application Support/iTerm2/Scripts` they'll be added to this menu.

Scripts in the `AutoLaunch` folder will be run when iTerm2 starts.

## Python Scripts

The *Manage* submenu contains items to help you create and maintain Python scripts that use iTerm2's <a href="/python-api">Python API</a>.

## New Python Script

Use this to create a new script. See the <a href="/python-api/tutorial/index.html">Python API Tutorial</a> for details on how to use it.

## Open Python REPL

Creates a window with a Python read-eval-print loop (REPL). This is meant for experimenting with iTerm2's Python API. You may be asked to download and install the Python Runtime before this window will open. See the <a href="/python-api/tutorial/running.html#repl">REPL</a> section of the tutorial for details.

## Manage Dependencies

This opens a window that lets you modify the dependencies and Python version of scripts using iTerm2's Python API. You can add or remove dependencies using pip3 through this UI, which is recommended because each script may have its own copy of the Python environment it uses.

## Check for Updated Runtime

Checks if a new version of the Python Runtime is available. It may contain bug fixes or new APIs.

## Reveal Scripts in Finder

Shows the `Scripts` folder in Finder.

## Import...

Allows you to choose an exported script (with the `its` extension) to install.

## Export...

Allows you to export an existing script as an `its` file, suitable for sharing. If you have a code signing certificate and private key, you can opt to sign your exported script. Signed scripts are easier to install.

## Console

The console shows the running scripts, their logs, and the history of communication between the script and iTerm2. It also offers access to the Inspector, which lets you view <a href="documentation-variables.html">variables</a> in the various sessions, tabs, and windows. It also reveals registered functions. Both the console and the inspector are intended to be used as debugging tools for people working with scripts using iTerm2's Python API.

