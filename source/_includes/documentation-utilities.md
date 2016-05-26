iTerm2 has a collection of shell scripts that help you take advantage of some of its unique features. When you install <a href="shell_integration.html">Shell Integration</a>, you're asked if you'd like to install the Utilities Package as well. This page describes these utilities.

### Availability

The Utilities Package and Shell Integration are only available in iTerm2 version 2.9.20160405 and later.

### Components

The Utilities Package contains the following programs:

#### imgcat

The `imgcat` program displays images inline in your terminal.

<img src="images/inline_image_sparky_demo.png">

It supports all standard image formats, including animated GIFs.

<pre>
Usage:
imgcat filename [filename...]

or

cat image | imgcat
</pre>

#### it2dl

The `it2dl` program downloads files. This is useful when you are ssh'ed to a remote host. The downloaded files are placed in your *Downloads* folder.

<pre>
Usage:
it2dl filename
</pre>

### Location

The Utilities Package places shell scripts in `$HOME/.iterm2/` and creates aliases to them at the bottom of `$HOME/.iterm2_shell_integration.$SHELL`.

