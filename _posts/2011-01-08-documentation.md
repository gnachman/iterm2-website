## Bookmarks

iTerm 2 allows you to store collections of preferences in objects called
Bookmarks. When you open a new window or tab, a bookmark (often the "default"
bookmark) is launched. The bookmark specifies the command to run, how the
display should appear (including colors and fonts), various attributes of
the terminal, and keyboard bindings.

TODO: Document all bookmark settings

## Hidden Settings

There are a few settings that you cannot access via iTerm's own Preferences
panel. However, you can use 'defaults" command to change them to your taste.

The first four are for setting the tab size:

    defaults write com.googlecode.iterm2 UseUnevenTabs -bool false
    defaults write com.googlecode.iterm2 MinTabWidth -int 75
    defaults write com.googlecode.iterm2 MinCompactTabWidth -int 60
    defaults write com.googlecode.iterm2 OptimumTabWidth -int 175

The last one is for the search command launched from the contextual menu.
The default is to use google. You can set it to anything you want.

    defaults write com.googlecode.iterm2 SearchCommand \
            -string "http://google.com/search?q=%@"

For example, if you like Yahoo, here is the command:

    defaults write com.googlecode.iterm2 SearchCommand \
            -string "http://search.yahoo.com/search?p=%@"

## AppleScript

### Example Script

iTerm has sophisticated Applescript support allowing one to write stand-alone
scripts to launch the application and open multiple sessions from the
addressbook into either new tabs or new windows. You can also set some other
parameters for a session such as foreground and background colors, and
transparency. Here is a sample script:

    -- A sample iTerm Applescript

    tell application "iTerm"
      activate

      -- close the first session
      terminate the first session of the first terminal

      -- make a new terminal
      set myterm to (make new terminal)

      -- talk to the new terminal
      tell myterm

        -- set size
        set number of columns to 100
        set number of rows to 50
        -- make a new session
        set mysession to (make new session at the end of sessions)

        -- talk to the session
        tell mysession

          -- set some attributes
          set name to "tcsh"
          set foreground color to "red"
          set background color to "blue"
          set transparency to "0.6"

          -- execute a command
          exec command "/bin/tcsh"

        end tell -- we are done talking to the session

        -- we are back to talking to the terminal

        -- launch a default shell in a new tab in the same terminal
        launch session "Default Session"

        -- launch a saved session from the addressbook.
        launch session "Root Shell"
        -- select the previous session
        select mysession
        -- get the tty name of a session
        set myttyname to the tty of the first session
        -- refer to a session by its tty/id
        tell session id myttyname
            set foreground color to "yellow"
        end tell

      end tell

      -- talk to the first terminal
      tell the first terminal

        -- launch a default shell in a new tab in the same terminal
        launch session "Default Session"

        tell the last session

          -- write some text
          write text "cd Projects/Cocoa/iTerm"
          -- write the contents of a file
          write contents of file "/path/to/file/"

        end tell

      end tell

      -- reposition window and name it
      set the bounds of the first window to {100, 100, 700, 700}
      set the name of the first window to "A Window Title"


    end tell

These scripts can then be saved as stand-alone executable applications.

### Autolanching Scripts

iTerm also supports autolaunching of an Applescript on startup. On startup,
iTerm looks for an Applescript called `AutoLaunch.scpt` under
`~/Library/Application Support/iTerm`. If it is found, the `AutoLauch.scpt`
is launched and executed. This feature can be used to launch multiple
sessions in defined windows and tabs when iTerm starts up.

### User-Defined Scripts

iTerm also supports launching of user defined scripts from the "Scripts"
menu. The scripts need to be stored under the
`~/Library/Application Support/iTerm/Scripts` directory. You can create
this directory if it does not already exist. iTerm checks this directory
on startup.

## Interesting Links

Here are some links to some iTerm related websites.

* [Applescripts for executing a command and connecting to a remote server](http://homepage.mac.com/denao/scripts/)
  by Denis A.V. Jr.
* [Applescript for opening a session](http://damonparker.org/blog/2005/09/14/iterm-tricks/)
  by Damon Parker
* [A Growl trick](http://damonparker.org/blog/2006/11/13/iterm-and-growl/)
  by Damon Parker
* [A collection of iTerm Shell Customizations for bash, zsh and tcsh](http://xanana.ucsc.edu/xtal/iterm_tab_customization.html)
  from William G. Scott
* [Use iTerm with OnMyCommand](http://www.macosxhints.com/article.php?story=20030609222910699)
  from macosxhints
* [Open current directory in iTerm](http://www.bigbold.com/snippets/tag/iTerm)
* [iTerm plugin](http://docs.blacktree.com/quicksilver/plug-ins/iterm?DokuWiki=)
  for Quicksilver.
* [iTerm Here](http://www.tco.net/~dscott/software/itermhere/)
* [WidgetTerm](http://widgetterm.sourceforge.net/):
  A mini terminal in your dash board.

## Fonts

While iTerm 2 does not require monospaced fonts, they look much better than proportionately spaced fonts. Here are some recommended fonts:

* VT100 Comes with OS X, rather ugly though
* Lucide Console Comes with Office v.X
* SImPL A very nice font made by Phil Chastney. Download from
  [here](http://www.vector.org.uk/resource/simpl02.zip)
* APL385 Another font from Dyalog.NET. Get it from
  [here](http://www.vector.org.uk/resource/apl385.zip)
* FreeMono A nice font made available by Free UCS Outline Fonts project. It
  is bundled with iTerm.app starting from version 0.70. Visit their
  [website](http://www.nongnu.org/freefont/).
* Wen Ding Chinese fonts A set of simplified and traditional Chinese fonts.
  Download from [here](http://www.arphic.net/tw/service/resource_cont.asp?id=1&toppage=2).
  Thanks to Miyang Lin for providing us information.

One **non**-recommended font is Consolas. It has an improperly set baseline offset and
appears too high. It can be fixed, though; please see this page on
[how to fix Consolas baseline](http://mbauman.net/geek/2009/03/15/minor-truetype-font-editing-on-a-mac/).

## UTF-8 patch for tcsh 6.12.00

By Yuichi Ohkawa.

The tcsh pre-installed in Mac OS X has many problems dealing with UTF-8. If
you input mult-bytes characters to tcsh, this patch may help you to edit the characters.

Download from [here](ftp://ftp.tba.org.tohoku.ac.jp/pub/tcsh-6.12-utf8.patch.gz)

## Tips for using zsh with iTerm 2

Provided by Marius Wyx.

There are people with hints on ways to customize the title bar and tabs, a
much simpler way when using zsh is to do the following:


    precmd () {
      echo -n "\033]1;$USERNAME@$HOST^G\033]2;$PWD>    - $USERNAME@$HOST
      ($status)^G"
    }
    PROMPT='%m %B%3c%(#.#.>)%b '
    RPROMPT=''

(NOTE: `^G` is CTRL-G, you need to enter it using `^V^G`)

Much simpler and does not require anything special. (apart from zsh)

Also in zsh, the command line completion I have expanded to be
`/Applications/` aware:


    if [ "`uname`" = "Darwin" ]; then
       compctl -f -x 'p[2]' -s "`/bin/ls -d1 /Applications/*/*.app
    /Applications/*.app | sed 's|^.*/\([^/]*\)\.app.*|\\1|;s/ /\\\\ /g'`"
    -- open
       alias run='open -a'
    fi

typing: "open -a " and then pressing tab will try and complete any
application... (added an alias run as well)