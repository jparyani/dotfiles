set nocompatible " Must come first because it changes other options.
filetype off " Necessary on some Linux distros for pathogen to properly load bundles

" *********************************************
" * Vundle - Vim Plugins *
" *********************************************
set rtp+=~/.vim/bundle/vundle/
call vundle#rc()

" Let Vundle manage Vundle
Bundle 'gmarik/vundle'

Bundle 'altercation/vim-colors-solarized'
Bundle 'ervandew/supertab'
Bundle 'Lokaltog/vim-powerline'
Bundle 'davidhalter/jedi-vim'
Bundle 'scrooloose/nerdtree'
Bundle 'kien/ctrlp.vim'
Bundle 'fholgado/minibufexpl.vim'
Bundle 'klen/python-mode'
Bundle 'kchmck/vim-coffee-script'
Bundle 'digitaltoad/vim-jade.git'

" *********************************************
" * Settings *
" *********************************************
set encoding=utf-8
syntax enable
filetype plugin indent on " load file type plugins + indentation

set showcmd " Display incomplete commands.
set showmode " Display the mode you're in.
set showmatch " Show matching brackets/parenthesis

"set nowrap " don't wrap lines
set tabstop=4 shiftwidth=4 " a tab is two spaces (or set this to 4)
set expandtab " use spaces, not tabs (optional)
set backspace=indent,eol,start " backspace through everything in insert mode"
set autoindent " match indentation of previous line
set pastetoggle=<F2>

set incsearch " Find as you type search
set hlsearch " Highlight search terms
set ignorecase " Case-insensitive searching.
set smartcase " But case-sensitive if expression contains a capital letter.

set foldmethod=indent "fold based on indent
set foldnestmax=3 "deepest fold is 3 levels
set nofoldenable "dont fold by default

set hidden " Handle multiple buffers better.
set title " Set the terminal's title
set number " Show line numbers.
set ruler " Show cursor position.
set wildmode=list:longest " Complete files like a shell.
set wildmenu " Enhanced command line completion.
set wildignore=*.o,*.obj,*~ "stuff to ignore when tab completing
set novisualbell
set noerrorbells
set history=1000 " Store lots of :cmdline history

set scrolloff=3
set sidescrolloff=7

set mouse-=a
set mousehide
set ttymouse=xterm2
set sidescroll=1

set nobackup " Don't make a backup before overwriting a file.
set nowritebackup " And again.
set directory=/tmp " Keep swap files in one location
set timeoutlen=500

set laststatus=2 " Show the status line all the time
"set statusline=[%n]\ %<%.99f\ %h%w%m%r%y\ %{exists('*CapsLockStatusline')?CapsLockStatusline():''}%=%-16(\ %l,%c-%v\ %)%P

"set t_Co=256 " Set terminal to 256 colors
set background=dark
colorscheme solarized

" *********************************************
" * Key Bindings *
" *********************************************
let mapleader = ","

" File tree browser - backslash
map \ :NERDTreeToggle<CR>
" File tree browser showing current file - pipe (shift-backslash)
map \| :NERDTreeFind<CR>

" *********************************************
" * Plugin Customization *
" *********************************************

"# ctrlp.vim
set wildignore+=*/.git/*,*/.hg/*,*/.svn/* " for Linux/MacOSX
set wildignore+=*/tmp/*,*.so,*.swp,*.zip

" coffeescript
au BufNewFile,BufReadPost *.coffee setl shiftwidth=2 expandtab

