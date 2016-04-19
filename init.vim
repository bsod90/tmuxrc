" Neovim configuration:
let g:python_host_prog = '/usr/bin/python'
let g:python3_host_prog = '/usr/bin/python3'

set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.config/nvim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')
call vundle#rc('/home/maxim/.config/nvim/bundle')

" let Vundle manage Vundle, required
Bundle 'gmarik/Vundle.vim'

" Bundle 'powerline/powerline', {'rtp': 'powerline/bindings/vim/'}

Bundle 'vim-airline/vim-airline'

Bundle 'vim-airline/vim-airline-themes'

Bundle 'scrooloose/nerdtree'

Bundle 'klen/python-mode'

Bundle 'kien/ctrlp.vim'

Bundle 'Valloric/YouCompleteMe'

Bundle 'davidhalter/jedi-vim'

Bundle 'airblade/vim-gitgutter'

Bundle 'tpope/vim-commentary'

Bundle 'HTML-AutoCloseTag'

Bundle 'tpope/vim-fugitive'

Bundle 'flazz/vim-colorschemes'

Bundle 'taglist.vim'

Bundle 'yegappan/greplace'

Plugin 'mustache/vim-mustache-handlebars'

Bundle 'rhysd/vim-clang-format'

Bundle 'Syntastic'

Plugin 'JazzCore/ctrlp-cmatcher'

Bundle 'christoomey/vim-tmux-navigator'

Bundle 'edkolev/tmuxline.vim'

Bundle 'rking/ag.vim'

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required
" To ignore plugin indent changes, instead use:
"filetype plugin on
"
" Brief help
" :PluginList       - lists configured plugins
" :PluginInstall    - installs plugins; append `!` to update or just :PluginUpdate
" :PluginSearch foo - searches for foo; append `!` to refresh local cache
" :PluginClean      - confirms removal of unused plugins; append `!` to auto-approve removal
"
" see :h vundle for more details or wiki for FAQ
" Put your non-Plugin stuff after this line

augroup vimrc_autocmds
    autocmd!
    " highlight characters past column 80
    autocmd FileType python highlight Excess ctermbg=DarkGrey guibg=Black
    autocmd FileType python match Excess /\%120v.*/
    autocmd FileType python set nowrap
    augroup END

set nu

" Airline setup
set laststatus=2
let g:airline_powerline_fonts = 1
" let g:airline#extensions#tabline#enabled = 1

" Python-mode
" Activate rope
" Keys:
" K             Show python docs
" <Ctrl-Space>  Rope autocomplete
" <Ctrl-c>g     Rope goto definition
" <Ctrl-c>d     Rope show documentation
" <Ctrl-c>f     Rope find occurrences
" <Leader>b     Set, unset breakpoint (g:pymode_breakpoint enabled)
" [[            Jump on previous class or function (normal, visual, operator
" modes)
" ]]            Jump on next class or function (normal, visual, operator
" modes)
" [M            Jump on previous class or method (normal, visual, operator
" modes)
" ]M            Jump on next class or method (normal, visual, operator
" modes)
let g:pymode_rope = 0
let g:pymode_rope_autoimport = 0

" Documentation
" let g:pymode_doc = 1
" let g:pymode_doc_key = 'K'

"Linting
"Disable python-mode linting in favour of syntastic
let g:pymode_lint = 1
let g:pymode_lint_on_fly = 0
" let g:pymode_lint_checkers = ["pylint"]
" let g:pymode_lint_checker = "pylint"
let g:pymode_lint_write = 0
let g:pymode_lint_message = 0

let g:syntastic_python_checkers = ["flake8"]
let g:syntastic_auto_loc_list=0
let g:syntastic_loc_list_height=5

" Support virtualenv
let g:pymode_virtualenv = 1

" Enable breakpoints plugin
let g:pymode_breakpoint = 1
let g:pymode_breakpoint_bind = '<leader>b'

" syntax highlighting
let g:pymode_syntax = 1
let g:pymode_syntax_all = 1
let g:pymode_syntax_indent_errors = g:pymode_syntax_all
let g:pymode_syntax_space_errors = g:pymode_syntax_all

" Don't autofold code
let g:pymode_folding = 0

" Jedi-vim configuration
let g:jedi#show_call_signatures = 1 
let g:jedi#popup_select_first = 0
let g:jedi#completions_enabled = 0
autocmd FileType python setlocal completeopt-=preview

set autoread
syntax on


let g:ctrlp_switch_buffer = 'ET'

set hidden
set incsearch
set hlsearch
set expandtab
set shiftwidth=4
set cursorline
set ignorecase
set smartcase   
set wildignore=*.swp,*.bak,*.pyc,*.class
set title
set wildmenu

let g:ctrlp_cache_dir = $HOME . '/.cache/ctrlp'
let g:ctrlp_clear_cache_on_exit = 0
let g:ctrlp_follow_symlinks = 1
let g:ctrlp_extensions = ['tag']
let g:ctrlp_max_files = 0
if executable('ag')
  " Use ag over grep
  set grepprg=ag\ --nogroup\ --nocolor

  " Use ag in CtrlP for listing files. Lightning fast and respects .gitignore
  let g:ctrlp_user_command = 'ag %s -l --nocolor --ignore .git --ignore build-out --ignore build-opt --ignore build-dbg -g ""'

  " ag is fast enough that CtrlP doesn't need to cache
  " let g:ctrlp_use_caching = 0
endif
" let g:ctrlp_match_func = { 'match': 'pymatcher#PyMatch' }
let g:ctrlp_match_func = {'match' : 'matcher#cmatch' }
colorscheme onedark
let g:airline_theme = "jellybeans"
let g:airline#extensions#tmuxline#enabled = 0
nnoremap <F2> :NERDTreeToggle<CR>
nnoremap <F3> :TlistToggle<CR>
nnoremap <C-t> :tabnew<CR>
nnoremap <C-g> :CtrlPBufTag<CR>
" nnoremap <C-[> :BufSurfForward<CR>
" nnoremap <C-]> :BufSurfBack<CR>
nnoremap th  :tabfirst<CR>
nnoremap tj  :tabprev<CR>
nnoremap tk  :tabnext<CR>
nnoremap tl  :tablast<CR>
nnoremap tn  :tabnext<Space>
" Switch to last active tab
let g:lasttab = 1
nmap tt :exe "tabn ".g:lasttab<CR>
au TabLeave * let g:lasttab = tabpagenr()

nnoremap ap  :PymodeLintAuto<CR>
nmap <leader>h *N
nnoremap <Leader>s :%s/\<<C-r><C-w>\>//g<Left><Left>
nnoremap <Leader>j :JavaSearchContext<CR>
:nnoremap gr :grep <cword> *<CR>
nnoremap cc :let @/ = ""<cr>
nnoremap <expr> gp '`[' . strpart(getregtype(), 0, 1) . '`]'
nnoremap <Leader>e :e <C-R>=expand('%:p:h') . '/'<CR>
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>
cmap w!! w !sudo tee % >/dev/null
let g:mustache_abbreviations = 1
autocmd BufNewFile,BufRead *.hbs set syntax=mustache
let g:EclimCompletionMethod = 'omnifunc'

"clang-format
let g:clang_format#command = 'clang-format-3.6'
