
"-----BASE----

set nocompatible
set nu
set backspace=indent,eol,start

" set mapleader
	let mapleader        = ";"
	let g:mapleader      = ";"
	let maplocalleader   = ";"
	let g:maplocalleader = ";"

"this can use man echo in a new window
"also <leader>k when cursor on keyword
	runtime! ftplugin/man.vim

"quick editing .vimrc
	nnoremap <leader>rc :vsplit ~/.vimrc<cr>
	nnoremap <leader>rt :vsplit ~/.tmux.conf<cr>
	nnoremap <leader>rz :vsplit ~/.zshrc<cr>

"fold mappings space to toggle fold
	nnoremap <space> za
	vnoremap <space> za

"format codes without changing screen
	nnoremap <leader>= mohmpgg=g`pzt`o

"increment completion (keep the options when typing)
set completeopt=longest,menuone

"vertical split open new window on right
	set splitright
	set fillchars=diff:⣿,vert:│  "split and diff splitchar
	set concealcursor=nc "hide concealed chars in n & c mode
	set synmaxcol=1000 "don't highlight line longer than 1000
" general
	filetype plugin indent on   " Automatically detect file types.
	syntax on                   " Syntax highlighting
	set mouse=a                 " Automatically enable mouse usage
	set mousehide               " Hide the mouse cursor while typing
	scriptencoding utf-8

    if has('clipboard')
        if has('unnamedplus')  " When possible use + register for copy-paste
            set clipboard=unnamed,unnamedplus
        else         " On mac and Windows, use * register for copy-paste
            set clipboard=unnamed
        endif
    endif

	set autowrite                       " Automatically write a file when leaving a modified buffer
    set shortmess+=filmnrxoOtT          " Abbrev. of messages (avoids 'hit enter')
    set viewoptions=folds,options,cursor,unix,slash " Better Unix / Windows compatibility
    set virtualedit=onemore             " Allow for cursor beyond last character
    set history=1000                    " Store a ton of history (default is 20)
    set hidden                          " Allow buffer switching without saving
    set iskeyword-=.                    " '.' is an end of word designator
    set iskeyword-=#                    " '#' is an end of word designator
    set iskeyword-=-                    " '-' is an end of word designator
    " Instead of reverting the cursor to the last position in the buffer, we
    " set it to the first line when editing a git commit message
    au FileType gitcommit au! BufEnter COMMIT_EDITMSG call setpos('.', [0, 1, 1, 0])

" Setting up the directories
	set undofile                " So is persistent undo ...
    set undolevels=1000         " Maximum number of changes that can be undone
    set undoreload=10000        " Maximum number lines to save for undo on a buffer reload

" VIM UI

    color desert
	set tabpagemax=15               " Only show 15 tabs
    set showmode                    " Display the current mode
    set cursorline                  " Highlight current line

    highlight clear SignColumn      " SignColumn should match background
    highlight clear LineNr          " Current line number row will have same background color in relative mode
    highlight clear CursorLineNr    " Remove highlight color from current line number

    set ruler                   " Show the ruler
    set rulerformat=%30(%=\:b%n%y%m%r%w\ %l,%c%V\ %P%) " A ruler on steroids
    set showcmd                 " Show partial commands in status line and
                                    " Selected characters/lines in visual mode

    set laststatus=2
    " Broken down into easily includeable segments
    set statusline=%<%f\                     " Filename
    set statusline+=%w%h%m%r                 " Options
    "set statusline+=%{fugitive#statusline()} " Git Hotness
    set statusline+=\ [%{&ff}/%Y]            " Filetype
    set statusline+=\ [%{getcwd()}]          " Current dir
    set statusline+=%=%-14.(%l,%c%V%)\ %p%%  " Right aligned file nav info

    set backspace=indent,eol,start  " Backspace for dummies
    set linespace=0                 " No extra spaces between rows
    set nu                          " Line numbers on
    set showmatch                   " Show matching brackets/parenthesis
    set incsearch                   " Find as you type search
    set hlsearch                    " Highlight search terms
    set winminheight=0              " Windows can be 0 line high
    set ignorecase                  " Case insensitive search
    set smartcase                   " Case sensitive when uc present
    set wildmenu                    " Show list instead of just completing
    set wildmode=list:longest,full  " Command <Tab> completion, list matches, then longest common part, then all.
    set whichwrap=b,s,h,l,<,>,[,]   " Backspace and cursor keys wrap too
    set scrolljump=5                " Lines to scroll when cursor leaves screen
    set scrolloff=3                 " Minimum lines to keep above and below cursor
    set foldenable                  " Auto fold code
    set listchars=tab:┊\ ,trail:•,extends:#,nbsp:. " Highlight problematic whitespace



" Formatting {

   "set nowrap                      " Do not wrap long lines
    set autoindent                  " Indent at the same level of the previous line
    set shiftwidth=4                " Use indents of 4 spaces
    set expandtab                   " Tabs are spaces, not tabs
    set tabstop=4                   " An indentation every four columns
    set softtabstop=4               " Let backspace delete indent
    set nojoinspaces                " Prevents inserting two spaces after punctuation on a join (J)
    set splitright                  " Puts new vsplit windows to the right of the current
    set splitbelow                  " Puts new split windows to the bottom of the current
    set matchpairs+=<:>             " Match, to be used with %
    set pastetoggle=<F12>           " pastetoggle (sane indentation on pastes)
    set comments=sl:/*,mb:*,elx:*/  " auto format comment blocks

    autocmd BufNewFile,BufRead *.html.twig set filetype=html.twig
    autocmd FileType haskell,puppet,ruby,yml setlocal expandtab shiftwidth=2 softtabstop=2
    autocmd BufNewFile,BufRead *.coffee set filetype=coffee

" Key (re)Mappings {
	map <C-J> <C-W>j<C-W>
    map <C-K> <C-W>k<C-W>
    map <C-L> <C-W>l<C-W>
    map <C-H> <C-W>h<C-W>
    " Wrapped lines goes down/up to next row, rather than next line in file.
    noremap j gj
    noremap k gk

    " The following two lines conflict with moving to top and
    " bottom of the screen
    map <S-H> gT
    map <S-L> gt

    " Yank from the cursor to the end of the line, to be consistent with C and D.
    nnoremap Y y$

    nmap <silent> <leader>/ :nohlsearch<CR>

     " Find merge conflict markers
    map <leader>fc /\v^[<\|=>]{7}( .*\|$)<CR>

    " Shortcuts
    " Change Working Directory to that of the current file
    cmap cwd lcd %:p:h
    cmap cd. lcd %:p:h

    " Visual shifting (does not exit Visual mode)
    vnoremap < <gv
    vnoremap > >gv

    " Allow using the repeat operator with a visual selection (!)
    " http://stackoverflow.com/a/8064607/127816
    vnoremap . :normal .<CR>

    " Some helpers to edit mode
    " http://vimcasts.org/e/14
    cnoremap %% <C-R>=expand('%:h').'/'<cr>
    map <leader>ew :e %%
    map <leader>es :sp %%
    map <leader>ev :vsp %%
    map <leader>et :tabe %%

    " Adjust viewports to the same size
    map <Leader>= <C-w>=

    " Map <Leader>ff to display all lines with keyword under cursor
    " and ask which one to jump to
    nmap <Leader>ff [I:let nr = input("Which one: ")<Bar>exe "normal " . nr ."[\t"<CR>

    " Easier horizontal scrolling
    map zl zL
    map zh zH

set noautochdir
" 设置标签子窗口的宽度

"fast saving
"设置删除行为空格的快捷键
nnoremap <leader>tr :%s/\s\+$//g<CR><C-o>
nnoremap <leader>x  :xa!<cr>
nnoremap <leader>w  :w!<cr>
nnoremap <leader>su :w !sudo tee %>/dev/null <cr>
nnoremap <leader>q :qa!<cr>

nnoremap <silent> <f3> :%s/\([^=+]\)=\([^=+]\)/\1 = \2/g<CR>

" 上下移动一行文字
nmap <C-Down> mz:m+<cr>`z
nmap <C-Up> mz:m-2<cr>`z
vmap <C-Down> :m'>+<cr>`<my`>mzgv`yo`z
vmap <C-Up> :m'<-2<cr>`>my`<mzgv`yo`z"

"日期
imap <f2> <cr>Date: <esc>:read !date<cr>kJ
nnoremap <f2> GoDate: <esc>:read !date<cr>kJo

" 隐藏不可见字符"
set nolist
set nospell
"reload current file
nnoremap <F5> :e!<cr>
nnoremap <Leader>p :silent set paste<cr>"+P:set nopaste<cr>

" auto format code
nnoremap <leader>fo gg=G
" indentLine"
let g:indentLine_color_term = 239
set nobackup
set nowritebackup
