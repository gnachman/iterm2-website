#!/usr/bin/python
# vim: set fileencoding=utf-8 :

import os
import os.path, time
import re
import glob

print '''---
layout: default
title: Downloads - iTerm2 - Mac OS Terminal Replacement
active-state: downloads
---
'''

# Compare version numbers of iTerm2 filenames.
def CompareZipFileNames(x, y):
  xname = os.path.basename(os.path.normpath(x))
  yname = os.path.basename(os.path.normpath(y))
  xversion = re.sub(r"iTerm2.*?([0-9_*]+(-[^.]+)?)\.zip", r"\1", xname)
  yversion = re.sub(r"iTerm2.*?([0-9_*]+(-[^.]+)?)\.zip", r"\1", yname)

  xnumbers = re.sub(r"[0-9_]+(-.*)", r"", xversion).split("_")
  ynumbers = re.sub(r"[0-9_]+(-.*)", r"", yversion).split("_")

  i = 0
  while (i < len(xnumbers) and i < len(ynumbers)):
    if xnumbers[i] > ynumbers[i]:
      return 1
    if xnumbers[i] < ynumbers[i]:
      return -1
    i += 1

  if len(xnumbers) > len(ynumbers):
    return 1
  elif len(xnumbers) < len(ynumbers):
    return -1

  return cmp(yversion, xversion)

def Metadata(zip, metadataType, onError=None):
    basename = os.path.splitext(zip)[0]
    name = basename + "." + metadataType
    try:
        return open(name, "r").read()
    except:
	if onError is None:
	    return os.path.split(basename)[1]
	else:
	    return onError

def Summary(zip):
    return Metadata(zip, "summary")

def Description(zip):
    return Metadata(zip, "description", onError="")

def ChangeLog(zip):
    content = Metadata(zip, "changelog", onError="")
    if len(content):
        id = abs(hash(zip))
        content = \
'''<p><a href="javascript:showId('%s')" id='show%s'>&#x25b8; Show Changelog</a>
<a href="javascript:hideId('%s')" id='hide%s' style="display: none">&#x25be; Hide Changelog</a>
<pre id="changelist%s" style="display: none">%s</pre></p>''' % (id, id, id, id, id, content)
    return content


BASE=os.environ["HOME"] + "/iterm2.com/downloads"
DOWNLOADS_PATHS=[("Stable Releases", "stable", "Stable releases update rarely but have no serious bugs."),
                 ("Test Releases", "beta", "Test releases update many times a year and are occasionally unstable."),
                 ]

LIMIT = { "stable": 2,
          "beta": 1,
	  "nightly": 5 }

for sectionName,path,note in DOWNLOADS_PATHS:
    print "<h3>" + sectionName + "</h3>"
    if note is not None:
      print "<p>"
      print note
      print "</p>"

    # Grab the "legacy" zip files, which have a suffix like -LeopardPPC.zip
    legacy_zips = glob.glob(BASE + "/" + path + "/iTerm2?*-*.zip")
    legacy_zips.sort(cmp=CompareZipFileNames, reverse=True)

    # Grab all the zip files and remove the legacy ones, leaving the modern ones.
    modern_zips = glob.glob(BASE + "/" + path + "/*.zip")
    modern_zips.sort(cmp=CompareZipFileNames, reverse=True)
    for s in legacy_zips:
      modern_zips.remove(s)

    # Sort zips by first modern, first legacy, and then sorted list of mixed
    # modern and legacy versions together.
    if LIMIT[path] == 1:
      zips = [ modern_zips[0] ]
      remainder = modern_zips[1:] + legacy_zips
    else:
      zips = [ modern_zips[0], legacy_zips[0] ]
      remainder = modern_zips[1:] + legacy_zips[1:]
    remainder.sort(cmp=CompareZipFileNames, reverse=True)
    zips += remainder

    i = 0
    haveArchive = False
    for zip in zips:
        if i == LIMIT[path]:
	  haveArchive = True
	  print '''<p><a href="javascript:showId('%s')" id='show%s'>&#x25b8; Show Older Versions</a>
<a href="javascript:hideId('%s')" id='hide%s' style="display: none">&#x25be; Hide Older Versions</a>
<div id="changelist%s" style="margin-left: 15pt; display: none"><h3>Older %s</h3>''' % (path, path, path, path, path, sectionName)
        i += 1
        name = os.path.split(zip)[1]
	print '<h4><a href="https://iterm2.com/downloads/' + path + '/' + name + '"><img src="/img/med-download.png" align="left">&nbsp;' + Summary(zip) + '</a></h4>'
	descr = Description(zip)
	if len(descr) > 0:
	  print "<p>"
	  print descr
	  print '<br>'
	  cl = ChangeLog(zip)
	  if len(cl):
	      print cl
	  print "</p>"
    if haveArchive:
      print '''</div>'''

print '''
<h3>Nightly Builds</h3>
<p>
A nightly build is made at midnight Pacific time on days where a change was committed. The change log may be seen <a href=\"https://github.com/gnachman/iTerm2/commits/master\">on Github</a>. Nightly builds sometimes have serious bugs.
</p><p>
<a href="/nightly/latest">
<img src="/img/med-download.png">
Download the latest nightly build.
</a>
</p><p>
Older nightly builds may be found in the <a href="/downloads/nightly">nightly build archives.</a>
</p>
'''
