iTerm2 features Applescript support which allows you to automate many aspects of its behavior. Quite a bit of customization is also possible by writing shell scripts.
### Applescript
iTerm2 has sophisticated Applescript support allowing one to write stand-alone scripts to launch the application and open multiple sessions with profiles into either new tabs or new windows. You can also set some other parameters for a session such as foreground and background colors, and transparency.

Sample scripts may be found at the <a href="https://gitlab.com/gnachman/iterm2/wikis/Applescript">iTerm2 Applescript Examples</a> page.

These scripts can then be saved as stand-alone executable applications.

#### Autolaunching Scripts
iTerm2 also supports autolaunching of an Applescript on startup. On startup, iTerm2 looks for an Applescript file in "~/Library/Application Support/iTerm/AutoLaunch.scpt". If it is found, the "AutoLaunch.scpt" script is launched and executed.

#### User-Defined Scripts
iTerm2 also supports launching of user defined scripts from the "Scripts" menu. The scripts need to be stored under the ~/Library/Application Support/iTerm/Scripts directory. You can create this directory if it does not already exist. iTerm2 checks this directory on startup. Scripts must be named with the extension .scpt or .app.
