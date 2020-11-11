set nobackup
set nowritebackup
set noswapfile
set nowrap
syntax on
set background=dark
set number

if has("gui_running")
    colorscheme desert
    set guioptions-=m  "remove menu bar
    set guioptions-=T  "remove toolbar
    set guioptions-=r  "remove right-hand scroll bar
    set guioptions-=L  "remove left-hand scroll bar
    set guifont=menlo
else
    colorscheme desert256
endif

filetype plugin indent on
" show existing tab with 4 spaces width
set tabstop=4
" when indenting with '>', use 4 spaces width
set shiftwidth=4
" On pressing tab, insert 4 spaces
set expandtab

" Hide netrw banner
let g:netrw_banner = 0
" Open new files in new vertical split
let g:netrw_browse_split = 2

" C-<h, j, k, l> to switch windows
map <C-h> <C-w>h
map <C-j> <C-w>j
map <C-k> <C-w>k
map <C-l> <C-w>l

