" Satoshi's .vimrc "
""""""""""""""""""""

" Show syntax coloring if it can.
if has("syntax")
    syntax on
endif

if !has("gui_running")
    " Hides the buffer instead of closing it. It also remembers undos and marks.
    set hidden
endif

if has("autocmd")
    " Restore cursor position.
    au BufReadPost * if line("'\"") > 0|if line("'\"") <= line("$")|exe("norm '\"")|else|exe "norm $"|endif|endif

    " Automatically save foldings.
    au BufWinLeave * silent! mkview
    au BufWinEnter * silent! loadview

    " No line numbers when viewing help.
    au FileType helpfile set nonumber

    " Remove all trailing whitespace when saving.
    au BufWritePre * :%s/\s\+$//e
endif

" Set a dark background for solarized color scheme.
"set background=dark
"colorscheme solarized

" Search for the tags file recursively upward.
"set tags=./tags;

" Files to ignore. Useful during tab-completion of files.
set wildignore+=*/tmp/*

" Set "very magic" on all regex searches.
nnoremap   /   /\v
cnoremap  s/  s/\v
cnoremap %s/ %s/\v

" Keep X lines when scrolling.
set scrolloff=7

" Set visual bell
set vb

" Don't make noise.
set noerrorbells

" Always show the status line.
set laststatus=2

" Show the commands being typed.
set showcmd

" Search as you type and highlight.
set incsearch hlsearch

" Show line numbers.
set number

" Show cursor position.
set ruler

" Smart indenting.
set autoindent copyindent smartindent

" Tab and indent = 4 spaces. Also convert tabs into spaces in Insert mode.
set tabstop=4 shiftwidth=4 expandtab smarttab

" Use multiple of shiftwidth when indenting.
set shiftround

" Highlight pairs of {} [] ().
set showmatch

" Ignore case only when searching all lowercase.
set smartcase

" Show menu with possible tab completions. Complete to longest match, then list possibilities.
set wildmode=longest,list

" Highligh the current line.
set cursorline

" Sets how many lines of history Vim has to remember.
set history=1000

" Set how many undos.
set undolevels=1000

" Make backspace more flexible.
set backspace=indent,eol,start

" Arrow keys, bs, space wrap to next/prev line.
set whichwrap=b,s,<,>,[,]

" Allow Vim to use system clipboard.
set clipboard=autoselect

" Turn off swap files.
set noswapfile

" Case insensitive for all lowercase searches.
set ignorecase smartcase
