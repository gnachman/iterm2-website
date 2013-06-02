#!/usr/bin/python
# vim: set fileencoding=utf-8 :

import os
import os.path, time
import glob

def Metadata(zip, metadataType):
    basename = os.path.splitext(zip)[0]
    name = basename + "." + metadataType
    print name
    try:
        return open(name, "r").read()
    except:
        return basename

def Summary(zip):
    return Metadata(zip, "summary")

def Description(zip):
    return Metadata(zip, "description")

def ChangeLog(zip):
    content = Metadata(zip, "changelog")
    if len(content):
        id = abs(hash(zip))
        content = \
'''<a href="javascript:showId(%s)" id='show%s'>▶ Show Changelog</a>
<a href="javascript:hideId(%s)" id='hide%s' style="display: none">▼ Hide Changelog</a>
<pre id="changelist%s" style="display: none">%s</pre><br>''' % (id, id, id, id, id, content)
    return content


BASE=os.environ["HOME"] + "/iterm2.com/downloads"
DOWNLOADS_PATHS=[("Stable Releases", "stable"),
                 ("Test Releases", "beta"),
                 ("Nightly build", "nightly")]

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
        print name
        print '<a href="/downloads/' + path + '/' + name + '>' + Summary(zip) + '</a>'
        print Description(zip)
        cl = ChangeLog(zip)
        if len(cl):
            print cl
