*Dynamic Profiles* is a feature that allows you to store your profiles in a file outside the usual macOS preferences database. Profiles may be changed at runtime by editing one or more plist files (formatted as JSON, XML, or in binary). Changes are picked up immediately.

### Availability

Dynamic Profiles are available in iTerm2 2.9.20140923 and later.

### Usage

When iTerm2 starts, it creates a folder:
<pre>
~/Library/Application Support/iTerm2/DynamicProfiles
</pre>

While iTerm2 runs, it monitors the contents of that folder. Any time the folder's contents change, all files in it are reloaded.

Files in this folder are expected to be formatted as Apple <a href="https://en.wikipedia.org/wiki/Property_list">Property Lists</a>. No particular file extension is required. All files in the folder must be valid property lists. If any is malformed, then no changes will be processed.

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

The "Guid" is a globally unique identifier. It is used to track changes to the profile over time. No other profile should ever have the same guid. One easy way to generate a Guid is to use the *uuidgen* program, which comes standard with macOS.

The "Name" is the name, as seen in the Profiles window or in Preferences.

Here is a fully formed (but minimal) Dynamic Profiles plist:

<pre>
{
  "Profiles": [
    {
      "Name": "Example",
      "Guid": "ba19744f-6af3-434d-aaa6-0a48e0969958"
    }
  ]
}
</pre>

### Attributes

Every profile preference that iTerm2 supports may be an attribute of a Dynamic Profile. Since there are dozens of attributes, you usually won't specify them all. Any attribute not specified will inherit its value from the default profile, or a specified "parent" profile (see below).

The easiest way to find the name and legal value of a profile attribute is to copy it from a known-good reference. To get the JSON for a profile you already have, follow these steps:

  1. Open Preferences &gt; Profiles
  2. Select a profile
  3. Open the *Other Actions* menu beneath the list of profiles
  4. Select *Copy Profile as JSON*
  5. Paste the clipboard contents into your favorite text editor

If you paste a whole profile into a Dynamic Profile this way, make sure you remember to change the Guid. A Dynamic Profile with a Guid equal to an existing Guid of a regular profile will be ignored.

#### Parent Profiles

Normally, a dynamic profile inherits any attributes you don't explicitly specify from the default profile. You may also specify a particular profile to inherit from using the <i>Dynamic Profile Parent Name</i> attribute. The value it takes is a profile name (that is, the name you see listed in the list of profiles in Preferences box). Profile names are not guaranteed to be unique, but they are more convenient than GUIDs. If no profile with the specified name is found, the default profile is used instead. For example:

<pre>
{
  "Profiles": [
    {
      "Name": "Example",
      "Guid": "ba19744f-6af3-434d-aaa6-0a48e0969958",
      "Dynamic Profile Parent Name": "Light Background"
    }
  ]
}
</pre>

### Minutiae

Dynamic profiles are loaded in alphabetical order by filename. Within a particular file, they are loaded in the order they're listed in. This only matters if one dynamic profile references another dynamic profile as its parent; the parent should be placed so it loads before any of its children. For all other purposes, the filenames don't matter.

The *Dynamic* will automatically be added to all Dynamic Profiles.

### Troubleshooting

If something goes wrong loading a Dynamic Profile, errors will be logged to Console.app.

### Triggers

By default, *Highlight* triggers save colors in a large inscrutable mess of a format. For dynamic profiles, you can use `#rrggbb` in place of the large inscrutable mess.

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


