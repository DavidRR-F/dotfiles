"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"""""""""""""""""""""" Plugins """"""""""""""""""""""""""""""""""
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

call plug#begin('~/.vim/plugged')
Plug 'catppuccin/vim', { 'as': 'catppuccin' }
Plug 'itchyny/lightline.vim'
Plug 'ryanoasis/vim-devicons'
Plug 'tpope/vim-fugitive'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'christoomey/vim-tmux-navigator'
Plug 'sheerun/vim-polyglot'
Plug 'airblade/vim-gitgutter'
Plug 'mhinz/vim-startify'
call plug#end()


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"""""""""""""""""""""" Keymaps """"""""""""""""""""""""""""""""""
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

let mapleader = " "

nnoremap <leader>r :source $MYVIMRC<CR>

" Mouse scroll
nnoremap <silent> <ScrollWheelUp> <C-Y>
nnoremap <silent> <ScrollWheelDown> <C-E>

" Tab indent in visual mode
vnoremap <silent> <Tab> >gv
vnoremap <silent> <S-Tab> <gv

" Window management
nnoremap <silent> <Leader>sv :vsplit<CR>
nnoremap <silent> <Leader>sh :split<CR>
nnoremap <silent> <Leader>wk <C-w>K
nnoremap <silent> <Leader>wj <C-w>J
nnoremap <silent> <Leader>wh <C-w>H
nnoremap <silent> <Leader>wl <C-w>L

" Buffer navigation
nnoremap <silent> <Leader>bn :bnext<CR>
nnoremap <silent> <Leader>bp :bprev<CR>
nnoremap <silent> <Leader>bd :bd<CR>

" File/Git navigation
nnoremap <silent> <Leader>fe :Explore<CR>
nnoremap <silent> <Leader>ff :Files<CR>
nnoremap <silent> <Leader>fs :GF?<CR>
nnoremap <silent> <Leader>ft :Tags<CR>
nnoremap <silent> <Leader>gd :Gvdiffsplit<CR>


" Messages
nnoremap <silent> <Leader>M :messages<CR>

" Tmux Pane Navigator
let g:tmux_navigator_no_mappings = 1
nnoremap <silent> <C-h> :<C-U>TmuxNavigateLeft<cr>
nnoremap <silent> <C-j> :<C-U>TmuxNavigateDown<cr>
nnoremap <silent> <C-k> :<C-U>TmuxNavigateUp<cr>
nnoremap <silent> <C-l> :<C-U>TmuxNavigateRight<cr>

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"""""""""""""""""""""" Settings """""""""""""""""""""""""""""""""
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" unnamed if windows
set clipboard=unnamedplus

" Line numbers
set number
set relativenumber

" Cursor line
set cursorline

" Indentation settings
set tabstop=2
set shiftwidth=2
set expandtab
set autoindent

" Wrapping
set nowrap

" Search settings
set ignorecase
set smartcase

" Window/tab settings
set showtabline=0
set laststatus=2

" Backspace behavior
set backspace=indent,eol,start

" Split behavior
set splitright
set splitbelow

" Fill characters
set fillchars=eob:\ 

" Conceal level
set conceallevel=2

" Folding settings
set foldlevel=5
set foldmethod=expr

" Enable cursor shape changes based on the mode
if &term =~ '^xterm\|rxvt'
    let &t_SI .= "\<Esc>[4 q"
    let &t_EI .= "\<Esc>[2 q"
endif
if &term =~ "xterm"
    let &t_SI = "\<Esc>[6 q"
    let &t_SR = "\<Esc>[4 q"
    let &t_EI = "\<Esc>[2 q"
endif
if &term =~ '^\(xterm\|rxvt\|tmux\)'
    let &t_SI = "\<Esc>[6 q"  
    let &t_SR = "\<Esc>[4 q"  
    let &t_EI = "\<Esc>[2 q"  
endif

" Active Venv in CWD
autocmd BufEnter *.py if filereadable(".venv/bin/activate") | execute 'silent! !source .venv/bin/activate' | endif

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"""""""""""""""""""""" Theme """"""""""""""""""""""""""""""""""""
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

set termguicolors
colorscheme catppuccin_mocha
set laststatus=2
set background=dark
set signcolumn=yes
set nocompatible

" gitsigns

let g:gitgutter_sign_added = '┃'
let g:gitgutter_sign_modified = '┃'
let g:gitgutter_sign_removed = '▁'
let g:gitgutter_sign_removed_first_line = '▔'
let g:gitgutter_sign_removed_above_and_below = '▁'
let g:gitgutter_sign_modified_removed = '~'

" lightline

let s:mauve = [ "#CBA6F7", 183 ]
let s:red = [ "#F38BA8", 211 ]
let s:yellow = [ "#F9E2AF", 223 ]
let s:teal = [ "#94E2D5", 152 ]
let s:blue = [ "#89B4FA", 117 ]
let s:overlay0 = [ "#6C7086", 243 ]
let s:surface1 = [ "#45475A", 240 ]
let s:surface0 = [ "#313244", 236 ]
let s:base = [ "#1E1E2E", 235 ]
let s:mantle = [ "#181825", 234 ]

let s:p = {'normal': {}, 'inactive': {}, 'insert': {}, 'replace': {}, 'visual': {}, 'tabline': {}}
let s:p.normal.left = [ [ s:blue, s:base ], [ s:blue, s:base ] ]
let s:p.normal.right = [ [ s:blue, s:base ], [ s:blue, s:base ] ]
let s:p.inactive.right = [ [ s:surface1, s:base ], [ s:overlay0, s:base ] ]
let s:p.inactive.left =  [ [ s:blue, s:base ], [ s:overlay0, s:base ] ]
let s:p.insert.left = [ [ s:teal, s:base ], [ s:teal, s:base ] ]
let s:p.replace.left = [ [ s:red, s:base ], [ s:red, s:base ] ]
let s:p.visual.left = [ [ s:mauve, s:base ], [ s:mauve, s:base ] ]
let s:p.normal.middle = [ [ s:blue, s:base ] ]
let s:p.inactive.middle = [ [ s:surface1, s:base ] ]
let s:p.tabline.left = [ [ s:overlay0, s:base ], [ s:overlay0, s:base ] ]
let s:p.tabline.tabsel = [ [ s:blue, s:surface1 ], [ s:overlay0, s:base] ]
let s:p.tabline.middle = [ [ s:surface1, s:base ] ]
let s:p.tabline.right = copy(s:p.inactive.right)
let s:p.normal.error = [ [ s:mantle, s:red ] ]
let s:p.normal.warning = [ [ s:mantle, s:yellow ] ]

highlight GitStatusAdded guifg=#CBA6F7 ctermfg=183
highlight GitStatusModified guifg=#F9E2AF ctermfg=223
highlight GitStatusRemoved guifg=#F38BA8 ctermfg=211

function! GitStatus()
  let [a, m, r] = GitGutterGetHunkSummary()
  return printf('+%d ~%d -%d', a, m, r)
endfunction

let g:lightline#colorscheme#catppuccin_mocha#palette = lightline#colorscheme#flatten(s:p)
let g:lightline = {
      \ 'colorscheme': 'catppuccin_mocha',
      \ 'active': {
      \   'left': [ [ 'mode', 'paste' ],
      \             [ 'readonly', 'filename' ] ],
      \   'right': [ [ 'gitstatus', 'gitbranch' ] ],
      \ },
      \ 'component_function': {
      \   'gitbranch': 'FugitiveHead',
      \   'gitstatus': 'GitStatus'
      \ },
      \ 'mode_map': {
        \ 'n' : '',
        \ 'i' : '󰷫',
        \ 'R' : '',
        \ 'v' : '',
        \ 'V' : '󱀦',
        \ "\<C-v>": '󰈈',
        \ 'c' : '',
        \ 's' : '',
        \ 'S' : '',
        \ "\<C-s>": '󱁵',
        \ 't': '',
        \ },
      \ }
highlight CursorLine guibg=NONE
highlight CursorLineNr guifg=#F9E2AF

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"""""""""""""""""""""" Custom """""""""""""""""""""""""""""""""
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" Auto Ctags

function! RunCtags()
    let project_dir = expand('%:p:h')
    let project_name = fnamemodify(project_dir, ':p:h:t')
    let tags_dir = expand('~/.ctags/' . project_name)
    let tags_file = tags_dir . '/tags'

    call mkdir(tags_dir, "p")

    let exclude_dirs = ['node_modules', '.git', '.venv']
    let exclude_patterns = []

    for dir in exclude_dirs
        call add(exclude_patterns, '--exclude=' . dir)
    endfor

    let exclude_options = join(exclude_patterns, ' ')
    let ctags_command = 'ctags -R -f ' . tags_file . ' ' . exclude_options . ' ' . project_dir

    call system(ctags_command)

    execute 'set tags=' . tags_file 
endfunction

augroup AutoCtags
    autocmd!
    autocmd BufEnter * call RunCtags()
    autocmd BufWritePost * call RunCtags()
    autocmd BufDelete * call RunCtags()
augroup END
