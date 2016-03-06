
"

" Install vim-plug if we don't arlready have it
if empty(glob("~/.vim/autoload/plug.vim"))
    " Ensure all needed directories exist  (Thanks @kapadiamush)
    execute 'mkdir -p ~/.vim/plugged'
    execute 'mkdir -p ~/.vim/autoload'
    " Download the actual plugin manager
    execute '!curl -fLo ~/.vim/autoload/plug.vim https://raw.github.com/junegunn/vim-plug/master/plug.vim'
endif

call plug#begin('~/.vim/plugged')

" file browser
Plug 'scrooloose/nerdtree'
" comments
Plug 'scrooloose/nerdcommenter'
" syntax checker
Plug 'scrooloose/syntastic'


" Git
" Fugitive: Git from within Vim
Plug 'tpope/vim-fugitive'
Plug 'airblade/vim-gitgutter'

" Tags
Plug 'xolox/vim-misc'
Plug 'xolox/vim-easytags'
Plug 'majutsushi/tagbar'

" python
Plug 'xolox/vim-pyref', {'for': 'python'}
Plug 'fs111/pydoc.vim', {'for': 'python'}
Plug 'jmcantrell/vim-virtualenv'
" Find the class/method based on cursor position
" Plug 'vim-scripts/pythonhelper'

" other languages
Plug 'c.vim'
Plug 'bash-support.vim', {'for': 'sh'}

" Adjust 'shiftwidth' and 'expandtab' heuristically based on the current file
Plug 'tpope/vim-sleuth'

" misc tweaks
Plug 'Align'
Plug 'rememberthemer/rtm-snipmate.vim'
Plug 'sandeepcr529/Buffet.vim'
Plug 'ntpeters/vim-better-whitespace'
Plug 'milkypostman/vim-togglelist'
Plug 'mru.vim'
Plug 'emezeske/manpageview'


" pretty pretty
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'junegunn/seoul256.vim'
Plug 'mayansmoke'
Plug 'croaky/vim-colors-github'
Plug 'zenburn'
Plug 'gilgigilgil/anderson.vim'

" my colorscheme
Plug '~/Documents/workspace/vim/vim-dullokai'

" mac specific bundles
if has("unix")
    let s:uname = substitute(system("uname"), '\n','','')
else
    let s:uname = ""
endif

if s:uname == "Darwin"
    Plug 'vim-scripts/applescript.vim'
else
    " Plugin 'majutsushi/tagbar'
endif

call plug#end()

