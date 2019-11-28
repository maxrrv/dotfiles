set nocompatible "needed for vimwiki

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"Load plugins
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"plug.vim plugin-loading
call plug#begin('~/.vim/plugged')
Plug '/usr/local/opt/fzf' "Fuzzy file finder
Plug 'https://github.com/mileszs/ack.vim.git' "Add ag as search engine inside files
Plug 'https://github.com/scrooloose/nerdtree.git' "Adds a file tree for easier file access
Plug 'itchyny/lightline.vim' "Add lightweight airline alternative
Plug 'airblade/vim-gitgutter' "Add gitgutter (shows git changes next to the line numbers)
Plug 'https://github.com/tpope/vim-fugitive.git' "Add fugitive
Plug 'https://github.com/w0rp/ale.git' "Add on the fly linting 
Plug 'https://github.com/pangloss/vim-javascript.git' "JavaScript Syntax Highlighting for javascript
Plug 'https://github.com/MaxMEllon/vim-jsx-pretty.git' "Add React jsx highlighting
Plug 'NLKNguyen/papercolor-theme' "Add color
Plug 'mattn/emmet-vim' "Emmet
Plug 'https://github.com/tpope/vim-surround.git' "Change surroundings like brackets and tags
Plug 'https://github.com/scrooloose/nerdcommenter.git' "adds useful (un)commenting functionality
Plug 'https://github.com/vimwiki/vimwiki.git' "Create your own personal wiki with vim
call plug#end()

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"General Configuration
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set number relativenumber "Show line numbers. Show the current line number and all numbers relative to it.
set colorcolumn=120 "Set vertical line at 120

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
set background=light
colorscheme PaperColor

set showmatch "highlight matching bracket
set hlsearch " Highlight search results
set incsearch " Start searching as you begin to type

"settings for invisible characters
nmap <leader>l :set list!<CR>
set list
set listchars=tab:▸\ ,trail:·,precedes:←,extends:→,eol:¬,nbsp:␣,space:␣,

filetype plugin on "enable filetype plugin, also needed for vimwiki
set lazyredraw "do not redraw while executing macros (afaik)
set timeoutlen=600 ttimeoutlen=0 "mapping-delays / keycode-delays in ms
set ignorecase "ignore case when searching
set smartcase "ignore case when lower case only. case sensitive when upper case appears in search.

"do not create backup or swap files
set nobackup
set nowb
set noswapfile

" F5 opens a menu with a list of open buffers
:nnoremap <F5> :buffers<CR>:buffer<Space>

" Move between open buffers.
map <C-n> :bnext<CR>
map <C-p> :bprev<CR>

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
"Language specific
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
"Nerdtree
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"open/close nerdtree with control+n
noremap <silent> <Leader>n :NERDTreeToggle<CR>
nnoremap <silent> <Leader>v :NERDTreeFind<CR>

let NERDTreeMinimalUI = 1
let NERDTreeDirArrows = 1
let NERDTreeQuitOnOpen = 1 "Quit nerdtree on open file
let NERDTreeShowHidden=1 "show hidden files in nerdtree
:let g:NERDTreeWinSize=60 "default width of nerdtree pane
let NERDTreeShowLineNumbers=1 "enable line numbers
autocmd FileType nerdtree setlocal relativenumber "make sure relative line numbers are used

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"Lightline
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:lightline = {
      \ 'colorscheme': 'Tomorrow',
      \ 'active': {
      \   'left': [['mode', 'paste'], ['filename', 'modified']],
      \   'right': [['lineinfo'], ['percent'], ['readonly', 'linter_warnings', 'linter_errors', 'linter_ok']]
      \ },
      \ 'component_expand': {
      \   'linter_warnings': 'LightlineLinterWarnings',
      \   'linter_errors': 'LightlineLinterErrors',
      \   'linter_ok': 'LightlineLinterOK'
      \ },
      \ 'component_type': {
      \   'readonly': 'error',
      \   'linter_warnings': 'warning',
      \   'linter_errors': 'error'
      \ },
      \ }
set laststatus=2
set noshowmode "remove duplicate insert statement

function! LightlineLinterWarnings() abort
  let l:counts = ale#statusline#Count(bufnr(''))
  let l:all_errors = l:counts.error + l:counts.style_error
  let l:all_non_errors = l:counts.total - l:all_errors
  return l:counts.total == 0 ? '' : printf('%d ◆', all_non_errors)
endfunction

function! LightlineLinterErrors() abort
  let l:counts = ale#statusline#Count(bufnr(''))
  let l:all_errors = l:counts.error + l:counts.style_error
  let l:all_non_errors = l:counts.total - l:all_errors
  return l:counts.total == 0 ? '' : printf('%d ✗', all_errors)
endfunction

function! LightlineLinterOK() abort
  let l:counts = ale#statusline#Count(bufnr(''))
  let l:all_errors = l:counts.error + l:counts.style_error
  let l:all_non_errors = l:counts.total - l:all_errors
  return l:counts.total == 0 ? '✓ ' : ''
endfunction

autocmd User ALELintPost call s:MaybeUpdateLightline()

" Update and show lightline but only if it's visible (e.g., not in Goyo)
function! s:MaybeUpdateLightline()
  if exists('#lightline')
    call lightline#update()
  end
endfunction

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"GitGutter
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:gitgutter_sign_added = '•'
let g:gitgutter_sign_modified = '•'
let g:gitgutter_sign_removed = '•'
let g:gitgutter_sign_modified_removed = '•'
highlight GitGutterAdd    ctermfg=119
highlight GitGutterChange ctermfg=12
highlight GitGutterDelete ctermfg=9

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"vim-jsx-pretty
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:vim_jsx_pretty_colorful_config = 1 "Set colorful style

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"ale
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:ale_sign_column_always = 1 "Always show ale sidebar (prevent flickering)
let g:ale_pattern_options = {
      \   '.*\.spec\.js$': {'ale_enabled': 0},
      \   '.*\.spec\.jsx$': {'ale_enabled': 0},
      \}

let g:ale_sign_warning = '▲'
let g:ale_sign_error = '✗'
highlight link ALEWarningSign String
highlight link ALEErrorSign Title
highlight ALEWarning ctermbg=124
highlight ALEError ctermbg=124


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"NerdCommenter
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let NERDSpaceDelims=1

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"Ack
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
if executable('ag')
  let g:ackprg = 'ag --vimgrep'
endif

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"VimWiki
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let wiki_1 = {}
let wiki_1.path = '~/Workspace/klarna_repositories/own/klarna_vimwiki/'
let wiki_1.path_html = '~/Workspace/klarna_repositories/own/klarna_vimwiki/vimwiki_html/'

let wiki_2 = {}
let wiki_2.path = '~/Workspace/private/private_vimwiki/'
let wiki_2.path_html = '~/Workspace/private/private_vimwiki/vimwiki_html/'

let g:vimwiki_list = [wiki_1, wiki_2]
