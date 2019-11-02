let mapleader="\\"
if has('macunix')
   let mapleader="`"
endif
set timeout timeoutlen=3000
set updatetime=100 " Make Gitgutter work quickly
set title


inoremap jj <esc>

" Choose NVim's virtual environment
" if empty($VIRTUAL_ENV)
"   let g:python3_host_prog = '/home/rob/.py3nvim/bin/python'
" endif

" blink cursor on error instead of beeping (grr)
set visualbell
set t_vb=

call plug#begin('~/.vim/plugged')

" My plugins
Plug 'scrooloose/nerdtree'
Plug 'pangloss/vim-javascript'
Plug 'valloric/MatchTagAlways'
Plug 'mxw/vim-jsx'
Plug 'tpope/vim-surround' " Add { [ ' etc. around existing text
Plug 'mattn/emmet-vim', { 'for': ['javascript.jsx', 'html', 'css'] }
Plug 'tpope/vim-commentary' " Easy commenting/uncommenting
Plug 'tpope/vim-repeat' " Lets . work for more complex commands
Plug 'tpope/vim-vinegar' " Improves the netrw file browser
Plug 'tpope/vim-fugitive' " Git plugin
Plug 'airblade/vim-gitgutter' " Git plugin
Plug 'vim-airline/vim-airline'
Plug 'rakr/vim-one' " Atom-esque colour scheme
Plug 'flrnprz/candid.vim' " A dark theme with warm colours
Plug 'jiangmiao/auto-pairs' " Insert or delete brackets, parens, quotes in pair.
Plug 'ap/vim-buftabline' " Show all open buffers at the top of the screen
let g:buftabline_indicators=1 " Show which buffers have been modified
let g:buftabline_numbers=2 " Ordinal numbers
Plug 'valloric/matchtagalways' " Keep matching HTML tag highlighted
Plug 'w0rp/ale' " Asyncronous Linting Engine
Plug 'mileszs/ack.vim' " Runs ack in a quickfix window. e.g. :Ack --js var
Plug 'ctrlpvim/ctrlp.vim' " Fuzzy search for everything
Plug 'vim-scripts/indentpython.vim'
Plug 'vim-python/python-syntax' " Highlight lots of Python 3 syntax
Plug 'tmhedberg/SimpylFold'
let g:python_highlight_all = 1
" Run Black on save
autocmd BufWritePre *.py silent! execute ':Black'
Plug 'psf/black' " Opinionated Python code formatter
Plug 'majutsushi/tagbar'
" Autocompletion
Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' } " asyncronous completion framework
Plug 'deoplete-plugins/deoplete-jedi'
Plug 'carlitux/deoplete-ternjs', { 'do': 'npm install -g tern' } " Javascript autocomplete
Plug 'mhinz/vim-startify' " A start screen for Vim

" All of your Plugins must be added before the following line
call plug#end()            " required

" Use ctrl-shift-F to search in prOject
nnoremap <c-F> :Ack!<space>

" Configure bufferline plugin
" let g:bufferline_rotate=1 " Current buffer in centre
let g:bufferline_pathshorten=1

" Set up ALE linter
let g:ale_sign_error = '●' " Less aggressive than the default '>>'
let g:ale_sign_warning = '.'
" let g:ale_lint_on_enter = 0 " Less distracting when opening a new file
let g:ale_lint_on_enter = 1
let g:ale_echo_msg_format = '%linter%: %s'
let g:ale_linters = {
      \ 'javascript': ['eslint'],
      \ 'python': ['flake8']
      \}
let g:ale_fixers = {
      \ 'javascript': ['prettier', 'eslint'],
      \ 'scss': ['prettier'],
      \ 'html': ['prettier']
      \}
let g:ale_fix_on_save = 1
let g:ale_python_flake8_args="--max-line-length 88"

" Set up deoplete asyncronous completion
let g:deoplete#enable_at_startup = 1
let g:deoplete#sources#jedi#show_docstring = 1
autocmd InsertLeave * silent! pclose!
set splitbelow

" Matchit plugin allows jumping between HTML tags
runtime macros/matchit.vim

" Colour scheme
syntax enable
set termguicolors
colorscheme one
set background=dark " for the dark version
" set background=light " for the light version"
let g:one_allow_italics=1 " italic for comments
highlight Comment cterm=italic

" Lightline config
" set laststatus=2 " This is apparently needed to get lightline to show :S
set noshowmode " Lightline means we don't need to show -- INSERT -- 

" emmet jsx shortcuts
autocmd BufNewFile,BufRead *.js set filetype=javascript.jsx
let g:user_emmet_expandabbr_key='<a-h>'
" Tab is interfering with autocomplete. Remove this
" imap <expr> <tab> emmet#expandAbbrIntelligent("\<tab>")
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

" clear the last search highlighting
nnoremap <silent> <Backspace> :nohl<CR>
" Open NERDTree with a familiar keystroke
nnoremap <c-\> :NERDTreeToggle<CR>
" When pasting, automatically re-indent
" leader+P does normal (no-indent) pasting
nnoremap p ]p
nnoremap <Leader>p p

" Locate the current file in the NERDTree window
nnoremap <Leader>f :NERDTreeFind<CR>

" Automatic reloading of .vimrc
autocmd! bufwritepost .vimrc source %

set clipboard+=unnamedplus,unnamed


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

" Ctrl+A should select all, right?
nnoremap <c-a> ggVG

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
set ignorecase
set smartcase

" Disable stupid backup and swap files - they trigger too many events
" for file system watchers
set nobackup
set nowritebackup
set noswapfile

" Custom Git-related stuff
" https://vimrcfu.com/snippet/177
" Highlight merge conflict markers
match Todo '\v^(\<|\=|\>){7}([^=].+)?$'

" Ignore node_modules
set wildignore+=*/node_modules/*

" Python related stuff
" ====================
au FileType python
\ setlocal tabstop=4 |
\ setlocal softtabstop=4 |
\ setlocal shiftwidth=4 |
\ setlocal textwidth=79 |
\ setlocal expandtab |
\ setlocal autoindent |
\ setlocal fileformat=unix

" Some things to make Vim behave like any other app
nnoremap <a-s> :w<Enter>
nnoremap <a-q> :q<Enter>

" Highlight currently open buffer in NERDTree
" This breaks tagbar! If I end up not using tagbar I could put it back.
" autocmd BufEnter * call SyncTree()

" Configure Tagbar
nnoremap <c-o> :TagbarToggle<CR>
let g:tagbar_autofocus = 1
set updatetime=1500

" Update NERDTree to reflect current buffer and return to previous window
nnoremap <a-f> :NERDTreeFind<CR>:wincmd p<CR>

" Python debugging?
func! s:SetBreakpoint()
  cal append('.', repeat(' ', strlen(matchstr(getline('.'), '^\s*'))) . '__import__("pdb").set_trace()')
endf

func! s:RemoveBreakpoint()
  exe 'silent! g/^\s*__import__("pdb").set_trace()/d'
endf

func! s:ToggleBreakpoint()
  if getline('.')=~#'^\s*__import__("pdb")' | cal s:RemoveBreakpoint() | el | cal s:SetBreakpoint() | en
endf
nnoremap <c-s-b> :call <SID>ToggleBreakpoint()<CR>

" Window resizing
nnoremap <c-Down> <c-w>-
nnoremap <c-Up> <c-w>+
nnoremap <c-Left> <c-w><
nnoremap <c-Right> <c-w>>

" Set some maps for neovim terminal mode (:terminal)
" Exit terminal mode
tnoremap <Esc> <C-\><C-n>
nnoremap <a-t> :terminal<CR>

" Configure SimpylFold
let g:SimpylFold_fold_docstring = 0
let g:SimpylFold_fold_import = 0
set foldlevel=99
nnoremap <Tab> za

" Custome fugitive mappings
nnoremap <c-g> :Gstatus<CR>
