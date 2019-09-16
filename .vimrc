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

" Set up typescript and prettier
autocmd FileType typescript setlocal formatprg=prettier\ --parser\ typescript

call plug#begin('~/.vim/plugged')

" My plugins
Plug 'scrooloose/nerdtree'
Plug 'pangloss/vim-javascript'
Plug 'valloric/MatchTagAlways'
Plug 'mxw/vim-jsx'
Plug 'leafgarland/typescript-vim'
Plug 'peitalin/vim-jsx-typescript'
Plug 'tpope/vim-surround' " Add { [ ' etc. around existing text
Plug 'mattn/emmet-vim', { 'for': ['javascript.jsx', 'html', 'css'] }
Plug 'tpope/vim-commentary' " Easy commenting/uncommenting
Plug 'tpope/vim-repeat' " Lets . work for more complex commands
Plug 'tpope/vim-vinegar' " Improves the netrw file browser
Plug 'tpope/vim-fugitive' " Git plugin
Plug 'itchyny/lightline.vim' " Changes the bug...
" Plug 'sheerun/vim-polyglot' " One package, support for loads of languages
Plug 'rakr/vim-one' " Atom-esque colour scheme
Plug 'jiangmiao/auto-pairs' " Insert or delete brackets, parens, quotes in pair.
Plug 'ap/vim-buftabline' " Show all open buffers at the top of the screen
let g:buftabline_indicators=1 " Show which buffers have been modified
let g:buftabline_numbers=2 " Ordinal numbers
" Plug 'pseewald/vim-anyfold' " Fold anything based on indentation
" Plug 'arecarn/vim-fold-cycle' " Open folds with CR, close with BS
Plug 'valloric/matchtagalways' " Keep matching HTML tag highlighted
" Do I need YouCompleteMe if I have deoplete??
" Plug 'ycm-core/YouCompleteMe' " Python autocomplete
Plug 'HerringtonDarkholme/yats.vim'
Plug 'mhartington/nvim-typescript', { 'build': './install.sh' }
Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
" Asyncronous Linting Engine
Plug 'w0rp/ale'
Plug 'mileszs/ack.vim' " Runs ack in a quickfix window. e.g. :Ack --js var
Plug 'ctrlpvim/ctrlp.vim' " Fuzzy search for everything
Plug 'vim-scripts/indentpython.vim'
" Use ctrl-shift-F to search in project
nnoremap <c-F> :Ack!<space>

" All of your Plugins must be added before the following line
call plug#end()            " required

" Configure bufferline plugin
" let g:bufferline_rotate=1 " Current buffer in centre
let g:bufferline_pathshorten=1

" Customise TSX highlighting colours:
" dark red
hi tsxTagName guifg=#E06C75

" orange
hi tsxCloseString guifg=#F99575
hi tsxCloseTag guifg=#F99575
hi tsxAttributeBraces guifg=#F99575
hi tsxEqual guifg=#F99575

" yellow
hi tsxAttrib guifg=#F8BD7F cterm=italic

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
" let g:ale_lint_on_enter = 0 " Less distracting when opening a new file
let g:ale_lint_on_enter = 1
let g:ale_linters = {
      \ 'javascript': ['eslint'],
      \ 'typescript': ['tsserver', 'tslint'],
      \}
let g:ale_fixers = {
      \ 'javascript': ['prettier', 'eslint'],
      \ 'typescript': ['prettier'],
      \ 'scss': ['prettier'],
      \ 'html': ['prettier']
      \}
let g:ale_fix_on_save = 1

" Set up deoplete asyncronous completion
let g:deoplete#enable_at_startup = 1

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
let g:one_allow_italics=1 " italic for comments
highlight Comment cterm=italic

" Lightline config
set laststatus=2 " This is apparently needed to get lightline to show :S
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
nnoremap <Backspace> :nohl<CR><ESC>
" Open NERDTree with a familiar keystroke
nnoremap <c-\> :NERDTree<CR>
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
