" Vim color file
"
" Author: Adrian Benson <rmemeberthemer@gmail.com>
"
" Note: Based on the molokai theme by
" Tomas Restrepo (script_id=2340) which in turn
" based on the monokai theme for textmate
" by Wimer Hazenberg and its darker variant
" by Hamish Stuart Macpherson
"


hi clear
if exists("syntax_on")
        syntax reset
endif

set background=dark

let g:colors_name="dullokai2"

" {{{ CODE COLORS ======================
hi Normal          guifg=#dadada guibg=#444440 ctermfg=252 ctermbg=238
hi NonText         guifg=#BCBCBC guibg=#3B3A32 ctermfg=250 ctermbg=237
hi Comment         guifg=#8B8778 ctermfg=245
hi Constant        guifg=#AE81FF ctermfg=140 gui=bold cterm=bold
hi Debug           guifg=#BCA3A3 ctermfg=225 gui=bold
hi Delimiter       guifg=#8F8F8F ctermfg=241
hi Error           guifg=#E83036 guibg=#000000 ctermfg=160 ctermbg=0 gui=bold cterm=bold
hi Exception       guifg=#A6E22E ctermfg=106 gui=bold cterm=bold
hi Function        guifg=#A6E22E ctermfg=106
hi Identifier      guifg=#FD971F ctermfg=172
hi Number          guifg=#AE81FF ctermfg=140
hi Operator        guifg=#F92672 ctermfg=168
hi PreProc         guifg=#A6E22E ctermfg=106
hi Statement       guifg=#F92672 ctermfg=168 gui=bold cterm=bold
hi StorageClass    guifg=#FD971F ctermfg=172
hi String          guifg=#E6DB74 ctermfg=185
hi Tag             guifg=#F92672 ctermfg=168 gui=italic cterm=underline
hi Type            guifg=#66D9EF ctermfg=74
" }}}

"{{{ OTHER SHIT =============================
hi DiffChange      guifg=#919CBB guibg=#091126 ctermfg=181 ctermbg=239
hi DiffDelete      guifg=#960050 guibg=#1E0010 ctermfg=162 ctermbg=53
hi DiffText        guibg=#4C4745 ctermbg=102 gui=italic,bold cterm=bold
hi DiffAdd         guifg=#397541 guibg=#061E00 ctermbg=23
hi Ignore          guifg=#808080 ctermfg=244
hi IncSearch       guifg=#000000 guibg=#C4BE89 ctermfg=16 ctermbg=193 cterm=none gui=none
hi Macro           guifg=#C4BE89 ctermfg=193 gui=italic cterm=bold
hi MatchParen      guifg=#000000 guibg=#FD971F ctermfg=16  ctermbg=172 gui=bold cterm=bold
hi Question        guifg=#66D9EF ctermfg=74
hi Search          guifg=#000000 guibg=#EAC925 ctermfg=16 ctermbg=193 cterm=reverse,bold gui=reverse,bold
hi Special         guifg=#66D9EF ctermfg=74 gui=italic cterm=bold
hi SpecialChar     guifg=#F92672 ctermfg=168 gui=bold cterm=bold
hi SpecialComment  guifg=#8A8A8A ctermfg=245 gui=bold cterm=bold
hi SpecialKey      guifg=#888A85 ctermfg=245 gui=italic cterm=bold
hi Todo            guifg=#FFFFFF guibg=#5f0000 ctermfg=15 ctermbg=52 gui=bold cterm=bold
hi Underlined      guifg=#808080 ctermfg=244 gui=underline cterm=underline

if has("spell")
    hi SpellBad    guisp=#FF0000 gui=undercurl
    hi SpellCap    guisp=#7070F0 gui=undercurl
    hi SpellLocal  guisp=#70F0F0 gui=undercurl
    hi SpellRare   guisp=#FFFFFF gui=undercurl
endif

" hi Title           guifg=#EF5939 ctermfg=167 gui=bold cterm=bold
hi Directory           guifg=#EF5939 ctermfg=74 gui=bold cterm=bold
" hi Directory       guifg=#A6E22E ctermfg=106 gui=bold cterm=bold
hi Title       guifg=#A6E22E ctermfg=106 gui=none cterm=None
" gui=bold cterm=bold

" test
"}}}

" {{{ UI UGLIFICATION ==============
hi Cursor          guifg=#000000 guibg=#F8F8F0 ctermfg=0 ctermbg=230
hi CursorLine      guibg=#3E3D32 ctermbg=237 cterm=none
hi CursorColumn    guibg=#3E3D32 ctermbg=237
hi ColorColumn     guibg=#3B0000 ctermbg=52
hi ErrorMsg        guifg=#F92672 guibg=#232526 ctermfg=199 ctermbg=16  gui=bold cterm=bold
hi ModeMsg         guifg=#E6DB74 ctermfg=229
hi MoreMsg         guifg=#E6DB74 ctermfg=229
hi SignColumn      guifg=#A6E22E guibg=#232526 ctermfg=106 ctermbg=235 gui=none cterm=none
hi FoldColumn      guifg=#BCBCBC guibg=#303030 ctermfg=250 ctermbg=236 gui=none cterm=none
hi Folded          guifg=#67798C guibg=#323D48 ctermfg=250 ctermbg=236 gui=none cterm=none
hi LineNr          guifg=#BCBCBC guibg=#3B3A32 ctermfg=250 ctermbg=237
hi Pmenu           guifg=#66D9EF guibg=#000000 ctermfg=74  ctermbg=16
hi PmenuSel        guibg=#808080 ctermbg=244
hi PmenuSbar       guibg=#080808 ctermbg=232
hi PmenuThumb      guifg=#66D9EF ctermfg=74
hi StatusLine      guifg=#bcbcbc guibg=#465457 ctermfg=237 ctermbg=145 ctermfg=237 gui=bold cterm=bold
hi StatusLineNC    guifg=#c6c6c6 guibg=#585858 ctermfg=235 ctermbg=244 gui=bold cterm=bold
hi VertSplit       guifg=#808080 guibg=#080808 ctermfg=244 ctermbg=232 gui=bold cterm=bold
hi Visual          guibg=#121212 ctermbg=233
hi VisualNOS       guibg=#121212 ctermbg=233
hi WarningMsg      guifg=#FFFFFF guibg=#333333 ctermfg=231 ctermbg=238 gui=bold cterm=bold
hi WildMenu        guifg=#66D9EF guibg=#000000 ctermfg=74  ctermbg=16
" }}} ===============

" {{{ LINKED GROUPS
hi link Boolean         Number
hi link Character       String
hi link Conditional     Statement
hi link Define          Type
hi link Float           Number
hi link Keyword         Statement
hi link Label           String
hi link Precondit       PreProc
hi link Repeat          Statement
hi link Structure       Type
hi link Typedef         Type

" }}}
