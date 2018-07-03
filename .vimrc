set nocompatible              " be iMproved, required
set noesckeys                 " Prevents use of arrow keys in insert. Means <ESC>O won't wait
filetype plugin indent on
syntax on
let mapleader="`"
set timeout timeoutlen=3000

" blink cursor on error instead of beeping (grr)
set visualbell
set t_vb=

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" let Vundle manage Vundle, required
Plugin 'gmarik/Vundle.vim'
Plugin 'vim-syntastic/syntastic'
Plugin 'altercation/vim-colors-solarized'
Plugin 'tpope/vim-surround'
Plugin 'mattn/emmet-vim', { 'for': ['javascript.jsx', 'html', 'css'] }
Plugin 'tpope/vim-commentary'
Plugin 'tpope/vim-repeat'
Plugin 'tpope/vim-vinegar'
Plugin 'itchyny/lightline.vim'
" Plugin 'sheerun/vim-polyglot'
Plugin 'rakr/vim-one'
Plugin 'jiangmiao/auto-pairs'
Plugin 'bling/vim-bufferline'
" Plugin 'pseewald/vim-anyfold'
" Plugin 'arecarn/vim-fold-cycle'
Plugin 'valloric/matchtagalways'
Plugin 'pangloss/vim-javascript'
Plugin 'mxw/vim-jsx'

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required
" There's a bug in polyglot about the graphql language
let g:polyglot_disabled = ['graphql']

" Set up syntastic linter
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0
let g:syntastic_javascript_checkers=['eslint']

" Default netrw window is half the total width. That's too much
let g:netrw_winsize=18

" Matchit plugin allows jumping between HTML tags
runtime macros/matchit.vim

" For anyfold plugin:
" let anyfold_activate=1
" set foldlevel=20

" Colour scheme
syntax enable
set t_Co=256
let g:lightline = { 'colorscheme': 'one' }
colorscheme one
" set background=dark " for the dark version
set background=light " for the light version"
let g:one_allow_italics = 1 " I love italic for comments"
set laststatus=2 " This is apparently needed to get lightline to show :S
set noshowmode " Lightline means we don't need to show -- INSERT -- 

" emmet jsx shortcuts
autocmd BufNewFile,BufRead *.js set filetype=javascript.jsx
let g:user_emmet_expandabbr_key='<Tab>'
imap <expr> <tab> emmet#expandAbbrIntelligent("\<tab>")
let g:jsx_ext_required = 0
let g:user_emmet_settings={
\  'javascript.jsx' : {
\    'extends': 'jsx',
\    'default_attributes': {
\      'label': [{'htmlFor': ''}],
\      'class': {'className': ''},
\    }
\  },
\}
autocmd FileType html,css,javascript.jsx EmmetInstall

"' Makes j and k move over wrapped lines, like you'd expect.
set linebreak
noremap j gj
noremap k gk

" ESC clears the last search highlighting
nnoremap <ESC> :nohl<CR><ESC>

" Automatic reloading of .vimrc
autocmd! bufwritepost .vimrc source %

set clipboard=unnamed


" Indentation
" set smartindent " Unindents comments
" http://stackoverflow.com/questions/354097/
" how-to-configure-vim-to-not-put-comments-at-the-beginning-of-lines-while-editing
set cindent

" bind Ctrl+<movement> keys to move around the windows, instead of using Ctrl+w + <movement>
noremap <c-j> <c-w>j
noremap <c-k> <c-w>k
noremap <c-l> <c-w>l
noremap <c-h> <c-w>h

" Help with creating a new line between, e.g., HTML tags or braces etc.
nnoremap <Leader><CR> i<CR><ESC>O
" NOTE: We don't do this any more!
" " easier moving between tabs
" map <Leader>h <esc>:tabprevious<CR>
" map <Leader>l <esc>:tabnext<CR>

" Switch buffers more easily
set hidden " Allows for unsaved buffers to be hidden
noremap <Leader>l <esc>:bn<CR>
noremap <Leader>h <esc>:bp<CR>
noremap <Leader>d <esc>:bn\|bd #<CR> " Deletes buffer without closing split. See https://stackoverflow.com/a/4468491/2071807

" Showing line numbers and length
set number " show line numbers
set fo-=t " don't automatically wrap text when typing

" Useful settings
set history=700
set undolevels=700

" Real programmers don't use TABs but spaces
set tabstop=2
set softtabstop=0 noexpandtab
set shiftwidth=2
set shiftround
set expandtab

" Make search case insensitive
set hlsearch
set incsearch
set ignorecase
set smartcase

" Disable stupid backup and swap files - they trigger too many events
" for file system watchers
set nobackup
set nowritebackup
set noswapfile


