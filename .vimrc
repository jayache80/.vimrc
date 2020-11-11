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
set wildmenu

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
    endif
else
    if g:os =~ "Linux" || g:os =~ "MSYS_NT" || g:os =~ "MINGW64_NT" || g:os =~ "CYGWIN_NT" || g:os =~ "Darwin"
        " is terminal
        set t_Co=256
        colorscheme jellybeans
    else
        " is windows cmd
        set termguicolors
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

" netrw defaults <C-l> to refresh the explorer file list. Re-map this function
" ahead of time to something else so we can use <C-l> for something cooler
" like switching windows
nmap <leader>nr <Plug>NetrwRefresh

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

" move a line of text using terminal compatible <leader>[jk]
nmap <leader>j mz:m+<cr>`z
nmap <leader>k mz:m-2<cr>`z

" Enable mouse support in console
set mouse=a

" Enable mouse support in tmux
set ttymouse=xterm2

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
" search for files recursively
set path+=../**

" open netrw file explorer in vertical split
nnoremap <leader>x :Vex<cr>
" open netrw file explorer in current window
nnoremap <leader>ee :Ex<cr>

" when saving a session with :mksession mysession.vim, don't write your .vimrc
" options into the mysession.vim file. Those should always come from, well,
" your .vimrc
set sessionoptions-=options
" use relative paths when creating session file
set sessionoptions=sesdir

" show all buffers and split them vertically
nnoremap <leader>sa :vert sba<cr>

" open a definition as a new vertical split (ctags)
map <A-]> :vsp <cr>:exec("tag ".expand("<cword>"))<cr>

" open a definition as a new vertical split (ctags) without alt (meta) key for
" terminals
map <leader>] :vsp <cr>:exec("tag ".expand("<cword>"))<cr>

" render syntax for .ebs files as Visual Basic script
au BufNewFile,BufRead *.ebs set filetype=vb

" make wherever netrw Explorer is the current directory
" let g:netrw_keepdir=0

" Look for tags file in the directory of current file, then work your way up
" until you find the tags file
set tags=./tags;,tags;

" vim defaults with complete set to ., w, b, u, t, i, meaning current buffer,
" buffers in other windows, other buffers, unloaded buffers, tags, and
" included files
" Have auto-complete not include the (potentially massive) tags file, nor
" include (header) files
set complete-=t
set complete-=i

" Fold functions using syntax (as opposed to indent) on <leader>f
map <leader>f :set foldmethod=syntax<cr>
" No nested folding...
set foldnestmax=1
" Dont fold comment blocks
let c_no_comment_fold=1

" Decrease vertical buffer width from the right
map <A-h> <C-w><
" Increase vertical buffer width to the right
map <A-l> <C-w>>

" Decrease vertical buffer width from the right (terminal version)
map <leader>h <C-w><
" Increase vertical buffer width to the right (terminal version)
map <leader>l <C-w>>

" When jumping to functions, center them on the screen
map [[ [[zz
map ]] ]]zz
map [] []zz
map ][ ][zz

" When jumping to diffs, center them on the screen
map ]c ]czz
map [c [czz

" delete without yanking
nnoremap <leader>d "_d
vnoremap <leader>d "_d

" replace currently selected text with default register without yanking it
vnoremap <leader>p "_dP

" Eliminate delay when pressing escape
set timeoutlen=1000 ttimeoutlen=0

" make new splits (with :vnew and :new) be created to the right and below,
" respectively
set splitright
set splitbelow

" Don't lose column position with paging up/down
set nostartofline

" <leader> sp to toggle paste mode
map <leader>sp :set paste!<cr>

" send last yanked text to the system yank command
map <leader>sy :call system("yank", @")<cr>

" Don't automatically add an EOL character to the end of a file if it's
" missing one. Leave no trace, man.
set nofixendofline

