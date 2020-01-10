" install vim-plug if not already installed
source ~/.vim/utils/plug.vim

call plug#begin()
Plug 'junegunn/fzf.vim'              " fzf ❤️ vim
Plug 'AndrewRadev/linediff.vim'      " Perform diffs on blocks of code
Plug 'tomasr/molokai'                " Molokai color scheme
Plug 'enricobacis/paste.vim'         " Paste from clipboard at full speed
Plug 'SirVer/ultisnips'              " The ultimate snippet solution
Plug 'vim-airline/vim-airline'       " lean & mean status/tabline for vim
Plug 'enricobacis/vim-airline-clock' " Clock for vim-airline
Plug 'tpope/vim-commentary'          " Comment stuff out
Plug 'easymotion/vim-easymotion'     " Vim motions on speed!
Plug 'Olical/vim-enmasse'            " Edit every line in a quickfix list
Plug 'tpope/vim-fugitive'            " awesome git wrapper
Plug 'rhysd/vim-grammarous'          " A powerful grammar checker using LanguageTool
Plug 'terryma/vim-multiple-cursors'  " Sublime Text style multiple selection
Plug 'sheerun/vim-polyglot'          " A solid language pack for Vim
Plug 'thinca/vim-quickrun'           " Run commands quickly
Plug 'tpope/vim-sensible'            " Defaults everyone can agree on
Plug 'mhinz/vim-signify'             " Show a diff via Vim sign column
Plug 'tpope/vim-sleuth'              " Heuristically set buffer options
Plug 'honza/vim-snippets'            " UltiSnips snippets
Plug 'mhinz/vim-startify'            " A fancy start screen
Plug 'tpope/vim-unimpaired'          " Pairs of handy bracket mappings
Plug 'maxbrunsfeld/vim-yankstack'    " Yank and delete things without worries
Plug 'mileszs/ack.vim',              { 'on':  'Ack' }                " Vim plugin for ack/ag
Plug 'mattn/emmet-vim',              { 'for': ['html'] }             " Crazy fast html coding
Plug 'junegunn/fzf',                 { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'sjl/gundo.vim',                { 'on':  'GundoToggle' }        " Graph your Vim undo tree in style
Plug 'scrooloose/nerdtree',          { 'on':  'NERDTreeToggle' }     " A tree explorer plugin
Plug 'Shougo/vimproc.vim',           { 'do' : 'make' }               " Interactive command execution
Plug 'heavenshell/vim-jsdoc',        { 'for': ['javascript'] }       " Generate JsDoc
Plug 'artur-shaik/vim-javacomplete2',{ 'for' : ['java'] }            " Javacomplete plugin for vim
Plug 'rdnetto/YCM-Generator',        { 'branch': 'stable' }          " YouCompleteMe generator
Plug 'Valloric/YouCompleteMe',       { 'for': ['c','cpp','java','javascript','python'], 'do': './install.py --clang-completer', 'frozen': 1 }
" Syntax highlighting
Plug (v:version < 800 ? 'scrooloose/syntastic' : 'w0rp/ale')
call plug#end()

set nocompatible                     " be iMproved
syntax enable                        " enable color formattation
filetype plugin indent on            " enable indentation

set mouse=a                          " allow scrolling with mouse
set autoindent                       " autoindent when starting new line
set autoread                         " reload unchanged files automatically
set backspace=indent,eol,start       " allow backspace in insert mode
set cursorline                       " highlight current line
set encoding=utf-8                   " force utf-8 encoding
set ignorecase smartcase incsearch   " smart incremental case-insensitive search
set lazyredraw                       " redraw only when we need to
set nrformats-=octal                 " disable octal format for number processing
set number                           " show line number
set scrolloff=1                      " prevent cursor for reaching the first/last line
set shell=/bin/bash                  " set bash as vim shell
set showcmd                          " show command in bottom bar
set smarttab                         " use 'shiftwidth' when using <Tab>
set splitbelow splitright            " define where to open splits
set t_Co=256                         " enable 256 colors
set tabstop=4 shiftwidth=4 expandtab " indent using four spaces
set title                            " set window title by default
set wildmenu                         " visual autocomplete for command menu
set hlsearch                         " highlight search results
set noshowmode                       " don't show mode (there is airline)
set list listchars=tab:»\ ,trail:·   " show hidden characters

" Set space as leader key
let mapleader = "\<Space>"
nnoremap <SPACE> <Nop>

" It's 21st century.
noremap j gj
noremap k gk

" Clear search highlighting
map <C-l> :nohlsearch<CR>

" Keep search matches in the middle of the screen
nnoremap n nzz
nnoremap N Nzz

" Use Ctrl-S to save
nnoremap <C-s> :w<CR>
inoremap <C-s> <ESC>:w<CR>li

" make Q like q (exit)
command! Q q

" Ale
let g:ale_fixers = ['yapf']
nmap <leader>x :ALEFix<CR>
nmap <leader>e <Plug>(ale_next_wrap)

" Airline
let g:airline#extensions#whitespace#show_message = 0
let g:airline_powerline_fonts = 1
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#show_buffers = 0
let g:airline#extensions#tabline#tab_min_count = 2
let g:airline#extensions#tabline#show_splits = 1
let g:airline#extensions#ale#enabled = 1
let g:airline#extensions#ale#error_symbol = "\uf05e "
let g:airline#extensions#ale#warning_symbol = "\uf071 "
let g:airline#extensions#ale#show_line_numbers = 1
let g:airline#extensions#ale#open_lnum_symbol = ' (@'

" Vim Commentary
vmap <leader>c gc
nmap <leader>c gcc

" Vim Grammarous
let g:grammarous#use_vim_spelllang = 1
nmap <leader>s :GrammarousCheck<CR>

" vim-easymotion
let g:EasyMotion_do_mapping = 0
let g:EasyMotion_smartcase = 1
nmap <leader><space> <Plug>(easymotion-overwin-f2)

" Nerd tree
map <F4> :NERDTreeToggle<CR>
let NERDTreeQuitOnOpen = 1
let NERDTreeIgnore =['\~$', '.DS_Store$']              " Temporary files
let NERDTreeIgnore+=['\.png$', '\.pdf$', '\.eps$']     " Image files
let NERDTreeIgnore+=['\.pyc$', '__pycache__$']         " Python compiled files
let NERDTreeIgnore+=['\.o$', '\.so$', '\.a$']          " C compiled files

" Yankstack
let g:yankstack_yank_keys = ['c', 'C', 'd', 'D', 'S', 'x', 'X', 'y', 'Y']
nmap <C-P> <Plug>yankstack_substitute_older_paste
nmap <C-N> <Plug>yankstack_substitute_newer_paste

" Gundo
nnoremap <F5> :GundoToggle<CR>
let g:gundo_close_on_revert = 1

" Signify
let g:signify_vcs_list = ['git', 'svn']

" Startify
let g:startify_custom_header = []
let g:startify_bookmarks = [ '~/.vimrc' ]
let g:startify_change_to_dir = 0
let g:startify_change_to_vcs_root = 1

" Quickrun
let g:quickrun_config = {}
let g:quickrun_config._ = { 'hook/shebang/enable': 1, 'runner': 'vimproc', 'runner/vimproc/updatetime': 100 }
let g:quickrun_config.python = { 'cmdopt': '-u' }

" Ack
nnoremap <leader>a :Ack<space>
if executable('ag')
  let g:ackprg = 'ag --vimgrep'
endif

" Theme
let g:molokai_original = 1
let g:rehash256 = 1
silent! colorscheme molokai

" Allow saving of files as sudo when I forgot to start vim using sudo.
cmap w!! w !sudo tee > /dev/null %

" Wrap lines when using vimdiff
autocmd FilterWritePre * if &diff | setlocal wrap< | endif

" Put arrow keys at work
nmap <Left> <<
nmap <Right> >>
nmap <Up> [e
nmap <Down> ]e
vmap <Left> <gv
vmap <Right> >gv
vmap <Up> [egv
vmap <Down> ]egv

" Resize
nnoremap <silent> <Leader>+ :exe "resize " . (winheight(0) * 3/2)<CR>
nnoremap <silent> <Leader>- :exe "resize " . (winheight(0) * 2/3)<CR>

" let terminal resize scale the internal windows
autocmd VimResized * :wincmd =

" jj for esc
inoremap jj <Esc>

" Fzf (CtrlP alternative)
map <leader>p :FZF<CR>

" ctags utilities
set tags=./tags;/
map <leader>q <C-]>

" YouCompleteMe
let g:ycm_confirm_extra_conf = 0
let g:ycm_add_preview_to_completeopt = 1
let g:ycm_autoclose_preview_window_after_completion = 1
let g:ycm_goto_buffer_command = 'new-or-existing-tab'
let g:ycm_extra_conf_vim_data = ['&filetype']
let g:ycm_global_ycm_extra_conf = '~/.vim/utils/ycm_extra_conf.py'
" use the first python in PATH (allow virtualenv)
let g:ycm_python_binary_path = 'python'
nnoremap <leader>f :YcmCompleter FixIt<CR>
nnoremap <leader>g :YcmCompleter GoTo<CR>
autocmd FileType java setlocal omnifunc=javacomplete#Complete

" UltiSnip
let g:UltiSnipsExpandTrigger = "<C-j>"
let g:UltiSnipsJumpForwardTrigger = "<C-j>"
let g:UltiSnipsJumpBackwardTrigger = "<C-k>"

" LineDiff
vnoremap <F1> :Linediff<CR>
autocmd User LinediffBufferReady nnoremap <buffer> q :LinediffReset<CR>

" JsDoc
let g:jsdoc_allow_input_prompt = 1
let g:jsdoc_input_description = 1
let g:jsdoc_additional_description = 1
let g:jsdoc_tags = {} | let g:jsdoc_tags['returns'] = 'return'
nmap <silent> <leader>d <Plug>(jsdoc)

" easy motions between splits
nnoremap <leader>h <C-W>h
nnoremap <leader>j <C-W>j
nnoremap <leader>k <C-W>k
nnoremap <leader>l <C-W>l
" vertical split:   |
nnoremap <expr><silent> \| !v:count ? "<C-W>v<C-W><Right>" : '\|'
" horizontal split: _
nnoremap <expr><silent> _ !v:count ? "<C-W>s<C-W><Down>"  : '_'
" next split: <Tab>
nnoremap <Tab> <C-W>w
" previous split: <S-Tab>
nnoremap <S-Tab> <C-W>W

" toggle paste mode with F2
set pastetoggle=<F2>

" use single folder for swap files
set directory=~/.vim/swap,.

" maintain undo history between sessions
set undofile
set undodir=~/.vim/undo,.

" Spell checker
autocmd FileType text,latex,tex,md,markdown
  \ setlocal spell |
  \ highlight SpellBad cterm=underline ctermfg=red

" emmet expansion for html
autocmd FileType html
  \ imap <expr> <tab> emmet#expandAbbrIntelligent("\<tab>")
