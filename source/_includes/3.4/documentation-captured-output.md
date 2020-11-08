iTerm2 has a feature called "Captured Output" which helps you find and track important lines of output from logs, build processes, and such.

<center><img src="/img/screenshots/v3-screen-shots/iterm2-captured-output.gif"></center>

### What does it do?

Captured Output is a tool that may be added to iTerm2's toolbelt (a view on the right side of terminal windows). It works in conjunction with user-defined <a href="https://www.iterm2.com/triggers.html">Triggers</a>. A Trigger whose action is *Capture Output* looks for lines of output that match its regular expression. When one is found, the entire line is added to the Captured Output tool. When the user clicks on a line in the Captured Output tool, iTerm2 scrolls to reveal that line. Double-clicking on a line in the Captured Output tools run a user-defined <a href="https://www.iterm2.com/coprocesses.html">Coprocess</a>.

### Shell Integration Required
<a href="https://www.iterm2.com/shell_integration.html">Shell Integration</a> must be installed because Captured Output ties in to command history.

### Example

One way to use Captured Output is to view compiler output. Suppose you run *make* and get thousands of lines of output, some of which may contain errors or warnings. You'd like to examine each one and take some action on it. Here's how you would use Captured Output to assist with this task:

#### Step 1: Create Triggers

<a href="/documentation-triggers.html">Create a Trigger</a> that matches your compiler's errors and warnings. Clang's errors look like this:
<pre>
filename.c:54:9: error: use of undeclared identifier 'foo'
</pre>

The following regular expression matches errors and warnings from Clang:

<pre>
^([_a-zA-Z0-9+/.-]+):([0-9]+):[0-9]+: (?:error|warning):
</pre>

There are two capture groups defined. We'll come back to those later.

#### Step 2: Open the Toolbelt

Open the Toolbelt by selecting the menu item Toolbelt &gt; Show Toolbelt. Enable the Toolbelt &gt; Captured Output menu item to ensure it is visible.

#### Step 3: Run make

Kick off the build by running make. It spits out thousands of lines of output.

#### Step 4: Examine the Captued Output tool

Any errors or warnings that appear in the compiler output will appear in the Captured Output tool.

<img src="/images/CapturedOutput.png">
Select an entry in the tool. iTerm2 scrolls to display the line and briefly highlights it in blue.

#### Step 5: Open the file containing the error

The Trigger created in step 1 takes an optional parameter. It is a command for iTerm2 to exceute as a <a href="https://www.iterm2.com/coprocesses.html">Coprocess</a> when you double-click an entry in the Captured Output tool. An example command is:

<pre>
echo vim \1; sleep 0.5; echo \2G
</pre>

This coprocess command assumes you are at the command line, and it enters a command to open the offending file to the line number with an error. This is where the capture groups in the regular expression from step 1 become useful. For example, if the filename was "filename.c" and the error was on line 20, as in this error message:

<pre>
filename:c:20:9 error: use of undeclared identifier 'foo'
</pre>

The coprocess would:

  * Type "vim filename.c", followed by enter, as though you were typing it at the keyboard.</li>
  * Wait half a second.</li>
  * Type "20G".</li>

#### Step 6: Check it off the list

You can right-click on an entry in Captured Output to open a menu, which contains a single item: "Toggle Checkmark". This helps you remember which entries have been dealt with as you go through errors and warnings in your compiler output.

### Navigation

Captured Output is linked to the Command History tool. If no command is selected in the Command History tool, then the most recent captured output is displayed. Otherwise, the captured output from the selected command is displayed. You can remove a selection from the Command History tool by cmd-clicking on it.

## Clearing Captured Output

You can use the `ClearCapturedOutput` control sequence to remove captured output. This is useful to do before starting a compilation which may produce errors. Doing so ensures the only captured errors are from the most recent build. Use the following command in bash to produce the control sequence:

`printf "\e]1337;ClearCapturedOutput\e\\"`
