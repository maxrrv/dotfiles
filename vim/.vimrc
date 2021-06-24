"Default settings
syntax enable 
set expandtab
set nobackup
set noerrorbells
set noswapfile
set nowrap
set number
set relativenumber
set shiftwidth=2
set ignorecase
set smartcase
set smartindent
set tabstop=2 softtabstop=2
set undodir=~/.vim/undodir
set undofile
set incsearch
set hlsearch
set updatetime=300

set colorcolumn=120
highlight ColorColumn ctermbg=0 guibg=lightgrey

"Plugins
call plug#begin('~/.vim/plugged')

Plug 'honza/vim-snippets'
Plug 'iamcco/markdown-preview.nvim', { 'do': 'cd app && yarn install' }
Plug 'jremmen/vim-ripgrep'
Plug 'junegunn/fzf', {'do': { -> fzf#install() }}
Plug 'junegunn/fzf.vim'
Plug 'leafgarland/typescript-vim'
Plug 'mattn/emmet-vim' "Emmet
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
let g:gruvbox_italic=1
colorscheme gruvbox
set background=dark
highlight Comment cterm=italic
highlight Keyword gui=italic cterm=italic
"figure out how to italic js keywords

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
let g:any_jump_disable_default_keybindings = 1

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

"commands
command Vime edit $MYVIMRC

"mappings
inoremap jj <esc>
nnoremap : ;
nnoremap ; :
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
nnoremap <silent> <leader>+ :resize +5<CR>
nnoremap <silent> <leader>_ :resize -5<CR>

nnoremap <silent> <c-p> :GFiles<CR>

" Coc
nmap <silent>  gd <Plug>(coc-definition)
nmap <silent>  gy <Plug>(coc-type-definition)
nmap <silent>  gi <Plug>(coc-implementation)
nmap <silent>  gr <Plug>(coc-references)
" Use tab for trigger completion with characters ahead and navigate.
" NOTE: Use command ':verbose imap <tab>' to make sure tab is not mapped by
" other plugin before putting this into your config.
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
if has('nvim')
  inoremap <silent><expr> <c-space> coc#refresh()
else
  inoremap <silent><expr> <c-@> coc#refresh()
endif

" Make <CR> auto-select the first completion item and notify coc.nvim to
" format on enter, <cr> could be remapped by other vim plugin
inoremap <silent><expr> <cr> pumvisible() ?  coc#_select_confirm()
      \: "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"

augroup Jenkinsfile
  autocmd!
  au BufNewFile,BufRead Jenkinsfile setf groovy
augroup END

let &t_ZH="\e[3m"
let &t_ZR="\e[23m"

set nofixendofline
