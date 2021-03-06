
set nocompatible " be iMproved, required
filetype off     " required

" Keep Plug commands between plug#begin() and plug#end().
call plug#begin()
" Keep Plug commands between plug#begin() and plug#end().
" my
" Plug 'arcticicestudio/nord-vim'   " Nord theme
Plug 'dracula/vim'

Plug 'zivyangll/git-blame.vim'
" Plug 'kamykn/spelunker.vim'
Plug 'editorconfig/editorconfig-vim'
Plug 'tpope/vim-commentary'

" end of my

Plug 'airblade/vim-gitgutter'     " Show git diff of lines edited
" Plug 'tpope/vim-fugitive'         " :Gblame
Plug 'tpope/vim-rhubarb'          " :GBrowse

Plug 'tpope/vim-endwise'          " Autocomplete end after a do
Plug 'mileszs/ack.vim'            " Use ack in Vim

Plug 'pangloss/vim-javascript'    " JavaScript support
Plug 'leafgarland/typescript-vim' " TypeScript syntax
Plug 'maxmellon/vim-jsx-pretty'   " JS and JSX syntax
Plug 'jparise/vim-graphql'        " GraphQL syntax
Plug 'styled-components/vim-styled-components'

Plug 'vim-airline/vim-airline'    " Vim powerline

Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'           " Set up fzf and fzf.vim

Plug 'neoclide/coc.nvim', { 'branch': 'release' }

" All of your Plugins must be added before the following line
call plug#end()              " required


filetype plugin indent on    " required

" Leader key is COMMA
let mapleader = ","


let g:dracula_italic = 0
syntax enable
colorscheme dracula


" set background=dark
set wildmenu " when opening a file with e.g. :e ~/.vim<TAB> there is a graphical menu of all the matches
set ttyfast
set lazyredraw
set updatetime=300

set hidden " Open other files if current one is not saved

" Enable Mouse mode in all modes
" set mouse=a

" Numbers
set number
set numberwidth=4
set ruler

" paste mode
noremap <F5> :set invpaste paste?<CR>
set pastetoggle=<F5>
set showmode

set pastetoggle=<F5>
set showmode
" Treat long lines as break lines
map j gj
map k gk

" Indentation
set autoindent
set cindent
set smartindent

" Folding
" Enable folding
set foldmethod=syntax
set foldlevel=99

" Enable folding with the z key
" nmap z za

" Disable all bells and whistles
set noerrorbells visualbell t_vb=

" Ack tricks
let g:ackprg = 'ag --vimgrep'
nmap <leader>a :Ack! ""<Left>
nmap <leader>A :Ack! "\b<cword>\b"<CR>

" Tab Options
set shiftwidth=2
set tabstop=2
set softtabstop=2 " Number of spaces a tab counts when editing
set expandtab

" Delete empty space from the end of lines on every save
autocmd BufWritePre * :%s/\s\+$//e

" Set default encoding to utf-8
set encoding=utf-8
set termencoding=utf-8

" Disable backups and swap files
set nobackup
set nowritebackup
set noswapfile

set ignorecase " Ignore case case searching
set smartcase  " When searching try to be smart about cases
" set nohlsearch " Don't highlight search term
set incsearch  " Jumping search

" Always show the status line
set laststatus=2

" Allow copy and paste from system clipboard
" set clipboard=

" Spellcheck for features and markdown
au BufRead,BufNewFile *.md setlocal spell
au BufRead,BufNewFile *.md.erb setlocal spell
au BufRead,BufNewFile *.feature setlocal spell

" Delete characters outside of insert area
set backspace=indent,eol,start

" If fzf installed using git
set rtp+=~/.fzf
" Map fzf search to CTRL P
nnoremap <C-p> :GFiles<Cr>


" TODO Easier movement between split windows CTRL + {h, j, k, l}
" nnoremap <c-h> <c-w>h
" nnoremap <c-j> <c-w>j
" nnoremap <c-k> <c-w>k
" nnoremap <c-l> <c-w>l

" CoC extensions
let g:coc_global_extensions = ['coc-solargraph', 'coc-tsserver', 'coc-json']

" Add CoC Prettier if prettier is installed
if isdirectory('./node_modules') && isdirectory('./node_modules/prettier')
  let g:coc_global_extensions += ['coc-prettier']
endif


" Add CoC ESLint if ESLint is installed
if isdirectory('./node_modules') && isdirectory('./node_modules/eslint')
  let g:coc_global_extensions += ['coc-eslint']
endif

nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" Remap keys for applying codeAction to the current buffer.
nmap <leader>ac  <Plug>(coc-codeaction)
" Apply AutoFix to problem on the current line.
nmap <leader>qf  <Plug>(coc-fix-current)

" Format
nmap <leader>f   :CocCommand prettier.formatFile<CR>

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

" Optionally reset the cursor on start:
" augroup myCmds
" au!
" autocmd VimEnter * silent !echo -ne "\e[2 q"
" augroup END

" Fix syntax highlight for Coc plugin floating errors
hi CocErrorFloat guifg=Magenta guibg=Magenta

" My configuration

function! RipgrepFzf(query, fullscreen)
  let command_fmt = 'rg --column --line-number --no-heading --color=always --smart-case -- %s || true'
  let initial_command = printf(command_fmt, shellescape(a:query))
  let reload_command = printf(command_fmt, '{q}')
  let spec = {'options': ['--phony', '--query', a:query, '--bind', 'change:reload:'.reload_command]}
  call fzf#vim#grep(initial_command, 1, fzf#vim#with_preview(spec), a:fullscreen)
endfunction

command! -nargs=* -bang RG call RipgrepFzf(<q-args>, <bang>0)


nnoremap <Leader>b :Buffers<CR>
nnoremap <Leader>h :History<CR>
nnoremap <Leader>t :BTags<CR>
nnoremap <Leader>T :Tags<CR>

nnoremap <C-s> :w<CR>
vnoremap <C-s> :w<CR>

inoremap jj <Esc>
nnoremap <Esc> :noh<CR>


" MOVING LINES
nnoremap <S-j> :m .+1<CR>==
nnoremap <S-k> :m .-2<CR>==
vnoremap <S-j> :m '>+1<CR>gv=gv
vnoremap <S-k> :m '<-2<CR>gv=gv
" MOVING SCREEN
nnoremap <C-j> <C-d><CR>
nnoremap <C-k> <C-u><CR>


nnoremap <C-u> :redo<CR>

nnoremap <C-h> :tabprevious<CR>
nnoremap <C-l> :tabnext<CR>

source ~/.vim/my/Kwbd.vim
nmap <C-W>! <Plug>Kwbd

vnoremap // y/\V<C-R>=escape(@",'/\')<CR><CR>
vnoremap <C-r> "hy:%s/<C-r>h//gc<left><left><left>

noremap <Leader>y "*y
noremap <Leader>d "*d
noremap <Leader>p "*p
noremap <Leader>P "*P

" prevent update buffer after past
vnoremap p "_dp"<CR>
vnoremap P "_dP"<CR>

set incsearch
" set cursorline
" hi CursorLine ctermfg=None ctermbg=None gui=underline cterm=underline
set hlsearch

nmap <Leader>n :let @/=expand("%:t") <Bar> execute 'Explore' expand("%:h") <Bar> normal n<CR>
nnoremap <leader>ev :vsp ~/.vimrc<CR>
nnoremap <silent><leader>r :source ~/.vimrc<CR>
nmap <Leader>m :Vex<CR>


" Toggle relative line numbers
nnoremap <leader>rn :set relativenumber!<cr>

noremap n nzz
nnoremap N Nzz

set ttimeoutlen=1

set cursorline
hi CursorLine ctermfg=None ctermbg=None gui=underline cterm=underline
hi Visual ctermfg=253 ctermbg=25 gui=underline cterm=underline
highlight Cursor guifg=white guibg=black
inoremap <C-j> <C-n>
inoremap <C-k> <C-p>

set isfname+=@-@ "o open files like import from "@redux"

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
autocmd BufNewFile *.tsx 0r ~/work/mydotfiles/skeletons/component.tsx

" autoReload if contend has been changed outside of the vim
au CursorHold,CursorHoldI * checktime
" end of my c

let b:coc_pairs_disabled = ["<"]

" Allow netrw to remove non-empty local directories
"
let g:netrw_rmdir_cmd='rm -r'
