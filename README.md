<div align="center">

# iTerm2 Website

### The source of [iterm2.com](https://iterm2.com)

**[Website](https://iterm2.com)** • **[Documentation](https://iterm2.com/documentation.html)** • **[FAQ](https://iterm2.com/faq.html)** • **[Python API](https://iterm2.com/python-api/)** • **[App source](https://github.com/gnachman/iTerm2)**

</div>

---

## About

This repository holds the code for iterm2.com: the landing page, news, features, FAQ, the versioned documentation, the Python API reference, the Sparkle appcasts and the published shell integration scripts.

It does not contain the source code for the app itself, which lives at [gnachman/iTerm2](https://github.com/gnachman/iTerm2).

---

## Preview locally

The site is built with [Jekyll](https://jekyllrb.com/) 3.

```bash
bundle install   # once
./local.sh       # serves http://localhost:4000 and rebuilds on change
```

Refresh the browser to see edits to pages and images.

> **Note:** The downloads page is generated at deploy time by `generate_downloads.py`, so it is missing from a local preview.

---

## Layout

| Path                          | What it holds                                                           |
| ----------------------------- | ----------------------------------------------------------------------- |
| `source/*.md`                 | Top-level pages (home, news, features, FAQ, documentation entry points) |
| `source/_layouts/`            | Page templates; `default.html` is shared by every page                  |
| `source/_includes/<version>/` | Documentation content, one folder per app version                       |
| `source/<version>/`           | Documentation pages for each app version                                |
| `source/css/`, `source/img/`  | Stylesheets and images                                                  |
| `source/python-api/`          | Built Python API reference (Sphinx output)                              |
| `source/appcasts/`            | Sparkle update feeds and release notes                                  |
| `submodules/`                 | Shell integration scripts and bash-preexec                              |

The shell integration scripts and utilities are copied from the `iTerm2-shell-integration` submodule into `source/` by `copy-shell-integration.sh` when the site is built.

---

## Contributing

Corrections to the documentation and FAQ are welcome as pull requests. For bugs in the app, use the [issue tracker](https://iterm2.com/bugs).

---

## License

Everything here, including the shell integration scripts and iTerm2 utilities, is licensed under the GPLv2 or later.
