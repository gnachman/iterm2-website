### Shell-escape syntaxes
The following syntaxes may be used to specify special characters in strings in various places, such as in trigger commands or ENQ answerback string, etc.

Examples of "special" characters:
* non-printing charaters
* control codes
* high/upper ascii values (above 127)
* explicit byte values by number rather than mnemonic or glyph, independant of character set, encoding, language, locale, or font
* characters with some other special meaning, such as backslashes and quotes

#### OCTAL
\\### | ### = 3 octal digits
--- | :---
\\007 | ascii 7 (BEL, ^G, terminal beep)

#### HEX
\\x## | ## = 2 hex digits
--- | :---
\\x0A | ascii 10 (NL, ^J, newline or linefeed)

#### UNICODE
This form is only valid with unicode character sets, ex: UTF-7, UTF-8, UTF-16 etc.

\\u#### | #### = 4 hex digits
--- | :---
\\u20AC | € (Euro)

#### MNEMONICS

\\* | * = mnemonic
--- | :---
\\b | BS (backspace)
\\e | ESC (escape)
\\f | FF (formfeed)
\\n | NL (newline)
\\r | CR (carriage return)
\\t | TAB (tab)

#### CONTROL
\\<C-*> | * = 1 letter a-z or A-Z
--- | :---
\\<C-M> | Ctrl-M (CR, ascii 13, ^M, carriage return)

#### META
\\<M-*> | * = 1 letter a-z or A-Z
--- | :---
\\<M-A> | Meta-A (usually ^[A, IE: Esc A)

#### LITERALS / EXCEPTIONS
\\* | * = literal
--- | :---
\\\\ | \\ (backslash)
\\" | " (double quote)
