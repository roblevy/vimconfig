set colorcolumn=100
let mapleader="\\"
" if has('macunix')
"    let mapleader="`"
" endif
set timeout timeoutlen=3000
set title
nnoremap Q <nop> " Disable entering ex mode accidentally
" snake-case words are words too!
set iskeyword+=-
set rtp+=/opt/homebrew/opt/fzf


" Copy current filepath
nnoremap <silent> y% :let @+=expand("%:p")<CR>
nnoremap <silent> <leader>tn :tabnext<CR>

" Allow macro-running in visual mode
vnoremap @ :normal @

inoremap jj <esc>

" Choose NVim's virtual environment
let g:python3_host_prog = '$HOME/.nvim_venv/bin/python'

" blink cursor on error instead of beeping (grr)
set visualbell
set t_vb=

" Speed up macro execution on multiple lines
" https://vi.stackexchange.com/a/4316/2026
set lazyredraw

" Fix dodgy syntax highlighting for multiline strings. They won't ever be more
" than 50 lines long.
syntax sync minlines=50
" Shortcut to "ReHighlight"
nnoremap <leader>rh <Esc>:syntax sync fromstart<CR>

" Install vim-plug
" https://github.com/junegunn/vim-plug/wiki/tips#automatic-installation
let data_dir = has('nvim') ? stdpath('data') . '/site' : '~/.vim'
if empty(glob(data_dir . '/autoload/plug.vim'))
  silent execute '!curl -fLo '.data_dir.'/autoload/plug.vim --create-dirs  https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

call plug#begin('~/.vim/plugged')

" My plugins
Plug 'preservim/nerdtree'
Plug 'tomasiser/vim-code-dark'
Plug 'neanias/everforest-nvim', { 'branch': 'main' }
Plug 'christoomey/vim-tmux-runner'
Plug 'christoomey/vim-tmux-navigator'
Plug 'pangloss/vim-javascript'
Plug 'mxw/vim-jsx'
Plug 'tpope/vim-surround' " Add { [ ' etc. around existing text
Plug 'tomtom/tcomment_vim' " Better than vim-commentary
Plug 'tpope/vim-repeat' " Lets . work for more complex commands
Plug 'tpope/vim-fugitive' " Git plugin
Plug 'tpope/vim-rhubarb' " For linking with Github.com
Plug 'lewis6991/gitsigns.nvim' " Replacement for gitgutter because it was slow
Plug 'kshenoy/vim-signature' " Show marks in the gutter
Plug 'vim-airline/vim-airline'
let g:airline#extensions#tabline#enabled = 1 " Use the airline tabline (replacement for buftabline)
let g:airline#extensions#tabline#show_tab_nr = 1
let g:airline#extensions#tabline#tab_nr_type = 1 " tab number
let g:airline#extensions#tabline#buffer_idx_mode = 1
let g:airline_powerline_fonts = 1
let g:airline#extensions#tabline#ignore_bufadd_pat = '!|^fugitive://'
" The following is an attempt to stop airline being really slow. See
" https://github.com/vim-airline/vim-airline/wiki/FAQ
let g:airline_highlighting_cache = 1
Plug 'windwp/nvim-autopairs' " Insert or delete brackets, parens, quotes in pair.
Plug 'stsewd/isort.nvim'
Plug 'valloric/matchtagalways' " Keep matching HTML tag highlighted
Plug 'vim-scripts/indentpython.vim'
" Plug 'vim-python/python-syntax' " Highlight lots of Python 3 syntax
" let g:python_highlight_all = 1
Plug 'psf/black' " Opinionated Python code formatter
" run Black
nnoremap <leader>rb :Black<CR>
Plug 'preservim/tagbar'
let g:tagbar_show_visibility = 0
let g:tagbar_wrap = 0
Plug 'Yggdroot/indentLine'  " Add | to aid indenting
Plug 'junegunn/vim-easy-align' " Useful for aligning Markdown tables
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } } " Fuzzy find
Plug 'junegunn/fzf.vim'
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
" Markdown support: tabular is a pre-requisite of vim-markdown
Plug 'godlygeek/tabular'
Plug 'plasticboy/vim-markdown'
" let g:vim_markdown_conceal_code_blocks = 0
Plug 'nvim-lua/plenary.nvim'
" Yet Another Typescript Syntax
Plug 'HerringtonDarkholme/yats.vim'
Plug 'yaegassy/coc-htmldjango', {'do': 'yarn install --frozen-lockfile'}
Plug 'AndrewRadev/linediff.vim'
" Linediff this/off
vnoremap <leader>ldt :Linediff<CR>
vnoremap <leader>ldo :LinediffReset<CR>
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}


" Open file browser if no files were specified. See
autocmd VimEnter * if !argc() | NERDTree | wincmd p | endif

Plug 'neoclide/coc.nvim', {'branch': 'release'}

" CoC extensions
let g:coc_global_extensions = [
      \ 'coc-pyright',
      \ 'coc-json',
      \ 'coc-tsserver',
      \ ]

" All of your Plugins must be added before the following line
call plug#end()            " required

" Colour scheme (colorscheme)
syntax on
set termguicolors
colorscheme everforest

" Airline
" let g:airline#extensions#default#layout = [['a'], ['x', 'z', 'warning', 'error']]
let g:airline_theme = 'codedark'
if airline#util#winwidth() > 40
  let g:airline_section_b = airline#section#create(['branch'])
else
  let g:airline_section_b = ''
endif
let g:airline_section_c = 'section C'
let g:airline_section_x = airline#section#create_left(['tagbar'])
let g:airline_section_y = ''
let g:airline_section_z = '%p%% %l/%L:%v'
let g:airline#extensions#tagbar#enabled = 1
let g:airline#extensions#tagbar#flags = 'f'

" Customise diff colours
hi DiffDelete gui=bold guifg=#ff8080 guibg=#360a0a
hi DiffAdd gui=bold




" Some quickfix stuff
nnoremap <leader>qj :cnext<CR>
nnoremap <leader>qk :cprev<CR>
nnoremap <leader>qq :cclose<CR>

" Find anything anwhere
nnoremap <silent> <leader>faa :Rg<CR>
nnoremap <silent> <m-f> :Rg<CR>
" Find no files (i.e. don't search in the filename)
nnoremap <silent> <leader>fnf :Rgnf<CR>
" Find word under cursor ("Find this")
nnoremap <silent> <leader>ft :Rg <C-R><C-W><CR>
" Find a Tag
nnoremap <silent> <leader>fT :Tags<CR>
" Find lines in the current buffer ("Find here here")
nnoremap <silent> <leader>fhh :BLines<CR>
" Find class in the current buffer ("Find here class")
nnoremap <silent> <leader>fhc :BLines ^ *class <CR>
" Find def in the current buffer ("Find here def")
nnoremap <silent> <leader>fhd :BLines ^ *def <CR>
" Find this def in the current buffer ("Find here this def")
nnoremap <leader>fhtd :BLines ^ *def <C-R><C-W><CR>
" Find class anywhere ("Find anywhere class")
nnoremap <silent> <leader>fac :Rg ^ *class <CR>
" Find def anywhere ("Find anywhere def")
nnoremap <silent> <leader>fad :Rg ^ *def <CR>
" Find word under cursor in current file ("Find here this")
nnoremap <silent> <leader>fhtd :BLines <C-R><C-W><CR>
"" Find files
nnoremap <silent> <c-p> :Files<CR>
nnoremap <silent> <leader>ff :Files<CR>
" Go to open buffers
nnoremap <silent> <leader>gb :Buffers<CR>
" Find breakpoints
nnoremap <silent> <leader>fb :Rg breakpoint()<CR>
" Find lines in loaded buffers
nnoremap <silent> <leader>fl :Lines<CR>
" Find tags in the current project nnoremap <silent> <leader>fT :Tags<CR> Find recently-used files ("Find recent")
nnoremap <silent> <leader>fr :History<CR>
" Find in command history
nnoremap <silent> <leader>f: :History:<CR>
nnoremap <silent> <leader>f/ :History/<CR>

" Git Status
nnoremap <silent> <leader>gs :GFiles?<CR>

nnoremap <leader>gr :GRename 

" Keep FZF history
let g:fzf_history_dir = '~/.local/share/fzf-history'
" Don't search in filenames with Rgnf (no filenames)
" https://github.com/junegunn/fzf.vim/issues/346#issuecomment-518087788
command! -bang -nargs=* Rgnf
  \ call fzf#vim#grep("rg --column --line-number --no-heading --color=always --smart-case ".shellescape(<q-args>), 1,
  \   fzf#vim#with_preview({'options': '--delimiter : --nth 4..'}), <bang>0)


" Mappings for VimTmuxRunner (VTR)
nnoremap <leader>vtra :VtrAttachToPane<CR>
nnoremap <leader>sp vip :VtrSendLinesToRunner<CR>
" Send line
nnoremap <leader>sll :VtrSendLinesToRunner<CR>
" Send all lines
nnoremap <leader>sal ggVG:VtrSendLinesToRunner<CR><c-o>zz
vnoremap <leader>sl :VtrSendLinesToRunner<CR>


" Lightline config
set noshowmode " Lightline means we don't need to show -- INSERT --

"' Makes j and k move over wrapped lines, like you'd expect.
set linebreak
noremap j gj
noremap k gk

" clear the last search highlighting
nnoremap <silent> <Backspace> :nohl<CR>
let NERDTreeIgnore=['__pycache__[[dir]]', '\~$']

" Automatic reloading of .vimrc
autocmd! bufwritepost .vimrc source % | AirlineRefresh

set clipboard^=unnamedplus,unnamed
if has("wsl")
  augroup Yank
    autocmd!
    autocmd TextYankPost * :call system('clip.exe ',@")
  augroup END
endif


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

" Configure Tagbar
nnoremap <a-o> :TagbarToggle<CR>
let g:tagbar_autofocus = 1
set updatetime=300

nnoremap <leader>n :NERDTree<CR>
" Update NERDTree to reflect current buffer and return to previous window
" Alt-nerdtree
nnoremap <m-n> :NERDTreeFind<CR>:wincmd p<CR>

" Window resizing
nnoremap <c-Down> <c-w>-
nnoremap <c-Up> <c-w>+
nnoremap <c-Left> <c-w><
nnoremap <c-Right> <c-w>>

set foldlevel=99

" Custome fugitive mappings
nnoremap <leader>gg :Git<CR>
nnoremap <leader>gpp :Git push<CR>
" Git who? (or Git why??)
nnoremap <leader>gw :Git blame<CR>
nnoremap <leader>ge :Git edit<CR>
" Glog diffs
nnoremap <leader>gld :Gclog %<CR>
" Glog revisions
nnoremap <leader>glr :0Gclog<CR>
nnoremap <leader>gll :Git log --oneline --decorate --graph<CR>
nnoremap <leader>gdd :Gvdiffsplit!
nnoremap <leader>gdh :diffget //2<CR>
nnoremap <leader>gdl :diffget //3<CR>
" Git mergetool
nnoremap <leader>gmm :Git mergetool<CR>
" Git diff master
let branch = trim(system("git symbolic-ref refs/remotes/origin/HEAD | rev | cut -d '/' -f 1 | rev"))
nnoremap <leader>gdm :Gvdiffsplit <C-r>=branch<CR>:%<CR>

" Diff mappings
nnoremap <leader>dt :diffthis<CR>
nnoremap <leader>dg :diffget<CR>
nnoremap <leader>dp :diffput<CR>

" Insert breakpoints
nnoremap <leader>bb Obreakpoint()<ESC>

" 'Run prettier'
nnoremap <leader>rp :CocCommand prettier.formatFile<CR>
" Accept suggestion
inoremap <expr> <cr> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"

" Everything from the recommended coc.nvim setup


" Use tab for trigger completion with characters ahead and navigate
" NOTE: There's always complete item selected by default, you may want to enable
" no select by `"suggest.noselect": true` in your configuration file
" NOTE: Use command ':verbose imap <tab>' to make sure tab is not mapped by
" other plugin before putting this into your config
inoremap <silent><expr> <TAB>
      \ coc#pum#visible() ? coc#pum#next(1) :
      \ CheckBackspace() ? "\<Tab>" :
      \ coc#refresh()
inoremap <expr><S-TAB> coc#pum#visible() ? coc#pum#prev(1) : "\<C-h>"

" Make <CR> to accept selected completion item or notify coc.nvim to format
" <C-g>u breaks current undo, please make your own choice
inoremap <silent><expr> <CR> coc#pum#visible() ? coc#pum#confirm()
                              \: "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"

function! CheckBackspace() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" Use <c-space> to trigger completion
if has('nvim')
  inoremap <silent><expr> <c-space> coc#refresh()
else
  inoremap <silent><expr> <c-@> coc#refresh()
endif

" Use `[g` and `]g` to navigate diagnostics
" Use `:CocDiagnostics` to get all diagnostics of current buffer in location list
nmap <silent> [g <Plug>(coc-diagnostic-prev)
nmap <silent> ]g <Plug>(coc-diagnostic-next)
nmap <silent> <leader>ee :CocDiagnostics<CR>
nmap <silent> <leader>ep <Plug>(coc-diagnostic-prev)
nmap <silent> <leader>en <Plug>(coc-diagnostic-next)

" GoTo code navigation
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" Use K to show documentation in preview window
nnoremap <silent> K :call ShowDocumentation()<CR>

function! ShowDocumentation()
  if CocAction('hasProvider', 'hover')
    call CocActionAsync('doHover')
  else
    call feedkeys('K', 'in')
  endif
endfunction

" Highlight the symbol and its references when holding the cursor
autocmd CursorHold * silent call CocActionAsync('highlight')

" Symbol renaming
nmap <leader>rn <Plug>(coc-rename)

" Formatting selected code
xmap <leader>f  <Plug>(coc-format-selected)
nmap <leader>f  <Plug>(coc-format-selected)

augroup mygroup
  autocmd!
  " Setup formatexpr specified filetype(s)
  autocmd FileType typescript,json setl formatexpr=CocAction('formatSelected')
  " Update signature help on jump placeholder
  autocmd User CocJumpPlaceholder call CocActionAsync('showSignatureHelp')
augroup end

" Applying code actions to the selected code block
" Example: `<leader>aap` for current paragraph
xmap <leader>a  <Plug>(coc-codeaction-selected)
nmap <leader>a  <Plug>(coc-codeaction-selected)

" Remap keys for applying code actions at the cursor position
nmap <leader>ac  <Plug>(coc-codeaction-cursor)
" Remap keys for apply code actions affect whole buffer
nmap <leader>as  <Plug>(coc-codeaction-source)
" Apply the most preferred quickfix action to fix diagnostic on the current line
nmap <leader>qf  <Plug>(coc-fix-current)

" Remap keys for applying refactor code actions
nmap <silent> <leader>re <Plug>(coc-codeaction-refactor)
xmap <silent> <leader>r  <Plug>(coc-codeaction-refactor-selected)
nmap <silent> <leader>r  <Plug>(coc-codeaction-refactor-selected)

" Run the Code Lens action on the current line
nmap <leader>cl  <Plug>(coc-codelens-action)

" Map function and class text objects
" NOTE: Requires 'textDocument.documentSymbol' support from the language server
xmap if <Plug>(coc-funcobj-i)
omap if <Plug>(coc-funcobj-i)
xmap af <Plug>(coc-funcobj-a)
omap af <Plug>(coc-funcobj-a)
xmap ic <Plug>(coc-classobj-i)
omap ic <Plug>(coc-classobj-i)
xmap ac <Plug>(coc-classobj-a)
omap ac <Plug>(coc-classobj-a)

" Remap <C-f> and <C-b> to scroll float windows/popups
if has('nvim-0.4.0') || has('patch-8.2.0750')
  nnoremap <silent><nowait><expr> <C-f> coc#float#has_scroll() ? coc#float#scroll(1) : "\<C-f>"
  nnoremap <silent><nowait><expr> <C-b> coc#float#has_scroll() ? coc#float#scroll(0) : "\<C-b>"
  inoremap <silent><nowait><expr> <C-f> coc#float#has_scroll() ? "\<c-r>=coc#float#scroll(1)\<cr>" : "\<Right>"
  inoremap <silent><nowait><expr> <C-b> coc#float#has_scroll() ? "\<c-r>=coc#float#scroll(0)\<cr>" : "\<Left>"
  vnoremap <silent><nowait><expr> <C-f> coc#float#has_scroll() ? coc#float#scroll(1) : "\<C-f>"
  vnoremap <silent><nowait><expr> <C-b> coc#float#has_scroll() ? coc#float#scroll(0) : "\<C-b>"
endif

" Use CTRL-S for selections ranges
" Requires 'textDocument/selectionRange' support of language server
nmap <silent> <C-s> <Plug>(coc-range-select)
xmap <silent> <C-s> <Plug>(coc-range-select)

" Add `:Format` command to format current buffer
command! -nargs=0 Format :call CocActionAsync('format')
nnoremap <silent> <leader>gf :Format<CR>

" Add `:Fold` command to fold current buffer
command! -nargs=? Fold :call     CocAction('fold', <f-args>)

" Add `:OR` command for organize imports of the current buffer
command! -nargs=0 OR   :call     CocActionAsync('runCommand', 'editor.action.organizeImport')
" Sort imports
nnoremap <silent> <leader>si :OR<CR>

" Add (Neo)Vim's native statusline support
" NOTE: Please see `:h coc-status` for integrations with external plugins that
" provide custom statusline: lightline.vim, vim-airline
" set statusline^=%{coc#status()}%{get(b:,'coc_current_function','')}

" Mappings for CoCList
" Show all diagnostics
nnoremap <silent><nowait> <space>a  :<C-u>CocList diagnostics<cr>
" Manage extensions
nnoremap <silent><nowait> <space>e  :<C-u>CocList extensions<cr>
" Show commands
nnoremap <silent><nowait> <space>c  :<C-u>CocList commands<cr>
" Find symbol of current document
nnoremap <silent><nowait> <space>o  :<C-u>CocList outline<cr>
" Search workspace symbols
nnoremap <silent><nowait> <space>s  :<C-u>CocList -I symbols<cr>
" Do default action for next item
nnoremap <silent><nowait> <space>j  :<C-u>CocNext<CR>
" Do default action for previous item
nnoremap <silent><nowait> <space>k  :<C-u>CocPrev<CR>
" Resume latest coc list
nnoremap <silent><nowait> <space>p  :<C-u>CocListResume<CR>

" Don't use the conceal feature, which hides double-quotes in Dockerfile and
" JSON on the line the cursor is on. Note that this also stops indentLine from
" working on the current line. There's a non-conceal lua-based replacement but
" I had problems getting it to look nice so I fell back to indentLine.
let g:indentLine_concealcursor = ''

" Position the (global) quickfix window at the very bottom of the window
" (useful for making sure that it appears underneath splits)
"
" NOTE: Using a check here to make sure that window-specific location-lists
" aren't effected, as they use the same `FileType` as quickfix-lists.
" https://github.com/fatih/vim-go/issues/108#issuecomment-565131948
autocmd FileType qf if (getwininfo(win_getid())[0].loclist != 1) | wincmd J | endif

" This is needed to setup some lua-based plugins
lua << EOF
vim.opt.list = true
require('nvim-autopairs').setup{}
require('nvim-treesitter.configs').setup({
  highlight = {
    enable = true,
    -- Setting this to true will run `:h syntax` and tree-sitter at the same time.
    -- Set this to `true` if you depend on 'syntax' being enabled (like for indentation).
    -- Using this option may slow down your editor, and you may see some duplicate highlights.
    -- Instead of true it can also be a list of languages
    additional_vim_regex_highlighting = true,
  },
  indent = {
    enable = true
  }
})

require("everforest").setup({
  background = "hard",
})
require('gitsigns').setup{
  signs = {
    add          = { text = '│' },
    change       = { text = '│' },
    delete       = { text = '_' },
    topdelete    = { text = '‾' },
    changedelete = { text = '~' },
    untracked    = { text = '┆' },
  },
  on_attach = function(bufnr)
    local gs = package.loaded.gitsigns

    local function map(mode, l, r, opts)
      opts = opts or {}
      opts.buffer = bufnr
      vim.keymap.set(mode, l, r, opts)
    end

    -- Navigation
    map('n', '<leader>cj', function()
      if vim.wo.diff then return ']c' end
      vim.schedule(function() gs.next_hunk() end)
      return '<Ignore>'
    end, {expr=true})

    map('n', '<leader>ck', function()
      if vim.wo.diff then return '[c' end
      vim.schedule(function() gs.prev_hunk() end)
      return '<Ignore>'
    end, {expr=true})

    -- Actions
    map('n', '<leader>cu', gs.reset_hunk)
    map('v', '<leader>cr', function() gs.reset_hunk {vim.fn.line('.'), vim.fn.line('v')} end)
    map('n', '<leader>cp', gs.preview_hunk)
    map('n', '<leader>cb', function() gs.blame_line{full=true} end)
    map('n', '<leader>tb', gs.toggle_current_line_blame)
    map('n', '<leader>cd', gs.diffthis)
    map('n', '<leader>cD', function() gs.diffthis('~') end)
    map('n', '<leader>td', gs.toggle_deleted)

    -- Text object
    map({'o', 'x'}, 'ih', ':<C-U>Gitsigns select_hunk<CR>')
  end
}
EOF
" highlight Comment cterm=italic gui=italic
highlight link CocInlayHint NonText
