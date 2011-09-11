" Vim color file:  ab-github.vim
" Last Change: 28 Dec 2010
" License: public domain
" Maintainer:: rememberthemer <adrian.m.benson@gmail.com>
"
" {{{ only works under gui or on 256 cterms
if &t_Co != 256 && ! has("gui_running")
    echomsg ""
    echomsg "write 'set t_Co=256' in your .vimrc or this file won't load"
    echomsg ""
    finish
endif
" }}}

" {{{ reset colors and set colors_name and store cpo setting
set background=light
hi clear
if exists("syntax_on")
    syntax reset
endif

let g:colors_name = "ab-github"

let s:save_cpo = &cpo
set cpo&vim
" }}}

" FORMAT:"{{{
"
" 		\ ["color-group", "term-style", "foreground-color", "background-color", "gui-style", "under-curl-color" ],
" or:   \ ["group-name",       cterm,    ctermfg, ctermbg,  gui,        guisp],
"
" 'term-style'/'gui-style' can be: 
"              bold, underline, undercurl, reverse, inverse, italic, standout, NONE
"
" if gui-style is empty, the term-style value is used for the gui
"
" (Note: not everything is supported by a terminal nor the gui)
"
" besides empty values defaults to 'NONE"
"
" may also check:  :help highlight-groups
"                  :help hl-<highlight-group> "
"
" for the Color numbers (0-255) for the foreground/background and under-curl-colors:
" http://www.calmar.ws/vim/256-xterm-24bit-rgb-color-chart.html
 
"}}}
"============================================================
"             EDIT/ADD your style/colors below
"------------------------------------------------------------

" standard colors {{{1
let s:colors256 = [
            \ ["Normal",          "",          "233", "255", "",          "" ],
            \ ["Cursor",          "bold",      "",    "72",  "",          "" ],
            \ ["CursorLine",      "",          "",    "254", "",          "" ],
            \ ["ColorColumn",     "",          "",    "229", "",          "" ],
            \ ["Incsearch",       "bold",      "195", "28",  "",          "" ],
            \ ["Search",          "",          "",    "220", "",          "" ],
            \ ["ErrorMsg",        "bold",      "",    "196", "",          "" ],
            \ ["WarningMsg",      "bold",      "",    "166", "",          "" ],
            \ ["ModeMsg",         "bold",      "",    "220", "",          "" ],
            \ ["MoreMsg",         "bold",      "",    "220", "",          "" ],
            \ ["Question",        "bold",      "27",  "",    "",          "" ],
            \ ["StatusLine",      "bold",      "250", "238", "",          "" ],
            \ ["StatusLineNC",    "",          "253", "238", "italic",    "" ],
            \ ["WildMenu",        "bold",      "228", "166", "",          "" ],
            \ ["LineNr",          "",          "245", "252", "",          "" ],
            \ ["VertSplit",       "",          "243", "252", "",          "" ],
            \ ["Folded",          "bold",      "243", "252", "",          "" ],
            \ ["FoldColumn",      "bold",      "89",  "252", "",          "" ],
            \ ["DiffText",        "",          "17",  "253", "",          "" ],
            \ ["DiffDelete",      "",          "124", "225", "",          "" ],
            \ ["DiffAdd",         "",          "28",  "193", "",          "" ],
            \ ["DiffChange",      "",          "28",  "193", "",          "" ],
            \ ["Directory",       "",          "55",  "",    "",          "" ],
            \ ["NonText",         "",          "244", "253", "",          "" ],
            \ ["SpecialKey",      "",          "142", "",    "",          "" ],
            \ ["Title",           "bold",      "",    "",    "",          "" ],
            \ ["Visual",          "",          "",    "189", "",          "" ],
            \ ["Comment",         "bold",      "143", "",    "bold,italic",""],
            \ ["Constant",        "bold",      "30",  "",    "",          "" ],
            \ ["String",          "",          "130", "",    "",          "" ],
            \ ["Error",           "underline", "160", "",    "undercurl", "" ],
            \ ["Identifier",      "bold",      "22",  "",    "",          "" ],
            \ ["Ignore",          "",          "244", "",    "",          "" ],
            \ ["Number",          "",      	"163",  "",    "",          "" ],
            \ ["Special",         "bold",      "",    "255", "",          "" ],
            \ ["SpecialChar",     "",          "34",  "",    "",          "" ],
            \ ["Statement",       "bold",      "",    "",    "",          "" ],
            \ ["Todo",            "",          "",    "205", "",          "" ],
            \ ["Type",            "bold",      "24",  "",    "",          "" ],
            \ ["Underlined",      "underline", "",    "",    "",          "" ],
            \ ["TaglistTagName",  "bold",      "29",  "118", "",          "" ],
            \ ["Operator",        "bold",      "52",  "",    "",          "" ],
            \ ["PreProc",         "",          "30",  "",    "",          "" ],
            \ ["Function",        "bold",      "22",  "",    "",          "" ],
            \ ["Label",           "bold",      "16",  "",    "",          "" ],
            \ ["StorageClass",    "bold",      "16",  "",    "",          "" ],
            \ ["Structure",       "",          "19",  "",    "",          "" ],
            \ ["Typedef",         "bold",      "16",  "",    "",          "" ],
            \ ["Pmenu",           "",          "16",  "225", "",          "" ],
            \ ["PmenuSel",        "bold",      "228", "208", "",          "" ],
            \ ["PmenuSbar",       "",          "238", "16",  "",          "" ],
            \ ["PmenuThumb",      "",          "247", "247", "",          "" ],
            \ ["MatchParen",      "bold",      "16",  "220", "",          "" ],
            \ ["SpellBad",        "underline", "",    "",    "",          "" ],
            \ ["SpellRare",       "",          "",    "228", "",          "" ],
            \ ["SpellLocal",      "",          "",    "224", "",          "" ],
            \ ["SpellCap",        "",          "",    "247", "",          "" ],
            \ ["TabLine",         "",          "237", "252", "",          "" ],
            \ ["TabLineSel",      "bold",      "237", "252", "",          "" ],
            \ ["TabLineFill",     "",          "237", "252", "",          "" ],
            \ ["pythonDecorator", "bold",      "30",  "",    "",          "" ],
            \ ["pythonException", "bold",      "18",  "",    "",          "" ],
            \ ["pythonStringT",   "",          "172", "",    "",          "" ],]

" Colors for guionly only {{{1
" use standard html color numbers/names
" format:     ["name",			gui,			guifg,	guibg	guisp	]
let s:colorgui = [ 
            \ ["SpellBad",   "undercurl", "", "",        "#0087ff" ],
            \ ["SpellRare",  "undercurl", "", "",        "#00af00" ],
            \ ["SpellLocal", "undercurl", "", "",        "#87DF00" ],
            \ ["SpellCap",   "undercurl", "", "",        "#8700AF" ],]
"}}}

" Color|syntax aliases {{{1
hi link vimFold              FoldColumn
hi link FoldedColumn         FoldColumn

hi link Character            Number
hi link htmlTag              htmlEndTag
hi link Question             Type

hi link xmlTag               Identifier
hi link xmlTagName           Identifier

hi link rubySharpBang        Special
hi link perlSharpBang        Special

hi link shSpecialVariables   Constant
hi link shDeref              Identifier
hi link shVariable           Function
hi link bashSpecialVariables Constant

hi link pythonOperator       Statement
hi link pythoniUniStringT    pythonStringT
hi link pythoniRawStringT    pythonStringT
hi link pythoniUniRawStringT pythonStringT
" }}}

"============================================================
"        * NO NEED * to edit below (unless bugfixing)
"============================================================

" {{{ cterm 2 gui color translation array
" convert between 0-255 cterm range and html spec for gui args
let s:cmap =   [ 
                \ "#000000", "#800000", "#008000", "#808000", 
                \ "#000080", "#800080", "#008080", "#c0c0c0", 
                \ "#808080", "#ff0000", "#00ff00", "#ffff00", 
                \ "#0000ff", "#ff00ff", "#00ffff", "#ffffff", 
                \ "#000000", "#00005f", "#000087", "#0000af", "#0000d7", "#0000ff", 
                \ "#005f00", "#005f5f", "#005f87", "#005faf", "#005fd7", "#005fff", 
                \ "#008700", "#00875f", "#008787", "#0087af", "#0087d7", "#0087ff", 
                \ "#00af00", "#00af5f", "#00af87", "#00afaf", "#00afd7", "#00afff", 
                \ "#00d700", "#00d75f", "#00d787", "#00d7af", "#00d7d7", "#00d7ff", 
                \ "#00ff00", "#00ff5f", "#00ff87", "#00ffaf", "#00ffd7", "#00ffff", 
                \ "#5f0000", "#5f005f", "#5f0087", "#5f00af", "#5f00d7", "#5f00ff", 
                \ "#5f5f00", "#5f5f5f", "#5f5f87", "#5f5faf", "#5f5fd7", "#5f5fff", 
                \ "#5f8700", "#5f875f", "#5f8787", "#5f87af", "#5f87d7", "#5f87ff", 
                \ "#5faf00", "#5faf5f", "#5faf87", "#5fafaf", "#5fafd7", "#5fafff", 
                \ "#5fd700", "#5fd75f", "#5fd787", "#5fd7af", "#5fd7d7", "#5fd7ff", 
                \ "#5fff00", "#5fff5f", "#5fff87", "#5fffaf", "#5fffd7", "#5fffff", 
                \ "#870000", "#87005f", "#870087", "#8700af", "#8700d7", "#8700ff", 
                \ "#875f00", "#875f5f", "#875f87", "#875faf", "#875fd7", "#875fff", 
                \ "#878700", "#87875f", "#878787", "#8787af", "#8787d7", "#8787ff", 
                \ "#87af00", "#87af5f", "#87af87", "#87afaf", "#87afd7", "#87afff", 
                \ "#87d700", "#87d75f", "#87d787", "#87d7af", "#87d7d7", "#87d7ff", 
                \ "#87ff00", "#87ff5f", "#87ff87", "#87ffaf", "#87ffd7", "#87ffff", 
                \ "#af0000", "#af005f", "#af0087", "#af00af", "#af00d7", "#af00ff", 
                \ "#af5f00", "#af5f5f", "#af5f87", "#af5faf", "#af5fd7", "#af5fff", 
                \ "#af8700", "#af875f", "#af8787", "#af87af", "#af87d7", "#af87ff", 
                \ "#afaf00", "#afaf5f", "#afaf87", "#afafaf", "#afafd7", "#afafff", 
                \ "#afd700", "#afd75f", "#afd787", "#afd7af", "#afd7d7", "#afd7ff", 
                \ "#afff00", "#afff5f", "#afff87", "#afffaf", "#afffd7", "#afffff", 
                \ "#d70000", "#d7005f", "#d70087", "#d700af", "#d700d7", "#d700ff", 
                \ "#d75f00", "#d75f5f", "#d75f87", "#d75faf", "#d75fd7", "#d75fff", 
                \ "#d78700", "#d7875f", "#d78787", "#d787af", "#d787d7", "#d787ff", 
                \ "#d7af00", "#d7af5f", "#d7af87", "#d7afaf", "#d7afd7", "#d7afff", 
                \ "#d7d700", "#d7d75f", "#d7d787", "#d7d7af", "#d7d7d7", "#d7d7ff", 
                \ "#d7ff00", "#d7ff5f", "#d7ff87", "#d7ffaf", "#d7ffd7", "#d7ffff", 
                \ "#ff0000", "#ff005f", "#ff0087", "#ff00af", "#ff00d7", "#ff00ff", 
                \ "#ff5f00", "#ff5f5f", "#ff5f87", "#ff5faf", "#ff5fd7", "#ff5fff", 
                \ "#ff8700", "#ff875f", "#ff8787", "#ff87af", "#ff87d7", "#ff87ff", 
                \ "#ffaf00", "#ffaf5f", "#ffaf87", "#ffafaf", "#ffafd7", "#ffafff", 
                \ "#ffd700", "#ffd75f", "#ffd787", "#ffd7af", "#ffd7d7", "#ffd7ff", 
                \ "#ffff00", "#ffff5f", "#ffff87", "#ffffaf", "#ffffd7", "#ffffff", 
                \ "#080808", "#121212", "#1c1c1c", "#262626", "#303030", "#3a3a3a", 
                \ "#444444", "#4e4e4e", "#585858", "#606060", "#666666", "#767676", 
                \ "#808080", "#8a8a8a", "#949494", "#9e9e9e", "#a8a8a8", "#b2b2b2", 
                \ "#bcbcbc", "#c6c6c6", "#d0d0d0", "#dadada", "#e4e4e4", "#eeeeee" ]
"}}}

" {{{ convert 0-255 to html color
function! s:ctermtogui(arg)
    if a:arg+0 == 0 && a:arg != "0"  "its a string
        return a:arg
    else
        return s:cmap[a:arg+0]       "get rgb color based on the number
    endif
endfunction
" }}}



" {{{
for s:col in s:colors256    
    for i in  [1, 2, 3, 4, 5]
        if s:col[i] == "" 
            let s:col[i] = "NONE"
        endif
    endfor
    if s:col[4] == "NONE" && s:col[1] != "NONE"
    	let s:col[4] = s:col[1]
    endif
    let fg = s:ctermtogui(s:col[2])
    let bg = s:ctermtogui(s:col[3])
    let sp = s:ctermtogui(s:col[5])
    " set cterm colors and style
    exec "hi ".s:col[0]." cterm=".s:col[1]." ctermfg=".s:col[2]." ctermbg=".s:col[3]." gui=".s:col[4]." guifg=".fg." guibg=".bg." guisp=".sp
endfor
"}}}

for s:col in s:colorgui    
    for i in  [1, 2, 3, 4]
        if s:col[i] == "" 
            let s:col[i] = "NONE"
        endif
    endfor
    " set cterm colors and style
    exec "hi ".s:col[0]." gui=".s:col[1]." guifg=".s:col[2]." guibg=".s:col[3]." guisp=".s:col[4]
endfor

