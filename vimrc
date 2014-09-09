" Sample .vimrc file by Martin Brochhaus
" Presented at PyCon APAC 2012

" Makes j and k move over wrapped lines, like you'd expect.
set linebreak
noremap j gj
noremap k gk

set nofoldenable

" Automatic reloading of .vimrc
autocmd! bufwritepost .vimrc source %


" Better copy & paste
" When you want to paste large blocks of code into vim, press F2 before you
" paste. At the bottom you should see ``-- INSERT (paste) --``.

set pastetoggle=<F2>
set clipboard=unnamed


" Mouse and backspace
set bs=2 " make backspace behave like normal again
set mouse=v " use mouse in visual mode only

" Rebind <Leader> key
" I like to have it here becuase it is easier to reach than the default and
" it is next to ``m`` and ``n`` which I use for navigating between tabs.
let mapleader = ","

" Indentation
" set smartindent " Unindents comments
" http://stackoverflow.com/questions/354097/
" how-to-configure-vim-to-not-put-comments-at-the-beginning-of-lines-while-editing
set cindent

" Quick quit command
noremap <Leader>e :quit<CR> " Quit current window
noremap <Leader>E :qa!<CR> " Quit all windows


" bind Ctrl+<movement> keys to move around the windows, instead of using Ctrl+w + <movement>
" Every unnecessary keystroke that can be saved is good for your health :)
noremap <c-j> <c-w>j
noremap <c-k> <c-w>k
noremap <c-l> <c-w>l
noremap <c-h> <c-w>h


" easier moving between tabs
map <Leader>n <esc>:tabprevious<CR>
map <Leader>m <esc>:tabnext<CR>

" map exiting Insert mode to something sensible
inoremap <Tab> <esc>

" map save to ctrl+s
noremap <C-w> :w<CR>

" map sort function to a key
"" vnoremap <Leader>s :sort<CR>

" latex box stuff
noremap <Leader>ll :write<CR> :Latexmk<CR>

" easier moving of code blocks
" Try to go into visual mode (v), thenselect several lines of code here and
" then press ``>`` several times.
"" vnoremap < <gv " better indentation
"" vnoremap > >gv " better indentation


" Show whitespace
" MUST be inserted BEFORE the colorscheme command
"" autocmd ColorScheme * highlight ExtraWhitespace ctermbg=red guibg=red
"" au InsertLeave * match ExtraWhitespace /\s\+$/


" Color scheme
" mkdir -p ~/.vim/colors && cd ~/.vim/colors
" wget -O wombat256mod.vim http://www.vim.org/scripts/download_script.php?src_id=13400
set t_Co=256
color wombat256mod


" Enable syntax highlighting
" You need to reload this file for the change to apply
filetype off
filetype plugin indent on
syntax on


" Showing line numbers and length
set number " show line numbers
set tw=79 " width of document (used by gd)
"set nowrap " don't automatically wrap on load
set fo-=t " don't automatically wrap text when typing
set colorcolumn=80
"highlight ColorColumn ctermbg=233


" easier formatting of paragraphs
"" vmap Q gq
"" nmap Q gqap


" Useful settings
set history=700
set undolevels=700


" Real programmers don't use TABs but spaces
set tabstop=4
set softtabstop=4
set shiftwidth=4
set shiftround
set expandtab


" Make search case insensitive
set hlsearch
set incsearch
set ignorecase
set smartcase


" Disable stupid backup and swap files - they trigger too many events
" for file system watchers
"" set nobackup
"" set nowritebackup
set noswapfile


" Setup Pathogen to manage your plugins
" mkdir -p ~/.vim/autoload ~/.vim/bundle
" curl -so ~/.vim/autoload/pathogen.vim https://raw.githubusercontent.com/tpope/vim-pathogen/HEAD/autoload/pathogen.vim 
" Now you can install any plugin into a .vim/bundle/plugin-name/ folder
call pathogen#infect()


" ============================================================================
" Python IDE Setup
" ============================================================================


" Settings for vim-powerline
" cd ~/.vim/bundle
" git clone git://github.com/Lokaltog/vim-powerline.git
set laststatus=2


" Settings for ctrlp
" cd ~/.vim/bundle
" git clone https://github.com/kien/ctrlp.vim.git
"" let g:ctrlp_max_height = 30
"" set wildignore+=*.pyc
"" set wildignore+=*_build/*
"" set wildignore+=*/coverage/*


" Settings for python-mode
" Note: I'm no longer using this. Leave this commented out
" and uncomment the part about jedi-vim instead
" cd ~/.vim/bundle
" git clone https://github.com/klen/python-mode
"" map <Leader>g :call RopeGotoDefinition()<CR>
"" let ropevim_enable_shortcuts = 1
"" let g:pymode_rope_goto_def_newwin = "vnew"
"" let g:pymode_rope_extended_complete = 1
"" let g:pymode_breakpoint = 0
"" let g:pymode_syntax = 1
"" let g:pymode_syntax_builtin_objs = 0
"" let g:pymode_syntax_builtin_funcs = 0
"" map <Leader>b Oimport ipdb; ipdb.set_trace() # BREAKPOINT<C-c>

" Settings for jedi-vim
" cd ~/.vim/bundle
" git clone git://github.com/davidhalter/jedi-vim.git
" let g:jedi#related_names_command = "<leader>z"
let g:jedi#popup_on_dot = 0
let g:jedi#popup_select_first = 0
" map <Leader>b Oimport ipdb; ipdb.set_trace() # BREAKPOINT<C-c>

" Better navigating through omnicomplete option list
" See http://stackoverflow.com/questions/2170023/how-to-map-keys-for-popup-menu-in-vim
"" set completeopt=longest,menuone
"" function! OmniPopup(action)
"" if pumvisible()
"" if a:action == 'j'
"" return "\<C-N>"
"" elseif a:action == 'k'
"" return "\<C-P>"
"" endif
"" endif
"" return a:action
"" endfunction

"" inoremap <silent><C-j> <C-R>=OmniPopup('j')<CR>
"" inoremap <silent><C-k> <C-R>=OmniPopup('k')<CR>

"" Folding
set foldmethod=syntax
set foldlevelstart=1

let javaScript_fold=1
" Syntastic {{{
let g:syntastic_aggregate_errors = 1
let g:syntastic_always_populate_loc_list=1
let g:syntastic_auto_loc_list = 2
let g:syntastic_enable_signs = 1
let g:syntastic_error_symbol = '✗'
let g:syntastic_warning_symbol = '⚠'
let g:syntastic_style_warning_symbol = '♫'
let g:syntastic_style_error_symbol = '♪'
"}}}

" Python folding
" mkdir -p ~/.vim/ftplugin
" wget -O ~/.vim/ftplugin/python_editing.vim http://www.vim.org/scripts/download_script.php?src_id=5492
"" set nofoldenable

let g:syntastic_html_checkers = ['tidy', 'jshint']
let g:syntastic_js_checkers = ['jshint']
" Language-specific 
" Vim {{{
autocmd FileType vim setlocal foldmethod=marker
"}}}
" HTML & Templates {{{"{{{
" autocmd BufWinEnter *.html,*.htm setfiletype jinja
" autocmd FileType html,jinja,liquid setlocal omnifunc=htmlcomplete#CompleteTags
autocmd FileType html,jinja,liquid,css,scss,less,stylus setlocal tabstop=2 softtabstop=2 shiftwidth=2
autocmd FileType html,jinja,liquid runtime! macros/matchit.vim
autocmd FileType jinja set commentstring={#\ %s\ #}
let g:syntastic_html_checkers = ['tidy', 'jshint']
"}}}
" CSS {{{
autocmd BufWinEnter *.sass,*.scss setfiletype scss
autocmd BufWinEnter *.less setfiletype less
autocmd FileType css,scss,less,stylus setlocal omnifunc=csscomplete#CompleteCSS
"}}}"}}}
" Javascript {{{"{{{
autocmd BufWinEnter *.json,.jshintrc,.tern-config,.tern-project setfiletype javascript"}}}
" autocmd FileType javascript setlocal omnifunc=javascriptcomplete#CompleteJS
" autocmd FileType javascript call JavaScriptFold()"{{{
let g:tagbar_type_javascript = { 'ctagsbin' : 'jsctags' }"}}}
let javascript_enable_domhtmlcss = 1
let g:javascript_conceal = 1

