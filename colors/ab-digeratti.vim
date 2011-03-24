" Maintainer:	Henrique C. Alves (hcarvalhoalves@gmail.com)
" Version:      1.0
" Last Change:  October 05 2008

set background=dark

hi clear

if exists("syntax_on")
    syntax reset
endif

let colors_name = "ab-digerati"

" Vim >= 7.0 specific colors
if version >= 700
  hi CursorLine     guibg=#4f4f4f ctermbg=239
  hi CursorColumn   guibg=#2d2d2d ctermbg=236
  hi MatchParen     guifg=#ffffff guibg=#4f4f4f gui=bold ctermfg=231 ctermbg=239 cterm=bold
  hi Pmenu 	    guifg=#404040 guibg=#dcdcdc gui=bold ctermfg=238 ctermbg=253 cterm=bold
  hi PmenuSel 	    guifg=#ffffff guibg=#93b5bf gui=bold ctermfg=231 ctermbg=109 cterm=bold
endif

" General colors
hi Cursor 	guifg=NONE    guibg=#909090 ctermfg=NONE ctermbg=246
hi Normal 	guifg=#f0f0f0 guibg=#444444 ctermfg=255  ctermbg=238
hi NonText 	guifg=#a0a0a0 guibg=#303030 ctermfg=247  ctermbg=236
hi LineNr 	guifg=#a0a0a0 guibg=#303030 ctermfg=247  ctermbg=236
hi StatusLine 	guifg=#444444 guibg=#e0e0e0 gui=italic   ctermfg=238 ctermbg=254 cterm=bold
hi StatusLineNC guifg=#303030 guibg=#606060 ctermfg=236  ctermbg=241
hi VertSplit 	guifg=#3a3a3a guibg=#3a3a3a ctermfg=237  ctermbg=237
hi Folded 	guifg=#a0a8b0 guibg=#384048 ctermfg=73   ctermbg=17
hi Title	guifg=#ffffff gui=bold      ctermfg=15   cterm=bold
hi Visual	guifg=#ffffff guibg=#b8b89f ctermfg=15   ctermbg=144
hi SpecialKey	guifg=#808080 guibg=#343434 ctermfg=244  ctermbg=236
:
" Syntax highlighting
hi Comment 	guifg=#808080 gui=italic ctermfg=244
" fg colo below could suck
hi String 	guifg=#afdf00 gui=italic ctermfg=148 cterm=NONE
hi Function 	guifg=#ffffff gui=bold   ctermfg=231 cterm=bold
hi Constant 	guifg=#ff5f87 gui=bold   ctermfg=204 cterm=bold 
hi Boolean      guifg=#cdff00 gui=NONE   ctermfg=154 cterm=NONE
hi Identifier 	guifg=#cdff00 gui=NONE   ctermfg=154 cterm=NONE
hi Type 	guifg=#77b4c7 gui=NONE   ctermfg=73  cterm=NONE
hi Statement 	guifg=#77b4c7 gui=NONE   ctermfg=73  cterm=NONE
hi Keyword	guifg=#ff5f87 gui=NONE   ctermfg=204 cterm=NONE
hi Number	guifg=#ff5f87 gui=NONE   ctermfg=204 cterm=NONE
hi Special	guifg=#ff5f87 gui=NONE   ctermfg=204 cterm=NONE
hi PreProc 	guifg=#b8b89f gui=NONE   ctermfg=144 cterm=NONE
hi Todo         guifg=#262626 guibg=#ff5f87 gui=italic ctermfg=235 ctermbg=204 cterm=bold
hi Operator     guifg=#df8700 gui=NONE   ctermfg=172 cterm=NONE
hi Exception    guifg=#5fdfaf gui=NONE   ctermfg=79 cterm=NONE




hi DiffAdd         guifg=#709080 guibg=#313c36 gui=bold
hi DiffChange      guibg=#333333
hi DiffDelete      guifg=#333333 guibg=#464646
hi DiffText        guifg=#ecbcbc guibg=#41363c gui=bold

" Code-specific colors
hi pythonOperator   guifg=#df8700 ctermfg=172

