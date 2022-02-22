let mapleader="\\"
if has('macunix')
   let mapleader="`"
endif
set timeout timeoutlen=3000
set updatetime=100 " Make Gitgutter work quickly
set title
nnoremap Q <nop> " Disable entering ex mode accidentally
" snake-case words are words too!
set iskeyword+=-

" Copy current filepath
nnoremap <silent> <leader>cf :let @+=@%<CR>
nnoremap <silent> <leader>tn :tabnext<CR>

" Allow macro-running in visual mode
vnoremap @ :normal @

" View tab characters
set list
set listchars=tab:>-

inoremap jj <esc>

" Choose NVim's virtual environment
let g:python3_host_prog = '/home/rob/.py3nvim/bin/python'

" blink cursor on error instead of beeping (grr)
set visualbell
set t_vb=

" Speed up macro execution on multiple lines
" https://vi.stackexchange.com/a/4316/2026
set lazyredraw

call plug#begin('~/.vim/plugged')

" My plugins
Plug 'tomasiser/vim-code-dark'
Plug 'christoomey/vim-tmux-runner'
Plug 'christoomey/vim-tmux-navigator'
Plug 'scrooloose/nerdtree'
Plug 'pangloss/vim-javascript'
Plug 'mxw/vim-jsx'
Plug 'tpope/vim-surround' " Add { [ ' etc. around existing text
Plug 'mattn/emmet-vim'
Plug 'tomtom/tcomment_vim' " Better than vim-commentary
Plug 'tpope/vim-repeat' " Lets . work for more complex commands
" I don't use this at the moment and I keep pressing `-` by accident
" Plug 'tpope/vim-vinegar' " Improves the netrw file browser
Plug 'tpope/vim-fugitive' " Git plugin
Plug 'tpope/vim-rhubarb' " For linking with Github.com
Plug 'airblade/vim-gitgutter' " Stage/Undo/preview of diffs via <leader>h
let g:gitgutter_highlight_linenrs = 1
Plug 'kshenoy/vim-signature' " Show marks in the gutter
Plug 'vim-airline/vim-airline'
let g:airline#extensions#tabline#enabled = 1 " Use the airline tabline (replacement for buftabline)
let g:airline#extensions#tabline#show_tab_nr = 1
let g:airline#extensions#tabline#tab_nr_type = 1 " tab number
let g:airline#extensions#tabline#buffer_idx_mode = 1
let g:airline_powerline_fonts = 1
let g:airline#extensions#tabline#ignore_bufadd_pat = '!|branches|index'
" The following is an attempt to stop airline being really slow. See
" https://github.com/vim-airline/vim-airline/wiki/FAQ
let g:airline_highlighting_cache = 1
Plug 'jiangmiao/auto-pairs' " Insert or delete brackets, parens, quotes in pair.
Plug 'fisadev/vim-isort'
let g:vim_isort_python_version = 'python3'
Plug 'valloric/matchtagalways' " Keep matching HTML tag highlighted
Plug 'vim-scripts/indentpython.vim'
Plug 'vim-python/python-syntax' " Highlight lots of Python 3 syntax
let g:python_highlight_all = 1
Plug 'psf/black' " Opinionated Python code formatter
" run Black
nnoremap <leader>rb :Black<CR>
Plug 'majutsushi/tagbar'
Plug 'Yggdroot/indentLine' " Help align Python indentation
" Autocompletion
Plug 'sodapopcan/vim-twiggy'
Plug 'junegunn/gv.vim' " Git commit browser
Plug 'janko/vim-test' " A Vim wrapper for running tests on different granularities
Plug 'junegunn/vim-easy-align' " Useful for aligning Markdown tables
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } } " Fuzzy find
Plug 'junegunn/fzf.vim'
Plug 'lifepillar/pgsql.vim'
" Highlight SQL files automatically
let g:sql_type_default = 'pgsql'
" Some enhancements to * searching
" Don't jump when pressing *
" Allow * in visual mode for partial word selection
Plug 'haya14busa/vim-asterisk' 
map *  <Plug>(asterisk-z*)
map #  <Plug>(asterisk-z#)
map g* <Plug>(asterisk-gz*)
map g# <Plug>(asterisk-gz#)
let g:asterisk#keeppos = 1  " Cursor jumps to same place within word 
Plug 'mechatroner/rainbow_csv' " Highlighting for CSV files
let g:rbql_with_headers = 1
Plug 'hashivim/vim-terraform' " Terraform command and syntax
Plug 'nvie/vim-flake8'
" Markdown support: tabular is a pre-requisite of vim-markdown
Plug 'godlygeek/tabular'
Plug 'plasticboy/vim-markdown'
let g:vim_markdown_conceal_code_blocks = 0
Plug 'leafoftree/vim-vue-plugin'
nnoremap <leader>gl :w<CR>:!lavender %<CR>


" Open NERDTree if no files were specified. See
" https://github.com/preservim/nerdtree
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif
" NERDTree-git-plugin config
let g:NERDTreeIndicatorMapCustom = {
    \ "Modified"  : "m",
    \ "Staged"    : "s",
    \ "Untracked" : "u",
    \ "Renamed"   : "➜",
    \ "Unmerged"  : "═",
    \ "Deleted"   : "✖",
    \ "Dirty"     : "✗",
    \ "Clean"     : "✔︎",
    \ 'Ignored'   : '☒',
    \ "Unknown"   : "?"
    \ }

" Start interactive EasyAlign in visual mode (e.g. vipga)
xmap ga <Plug>(EasyAlign)
" Start interactive EasyAlign for a motion/text object (e.g. gaip)
nmap ga <Plug>(EasyAlign)
Plug 'neoclide/coc.nvim', {'branch': 'master', 'do': 'yarn install --frozen-lockfile'}
nmap <leader>rn <Plug>(coc-rename)
nmap <silent> <leader>en <Plug>(coc-diagnostic-next-error)
nmap <silent> <leader>ep <Plug>(coc-diagnostic-prev-error)
nmap <leader>si <Plug>(coc#python.sortImports())
inoremap <silent><expr> <c-space> coc#refresh()
" All of your Plugins must be added before the following line
call plug#end()            " required

" Colour scheme (colorscheme)
set termguicolors

set background=dark
syntax on
set t_Co=256
set t_ut=
colorscheme codedark
let g:airline_theme = 'codedark'
" Customise diff colours
hi DiffDelete gui=bold guifg=#ff8080 guibg=#360a0a
hi DiffAdd gui=bold




" Some quickfix stuff
nnoremap <leader>qj :cnext<CR>
nnoremap <leader>qk :cprev<CR>
nnoremap <leader>qq :cclose<CR>

" Find anything
nnoremap <silent> <leader>fa :Rg<CR>
nnoremap <silent> <c-f> :Rg<CR>
" Find word under cursor ("Find this")
nnoremap <silent> <leader>ft :Rg <C-R><C-W><CR>
" Find word under cursor in current file ("Find here this")
nnoremap <silent> <leader>fht :BLines <C-R><C-W><CR>
"" Find files
nnoremap <silent> <c-p> :Files<CR>
nnoremap <silent> <leader>ff :Files<CR>
" Find buffers
nnoremap <silent> <leader>fb :Buffers<CR>
" Find lines in loaded buffers
nnoremap <silent> <leader>fl :Lines<CR>
" Find lines in the current buffer ("Find here")
nnoremap <silent> <leader>fh :BLines<CR>
" Find tags in the current project nnoremap <silent> <leader>fT :Tags<CR> Find recently-used files ("Find recent")
nnoremap <silent> <leader>fr :History<CR>
" Find in command history
nnoremap <silent> <leader>f: :History:<CR>
nnoremap <silent> <leader>f/ :History/<CR>
" CoC assumes a folder with .git in it is the root of your project
" Actually, for Python, I'd prefer it to be the folder containing .venv
" https://github.com/neoclide/coc.nvim/wiki/Using-workspaceFolders
" autocmd FileType python let b:coc_root_patterns = ['.venv']
" Keep FZF history
let g:fzf_history_dir = '~/.local/share/fzf-history'
" Don't search in filenames with Rg
" https://github.com/junegunn/fzf.vim/issues/346#issuecomment-518087788
command! -bang -nargs=* Rg
  \ call fzf#vim#grep("rg --column --line-number --no-heading --color=always --smart-case ".shellescape(<q-args>), 1, {'options': '--delimiter : --nth 4..'}, <bang>0)


" Mappings for VimTmuxRunner (VTR)
nnoremap <leader>vtra :VtrAttachToPane<CR>
nnoremap <leader>sp vip :VtrSendLinesToRunner<CR>
" Send line
nnoremap <leader>sll :VtrSendLinesToRunner<CR>
" Send all lines
nnoremap <leader>sal ggVG:VtrSendLinesToRunner<CR><c-o>zz
vnoremap <leader>sl :VtrSendLinesToRunner<CR>

" Matchit plugin allows jumping between HTML tags
runtime macros/matchit.vim


" Lightline config
set noshowmode " Lightline means we don't need to show -- INSERT -- 

"  emmet jsx shortcuts
autocmd BufNewFile,BufRead *.js set filetype=javascript.jsx
let g:user_emmet_expandabbr_key='<c-a-z>'
" Tab is interfering with autocomplete. Remove this
imap <expr> <leader>h emmet#expandAbbrIntelligent("\<tab>")
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
" Open NERDTree: think 'leader NERDTree'
nnoremap <leader>n :NERDTreeToggle<CR>
let NERDTreeIgnore=['__pycache__[[dir]]', '\~$']
" When pasting, automatically re-indent
" leader+P does normal (no-indent) pasting
" nnoremap p ]p
" nnoremap <Leader>p p

" Automatic reloading of .vimrc
autocmd! bufwritepost .vimrc source % | AirlineRefresh

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
inoremap <c-l> <ESC><c-w>l
inoremap <c-h> <ESC><c-w>h

" Meta+A should select all, right?
nnoremap <m-a> ggVG

" Help with creating a new line between, e.g., HTML tags or braces etc.
nnoremap <Leader><CR> i<CR><ESC>O

" Switch buffers more easily
set hidden " Allows for unsaved buffers to be hidden
" Switch buffers like Atom tabs.
"
nmap <a-1> <Plug>AirlineSelectTab1
nmap <a-2> <Plug>AirlineSelectTab2
nmap <a-3> <Plug>AirlineSelectTab3
nmap <a-4> <Plug>AirlineSelectTab4
nmap <a-5> <Plug>AirlineSelectTab5
nmap <a-6> <Plug>AirlineSelectTab6
nmap <a-7> <Plug>AirlineSelectTab7
nmap <a-8> <Plug>AirlineSelectTab8
nmap <a-9> <Plug>AirlineSelectTab9
nmap <a-0> <Plug>AirlineSelectTab10
imap <a-1> <ESC><Plug>AirlineSelectTab1
imap <a-2> <ESC><Plug>AirlineSelectTab2
imap <a-3> <ESC><Plug>AirlineSelectTab3
imap <a-4> <ESC><Plug>AirlineSelectTab4
imap <a-5> <ESC><Plug>AirlineSelectTab5
imap <a-6> <ESC><Plug>AirlineSelectTab6
imap <a-7> <ESC><Plug>AirlineSelectTab7
imap <a-8> <ESC><Plug>AirlineSelectTab8
imap <a-9> <ESC><Plug>AirlineSelectTab9
imap <a-0> <ESC><Plug>AirlineSelectTab10
noremap <leader>l <esc>:bn<CR>
noremap <leader>h <esc>:bp<CR>

" Change git-gutter mappings to not interrupt the ones above
let g:gitgutter_map_keys = 0
nmap <leader>cs <Plug>(GitGutterStageHunk)
nmap <leader>cu <Plug>(GitGutterUndoHunk)
nmap <leader>cp <Plug>(GitGutterPreviewHunk)
nmap <leader>cn <Plug>(GitGutterNextHunk)
nmap <leader>cN <Plug>(GitGutterPrevHunk)
nmap <leader>gf <Plug>(GitGutterFold)


" Retain cursor position when changing buffers
" This causes a problem with other windows like fugitive blame
" https://stackoverflow.com/a/40992753/2071807
" autocmd BufEnter * silent! normal! g`"zz

" Deletes buffer without closing split. See https://stackoverflow.com/a/4468491/2071807
noremap <a-w> <esc>:bp\|bd! #<CR>
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
\ setlocal textwidth=72 |
\ setlocal expandtab |
\ setlocal autoindent |
\ setlocal fileformat=unix

" Some things to make Vim behave like any other app
nnoremap <a-s> :w<Enter>
inoremap <a-s> <ESC>:w<CR>a
nnoremap <a-S> :noautocmd write<Enter> " Save without running autocmds like prettifiers
nnoremap <a-q> :q<Enter>

" Highlight currently open buffer in NERDTree
" This breaks tagbar! If I end up not using tagbar I could put it back.
" autocmd BufEnter * call SyncTree()

" Configure Tagbar
nnoremap <a-o> :TagbarToggle<CR>
let g:tagbar_autofocus = 1
set updatetime=300

" Update NERDTree to reflect current buffer and return to previous window
nnoremap <a-f> :NERDTreeFind<CR>:wincmd p<CR>

" Window resizing
nnoremap <c-Down> <c-w>-
nnoremap <c-Up> <c-w>+
nnoremap <c-Left> <c-w><
nnoremap <c-Right> <c-w>>

" Set some maps for neovim terminal mode (:terminal)
" Exit terminal mode
tnoremap <Esc> <C-\><C-n>
nnoremap <a-t> :terminal<CR>i

" Configure SimpylFold
let g:SimpylFold_fold_docstring = 0
let g:SimpylFold_fold_import = 0
set foldlevel=99
nnoremap <leader><Tab> za

" Custome fugitive mappings
nnoremap <leader>gg :Git<CR>
nnoremap <leader>gb :NERDTreeClose <bar> :Twiggy<CR>
nnoremap <leader>gpp :Git push<CR>
" Git who? (or Git why??)
nnoremap <leader>gw :Git blame<CR>
nnoremap <leader>ge :Git edit<CR>
" Glog diffs
nnoremap <leader>gld :Gclog %<CR> 
" Glog revisions
nnoremap <leader>glr :0Gclog<CR>
nnoremap <leader>gdd <C-W><C-O>:Gvdiffsplit!<CR>
nnoremap <leader>gdh :diffget //2<CR>
nnoremap <leader>gdl :diffget //3<CR>
" Git diff master
nnoremap <leader>gdm :Gvdiffsplit master:%<CR>


" Configure vim-test
nnoremap <silent> <leader>tl :TestLast<CR>
" Debug test last
nnoremap <silent> <leader>dtl :TestLast --pdb<CR>
nnoremap <silent> <leader>t :TestNearest<CR>
nnoremap <silent> <leader>T :TestFile<CR>
nnoremap <silent> <leader>dt :TestNearest --pdb<CR>
nnoremap <silent> <leader>dT :TestFile --pdb<CR>
let test#python#runner = 'pytest'
let test#python#pytest#options = '-s -v'

" Insert breakpoints
nnoremap <leader>bb O__import__("pdb").set_trace()<ESC>

" Settings for Coc code completion
inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" Use <c-space> to trigger completion.
inoremap <silent><expr> <c-space> coc#refresh()

nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" Use K to show documentation in preview window
nnoremap <silent> K :call <SID>show_documentation()<CR>

function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  else
    call CocAction('doHover')
  endif
endfunction

" Remap for rename current word
nmap <leader>rn <Plug>(coc-rename)

function! s:Close(bang, buffer)
  buffer #
  bdelete! #
endfunction


augroup FILETYPES
  " A conflict between vim-markdown and indentLine means we have to disable
  " the latter in markdown files.
  autocmd FileType markdown let b:indentLine_enabled = 0
  autocmd FileType markdown set concealcursor=""
augroup END
