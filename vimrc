
let mapleader=","

if has('termguicolors')
   set termguicolors
endif
set background=dark
" colorscheme everforest
colorscheme habamax
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
set showtabline=2
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
set clipboard+=unnamedplus

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
set completeopt=menuone,longest
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

nnoremap <C-p> :Files<CR>
nnoremap <Leader>b :Buffers<CR>
nnoremap <Leader>h :History<CR>

nnoremap <leader>e :NERDTreeToggle<CR>

nnoremap <leader>nu :set number!<cr>
nnoremap <leader>s :set spell!<cr>
nnoremap <leader>l :set list!<cr>

nnoremap <leader>v <c-v>

vnoremap <c-c> "*y :let @+=@*<cr>
nnoremap <c-v> "+P

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
