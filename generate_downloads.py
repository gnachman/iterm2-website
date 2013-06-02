#!/usr/bin/python
# vim: set fileencoding=utf-8 :

import os
import os.path, time
import glob

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
<pre id="changelist%s" style="display: none">%s</pre></p><br>''' % (id, id, id, id, id, content)
    return content


BASE=os.environ["HOME"] + "/iterm2.com/downloads"
DOWNLOADS_PATHS=[("Stable Releases", "stable"),
                 ("Test Releases", "beta"),
                 ("Nightly builds", "nightly")]

LIMIT = 5

for sectionName,path in DOWNLOADS_PATHS:
    print "<h3>" + sectionName + "</h3>"
    zips = glob.glob(BASE + "/" + path + "/*.zip")
    zips.sort(reverse=True)
    i = 0
    for zip in zips:
        if i == LIMIT:
            break
        i += 1
        name = os.path.split(zip)[1]
        print '<h4><a target="_blank" href="/downloads/' + path + '/' + name + '"><img src="/images/small-download.png" align="left">&nbsp;' + Summary(zip) + '</a></h4>'
	print "<p>"
        print Description(zip)
	print '<br>'
        cl = ChangeLog(zip)
        if len(cl):
            print cl
	print "</p>"
	print "<br>"
