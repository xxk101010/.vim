
"  __  __        __     _____ __  __ ____   ____
" |  \/  |_   _  \ \   / /_ _|  \/  |  _ \ / ___|
" | |\/| | | | |  \ \ / / | || |\/| | |_) | |
" | |  | | |_| |   \ V /  | || |  | |  _ <| |___
" |_|  |_|\__, |    \_/  |___|_|  |_|_| \_\\____|
"         |___/



" ====================
" === Editor Setup ===
" ====================

" ===
" === System
" ===
set nocompatible
filetype on
filetype indent on
filetype plugin on
filetype plugin indent on
set mouse=a
set encoding=utf-8
set clipboard=unnamed
"set clipboard=unnamedplus

" Prevent incorrect backgroung rendering
let &t_ut=''
let mapleader=" "


" ===
" === Main code display
" ===
" 显示行号
set number
"set relativenumber
set ruler
"开启高亮光标行
set cursorline
"开启高亮光标列
set cursorcolumn
" 代码高亮
syntax enable
syntax on


" ===
" === Editor behavior
" ===
" Better tab
set expandtab
set tabstop=4
set shiftwidth=4
set softtabstop=4

" 显示tab键
set list
" 现实tab符号
"set listchars=tab:▸\ ,trail:▫
set listchars=tab:▸\ 
set scrolloff=5

" Prevent auto line split
set wrap
set tw=0

set indentexpr= " Better backspace
set backspace=indent,eol,start

set foldmethod=indent
set foldlevel=99

let &t_SI = "\<Esc>]50;CursorShape=1\x7"
let &t_SR = "\<Esc>]50;CursorShape=2\x7"
let &t_EI = "\<Esc>]50;CursorShape=0\x7"

" ===
" === Window behaviors
" ===
set splitright
set splitbelow

" ===
" === Status/command bar
" ===
set laststatus=2
set autochdir
"set showcmd
set formatoptions-=tc

" Show command autocomplete
set wildignore=log/**,node_modules/**,target/**,tmp/**,*.rbc
set wildmenu                                                 " show a navigable menu for tab completion
set wildmode=longest,list,full

" Searching options
" 搜索时高亮显示被找到的文本
set hlsearch
exec "nohlsearch"
set incsearch
set ignorecase
set smartcase

" 自动缩进 智能缩进
set autoindent
set smartindent


" === " === Restore Cursor Position
" ===
au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif


" ===
" === Basic Mappings
" ===

" Set <LEADER> as <SPACE>
let mapleader=" "

" map key
map <LEADER>s :w<CR>
map <LEADER>q :q!<CR>
map <LEADER>r :source $MYVIMRC<CR>
map <LEADER>rc :vsp ~/.vimrc<CR>

noremap n  nzj
noremap N  Nzz
noremap <LEADER><CR> :nohlsearch<CR>

" ===
" === Cursor Movement
" ===
"     ^
"     j
" < h   l >
"     k
"     v
noremap  <C-h>  5h
noremap  <C-k>  5k
noremap  <C-j>  5j
noremap  <C-l>  5l

noremap <LEADER>l  <C-w>l
noremap <LEADER>k  <C-w>k
noremap <LEADER>h  <C-w>h
noremap <LEADER>j  <C-w>j


map <up> :res +5<CR>
map <down> :res -5<CR>
map <left> :vertical resize-5<CR>
map <right> :vertical resize+5<CR>

" Disabling the default s key
noremap s <nop>
noremap m <nop>

map sh :set splitright<CR>:vsplit<CR>
map sl :set nosplitright<CR>:vsplit<CR>
map sj :set nosplitbelow<CR>:split<CR>
map sk :set splitbelow<CR>:split<CR>

noremap t <nop>

map tu :tabe<CR>
map th :-tabnext<CR>
map tl :+tabnext<CR>

"map tb :vsp

" Place the two screens up and down
noremap sh <C-w>t<C-w>K
" Place the two screens side by side
noremap sv <C-w>t<C-w>H

" Rotate screens
noremap srh <C-w>b<C-w>K
noremap srv <C-w>b<C-w>H

noremap <leader>f :FixWhitespace<cr>
noremap <leader>t :Tabularize/
noremap <leader>a  ^
noremap <leader>e  $

inoremap ( ()<ESC>i
inoremap [ []<ESC>i
inoremap { {}<ESC>i


" Compile function
map md  :call CompileRunGcc()<CR>
func! CompileRunGcc()
  exec "w"
  if &filetype == 'c'
    exec "!g++ % -o %<"
    exec "!time ./%<"
  elseif &filetype == 'cpp'
    exec "!g++ % -o %<"
    exec "!time ./%<"
  elseif &filetype == 'java'
    exec "!javac %"
    exec "!time java %<"
  elseif &filetype == 'sh'
    :!time bash %
  elseif &filetype == 'python'
    silent! exec "!clear"
    exec "!time python3 %"
  elseif &filetype == 'html'
    exec "!firefox % &"
  elseif &filetype == 'markdown'
    exec "MarkdownPreview"
  elseif &filetype == 'vimwiki'
    exec "MarkdownPreview"
  endif
endfunc

" ===
" === Install Plugins with Vim-Plug
" ===
" vundle配置
"set rtp+=~/.vim/bundle/vundle.vim/

call plug#begin('~/.vim/plugged')

Plug 'vim-airline/vim-airline'
Plug 'NLKNguyen/papercolor-theme'
Plug 'tomasr/molokai'
Plug 'connorholyday/vim-snazzy'
Plug 'mileszs/ack.vim'
Plug 'dense-analysis/ale'
Plug 'neoclide/coc.nvim', {'branch': 'release'}

" File navigation
Plug 'scrooloose/nerdtree', { 'on': 'NERDTreeToggle' }
Plug 'Xuyuanp/nerdtree-git-plugin'
Plug 'ctrlpvim/ctrlp.vim', { 'on': 'CtrlP' }

"Plug 'Valloric/YouCompleteMe'
"Plug 'vim-scripts/taglist.vim'
Plug 'majutsushi/tagbar', { 'on': 'TagbarOpenAutoClose' }
"Plug 'vim-scripts/DoxygenToolkit.vim'
Plug 'tacahiroy/ctrlp-funky'
Plug 'vim-scripts/echofunc.vim'
"Plug 'rhysd/vim-clang-format'
Plug 'godlygeek/tabular'
Plug 'bronson/vim-trailing-whitespace'
Plug 'plasticboy/vim-markdown'
Plug 'Chiel92/vim-autoformat'
Plug 'suan/vim-instant-markdown'
" Markdown
Plug 'iamcco/markdown-preview.nvim', { 'do': { -> mkdp#util#install_sync() }, 'for' :['markdown', 'vim-plug'] }
Plug 'dhruvasagar/vim-table-mode', { 'on': 'TableModeToggle' }
Plug 'vimwiki/vimwiki'

" fzf plug
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'

call plug#end()


" ===
" === ale
" ===
"let b:ale_linters = ['pylint']
let g:ale_linters = {
\   'c++': ['clang'],
\   'c': ['clang'],
\   'python': ['pylint'],
\}
let b:ale_fixers = ['autopep8', 'yapf']

" 配色设置
colorscheme molokai
"color snazzy
"let g:SnazzyTransparent = 1

let NERDTreeShowHidden=1
" ===
" === Taglist
" ===
map ta :TagbarOpenAutoClose<CR>
map tt :NERDTreeToggle<CR>
map tf :NERDTreeRefreshRoot<CR>


" 函数自动提示
set tags+=~/.vim/systags
set tags+=./tags,tags;$HOME


" nerd tree
autocmd vimenter * NERDTree
" 让NERDTree 光标在右边
if argc()>0
wincmd w
autocmd VimEnter * wincmd w
endif

"
" clang format
"let g:clang_format#command = "/usr/bin/clang-format"
" clang-format -style=mozilla -dump-config > .clang-format
"map <F5> :ClangFormat<CR>
" ctags
map <LEADER>cg :!ctags -R --c-kinds=+p --fields=+iaS --extra=+q --language-force=C++ . <CR> <CR>


" ==
" == NERDTree-git
" ==
let g:NERDTreeIndicatorMapCustom = {
    \ "Modified"  : "✹",
    \ "Staged"    : "✚",
    \ "Untracked" : "✭",
    \ "Renamed"   : "➜",
    \ "Unmerged"  : "═",
    \ "Deleted"   : "✖",
    \ "Dirty"     : "✗",
    \ "Clean"     : "✔︎",
    \ 'Ignored'   : '☒',
    \ "Unknown"   : "?"
    \ }

" ===
" === MarkdownPreview
" ===
let g:mkdp_auto_start = 0
let g:mkdp_auto_close = 1
let g:mkdp_refresh_slow = 0
let g:mkdp_command_for_global = 0
let g:mkdp_open_to_the_world = 0
let g:mkdp_open_ip = ''
let g:mkdp_browser = ''
let g:mkdp_echo_preview_url = 0
let g:mkdp_browserfunc = ''
let g:mkdp_preview_options = {
    \ 'mkit': {},
    \ 'katex': {},
    \ 'uml': {},
    \ 'maid': {},
    \ 'disable_sync_scroll': 0,
    \ 'sync_scroll_type': 'middle',
    \ 'hide_yaml_meta': 1
    \ }
let g:mkdp_markdown_css = ''
let g:mkdp_highlight_css = ''
let g:mkdp_port = ''
let g:mkdp_page_title = '「${name}」'



" ===
" === coc
" ===
" Use tab for trigger completion with characters ahead and navigate.
" NOTE: Use command ':verbose imap <tab>' to make sure tab is not mapped by
" other plugin before putting this into your config.
inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunctio
