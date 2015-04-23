

" git clone http://github.com/gmarik/vundle.git ~/.vim/bundle/vundle
" BundleInstall

set nocompatible               " be iMproved
filetype off                   " required!

set rtp+=~/.vim/bundle/vundle/
call vundle#rc()

" let Vundle manage Vundle
" required!
Bundle 'gmarik/vundle'

" My Bundles here:

Bundle 'Align'
Bundle 'tpope/vim-rails'
Bundle 'msanders/snipmate.vim'
Bundle 'scrooloose/nerdtree'
Bundle 'kchmck/vim-coffee-script'
Bundle 'hallison/vim-markdown'
Bundle 'slim-template/vim-slim'
Bundle 'kien/ctrlp.vim'
Bundle 'scrooloose/syntastic'
Bundle 'othree/html5.vim'
Bundle 'junegunn/goyo.vim'

" Close backup
set nobackup
set nowritebackup

" Close bell
set vb t_vb=

set mouse=a

" Style
colorscheme desert
set number
syntax on
set incsearch
set wildmenu
filetype plugin indent on
set autoindent

" Display extra whitespace
" set list listchars=tab:»·,trail:·


" Tab
set tabstop=2
set shiftwidth=2
set expandtab
set smarttab

autocmd FileType make set noexpandtab tabstop=4 shiftwidth=4
autocmd FileType python set tabstop=4 shiftwidth=4

" Filetype
autocmd BufRead,BufNewFile *.json set filetype=json
autocmd BufRead,BufNewFile *.slim set filetype=slim
autocmd BufRead,BufNewFile *.html.erb set filetype=eruby.html

" Strip trailing whitespace
fun! StripTrailingWhitespace()
    " Don't strip on these filetypes
    if &ft =~ 'markdown'
        return
    endif
    %s/\s\+$//e
endfun

autocmd BufWritePre * call StripTrailingWhitespace()

" Navigator split window
nmap <Up> <c-w>k
nmap <Down> <c-w>j
nmap <Right> <c-w>l
nmap <Left> <c-w>h

" Ruby complete
let g:rubycomplete_buffer_loading = 1
let g:rubycomplete_classes_in_global = 1
let g:rubycomplete_rails = 1

" quicklist prev
nmap <F6> :cp<cr>
" quicklist next
nmap <F7> :cn<cr>
" Format all
nmap <F11> gg=G<C-o>

" syntastic
let g:syntastic_check_on_open = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_loc_list_height = 5
let g:syntastic_enable_highlighting = 0
let g:syntastic_mode_map = { 'passive_filetypes': ['scss', 'slim'] }

nmap <A-up> :lprev<cr>
nmap <A-down> :lnext<cr>
nmap <A-right> :ll<cr>

" Goyo
function! s:goyo_before()
    set nonumber
endfunction

function! s:goyo_after()
    set number
endfunction

let g:goyo_callbacks = [function('s:goyo_before'), function('s:goyo_after')]
nmap <leader>g :Goyo<cr>


set backspace=indent,eol,start
" set mapleader
let mapleader        = ";"
let g:mapleader      = ";"
let maplocalleader   = ";"
let g:maplocalleader = ";"

"fast saving
nnoremap <leader>tr :%s/\s\+$//g<CR><C-o>
nnoremap <leader>x  :xa!<cr>
nnoremap <leader>w  :w!<cr>
nnoremap <leader>su :w !sudo tee %>/dev/null <cr>
nnoremap <leader>q :qa!<cr>


map <F2> :NERDTreeToggle<CR>
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTreeType") &&b:NERDTreeType == "primary") | q | endif
"设置文件的代码形式
set encoding=utf-8
set termencoding=utf-8
set fileencoding=utf-8
set fileencodings=ucs-bom,utf-8,chinese,cp936
"vim的菜单乱码解决
source $VIMRUNTIME/delmenu.vim
source $VIMRUNTIME/menu.vim
"vim提示信息乱码的解决
language messages zh_CN.utf-8

"vertical split open new window on right
set splitright
set fillchars=diff:⣿,vert:│  "split and diff splitchar

" Change Working Directory to that of the current file
  cmap cwd lcd %:p:h
  cmap cd. lcd %:p:h
