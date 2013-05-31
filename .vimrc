" Satoshi's .vimrc "
""""""""""""""""""""

"" Vundle required configuration ""
    " Required - Don't emulate VI's original bugs and limitations.
    set nocompatible

    " Required.
    filetype off
    set rtp+=~/.vim/bundle/vundle/
    call vundle#rc()
    Bundle 'gmarik/vundle'

    " My bundles.
    Bundle 'kien/ctrlp.vim'
    Bundle 'joonty/vdebug.git'
    Bundle 'mileszs/ack.vim'
    Bundle 'kshenoy/vim-signature'
    Bundle 'flazz/vim-colorschemes'
    Bundle 'Lokaltog/powerline', {'rtp': 'powerline/bindings/vim/'}

    " Required
    filetype plugin indent on

"" Vdebug ""
    let g:vdebug_options = {
    \   'path_maps': {
    \       '/var/www/vhost': '/Users/hobbes3/mounts/nead/var/www/vhost',
    \   },
    \   'server': '0.0.0.0',
    \   'timeout': 5
    \}

    let g:vdebug_features = {
    \   'max_depth': 99999,
    \   'max_children': 99999,
    \   'max_data': 99999
    \}

    let g:vdebug_keymap = {
    \    'set_breakpoint': '<F5>',
    \    'close': '<F6>',
    \    'detach': '<F7>',
    \    'run': '<F8>',
    \    'run_to_cursor': '<F9>',
    \    'step_over': '<F10>',
    \    'step_into': '<F11>',
    \    'step_out': '<S-F11>',
    \    'get_context': '<F12>',
    \    'eval_under_cursor': '<Leader>]',
    \}

    " <Leader>e is evaulating under the visual cursor for Vdebug.
    vmap <Leader>[ <Leader>e

"" ack.vim ""
    nnoremap <leader>' :Ack<Space>

"" Powerline ""
    let g:Powerline_symbols = 'fancy'

    " Hide the default mode text (e.g. -- INSERT -- below the status line).
    set noshowmode

    if !has("gui_running")
        if has("autocmd")
            " For terminal Vim, remove the 1 sec delay on updating the status after exiting insert mode.
            set ttimeoutlen=10
            augroup FastEscape
                autocmd!
                au InsertEnter * set timeoutlen=0
                au InsertLeave * set timeoutlen=1000
            augroup END
        endif
    else
        " If it's graphical Vim, then use the custom fonts to properly display Powerline status.
        set guifont=Menlo\ for\ Powerline:h12
    endif

"" ctrlp ""
    " Remap the default <c-p>.
    let g:ctrlp_map = '<Leader>i'

    " Ignore files and folders.
    let g:ctrlp_custom_ignore = {
    \ 'dir':  '\v[\/](\.(git|hg|svn)|Applications|Downloads|Games|Library|Movies|Music|Pictures|pytz\/zoneinfo)$',
    \ 'file': '\v\.(exe|so|dll|wav|mp3|mo|DS_Store|svn|png|jpe?g|jpg\.mno|gif|elc|rbc|pyc|swp|psd|ai|pdf|mov|aep|dmg|tar|zip|gz|shx|shp|wmf||bmp|ico|avi|docx?|xlsx?|pptx?|upart)$',
    \ 'link': '\v\.__INCLUDE_VERSION__$',
    \}

" Show syntax coloring if it can.
if has("syntax")
    syntax on
endif

if !has("gui_running")
    " Remember undo after quitting.
    set hidden

    " Set the color theme for Terminal which doesn't support 256-colors.
    colorscheme jellybeans
else
    " Set
    colorscheme solarized
endif

" Files to ignore. Useful during tab-completion of files.
set wildignore+=*/tmp/*

" Search for the tags file recursively upward.
set tags=./tags;

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

" Set a dark background.
set background=dark

" Allow Vim to use system clipboard.
set clipboard=autoselect

" Turn off swap files.
set noswapfile

" Case insensitive for all lowercase searches.
set ignorecase smartcase

"" PHP ""
    " SQL syntax highlighting inside strings.
    let php_sql_query=1
    " HTML syntax highlighting inside strings.
    let php_htmlInStrings=1

" Set the status line (no longer used because of Powerline).
"set statusline=%F%m%r%h%w[%L][%{&ff}]%y[%p%%][%04l,%04v]
"              | | | | |  |   |      |  |     |    |
"              | | | | |  |   |      |  |     |    + current
"              | | | | |  |   |      |  |     |       column
"              | | | | |  |   |      |  |     +-- current line
"              | | | | |  |   |      |  +-- current % into file
"              | | | | |  |   |      +-- current syntax in
"              | | | | |  |   |          square brackets
"              | | | | |  |   +-- current fileformat
"              | | | | |  +-- number of lines
"              | | | | +-- preview flag in square brackets
"              | | | +-- help flag in square brackets
"              | | +-- readonly flag in square brackets
"              | +-- modified flag in square brackets
"              +-- full path to file in the buffer

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
