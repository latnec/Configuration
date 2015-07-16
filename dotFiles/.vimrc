set nocompatible


"Personal settings

"Pathogen stuff
execute pathogen#infect()
filetype plugin indent on
syntax on

"Set the status line options. 
set laststatus=2
set statusline=%F%m%r%h%w\ [FORMAT=%{&ff}]\ [TYPE=%Y]\ [POS%l,%v][%p%%]\ %{strftime(\"%d/%m/%y\ -\ %H:%M\")}

"Set colorscheme and font options
syntax enable
let g:solarized_termcolors=256
colorscheme solarized
set background=dark
set guifont=Source\ Code\ Pro:h10.5

"set line no, buffer, search, highlight, autoindent and more
set nu
set hidden
set ignorecase
set incsearch
set smartcase
set showmatch
set autoindent
set ruler
"set vb
"set viminfo+=n$VIM/_viminfo
set noerrorbells
set showcmd
set mouse=a
set history=1000
set undolevels=1000

"Backup stuff for windows


set nobackup
set noswapfile


set noerrorbells visualbell t_vb=
if has('autocmd')
  autocmd GUIEnter * set visualbell t_vb=
endif
"jedi-vim stuff
let g:jedi#force_py_version = 2

"NerdTree stuff
map <F2> <ESC>:NERDTreeToggle<RETURN>
map <F4> <ESC>:NERDTree w:\<RETURN>

"Mapping to move lines
"press Alt-j to move up, or Alt-k to move down
nnoremap <A-j> :m .+1<CR>==
nnoremap <A-k> :m .-2<CR>==
inoremap <A-j> <Esc>:m .+1<CR>==gi
inoremap <A-k> <Esc>:m .-2<CR>==gi
vnoremap <A-j> :m '>+1<CR>gv=gv
vnoremap <A-k> :m '<-2<CR>gv=gv

" Do not display the end of the line
set nolist


"indentLine settings

let g:indentLine_enable=1
let g:indentLine_char='|'
let g:indentLine_color_gui = '#787875'
" :IndentLinesToggle -> to toggle on/off
map <F1> <ESC>::IndentLinesToggle<RETURN>

"Navigate splits 
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>

"And some useful commands

""Max out the height of the current split
"ctrl + w _
"Max out the width of the current split
"ctrl + w |
"Normalize all split sizes, which is very handy when resizing terminal
"ctrl + w =


"Some headers for python files
autocmd bufnewfile *.py so C:\Users\florin.neacsu\Vim\py_header.txt
"autocmd bufnewfile *.py exe "1," . 10 . "g/File Name :.*/s//File Name : " .expand("%")
autocmd bufnewfile *.py exe "1," . 10 . "g/Created on:.*/s//Created on: " .strftime("%b %d %Y")
autocmd Bufwritepre,filewritepre *.py execute "normal ma"
autocmd Bufwritepre,filewritepre *.py exe "1," . 10 . "g/Last modified:.*/s/Last modified:.*/Last modified: " .strftime("%b %d %Y, %X")
autocmd bufwritepost,filewritepost *.py execute "normal `a"
