iTerm2 is able to display images within the terminal. Using a similar mechanism, it can also facilitate file transfers over any transport (such as ssh or telnet), even in a non-8-bit-clean environment.

<div style="border: 1px solid black; margin: 8px; padding: 4px">
Just want to try it out and don't care about the protocol? Use the imgcat tool. <a href="/utilities/imgcat">Download imgcat here</a>
</div>


### Example: imgcat

Using the <a href="/utilities/imgcat">imgcat</a> script, one or more images may be displayed in a terminal session. For example:

<img src="images/inline_image_sparky_demo.png">

Critically, animated GIFs are supported as of version 2.9.20150512.

### Protocol

iTerm2 extends the xterm protocol with a set of proprietary escape sequences. In general, the pattern is:

<pre>ESC ] 1337 ; key = value ^G</pre>

Whitespace is shown here for ease of reading: in practice, no spaces should be used.

For file transfer and inline images, the code is:

<pre>ESC ] 1337 ; File = [arguments] : base-64 encoded file contents ^G</pre>

The arguments are formatted as <code>key=value</code> with a semicolon between each key-value pair. They are described below:

A second code is also available to split a large file up into multiple codes. This used in tmux since it has a limit on code size.

Start with:

<pre>ESC ] 1337 ; MultipartFile = [arguments] : base-64 encoded file contents ^G</pre>

And then send one or more:

<pre>ESC ] 1337 ; FilePart = a chunk of base-64 encoded file contents ^G</pre>

After the last part has been sent:

<pre>ESC ] 1337 ; FileEnd ^G</pre>

<table>
<tr>
  <th>Key</th><td></td><th>Description of value</th>
</tr><tr>
  <td>name</td><td>&nbsp;&nbsp;</td><td>base-64 encoded filename. Defaults to "Unnamed file".</td>
</tr><tr>
<td>size</td><td>&nbsp;&nbsp;</td><td>File size in bytes. The file transfer will be canceled if this size is exceeded.</td>
</tr><tr>
<td>width</td><td>&nbsp;&nbsp;</td><td>Optional. Width to render. See notes below.</td>
</tr><tr>
<td>height</td><td>&nbsp;&nbsp;</td><td>Optional. Height to render. See notes below.</td>
</tr><tr>
<td>preserveAspectRatio</td><td>&nbsp;&nbsp;</td><td>Optional. If set to 0, then the image's inherent aspect ratio will not be respected; otherwise, it will fill the specified width and height as much as possible without stretching. Defaults to 1.</td>
</tr><tr>
<td>inline</td><td>&nbsp;&nbsp;</td><td>Optional. If set to 1, the file will be displayed inline. Otherwise, it will be downloaded with no visual representation in the terminal session. Defaults to 0.</td>
<td>type</td><td>&nbsp;&nbsp;</td><td>Optional. An advisory file type. For example, `image/jpeg` or `.jpg`. For text files, this enables native rendering (e.g., `text/markdown`). By default the type is auto-detected.</td>
<td>mode</td><td>&nbsp;&nbsp;</td><td>Optional. For textual content. Set this to either `regular` or `wide`. `wide` content will have a horizontal scrollbar if needed.</td>
</tr>
</table>

The width and height are given as a number followed by a unit, or the word "auto".

  * *N*: *N* character cells.</li>
  * *N*px: *N* pixels.</li>
  * *N*%: *N* percent of the session's width or height.</li>
  * auto: The image's inherent size will be used to determine an appropriate dimension.</li>

The cursor will be left at the cell that follows the bottom-rightmost cell of the image.

### More on File Transfers

By omitting the <code>inline</code> argument (or setting its value to 0), files will be downloaded and saved in the *Downloads* folder instead of being displayed inline. Any kind of file may be downloaded, but only images will display inline. Any image format that macOS supports will display inline, including PDF, PICT, or any number of bitmap data formats (PNG, GIF, etc.). A new menu item titled *Downloads* will be added to the menu bar after a download begins, where progress can be monitored and the file can be located, opened, or removed.

If the file's size exceeds the declared size, the transfer may be canceled. This is a security measure to prevent a download gone wrong from using unbounded memory.

### Sample Code

Sample code for displaying images may be found here.

####<a href="/utilities/imgls">imgls</a>

Provides an augmented directory listing that includes a thumbnail of each image in a directory.

#### <a href="/utilities/imgcat">imgcat</a>

Displays one or more images inline at their full size.

#### <a href="/utilities/it2dl">it2dl</a>

Downloads a file, but does not display it inline.

#### <a href="https://raw.githubusercontent.com/gnachman/iTerm2/master/tests/divider">divider</a>

Draws a full-width, one line-tall graphical divider.

<img src="/images/inline_images_divider.png">

