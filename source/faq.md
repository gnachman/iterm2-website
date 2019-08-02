---
layout: default
title: FAQ - iTerm2 - macOS Terminal Replacement
active-state: faq
---

#### Q: What operating systems are supported?
A: iTerm2 is for macOS only. See the downloads page for which OS versions are supported by each version of the app.

#### Q: I don't like the way that iTerm2 renders bold fonts.
A: Go to Preferences->Profiles->Text and change the "Draw bold text in bold font" and "Draw bold text in bright colors" settings. Try running this command in bash to see the difference between the two behaviors:

    printf '\e[0;31mplain\n\e[1;31mbold\n'\
    '\e[0;91mhighlight\n\e[1;91mbold+highlight\n\e[0m'


#### Q: How can I improve iTerm2's performance?
A: Make sure you are running the latest version. Disable transparency and blur. Use a solid background color rather than an image. If you are on 3.2 or later, ensure the GPU renderer is enabled and that it can be used per the restrictions described at <a href="https://gitlab.com/gnachman/iterm2/wikis/Metal-Renderer">Metal Renderer</a>.

#### Q: Why my arrow/HOME/END keys are not working?
A: Check that the `$TERM` variable is correct. `xterm-256color` is recommended. `xterm-new` will also work. Make sure you do not have custom key bindings in **Preferences > Keys** or **Preferences > Profiles > Keys** for these keys. Disabling **Preferences > Profiles > Keys > Allow application keypad mode** will prevent your terminal from getting stuck in application keypad mode, which often has the effect of breaking keys that normally work.

#### Q: Where does iTerm2 store its settings?
A: Preferences, including profiles, are stored in ~/Library/Preferences/com.googlecode.iterm2.plist. To modify it, use the "defaults" command. For example, to delete all settings, run:
<pre>
defaults delete com.googlecode.iterm2
</pre>

#### Q: The fonts are looking weird. What should I do?
A: iTerm2 lets you to specify two fonts. If you only use English or western european languages, you probably only need to set the font for ASCII characters. For other languages, you need to specify a font that works with your language as the Non-ASCII font. You need to make sure the size (height) of two fonts do not differ greatly, so iTerm2 won't display a mess of mixed glyphs.

#### Q: Some characters appear to be twice as wide as others, and things aren't lining up correctly.
#### Q: I'm a Chinese, Japanese, or Korean user and some characters don't line up because they are not rendered in double-width.
A: Go to **Preferences > Profiles > Text** and change the setting of "Treat ambiguous-width characters as double-width."

#### Q: Why can't I set my session's shortcut key to Ctrl-Cmd-D?
A: That key is used by macOS's Dictionary program.

#### Q: How do I make the option/alt key act like Meta or send escape codes?
A: Go to **Preferences > Profiles** tab. Select your profile on the left, and then open the Keyboard tab. At the bottom is a set of buttons that lets you select the behavior of the Option key. For most users, <i>Esc+</i> will be the best choice.

#### Q: What modifier keys affect marking a selection for copy and paste?
A: If you hold down modifier keys while making a selection, the behavior changes in various ways:

  * Alt/Option: Mouse reporting will be disabled. If you're using vim and you can't make a selection, try holding down the alt key and see if that fixes it.
  * Alt + Cmd: Make a rectangular selection.
  * Shift: Extend an existing selection.
  * Alt + Shift: Extend a rectangular selection.
  * Cmd: Make a discontinuous selection

Additionally, you can affect other mouse-related activities with modifier keys:

  * Dragging a selection copies and pastes it. If you keep doing this by accident, turn on **Preferences > Advanced > To drag images or selected text, you must hold ⌘. This prevents accidental drags.**.
  * Cmd+click on a URL opens it.

#### Q: How do I change a tab's title?
A: Press Cmd-I (or View->Edit Current Session...) and enter a new title in the "Name" field. You can set it programmatically (in bash) with:

    echo -e "\033];MY_NEW_TITLE\007"

#### Q: How do I set iTerm2 as the handler for ssh:// links?
A: Two steps:

1. Create a new profile called "ssh". In the General tab, select the Command: button and enter $$ as the command.
2. In Preferences->Profiles->General, select "ssh" for "Select URL Schemes...."

#### Q: How can I open a profile from the Profiles window in a new window without using the mouse?
A: Select a profile with the up and down arrow keys and press shift-enter.

#### Q: How do I get 256 color mode working in vim?
A: The recommended way is to set your terminal type to xterm-256color in **Preferences > Profiles > Terminal > Report Terminal Type**. You may also need to put set background=light or set background=dark in your .vimrc.

#### Q: Mouse reporting in vim doesn't work for some rows/columns in a big terminal window.
A: Older mouse reporting protocols didn't work in large terminals. Recent versions of vim (at least 7.4) support the "SGR" protocol, which does not have any practical limits on terminal size. To enable it in vim, add this to your .vimrc:
<pre>
if has('mouse_sgr')
    set ttymouse=sgr
endif
</pre>

#### Q: How do I post notifications from the command line?
A: In bash:

    echo $'\e]9;Notification Text\007'

#### Q: How do I make the mouse work in emacs?
A: This is the simple but dumb way:

    (require 'mwheel)
    (require 'mouse)
    (xterm-mouse-mode t)
    (mouse-wheel-mode t)
    (global-set-key [mouse-4] 'next-line)
    (global-set-key [mouse-5] 'previous-line)

<a href="https://www.emacswiki.org/emacs/SmoothScrolling">The rabbit hole goes deep.</a>

#### Q: Why is my text all black and white?
A: The most common cause is that "minimum contrast" (under **Preferences > Profiles > Colors**) is turned up all the way.

#### Q: How can I make the tab bar visible in fullscreen mode?
A: Toggle Show Tabs in Fullscreen under the View menu (cmd-shift-T).

#### Q: When I use a third-party app like SizeUp or Spectacle to make an iTerm2 window fill the screen it doesn't quite fill it.
A: Turn on **Preferences > Advanced > Terminal windows resize smoothly**.

#### Q: Where is the source code?
A: <a href="https://github.com/gnachman/iTerm2">See gnachman's Github iTerm2 project.</a>

#### Q: How can I open iTerm2 to a directory from Finder?
A: Right-click on the directory and select **Services > New iTerm2 Tab Here**.

#### Q: How can I keep the cursor guide always visible?
A: Turn on the **Cursor Guide** checkbox in **Preferences>Profiles>Colors**.

#### Q: How can I make the toolbelt open automatically?
A: Turn on the **Open Toolbelt** checkbox in **Preferences>Profiles>Window**.

#### Q: How can I prevent the window from resizing when I change the font with cmd-+ and cmd--?
A: Turn off **Preferences>General>Adjust window when changing font size**.

#### Q: tmux integeration and mosh don't play nice together
A: mosh is not a reliable transport. You have a few options if ssh is driving you nuts:

1. Use a <a href="https://github.com/4ast/mosh/">hacked version of mosh</a> that is a reliable transport. Instructions on building it can be found <a href="http://donnlee.com/2018/03/31/mosh-with-iterm2s-tmux-integration/">on Donn Lee's home page</a>.
2. Use <a href="https://mistertea.github.io/EternalTerminal/">Eternal Terminal</a>.

#### Q: The "Download with scp" context menu item does not work
A: Did you install shell integration on the remote host? It's necessary to know what the hostname and user name are. If that doesn't fix it, you might need to give it a hint about which port or hostname to use. See <a href="https://gitlab.com/gnachman/iterm2/wikis/scp-not-connecting">SCP not connecting</a> for more.

#### Q: The keyboard shortcuts for find next/previous and for toggle full screen are not standard. How can I fix it?
A: Next and previous are intentionally inverted to make typical use more convenient. Toggle full screen is not cmd-ctrl-F because all cmd-ctrl shortcuts are reserved because they can be bound to opening a profile. This predates the existence of full screen in macOS.

You can change any shortcut in **Prefs > Keys**. The actions in question are **Find Again Up**, **Find Again Down**, and **Toggle Fullscreen**.

#### Q: When I paste I get funny characters before and after the pasted text, like `0~` and `1~`.
A: Paste bracketing was incorrectly left turned on. Paste bracketing is a feature that can be enabled by an application (such as vim or emacs) that causes the terminal emulator to put a control sequence before and after the pasted text. This allows a program like a text editor not to auto-indent pasted text, since it might already contain indents. Paste bracketing is turned on or off by a control sequence. If the application crashes or an ssh connection is lost, then paste bracketing will be left turned on. The next time you paste, the application receiving the text does not expect paste bracketing to be on (since it did not enable it) and you get this gibberish. You can disable paste bracketing by resetting the terminal. Select the menu item **Session > Reset**. If you install <a href="/shell_integration.html">Shell Integration</a> on both your computer and the machine you ssh to, then iTerm2 can automatically detect when an ssh connection ends and paste bracketing is stuck "on", and automatically turn it off for you.

#### Q: I can no longer change panes/tabs/windows with modifier + number.
A: Turn on **Prefs > Keys > Emulate US Keyboard.** This change was made because some people were unable to type symbol characters that required a modifier + a key where a digit resides on a US keyboard, so the default was changed to not assume that the top row of keys were numeric.

#### Q: Why can't I scroll with a Logitech mouse?
A: Their drivers have a bug. Turn off the menu item **iTerm2 > Secure Keyboard Entry**. Complain to Logitech that their drivers are bad, or buy a mouse from a better brand.

#### Q: I use bash and sometimes my prompt draws incorrectly.
A: If you have problems where doing a reverse search or wrapping a long command causes letters to appear in the wrong place it may be because you have non-printing characters in your PS1. Place them between `\[` and `\]`. More info <a href="https://www.tldp.org/HOWTO/Bash-Prompt-HOWTO/nonprintingchars.html">here</a>.
