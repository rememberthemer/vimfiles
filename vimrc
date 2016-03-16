" vim: set sw=4 sts foldmethod=marker


" Allow vim to break compatibility with vi
set nocompatible " This must be first, because it changes other options

" Add plugin declarations/load options to 'plug-setup.vim'
source $HOME/.vim/plug-setup.vim
let s:plugindir=$HOME."/.vim/plugger"

" }}}-------------------------------------------------------------------------
"   Base Options                                                          {{{
" ----------------------------------------------------------------------------
let mapleader=","

set encoding=utf-8
setglobal fileencoding=utf-8
set fileencodings=utf-8,latin1,ucs-bom nobomb

" spelling setup
set spelllang=en_gb
if has("spell")
    nnoremap <F12> :set spell!<CR><Bar>:echo "Spell Check: " . strpart("OffOn", 3 * &spell, 3)<CR>
    set spellsuggest=best,10
endif
set spellfile=$HOME/.vim/spell/en.utf-8.add

" just hide buffers when switching away from their window do not close the file
set hidden
set ttyfast
set backspace=indent,eol,start  " Allow backspaceing over autoindent, line breaks, starts of insert
set shortmess+=I                " No welcome screen
set shortmess+=A                " No .swp warning
set history=200
set exrc                        " enable per-directory .vimrc files
set secure                      " disable unsafe commands in local .vimrc files

" }}}-------------------------------------------------------------------------
"   Visual                                                                {{{
" ----------------------------------------------------------------------------

" Control Area (May be superseded by vim-airline)
set showcmd                 " Show (partial) command in the last line of the screen.
set wildmenu                " Command completion
set wildmode=list:longest   " List all matches and complete till longest common string
set wildignore=*.o,*.obj,*.bak,*.exe,*.pyc,*.jpg,*.gif,*.png  " Ignore these for matching

set laststatus=2            " The last window will have a status line always
set noshowmode              " Don't show the mode in the last line of the screen, vim-airline takes care of it
set ruler                   " Show the line and column number of the cursor position, separated by a comma.
set lazyredraw              " Don't update the screen while executing macros/commands

" My command line autocomplete is case insensitive. Keep vim consistent with
" that. It's a recent feature to vim, test to make sure it's supported first.
if exists("&wildignorecase")
    set wildignorecase
endif


" Buffer Area Visuals
set scrolloff=7             " Minimal number of screen lines to keep above and below the cursor.
set sidescrolloff=5         " The minimal number of columns to scroll horizontally.
set visualbell              " Use a visual bell, don't beep!
set noerrorbells
set cursorline              " Highlight the current line
set number                  " Show line numbers
set numberwidth=4
" set wrap                    " Soft wrap at the window width
set nowrap wrapscan whichwrap=b,s,h,l,<,>,~,[,]
set linebreak               " Break the line on words
set textwidth=79            " Break lines at just under 80 characters
if exists('+colorcolumn')
  set colorcolumn=+1        " Highlight the column after `textwidth`
endif
" set virtualedit=onemore   " allow for cursor beyond last character
set diffopt+=iwhite       " make diff ignore whitespace 
set modeline
"
" show fold column, fold by markers
set foldcolumn=0            " Don't show the folding gutter/column
set foldmethod=marker       " Fold on {{{ }}}
set foldlevelstart=20       " Open 20 levels of folding when I open a file

" Open folds under the following conditions
set foldopen=block,hor,mark,percent,quickfix,search,tag,undo,jump

" Highlight tabs and trailing spaces
set listchars=tab:▸\ ,trail:•
set list                    " Make whitespace characters visible

" Splits
set splitbelow              " Open new splits below
set splitright              " Open new vertical splits to the right

" always switch to the current file directory
set autochdir
" set autoread



" Character meaning when present in 'formatoptions'
" ------ ---------------------------------------
" c Auto-wrap comments using textwidth, inserting the current comment leader automatically.
" q Allow formatting of comments with "gq".
" r Automatically insert the current comment leader after hitting <Enter> in Insert mode.
" t Auto-wrap text using textwidth (does not apply to comments)
" n Recognize numbered lists
" 1 Don't break line after one-letter words
" a Automatically format paragraphs
set formatoptions=cqrn1

set guioptions=aegim

" Colors
syntax enable               " This has to come after colorcolumn in order to draw it.
set t_Co=256                " enable 256 colors
colorscheme dullokai

" When completing, fill with the longest common string
" Auto select the first option
set completeopt=longest,menuone

" Printing options
set printoptions=header:0,duplex:long,paper:letter,syntax:n
" header:0                  Do not print a header
" duplex:long (default)     Print on both sides (when possible), bind on long
" syntax:n                  Do not use syntax highlighting.

" }}}-------------------------------------------------------------------------
"   Style for terminal vim
" ----------------------------------------------------------------------------

set mouse+=a  " Add mouse support for 'all' modes, may require iTerm
if &term =~ '^screen'
    " tmux knows the extended mouse mode
    set ttymouse=xterm2
endif

" use a minimal bashrc for 'sh' - problems with more complex setups 
if has("gui_running")
    set shell=/bin/bash\ --rcfile\ ~/.vim/bashrc.gvim
else
    set shell=/bin/bash
endif


" }}}-------------------------------------------------------------------------
"   Search                                                                {{{
" ----------------------------------------------------------------------------

set incsearch               " Show search results as we type
set showmatch               " Show matching brackets
set hlsearch                " Highlight search results
set magic

" Use regex for searches
" nnoremap / /\v
" vnoremap / /\v
" nnoremap ? ?\v
" vnoremap ? ?\v
set ignorecase              " Ignore case when searching
set smartcase               " Don't ignore case if we have a capital letter

" turn off search highlights with enter
nnoremap <silent> <CR> :noh<CR><CR>

" }}}-------------------------------------------------------------------------
"   Tabs                                                                  {{{
" ----------------------------------------------------------------------------

set tabstop=4               " Show a tab as four spaces
set shiftwidth=4            " Reindent is also four spaces
set softtabstop=4           " When hit <tab> use four columns
set expandtab               " Create spaces when I type <tab>
set shiftround              " Round indent to multiple of 'shiftwidth'.
set autoindent              " Put my cursor in the right place when I start a new line
filetype plugin indent on   " Rely on file plugins to handle indenting

" }}}-------------------------------------------------------------------------
"   Undo, Backup and Swap file locations                                  {{{
" ----------------------------------------------------------------------------
" set nobackup
set directory=$HOME/.vim/tmp/swap//
set viewdir=$HOME/.vim/tmp/views//
set backupdir=$HOME/.vim/tmp/backup//
if exists('+undodir')
    set undodir=$HOME/.vim/tmp/undodir
    set undofile
endif

" " make vim save view (state) (folds, cursor, etc)
" au BufWinLeave * silent! mkview
" au BufWinEnter * silent! loadview

" }}}-------------------------------------------------------------------------
"   Custom commands                                                       {{{
" ----------------------------------------------------------------------------

" Edit the vimrc file
nmap <silent> <Leader>ev :vsplit $HOME/.vim/vimrc<CR>
nmap <silent> <Leader>sv :source $MYVIMRC<CR>

" Function to trim trailing white space
" Make your own mappings
function! StripTrailingWhitespaces()
    let l = line(".")
    let c = col(".")
    %s/\s\+$//e
    call cursor(l, c)
endfun

" Trim trailing white space
nmap <silent> <Leader>t :call StripTrailingWhitespaces()<CR>

" Cd to the current file's directory
nnoremap <Leader>. :cd %:p:h<CR>:pwd<CR>

" Quickly switch buffers
noremap <silent> <C-w><C-b> :bnext<CR>
noremap <silent> <C-w><C-p> :bnext<CR>
noremap <silent> <C-w><C-right> :bnext<CR>
noremap <silent> <C-w><C-left>  :bprev<CR>

" Return to last edit position when opening files, except git commit message
autocmd BufReadPost *
    \ if &ft != 'gitcommit' && line("'\"") > 0 && line("'\"") <= line("$") |
    \   exe "normal g`\"" |
    \ endif

" Nobody ever uses "Ex" mode, and it's annoying to leave
noremap Q <nop>

" When pasting, refill the default register with what you just pasted
xnoremap p pgvy

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" FILETYPE stuff "{{{
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:bash_is_sh=1
let g:is_bash=1

" }}} """""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" OMNIFUNC stuff "{{{
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
autocmd FileType c set omnifunc=ccomplete#Complete
autocmd FileType python set omnifunc=pythoncomplete#Complete
autocmd FileType html set omnifunc=htmlcomplete#CompleteTags

" }}}
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" PLUGINS {{{
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" pydoc
let g:pydoc_cmd = "pydoc"

" MRU - most recently used fiiles
let MRU_File = $HOME."/.vim/tmp/vim_mru_files"
let MRU_Max_Menu_Entries = 20
let MRU_Max_Submenu_Entries = 20

" C support
let g:C_GlobalTemplateFile = s:plugindir."/c.vim/c-support/templates/Templates"
let g:C_LocalTemplateFile = s:plugindir."/c.vim/c-support/templates/Templates"
let g:C_CodeSnippets = s:plugindir."/c.vim/c-support/codesnippets"

" NERDCommenter
let NERDSpaceDelims=1

" Easytags
let g:easytags_file = '~/.vim/tags/tags'
let g:easytags_dynamic_files = 1
" let g:easytags_by_filetype = '~/.vim/tags'
let g:easytags_on_cursorhold = 0
let g:easytags_events = ['BufWritePost']
" set tags=./tags,/

" NERDTree
let NERDChristmasTree=1
let NERDTreeMouseMode=2
let NERDTreeBookmarksFile=$HOME."/.vim/tmp/NERDTreeBookmarks"
" Show the bookmarks table on startup
let NERDTreeShowBookmarks=1
let NERDTreeShowHidden=1
let NERDTreeCaseSensitiveSort=0
let NERDTreeDirArrows=1

" Syntastic
let g:syntastic_enable_signs=1
let g:syntastic_auto_loc_list=1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0
let g:syntastic_always_populate_loc_list = 1

let g:loaded_syntastic_sh_checkbashisms_checker=1
let g:syntastic_c_compiler_options = ' -std=c99'
let g:syntastic_c_remove_include_errors = 1
let g:syntastic_python_checkers=['pylint', 'python', 'flake8']

" SnipMate
let g:snips_author = 'Adrian Benson <Adrian.M.Benson__AT__gmail__DOT__com>'
let g:snips_company = 'Adrian Benson'
let g:snips_copyright = g:snips_company

" Airline
let g:airline_theme='zenburn'
if !exists('g:airline_symbols')
    let g:airline_symbols = {}
endif
let g:airline_left_sep = ''
let g:airline_right_sep = ''


" }}}
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Functions & keybindings {{{
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" Reselect visual block after indent/outdent: http://vimbits.com/bits/20
vnoremap < <gv
vnoremap > >gv
vnoremap = =gv


noremap <silent> <F2> :NERDTreeToggle<CR>
noremap <silent> <F3> :TagbarToggle<CR>
noremap <silent> <F4> :Bufferlist<CR>
noremap <silent> <F5> :call ToggleLocationList()<CR>

" open file name under cursor in new split buffer
noremap <F8> :vertical wincmd f<CR>
"
"}}}
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Python Stuff {{{
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Python-mode

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
let python_highlight_indent_errors = 1

" trim trailing white space
au filetype python setlocal sw=4 et sts=4 tw=120 colorcolumn=80 fdm=syntax
" au BufWritePre *.py :call StripTrailingWhitespaces()
"}}}
"
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Other Auto Commands "{{{
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" basic filetype stuff
au filetype sh  setlocal sw=4 sts=4 et fdm=syntax
au filetype vim setlocal sw=4 sts=4 et fdm=marker
au filetype c   setlocal sw=4 sts=4 et fdm=syntax
au filetype cpp setlocal sw=4 sts=4 et fdm=syntax
au filetype rst setlocal sw=4 sts=4 et
au filetype ruby setlocal sw=2 sts=2 et fdm=syntax

" }}}

"

" " Restore cursor position, window position, and last search after running a
" " command.
" function! Preserve(command)
"   " Save the last search.
"   let search = @/

"   " Save the current cursor position.
"   let cursor_position = getpos('.')

"   " Save the current window position.
"   normal! H
"   let window_position = getpos('.')
"   call setpos('.', cursor_position)

"   " Execute the command.
"   execute a:command

"   " Restore the last search.
"   let @/ = search

"   " Restore the previous window position.
"   call setpos('.', window_position)
"   normal! zt

"   " Restore the previous cursor position.
"   call setpos('.', cursor_position)
" endfunction

" Specify path to your Uncrustify configuration file.
let g:uncrustify_cfg_file_path =
    \ shellescape(fnamemodify('~/.uncrustify.cfg', ':p'))

" Don't forget to add Uncrustify executable to $PATH (on Unix) or
" %PATH% (on Windows) for this command to work.
function! Uncrustify(language)
  call Preserve(':silent %!uncrustify'
      \ . ' -q '
      \ . ' -l ' . a:language
      \ . ' -c ' . g:uncrustify_cfg_file_path)
endfunction

if filereadable(glob("~/.vimrc.local")) 
    source ~/.vimrc.local
endif

" }}}


