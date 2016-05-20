---
layout: default
title: FinalTerm Escape Sequences - iTerm2 - Mac OS Terminal Replacement
---

## FinalTerm Escape Sequences

iTerm2's <a href="shell_integration.html">Shell Integration</a> feature is made
possible by proprietary escape sequences pioneered by the FinalTerm emulator.
FinalTerm is defunct, but the escape sequences are documented here.

### Definitions

  * `OSC` stands for *Operating System Command*. In practice it refers to this
sequence of two ASCII characters: 27, 93 (`esc ]`).
  * `ST` stands for *String Terminator*. It terminates an OSC sequence and
consists either of two ASCII characters 27, 92 (`esc \`) or ASCII 7 (`bel`).

OSC sequences always begin with `OSC`, are followed by a sequence of
characters, and are terminated with `ST`.

Most `OSC` codes begin with a number (one or more decimal digits), which we'll
call the "command" in this document. If the command takes parameters it will be
followed by a semicolon and the structure of the rest of the body of the `OSC`
sequence is dependent on the command. Well-behaved terminal emulators ignore
`OSC` codes with unrecognized commands.

### Concepts

The goal of the FinalTerm escape sequences is to mark up a shell's output with
semantic information about where the prompt begins, where the user-entered
command begins, and where the command's output begins and ends.

**[PROMPT]**prompt% **[COMMAND_START]** ls -l<br>
**[COMMAND_EXECUTED]**<br>
-rw-r--r--  1 user group   127 May  1  2016 filename<br>
**[COMMAND_FINISHED]**

### Escape Sequences

FinalTerm originally defined various escape sequences in its original spec that
are not supported by iTerm2 and are not described in this document. The best
remaining references to these codes are in iTerm2's source code.

#### FTCS_PROMPT

`OSC 1 3 3 ; A ST`

Sent just before start of shell prompt.

#### FTCS_COMMAND_START

`OSC 1 3 3 ; B ST`

Sent just after end of shell prompt, before the user-entered command.

#### FTCS_COMMAND_EXECUTED

`OSC 1 3 3 ; C ST`

Sent just before start of command output. All text between `FTCS_COMMAND_START`
and `FTCS_COMMAND_EXECUTED` at the time `FTCS_COMMAND_EXECUTED` is received
excluding terminal whitespace is considered the command the user entered. It is
expected that user-entered commands will be edited interactively, so the screen
contents are captured without regard to how they came to contain their state.
If the cursor's location is before (above, or if on the same line, left of) its
location when `FTCS_COMMAND_START` was received, then the command will be
treated as the empty string.

#### FTCS_COMMAND_FINISHED

`OSC 1 3 3 ; D ; Ps ST`

`OSC 1 3 3 ; D ST` (for cancellation only)

The interpretation of this command depends on which `FTCS` was most recently
received prior to `FTCS_COMMAND_FINISHED`.

This command may be sent after `FTCS_COMMAND_START` to indicate that a command
was aborted. All state associated with the preceding prompt and the command
until its receipt will be deleted. Either form is accepted for an abort. If the
Ps argument is provided to an abort it will be ignored.

If this command is sent after `FTCS_COMMAND_EXECUTED`, then it indicates the
end of command prompt. Ps is the command's exit status, a number in the range
0-255 represented as one or more ASCII decimal digits. A status of 0 is
considered "success" and nonzero indicates "failure." The terminal may choose
to indicate this visually.

If neither `FTCS_COMMAND_START` nor `FTCS_COMMAND_EXECUTED` was sent prior to
`FTCS_COMMAND_FINISHED` it should be ignored.

### iTerm2 Extensions

iTerm2 extends FinalTerm's suite of escape sequences.

#### SetUserVar

`OSC 1 3 3 7 ; S e t U s e r V a r = Ps1 = Ps2 ST`

Sets the value of a user-defined variable. iTerm2 keeps a dictionary of
key-value pairs which may be used within iTerm2 as string substitutions, such
as in the <a href="/badges.html">Badge</a>.

Ps1 is the key.

Ps2 is the base64-encoded value.

#### ShellIntegrationVersion

`OSC 1 3 3 7 ; S h e l l I n t e g r a t i o n V e r s i o n = Pn ; Ps ST`

`OSC 1 3 3 7 ; S h e l l I n t e g r a t i o n V e r s i o n = Pn ST` (deprecated)

Reports the current version of the shell integration script.

Pn is the version.

Ps is the name of the shell (e.g., `bash`).

iTerm2 has a baked-in notion of the "current" version and if it sees a lower
number the user will be prompted to upgrade. The version number is specific to
the shell.

#### RemoteHost

`O S C 1 3 3 7 ; R e m o t e H o s t = Ps1 @ Ps2 ST`

Reports the user name and hostname.

Ps1 is username.
Ps2 is fully-qualified hostname.

#### CurrentDir

`O S C 1 3 3 7 ; C u r r e n t D i r = Ps1 ST`

Reports the current directory.

Ps1 is the current directory.

