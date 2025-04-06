
" _   _        __      ___              _____             __ _
"| \ | |       \ \    / (_)            / ____|           / _(_)
"|  \| | ___  __\ \  / / _ _ __ ___   | |     ___  _ __ | |_ _  __ _
"| . ` |/ _ \/ _ \ \/ / | | '_ ` _ \  | |    / _ \| '_ \|  _| |/ _` |
"| |\  |  __/ (_) \  /  | | | | | | | | |___| (_) | | | | | | | (_| |
"|_| \_|\___|\___/ \/   |_|_| |_| |_|  \_____\___/|_| |_|_| |_|\__, |
"                                              by:b4ckr41n      __/ |
"                                                              |___/

let s:settings = {}
let s:settings.default_indent = 4
let s:settings.max_column = 120

"basic editor settings
set number
set showmatch
set matchtime=2
set foldenable
set foldmethod=indent
set backspace=indent,eol,start
set autoindent
set expandtab
set smarttab
set clipboard+=unnamedplus
let &tabstop=s:settings.default_indent              "number of spaces per tab for display
let &softtabstop=s:settings.default_indent          "number of spaces per tab in insert mode
let &shiftwidth=s:settings.default_indent           "number of spaces when indenting
set list                                            "highlight whitespace
set listchars=tab:│\ ,trail:•,extends:❯,precedes:❮
set shiftround
set linebreak
let &showbreak='↪ '
set cursorline

set scrolloff=1                                     "always show content after scroll
set scrolljump=5                                    "minimum number of lines to scroll
set display+=lastline
set wildmenu                                        "show list for autocomplete
set wildmode=list:full
set wildignorecase

set splitbelow
set splitright

" disable sounds
set noerrorbells
set novisualbell
set t_vb=

" searching
set hlsearch                                        "highlight searches
set incsearch                                       "incremental searching
set ignorecase                                      "ignore case for searching
set smartcase                                       "do case-sensitive if there's a capital letter
if executable('ack')
   set grepprg=ack\ --nogroup\ --column\ --smart-case\ --nocolor\ --follow\ $*
   set grepformat=%f:%l:%c:%m
endif
if executable('ag')
   set grepprg=ag\ --nogroup\ --column\ --smart-case\ --nocolor\ --follow
   set grepformat=%f:%l:%c:%m
endif

" Install Plugins
call plug#begin()
Plug 'kassio/neoterm'
Plug 'scrooloose/nerdtree'
Plug 'machakann/vim-highlightedyank'
Plug 'bling/vim-airline'
Plug 'mhinz/vim-startify'
Plug 'vim-airline/vim-airline-themes'
Plug 'aperezdc/vim-template'
Plug 'vimlab/split-term.vim'
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'tomasiser/vim-code-dark'
Plug 'neoclide/coc.nvim', {'branch' : 'release'}
"Plug 'Shougo/deoplete.nvim', {'do' : ':UpdateRemotePlugins'}
"Plug 'deoplete-plugins/deoplete-jedi'
"Plug 'deoplete-plugins/deoplete-clang'
Plug 'jaxbot/semantic-highlight.vim'
Plug 'christoomey/vim-tmux-navigator'
Plug 'cloudhead/neovim-fuzzy'
Plug 'mileszs/ack.vim'
Plug 'ObserverOfTime/coloresque.vim'
Plug 'tpope/vim-surround'
Plug 'unblevable/quick-scope'
Plug 'Vimjas/vim-python-pep8-indent'
Plug 'kassio/neoterm'
Plug 'sbdchd/neoformat'
Plug 'tpope/vim-commentary'
Plug 'jeetsukumaran/vim-pythonsense'
Plug 'spolu/dwm.vim'
Plug 'sunaku/vim-dasht'
Plug 'tomasiser/vim-code-dark'
Plug 'vim-utils/vim-husk'
call plug#end()

" enable deoplete
let g:deoplete#enable_at_startup = 1


" close deoplete method preview window after complete is done
autocmd InsertLeave,CompleteDone * if pumvisible() == 0 | pclose | endif

" toogle nerdtree with F2
map <F2> :NERDTreeToggle<CR>

" set coc completion to use tab instead of enter
"inoremap <silent><expr> <TAB> coc#pum#visible() ? coc#pum#confirm() : "\<C-g>u\<TAB>"
function! CheckBackspace() abort
    let col = col('.') - 1
    return !col || getline('.')[col - 1] =~# '\s'
endfunction


inoremap <silent><expr> <Tab>
      \ coc#pum#visible() ? coc#pum#next(1) :
      \ CheckBackspace() ? "\<Tab>" :
      \ coc#refresh()

inoremap <silent><expr> <c-space> coc#refresh()



" Ctrl+Arrows to navigate through windows in insert mode
noremap <buffer> <C-Left>  <C-\><C-n><C-w>h
noremap <buffer> <C-Down>  <C-\><C-n><C-w>j
noremap <buffer> <C-Up>    <C-\><C-n><C-w>k
noremap <buffer> <C-Right> <C-\><C-n><C-w>l

" Ctrl+Arrows to navigate through windows in normal mode
nnoremap <buffer> <C-Left>  <C-w>h
nnoremap <buffer> <C-Down>  <C-w>j
nnoremap <buffer> <C-Up>    <C-w>k
nnoremap <buffer> <C-Right> <C-w>l

" Splits Move Around
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>

" Ctrl+Arrows to navigate through windows in normal mode
map <buffer> <C-Left>  <C-w>h
map <buffer> <C-Down>  <C-w>j
map <buffer> <C-Up>    <C-w>k
map <buffer> <C-Right> <C-w>l

" Set Colors
colorscheme codedark

" Clang code completion
let g:deoplete#sources#clang#libclang_path = "/usr/lib/libclang.so"
let g:deoplete#sources#clang#clang_header = "/usr/lib/clang/8.0.1/"

" For neoformat
" Enable alignment
let g:neoformat_basic_format_align = 1

" Enable tab to spaces conversion
let g:neoformat_basic_format_retab = 1

" Enable trimmming of trailing whitespace
let g:neoformat_basic_format_trim = 1

