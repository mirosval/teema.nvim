--
-- Built with,
--
--        ,gggg,
--       d8" "8I                         ,dPYb,
--       88  ,dP                         IP'`Yb
--    8888888P"                          I8  8I
--       88                              I8  8'
--       88        gg      gg    ,g,     I8 dPgg,
--  ,aa,_88        I8      8I   ,8'8,    I8dP" "8I
-- dP" "88P        I8,    ,8I  ,8'  Yb   I8P    I8
-- Yb,_,d88b,,_   ,d8b,  ,d8b,,8'_   8) ,d8     I8,
--  "Y8P"  "Y888888P'"Y88P"`Y8P' "YY8P8P88P     `Y8
--

-- This is a starter colorscheme for use with Lush,
-- for usage guides, see :h lush or :LushRunTutorial

--
-- Note: Because this is lua file, vim will append your file to the runtime,
--       which means you can require(...) it in other lua code (this is useful),
--       but you should also take care not to conflict with other libraries.
--
--       (This is a lua quirk, as it has somewhat poor support for namespacing.)
--
--       Basically, name your file,
--
--       "super_theme/lua/lush_theme/super_theme_dark.lua",
--
--       not,
--
--       "super_theme/lua/dark.lua".
--
--       With that caveat out of the way...
--

-- Enable lush.ify on this file, run:
--
--  `:Lushify`
--
--  or
--
--  `:lua require('lush').ify()`

local lush = require('lush')
local hsl = lush.hsl

local bf, it, un = 'bold', 'italic', 'underline' --GUI options

--------------------------------------------------------------------------------
local grays = {
    hsl(30, 0, 15);
    hsl(30, 0, 25);
    hsl(30, 0, 35);
    hsl(30, 0, 50);
    hsl(30, 0, 55);
    hsl(30, 0, 100);
}

local bg, overbg, faded, mid, drop, fg;
local red, salmon, orange, amber, yellow, green, teal, cyan, blue, purple, magenta;

red     = hsl(350, 100, 60);
salmon  = hsl( 10, 100, 70);

orange  = hsl( 40, 100, 60);
amber   = hsl( 50, 100, 60);
yellow  = hsl( 60, 100, 60);

green   = hsl(100, 90, 60);
teal    = hsl(150, 90, 60);
cyan    = hsl(180, 90, 60);

blue    = hsl(230, 100, 70);
purple  = hsl(270, 100, 60);
magenta = hsl(310, 100, 70);

-- backgrounds
bg     = grays[1]
overbg = grays[2]
faded  = grays[3]
-- foregrounds
mid    = grays[4]
drop   = grays[5]
fg     = grays[6]

local theme = lush(function()
  return {
    Normal       { fg=fg, bg=bg };
    NormalFloat  { Normal, bg=overbg };
    NormalNC     { fg=Normal.fg.da(50), bg=Normal.bg.li(5) };
    EndOfBuffer  { }; -- filler lines (~) after the end of the buffer.  By default, this is highlighted like |hl-NonText|.
    MatchParen   { fg=yellow, bg=overbg }; -- The character under the cursor or just before it, if it is a paired bracket, and its match. |pi_paren.txt|

    Comment      { fg=drop }; -- any comment
    Conceal      { fg=overbg }; -- placeholder characters substituted for concealed text (see 'conceallevel')
    Whitespace   { fg=mid }; -- "nbsp", "space", "tab" and "trail" in 'listchars'
    NonText      { Whitespace }; -- '@' at the end of the window, characters from 'showbreak' and other characters that do not really exist in the text (e.g., ">" displayed when a double-wide character doesn't fit at the end of the line). See also |hl-EndOfBuffer|.
    SpecialKey   { Whitespace }; -- Unprintable characters: text displayed differently from what it really is.  But not 'listchars' whitespace. |hl-Whitespace|

    Cursor       { fg='reverse', bg='reverse'}; -- character under the cursor
    TermCursor   { fg=bg, bg=fg }; -- cursor in a focused terminal
    TermCursorNC { TermCursor }, -- cursor in an unfocused terminal
    ColorColumn  { bg=overbg }; -- used for the columns set with 'colorcolumn'
    lCursor      { }; -- the character under the cursor when |language-mapping| is used (see 'guicursor')
    CursorIM     { ColorColumn }; -- like Cursor, but used when in IME mode |CursorIM|
    CursorColumn { ColorColumn }; -- Screen-column at the cursor, when 'cursorcolumn' is set.
    CursorLine   { ColorColumn }; -- Screen-line at the cursor, when 'cursorline' is set.  Low-priority if foreground (ctermfg OR guifg) is not set.

    LineNr       { fg=mid }; -- Line number for ":number" and ":#" commands, and when 'number' or 'relativenumber' option is set.
    CursorLineNr { fg=yellow }; -- Like LineNr when 'cursorline' or 'relativenumber' is set for the cursor line.
    SignColumn   { LineNr }; -- column where |signs| are displayed
    VertSplit    { fg=overbg, bg=overbg }; -- the column separating vertically split windows
    Folded       { fg=drop, bg=overbg}; -- line used for closed folds
    FoldColumn   { LineNr }; -- 'foldcolumn'

    Pmenu        { fg=fg, bg=overbg }; -- Popup menu: normal item.
    PmenuSel     { fg=fg, bg=faded }; -- Popup menu: selected item.
    PmenuSbar    { Pmenu }; -- Popup menu: scrollbar.
    PmenuThumb   { PmenuSel }; -- Popup menu: Thumb of the scrollbar.
    WildMenu     { Pmenu }; -- current match in 'wildmenu' completion

    StatusLine   { fg=fg, bg=overbg }; -- status line of current window
    StatusLineNC { fg=StatusLine.fg.da(50), bg=StatusLine.bg.da(10) }; -- status lines of not-current windows Note: if this is equal to "StatusLine" Vim will use "^^^" in the status line of the current window.

    TabLine      { StatusLineNC }; -- tab pages line, not active tab page label
    TabLineFill  { StatusLineNC }; -- tab pages line, where there are no labels
    TabLineSel   { StatusLine }; -- tab pages line, active tab page label

    Search       { fg=bg, bg=yellow }; -- Last search pattern highlighting (see 'hlsearch').  Also used for similar items that need to stand out.
    IncSearch    { Search }; -- 'incsearch' highlighting; also used for the text replaced with ":s///c"
    Substitute   { Search }; -- |:substitute| replacement text highlighting
    QuickFixLine { Search }; -- Current |quickfix| item in the quickfix window. Combined with |hl-CursorLine| when the cursor is there.

    Visual       { bg=overbg, gui=bf }; -- Visual mode selection
    VisualNOS    { bg=overbg }; -- Visual mode selection when vim is "Not Owning the Selection".

    ModeMsg      { fg=drop }; -- 'showmode' message (e.g., "-- INSERT -- ")
    MsgArea      { Normal }; -- Area for messages and cmdline
    MsgSeparator { fg=orange }; -- Separator for scrolled messages, `msgsep` flag of 'display'
    MoreMsg      { fg=green }; -- |more-prompt|
    Question     { fg=green }; -- |hit-enter| prompt and yes/no questions
    ErrorMsg     { fg=red }; -- error messages on the command line
    WarningMsg   { fg=orange }; -- warning messages

    Directory    { fg=orange }; -- directory names (and other special names in listings)
    Title        { fg=orange }; -- titles for output from ":set all", ":autocmd" etc.

    DiffAdd      { fg=green }; -- diff mode: Added line |diff.txt|
    DiffChange   { fg=amber }; -- diff mode: Changed line |diff.txt|
    DiffDelete   { fg=red }; -- diff mode: Deleted line |diff.txt|
    DiffText     { DiffChange, gui=un}; -- diff mode: Changed text within a changed line |diff.txt|
    DiffAdded    { DiffAdd }; 
    DiffRemoved  { DiffDelete }; 

    SpellBad     { fg=red, gui=un }; -- Word that is not recognized by the spellchecker. |spell| Combined with the highlighting used otherwise. 
    SpellCap     { fg=magenta, gui=un }; -- Word that should start with a capital. |spell| Combined with the highlighting used otherwise.
    SpellLocal   { fg=orange, gui=un }; -- Word that is recognized by the spellchecker as one that is used in another region. |spell| Combined with the highlighting used otherwise.
    SpellRare    { fg=yellow, gui=un }; -- Word that is recognized by the spellchecker as one that is hardly ever used.  |spell| Combined with the highlighting used otherwise.

    -- These groups are not listed as default vim groups,
    -- but they are defacto standard group names for syntax highlighting.
    -- commented out groups should chain up to their "preferred" group by
    -- default,
    -- Uncomment and edit if you want more specific syntax highlighting.

    Constant       { fg=amber }; -- (preferred) any constant
    String         { fg=green }; --   a string constant: "this is a string"
    Character      { fg=green }; --  a character constant: 'c', '\n'
    Number         { fg=blue }; --   a number constant: 234, 0xff
    Boolean        { fg=magenta }; --  a boolean constant: TRUE, false
    Float          { fg=teal}; --    a floating point constant: 2.3e10

    Identifier     { fg=fg }, -- (preferred) any variable name
    Function       { fg=amber }, -- function name (also: methods for classes)

    Statement      { fg=fg }, -- (preferred) any statement
    Conditional    { fg=salmon }, --  if, then, else, endif, switch, etc.
    Repeat         { fg=salmon }, --   for, do, while, etc.
    Label          { fg=salmon }, --    case, default, etc.
    Operator       { fg=salmon }, -- "sizeof", "+", "*", etc.
    Keyword        { fg=salmon }, --  any other keyword
    Exception      { fg=salmon }, --  try, catch, throw

    -- PreProc        { }, -- (preferred) generic Preprocessor
    -- Include        { }, --  preprocessor #include
    -- Define         { }, --   preprocessor #define
    -- Macro          { }, --    same as Define
    -- PreCondit      { }, --  preprocessor #if, #else, #endif, etc.

    -- Type           { }, -- (preferred) int, long, char, etc.
    -- StorageClass   { }, -- static, register, volatile, etc.
    -- Structure      { }, --  struct, union, enum, etc.
    -- Typedef        { }, --  A typedef

    -- Special        { }, -- (preferred) any special symbol
    -- SpecialChar    { }, --  special character in a constant
    -- Tag            { }, --    you can use CTRL-] on this
    -- Delimiter      { }, --  character that needs attention
    -- SpecialComment { }, -- special things inside a comment
    -- Debug          { }, --    debugging statements

    Underlined { gui = "underline" }, -- (preferred) text that stands out, HTML links
    Bold       { gui = "bold" },
    Italic     { gui = "italic" },

    -- ("Ignore", below, may be invisible...)
    -- Ignore         { }, -- (preferred) left blank, hidden  |hl-Ignore|

    -- Error          { }, -- (preferred) any erroneous construct

    -- Todo           { }, -- (preferred) anything that needs extra attention; mostly the keywords TODO FIXME and XXX

    -- These groups are for the native LSP client. Some other LSP clients may
    -- use these groups, or use their own. Consult your LSP client's
    -- documentation.

    -- LspReferenceText                     { }, -- used for highlighting "text" references
    -- LspReferenceRead                     { }, -- used for highlighting "read" references
    -- LspReferenceWrite                    { }, -- used for highlighting "write" references

    -- LspDiagnosticsDefaultError           { }, -- Used as the base highlight group. Other LspDiagnostic highlights link to this by default (except Underline)
    -- LspDiagnosticsDefaultWarning         { }, -- Used as the base highlight group. Other LspDiagnostic highlights link to this by default (except Underline)
    -- LspDiagnosticsDefaultInformation     { }, -- Used as the base highlight group. Other LspDiagnostic highlights link to this by default (except Underline)
    -- LspDiagnosticsDefaultHint            { }, -- Used as the base highlight group. Other LspDiagnostic highlights link to this by default (except Underline)

    -- LspDiagnosticsVirtualTextError       { }, -- Used for "Error" diagnostic virtual text
    -- LspDiagnosticsVirtualTextWarning     { }, -- Used for "Warning" diagnostic virtual text
    -- LspDiagnosticsVirtualTextInformation { }, -- Used for "Information" diagnostic virtual text
    -- LspDiagnosticsVirtualTextHint        { }, -- Used for "Hint" diagnostic virtual text

    -- LspDiagnosticsUnderlineError         { }, -- Used to underline "Error" diagnostics
    -- LspDiagnosticsUnderlineWarning       { }, -- Used to underline "Warning" diagnostics
    -- LspDiagnosticsUnderlineInformation   { }, -- Used to underline "Information" diagnostics
    -- LspDiagnosticsUnderlineHint          { }, -- Used to underline "Hint" diagnostics

    -- LspDiagnosticsFloatingError          { }, -- Used to color "Error" diagnostic messages in diagnostics float
    -- LspDiagnosticsFloatingWarning        { }, -- Used to color "Warning" diagnostic messages in diagnostics float
    -- LspDiagnosticsFloatingInformation    { }, -- Used to color "Information" diagnostic messages in diagnostics float
    -- LspDiagnosticsFloatingHint           { }, -- Used to color "Hint" diagnostic messages in diagnostics float

    -- LspDiagnosticsSignError              { }, -- Used for "Error" signs in sign column
    -- LspDiagnosticsSignWarning            { }, -- Used for "Warning" signs in sign column
    -- LspDiagnosticsSignInformation        { }, -- Used for "Information" signs in sign column
    -- LspDiagnosticsSignHint               { }, -- Used for "Hint" signs in sign column

    -- These groups are for the neovim tree-sitter highlights.
    -- As of writing, tree-sitter support is a WIP, group names may change.
    -- By default, most of these groups link to an appropriate Vim group,
    -- TSError -> Error for example, so you do not have to define these unless
    -- you explicitly want to support Treesitter's improved syntax awareness.

    -- TSAnnotation         { };    -- For C++/Dart attributes, annotations that can be attached to the code to denote some kind of meta information.
    -- TSAttribute          { };    -- (unstable) TODO: docs
    -- TSBoolean            { };    -- For booleans.
    -- TSCharacter          { };    -- For characters.
    TSComment            { Comment };    -- For comment blocks.
    -- TSConstructor        { };    -- For constructor calls and definitions: ` { }` in Lua, and Java constructors.
    -- TSConditional        { };    -- For keywords related to conditionnals.
    -- TSConstant           { };    -- For constants
    -- TSConstBuiltin       { };    -- For constant that are built in the language: `nil` in Lua.
    -- TSConstMacro         { };    -- For constants that are defined by macros: `NULL` in C.
    -- TSError              { };    -- For syntax/parser errors.
    -- TSException          { };    -- For exception related keywords.
    -- TSField              { };    -- For fields.
    -- TSFloat              { };    -- For floats.
    -- TSFunction           { };    -- For function (calls and definitions).
    -- TSFuncBuiltin        { };    -- For builtin functions: `table.insert` in Lua.
    -- TSFuncMacro          { };    -- For macro defined fuctions (calls and definitions): each `macro_rules` in Rust.
    -- TSInclude            { };    -- For includes: `#include` in C, `use` or `extern crate` in Rust, or `require` in Lua.
    -- TSKeyword            { };    -- For keywords that don't fall in previous categories.
    -- TSKeywordFunction    { };    -- For keywords used to define a fuction.
    -- TSLabel              { };    -- For labels: `label:` in C and `:label:` in Lua.
    -- TSMethod             { };    -- For method calls and definitions.
    -- TSNamespace          { };    -- For identifiers referring to modules and namespaces.
    -- TSNone               { };    -- TODO: docs
    -- TSNumber             { };    -- For all numbers
    -- TSOperator           { };    -- For any operator: `+`, but also `->` and `*` in C.
    -- TSParameter          { };    -- For parameters of a function.
    -- TSParameterReference { };    -- For references to parameters of a function.
    -- TSProperty           { };    -- Same as `TSField`.
    -- TSPunctDelimiter     { };    -- For delimiters ie: `.`
    -- TSPunctBracket       { };    -- For brackets and parens.
    -- TSPunctSpecial       { };    -- For special punctutation that does not fall in the catagories before.
    -- TSRepeat             { };    -- For keywords related to loops.
    -- TSString             { };    -- For strings.
    -- TSStringRegex        { };    -- For regexes.
    -- TSStringEscape       { };    -- For escape characters within a string.
    -- TSSymbol             { };    -- For identifiers referring to symbols or atoms.
    -- TSType               { };    -- For types.
    -- TSTypeBuiltin        { };    -- For builtin types.
    -- TSVariable           { };    -- Any variable name that does not have another highlight.
    -- TSVariableBuiltin    { };    -- Variable names that are defined by the languages, like `this` or `self`.

    -- TSTag                { };    -- Tags like html tag names.
    -- TSTagDelimiter       { };    -- Tag delimiter like `<` `>` `/`
    -- TSText               { };    -- For strings considered text in a markup language.
    -- TSEmphasis           { };    -- For text to be represented with emphasis.
    -- TSUnderline          { };    -- For text to be represented with an underline.
    -- TSStrike             { };    -- For strikethrough text.
    -- TSTitle              { };    -- Text that is part of a title.
    -- TSLiteral            { };    -- Literal text.
    -- TSURI                { };    -- Any URI like a link or email.

  }
end)

-- return our parsed theme for extension or use else where.
return theme

-- vi:nowrap
