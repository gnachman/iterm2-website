---
layout: docs
title: Feature Reporting Spec - iTerm2 - macOS Terminal Replacement
active-state: documentation
---
# Terminal Feature Reporting

### Summary
This specification defines a way for terminal emulators to report their capabilities to applications. This proposed standard defines a collection of values that terminals will communicate to apps. It will be exposed through a new `TERM_FEATURES` environment variable and also a to-be-determined control sequence.

### Motivation
Terminal emulators need a flexible way to report their capabilities to applications that communicate with them. The existing mechanism of `$TERM` is too slow to change because terminfo updates happen too infrequently in practice, and individual users may have no ability to fix it without root access.

## Introduction
The `TERM_FEATURES` protocol provides terminal emulators a way to tell applications running within them about their features. A feature has a name and a value.

### Types
Values may take the following types:

* Boolean — True meaning the feature is supported or False meaning it is not supported. The default is False.
* UInt — A non-negative, finite number, with a fixed size in bits. The default is zero. Applications should ignore bits beyond those in the version of the spec they know: such bits may be from future versions of the spec.

### Notation
Control sequences will use some notational shortcuts:

* Byte literals will be given in hex notation or as a character or string literal. For example, `0x41` and `A` are equivalent.
* A series of characters will be written in double quotes, like `"s0"`.
* `ESC` is a synonym for `0x1b`.
* `CSI` is a synonym for `ESC [`.
* `OSC` is a synonym for `ESC ]`.
* `SP` is a synonym of `0x20`.
* `ST` is a synonym for `ESC 0x5c`.
* `DECSET({code})` is a synonym for `CSI ? {code} h`.
* `DECRST({code})` is a synonym for `CSI ? {code} l`.
* `SGR({args})` is a synonym for `CSI {args} m` where `{args}` is a semicolon-delimited list of elements.
* Values in `{braces}` will be described in the accompanying test, and should be substituted appropriately.
* Whitespace in this grammar description is insignificant. Where it describes significant space characters, they will be notated as `SP`.
* Values in `<angle brackets>` will be described in the text.

Some features can be partially or fully validated by [esctest](https://gitlab.freedesktop.org/terminal-wg/esctest) or by using accompanying files. This will be noted in each feature.

When `base64` is used in this document, it is meant as:

* RFC 4648 section 4.
* No line feeds, carriage returns, or other whitespace is allowed, unless otherwise specified.
* Padding with `=` at the end must be included.
* Only the characters in Table 1 of the RFC are allowed.


## Table Stakes

Terminal emulators supporting this protocol must, at a minimum, support the features in this section as specified. These come from VT100, VT220, ECMA-48, and other standards.

### Parsing

`SGR`, `DECSET`, and `DECRST` with at least 15 parameters (including colon-delimited subparameters) must be supported. Parameters should be processed in order.

Unrecognized but well-formed `CSI`, `OSC`, `DCS`, and `APC` codes (see ECMA-64) must be properly parsed and ignored.

The parser must default to interpreting CSI sequences differing in any combination of '>', '=', '<' and '?' after `CSI` or `0x20` to `0x2f` before the final character to be distinct.

Note: While terminals must be able to ignore sequences with multiple intermediate bytes it is not expected that assigned codes with those will be assigned in the near future.

#### Testing

The scripts [aliasing.sh](aliasing.sh) and [parser_unknown.sh](parser_unknown.sh) contain some basic but be far not complete tests.


### 256 Colors

These control sequences change the foreground and background colors:

|Code|Effect|
|---|---|
|`CSI 38 ; 5 ; {fg} m`|Sets the foreground color to `{fg}`.|
|`CSI 48 ; 5 ; {bg} m`|Sets the background color to `{bg}`.|

The `{fg}` and `{bg}` values are interpreted as an index into a color table that is initialized with the following values:

|Values|Meaning|
|---|---|
|0-7|Normal intensity ANSI colors|
|8-15|Bright intensity ANSI colors|
|16-255|See [256_color_rgb.txt](256_color_rgb.txt) for sRGB values|

Note that terminals may allow the user or control sequences to change these colors.

#### esctest

Use the following tests to validate that the control sequences are parsed correctly and persisted:

* `SGRTests.test_SGR_256Color_Foreground`
* `SGRTests.test_SGR_256Color_Background`

## Features

This section lists features. Each feature has a canonical name, which is the section’s title.

### 24BIT

UInt (2 bits). Takes a bitwise OR of the following values:

|Value|Meaning|
|---|---|
|1|Supports the compatibility control sequences.|
|2|Supports the full control sequences.|

The compatibility control sequences are:

|Code|Effect|
|---|---|
|`CSI 38 ; 2 ; {red} ; {green} ; {blue} m`|Sets the foreground color using RGB values where `{red}`, `{green}`, and `{blue}` are integers in [0,255].|
|`CSI 48 ; 2 ; {red} ; {green} ; {blue} m`|Sets the background color using RGB values where `{red}`, `{green}`, and `{blue}` are integers in [0,255].|

The colorspace is sRGB.

The full control sequences are:

|Code|Effect|
|---|---|
|`CSI 38 : 2 : {colorspace} : {red} : {green} : {blue} <more subparameters> m`|Same as `CSI 38 ; 2 ; {red} ; {green} ; {blue} m`|
|`CSI 48 : 2 : {colorspace} : {red} : {green} : {blue} <more subparameters> m`|Same as `CSI 48 ; 2 ; {red} ; {green} ; {blue} m`|

The `<more subparameters>`, if present, should be ignored. This makes it possible to evolve this control sequence in the future.

Terminals should ignore `{colorspace}` and use sRGB. `{red}`, `{green}`, and `{blue}` take values in 0 through 255 inclusive.

#### Application Notes

Because this syntax uses colons to delimit its parameters, other `SGR` codes could come before the 38/48 or after the last subparameter, as usual in `SGR`. Applications should leave `{colorspace}` empty.

#### esctest

Use the following tests to validate that the compatibility control sequences are parsed correctly and persisted:

* `SGRTests.test_SGR_24BitCompat_Foreground`
* `SGRTests.test_SGR_24BitCompat_Background`

Use the following tests to validate that the full control sequences are parsed correctly and persisted:

* `SGRTests.test_SGR_24BitITU_Foreground`
* `SGRTests.test_SGR_24BitITU_Background`

### CLIPBOARD_WRITABLE

Boolean. Indicates if the terminal allows saving to the clipboard using this sequence:

```
OSC 52 ; {clipboard} ; {base64-data} ST
```

Where `{clipboard}` is either empty or `"s0"` and `{base64-data}` is base-64 encoded bytes to put on the clipboard. The character encoding will be UTF-8, both for the encoded and decoded payload. 

Terminals should not advertise this feature if the user has disabled it. Terminals may advertise the feature if the terminal supports it conditionally: for example, if the user must consent when an application tries to use this control sequence, or if it requires recent interaction with the terminal.

Terminals may accept other values for `{clipboard}`. That behavior is not specified here.

#### Test File

A terminal receiving the contents of [clipboard_writable_test.txt](clipboard_writable_test.txt) should copy `Hello world!` to the default clipboard.

### DECSLRM

Boolean. Indicates if the terminal supports setting the left-right margins. The relevant control sequences are:

|Code|Meaning|
|---|---|
|`DECSET(69)`|Enables left-right margins.|
|`CSI {left} ; {right} s`|Sets the left-right margins.|
|`DECRST(69)`|Disables left-right margins.|

#### Testing

The `decsrlm.txt` file contains a very basic test of DECSLRM support.

#### esctest

Use the following tests to validate support for `DECSLRM`. If a test depends on a feature the terminal emulator does not support (such as origin mode) then it can be considered optional.

* `BSTests.test_BS_ReverseWrapWithLeftRight`
* `BSTests.test_BS_ReversewrapFromLeftEdgeToRightMargin`
* `BSTests.test_BS_StopsAtLeftMargin`
* `BSTests.test_BS_MovesLeftWhenLeftOfLeftMargin`
* `CBTTests.test_CBT_IgnoresRegion`
* `CHATests.test_CHA_IgnoresScrollRegion`
* `CHTTests.test_CHT_IgnoresScrollingRegion`
* `CNLTests.test_CNL_StopsAtBottomLineWhenBegunBelowScrollRegion`
* `CNLTests.test_CNL_StopsAtBottomMarginInScrollRegion`
* `CPLTests.test_CPL_StopsAtTopLineWhenBegunAboveScrollRegion`
* `CPLTests.test_CPL_StopsAtTopMarginInScrollRegion`
* `CRTests.test_CR_MovesToLeftMarginWhenRightOfLeftMargin`
* `CRTests.test_CR_MovesToLeftOfScreenWhenLeftOfLeftMargin`
* `CRTests.test_CR_StaysPutWhenAtLeftMargin`
* `CRTests.test_CR_MovesToLeftMarginWhenLeftOfLeftMarginInOriginMode`
* `CUBTests.test_CUB_StopsAtLeftEdgeWhenBegunLeftOfScrollRegion`
* `CUBTests.test_CUB_StopsAtLeftMarginInScrollRegion`
* `CUFTests.test_CUF_StopsAtRightEdgeWhenBegunRightOfScrollRegion`
* `CUFTests.test_CUF_StopsAtRightMarginInScrollRegion`
* `DCHTests.test_DCH_RespectsMargins`
* `DCHTests.test_DCH_DeleteAllWithMargins`
* `DCHTests.test_DCH_DoesNothingOutsideLeftRightMargin`
* `DECALNTests.test_DECALN_ClearsMargins`
* `DECBITests.test_DECBI_Scrolls`
* `DECBITests.test_DECBI_LeftOfMargin`
* `DECCRATests.test_DECCRA_ignoresMargins`
* `DECDCTests.test_DECDC_CursorWithinTopBottom`
* `DECDCTests.test_DECDC_IsNoOpWhenCursorBeginsOutsideScrollRegion`
* `DECDCTests.test_DECDC_DeleteAllWithLeftRightMargins`
* `DECFITests.test_DECFI_Scrolls`
* `DECFITests.test_DECFI_RightOfMargin`
* `DECICTests.test_DECIC_CursorWithinTopBottom`
* `DECICTests.test_DECIC_IsNoOpWhenCursorBeginsOutsideScrollRegion`
* `DECICTests.test_DECIC_ScrollOffRightMarginInScrollRegion`
* `DECRQSSTests.test_DECRQSS_DECSLRM`
* `DECSCLTests.test_DSCSCL_Level3_SupportsDECRQMDoesntSupportDECSLRM`
* `DECSCLTests.test_DECSCL_Level4_SupportsDECSLRMDoesntSupportDECNCSM`
* `DECSEDTests.test_DECSED_0_WithScrollRegion`
* `DECSEDTests.test_DECSED_1_WithScrollRegion`
* `DECSEDTests.test_DECSED_2_WithScrollRegion`
* `DECSEDTests.test_DECSED_0_WithScrollRegion_Protection`
* `DECSEDTests.test_DECSED_1_WithScrollRegion_Protection`
* `DECSEDTests.test_DECSED_2_WithScrollRegion_Protection`
* `DECSELTests.test_DECSEL_IgnoresScrollRegion`
* `DECSELTests.test_DECSEL_IgnoresScrollRegion_Protection`
* `DECSETTests.test_DECSET_DECLRMM`
* `DECSETTests.test_DECSET_DECLRMM_MarginsResetByDECSTR`
* `DECSETTests.test_DECSET_DECLRMM_ModeNotResetByDECSTR`
* `DECSTRTests.test_DECSTR_DECLRMM`
* `DLTests.test_DL_InLeftRightScrollRegion`
* `DLTests.test_DL_OutsideLeftRightScrollRegion`
* `DLTests.test_DL_InLeftRightAndTopBottomScrollRegion`
* `DLTests.test_DL_ClearOutLeftRightAndTopBottomScrollRegion`
* `DLTests.test_DL_OutsideLeftRightAndTopBottomScrollRegion`
* `ECHTests.test_ECH_IgnoresScrollRegion`
* `ECHTests.test_ECH_OutsideScrollRegion`
* `EDTests.test_ED_0_WithScrollRegion`
* `EDTests.test_ED_1_WithScrollRegion`
* `EDTests.test_ED_2_WithScrollRegion`
* `ELTests.test_EL_IgnoresScrollRegion`
* `FFTests.test_FF_MovesDoesNotScrollOutsideLeftRight`
* `FillRectangleTests.fillRectangle_ignoresMargins`
* `ICHTests.test_ICH_IsNoOpWhenCursorBeginsOutsideScrollRegion`
* `ICHTests.test_ICH_ScrollOffRightMarginInScrollRegion`
* `ILTests.test_IL_RespectsScrollRegion`
* `ILTests.test_IL_RespectsScrollRegion_Over`
* `ILTests.test_IL_AboveScrollRegion`
* `INDTests.test_IND_MovesDoesNotScrollOutsideLeftRight`
* `LFTests.test_LF_MovesDoesNotScrollOutsideLeftRight`
* `NELTests.test_NEL_MovesDoesNotScrollOutsideLeftRight`
* `REPTests.test_REP_RespectsLeftRightMargins`
* `RITests.test_RI_MovesDoesNotScrollOutsideLeftRight`
* `RISTests.test_RIS_RemoveMargins`
* `SaveRestoreCursorTests.test_SaveRestoreCursor_ResetsOriginMode`
* `SaveRestoreCursorTests.test_SaveRestoreCursor_WorksInLRM`
* `SDTests.test_SD_RespectsLeftRightScrollRegion`
* `SDTests.test_SD_OutsideLeftRightScrollRegion`
* `SDTests.test_SD_LeftRightAndTopBottomScrollRegion`
* `SDTests.test_SD_BigScrollLeftRightAndTopBottomScrollRegion`
* `SMTests.test_SM_IRM_TruncatesAtRightMargin`
* `SUTests.test_SU_RespectsLeftRightScrollRegion`
* `SUTests.test_SU_OutsideLeftRightScrollRegion`
* `SUTests.test_SU_LeftRightAndTopBottomScrollRegion`
* `SUTests.test_SU_BigScrollLeftRightAndTopBottomScrollRegion`
* `VTTests.test_VT_MovesDoesNotScrollOutsideLeftRight`

### MOUSE

Boolean. Does the terminal support mouse reporting with at least the following control sequences:

* `DECSET(1000)`
* `DECRST(1000)`
* `DECSET(1002)`
* `DECRST(1002)`
* `DECSET(1003)`
* `DECRST(1003)`
* `DECSET(1006)`
* `DECRST(1006)`

**Reporting Formats**

Traditionally, terminals have supported a number of formats to report mouse events like button clicks, movement, and drags. The older modes had compatibility problems with large terminals and UTF-8. For that reason, terminals advertising support for this feature must implement `DECSET 1006`, which is safe to use. The older reporting formats may be supported as well, but this document is not concerned with them. See the section **DECSET(1006)** for details about how to format a mouse report.

**DECSET(1000): Normal tracking mode.**

`Normal tracking mode` sends a report on button press and release.

**DECSET(1002): Button event tracking.**

Like `Normal tracking mode`, but includes movements of the mouse while a button is pressed. Motion events are reported only when the mouse moves to another cell.

**DECSET(1003): Any event tracking.**

Like `Button event tracking mode`, but includes movements of the mouse while no button is pressed.

**DECSET(1006): SGR extended coordinates mode.**

Terminals usually use an outmoded and problematic encoding of mouse state in their default configuration. `DECSET(1006)` enables the modern reporting sequence, as described below.

When repeating that a button was released, send:

```
CSI < {params} m
```

For all other events, send:

```
CSI < {params} M
```

Where `{params}` is defined as three numbers represented in decimal using ASCII digits (e.g., “123”), separated by semicolons. The values are:

1. The button/modifiers value, described below.
2. The X coordinate, where 1 is the leftmost column and increasing as you move right.
3. The Y coordinate, where 1 is the topmost row and increasing as you move down.

The button/modifiers value is calculated by bitwise ORing values from this table.

|Value|Meaning|Modes|
|--- |--- |--- |
|0|Left mouse button pressed.|All|
|1|**When 64 is included**: Scroll wheel moved up (if present) or scroll wheel moved down (if absent). **Otherwise**: Right mouse button pressed.|All|
|2|Other (typically middle, but platform-defined) button pressed.|All|
|3|**When 32 is included**: No button pressed. **Otherwise**: Undefined.|1003|
|4|Shift modifier pressed.|All|
|8|Meta (or platform-defined equivalent, typically Alt or Option) modifier pressed.|All|
|16|Control modifier pressed.|All|
|32|Mouse moved.|All|
|64|Use scroll wheel interpretation for 1.|All|

The behavior when multiple buttons are pressed at the same time is platform-defined.

Because of the limitations of the platform that a terminal emulator operates in, some combinations of mouse buttons and modifiers may not be supported. Terminal emulators may report this feature so long as left mouse button down, up, and drag works.

**DECSET(1007): Alternate scroll**

When enabled and when the terminal is in alternate screen mode, the scroll wheel causes the terminal emulator to send cursor up and cursor down keys.

##### Precedence

`DECSET(1000)`, `DECSET(1002)`, and `DECSET(1003)` take precedence over `DECSET(1007)` if both `1007` and one of the other modes is enabled at the same time.

If more than one of `1000`, `1002`, and `1003` are on, the most recently enabled mode takes precedence and automatically disables the previous mode. For example, this sequence disables mouse reporting: `DECSET(1000), DECSET(1003), DECRST(1003)`.

#### Application Notes

Applications are advised to always set `1006` along with exactly one of: `1000`, `1002`, or `1003`. When exited or suspended, applications should `DECRST(1006)` along with a corresponding `DECRST` of whichever of `1000`, `1002`, or `1003` they enabled. To avoid race conditions, set `1006` before `1000`/`1002`/`1003` and reset `1006` after resetting `1000`/`1002`/`1003`.

Applications should ignore any subfeature flags they do not recognize.

#### Tests

See the accompanying file [mouse_test.sh](mouse_test.sh). It tests DECSET 1000, 1002, 1003, and 1006.

### DECSCUSR

UInt (3 bits). Indicates the features of `DECSCUSR` the terminal supports. It is a bitmask from these values:

|Value|Meaning|
|---|---|
|0|No support|
|1|Supports modes 1 through 4, as described below.|
|2|Supports modes 5 and 6, as described below.|
|4|Supports mode 0 to reset the cursor to the terminal emulator-defined default state.|

When `4` is not present, mode 0 is the same as mode 1.

```
CSI {mode} SP q
```

This will change the cursor shape depending on mode:

|Mode|Meaning|
|---|---|
|1|Blinking block|
|2|Steady block|
|3|Blinking underline|
|4|Steady underline|
|5|Blinking bar|
|6|Steady bar|

Terminals may choose not to make the cursor blink at their discretion, since some people find it annoying.

#### Application Notes

Some terminal emulators allow interaction between `DECSCUSR` and the following control sequences:

* `DECSET(12)`/`DECRST(12)`/`DECRQM(12)`.
* `DECSET(13)`/`DECRST(13)`/`DECRQM(13)`.
* `DECSET(14)`/`DECRST(14)`/`DECRQM(14)`.
* `CSI {param} h` where `{param}` is `33` or `34`.

This behavior is implemention-defined.

### UNICODE_BASIC

Boolean. Indicates if UTF-8 is accepted and basic Unicode features are implemented.

In order to advertise this feature, a terminal emulator should accept [unicode_basic_test.txt](unicode_basic_test.txt) and produce output substantially similar to [unicode_basic_test.png](unicode_basic_test.png)

Unicode is big and complex, and it is likely impossible for terminal emulators to conform to all of it and also respect the traditional grid of cells.

This feature is meant to set a very low bar for Unicode support. Other features in this spec advertise additional Unicode features, and more may be added in the future.

#### Application Notes

Applications generally use `wcwidth` or `wcswidth` to infer where the cursor will be positioned after printing text. The terminal emulator must be in exact agreement with the application or visual artifacts will result.

Terminals’ behavior when a control sequence occurs within the bytes of a UTF-8 encoded codepoint, or between the codepoints that represent a grapheme cluster (such as between a base character and a combining mark) is not specified. Applications are advised not to do that.

Applications may expect to see inconsistent behavior between terminal emulators with Wide characters when they appear in unexpected places, such as in the last column, or when a Narrow character overwrites the second cell of a Wide character. This feature does not attempt to address these issues.

### AMBIGUOUS_WIDE

Boolean. Indicates if the terminal emulator will render ambiguous-width characters as full-width, taking two cells. Ambiguous width characters are defined by [Unicode Annex 11](http://www.unicode.org/reports/tr11/tr11-38.html) or [archive](http://archive.is/wip/Zx0PN). The width table depends on the unicode version, as reported with the `UNICODE_WIDTHS` feature. When true, ambiguous characters take two cells. When false, ambiguous characters take a single cell.

#### Tests

The attached [unicode.txt](unicode.txt) gives examples of ambiguous-width characters in different Unicode versions.
Note: no new ambiguous-width characters have been added between Unicode 10 and 13.

### UNICODE_WIDTHS

UInt (6 bits). Gives the currently supported Unicode version. This determines how the `AMBIGUOUS_WIDE` feature is interpreted and also indicates which version of East Asian Widths to use.

The values are:

|Value|Meaning|
|---|---|
|0|No unicode support is claimed.|
|8|Unicode version 8 or less.|
|9 or greater|The Unicode version equal to the value is supported.|
|Special encoding-dependent value, if applicable|Equal to or larger than maximum encodable version.|

#### Tests

The attached [unicode.txt](unicode.txt) gives examples of these features.

### TITLES

UInt (2 bits). The value is a bitmask by ORing the following values:

|Value|Meaning|
|---|---|
|1|Title stacks are supported.|
|2|Title setting is supported.|

#### Title Stacks

|Code|Effect|
|---|---|
|`CSI 22 ; 0 t`|Saves the “icon title” and “window title” on a stack.|
|`CSI 22 ; 1 t`|Saves the “icon title” on a stack.|
|`CSI 22 ; 2 t`|Saves the “window title” on a stack.|
|`CSI 23 ; 0 t`|Restores the “icon title” and “window title” from stack.|
|`CSI 23 ; 1 t`|Restores the “icon title” from stack.|
|`CSI 23 ; 2 t`|Restores the window title from stack.|

#### Title Setting

|Code|Effect|
|---|---|
|`OSC 0 ; {title} ST`|Sets the “window title” and “icon title”.|
|`OSC 1 ; {title} ST`|Sets the “icon title”.|
|`OSC 2 ; {title} ST`|Sets the “window title”.|

The terminal emulator is free to interpret “icon title” as it sees fit. For example, it could be the tab title. The terminal emulator may choose to use a single stack for both icon and window titles or to use separate stacks for them.

The “window title” is generally the text displayed in the terminal emulator’s title bar.

#### Testing

Use [titles.sh](titles.sh) to test if you can save and restore titles.

#### esctest

Terminal emulators should pass the following tests to advertise this feature. Note that while title reporting is required for these tests to succeed, terminal emulators are not required to implement title reporting for the sake of this feature.

* `XtermWinopsTests.test_XtermWinops_PushIconAndWindow_PopIconAndWindow`
* `XtermWinopsTests.test_XtermWinops_PushIconAndWindow_PopIcon`
* `XtermWinopsTests.test_XtermWinops_PushIconAndWindow_PopWindow`
* `XtermWinopsTests.test_XtermWinops_PushIcon_PopIcon`
* `XtermWinopsTests.test_XtermWinops_PushWindow_PopWindow`
* `XtermWinopsTests.test_XtermWinops_PushIconThenWindowThenPopBoth`
* `XtermWinopsTests.test_XtermWinops_PushMultiplePopMultiple_Icon`
* `XtermWinopsTests.test_XtermWinops_PushMultiplePopMultiple_Window`
* `XtermWinopsTests.test_XtermWinops_ReportIconLabel`
* `XtermWinopsTests.test_XtermWinops_ReportWindowLabel`

### BRACKETED_PASTE

Boolean. Indicates if paste bracketing is supported. Terminal emulators must support:

* `DECSET(2004)`
* `DECRST(2004)`

When enabled, pasting from the clipboard will cause the terminal emulator to send:

```
CSI 2 0 0 ~ {Pasted Text} CSI 2 0 1 ~
```

Where `{Pasted Text}` is the text to be pasted (typically from the system's clipboard).

When pasting text, terminal emulators should filter out ASCII control codes 0-8, 11, 12, and 14-31 inclusive (that is, everything but `Tab`, `CR`, and `LF`).  This ensures that `CSI 201 ~` is not embedded in the pasted contents, and also is a good security practice. Terminals must remove or modify embeded `CSI 201 ~` sequences to avoid confusing them with the terminal `CSI 201 ~`.

#### Tests

Run [bracketed_paste_test.sh](bracketed_paste_test.sh) to test your terminal. When prompted, paste a string not containing a newline.

### FOCUS_REPORTING

Boolean. Indicates if focus reporting is supported. Terminal emulators must support:

* `DECSET(1004)`
* `DECRST(1004)`

When enabled, the terminal emulator will send this control sequence when it gains keyboard focus for this terminal:

```
CSI I
```

And when keyboard focus is lost for this terminal, it will send:

```
CSI O
```

#### Tests

Run [focus_test.sh](focus_test.sh) to check your terminal's compatibility.

### STRIKETHROUGH

Boolean. Indicates if the terminal emulator can render strikethrough text. It must support two control sequences:

First, to enable strikethrough:
```
SGR(9)
```

Second, to disable strikethrough:
```
SGR(29)
```

The terminal emulator may allow strikethrough text to coexist with underlined text.

#### Tests

Print [strikethrough.txt](strikethrough.txt) to see an example of struck-through text.

##### esctest

This test verifies that SGR(9) is parsed and persisted properly. The terminal emulator must also render it as a line through the text in order to advertise the feature.

* `SGRTests.test_SGR_Strikethrough`

### OVERLINE

Boolean. Indicates if the terminal emulator can render overlined text. It must support two control sequences:

First, to enable overline:

```
SGR(53)
```

Second, to disable overline:

```
SGR(55)
```

#### Tests

Print [overline.txt](overline.txt) to see an example of overlined text.

##### esctest

This test verifies that `SGR(53)` is parsed and persisted properly. The terminal emulator must also render it as a line over the text in order to advertise the feature.

* `SGRTests.test_SGR_Overline`

### SYNC

Boolean. Indicates if the terminal emulator supports synchronized updates.

The spec is defined here: [https://gitlab.freedesktop.org/terminal-wg/specifications/-/merge_requests/2](https://gitlab.freedesktop.org/terminal-wg/specifications/-/merge_requests/2)

### HYPERLINKS

Boolean. Indicates if the terminal emulator supports `OSC 8` hyperlinks.

The spec is defined in [Hyperlinks_in_Terminal_Emulators.html](Hyperlinks_in_Terminal_Emulators.html).

#### Testing

Print [osc8.txt](osc8.txt) for a demo of OSC 8.

### NOTIFICATIONS

Boolean. Indicates if the terminal emulator supports `OSC 9` notifications.

```
OSC 9 ; {text} ST
```

When received, `{text}` will be displayed to the user outside the normal UI so that even if they are using another application it may still be visible.

#### Testing

Print [osc9.txt](osc9.txt) for a demo of OSC 9.

### SIXEL

Boolean. Indicates if the terminal emulator supports Sixel images.

To conform, printing [snake.six](snake.six) should cause this image to be rendered in the terminal emulator, starting at the cursor’s location at the time the file was printed, and produce a graphic substantially similar to [snake.png](snake.png).

### FILE

Boolean. Indicates if the terminal supports the `OSC 1337 File` protocol for transfer/display of files such as images or video, including those using lossy compression.

It is documented at [Inline Images Protocol](/documentation-images.html).

#### Tests

Print [download.txt](download.txt) to iniate a file download.

Set your terminal to 185 cells wide by 55 rows tall with 7x13 pixel cells and run [inline_media.sh](inline_media.sh) to test your terminal's rendering of inline images.

## Publication

Terminals have two mechanisms they may use to publish their feature set:

* An environment variable, `TERM_FEATURES`.
* A control sequence that responds with a report containing the features.

The control sequence is:

```
OSC 1337 ; Capabilities ST
```

The terminal will respond with:

```
OSC 1337 ; Capabilities = {FeatureString} ST
```

The environment variable `TERM_FEATURES` will take the value `{FeatureString}`.
#### Encoding - OPTION 1

`{FeatureString}` is a string formed by concatenating an encoding of each feature’s value.

A boolean feature is encoded as a short string matching this regular expression:

```
^[A-Z][a-z]*$
```

The code must be present if and only if the terminal emulator wishes to advertise the feature. Its absence implies the feature is not advertised.

An integer-valued feature is encoded as a short string matching this regular expression:

```
^[A-Z][a-z]*[0-9]+$
```

An omitted integer-valued feature implicitly takes the value 0. For example, this string containing made-up features:

```
AbCdEf12GH
```

confers the meaning: _Features Ab, Cd, Ef, G, and H are present. The value of Ef is 12._

More common features should be assigned shorter codes to conserve space.

In order to give the encoding room to grow in the future, any characters at or after a non-alphanumeric should be ignored. In other words, consider only the prefix of `{FeatureString}` matching this regular expression:

```
^[A-Za-z0-9]*
```

The codes are:

|Type|Name|Code|
|--- |--- |--- |
|UInt|24BIT|T|
|Boolean|CLIPBOARD_WRITABLE|Cw|
|Boolean|DECSLRM|Lr|
|Boolean|MOUSE|M|
|UInt|DECSCUSR|Sc|
|Boolean|UNICODE_BASIC|U|
|Boolean|AMBIGUOUS_WIDE|Aw|
|UInt|UNICODE_WIDTHS|Uw|
|UInt|TITLES|Ts|
|Boolean|BRACKETED_PASTE|B|
|Boolean|FOCUS_REPORTING|F|
|Boolean|STRIKETHROUGH|Gs|
|Boolean|OVERLINE|Go|
|Boolean|SYNC|Sy|
|Boolean|HYPERLINKS|H|
|Boolean|NOTIFICATIONS|No|
|Boolean|SIXEL|Sx|
|Boolean|FILE|F|

#### Encoding - OPTION 2

`{FeatureString}` is a base-64 encoded byte array. It will not contain carriage returns, line feeds, or any other white space. If a character outside the legal Base-64 character set is found, remove everything from that character on prior to decoding. The legal characters are:

```
A-Z
a-z
0-9
+
/
=
```

The first 8 bits form a UInt that gives the version number of the spec. The current version number is 0.

Feature values begin at bit offset 8 (after the version number) and progress in the order given in the spec (starting with `24BIT`). Booleans take a single bit, where 0 signifies that the feature is unavailable and 1 signifies that the feature is available. UInts take the number of bits given in the feature's type specification. Each value begins at a bit offset located after the last used bit offset. To convert a bit offset of a particular feature to a byte offset and bitmask in a decoded `{FeatureString}` use this formula:

```
byte_offset = floor(bit_offset ÷ 8)
bit_mask = 1 << (bit_offset % 8)
```

For UInts, the most significant bit is at the smallest bit offset while the least significant bit is at the largest bit offset.

`{FeatureString}` is expected to remain backward compatible for the foreseeable future. If the decoded value is longer than expected, ignore any values that are not defined in the version of the spec you used.

If the version indicated in the first 8 bits is 255, do not use it. It is not backward compatible.

## Open Source License

### Sixel Images
`snake.png` and `snake.six` were sourced from https://github.com/saitoha/libsixel/blob/master/images/ at commit `6a5be8b72d84037b83a5ea838e17bcf372ab1d5f`, with the following license:

```
Copyright (c) 2014-2016 Hayaki Saito

Permission is hereby granted, free of charge, to any person obtaining a copy of
this software and associated documentation files (the "Software"), to deal in
the Software without restriction, including without limitation the rights to
use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of
the Software, and to permit persons to whom the Software is furnished to do so,
subject to the following conditions:

The above copyright notice and this permission notice shall be included in all
copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS
FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR
COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER
IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN
CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
```

The original file appears to have come from: https://commons.wikimedia.org/wiki/File:Dendroaspis_viridis_001.jpg
where it carries the following notice:

  This file is made available under the Creative Commons CC0 1.0 Universal Public Domain Dedication.
  (https://creativecommons.org/publicdomain/zero/1.0/deed.en)

### kitten.jpg

Fetched from https://unsplash.com/photos/9sJcLFELrwk on 7/15/2020

The accompanying license text reads:

Unsplash photos are made to be used freely. Our license reflects that.

All photos can be downloaded and used for free
Commercial and non-commercial purposes
No permission needed (though attribution is appreciated!)
What is not permitted 👎

Photos cannot be sold or redistributed without significant modification.
Compiling photos from Unsplash to replicate a similar or competing service.

Longform

Unsplash grants you an irrevocable, nonexclusive, worldwide copyright license to download, copy, modify, distribute, perform, and use photos from Unsplash for free, including for commercial purposes, without permission from or attributing the photographer or Unsplash. This license does not include the right to compile photos from Unsplash to replicate a similar or competing service.

#### osc8.txt

Fetched from https://gitlab.gnome.org/GNOME/vte/-/raw/master/perf/hyperlink-demo.txt?inline=false on 7/15/2020.

Licensed under Creative Commons Attribution 4.0 International per https://gitlab.gnome.org/GNOME/vte/-/blob/master/COPYING.CC-BY-4-0

#### Hyperlinks_in_Terminal_Emulators.html

Fetched from https://gist.github.com/egmontkob/eb114294efbcd5adb1944c9f3cb5feda. Part of VTE and covered by the same license as osc8.txt.

Lightly modified for formatting on iterm2.com.

#### file.md

Fetched from https://github.com/gnachman/iterm2-website/blob/master/source/_includes/3.4/documentation-images.md at commit 898a3cbfe00b09cd73fd179021f294ad4b0268ce. Licensed underl GPL 2 or later.

GNU GENERAL PUBLIC LICENSE

Version 2, June 1991

Copyright (C) 1989, 1991 Free Software Foundation, Inc.  
51 Franklin Street, Fifth Floor, Boston, MA  02110-1301, USA

Everyone is permitted to copy and distribute verbatim copies
of this license document, but changing it is not allowed.
Preamble

The licenses for most software are designed to take away your freedom to share and change it. By contrast, the GNU General Public License is intended to guarantee your freedom to share and change free software--to make sure the software is free for all its users. This General Public License applies to most of the Free Software Foundation's software and to any other program whose authors commit to using it. (Some other Free Software Foundation software is covered by the GNU Lesser General Public License instead.) You can apply it to your programs, too.

When we speak of free software, we are referring to freedom, not price. Our General Public Licenses are designed to make sure that you have the freedom to distribute copies of free software (and charge for this service if you wish), that you receive source code or can get it if you want it, that you can change the software or use pieces of it in new free programs; and that you know you can do these things.

To protect your rights, we need to make restrictions that forbid anyone to deny you these rights or to ask you to surrender the rights. These restrictions translate to certain responsibilities for you if you distribute copies of the software, or if you modify it.

For example, if you distribute copies of such a program, whether gratis or for a fee, you must give the recipients all the rights that you have. You must make sure that they, too, receive or can get the source code. And you must show them these terms so they know their rights.

We protect your rights with two steps: (1) copyright the software, and (2) offer you this license which gives you legal permission to copy, distribute and/or modify the software.

Also, for each author's protection and ours, we want to make certain that everyone understands that there is no warranty for this free software. If the software is modified by someone else and passed on, we want its recipients to know that what they have is not the original, so that any problems introduced by others will not reflect on the original authors' reputations.

Finally, any free program is threatened constantly by software patents. We wish to avoid the danger that redistributors of a free program will individually obtain patent licenses, in effect making the program proprietary. To prevent this, we have made it clear that any patent must be licensed for everyone's free use or not licensed at all.

The precise terms and conditions for copying, distribution and modification follow.

TERMS AND CONDITIONS FOR COPYING, DISTRIBUTION AND MODIFICATION

0. This License applies to any program or other work which contains a notice placed by the copyright holder saying it may be distributed under the terms of this General Public License. The "Program", below, refers to any such program or work, and a "work based on the Program" means either the Program or any derivative work under copyright law: that is to say, a work containing the Program or a portion of it, either verbatim or with modifications and/or translated into another language. (Hereinafter, translation is included without limitation in the term "modification".) Each licensee is addressed as "you".

Activities other than copying, distribution and modification are not covered by this License; they are outside its scope. The act of running the Program is not restricted, and the output from the Program is covered only if its contents constitute a work based on the Program (independent of having been made by running the Program). Whether that is true depends on what the Program does.

1. You may copy and distribute verbatim copies of the Program's source code as you receive it, in any medium, provided that you conspicuously and appropriately publish on each copy an appropriate copyright notice and disclaimer of warranty; keep intact all the notices that refer to this License and to the absence of any warranty; and give any other recipients of the Program a copy of this License along with the Program.

You may charge a fee for the physical act of transferring a copy, and you may at your option offer warranty protection in exchange for a fee.

2. You may modify your copy or copies of the Program or any portion of it, thus forming a work based on the Program, and copy and distribute such modifications or work under the terms of Section 1 above, provided that you also meet all of these conditions:

a) You must cause the modified files to carry prominent notices stating that you changed the files and the date of any change.
b) You must cause any work that you distribute or publish, that in whole or in part contains or is derived from the Program or any part thereof, to be licensed as a whole at no charge to all third parties under the terms of this License.
c) If the modified program normally reads commands interactively when run, you must cause it, when started running for such interactive use in the most ordinary way, to print or display an announcement including an appropriate copyright notice and a notice that there is no warranty (or else, saying that you provide a warranty) and that users may redistribute the program under these conditions, and telling the user how to view a copy of this License. (Exception: if the Program itself is interactive but does not normally print such an announcement, your work based on the Program is not required to print an announcement.)
These requirements apply to the modified work as a whole. If identifiable sections of that work are not derived from the Program, and can be reasonably considered independent and separate works in themselves, then this License, and its terms, do not apply to those sections when you distribute them as separate works. But when you distribute the same sections as part of a whole which is a work based on the Program, the distribution of the whole must be on the terms of this License, whose permissions for other licensees extend to the entire whole, and thus to each and every part regardless of who wrote it.

Thus, it is not the intent of this section to claim rights or contest your rights to work written entirely by you; rather, the intent is to exercise the right to control the distribution of derivative or collective works based on the Program.

In addition, mere aggregation of another work not based on the Program with the Program (or with a work based on the Program) on a volume of a storage or distribution medium does not bring the other work under the scope of this License.

3. You may copy and distribute the Program (or a work based on it, under Section 2) in object code or executable form under the terms of Sections 1 and 2 above provided that you also do one of the following:

a) Accompany it with the complete corresponding machine-readable source code, which must be distributed under the terms of Sections 1 and 2 above on a medium customarily used for software interchange; or,
b) Accompany it with a written offer, valid for at least three years, to give any third party, for a charge no more than your cost of physically performing source distribution, a complete machine-readable copy of the corresponding source code, to be distributed under the terms of Sections 1 and 2 above on a medium customarily used for software interchange; or,
c) Accompany it with the information you received as to the offer to distribute corresponding source code. (This alternative is allowed only for noncommercial distribution and only if you received the program in object code or executable form with such an offer, in accord with Subsection b above.)
The source code for a work means the preferred form of the work for making modifications to it. For an executable work, complete source code means all the source code for all modules it contains, plus any associated interface definition files, plus the scripts used to control compilation and installation of the executable. However, as a special exception, the source code distributed need not include anything that is normally distributed (in either source or binary form) with the major components (compiler, kernel, and so on) of the operating system on which the executable runs, unless that component itself accompanies the executable.

If distribution of executable or object code is made by offering access to copy from a designated place, then offering equivalent access to copy the source code from the same place counts as distribution of the source code, even though third parties are not compelled to copy the source along with the object code.

4. You may not copy, modify, sublicense, or distribute the Program except as expressly provided under this License. Any attempt otherwise to copy, modify, sublicense or distribute the Program is void, and will automatically terminate your rights under this License. However, parties who have received copies, or rights, from you under this License will not have their licenses terminated so long as such parties remain in full compliance.

5. You are not required to accept this License, since you have not signed it. However, nothing else grants you permission to modify or distribute the Program or its derivative works. These actions are prohibited by law if you do not accept this License. Therefore, by modifying or distributing the Program (or any work based on the Program), you indicate your acceptance of this License to do so, and all its terms and conditions for copying, distributing or modifying the Program or works based on it.

6. Each time you redistribute the Program (or any work based on the Program), the recipient automatically receives a license from the original licensor to copy, distribute or modify the Program subject to these terms and conditions. You may not impose any further restrictions on the recipients' exercise of the rights granted herein. You are not responsible for enforcing compliance by third parties to this License.

7. If, as a consequence of a court judgment or allegation of patent infringement or for any other reason (not limited to patent issues), conditions are imposed on you (whether by court order, agreement or otherwise) that contradict the conditions of this License, they do not excuse you from the conditions of this License. If you cannot distribute so as to satisfy simultaneously your obligations under this License and any other pertinent obligations, then as a consequence you may not distribute the Program at all. For example, if a patent license would not permit royalty-free redistribution of the Program by all those who receive copies directly or indirectly through you, then the only way you could satisfy both it and this License would be to refrain entirely from distribution of the Program.

If any portion of this section is held invalid or unenforceable under any particular circumstance, the balance of the section is intended to apply and the section as a whole is intended to apply in other circumstances.

It is not the purpose of this section to induce you to infringe any patents or other property right claims or to contest validity of any such claims; this section has the sole purpose of protecting the integrity of the free software distribution system, which is implemented by public license practices. Many people have made generous contributions to the wide range of software distributed through that system in reliance on consistent application of that system; it is up to the author/donor to decide if he or she is willing to distribute software through any other system and a licensee cannot impose that choice.

This section is intended to make thoroughly clear what is believed to be a consequence of the rest of this License.

8. If the distribution and/or use of the Program is restricted in certain countries either by patents or by copyrighted interfaces, the original copyright holder who places the Program under this License may add an explicit geographical distribution limitation excluding those countries, so that distribution is permitted only in or among countries not thus excluded. In such case, this License incorporates the limitation as if written in the body of this License.

9. The Free Software Foundation may publish revised and/or new versions of the General Public License from time to time. Such new versions will be similar in spirit to the present version, but may differ in detail to address new problems or concerns.

Each version is given a distinguishing version number. If the Program specifies a version number of this License which applies to it and "any later version", you have the option of following the terms and conditions either of that version or of any later version published by the Free Software Foundation. If the Program does not specify a version number of this License, you may choose any version ever published by the Free Software Foundation.

10. If you wish to incorporate parts of the Program into other free programs whose distribution conditions are different, write to the author to ask for permission. For software which is copyrighted by the Free Software Foundation, write to the Free Software Foundation; we sometimes make exceptions for this. Our decision will be guided by the two goals of preserving the free status of all derivatives of our free software and of promoting the sharing and reuse of software generally.

NO WARRANTY

11. BECAUSE THE PROGRAM IS LICENSED FREE OF CHARGE, THERE IS NO WARRANTY FOR THE PROGRAM, TO THE EXTENT PERMITTED BY APPLICABLE LAW. EXCEPT WHEN OTHERWISE STATED IN WRITING THE COPYRIGHT HOLDERS AND/OR OTHER PARTIES PROVIDE THE PROGRAM "AS IS" WITHOUT WARRANTY OF ANY KIND, EITHER EXPRESSED OR IMPLIED, INCLUDING, BUT NOT LIMITED TO, THE IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE. THE ENTIRE RISK AS TO THE QUALITY AND PERFORMANCE OF THE PROGRAM IS WITH YOU. SHOULD THE PROGRAM PROVE DEFECTIVE, YOU ASSUME THE COST OF ALL NECESSARY SERVICING, REPAIR OR CORRECTION.

12. IN NO EVENT UNLESS REQUIRED BY APPLICABLE LAW OR AGREED TO IN WRITING WILL ANY COPYRIGHT HOLDER, OR ANY OTHER PARTY WHO MAY MODIFY AND/OR REDISTRIBUTE THE PROGRAM AS PERMITTED ABOVE, BE LIABLE TO YOU FOR DAMAGES, INCLUDING ANY GENERAL, SPECIAL, INCIDENTAL OR CONSEQUENTIAL DAMAGES ARISING OUT OF THE USE OR INABILITY TO USE THE PROGRAM (INCLUDING BUT NOT LIMITED TO LOSS OF DATA OR DATA BEING RENDERED INACCURATE OR LOSSES SUSTAINED BY YOU OR THIRD PARTIES OR A FAILURE OF THE PROGRAM TO OPERATE WITH ANY OTHER PROGRAMS), EVEN IF SUCH HOLDER OR OTHER PARTY HAS BEEN ADVISED OF THE POSSIBILITY OF SUCH DAMAGES.



