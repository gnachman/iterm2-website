iTerm2 offers support for "coprocesses". This very powerful feature will allow you to interact with your terminal session in a new way.
#### What is a Coprocess?
A coprocess is a job, such as a shell script, that has a special relationship with a particular iTerm2 session. All output in a terminal window (that is, what you see on the screen) is also input to the coprocess. All output from the coprocess acts like text that the user is typing at the keyboard.

One obvious use of this feature is to automate interaction. For instance, suppose you want to automate your presence in a chat room. The following script could be used as a coprocess:


    #!/usr/bin/python
    import sys
    while True:
      line = raw_input()
      if line.strip() == "Are you there?":
        print "Yes"
      sys.stdout.flush()

You could disappear for years before your friends discover you're gone.
#### How Do I Start a Coprocess?
There are two ways to start a coprocess.

1. Select "Run Coprocess..." from the Session menu. Enter the name of a command to run as a coprocess.

2. Create a Trigger in Prefs>Profiles>Advanced and select Run Coprocess... as the action. Give the script to run as a parameter. Triggers also have Silent Coprocesses, which prevent any output from going to the screen. This is useful for ZModem, for example.

#### Usage
A session can not have more than one coprocess at a time. When a coprocess is active, an icon will indicate that in the top right of the session.

#### Troubleshooting
If a coprocess fails you will receive a notification in the terminal window that gives you the option to view its output to stderr.

#### Technical Details
The coprocess's stdin is a byte-for-byte copy of the input from the session's pty, beginning at the time the coprocess starts. In the case of a trigger-started coprocess, the line of input that triggered it MAY be the first line of input to the coprocess, but this is not guaranteed. If a coprocess is running, triggers with a Run Coprocess action will not fire. The coprocess's stdout stream will be treated the same as keyboard input. A small amount of buffering is provided for both input and output of the coprocess. When a buffer fills, the coprocess will block.
