---
layout: docs
title: Feature Reporting Spec - iTerm2 - macOS Terminal Replacement
active-state: documentation
---
# Hyperlinks (a.k.a. HTML-like anchors) in terminal emulators

*[ Update 2020-05-31: I won't be maintaining this page or responding to comments anymore. The list of supporting software reflects the known state as of this date. ]*

---

Most of the terminal emulators auto-detect when a URL appears onscreen and allow to conveniently open them (e.g. via Ctrl+click or Cmd+click, or the right click menu).

It was, however, not possible until now for arbitrary text to point to URLs, just as on webpages.

In spring 2017, `GNOME Terminal` and `iTerm2` have changed this.

`GNOME Terminal` is based on the `VTE` widget, and almost all of this work went to `VTE`. As such, we expect other `VTE`-based terminal emulators to catch up and add support really soon. Other terminal emulators are also welcome and encouraged to join!

## Quick example

Here's a simple command to try out the feature. The result is equivalent to this HTML link: [This is a link](http://example.com)

```
printf '\e]8;;http://example.com\e\\This is a link\e]8;;\e\\\n'
```

## Supporting apps

### Terminal emulators
- [DomTerm](https://domterm.org/) 1.0.2
- [hterm](https://chromium.googlesource.com/apps/libapps/+/master/hterm) 1.76
- [hyper](https://hyper.is/) since Oct 2019, version ???
- [iTerm2](http://iterm2.com/) 3.1
- [Terminology](https://www.enlightenment.org/about-terminology) in git since 2018-10-14, probably will be released in version 1.3
- [Ultimate++ terminal widget](https://github.com/ismail-yilmaz/upp-components/tree/master/CtrlLib/Terminal) since Nov 2019 (version ???)
- based on [VTE](https://wiki.gnome.org/Apps/Terminal/VTE) 0.50: <sup>(Use 0.50.4, 0.52.2, or newer to avoid a rare crash)</sup>
  - [GNOME Terminal](https://wiki.gnome.org/Apps/Terminal) 3.26
  - [Guake](http://guake-project.org/) 3.2.1
  - [ROXTerm](https://github.com/realh/roxterm) 3.5.1
  - [Tilix](https://github.com/gnunn1/tilix) 1.5.8
- [WezTerm](http://wezfurlong.org/wezterm/index.html) since early 2018

### Terminal Multiplexers
- [TermySequence](https://termysequence.io/)

### Apps
- [gcc](https://gcc.gnu.org/): Since version 10, for diagnostic messages to point to the documentation.
- `less -R`: Preliminary patch available in the GNOME Terminal discussion.
- `ls --hyperlink[=always/auto/never]` (`coreutils`): Since version 8.28.
- [Matterhorn](https://github.com/matterhorn-chat/matterhorn) chat client: Since version 40400.0.0.
- [mdcat](https://github.com/lunaryorn/mdcat) (markdown cat): Since version 0.5.0.
- [Symfony](https://symfony.com/): Since version 4.3.
- [systemd](https://github.com/systemd/systemd): Since version 239.
- [wget2](https://gitlab.com/gnuwget/wget2/): Since Nov 2019 (version ???).

### Libraries
- [vty](https://hackage.haskell.org/package/vty) medium-level terminal UI library: Since October 2017.
- [brick](https://hackage.haskell.org/package/brick) high-level terminal UI library: Since October 2017.
- [Rich](https://github.com/willmcgugan/rich) rich text formatting library: Since May 2020.

## Feature requests sent

### Terminal emulators
- [Alacritty](https://github.com/alacritty/alacritty/issues/922)
- [ConEmu](https://github.com/Maximus5/ConEmu/issues/2078)
- [Kitty](https://github.com/kovidgoyal/kitty/issues/68) <sup>(The Linux and macOS terminal emulator. Not to be confused with the Windows PuTTY-fork named `KiTTY`.)</sup>
- [Konsole](https://bugs.kde.org/show_bug.cgi?id=379294)
- `VTE`-based:
  - [LilyTerm](https://github.com/Tetralet/LilyTerm/issues/117)
  - [LXDE Terminal](https://sourceforge.net/p/lxde/bugs/870/)
  - [MATE Terminal](https://github.com/mate-desktop/mate-terminal/issues/175)
  - [Sakura](https://bugs.launchpad.net/sakura/+bug/1686823)
  - [Terminator](https://bugs.launchpad.net/terminator/+bug/1686821) <sup>(The one for Linux written in Python, based on GTK+. Not to be confused with the one written in Java bearing the same name.)</sup>
  - [Termit](https://github.com/nonstop/termit/issues/109)
  - [Termite](https://github.com/thestinger/termite/issues/476)
  - [Tilda](https://github.com/lanoxx/tilda/issues/285)
  - [Xfce Terminal](https://bugzilla.xfce.org/show_bug.cgi?id=13534)
- [Windows Terminal](https://github.com/microsoft/terminal/issues/204)
- [xterm.js](https://github.com/xtermjs/xterm.js/issues/1134)

### Apps
- [Irssi](https://github.com/irssi/irssi/issues/700)
- [less -R](https://github.com/gwsw/less/issues/54)
- [screen](https://savannah.gnu.org/bugs/index.php?50952)
- [tbvaccine](https://github.com/skorokithakis/tbvaccine/issues/37)
- [tmux](https://github.com/tmux/tmux/issues/911)
- [weechat](https://github.com/weechat/weechat/issues/1252)
- Planned to send request soon: vim, neovim, emacs, groff, find, grep.

## A few use cases

We have a couple of use cases in mind...

### apt-changelog

apt-changelog could automatically format bug IDs as links to the bugtracker's corresponding page.

### git log

git log, or other similar tools could make the commit IDs links to the corresponding page of a web frontend to the repo.

### viewers, editors

File viewers and editors could auto-detect URIs in the document, and convert them to hyperlinks even if they are only partially visible on the screen. Example screenshot from an imaginary text editor with two files opened:
```
╔═ file1 ════╗
║          ╔═ file2 ═══╗
║http://exa║Lorem ipsum║
║le.com    ║ dolor sit ║
║          ║amet, conse║
╚══════════║ctetur adip║
           ╚═══════════╝
```
Ctrl+clicking anywhere on `http://exa` or `le.com` could open the webpage `http://example.com`.

### core utilities

Core utilities, such as `ls`, `find` could optionally mark the printed files with their `file://...` URI, making it just one click to open in a graphical application.

### less -R

We're hoping to get `less -R` recognize and handle this escape sequence just as it does colors, so viewing the output of utilities piped to `less -R` would keep their hyperlinks working.

## The escape sequence

A hyperlink is opened upon encountering an OSC 8 escape sequence with the target URI. The syntax is

`OSC` `8` `;` `params` `;` `URI` `ST`

Following this, all subsequent cells that are painted are hyperlinks to this target. A hyperlink is closed with the same escape sequence, omitting the parameters and the URI but keeping the separators:

`OSC` `8` `;` `;` `ST`

`OSC` (operating system command) is typically `ESC` `]`.

`params` is an optional list of `key=value` assignments, separated by the `:` character. Example: `id=xyz123:foo=bar:baz=quux`. Currently only the `id` key is defined, see below. These parameters allow future extendability of this feature. In the typical case no parameters are defined, in that case obviously the two semicolons have to be present next to each other.

`URI` is the target of the hyperlink in URI-encoded form. Web addresses need to begin with `http://` or `https://`. Use `ftp://` for FTP, `file://` for local files (see below for the hostname), `mailto:` scheme for e-mail addresses, etc. It's up to the terminal emulator to decide what schemes it supports and which applications it launches for them.

The sequence is terminated with `ST` (string terminator) which is typically `ESC` `\`. (Although `ST` is the standard sequence according to ECMA-48 §8.3.89, often the `BEL` (`\a`) character is used instead. This nonstandard choice originates from XTerm, and was later adopted by probably all terminal emulators to terminate `OSC` sequences. Nevertheless, we encourage the use of the standard `ST`.)

(For `OSC` and `ST`, their C0 variant was shown above. They have another, C1 form which might be supported in some contexts. In 8-bit Latin-X character sets they are the single bytes `0x9d` and `0x9c`, respectively. In UTF-8 mode some terminal emulators deliberately do not implement C1 support because these bytes would conflict with the UTF-8 encoding, while some other terminal emulators recognize the UTF-8 representation of `U+009d` (i.e. `0xc2` `0x9d`) and `U+009c` (i.e. `0xc2` `0x9c`), respectively. Since C1 is not universally supported in today's default UTF-8 encoding, its use is discouraged.)

## A note on opening/closing hyperlinks

The feature was modeled after anchors on webpages. There are some differences though, due to the nature of terminal emulation.

An HTML page is supposed contain balanced and unnested pairs of `<a ...>` and `</a>` tags. This is important in order to build up a DOM tree. Terminal emulators don't have this concept. They are a state machine, interpreting the data as it arrives in a stream.

As such, in terminal emulators an OSC 8 escape sequence just changes the hyperlink (or lack thereof) to the new value. It is perfectly legal to switch from one hyperlink to another without explicitly closing the first one. It is also perfectly legal to close a hyperlink when it's not actually open (e.g. to make sure to clean up after a potentially unclean exit of an application).

You can practically think of the hyperlink as yet another attribute that character cells have, similarly to the foreground and background color, bold, italic, strikethrough etc. bits. It is absolutely valid to switch from one color to another without resetting to the default in between, or to reset to the default multiple times. The same goes for hyperlinks.

## `file://` URIs and the hostname

Web browsers, desktop environments etc. tend to ignore the hostname component of a `file://hostname/path/to/file.txt` URI. In terminal emulators, such ignorance would lead to faulty targets if you `ssh` to a remote computer. As such, we don't allow this sloppiness. Utilities that print hyperlinks are requested to fill out the `hostname`, and terminal emulators are requested to match it against the local hostname and refuse to open the file if the hostname doesn't match (or offer other possibilities, e.g. to download with `scp` as iTerm2 does).

[RFC 8089](https://tools.ietf.org/html/rfc8089) says the `hostname` component should contain the fully qualified hostname, whereas [Freedesktop's File URI Specification](https://www.freedesktop.org/wiki/Specifications/file-uri-spec/) says it should contain the value returned by `gethostname()` which is often not fully qualified. It's unreasonable for simple utilities to go into the business of hostname resolution. As such, we urge utilities to place the value from `gethostname()` there (shell scripts might go for `$HOSTNAME`).

Terminal emulators should match the given value against the local hostname. They might accept multiple values, e.g. both short and fully qualified names, but they are free to go with just the value from `gethostname()`. They also must accept the string `localhost` or the empty string as local ones. If a different hostname is present, they must not open the local counterpart with the same filename.

## Hover underlining and the `id` parameter

Many terminal emulators automatically recognize web addresses that appear on their screen and underline them on mouse hover. In order to provide a similar user experience and discoverability of this new feature, we figured out we should do the same here as well.

There's a nontrivial question though: Which cells to underline on hover? As opposed to webpages, we lack the semantics, the information about the cells that belong together and form a single web anchor.

Remember the `http://exa` and `le.com` use case example above? To make the hyperlink feature complete, our imaginary text editor should be able to specify that these two pieces of text actually belong to the same anchor, and when mousing over any of these two, both should be underlined.

In order to be able to do this, the lowercase `id` parameter was introduced which connects the cells together.

Character cells that have the same target URI and the same nonempty `id` are always underlined together on mouseover.

The same `id` is only used for connecting character cells whose URIs is also the same. Character cells pointing to different URIs should never be underlined together when hovering over.

For hyperlink cells that do not have an `id` (or have an empty `id`, these two are interchangeable), the terminal emulator does some heuristics in figuring out which cells belong together. Here VTE and iTerm2 differ, but from a practical point of view, this difference should not matter. (VTE automatically assigns a new unique `id` whenever it encounters an OSC 8 with a URI but without `id`. That is, it automatically connects cells that were printed in a single OSC 8 run, in case there was no explicit `id`. iTerm2 looks at the onscreen contents and connects those cells that are next to each other, lack the `id`, but point to the same URI.)

Terminal emulators that implement hyperlinks but don't want to underline on mouseover can simply ignore the `id` parameter.

So, what should applications do? Here's a rough guideline, obviously applications are allowed to diverge if that's what gives the right result.

Simple utilities that "just" print stuff on their standard output should not assign an `id`. Things will just work then as expected.

Complex apps that manage the full screen and wish to explicitly linkify URIs, such as viewers or editors, should assign explicit `id`s that identify that particular link, so that it keeps being underlined together even across a linebreak, across another pane or window of the app's UI, and even across crazily optimized screen updates (e.g. when it repaints only a part of an anchor text). Such an `id` might perhaps be the file offset, or the (row, column) tuple where the hyperlink starts. Apps that support multiple windows, such as the imaginary text editor with that screenshot above, should add the ID of the window to the link's `id` too so that it does not conflict with the same target URI appearing in another window.

Complex apps that display data that might itself contain OSC 8 hyperlinks (such as terminal multiplexers, `less -R`) should do the following: If the encountered OSC 8 hyperlink already has an `id`, they should prefix it with some static string, or if multiple windows/panes are supported by the app, a prefix that's unique to that window/pane to prevent conflict with other windows/panes. If the encountered OSC 8 hyperlink does not have an `id`, they should automatically create one so that they can still have multiple windows/panes and can still crazily partially update the screen and keep it as a semantically single hyperlink towards the host emulator (remember the difference in VTE and iTerm2 when no `id` is set which becomes relevant here, so it should be avoided). This `id` should be taken from a namespace that cannot conflict with a mangled explicit `id`. It's probably much easier to implement VTE's approach here: assign a new `id` (maybe a sequential integer) whenever an OSC 8 with an URI but no `id` is encountered. This way there's absolutely no need to maintain any internal pool of the active hyperlink `id`s or anything like that, it's just a trivial mapping each time an OSC 8 is encountered in the data that needs to be displayed.

Fullscreen apps that do not switch to the "alternate screen" of the terminal emulator, that is, leave their contents onscreen when quitting, should probably add some other identifier, such as the process ID or some random number to the `id`, so that as the user scrolls back in the history with the scrollbar, remains of two previous sessions do not collide.

## Detecting availability of the feature

Currently there's no way of detecting whether the terminal emulator supports hyperlinks. We're hoping to address this at some point in the future.

The hyperlink feature should be used for providing convenient quick access to a target URI, but (at least by default) should not be the only means of figuring out the target.

## Backward compatibility

Any terminal that correctly implements OSC parsing according to ECMA-48 is guaranteed not to suffer from compatibility issues. That is, even if explicit hyperlinks aren't supported, the target URI is silently ignored and the supposed-to-be-visible text is displayed, without artifacts.

If a terminal emits garbage upon an OSC 8 explicit hyperlink sequence, that terminal is buggy according to ECMA-48. It is, and will always be, outside of the scope of this specification to deal with buggy terminals.

At this moment, terminals known to be buggy (OSC 8 resulting in display corruption) are VTE versions up to 0.46.2 and 0.48.1, Windows Terminal up to 0.9, Emacs's built-in terminal, and [screen](https://savannah.gnu.org/bugs/index.php?57718) with 700+ character long URLs.

## Length limits

Terminal emulators traditionally use maybe a dozen or so bytes per cell. Adding hyperlinks potentially increases it by magnitudes. As such, it's tricky to implement this feature in terminal emulators (without consuming way too much memory), and they probably want to expose some safety limits.

Both VTE and iTerm2 limit the URI to 2083 bytes. There's no de jure limit, the de facto is 2000-ish. Internet Explorer supports 2083.

VTE currently limits the `id` to 250 bytes. It's subject to change without notice, and you should most definitely _not_ rely on this particular number. Utilities are kindly requested to stay way below this limit, so that a few layers of intermediate software that need to mangle the `id` (e.g. add a prefix denoting their window/pane ID) still stay safe. Of course such intermediate layers are also kindly requested to keep their added prefix at a reasonable size. There's no limit for the `id`'s length in iTerm2.

Terminal emulators might also impose a maximum length on the overall length of the OSC 8 escape sequence, including all its parameters.

VTE is planned to intentionally slow down a tiny little bit if too many long links are written to its scrollback buffer. This is so that a malicious app cannot quickly eat up the space where it stores the scrollback contents. This should not have an effect on normal usage. FIXME this is planned but not yet implemented.

## Encodings

For portability, the parameters and the URI must not contain any bytes outside of the 32–126 range. If they do, the behavior is undefined. Bytes outside of this range in the URI must be URI-encoded.

Due to the syntax, additional parameter values cannot contain the `:` and `;` characters either. If required at a future extension, some escaping (such as URI-encoding or base64) should be chosen. (Should there ever be an extension to specify hover colors or attributes, I recommend considering going for the ANSI color and attribute notation with the upper dots removed, e.g. bold italic light gray `1;3;38:5:255` would become `1,3,38.5.255`.)

## Security

This feature doesn't introduce anything that's not already present while browsing the web. Therefore we believe this feature doesn't have security aspects to worry about.

In particular, if a webpage is exploitable by making someone visit a URL, passing along their cookies (e.g. doesn't have proper CSRF protection), it's already exploitable from a malicious website.

Moreover, there's no "Referer" leakage to worry about.

That being said, a few points have been raised that are worth noting here.

Some locally installed applications might register a handle for some custom URI scheme (e.g. `foobar://`), and the handler application might be vulnerable in case the rest of the URI is maliciously crafted. Terminal emulators might decide to whitelist only some well known schemes and ask for the user's confirmation on less known ones.

Some are worried that this feature is unexpected from users, and that introducing this somewhat automated link between the terminal and the browser works against the concept of "defense in depth". That is, it's possible that a multi-step attack, exploiting a vulnerability of a website, takes place by using social engineering to get someone follow such a link that they somehow receive in the terminal emulator. It's out of the scope of this specification to deal with such scenarios, this specification can only be responsible for direct security vulnerabilities that it might open. However, terminal emulators might consider adding the following lines of defense. They shouldn't open the link on a simple mouse click (that's for copy-pasting or reporting mouse events typically, anyway), only on some more complex user action such as Ctrl+click or via the right-click menu. They should let the user know the URI upfront. They could decide to present a confirmation dialog before opening it. They could even offer to disable this feature (or even have it disabled by default). People working in critical environments (or their sysadmins) could decide to disable this feature entirely.

## Links

- [GNOME Terminal discussion](https://bugzilla.gnome.org/show_bug.cgi?id=779734)
- [iTerm2 discussion](https://gitlab.com/gnachman/iterm2/issues/5158)
- [Test file](https://git.gnome.org/browse/vte/plain/perf/hyperlink-demo.txt)
