#!/usr/bin/python
# vim: set fileencoding=utf-8 :

import os
import os.path, time
import re
import glob
import sys

print '''---
layout: default
title: Downloads - iTerm2 - Mac OS Terminal Replacement
active-state: downloads
---
'''

def strip_end(text, suffix):
    if not text.endswith(suffix):
        return text
    return text[:len(text)-len(suffix)]

# Compare version numbers of iTerm2 filenames.
def CompareZipFileNames(x, y):
  origX = x
  origY = y
  preview = "-preview"
  x = x.replace(preview, "")
  y = y.replace(preview, "")
  #print "Compare",x,"and",y,"originals:",origX,"and",origY
  if x == y and preview in origX and not preview in origY:
    # Non-preview succeeds preview. x < y
    #print "lhs is preview, rhs is not"
    return -1
  elif x == y and not preview in origX and preview in origY:
    # x > y
    #print "lhs is not preview, rhs is preview"
    return 1

  xname = os.path.basename(os.path.normpath(x))
  yname = os.path.basename(os.path.normpath(y))
  xversion = re.sub(r"iTerm2.*?([0-9_*]+([-_][^.]+)?)\.zip", r"\1", xname)
  yversion = re.sub(r"iTerm2.*?([0-9_*]+([-_][^.]+)?)\.zip", r"\1", yname)

  xversion = xversion.replace("beta", "0")
  yversion = yversion.replace("beta", "0")

  xsubnumbers = re.sub(r"[0-9_]+(-.*)", r"", xversion)
  ysubnumbers = re.sub(r"[0-9_]+(-.*)", r"", yversion)

  if len(xsubnumbers) == 0: xsubnumbers = "0"
  if len(ysubnumbers) == 0: ysubnumbers = "0"

  xnumbers = map(int, xsubnumbers.split("_"))
  ynumbers = map(int, ysubnumbers.split("_"))

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

LIMIT = { "stable": 1,
          "beta": 2,
	  "nightly": 5 }

for sectionName,path,note in DOWNLOADS_PATHS:
    print "<h3>" + sectionName + '</h3><hr style="margin-top: 0pt; margin-bottom: 4pt" />'
    if note is not None:
      print "<p>"
      print note
      print "</p>"

    modern_zips = glob.glob(BASE + "/" + path + "/*.zip")
    modern_zips.sort(cmp=CompareZipFileNames, reverse=True)

    if LIMIT[path] == 1:
      zips = [ modern_zips[0] ]
      remainder = modern_zips[1:]
    else:
      zips = [ modern_zips[0] ]
      remainder = modern_zips[1:]
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
	print '<h4 style="margin-top: 4pt"><a href="https://iterm2.com/downloads/' + path + '/' + name + '"><img src="/images/Download.png" width=100 height=27 style="padding-right: 10pt">' + Summary(zip) + '</a></h4>'

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
<hr style="margin-top: 0pt; margin-bottom: 4pt" />
A nightly build is made at midnight Pacific time on days where a change was committed. The change log may be seen <a href=\"https://github.com/gnachman/iTerm2/commits/master\">on Github</a>. Nightly builds sometimes have serious bugs.
</p>
<h4 style="margin-top: 4pt">
<a href="/nightly/latest">
<img src="/images/Download.png" width=100 height=35 style="padding-right: 10pt">Latest nightly build
</a></h4>
<p>
Older nightly builds may be found in the <a href="/downloads/nightly">nightly build archives.</a>
</p>
'''
