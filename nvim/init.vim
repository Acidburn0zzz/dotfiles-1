" Load plugins first
call plug#begin()

Plug 'fholgado/minibufexpl.vim'
Plug 'scrooloose/nerdcommenter'
Plug 'scrooloose/nerdtree'
Plug 'majutsushi/tagbar'
Plug 'ntpeters/vim-better-whitespace'
Plug 'airblade/vim-gitgutter'
Plug 'nathanaelkane/vim-indent-guides'
Plug 'tpope/vim-surround'
if executable('ctags')
    Plug 'xolox/vim-misc'
    Plug 'xolox/vim-easytags'
endif
Plug 'vim-scripts/auto-pairs-gentle'
Plug '907th/vim-auto-save'

" Colorschemes
Plug 'twerth/ir_black'
Plug 'NLKNguyen/papercolor-theme'
Plug 'alem0lars/vim-colorscheme-darcula'

call plug#end()

" Indent settings
set expandtab
set tabstop=4
set softtabstop=4
set shiftwidth=4
set autoindent
set smartindent

" Search settings
set ignorecase
set smartcase
set incsearch
" turn off search highlight
noremap <leader><space> :nohlsearch<CR>

" Other settings
set ruler
set number
set nowrap
set showcmd
set cursorline
set wildmenu
set modeline
set backspace=2
set pastetoggle=<F2>
set scrolloff=3
set backupdir=.
set colorcolumn=120

" Set to auto read when a file is changed from the outside
set autoread

" Whitespaces
set listchars=tab:>-,trail:~
set list

"Use persistent undo
set undodir=~/.vim/undo
set undofile
set undolevels=1000 "maximum number of changes that can be undone
set undoreload=10000 "maximum number lines to save for undo on a buffer reload

" Key remaps
noremap <Space> <PageDown>
nnoremap <tab> %
vnoremap <tab> %

noremap <up>     <nop>
noremap <down>   <nop>
noremap <left>   <nop>
noremap <right>  <nop>
inoremap <up>    <nop>
inoremap <down>  <nop>
inoremap <left>  <nop>
inoremap <right> <nop>

nnoremap <C-k> <C-w>k
nnoremap <C-j> <C-w>j
nnoremap <C-h> <C-w>h
nnoremap <C-l> <C-w>l

inoremap <C-k> <up>
inoremap <C-j> <down>
inoremap <C-h> <left>
inoremap <C-l> <right>

" Close current buffer but keep window
nmap <leader>d :bp<bar>sp<bar>bn<bar>bd<CR>

" JSON Tidy: Reformat JSON file
nmap <leader>jt :%!python -m json.tool<CR>

if has('nvim')
    " Send all/line to terminal
    nnoremap <leader>sa ggyG<C-w>wpi<CR><C-\><C-n><C-w>p``
    nnoremap <leader>sl yy<C-w>wpi<CR><C-\><C-n><C-w>p
    inoremap <leader>sa <ESC>ggyG<C-w>wpi<CR><C-\><C-n><C-w>p``a
    inoremap <leader>sl <ESC>yy<C-w>wpi<CR><C-\><C-n><C-w>pa

    " Send current selection to terminal
    vnoremap <leader>ss y<C-w>wpi<CR><C-\><C-n><C-w>p

    tnoremap <ESC><ESC> <C-\><C-n>
endif

" Syntaxes
syntax enable
au BufNewFile,BufRead *.bf set filetype=brainfuck
au BufNewFile,BufRead *.asm set filetype=nasm
au BufNewFile,BufRead *.sql set filetype=pgsql

" Color / Window size
if has("gui_running")
    set lines=48
    set columns=200
    set guifont=Source\ Code\ Pro\ Semi-Light\ 10
    colorscheme ir_dark
else
    if substitute(system('tput colors'), '\n', '', '') == "256"
        let $NVIM_TUI_ENABLE_TRUE_COLOR=1

        if &diff
            colorscheme ir_dark
        else
            colorscheme PaperColor
        endif

        set bg=dark
    else
        colorscheme desert
    endif
endif

" --- PLUGINS ---
" Tagbar
nmap <leader>l :TagbarToggle<CR>
imap <leader>l <ESC>:TagbarToggle<CR>a

" MiniBufExpl
let g:miniBufExplMapWindowNavVim = 1
let g:miniBufExplMapWindowNavArrows = 1
let g:miniBufExplMapCTabSwitchBufs = 1
let g:miniBufExplModSelTarget = 1
let g:miniBufExplForceSyntaxEnable = 1

" NERDTree
nnoremap <C-n> :NERDTreeToggle<CR>
nnoremap <leader>nn :NERDTreeToggle<CR>
nnoremap <leader>nc :NERDTreeCWD<CR>
nnoremap <leader>nf :NERDTreeFind<CR>

" vim-better-whitespace
nnoremap <leader>ws :StripWhitespace<CR>

" Indent Guide
let g:indent_guides_guide_size = 1
let g:indent_guides_start_level = 2
let g:indent_guides_enable_on_vim_startup = 1

" vim-easytag
let g:easytags_async = 1
let g:easytags_file = '~/.vim/gtags'
let g:easytags_by_filetype = '~/.vim/tags/'

" vim-auto-save
let g:auto_save = 1  " enable AutoSave on Vim startup
let g:auto_save_in_insert_mode = 0  " do not save while in insert mode
let g:auto_save_silent = 1  " do not display the auto-save notification
