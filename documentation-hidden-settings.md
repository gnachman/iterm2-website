---
layout: subdoc
title: Hidden Settings - Documentation - iTerm2 - Mac OS Terminal Replacement
active-state: documentation
subhead: Hidden Settings
---
There are a few settings that you cannot access via iTerm2's own Preferences panel. However, you can use the "defaults" command to change them. To change a hidden setting, quit iTerm2. In terminal, run the defaults command. Then restart iTerm2.

To change the number of entries in the autocomplete menu:

    defaults write com.googlecode.iterm2 AutocompleteMaxOptions -int 10

To change the number of coprocess commands remembered:

    defaults write com.googlecode.iterm2 "Coprocess MRU" -int 10

To preserve whitespace in selections copied to the pasteboard:

    defaults write com.googlecode.iterm2 TrimWhitespaceOnCopy -bool false

When you open a file from the finder in iTerm2 (e.g., by double-clicking a shell script), it will either open in a window or a tab. By default, it opens in a tab. You can change this with:

    defaults write com.googlecode.iterm2 OpenFileInNewWindows -bool true

You can configure iTerm2 to quit when the last session is closed, and you can also configure sessions to close automatically when they end. If something is broken (like a bad command set in the default profile), it's possible for a session to start and end almost immediately, causing iTerm2 to quit very soon after launch and not giving you time to fix the problem. To prevent this issue, there is a 10-second safety valve during which iTerm2 won't quit automatically when the last session is closed. To change the time of this safety valve:

    defaults write com.googlecode.iterm2 MinRunningTime -float 10.0

When an external monitor is connected, sometimes it needs a few seconds to be recognized by the system. If iTerm2 isn't handling this well, you can increase the delay before it attempts to reconfigure itself after a change of monitors.

    defaults write com.googlecode.iterm2 UpdateScreenParamsDelay -float 1.0

To change the number of paste history entries saved:

    defaults write com.googlecode.iterm2 MaxPasteHistoryEntries -int 20

Pastes (both regular and slow) are done by splitting the text to paste into chunks. There is a delay between the transmission of each chunk. To change the speed that "paste" pastes at:

    defaults write com.googlecode.iterm2 QuickPasteBytesPerCall -int 1024
    defaults write com.googlecode.iterm2 QuickPasteDelayBetweenCalls -float 0.01

To change the speed that "paste slowly" pastes at:

    defaults write com.googlecode.iterm2 SlowPasteBytesPerCall -int 16 
    defaults write com.googlecode.iterm2 SlowPasteDelayBetweenCalls -float 0.125

To disable using the pinch gesture to change font size:

    defaults write com.googlecode.iterm2 PinchToChangeFontSizeDisabled -bool true

To keep LC_CTYPE from being set when locale environment variables are set:

    defaults write com.googlecode.iterm2 DoNotSetCtype -bool true

To allow Growl notifications to be posted for the current tab:

    defaults write com.googlecode.iterm2 GrowlOnForegroundTabs -bool true

To tune smart cursor color settings:

    defaults write com.googlecode.iterm2.plist SmartCursorColorBgThreshold -float 0.5 
    defaults write com.googlecode.iterm2.plist SmartCursorColorFgThreshold -float 0.75

SmartCursorColorBgThreshold: If the cursor's background color is too close to nearby background colors, force it to the "most different" color. This is the difference threshold that triggers that change. 0 means always trigger, 1 means never trigger.

SmartCursorColorFgThreshold: The cursor's text is forced to black or white if it is too similar to the background. If the brightness difference is below a threshold then the B/W text mode is triggered. 0 means always trigger, 1 means never trigger.

To allow a three-finger tap to act like a three-finger click:

    defaults write com.googlecode.iterm2.plist ThreeFingerTapEmulatesThreeFingerClick \
    -bool true

To change the set of characters that are considered part of a URL (besides alphanumerics):

    defaults write com.googlecode.iterm2.plist URLCharacterSet -string \
    ".?\\/:;%=&_-,+~#@!*'()|[]"

To use some experimental optimizations that will improve performance (safety not guaranteed):

    defaults write com.googlecode.iterm2.plist ExperimentalOptimizationsEnabled \
    -bool true

To tweak tab sizes:

    defaults write com.googlecode.iterm2 UseUnevenTabs -bool false 
    defaults write com.googlecode.iterm2 MinTabWidth -int 75 
    defaults write com.googlecode.iterm2 MinCompactTabWidth -int 60 
    defaults write com.googlecode.iterm2 OptimumTabWidth -int 175 

To change your search engine:

    defaults write com.googlecode.iterm2 SearchCommand \
    -string "http://google.com/search?q=%@"

To adjust the speed of the animation of the hotkey window's appearance and disappearance:

    defaults write com.googlecode.iterm2 HotkeyTermAnimationDuration \ 
    -float 0.25

To adjust the amount of dimming of split panes. Set the value to a floating-point number between 0 (no dimming) and 1 (complete dimming). The default is 0.15:

    defaults write com.googlecode.iterm2 SplitPaneDimmingAmount \ 
    -float 0.25
