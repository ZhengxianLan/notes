set nocompatible
filetype off

set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
Plugin 'gmarik/Vundle.vim'
Plugin 'tpope/vim-fugitive'
Plugin 'SirVer/ultisnips'
Plugin 'honza/vim-snippets'
Plugin 'tpope/vim-surround'
Plugin 'kien/ctrlp.vim'
Plugin 'scrooloose/nerdtree'
Plugin 'scrooloose/nerdcommenter'
Plugin 'endwise.vim'
Plugin 'elzr/vim-json'
Plugin 'tpope/vim-rails'
Plugin 'vim-ruby/vim-ruby'

Plugin 'godlygeek/tabular'
Plugin 'rking/ag.vim'
Plugin 'scrooloose/syntastic'
Plugin 'mattn/emmet-vim'
Plugin 'tpope/vim-eunuch'
Plugin 'easymotion/vim-easymotion'
Plugin 'Raimondi/delimitMate'

Plugin 'jaxbot/browserlink.vim'
Plugin 'nsf/gocode', {'rtp': 'vim/'}
call vundle#end()

filetype plugin indent on
filetype indent on

syntax on
colorscheme elflord

set t_Co=256
set nu
set mouse=a
set encoding=utf-8
set expandtab
set tabstop=2
set shiftwidth=2
set softtabstop=2
set smarttab
set smartcase
set incsearch
set ruler
set sm
set ai
set si
set cindent
set smartindent
set autoindent
set ignorecase



autocmd BufWritePre * :%s/\s\+$//e

autocmd BufNewFile,BufRead *.cap       nested setlocal filetype=ruby
autocmd BufNewFile,BufRead *.html.erb  nested setlocal filetype=eruby.html
autocmd BufNewFile,BufRead *.js.erb    nested setlocal filetype=eruby.javascript
autocmd BufNewFile,BufRead *.rb.erb    nested setlocal filetype=eruby.ruby
autocmd BufNewFile,BufRead *.sh.erb    nested setlocal filetype=eruby.sh
autocmd BufNewFile,BufRead *.yml.erb   nested setlocal filetype=eruby.yaml
autocmd BufNewFile,BufRead *.txt.erb   nested setlocal filetype=eruby.text
autocmd BufNewFile,BufRead *.md,*.markdown,*.mmd  nested setlocal filetype=markdown

set backspace=eol,start,indent

" "Yanks go on clipboard instead.
set clipboard=unnamed

" Set ultisnips triggers
let g:UltiSnipsExpandTrigger="<tab>"
let g:UltiSnipsJumpForwardTrigger="<tab>"
let g:UltiSnipsJumpBackwardTrigger="<s-tab>"


"--------------------------------------------------"
set wildmenu
" ag.vim
let g:ag_working_path_mode="r"
" refresh buffer
nnoremap <F4> :e!<CR>
inoremap <F4> <C-R>:e!<CR>

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
nnoremap <leader>q :q!<cr>
nnoremap <leader>= gg=G``

" tablarize
inoremap <silent> <Bar>   <Bar><Esc>:call <SID>align()<CR>a

function! s:align()
  let p = '^\s*|\s.*\s|\s*$'
  if exists(':Tabularize') && getline('.') =~# '^\s*|' && (getline(line('.')-1) =~# p || getline(line('.')+1) =~# p)
    let column = strlen(substitute(getline('.')[0:col('.')],'[^|]','','g'))
    let position = strlen(matchstr(getline('.')[0:col('.')],'.*|\s*\zs.*'))
    Tabularize/|/l1
    normal! 0
    call search(repeat('[^|]*|',column).'\s\{-\}'.repeat('.',position),'ce',line('.'))
  endif
endfunction

map <F2> :NERDTreeToggle<CR>

" Visual shifting (does not exit Visual mode)
vnoremap < <gv
vnoremap > >gv
map <C-e> <plug>NERDTreeTabsToggle<CR>
map <leader>f :NERDTreeFind<CR>

"选中一段文字并全文搜索这段文字
vnoremap  *  y/<C-R>=escape(@", '\\/.*$^~[]')<CR><CR>
vnoremap  #  y?<C-R>=escape(@", '\\/.*$^~[]')<CR><CR>

" see  http://stackoverflow.com/questions/676600/vim-search-and-replace-selected-text
vnoremap <C-r> "hy:%s/<C-r>h//g<left><left>

" substitute to lower case use \L,uppercase use \U , \u is capitalize
" & is a handy backreference that refers to the complete text of the match
":%s/.*/\L&/g

" refresh buffer
nnoremap <F4> :e!<CR>
inoremap <F4> <C-R>:e!<CR>

" Open new split panes to right and bottom, which feels more natural
set splitbelow
set splitright

" Always use vertical diffs
set diffopt+=vertical

" for emmit
let g:user_emmet_install_global = 0
let g:user_emmet_mode='iv'
autocmd FileType html,css,eruby EmmetInstall

" If you want :UltiSnipsEdit to split your window.
let g:UltiSnipsEditSplit="vertical"

set pastetoggle=<F3>
" save a file in a directory that does not yet exist
nmap <Leader>m :call mkdir(expand("%:p:h"), "p")<CR>


" Navigator for split window
nmap <c-k> <c-w>k
nmap <c-j> <c-w>j
nmap <c-l> <c-w>l
nmap <c-h> <c-w>h

" Just for browserlink.vim
au InsertLeave *.css :BLReloadCSS

"nnoremap <C-g> :!google-chrome http://localhost:8080/%:t<CR> " browser preview with ctrl-p
"nnoremap <C-f> :!firefox %<CR> " browser preview with ctrl-o
