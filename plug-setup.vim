" Set up plugins

" Install vim-plug if not already installed
if empty(glob("~/.vim/autoload/plug.vim"))
    " Ensure all needed directories exist  (Thanks @kapadiamush)
    execute '!mkdir -p ~/.vim/plugged'
    execute '!mkdir -p ~/.vim/autoload'
    " Download the actual plugin manager
    execute '!curl -fLo ~/.vim/autoload/plug.vim https://raw.github.com/junegunn/vim-plug/master/plug.vim'
endif

call plug#begin('~/.vim/plugged')

" file browser
Plug 'scrooloose/nerdtree'
" commenting magic
Plug 'scrooloose/nerdcommenter'
" syntax checker
Plug 'scrooloose/syntastic'


" Git ====
" Git from within Vim
Plug 'tpope/vim-fugitive'
"
" Show +/- for uncommitted changes
Plug 'airblade/vim-gitgutter'


" Tags ====
Plug 'xolox/vim-misc'
" Scan and update tags (i.e. functions, declarations etc)
Plug 'xolox/vim-easytags'
" Browse tags
Plug 'majutsushi/tagbar'
" Plug 'valloric/youcompleteme'
" Plug 'ervandew/supertab'

" Python ====
Plug 'xolox/vim-pyref', {'for': 'python'}
" browse pydoc using 'shift-k'
Plug 'fs111/pydoc.vim', {'for': 'python'}
" interact with python virtual envs
Plug 'jmcantrell/vim-virtualenv'
" automatically fix/prettify python code
Plug 'tell-k/vim-autopep8', {'for': 'python'}
" Plug 'hhatto/autopep8'
"
" other languages ====
Plug 'vim-scripts/c.vim'
" Plug 'bash-support.vim', {'for': 'sh'}


" misc tweaks ====
" Adjust 'shiftwidth' and 'expandtab' heuristically based on the current file
Plug 'tpope/vim-sleuth'
" align text/blocks in choice ways
Plug 'vim-scripts/Align'
" code snippets
Plug 'SirVer/ultisnips'
Plug 'honza/vim-snippets'

Plug 'milkypostman/vim-togglelist'
" list Most Recently Used files
Plug 'vim-scripts/mru.vim'
" open manpages from within vim (shift-k)
Plug 'emezeske/manpageview'

" strip white spaces
Plug 'ntpeters/vim-better-whitespace'

" indent guides
Plug 'nathanaelkane/vim-indent-guides'


" pretty pretty
" A nice tool line
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'

" themes
Plug 'junegunn/seoul256.vim'
Plug 'vim-scripts/mayansmoke'
Plug 'vim-scripts/zenburn'
Plug 'gilgigilgil/anderson.vim'
Plug 'tomasr/molokai'
Plug 'KabbAmine/yowish.vim'

" my colorscheme
Plug 'rememberthemer/vim-dullokai'
Plug 'rhysd/vim-color-spring-night'
Plug 'zanglg/nova.vim'

call plug#end()

