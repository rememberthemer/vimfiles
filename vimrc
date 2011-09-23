"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Environment
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

set nocompatible      " must be first line
" The next two lines ensure that the ~/.vim/bundle/ system works

runtime! autoload/pathogen.vim
silent! call pathogen#runtime_append_all_bundles()
silent! call pathogen#helptags()

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" General
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
filetype plugin on 
filetype indent on
syntax on
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
" set noswapfile
set backupdir=$HOME/.vim/tmp/backup
set directory=$HOME/.vim/tmp/swap
set viewdir=$HOME/.vim/tmp/views
" make vim save view (state) (folds, cursor, etc)
au BufWinLeave * silent! mkview
au BufWinEnter * silent! loadview

set shell=/bin/bash
"modeline stuff
set modeline
" let g:secure_modelines_verbose = 0
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Vim UI
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Colors & Stuff
set background=light
if  has("gui_running")
    color ab-molokai
    " color ab-github
    set guifont=Envy\ Code\ R\ 10
    set guicursor+=n-v-c:blinkon0
    " set guifont=Dina\ 12
    " set guifont=Tamsyn\ 11
    set lines=45 columns=100 linespace=1
    set guioptions=aegim
elseif &term =~ "xterm"
    set t_Co=256
    set ttyfast
    " color ab-molokai
    color ab-github
    " cursor color
    let &t_SI = "\<Esc>]12;yellow\x7"
    let &t_EI = "\<Esc>]12;chocolate\x7"
    autocmd VimLeave * :!echo -ne "\033]12;chocolate\007"
else
    color default
endif


" hi ColorColumn guibg=lightgrey ctermbg=lightgrey
set backspace=eol,start,indent
set cursorline number numberwidth=4
set nowrap wrapscan whichwrap=b,s,h,l,<,>,~,[,]
set scrolloff=7
set magic

" Message & Status Stuff
set showmode showcmd cmdheight=2
set statusline=%2n\ %F\ %m%y%r%w\ %=C:%c\ L:%l,%L[%p]
set laststatus=2
set wildmenu wildmode=list:longest " turn on wild mode huge list
set wildignore=*.o,*.obj,*.bak,*.exe,*.pyc,*.jpg,*.gif,*.png

" Search Stuff
set showmatch incsearch ignorecase smartcase hlsearch
" turn off search highlights with enter
nnoremap <silent> <CR> :noh<CR><CR> 

" misc
set nolist listchars=tab:\|-,trail:.,extends:>,precedes:<
set nolazyredraw

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"Formatting
set autoindent copyindent shiftround
set comments=sl:/*,mb:\ *,ex:\ */,O://,b:#,:%,:XCOMM,n:>,fb:-

"folding
set foldenable foldmethod=syntax foldminlines=1 foldlevel=1


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Plugins
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"---------------------------------------------------------------
" Notes
"---------------------------------------------------------------
" let g:loaded_notes = 1
let g:notes_directory = '~/Documents/VimNotes'
let g:notes_indexfile = '~/Documents/VimNotes/.index/index.sqlite3'
let g:notes_tagsindex = '~/Documents/VimNotes/.index/tags.txt'
"---------------------------------------------------------------
" TList
"---------------------------------------------------------------
let Tlist_Use_Right_Window=1
"---------------------------------------------------------------
" pep8
"---------------------------------------------------------------
let g:pep8_args = "--ignore=E501,W391"
"---------------------------------------------------------------
" most recently used
"---------------------------------------------------------------
let MRU_File = $HOME."/.vim/tmp/vim_mru_files"
let MRU_Max_Menu_Entries = 20
let MRU_Max_Submenu_Entries = 20

"---------------------------------------------------------------
" csupport
"---------------------------------------------------------------
let g:C_GlobalTemplateFile=$HOME."/.vim/bundle/c-vim/c-support/templates/Templates"
let g:C_GlobalTemplateFile=$HOME."/.vim/bundle/c-vim/c-support/templates/Templates"
let g:C_LocalTemplateFile=$HOME."/.vim/bundle/c-vim/c-support/templates/Templates"
let g:C_CodeSnippets=$HOME."/.vim/bundle/c-vim/c-support/codesnippets"

"---------------------------------------------------------------
" NERDCommenter
"----------------------------------:-----------------------------
"uncomment to disable
"let g:loaded_nerd_comments=1
let NERDSpaceDelims=1

"---------------------------------------------------------------
" Tags
"---------------------------------------------------------------
" set tags=./tags,/
let g:easytags_file = '~/.vim/tags/tags'
"---------------------------------------------------------------
" NERDTree
"---------------------------------------------------------------
"let loaded_nerd_tree=1     "to disable
let NERDChristmasTree=1
let NERDTreeMouseMode=2
" Store the bookmarks file in perforce
let NERDTreeBookmarksFile=$HOME."/.vim/tmp/.NERDTreeBookmarks"
" Show the bookmarks table on startup
let NERDTreeShowBookmarks=1
let NERDTreeShowHidden=1
let NERDTreeCaseSensitiveSort=1

" close vim when NERDTree  is only buffer
function! NERDTreeQuit()
    redir => buffersoutput
    silent buffers
    redir END
    "                     1BufNo  2Mods.     3File           4LineNo
    let pattern = '^\s*\(\d\+\)\(.....\) "\(.*\)"\s\+line \(\d\+\)$'
    let windowfound = 0

    for bline in split(buffersoutput, "\n")
        let m = matchlist(bline, pattern)

        if (len(m) > 0)
            if (m[2] =~ '..a..')
                let windowfound = 1
            endif
        endif
    endfor

    if (!windowfound)
        quitall
    endif
endfunction
autocmd WinEnter * call NERDTreeQuit()

"---------------------------------------------------------------
" quick-fix-signs
"---------------------------------------------------------------
let g:quickfixsigns_blacklist_buffer = '\.tex$'

"---------------------------------------------------------------
"---------------------------------------------------------------
" SnipMate
"---------------------------------------------------------------
let g:snips_author = 'Adrian Benson <Adrian.M.Benson__AT__gmail__DOT__com>'
let g:snips_company = 'Adrian Benson'
let g:snips_copyright = g:snips_company
" let g:snippets_dir = '/home/bensonad/.vim/bundle/snipmate-snippets'

"---------------------------------------------------------------
" Latex stuff
set grepprg=grep\ -nH\ $*
let g:tex_flavor='latex'
" TIP: if you write your \label's as \label{fig:something}, then if you
" type in \ref{fig: and press <C-n> you will automatically cycle through
" all the figure labels. Very useful!
" set iskeyword+=:

" ATP plugin
let b:atp_TexCompiler	= "pdflatex"			
let b:atp_BibCompiler	= "bibtex"			
let g:atp_Python = "/usr/bin/python2"
"---------------------------------------------------------------
" completion
set completeopt-=preview
" set completeopt+=menuone

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Functions & keybindings
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Quickly switch buffers
noremap <silent> <C-w><C-right> :bnext<CR>
noremap <silent> <C-w><C-left>  :bprev<CR>

" Search the current file for the word under the cursor and display matches
nmap <silent> <leader>gw :vimgrep /<C-r><C-w>/ %<CR>:ccl<CR>:cwin<CR><C-W>J:set nohls<CR>

"reselect visual block after in/dedent so we can in/dedent more
vnoremap < <gv
vnoremap > >gv

" open with browser http://vim.wikia.com/wiki/VimTip306
nnoremap <leader>w :silent !xdg-open <C-R>=escape("<C-R><C-F>", "#?&;\|%")<CR><CR>


map <C-b> :TSelectBuffer<CR>
map <silent> <F2> :NERDTreeToggle<CR>
map <silent> <F3> :TlistToggle<CR>

" open file name under cursor in new split buffer
map <F8> :vertical wincmd f<CR>

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Python Stuff
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
let python_highlight_space_errors = 0
let python_highlight_indent_errors = 0

" default python modeline
au filetype python setlocal sw=4 et sts=4 tw=79
" trim trailing white space
au BufWritePre *.py :%s/\s\+$//e
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Other Auto Commands
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Change Working Directory to that of the current file
cmap cwd lcd %:p:h


"helpfile
au FileType help set nonumber      " no line numbers when viewing help
au FileType help nnoremap <buffer><cr> <c-]>   " Enter selects subject
au FileType help nnoremap <buffer><bs> <c-T>   " Backspace to go back

au filetype sh setlocal sw=4 et sts=4 foldmethod=indent

" arch PKGBUILD
au BufRead,BufNewFile *PKGBUILD setlocal ft=sh

" reread .vimrc when saved
au BufWritePost ~/.vimrc   so ~/.vimrc

" vim: set sw=4 sts=4 et ft=vim :
