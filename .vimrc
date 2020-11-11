" many things stolen from Josh. thanks Josh.
set nobackup
set nowritebackup
set noswapfile
set nowrap
syntax on
set background=dark
set number
set autoindent
set backspace=2
set showmatch
set ruler
set colorcolumn=80
set smartcase
set smarttab
set cmdheight=2
set noerrorbells
set novisualbell

" Get rid of annoying bell on esc, end of scroll, etc.
set noerrorbells visualbell t_vb=
if has('autocmd')
  autocmd GUIEnter * set visualbell t_vb=
endif

" set <leader>
let mapleader = ","
let g:mapleader = ","

" detect operating system
if !exists("g:os")
    if has("win64") || has("win32") || has("win16")
        let g:os = "Windows"
    else
        let g:os = substitute(system('uname'), '\n', '', '')
    endif
endif

if has("gui_running")
    colorscheme jellybeans
    set guioptions-=m  "remove menu bar
    set guioptions-=T  "remove toolbar
    set guioptions-=r  "remove right-hand scroll bar
    set guioptions-=L  "remove left-hand scroll bar
    " Make split buffers even widths (useful for after a window resize, etc.)
    " C-s is terminal specific signalling mechanism, so only works on gui
    map <C-s> <C-W>=
    if has("gui_macvim")
        set guifont=menlo
    else 
        " is gvim
        " Start gui window maximized
        au GUIEnter * simalt ~x    
        set guifont=consolas
        let &runtimepath.=',$HOME/vimfiles'
        " F11 for fullscreen mode. gvimfullscreen.dll must be where gvim.exe is. 
        " Provided by Derek McLoughlin http://www.vim.org/scripts/script.php?script_id=2596
        map <F11> <Esc>:call libcallnr("gvimfullscreen.dll", "ToggleFullScreen", 0)<CR> 
    endif
else
    " is terminal
    if g:os == "Linux"
        set t_Co=256
        colorscheme jellybeans
    endif
endif

" intelligent indent based on file extension
filetype plugin indent on
" show existing tab with 4 spaces width
set tabstop=4
" when indenting with '>', use 4 spaces width
set shiftwidth=4
" on pressing tab, insert 4 spaces
set expandtab

" remove useless search as you type
set noincsearch
" highlight search results
set hlsearch
" Ctrl+a to clear the highlighting after a search
map <C-a> :noh<cr>
" set off the other paren
highlight MatchParen ctermbg=2

" hide netrw banner
let g:netrw_banner = 0
" open files in new vertical split
let g:netrw_browse_split = 2

" C-<h, j, k, l> to switch windows
map <C-h> <C-w>h
map <C-j> <C-w>j
map <C-k> <C-w>k
map <C-l> <C-w>l

" swap current buffer with the one to the right
map <C-x> <C-w>x

" managing tabs
map <leader>tn :tabnew<cr>
map <leader>to :tabonly<cr>
map <leader>tc :tabclose<cr>
map <leader>tm :tabmove<cr>
map <leader>te :tabedit <c-r>=expand("%:ph")<cr>/
" move existing buffer to new tab
map <leader>tb <C-w>T
" copy existing buffer to new tab
map <leader>tp :tabnew %<cr>

" when I close a tab, remove the buffer
set nohidden

" move a line of text using ALT+[jk]
nmap <M-j> mz:m+<cr>`z
nmap <M-k> mz:m-2<cr>`z
vmap <M-j> :m'>+<cr>`<my`>mzgv`yo`z
vmap <M-k> :m'>-2<cr>`<my`>mzgv`yo`z

set mouse=a " Enable mouse support in console

" quick write
nnoremap <silent> <leader>w :w<cr>
" quick quit
nnoremap <leader>q :q<cr>
" quick buffer delete
nnoremap <leader>d :bd<cr>
" quick edit .vimrc
nnoremap <silent> <leader>ev :tabnew<cr>:e $MYVIMRC<cr>

" create Blank Newlines and stay in Normal mode
nnoremap <silent> zj o<Esc>
nnoremap <silent> zk O<Esc>

" search mappings: These will make it so that going to the next one in a
" search will center on the line it's found in.
map N Nzz
map n nzz

" open file under cursor
map <leader>o <Esc> <C-w>vgf

" open netrw file explorer in vertical split
nnoremap <leader>x :Vex<cr>

" when saving a session with :mksession mysession.vim, don't write your .vimrc
" options into the mysession.vim file. Those should always come from, well,
" your .vimrc
set sessionoptions-=options

" show all buffers and split them vertically
nnoremap <leader>sa :vert sba<cr>

" open a definition as a new vertical split (ctags)
map <A-]> :vsp <cr>:exec("tag ".expand("<cword>"))<cr>

