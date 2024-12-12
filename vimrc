
let mapleader=","

if has('termguicolors')
   set termguicolors
endif
set background=dark
colorscheme minimalist
syntax on
filetype plugin indent on

set nocompatible
set title
set mouse=a
set fileencoding=utf-8
set wildmenu
set wildmode=longest,full
set wildoptions=pum
set pumheight=10
set wildignore=*.png,*.jpg,*.jpeg,*.class
set showtabline=1
set laststatus=2
set showcmd
set showmode
set splitbelow splitright
set scrolloff=8
set sidescrolloff=8
set signcolumn=no
set hidden
set confirm
set guicursor=

set path+=**
set nobackup
set nowritebackup
set noswapfile
set undofile
set undodir=~/.vim/undodir

set ignorecase
set smartcase
set hlsearch
set incsearch

set tabstop=4
set shiftwidth=4
set softtabstop=-1
set expandtab

set nonumber
set textwidth=80
set autoindent
set smartindent
set nospell
set spelllang=pt_br,en
set nolist
set listchars=tab:›-,space:·,trail:⋯,eol:↲
set fillchars=vert:│,fold:\ ,eob:~,lastline:@
set complete+=kspell
set completeopt=menuone,longest,noinsert
set shortmess+=c

autocmd Filetype * setlocal formatoptions-=c formatoptions-=r formatoptions-=o

autocmd Filetype html setlocal tabstop=2 shiftwidth=2 expandtab

imap jj <esc>

nnoremap Q gq<cr>

nnoremap j gj
nnoremap k gk

nnoremap <f4> :term<cr>
tnoremap <f4> exit<cr>

nnoremap ]b :bn<cr>
nnoremap [b :bp<cr>
nnoremap <leader>c :bd<cr>

nnoremap <leader>t :tabnew<cr>
nnoremap ]t gt
nnoremap [t gT
nnoremap <leader>n :tabedit<space>

nnoremap <esc> <cmd>nohlsearch<cr>

nnoremap <leader>tn :set number!<cr>
nnoremap <leader>ts :set spell!<cr>
nnoremap <leader>tl :set list!<cr>

inoremap '' ''<left>
inoremap "" ""<left>
inoremap () ()<left>
inoremap <> <><left>
inoremap [] []<left>
inoremap {} {}<left>
inoremap {<cr> {<cr><cr>}<c-o>k<c-t>
inoremap ({ ({  })<c-o>2h
inoremap (( ((  ))<c-o>2h
inoremap [[ [[  ]]<c-o>2h

vnoremap " c""<esc>P
vnoremap ' c''<esc>P
vnoremap ( c()<esc>P
vnoremap [ c[]<esc>P
vnoremap { c{}<esc>P
vnoremap ` c``<esc>P

set omnifunc=syntaxcomplete#Complete

inoremap <expr> <Tab> TabComplete()
fun! TabComplete()
    if getline('.')[col('.') - 2] =~ '\K' || pumvisible()
        return "\<C-N>"
    else
        return "\<Tab>"
    endif
endfun

inoremap <expr> <CR> pumvisible() ? "\<C-Y>" : "\<CR>"
autocmd InsertCharPre * call AutoComplete()
fun! AutoComplete()
    if v:char =~ '\K'
                \ && getline('.')[col('.') - 4] !~ '\K'
                \ && getline('.')[col('.') - 3] =~ '\K'
                \ && getline('.')[col('.') - 2] =~ '\K' " last char
                \ && getline('.')[col('.') - 1] !~ '\K'

        call feedkeys("\<C-N>", 'n')
    end
endfun
