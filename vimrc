set nocompatible              " be iMproved, required
"filetype off
filetype plugin on
filetype plugin indent on
set encoding=UTF-8


" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim

call vundle#begin()

Plugin 'gmarik/Vundle.vim'

"ASYNCHRONOUS LINT ENGINE
Plugin 'dense-analysis/ale'

Plugin 'ctrlpvim/ctrlp.vim'
Plugin 'scrooloose/nerdcommenter'
Plugin 'vim-airline/vim-airline'
Plugin 'easymotion/vim-easymotion'
Plugin 'prettier/vim-prettier'
"Plugin 'leafgarland/typescript-vim'
Plugin 'stanangeloff/php.vim'
Plugin 'roxma/vim-paste-easy'
Plugin 'ap/vim-css-color'

Plugin 'jiangmiao/auto-pairs'


"% matching for HTML and more
Plugin 'matchit.zip'
"auto close html tags
Plugin 'alvan/vim-closetag'

"themes
Plugin 'morhetz/gruvbox'
Plugin 'arcticicestudio/nord-vim'
Plugin 'vim-airline/vim-airline-themes'

"F7 tagbar
Plugin 'majutsushi/tagbar'
Plugin 'Perlence/tstags'

"F8 nerdtree
Plugin 'scrooloose/nerdtree'

"Plugin 'valloric/youcompleteme'
  

" Airline
let g:airline_theme='luna'
let g:airline_solarized_bg='dark'
let g:airline#extensions#tabline#enabled = 1 
let g:airline#extensions#tabline#show_splits = 1 
let g:airline#extensions#tabline#show_buffers = 1
let g:airline#extensions#tabline#tab_nr_type = 1
let g:airline#extensions#tabline#formatter = 'default'
let g:airline#extensions#tabline#switch_buffers_and_tabs = 1
let g:airline_powerline_fonts = 1

let g:airline#extensions#tabline#enabled = 1
"let g:airline#extensions#tabline#left_sep = ' '
"let g:airline#extensions#tabline#left_alt_sep = '|'

let g:closetag_filenames = '*.html,*.xhtml,*.phtml'
let g:closetag_xhtml_filenames = '*.xhtml,*.jsx'
let g:closetag_filetypes = 'html,xhtml,phtml'
let g:closetag_xhtml_filetypes = 'xhtml,jsx'


call vundle#end()
syntax on

set laststatus=2 " Always display the statusline in all windows
set showtabline=2 " Always display the tabline, even if there is only one tab
set noshowmode " Hide the default mode text (e.g. -- INSERT -- below the statusline)


" Nerdtree 
" autocmd vimenter * NERDTree
map <C-n> :NERDTreeToggle<CR>
" close NERDTree after a file is opened
let g:NERDTreeQuitOnOpen=1
let NERDTreeIgnore = ['__pycache__', '*.pyc', '.git', '.docker', '.github']
let NERDTreeShowHidden=1
" let g:nerdtree_tabs_open_on_console_startup=1

set undofile
set undodir=~/.vim/undo
set undolevels=1000
set undoreload=10000

"tern stuff
let g:tern_show_argument_hints='on_hold'
let g:tern_map_keys=1

set ts=2 sts=2 sw=2 expandtab
"set ts=2 sts=0 sw=2 noexpandtab
set number
nmap <leader>l :set list!<CR>

set ttyfast
set mouse=a
set ttymouse=xterm2
set term=screen-256color

let g:ctrlp_path_nolim = 1
set wildignore+=*/node_modules/*,*.so,*.swp


nnoremap <F7> :TagbarToggle<CR>
nnoremap <F8> :NERDTreeToggle<CR>
nnoremap <F12> :CtrlP .<CR>

vmap \ :!xclip -f -sel clip<CR>

set laststatus=2
set ttimeoutlen=50

set statusline+=%#warningmsg#
set statusline+=%*

"let g:ale_typescript_tsserver_use_global = 0
"let g:ale_completion_tsserver_autoimport = 1
"let g:ale_completion_enabled = 1
"let b:ale_fixers = {'javascript': ['prettier', 'eslint']}
"let g:ale_fixers = {
"\   '*': ['remove_trailing_lines', 'trim_whitespace'],
"\   'javascript': ['prittier', 'eslint'],
"\}






"let g:tagbar_type_typescript = {                                                  
"  \ 'ctagsbin' : 'tstags',                                                        
"  \ 'ctagsargs' : '-f-',                                                           
"  \ 'kinds': [                                                                     
"    \ 'e:enums:0:1',                                                               
"    \ 'f:function:0:1',                                                            
"    \ 't:typealias:0:1',                                                           
"    \ 'M:Module:0:1',                                                              
"    \ 'I:import:0:1',                                                              
"    \ 'i:interface:0:1',                                                           
"    \ 'C:class:0:1',                                                               
"    \ 'm:method:0:1',                                                              
"    \ 'p:property:0:1',                                                            
"    \ 'v:variable:0:1',                                                            
"    \ 'c:const:0:1',                                                              
"  \ ],                                                                            
"  \ 'sort' : 0                                                                    
"\ }   
"
"let g:tagbar_type_css = {
"\ 'ctagstype' : 'Css',
"    \ 'kinds'     : [
"        \ 'c:classes',
"        \ 's:selectors',
"        \ 'i:identities'
"    \ ]
"\ }
"
"let g:tagbar_type_json = {
"  \ 'ctagstype' : 'json',
"  \ 'kinds' : [
"    \ 'o:objects',
"    \ 'a:arrays',
"    \ 'n:numbers',
"    \ 's:strings',
"    \ 'b:booleans',
"    \ 'z:nulls'
"  \ ],
"\ 'sro' : '.',
"  \ 'scope2kind': {
"  \ 'object': 'o',
"    \ 'array': 'a',
"    \ 'number': 'n',
"    \ 'string': 's',
"    \ 'boolean': 'b',
"    \ 'null': 'z'
"  \ },
"  \ 'kind2scope': {
"  \ 'o': 'object',
"    \ 'a': 'array',
"    \ 'n': 'number',
"    \ 's': 'string',
"    \ 'b': 'boolean',
"    \ 'z': 'null'
"  \ },
"  \ 'sort' : 0
"\ }




autocmd QuickFixCmdPost [^l]* nested cwindow
autocmd QuickFixCmdPost    l* nested lwindow

map  / <Plug>(easymotion-sn)
omap / <Plug>(easymotion-tn)

set background=dark
set t_Co=256
let g:indent_guides_start_level = 2
let g:indent_guides_guide_size = 1
let g:indent_guides_enable_on_vim_startup = 1

set guitablabel=\[%N\]\ %t\ %M 

au BufRead,BufNewFile *.ts  setlocal filetype=typescript


"auto center
nmap G Gzz
nmap n nzz
nmap N Nzz
nmap } }zz
nmap { {zz

"fix typos
iabbr ture true
iabbr flase false

set swapfile
set dir=~/tmpvim

:command W w
:command Q q
:command Wq wq
:command WQ wq
:command Qa qa
:command WQa wqa
:command Wqa wqa
"


"let g:gruvbox_contrast_dark = 'hard'
"let g:gruvbox_number_column = 'bg1'
:colorscheme nord


