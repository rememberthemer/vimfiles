" Vim color file
"
" Author: Adrian Benson <rmemeberthemer@gmail.com>
" Author: Tomas Restrepo <tomas@winterdom.com>
"
" Note: Based on the monokai theme for textmate
" by Wimer Hazenberg and its darker variant
" by Hamish Stuart Macpherson
"


hi clear
if exists("syntax_on")
        syntax reset
endif

set background=dark

let g:colors_name="dullokai"

" {{{ CODE COLORS ======================
hi Normal          guifg=#dadada guibg=#444444 ctermfg=253 ctermbg=238
hi NonText         guifg=#BCBCBC guibg=#3B3A32 ctermfg=250 ctermbg=237
hi Comment         guifg=#8B8778 ctermfg=245
hi String          guifg=#E6DB74 ctermfg=185
hi Constant        guifg=#AE81FF ctermfg=135 gui=bold cterm=bold
hi Number          guifg=#AE81FF ctermfg=135
hi Debug           guifg=#BCA3A3 ctermfg=225 gui=bold
hi Delimiter       guifg=#8F8F8F ctermfg=241
hi Type            guifg=#66D9EF ctermfg=81
hi Function        guifg=#A6E22E ctermfg=112
hi Exception       guifg=#A6E22E ctermfg=118 gui=bold cterm=bold
hi Operator        guifg=#F92672 ctermfg=198
hi Statement       guifg=#F92672 ctermfg=198 gui=bold cterm=bold
hi Tag             guifg=#F92672 ctermfg=198 gui=italic cterm=underline
hi Identifier      guifg=#FD971F ctermfg=208
hi Error           guifg=#E83036 guibg=#000000 ctermfg=160 ctermbg=0 gui=bold cterm=bold
hi PreProc         guifg=#A6E22E ctermfg=112
hi StorageClass    guifg=#FD971F ctermfg=208
" }}}

"{{{ OTHER SHIT =============================

hi DiffAdd         guibg=#13354A ctermbg=24
hi DiffChange      guifg=#89807D guibg=#4C4745 ctermfg=181 ctermbg=239
hi DiffDelete      guifg=#960050 guibg=#1E0010 ctermfg=162 ctermbg=53
hi DiffText        guibg=#4C4745 ctermbg=102 gui=italic,bold cterm=bold

hi Ignore          guifg=#808080 ctermfg=244
hi Macro           guifg=#C4BE89 ctermfg=193 gui=italic cterm=underline
hi Todo            guifg=#FFFFFF guibg=#5f0000 ctermfg=15 ctermbg=52 gui=bold cterm=bold
hi Special         guifg=#66D9EF ctermfg=81 gui=italic cterm=underline
hi SpecialKey      guifg=#888A85 ctermfg=245 gui=italic cterm=underline
hi SpecialChar     guifg=#F92672 ctermfg=198 gui=bold cterm=bold
hi SpecialComment  guifg=#8A8A8A ctermfg=245 gui=bold cterm=bold
hi Question        guifg=#66D9EF ctermfg=81
hi Underlined      guifg=#808080 ctermfg=244 gui=underline cterm=underline
hi MatchParen      guifg=#000000 guibg=#FD971F ctermfg=16  ctermbg=208 gui=bold cterm=bold
hi Search          guifg=#000000 guibg=#EAC925 ctermfg=16 ctermbg=193 cterm=reverse,bold gui=reverse,bold
hi IncSearch       guifg=#000000 guibg=#C4BE89 ctermfg=16 ctermbg=193 cterm=none gui=none

if has("spell")
    hi SpellBad    guisp=#FF0000 gui=undercurl
    hi SpellCap    guisp=#7070F0 gui=undercurl
    hi SpellLocal  guisp=#70F0F0 gui=undercurl
    hi SpellRare   guisp=#FFFFFF gui=undercurl
endif

hi Title           guifg=#ef5939 ctermfg=16
hi Directory       guifg=#A6E22E ctermfg=112 gui=bold cterm=bold

"}}}

" {{{ UI UGLIFICATION ==============
hi VertSplit       guifg=#808080 guibg=#080808 ctermfg=244 ctermbg=232 gui=bold cterm=bold
hi VisualNOS       guibg=#121212 ctermbg=233
hi Visual          guibg=#121212 ctermbg=233
hi WildMenu        guifg=#66D9EF guibg=#000000 ctermfg=81  ctermbg=16
hi StatusLine      guifg=#bcbcbc guibg=#594D56 ctermbg=145 ctermfg=237 gui=bold cterm=bold
hi StatusLineNC    guifg=#808080 guibg=#3B3A32 ctermbg=244 ctermfg=232 gui=bold cterm=bold
hi ErrorMsg        guifg=#F92672 guibg=#232526 ctermfg=199 ctermbg=16 gui=bold cterm=bold
hi WarningMsg      guifg=#FFFFFF guibg=#333333 ctermfg=231 ctermbg=238 gui=bold cterm=bold
hi MoreMsg         guifg=#E6DB74 ctermfg=229
hi ModeMsg         guifg=#E6DB74 ctermfg=229

hi SignColumn      guifg=#A6E22E guibg=#232526 ctermfg=112 ctermbg=235
hi FoldColumn      guifg=#BCBCBC guibg=#465457 ctermfg=250 ctermbg=234
hi Folded          guifg=#BCBCBC guibg=#465457 ctermfg=250 ctermbg=234

hi Cursor          guifg=#000000 guibg=#F8F8F0 ctermfg=0 ctermbg=230
hi CursorLine      guibg=#3E3D32 ctermbg=237 cterm=none
hi CursorColumn    guibg=#3E3D32 ctermbg=237
hi ColorColumn     guibg=#3B0000 ctermbg=52
hi LineNr          guifg=#BCBCBC guibg=#3B3A32 ctermfg=250 ctermbg=237

hi Pmenu           guifg=#66D9EF guibg=#000000 ctermfg=81  ctermbg=16
hi PmenuSel        guibg=#808080 ctermbg=244
hi PmenuSbar       guibg=#080808 ctermbg=232
hi PmenuThumb      guifg=#66D9EF ctermfg=81
" }}} ===============

" {{{ LINKED GROUPS
hi link Character       String
hi link Label           String
hi link Float           Number
hi link Boolean         Number
hi link Define          Type
hi link Typedef         Type
hi link Structure       Type
hi link Conditional     Statement
hi link Keyword         Statement
hi link Repeat          Statement
hi link Precondit       PreProc

" }}}
