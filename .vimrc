set termguicolors
syntax on
set number
set relativenumber
set tabstop=2
set shiftwidth=2
set softtabstop=2
set autoindent
set smartindent
set mouse=a
set clipboard=unnamedplus

" Copy ke clipboard
" vmap <leader>y :w !wl-copy<CR>

" Paste dari clipboard
" nmap <leader>p :r !wl-paste<CR>
"

" Copy to clipboard
vnoremap <Space>y :w !xclip -in -selection clipboard<CR><CR>
" Paste from clipboard
nnoremap <Space> :r !xclip -out -selection clipboard<CR>



call plug#begin('~/.vim/plugged')

Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'romgrk/doom-one.vim'
Plug 'joshdick/onedark.vim'
Plug 'geetarista/ego.vim'
Plug 'dasch/vim-mocha'
Plug 'adonaldson/vim-tictoc'
Plug 'instant-markdown/vim-instant-markdown', {'for': 'markdown', 'do': 'npm install'}
Plug 'hannakalinowska/vim_colors'
Plug 'drewtempelmeyer/palenight.vim'



" plugin flutter 
Plug 'dart-lang/dart-vim-plugin'
Plug 'thosakwe/vim-flutter'

" live server
Plug 'https://github.com/wolandark/vim-live-server.git'

call plug#end()


" Gunakan Tab untuk navigasi autocomplete
inoremap <expr> <Tab> pumvisible() ? "\<C-n>" : "\<Tab>"
inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"
" Enter untuk memilih item saat ini
inoremap <expr> <cr> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"
inoremap " ""<left>
inoremap ' ''<left>
inoremap ( ()<left>
inoremap { {}<left>
inoremap [ []<left>

colorscheme tictoc 

hi Normal guibg=NONE ctermbg=NONE
hi Normal guibg=NONE ctermbg=NONE
hi NonText guibg=NONE ctermbg=NONE
hi EndOfBuffer guibg=NONE ctermbg=NONE
hi LineNr ctermfg=grey guifg=grey 
hi LineNr ctermbg=NONE guibg=NONE
set signcolumn=yes
hi SignColumn ctermbg=NONE guibg=NONE
