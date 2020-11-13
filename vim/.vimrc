"Default settings
syntax on 

set expandtab
set nobackup
set noerrorbells
set noswapfile
set nowrap
set number
set relativenumber
set shiftwidth=2
set smartcase
set smartindent
set tabstop=2 softtabstop=2
set undodir=~/.vim/undodir
set undofile
set incsearch
set hlsearch

set colorcolumn=120
highlight ColorColumn ctermbg=0 guibg=lightgrey

"Plugins
call plug#begin('~/.vim/plugged')

Plug 'jremmen/vim-ripgrep'
Plug 'junegunn/fzf', {'do': { -> fzf#install() }}
Plug 'junegunn/fzf.vim'
Plug 'leafgarland/typescript-vim'
Plug 'mbbill/undotree'
Plug 'morhetz/gruvbox'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'pechorin/any-jump.vim'
Plug 'sheerun/vim-polyglot'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-surround'
Plug 'vim-utils/vim-man' 
Plug 'vimwiki/vimwiki'

call plug#end()

"Configs
colorscheme gruvbox
set background=dark

if executable('rg')
  let g:rg_derive_root='true'
endif

let loaded_matchparen = 1
let mapleader = " "

let g:netrw_banner = 0 
let g:netrw_browse_split = 2
let g:netrw_winsize = 25

let g:fzf_layout = { 'window': { 'width': 0.8, 'height': 0.8} }
let $FZF_DEFAULT_OPTS = '--reverse'

"VimWiki
let wiki_1 = {}
let wiki_1.path = '~/Workspace/klarna_repositories/own/klarna_vimwiki/'
let wiki_1.path_html = '~/Workspace/klarna_repositories/own/klarna_vimwiki/vimwiki_html/'

let wiki_2 = {}
let wiki_2.path = '~/Workspace/private/private_vimwiki/'
let wiki_2.path_html = '~/Workspace/private/private_vimwiki/vimwiki_html/'

let wiki_3 = {}
let wiki_3.path = '~/Workspace/private/decision_diary/'
let wiki_3.path_html = '~/Workspace/private/decision_diary/vimwiki_html/'

let g:vimwiki_list = [wiki_1, wiki_2, wiki_3]
let g:any_jump_disable_default_keybindings = 1

"mappings
nnoremap <leader>a :AnyJump<CR>
nnoremap <leader>h :wincmd h<CR>
nnoremap <leader>j :wincmd j<CR>
nnoremap <leader>k :wincmd k<CR>
nnoremap <leader>l :wincmd l<CR>
nnoremap <leader>u :UndotreeToggle<CR>
nnoremap <leader>pv :wincmd v <bar> :Ex <bar> :vertical resize 30<CR>
nnoremap <leader>ps :Rg<SPACE>
nnoremap <silent> <leader>= :vertical resize +5<CR>
nnoremap <silent> <leader>- :vertical resize -5<CR>

nnoremap <silent> <c-p> :GFiles<CR>

" GoTo code navigation.
nmap <silent>  gd <Plug>(coc-definition)
nmap <silent>  gy <Plug>(coc-type-definition)
nmap <silent>  gi <Plug>(coc-implementation)
nmap <silent>  gr <Plug>(coc-references)
