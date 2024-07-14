" settings

let mapleader = " "
let &fillchars ..= ',eob: '
set number
set relativenumber
set termguicolors
set clipboard+=unnamedplus
set backspace=indent,eol,start
set tabstop=2
set shiftwidth=2
set expandtab
set encoding=utf-8
set nobackup
set nowritebackup
set signcolumn=yes
set updatetime=300
set guifont=0xProtoNerdFontMono
set shell=powershell
let &t_SI = "\e[6 q"
let &t_SR = "\e[4 q"
let &t_EI = "\e[2 q"

" keymaps

" visual

vmap <Tab> >gv
vmap <S-Tab> <gv
vmap jk <Esc>

" insert

imap jk <Esc>
imap <C-h> <Left>
imap <C-j> <Down>
imap <C-k> <Up>
imap <C-l> <Right>

" normal 

nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l
nnoremap <leader>r :source $MYVIMRC<CR>
nnoremap <leader>bd :bdelete!<CR>
nnoremap <leader>bn :bnext<CR>
nnoremap <leader>bp :bprevious<CR>
nnoremap <leader>vs :vsplit<CR> 
nnoremap <leader>hs :hsplit<CR>
nnoremap <leader>wh <C-w>H 
nnoremap <leader>wj <C-w>J
nnoremap <leader>wk <C-w>K 
nnoremap <leader>wl <C-w>L
nnoremap <leader>h :vertical resize -5<CR>
nnoremap <leader>j :resize +5<CR>
nnoremap <leader>k :resize -5<CR>
nnoremap <leader>l :vertical resize +5<CR>
nnoremap <leader>t :botright term<CR>

" terminal

tnoremap <C-h> <C-w>h
tnoremap <C-j> <C-w>j
tnoremap <C-k> <C-w>k
tnoremap <C-l> <C-w>l
tnoremap jk <C-\><C-n>
tnoremap <silent> <C-d> <C-\><C-n>:bdelete!<CR>

" plugins

call plug#begin('~/.vim/plugged')
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'catppuccin/vim', { 'as': 'catppuccin' }
Plug 'presevim/nerdtree'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'ryanoasis/vim-devicons'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'mg979/vim-visual-multi', {'branch': 'master'}
call plug#end()

" plugin settings

" catpuccin

colorscheme catppuccin_mocha

" nerdtree 
nnoremap <C-g> :NERDTreeToggle<CR>

" fzf 

let g:fzf_layout = { 'window': 'call fzf#vim#with_preview({ "window": { "width": 0.8, "height": 0.6, "relative": v:true, "yoffset": 0.5, "xoffset": 0.5 } })' }
let g:fzf_preview_window = []
nnoremap <C-s> :Files<CR>

" coc

let g:coc_global_extensions=[ 'coc-powershell', 'coc-snippets' ]
inoremap <silent><expr> <TAB> pumvisible() ? "\<C-n>" : "\<TAB>"
inoremap <silent><expr> <S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"
nnoremap <silent> K :call CocActionAsync('doHover')<CR>
inoremap <silent><expr> <CR> pumvisible() ? coc#pum#confirm() : "\<C-g>u\<CR>"

" airline 

let g:airline#extensions#tabline#enabled = 1
let g:airline#extentions#codeium#enabled = 1
let g:airline#extensions#tabline#formatter = 'unique_tail'
let g:airline_theme = 'catppuccin_mocha'
