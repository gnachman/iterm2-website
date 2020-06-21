When iTerm2 presents a list of profiles, it usually includes a search box. The search box uses a special syntax that letes you tailor your searches to quickly find what you're looking for.

### Searching Profiles

Each word in the search query must match at least one word in either the title or the tags of a profile in order for that profile to be matched by the query. For a word to be a match, it must be a substring.

<table style="background: white">
  <tr class="tableheader">
    <th style>Query</th>
    <td>&nbsp;&nbsp&nbsp;&nbsp;</td>
    <th>Profile Name</th>
    <td>&nbsp;&nbsp;</td>
    <th>Matches?</th>
  </tr>

  <tr>
    <td>Linux</td>
    <td>&nbsp;&nbsp;&nbsp;&nbsp;</td>
    <td><b>Linux</b></td>
    <td>&nbsp;&nbsp;</td>
    <td>Yes</td>
  </tr>

  <tr>
    <td>x</td>
    <td>&nbsp;&nbsp;&nbsp;&nbsp;</td>
    <td>Linu<b>x</b></td>
    <td>&nbsp;&nbsp;</td>
    <td>Yes</td>
  </tr>

  <tr>
    <td>z</td>
    <td>&nbsp;&nbsp;&nbsp;&nbsp;</td>
    <td>Linux</td>
    <td>&nbsp;&nbsp;</td>
    <td>No</td>
  </tr>

  <tr>
    <td>George L</td>
    <td>&nbsp;&nbsp;&nbsp;&nbsp;</td>
    <td><b>George</b>'s <b>L</b>inux Machine</td>
    <td>&nbsp;&nbsp;</td>
    <td>Yes</td>
  </tr>
</table>

### Operators

You may prefix a phrase in the search query with an *operator* to narrow your query. Only two operators are defined:

 * The *name:* operator only tries to match words in the profile's name.
 * The *tag:* operator only tries to match words in the profile's tags.

### Quoting

You can require that two or more words occur in order by putting quotes in your query. For example:

<table style="background: white; column-gap: 40px">
  <tr class="tableheader">
    <th style>Query</th>
    <td>&nbsp;&nbsp;&nbsp;&nbsp;</td>
    <th>Profile Name</th>
    <th>Matches?</th>
  </tr>

  <tr>
    <td>"Linux machine"</td>
    <td>&nbsp;&nbsp;&nbsp;&nbsp;</td>
    <td>George's <b>Linux machine</b></td>
    <td>Yes</td>
  </tr>

  <tr>
    <td>"machine Linux"</td>
    <td>&nbsp;&nbsp;&nbsp;&nbsp;</td>
    <td>Linux machine</td>
    <td>No</td>
  </tr>

</table>

### Anchoring

Normally, words in a query must match a substring of a word in the title or tags of a profile. You can require that a word in your query matches a prefix of a word in the title or tags by inserting a caret (^) before the word. You can require that a word in your query matches the suffix of a word in the title or tags by appending a dollar sign ($) after the word. For example, the query *^a* matches only profiles with words starting with "a". The query *a$* matches words ending in "a". The query *^a$* matches only the word "a".

<table style="background: white">
  <tr class="tableheader">
    <th style>Query</th>
    <td>&nbsp;&nbsp&nbsp;&nbsp;</td>
    <th>Profile Name</th>
    <th>Matches?</th>
  </tr>

  <tr>
    <td>^root</td>
    <td>&nbsp;&nbsp;&nbsp;&nbsp;</td>
    <td>root@example.com</td>
    <td>Yes</td>
  </tr>

  <tr>
    <td>^root</td>
    <td>&nbsp;&nbsp;&nbsp;&nbsp;</td>
    <td>Groot!</td>
    <td>No</td>
  </tr>

  <tr>
    <td>root$</td>
    <td>&nbsp;&nbsp;&nbsp;&nbsp;</td>
    <td>Groot</td>
    <td>Yes</td>
  </tr>

  <tr>
    <td>^root$</td>
    <td>&nbsp;&nbsp;&nbsp;&nbsp;</td>
    <td>Groot</td>
    <td>No</td>
  </tr>

  <tr>
    <td>^root$</td>
    <td>&nbsp;&nbsp;&nbsp;&nbsp;</td>
    <td>root</td>
    <td>Yes</td>
  </tr>

</table>

### Combining Features

You may combine quoting, operators, and anchors. The operator always comes first, followed by a caret, followed by a quoted string, followed by a dollar sign. Consider the following examples:

<pre>name:^"George's Linux Machine"$</pre>

Three consecutive whole words in the profile's name must equal "George's Linux Machine".

<pre>name:"George's Linux Machine"$</pre>

Would match a profile named "XGeorge's Linux Machine", unlike the previous example.

<pre>name:^"George's Linux Machine"</pre>

Would match a profile named "George's Linux MachineX", unlike the first example.

<pre>name:"George's Linux Machine"</pre>
Would match a profile named "XGeorge's Linux MachineX", unlike the first example.

<pre>name:^George's
name:George's$
name:^George's$
</pre>

A word having the prefix, suffix, or exactly matching "George's" must occur in the profile's name to match these queries, respectively.

