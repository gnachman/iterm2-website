---
layout: default
title: Dynamic Profiles - iTerm2 - Mac OS Terminal Replacement
---

## Dynamic Profiles

*Dynamic Profiles* is a feature that allows you to store your profiles in a file outside the usual OS X preferences database. Profiles may be changed at runtime by editing a plist file (formatted as JSON, XML, or in binary). Changes are picked up immediately.

### Availability

Dynamic Profiles are available in iTerm2 2.9.20140923 and later.

### Usage

When iTerm2 starts, it creates a folder:
<pre>
~/Library/Preferences/Application Support/iTerm2/Dynamic Profiles
</pre>

While iTerm2 runs, it monitors the contents of that folder. Any time the folder's contents change, all files in it are reloaded.

Files in this folder are expected to be formatted as Apple <a href="http://en.wikipedia.org/wiki/Property_list">Property Lists</a>. No particular file extension is required. All files in the folder must be valid property lists. If any is malformed, then no changes will be processed.

### Property List Format

A property list describes a data structure consisting of arrays, dictionaries, strings, integers, and boolean values. Property lists may be written in JSON or XML. Here's an example of the skeletal structure of a JSON property list that iTerm2 expects for Dynamic Profiles:

<pre>
{
  "Profiles": [
    {
       [attributes for the first profile go here]
    },
    {
       [attributes for the second profile go here]
    },
    [more profiles]
  ]
}
</pre>

There are two required fields for each profile:

  * Guid
  * Name

The "Guid" is a globally unique identifier. It is used to track changes to the profile over time. No other profile should ever have the same guid. One easy way to generate a Guid is to use the *uuidgen* program, which comes standard with OS X.

The "Name" is the name, as seen in the Profiles window or in Preferences.

Here is a fully formed (but minimal) Dynamic Profiles plist:

<pre>
{
  "Profiles": [
    {
      "Name": "Example"
      "Guid": "ba19744f-6af3-434d-aaa6-0a48e0969958"
    }
  ]
}
</pre>

### Attributes

Every profile preference that iTerm2 supports may be an attribute of a Dynamic Profile. Since there are dozens of attributes, you usually won't specify them all. Any attribute not specified will inherit its value from the default profile.

The easiest way to find the name and legal value of a profile attribute is to copy it from a known-good reference. To get the JSON for a profile you already have, follow these steps:

  1. Open Preferences &gt; Profiles
  2. Select a profile
  3. Open the *Other Actions* menu beneath the list of profiles
  4. Select *Copy Profile as JSON*
  5. Paste the clipboard contents into your favorite text editor

If you paste a whole profile into a Dynamic Profile this way, make sure you remember to change the Guid. A Dynamic Profile with a Guid equal to an existing Guid of a regular profile will be ignored.


### Troubleshooting

If something goes wrong loading a Dynamic Profile, errors will be logged to /var/log/system.log, and are usually visible by running Console.app.

### Example

Here's an example for a common use case: a list of profiles for *ssh*ing to various hosts. In this example, I've used the hostname as the Guid, which makes constructing this file a little easier and works well enough.

<pre>
{
  "Profiles": [
    {
       "Name": "foo.example.com",
       "Guid": "foo.example.com",
       "Custom Command" : "Yes",
       "Command" : "ssh foo.example.com",
    },
    {
       "Name": "bar.example.com",
       "Guid": "bar.example.com",
       "Custom Command" : "Yes",
       "Command" : "ssh bar.example.com",
    },
  ]
}
</pre>

