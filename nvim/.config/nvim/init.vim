" https://github.com/princejoogie/dotfiles

call plug#begin(stdpath('data'))

Plug 'AndrewRadev/tagalong.vim'
Plug 'ThePrimeagen/harpoon'
Plug 'Xuyuanp/nerdtree-git-plugin'
Plug 'alvan/vim-closetag'
Plug 'ap/vim-css-color'
Plug 'github/copilot.vim'
Plug 'haishanh/night-owl.vim'
Plug 'hrsh7th/cmp-buffer'
Plug 'hrsh7th/cmp-cmdline'
Plug 'hrsh7th/cmp-nvim-lsp'
Plug 'hrsh7th/cmp-path'
Plug 'hrsh7th/cmp-vsnip'
Plug 'hrsh7th/nvim-cmp'
Plug 'hrsh7th/vim-vsnip'
Plug 'iamcco/markdown-preview.nvim', { 'do': 'cd app && yarn install'  }
Plug 'jiangmiao/auto-pairs'
Plug 'neovim/nvim-lspconfig'
Plug 'neovim/nvim-lspconfig'
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim'
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
Plug 'preservim/nerdcommenter'
Plug 'preservim/nerdtree'
Plug 'prettier/vim-prettier', { 'do': 'yarn install --frozen-lockfile --production' }
Plug 'puremourning/vimspector'
Plug 'rhysd/vim-clang-format'
Plug 'ryanoasis/vim-devicons'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-surround'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'williamboman/nvim-lsp-installer'

call plug#end()

let mapleader=' '
     
" LUA CONFIGURATIONS
lua require('cmp-config')
lua require('harpoon-config')
lua require('lsp-config')
lua require('telescope-config')

" AIRLINE SETTINGS
let g:airline_theme='deus'
let g:airline#extensions#tabline#enabled = 1

" CLOSETAG SETTINGS
let g:closetag_filenames = '*.html,*.xhtml,*.phtml,*.jsx,*.tsx,*.js'
let g:closetag_xhtml_filenames = '*.xhtml,*.jsx,*.tsx,*.js'
let g:closetag_filetypes = 'html,xhtml,phtml,jsx,tsx,js'
let g:closetag_xhtml_filetypes = 'xhtml,jsx,tsx,js'
let g:closetag_emptyTags_caseSensitive = 1
let g:closetag_shortcut = '>'

" NERDTREE SETTINGS
nnoremap <C-b> :NERDTreeToggle<CR>
let g:NERDTreeShowHidden = 1
let g:NERDCreateDefaultMappings = 1
let g:NERDSpaceDelims = 1
let g:NERDCompactSexyComs = 1
let g:NERDDefaultAlign = 'left'
let g:NERDAltDelims_java = 1
let g:NERDCustomDelimiters = { 'c': { 'left': '/**','right': '*/' } }
let g:NERDCommentEmptyLines = 1
let g:NERDTrimTrailingWhitespace = 1
let g:NERDToggleCheckAllLines = 1

" GENERAL SETTINGS ----------------------
autocmd FileType cpp nmap <leader>f <cmd>ClangFormat<CR>
nmap <leader>f <cmd>Prettier<CR>
nmap <leader>mm <cmd>MarkdownPreview<CR>

nnoremap <leader>- :resize +5<CR>
nnoremap <leader>= :resize -5<CR>
nnoremap <leader>< :vertical resize +5<CR>
nnoremap <leader>> :vertical resize -5<CR>
nnoremap <leader><TAB> :bnext<CR>
nnoremap <leader><S-TAB> :bprev<CR>
nnoremap <leader>ch <cmd>lua require('telescope.builtin').command_history()<CR>
nnoremap <leader>r :NERDTreeFind<CR>zz

inoremap jj <Esc>
nnoremap <C-n> :noh<CR>
nnoremap <C-z> <Nop>
noremap <C-s> :w<CR>
vmap <C-c> "*y<CR>

colorscheme night-owl
filetype on
filetype plugin on
syntax on
syntax enable

set autoindent
set background=dark
set encoding=UTF-8
set foldmethod=syntax
set foldnestmax=10
set foldlevel=2
set hlsearch
set ignorecase
set incsearch
set nofoldenable
set nobackup
set noshowmode
set noswapfile
set nowritebackup
set nu rnu
set shiftwidth=2
set smartcase
set smarttab
set tabstop=2
set termguicolors
