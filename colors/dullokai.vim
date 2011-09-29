" Vim color file
"
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

let g:colors_name="ab-molokai"

" The most important one =======================
hi Normal          guifg=#dadada guibg=#444444

" {{{ CODE COLORS ======================
hi Comment         guifg=#8B8778
hi NonText         guifg=#BCBCBC guibg=#3B3A32
hi String          guifg=#E6DB74
hi Constant        guifg=#AE81FF               gui=bold
hi Number          guifg=#AE81FF
hi Debug           guifg=#BCA3A3               gui=bold
hi Delimiter       guifg=#8F8F8F
hi Type            guifg=#66D9EF
hi Function        guifg=#A6E22E
hi Exception       guifg=#A6E22E               gui=bold
hi Operator        guifg=#F92672
hi Statement       guifg=#F92672               gui=bold
hi Tag             guifg=#F92672               gui=italic
hi Identifier      guifg=#FD971F
hi Error           guifg=#960050 guibg=#1E0010

" }}}

"{{{ OTHER SHIT =============================
" Diff ==========
hi DiffAdd                       guibg=#13354A
hi DiffChange      guifg=#89807D guibg=#4C4745
hi DiffDelete      guifg=#960050 guibg=#1E0010
hi DiffText                      guibg=#4C4745 gui=italic,bold


" message
hi Ignore          guifg=#808080 guibg=bg
hi Macro           guifg=#C4BE89               gui=italic
hi Todo            guifg=#FFFFFF guibg=bg      gui=bold
hi Special         guifg=#66D9EF guibg=bg      gui=italic
hi SpecialKey      guifg=#888A85               gui=italic
hi SpecialChar     guifg=#F92672               gui=bold
hi Question        guifg=#66D9EF

hi MatchParen      guifg=#000000 guibg=#FD971F gui=bold
hi Search          guifg=#FFFFFF guibg=#455354
hi IncSearch       guifg=#C4BE89 guibg=#000000

if has("spell")
    hi SpellBad    guisp=#FF0000 gui=undercurl
    hi SpellCap    guisp=#7070F0 gui=undercurl
    hi SpellLocal  guisp=#70F0F0 gui=undercurl
    hi SpellRare   guisp=#FFFFFF gui=undercurl
endif

hi Title           guifg=#ef5939
hi Directory       guifg=#A6E22E               gui=bold

"}}}

" {{{ UI UGLIFICATION ==============
hi VertSplit       guifg=#808080 guibg=#080808 gui=bold
hi VisualNOS                     guibg=#121212
hi Visual                        guibg=#121212
hi WildMenu        guifg=#66D9EF guibg=#000000
hi StatusLine      guifg=#455354 guibg=fg
hi StatusLineNC    guifg=#808080 guibg=#080808
hi ErrorMsg        guifg=#F92672 guibg=#232526 gui=bold
hi WarningMsg      guifg=#FFFFFF guibg=#333333 gui=bold
hi MoreMsg         guifg=#E6DB74
hi ModeMsg         guifg=#E6DB74

hi SignColumn      guifg=#A6E22E guibg=#232526
hi FoldColumn      guifg=#465457 guibg=#BCBCBC
hi Folded          guifg=#465457 guibg=#BCBCBC gui=bold

hi Cursor          guifg=#000000 guibg=#F8F8F0
hi CursorLine                    guibg=#3E3D32
hi CursorColumn                  guibg=#3E3D32
hi ColorColumn                   guibg=#BCBCBC
hi LineNr          guifg=#BCBCBC guibg=#3B3A32

hi Pmenu           guifg=#66D9EF guibg=#000000
hi PmenuSel                      guibg=#808080
hi PmenuSbar                     guibg=#080808
hi PmenuThumb      guifg=#66D9EF
" }}} ===============

"
" {{{ 256-color SUPPORT
if &t_Co > 255
   hi Normal          ctermfg=253 ctermbg=238
   hi Comment         ctermfg=245
   hi NonText         ctermfg=250 ctermbg=237
   hi String          ctermfg=185
   hi Constant        ctermfg=135               cterm=bold
   hi Function        ctermfg=112
   hi Identifier      ctermfg=208               cterm=none
   hi Operator        ctermfg=198
   hi Statement       ctermfg=198               cterm=bold
   hi Type            ctermfg=81                cterm=none
   hi Exception       ctermfg=118
   hi Number          ctermfg=135
   hi Delimiter       ctermfg=241
   
   " other shit
   hi CursorLine                  ctermbg=237   cterm=none
   hi CursorColumn                ctermbg=237
   hi LineNr          ctermfg=250 ctermbg=237
   hi Cursor          ctermfg=16  ctermbg=253
   hi Debug           ctermfg=225               cterm=bold

   hi DiffAdd                     ctermbg=24
   hi DiffChange      ctermfg=181 ctermbg=239
   hi DiffDelete      ctermfg=162 ctermbg=53
   hi DiffText        ctermbg=102 cterm=bold

   hi Directory       ctermfg=112               cterm=bold
   hi Error           ctermfg=219 ctermbg=89
   hi ErrorMsg        ctermfg=199 ctermbg=16    cterm=bold
   hi FoldColumn      ctermfg=67  ctermbg=16
   hi Folded          ctermfg=67  ctermbg=16
   hi Ignore          ctermfg=244 ctermbg=238
   hi IncSearch       ctermfg=193 ctermbg=16

   hi Macro           ctermfg=193
   hi SpecialKey      ctermfg=81

   hi MatchParen      ctermfg=16  ctermbg=208 cterm=bold
   hi ModeMsg         ctermfg=229
   hi MoreMsg         ctermfg=229

   " complete menu
   hi Pmenu           ctermfg=81  ctermbg=16
   hi PmenuSel                    ctermbg=244
   hi PmenuSbar                   ctermbg=232
   hi PmenuThumb      ctermfg=81

   hi PreCondit       ctermfg=112               cterm=bold
   hi PreProc         ctermfg=112
   hi StorageClass    ctermfg=208
   
   hi Question        ctermfg=81
   hi Search          ctermfg=253 ctermbg=66

   " marks column
   hi SignColumn      ctermfg=112 ctermbg=235
   hi SpecialChar     ctermfg=198               cterm=bold
   hi SpecialComment  ctermfg=245               cterm=bold
   hi Special         ctermfg=81  ctermbg=238
   hi SpecialKey      ctermfg=245

   hi StatusLine      ctermfg=145 ctermbg=237
   hi StatusLineNC    ctermfg=244 ctermbg=232
   hi Tag             ctermfg=198
   hi Title           ctermfg=166
   hi Todo            ctermfg=231 ctermbg=232   cterm=bold

   hi Underlined      ctermfg=244               cterm=underline

   hi VertSplit       ctermfg=244 ctermbg=232   cterm=bold
   hi VisualNOS                   ctermbg=233
   hi Visual                      ctermbg=233
   hi WarningMsg      ctermfg=231 ctermbg=238   cterm=bold
   hi WildMenu        ctermfg=81  ctermbg=16
   hi ColorColumn                 ctermbg=236

end
" }}}

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
" }}}
