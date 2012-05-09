" vim: set sw=4 sts foldmethod=marker
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" ENVIRONMENT {{{ 
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

set nocompatible      " must be first line
" The next two lines ensure that the ~/.vim/bundle/ system works

" runtime bundle/vim-pathogen/autoload/pathogen.vim
" call pathogen#infect()

" }}}
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" VUNDLE "{{{
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
filetype off
set rtp+=~/.vim/bundle/vundle/
call vundle#rc()


" main bundle
Bundle 'gmarik/vundle'


Bundle 'scrooloose/nerdtree.git'
Bundle 'scrooloose/nerdcommenter.git'
Bundle 'scrooloose/syntastic'
Bundle 'Lokaltog/vim-powerline.git'
Bundle 'mru.vim'
Bundle 'c.vim'
Bundle 'bash-support.vim'
Bundle 'nvie/vim-pep8'
Bundle 'Align'
Bundle 'tpope/vim-fugitive'
Bundle 'xolox/vim-easytags'
Bundle 'fs111/pydoc.vim'
Bundle 'majutsushi/tagbar'
Bundle 'rememberthemer/rtm-snipmate.vim'
Bundle 'milkypostman/vim-togglelist'
Bundle 'jpythonfold.vim' 
Bundle 'mattn/pastebin-vim'
Bundle 'YankRing.vim'
Bundle 'chrisbra/color_highlight'
Bundle 'sandeepcr529/Buffet.vim'
Bundle 'klen/python-mode'
" }}}  
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" GENERAL "{{{
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
syntax on
filetype plugin indent on
set autoread

let mapleader=","
let g:mapleader = ","
set fileformats=unix,dos,mac
set noerrorbells
set mouse=a

" always switch to the current file directory
set autochdir
" automatically write a file when leaving a modified buffer
set autowrite
" just hide buffers when switching away from their window do not close the file
set hidden

" allow for cursor beyond last character
set virtualedit=onemore
set history=1000

" make diff ignore whitespace
set diffopt+=iwhite

" spelling setup
set spelllang=en_gb
if has("spell")
    map <F12> :set spell!<CR><Bar>:echo "Spell Check: " . strpart("OffOn", 3 * &spell, 3)<CR>
    set spellsuggest=best,10
endif

" utf8 stuff
if has("multi_byte")
    if &termencoding == ""
        let &termencoding = &encoding
    endif
    set encoding=utf-8
    setglobal fileencoding=utf-8
    set fileencodings=utf-8,latin1,ucs-bom nobomb
endif

" Backups
set nobackup

set directory=$HOME/.vim/tmp/swap
set viewdir=$HOME/.vim/tmp/views
" make vim save view (state) (folds, cursor, etc)
" au BufWinLeave * silent! mkview
" au BufWinEnter * silent! loadview


if has("gui_running")
    set shell=/bin/bash\ --rcfile\ ~/.vim/bashrc.gvim
else
    set shell=/bin/bash
endif

"modeline stuff
set modeline

"}}}

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" VIM UI {{{
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Colors & Stuff
set background=light
if  has("gui_running")
    try
	color dullokai2
    catch /^Vim\%((\a\+)\)\=:E185/
        color default
    endtry
    " set guifont=Envy\ Code\ R\ 10 linespace=1
set guifont=Ubuntu\ Mono\ 10 linespace=3
    " set guifont=Liberation\ Mono\ 8 linespace=2
    " set guifont=DejaVu\ Sans\ Mono\ 8 linespace=2
    set guicursor+=n-v-c:blinkon0
    set lines=55 columns=120
    set guioptions=aegim
elseif &term =~ "xterm" || &term =~ "256" 
    set t_Co=256
    try
	color dullokai2
    catch /^Vim\%((\a\+)\)\=:E185/
        color default
    endtry
    " cursor color
    if ! &term =~ "screen-256color"
	let &t_SI = "\<Esc>]12;White\x7"
	let &t_EI = "\<Esc>]12;Medium Aquamarine\x7"
	autocmd VimLeave * :!echo -ne "\033]12;Medium Aquamarine\007"
    endif
else
    color default
endif
" }}}

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" MISC {{{
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set backspace=eol,start,indent
set cursorline number numberwidth=4
set nowrap wrapscan whichwrap=b,s,h,l,<,>,~,[,]
set scrolloff=7 sidescrolloff=5
set magic

" Message & Status Stuff
set laststatus=2
if ! exists('g:Powerline_loaded')
	set showmode showcmd cmdheight=2
	set statusline=%2n\ %F\ %m%y%r%w\ %=C:%c\ L:%l,%L[%p]
endif
set wildmenu wildmode=list:longest " turn on wild mode huge list
set wildignore=*.o,*.obj,*.bak,*.exe,*.pyc,*.jpg,*.gif,*.png

" Search Stuff
set showmatch incsearch ignorecase smartcase hlsearch
" turn off search highlights with enter
nnoremap <silent> <CR> :noh<CR><CR> 

" misc
set nolist listchars=tab:\|-,trail:.,extends:>,precedes:<
set nolazyredraw
set ttyfast

"Formatting
set autoindent copyindent shiftround
set comments=sl:/*,mb:\ *,ex:\ */,O://,b:#,:%,:XCOMM,n:>,fb:-

"folding
set foldenable foldminlines=1 foldlevel=1 foldlevelstart=1

" completion
set completeopt-=preview
" set completeopt+=menuone
" }}}

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" FILETYPE stuff "{{{
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:bash_is_sh=1
let g:is_bash=1
" }}}
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" OMNIFUNC stuff "{{{
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
autocmd FileType c set omnifunc=ccomplete#Complete
autocmd FileType python set omnifunc=pythoncomplete#Complete
autocmd FileType html set omnifunc=htmlcomplete#CompleteTags

" }}}
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" PLUGINS {{{
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"---------------------------------------------------------------
" pep8
"---------------------------------------------------------------
let g:pep8_args = "--ignore=E501,W391"

"---------------------------------------------------------------
" pydoc
"---------------------------------------------------------------
let g:pydoc_cmd = "pydoc2"

"---------------------------------------------------------------
" MRU
"---------------------------------------------------------------
let MRU_File = $HOME."/.vim/tmp/vim_mru_files"
let MRU_Max_Menu_Entries = 20
let MRU_Max_Submenu_Entries = 20

"---------------------------------------------------------------
" csupport
"---------------------------------------------------------------
let g:C_GlobalTemplateFile=$HOME."/.vim/bundle/c.vim/c-support/templates/Templates"
let g:C_GlobalTemplateFile=$HOME."/.vim/bundle/c.vim/c-support/templates/Templates"
let g:C_LocalTemplateFile=$HOME."/.vim/bundle/c.vim/c-support/templates/Templates"
let g:C_CodeSnippets=$HOME."/.vim/bundle/c.vim/c-support/codesnippets"

"---------------------------------------------------------------
" NERDCommenter
"----------------------------------:-----------------------------
"uncomment to disable
"let g:loaded_nerd_comments=1
let NERDSpaceDelims=1
" custom maps
let g:NERDCustomDelimiters = {
			\ 'PKGBUILD': { 'left': '#'}
			\ }
"---------------------------------------------------------------
" Supertab
"---------------------------------------------------------------
" let g:SuperTabDefaultCompletionType = "context"
let g:SuperTabMappingForward = '<c-space>'
let g:SuperTabMappingBackward = '<s-c-space>'
" let g:SuperTabMappingForward = '<nul>'
" let g:SuperTabMappingBackward = '<s-nul>'
" let g:SuperTabLongestEnhanced = 1

"---------------------------------------------------------------
" Tags
"---------------------------------------------------------------
" set tags=./tags,/
let g:easytags_file = '~/.vim/tags/tags'
let g:easytags_dynamic_files = 1
" let g:easytags_by_filetype = '~/.vim/tags'
let g:easytags_on_cursorhold = 0

"---------------------------------------------------------------
" NERDTree
"---------------------------------------------------------------
"let loaded_nerd_tree=1     "to disable
let NERDChristmasTree=1
let NERDTreeMouseMode=2
let NERDTreeBookmarksFile=$HOME."/.vim/tmp/NERDTreeBookmarks"
" Show the bookmarks table on startup
let NERDTreeShowBookmarks=1
let NERDTreeShowHidden=0
let NERDTreeCaseSensitiveSort=0
let NERDTreeDirArrows=1
"---------------------------------------------------------------
" syntastic
"---------------------------------------------------------------
let g:syntastic_enable_signs=1
let g:syntastic_auto_loc_list=2
" let g:syntastic_quiet_warnings=1
<"---------------------------------------------------------------
" SnipMate
"---------------------------------------------------------------
let g:snips_author = 'Adrian Benson <Adrian.M.Benson__AT__gmail__DOT__com>'
let g:snips_company = 'Adrian Benson'
let g:snips_copyright = g:snips_company
" let g:snippets_dir = '/home/bensonad/.vim/bundle/snipmate-snippets'

"---------------------------------------------------------------
" Gundo
"---------------------------------------------------------------
nnoremap <F4> :Bufferlist<CR>

"---------------------------------------------------------------
" Pastebin
"---------------------------------------------------------------
" let g:loaded_pastebin=1
let g:pastebin_api_dev_key = '7796b9711f44bcbf9dba40fe972d31df'
let g:pastebin_api_user_name = 'rememberthemer'
let g:pastebin_api_user_password = 'gaya2010'
let g:pastebin_expire_date = '1M'
"---------------------------------------------------------------
" Latex stuff
"---------------------------------------------------------------
set grepprg=grep\ -nH\ $*
let g:tex_flavor='latex'
let g:Tex_DefaultTargetFormat='pdf'
let g:Tex_ViewRule_pdf='evince'
" TIP: if you write your \label's as \label{fig:something}, then if you
" type in \ref{fig: and press <C-n> you will automatically cycle through
" all the figure labels. Very useful!
" set iskeyword+=:

"---------------------------------------------------------------
" Powerline
"---------------------------------------------------------------
"
"---------------------------------------------------------------
" Yankring
"---------------------------------------------------------------
" let g:yankring_enabled = 0  " Disables the yankring
let g:yankring_history_dir = $HOME."/.vim/tmp/"

"---------------------------------------------------------------
" Powerline
" }}}

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Functions & keybindings {{{
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Quickly switch buffers
noremap <silent> <C-w><C-right> :bnext<CR>
noremap <silent> <C-w><C-left>  :bprev<CR>

" Search the current file for the word under the cursor and display matches
nmap <silent> <leader>gw :vimgrep /<C-r><C-w>/ %<CR>:ccl<CR>:cwin<CR><C-W>J:set nohls<CR>

"reselect visual block after in/dedent so we can in/dedent more
vnoremap < <gv
vnoremap > >gv

" strip white spaces
function! ABStripTrailingWhitespaces()
    let l = line(".")
    let c = col(".")
    %s/\s\+$//e
    call cursor(l, c)
endfun

noremap <silent> <leader>sw :call ABStripTrailingWhitespaces()<CR>
map <silent> <F2> :NERDTreeToggle<CR>
map <silent> <F3> :TagbarToggle<CR>


map <silent> <F5> :call ToggleLocationList()<CR>

" open file name under cursor in new split buffer
map <F8> :vertical wincmd f<CR>
"}}}

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Python Stuff {{{
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Tweak python hilighting etc
au FileType python syn keyword pythonDecorator True None False self
let python_highlight_all = 1
let python_highlight_builtin_objs = 1
let python_highlight_builtin_funcs = 1
let python_highlight_exceptions = 1
let python_highlight_string_formatting = 1
let python_highlight_string_format = 1
let python_highlight_string_templates = 1
let python_highlight_doctests = 1
let python_highlight_space_errors = 1
let python_highlight_indent_errors = 0


" trim trailing white space
au filetype python setlocal sw=4 et sts=4 tw=120 colorcolumn=80
au BufWritePre *.py :call ABStripTrailingWhitespaces()
"}}}
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Other Auto Commands "{{{
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Change Working Directory to that of the current file
cmap cwd lcd %:p:h


"helpfile
au FileType help set nonumber      " no line numbers when viewing help
au FileType help nnoremap <buffer><cr> <c-]>   " Enter selects subject
au FileType help nnoremap <buffer><bs> <c-T>   " Backspace to go back

au filetype sh setlocal sw=4 et sts=4
au filetype vim setlocal foldmethod=marker

" reread .vimrc when saved
au BufWritePost ~/.vimrc   so ~/.vimrc
" }}}

