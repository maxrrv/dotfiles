set nocompatible "needed for vimwiki
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"Variables for loading YouCompleteMe
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" let g:ycm_server_python_interpreter = '/usr/bin/python'

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"Load plugins
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

"plug.vim plugin-loading
call plug#begin('~/.vim/plugged')

"JavaScript Syntax Highlighting for javascript
Plug 'https://github.com/pangloss/vim-javascript.git'

"Add React jsx highlighting
Plug 'https://github.com/MaxMEllon/vim-jsx-pretty.git'

" Easily navigate through import files
Plug 'moll/vim-node'

" Emmet
Plug 'mattn/emmet-vim'

" gf for js
Plug 'kkoomen/gfi.vim'

"Change surroundings like brackets and tags
Plug 'https://github.com/tpope/vim-surround.git'

"Adds a file tree for easier file access
Plug 'https://github.com/scrooloose/nerdtree.git'

"adds useful (un)commenting functionality
Plug 'https://github.com/scrooloose/nerdcommenter.git'

"Fuzzy file finder
Plug '/usr/local/opt/fzf'

"Automatically closes matching brackets
"Plug 'git://github.com/jiangmiao/auto-pairs.git'

"Add gitgutter (shows git changes next to the line numbers)
Plug 'airblade/vim-gitgutter'

"Airline adds a status-bar at the bottom of the window. 
Plug 'https://github.com/vim-airline/vim-airline.git'

"Airline themes for the airline statusbar
Plug 'vim-airline/vim-airline-themes'

"Add fancy autocompletion to vim
" Plug 'https://github.com/Valloric/YouCompleteMe.git'

"Create your own personal wiki with vim
Plug 'https://github.com/vimwiki/vimwiki.git'

"Add on the fly linting 
Plug 'https://github.com/w0rp/ale.git'

"Add fugitive
Plug 'https://github.com/tpope/vim-fugitive.git'

"Add ag as search engine inside files
Plug 'https://github.com/mileszs/ack.vim.git'

"Add clojure plugins
" Plug 'https://github.com/tpope/vim-fireplace.git'
" Plug 'https://github.com/tpope/vim-salve.git'

"Add color
Plug 'NLKNguyen/papercolor-theme'
call plug#end()

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"General Configuration
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

"Show line numbers. Show the current line number and all numbers relative to it.
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

set updatetime=500

"set leader to ","
let mapleader = ","
let g:mapleader = ","
noremap \ ,

"Color scheme
syntax enable
set background=light "or dark
colorscheme PaperColor

"highlight matching bracket
set showmatch

" Highlight search results
set hlsearch

" Start searching as you begin to type
set incsearch

"settings for invisible characters
nmap <leader>l :set list!<CR>
set list
set listchars=tab:▸\ ,trail:·,precedes:←,extends:→,eol:¬,nbsp:␣,space:␣,

"enable filetype plugin, also needed for vimwiki
filetype plugin on

"do not redraw while executing macros (afaik)
set lazyredraw

"mapping-delays / keycode-delays in ms
set timeoutlen=600 ttimeoutlen=0

"ignore case when searching
set ignorecase

"ignore case when lower case only. case sensitive when upper case appears in search.
set smartcase

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
"Language specific settings
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

augroup INDENTATION
  autocmd!
  autocmd FileType * set tabstop=2 | set shiftwidth=2
  autocmd FileType json set tabstop=4 | set shiftwidth=4
augroup END

augroup PHP
  autocmd!
  autocmd FileType php set tabstop=2 | set noexpandtab | set shiftwidth=2
augroup END

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"Nerdtree Settings
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

"open/close nerdtree with control+n
noremap <C-n> :NERDTreeToggle<CR>

"show hidden files in nerdtree
let NERDTreeShowHidden=1

"default width of nerdtree pane
:let g:NERDTreeWinSize=60

" enable line numbers
let NERDTreeShowLineNumbers=1
" " make sure relative line numbers are used
autocmd FileType nerdtree setlocal relativenumber
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
let g:ale_pattern_options = {
      \   '.*\.spec\.js$': {'ale_enabled': 0},
      \   '.*\.spec\.jsx$': {'ale_enabled': 0},
      \}

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"NerdCommenter Settings
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

let NERDSpaceDelims=1


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"Ack.vim settings
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

if executable('ag')
  let g:ackprg = 'ag --vimgrep'
endif

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" IndentLine Settings
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" function! DisableIndentLine()
  " let g:indentLine_enabled = 0
" endfunction

" let g:indentLine_char = '┆'
" augroup INDENTLINE_IGNORE_FILETYPES
  " autocmd!
  " autocmd FileType json,yml :call DisableIndentLine()
" augroup END

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"VimWiki settings
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

let wiki_1 = {}
let wiki_1.path = '~/Workspace/klarna_repositories/own/klarna_vimwiki/'
let wiki_1.path_html = '~/Workspace/klarna_repositories/own/klarna_vimwiki/vimwiki_html/'

let wiki_2 = {}
let wiki_2.path = '~/Workspace/private/private_vimwiki/'
let wiki_2.path_html = '~/Workspace/private/private_vimwiki/vimwiki_html/'

let g:vimwiki_list = [wiki_1, wiki_2]
