
set nocompatible " be iMproved, required
filetype off     " required

call plug#begin()
  Plug 'editorconfig/editorconfig-vim'
  Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
  Plug 'junegunn/fzf.vim'
  Plug 'tpope/vim-commentary'
call plug#end()

filetype plugin indent on

let mapleader = ","

syntax enable


" set background=dark
set wildmenu " when opening a file with e.g. :e ~/.vim<TAB> there is a graphical menu of all the matches
set ttyfast
set lazyredraw
set updatetime=300
set hidden " Open other files if current one is not saved
set number
set numberwidth=4
set ruler

map j gj
map k gk

set autoindent
set cindent
set smartindent

set foldmethod=syntax
set foldlevel=99


" Set default encoding to utf-8
set encoding=utf-8
set termencoding=utf-8

" Disable backups and swap files
set nobackup
set nowritebackup
set noswapfile

set ignorecase " Ignore case case searching
set smartcase  " When searching try to be smart about cases
set incsearch  " Jumping search

set laststatus=2

" Delete characters outside of insert area
set backspace=indent,eol,start

" If fzf installed using git
set rtp+=~/.fzf
" Map fzf search to CTRL P
nnoremap <C-p> :GFiles<Cr>



" Fix some weird error with Fugitive
" let g:fugitive_pty = 0

" Change cursor to solid vertical line
" There are problems with Vim's floating window setting cursor to a solid
" block. So these lines below are resetting it to a solid vertical line.
" Reference chart of values:
"   Ps = 0  -> blinking block.
"   Ps = 1  -> blinking block (default).
"   Ps = 2  -> steady block.
"   Ps = 3  -> blinking underline.
"   Ps = 4  -> steady underline.
"   Ps = 5  -> blinking bar (xterm).
"   Ps = 6  -> steady bar (xterm).

let &t_SI = "\e[6 q" " insert mode
let &t_SR = "\e[4 q" " replace mode
let &t_EI = "\e[2 q" " everything elese



nnoremap <Leader>b :Buffers<CR>
nnoremap <Leader>h :History<CR>
nnoremap <Leader>t :BTags<CR>
nnoremap <Leader>T :Tags<CR>
nnoremap <C-s> :w<CR>
vnoremap <C-s> :w<CR>
inoremap jj <Esc>
nnoremap <Esc> :noh<CR>
tnoremap <Esc> <C-\><C-n>

nnoremap <S-j> :m .+1<CR>==
nnoremap <S-k> :m .-2<CR>==
vnoremap <S-j> :m '>+1<CR>gv=gv
vnoremap <S-k> :m '<-2<CR>gv=gv

nnoremap <C-h> :tabprevious<CR>
nnoremap <C-l> :tabnext<CR>

nnoremap <C-j> <C-d>zz<CR>
nnoremap <C-k> <C-u>zz<CR>
nnoremap <C-u> :redo<CR>
nnoremap <C-h> :tabprevious<CR>
nnoremap <C-l> :tabnext<CR>

vnoremap // y/\V<C-R>=escape(@",'/\')<CR><CR><S-n>
vnoremap <C-r> "hy:%s/<C-r>h//gc<left><left><left>

noremap <Leader>y "*y
noremap <Leader>d "*d
noremap <Leader>p "*p
noremap <Leader>P "*P

" prevent update buffer after past
vnoremap p "_dp"<CR>
vnoremap P "_dP"<CR>


set incsearch
set hlsearch

nmap <Leader>m :NvimTreeFindFile<CR>
nmap <Leader>M :NvimTreeToggle<CR>

" Toggle relative line numbers
nnoremap <leader>rn :set relativenumber!<cr>
set relativenumber

noremap n nzz
nnoremap N Nzz

set ttimeoutlen=1

set cursorline
hi CursorLine ctermfg=None ctermbg=None gui=underline cterm=underline
hi Visual ctermfg=253 ctermbg=25 gui=underline cterm=underline
highlight Cursor guifg=white guibg=black
hi Search guibg=yellow guifg=black

set spell spelllang=en_us
" set nospell
" https://www.linux.com/training-tutorials/using-spell-checking-vim/

" autocmd – run this automatically on some event
" BufNewFile – this is Vim’s new file event
" readme.md – this is the pattern you want the new file to match
" 0r – read into the buffer starting at line 0, the first line
" ~/skeletons/readme.md – the file to read in
" autocmd BufNewFile readme.md 0r ~/skeletons/readme.md
" autocmd BufNewFile *.sh 0r ~/skeletons/bash.sh
" autocmd BufNewFile *.tsx 0r ~/work/mydotfiles/skeletons/component.tsx

" autoReload if contend has been changed outside of the vim
au CursorHold,CursorHoldI * checktime

set autoread


nnoremap <silent> <Leader>r :source $MYVIMRC<cr>

set foldlevel=20
set foldmethod=expr
set foldexpr=nvim_treesitter#foldexpr()