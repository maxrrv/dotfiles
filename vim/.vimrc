"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"Variables for loading YouCompleteMe
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

let g:ycm_server_python_interpreter = '/usr/bin/python'

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"Load plugins
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

"plug.vim plugin-loading
call plug#begin('~/.vim/plugged')

"JavaScript Syntax Highlighting for javascript
Plug 'https://github.com/pangloss/vim-javascript.git'

"Add React jsx highlighting
Plug 'https://github.com/MaxMEllon/vim-jsx-pretty.git'

"Change surroundings like brackets and tags
Plug 'https://github.com/tpope/vim-surround.git'

"Adds a file tree for easier file access
Plug 'https://github.com/scrooloose/nerdtree.git'

"adds useful (un)commenting functionality
Plug 'https://github.com/scrooloose/nerdcommenter.git'

"Fuzzy file finder
Plug 'https://github.com/ctrlpvim/ctrlp.vim.git'

"Automatically closes matching brackets
"Plug 'git://github.com/jiangmiao/auto-pairs.git'

"Solarized Color Scheme
Plug 'https://github.com/altercation/vim-colors-solarized.git'

"Add gitgutter (shows git changes next to the line numbers)
Plug 'airblade/vim-gitgutter'

"Airline adds a status-bar at the bottom of the window. 
Plug 'https://github.com/vim-airline/vim-airline.git'

"Airline themes for the airline statusbar
Plug 'vim-airline/vim-airline-themes'

"Add fancy autocompletion to vim
Plug 'https://github.com/Valloric/YouCompleteMe.git'

"Create your own personal wiki with vim
Plug 'https://github.com/vimwiki/vimwiki.git'

"Add on the fly linting 
Plug 'https://github.com/w0rp/ale.git'

call plug#end()

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"General Configuration
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

"Show line numbers
set number relativenumber

"Set vertical line at 120
set colorcolumn=120

"remap colon to semicolon and vice versa in normal mode
noremap ; :
noremap : ;

"Tab configuration
set tabstop=2
set shiftwidth=2
set expandtab

"Set refresh time to 800 ms
set updatetime=800

"set leader to ","
let mapleader = ","
let g:mapleader = ","
noremap \ ,

"Color scheme
set background=light "or light
syntax enable
set t_Co=256 "enable 256 colors in terminal
colo monokai

"highlight matching bracket
set showmatch

" Highlight search results
set hlsearch

" Start searching as you begin to type
set incsearch

"settings for invisible characters
nmap <leader>l :set list!<CR>
set list
set listchars=tab:▸\ ,trail:·,precedes:←,extends:→,eol:¬,nbsp:␣

"enable filetype plugin
filetype plugin on

"do not redraw while executing macros (afaik)
set lazyredraw

"mapping-delays / keycode-delays in ms
set timeoutlen=600 ttimeoutlen=0

"ignore case when searching
set ignorecase

"do not create backup or swap files
set nobackup
set nowb
set noswapfile

" F5 opens a menu with a list of open buffers
:nnoremap <F5> :buffers<CR>:buffer<Space>

" Move around splits with <leader>hjkl
nnoremap  <leader>j <c-w>j
nnoremap  <leader>h <c-w>h
nnoremap  <leader>k <c-w>k
nnoremap  <leader>l <c-w>l

"disable antipattern-keys
nnoremap <Left> :echo "No left for you!"<CR>
vnoremap <Left> :<C-u>echo "No left for you!"<CR>
inoremap <Left> <Nop>

nnoremap <Right> :echo "No right for you!"<CR>
vnoremap <Right> :<C-u>echo "No right for you!"<CR>
inoremap <Right> <Nop>

nnoremap <Up> :echo "No up for you!"<CR>
vnoremap <Up> :<C-u>echo "No up for you!"<CR>
inoremap <Up> <Nop>

nnoremap <Down> :echo "No down for you!"<CR>
vnoremap <Down> :<C-u>echo "No down for you!"<CR>
inoremap <Down> <Nop>

nnoremap <BS> :echo "No bs for you!"<CR>
vnoremap <BS> :<C-u>echo "No bs for you!"<CR>
inoremap <BS> <Nop>

nnoremap <Del> :echo "No del for you!"<CR>
vnoremap <Del> :<C-u>echo "No del for you!"<CR>
inoremap <Del> <Nop>

nnoremap <PageUp> :echo "No PageUp for you!"<CR>
vnoremap <PageUp> :<C-u>echo "No PageUp for you!"<CR>
inoremap <PageUp> <Nop>

nnoremap <PageDown> :echo "No PageDown for you!"<CR>
vnoremap <PageDown> :<C-u>echo "No PageDown for you!"<CR>
inoremap <PageDown> <Nop>
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"Nerdtree Settings
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

"open/close nerdtree with control+n
noremap <C-n> :NERDTreeToggle<CR>

"show hidden files in nerdtree
let NERDTreeShowHidden=1

"default width of nerdtree pane
:let g:NERDTreeWinSize=60

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"Airline Settings
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

"Set the Airline Theme
let g:airline_theme='base16'

"connect ale with airline
let g:airline#extensions#ale#enabled = 1

"Add bar with open buffers
let g:airline#extensions#tabline#enabled = 1

"Tabline format
let g:airline#extensions#tabline#formatter = 'unique_tail'

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"vim-jsx-pretty Settings
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

"Set colorful style
let g:vim_jsx_pretty_colorful_config = 1

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"A.L.E Settings
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

"Always show A.L.E sidebar
let g:ale_sign_column_always = 1

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"ctrlP Settings
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

let g:ctrlp_show_hidden = 1
let g:ctrlp_match_window = 'max:50,results:50'
let g:ctrlp_user_command = ['.git', 'cd %s && git ls-files']

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"NerdCommenter Settings
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

let NERDSpaceDelims=1

