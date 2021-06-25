set tabstop=2 softtabstop=2
set shiftwidth=2
set expandtab
set smartindent

set exrc
set guicursor=

set number
set relativenumber

set hidden
set noerrorbells

set ignorecase
set smartcase
set incsearch
set nohlsearch

set nowrap

set noswapfile
set nobackup
set undodir=~/.vim/undodir
set undofile

set scrolloff=10
set colorcolumn=120
set signcolumn=yes

set cmdheight=2
set updatetime=50 

set nofixendofline


call plug#begin('~/.vim/plugged')

"telescope and telescope dependencies
Plug 'nvim-lua/popup.nvim'
Plug 'nvim-lua/plenary.nvim'
Plug 'https://github.com/nvim-telescope/telescope.nvim' 

"lsp-support
Plug 'neovim/nvim-lspconfig'
Plug 'hrsh7th/nvim-compe'

"treesitter
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}

"colorscheme
Plug 'gruvbox-community/gruvbox'

Plug 'mbbill/undotree' 

Plug 'tpope/vim-fugitive' 
Plug 'tpope/vim-surround'
Plug 'vimwiki/vimwiki'
call plug#end()
colorscheme gruvbox
highlight Normal guibg=none



let mapleader=" "
noremap : ;
noremap ; :
nnoremap <leader>ps :lua require('telescope.builtin').grep_string({ search = vim.fn.input("Grep for > ")})<CR>
nnoremap <leader>ff <cmd>lua require('telescope.builtin').find_files()<cr>
nnoremap <leader>fg <cmd>lua require('telescope.builtin').live_grep()<cr>
nnoremap <leader>fb <cmd>lua require('telescope.builtin').buffers()<cr>
nnoremap <leader>fh <cmd>lua require('telescope.builtin').help_tags()<cr>

lua <<EOF
require'nvim-treesitter.configs'.setup {
  highlight = {
  enable = true
  }
}

require'nvim-treesitter.configs'.setup {
  indent = {
    enable = true
  }
}

require'lspconfig'.tsserver.setup {}

EOF


set completeopt=menuone,noselect
let g:completion_matching_strategy_list = ['exact', 'substring', 'fuzzy']

fun! LspLocationList()
    " lua vim.lsp.diagnostic.set_loclist({open_loclist = false})
endfun

nnoremap <leader>vd :lua vim.lsp.buf.definition()<CR>
nnoremap <leader>vi :lua vim.lsp.buf.implementation()<CR>
nnoremap <leader>vsh :lua vim.lsp.buf.signature_help()<CR>
nnoremap <leader>vrr :lua vim.lsp.buf.references()<CR>
nnoremap <leader>vrn :lua vim.lsp.buf.rename()<CR>
nnoremap <leader>vh :lua vim.lsp.buf.hover()<CR>
nnoremap <leader>vca :lua vim.lsp.buf.code_action()<CR>
nnoremap <leader>vsd :lua vim.lsp.diagnostic.show_line_diagnostics(); vim.lsp.util.show_line_diagnostics()<CR>
nnoremap <leader>vn :lua vim.lsp.diagnostic.goto_next()<CR>
nnoremap <leader>vll :call LspLocationList()<CR>

augroup MRRV_LSP
    autocmd!
    autocmd! BufWrite,BufEnter,InsertLeave * :call LspLocationList()
augroup END

let g:compe = {}
let g:compe.enabled = v:true
let g:compe.autocomplete = v:true
let g:compe.debug = v:false
let g:compe.min_length = 1
let g:compe.preselect = 'enable'
let g:compe.throttle_time = 80
let g:compe.source_timeout = 200
let g:compe.incomplete_delay = 400
let g:compe.max_abbr_width = 100
let g:compe.max_kind_width = 100
let g:compe.max_menu_width = 100
let g:compe.documentation = v:true

let g:compe.source = {}
let g:compe.source.path = v:true
let g:compe.source.buffer = v:true
let g:compe.source.calc = v:true
let g:compe.source.nvim_lsp = v:true
let g:compe.source.nvim_lua = v:true
let g:compe.source.vsnip = v:true

inoremap <silent><expr> <CR> compe#confirm('<CR>')

nnoremap <leader>u :UndotreeToggle<CR>
nnoremap <leader>pv :Ex<CR>
nnoremap <leader>h :wincmd h<CR>
nnoremap <leader>j :wincmd j<CR>
nnoremap <leader>k :wincmd k<CR>
nnoremap <leader>l :wincmd l<CR>
nnoremap <Leader>rp :resize 100<CR>
nnoremap <Leader>vp :vertical resize 120<CR>
nnoremap <Leader>c :set cursorline! <CR>

hi CursorLine   cterm=NONE ctermbg=darkred ctermfg=white guibg=darkred guifg=white
