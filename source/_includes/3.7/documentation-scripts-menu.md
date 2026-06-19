If you have scripts located in `$HOME/Library/Application Support/iTerm2/Scripts` they'll be added to this menu.

For backward compatibility, `$HOME/Library/Application Support/iTerm/Scripts` will be used if `$HOME/Library/Application Support/iTerm2/Scripts` does not exist.

#### Scripts > Manage > New Python Script
Opens a UI to help you create a new Python API script. See the [Python API](https://iterm2.com/python-api) for more information.

#### Scripts > Manage > Open Python REPL
Opens a window with a Python REPL to facilitate working with the Python API.

#### Scripts > Manage > Manage Dependencies
Opens a window that lets you adjust dependencies of Python API scripts. This is meant for people authoring a script who need to bring in a new PyPI dependency.

#### Scripts > Manage > Check for Updated Runtime
Checks to see if a new version of the Python API Runtime is available.

#### Scripts > Manage > Reveal Scripts in Finder
Opens a Finder window in the Scripts folder.

#### Scripts > Manage > Import
Opens a file picker so you can pick a script file to import. It should have the extension `.its`.

#### Scripts > Manage > Export
Opens a file picker so you can pick a script file to export. This is used for sharing scripts with others. The export file will have the extension `.its`.

#### Scripts > Manage > Console
Opens the Script Console which shows which scripts are running, lets you view their logs, and has other developer tools for authors of Python API scripts. If you are using browser profiles then Javascript logs appear here as well.
