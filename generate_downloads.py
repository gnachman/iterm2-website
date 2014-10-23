#!/usr/bin/python
# vim: set fileencoding=utf-8 :

import os
import os.path, time
import glob

print '''---
layout: default
title: Downloads - iTerm2 - Mac OS Terminal Replacement
active-state: downloads
---
'''

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
'''<p><a href="javascript:showId('%s')" id='show%s'>▶ Show Changelog</a>
<a href="javascript:hideId('%s')" id='hide%s' style="display: none">▼ Hide Changelog</a>
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

    zips = glob.glob(BASE + "/" + path + "/*.zip")
    zips.sort(reverse=True)
    i = 0
    haveArchive = False
    for zip in zips:
        if i == LIMIT[path]:
	  haveArchive = True
	  print '''<p><a href="javascript:showId('%s')" id='show%s'>▶ Show Older Versions</a>
<a href="javascript:hideId('%s')" id='hide%s' style="display: none">▼ Hide Older Versions</a>
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
