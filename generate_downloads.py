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
                 ("Nightly builds", "nightly", "A nightly build is begun at midnight PST every day and uploaded upon successful completion. If no changes were made, no new build is created. The change log may be seen <a href=\"https://github.com/gnachman/iTerm2/commits/master\">on Github.</a>. Nightly builds sometimes have serious bugs.")]

LIMIT = { "stable": 2,
          "beta": 2,
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
	print '<h4><a href="https://iterm2.com/downloads/' + path + '/' + name + '"><img src="/img/small-download.png" align="left">&nbsp;' + Summary(zip) + '</a></h4>'
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
