set nocompatible              " be iMproved, required
filetype off
let mapleader="\\"
if has('macunix')
   let mapleader="`"
endif
set timeout timeoutlen=3000

" blink cursor on error instead of beeping (grr)
set visualbell
set t_vb=

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" let Vundle manage Vundle, required
Plugin 'gmarik/Vundle.vim'
Plugin 'scrooloose/nerdtree'
Plugin 'pangloss/vim-javascript'
Plugin 'valloric/MatchTagAlways'
Plugin 'mxw/vim-jsx'
Plugin 'tpope/vim-surround' " Add { [ ' etc. around existing text
Plugin 'mattn/emmet-vim', { 'for': ['javascript.jsx', 'html', 'css'] }
Plugin 'tpope/vim-commentary' " Easy commenting/uncommenting
Plugin 'tpope/vim-repeat' " Lets . work for more complex commands
Plugin 'tpope/vim-vinegar' " Improves the netrw file browser
Plugin 'itchyny/lightline.vim' " Changes the bug...
" Plugin 'sheerun/vim-polyglot' " One package, support for loads of languages
Plugin 'rakr/vim-one' " Atom-esque colour scheme
Plugin 'jiangmiao/auto-pairs' " Insert or delete brackets, parens, quotes in pair.
" Plugin 'bling/vim-bufferline'
Plugin 'ap/vim-buftabline' " vim-bufferline doesn't allow easy switch between tabs. This does
" Plugin 'pseewald/vim-anyfold' " Fold anything based on indentation
" Plugin 'arecarn/vim-fold-cycle' " Open folds with CR, close with BS
Plugin 'valloric/matchtagalways' " Keep matching HTML tag highlighted
Plugin 'w0rp/ale'
Plugin 'terryma/vim-multiple-cursors' " Put a cursor on several matches of a selection with <C-n>
" Plugin 'vim-syntastic/syntastic'  

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required
" There's a bug in polyglot about the graphql language
let g:polyglot_disabled = ['graphql']

" Configure bufferline plugin
" let g:bufferline_rotate=1 " Current buffer in centre
let g:bufferline_pathshorten=1

" " Set up syntastic linter
" set statusline+=%#warningmsg#
" set statusline+=%{SyntasticStatuslineFlag()}
" set statusline+=%*

" let g:syntastic_always_populate_loc_list = 1
" let g:syntastic_auto_loc_list = 1
" let g:syntastic_check_on_open = 1
" let g:syntastic_check_on_wq = 0
" let g:syntastic_javascript_checkers=['eslint']

" Set up ALE linter
let g:ale_sign_error = '●' " Less aggressive than the default '>>'
let g:ale_sign_warning = '.'
let g:ale_lint_on_enter = 0 " Less distracting when opening a new file

" Default netrw window is half the total width. That's too much
let g:netrw_winsize=18

" Matchit plugin allows jumping between HTML tags
runtime macros/matchit.vim

" For anyfold plugin:
let anyfold_activate=1
set foldlevel=20 " All folds start open

" Colour scheme
syntax enable
set t_Co=256
let g:lightline = { 'colorscheme': 'one' }
colorscheme one
" set background=dark " for the dark version
set background=light " for the light version"
let g:one_allow_italics=1 " I love italic for comments"
highlight Comment cterm=italic

" Lightline config
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
\
\    }
\  },
\}
autocmd FileType html,css,javascript.jsx EmmetInstall

"' Makes j and k move over wrapped lines, like you'd expect.
set linebreak
noremap j gj
noremap k gk

" ESC clears the last search highlighting
nnoremap <Leader>f :nohl<CR><ESC>
" Open NERDTree with a familiar keystroke
nnoremap <c-\> :NERDTree<CR>

" Automatic reloading of .vimrc
autocmd! bufwritepost .vimrc source %

set clipboard=unnamedplus,unnamed


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

" Switch buffers more easily
set hidden " Allows for unsaved buffers to be hidden
" Switch buffers like Atom tabs.
nmap <a-1> <Plug>BufTabLine.Go(1)
nmap <a-2> <Plug>BufTabLine.Go(2)
nmap <a-3> <Plug>BufTabLine.Go(3)
nmap <a-4> <Plug>BufTabLine.Go(4)
nmap <a-5> <Plug>BufTabLine.Go(5)
nmap <a-6> <Plug>BufTabLine.Go(6)
nmap <a-7> <Plug>BufTabLine.Go(7)
nmap <a-8> <Plug>BufTabLine.Go(8)
nmap <a-9> <Plug>BufTabLine.Go(9)
nmap <a-0> <Plug>BufTabLine.Go(10)
noremap <Leader>l <esc>:bn<CR>
noremap <Leader>h <esc>:bp<CR>

" Deletes buffer without closing split. See https://stackoverflow.com/a/4468491/2071807
noremap <a-w> <esc>:bp\|bd #<CR>
" Open .vimrc
noremap <a-,> <esc>:e ~/.vimrc<CR>

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
" set ignorecase
" set smartcase

" Disable stupid backup and swap files - they trigger too many events
" for file system watchers
set nobackup
set nowritebackup
set noswapfile


