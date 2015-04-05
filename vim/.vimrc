set nocompatible
set background=dark

" Set the leader
let mapleader = ','

set backspace=indent,eol,start
syntax enable
let g:iswindows = 0
let g:islinux = 0

if has("gui_running")
    let g:isGUI = 1
else 
    let g:isGUI = 0
endif

if(has("win32") || has("win64") || has("win95") || has("win16"))
    let g:iswindows = 1
else
    let g:islinux = 1
endif

if g:isGUI
    " au GUIEnter * simalt ~x       
    winpos 100 10
    set lines=38 columns=120
    set guioptions-=m
    set guioptions-=T
    set guioptions-=r
    set guioptions-=L
	au GUIEnter * call libcallnr("vimtweak.dll", "SetAlpha", 234)
endif

" set the runtime path to include Vundle and initialize
if (g:iswindows && g:isGUI)
    source $VIMRUNTIME/delmenu.vim
    source $VIMRUNTIME/menu.vim
    language messages zh_CN.utf-8
    set lines=999 columns=999
    au GUIEnter * simalt ~x
    set guifont=Consolas:h12:cANSI
    set rtp+=~/vimfiles/bundle/Vundle.vim/
    let path='~/vimfiles/bundle'
else
    set rtp+=~/.vim/bundle/Vundle.vim
    let path='~/.vim/bundle'
endif

filetype off                  " required
call vundle#begin(path)

" ==============Plugins==============
Plugin 'gmarik/Vundle.vim'                                            " let Vundle manage Vundle, required

Plugin 'altercation/vim-colors-solarized'
"colorscheme solarized

Plugin 'ap/vim-css-color'

Plugin 'bling/vim-airline'

Plugin 'kien/ctrlp.vim'
let g:ctrlp_working_path_mode = 'ra'
let g:ctrlp_custom_ignore = {
  \ 'dir':  '\v[\/]\.(git|hg|svn)$',
  \ 'file': '\v\.(exe|so|dll)$',
  \ 'link': 'some_bad_symbolic_links',
  \ }

if g:iswindows
 set wildignore+=*/tmp/*,*.so,*.swp,*.zip,*.tar,*.tar.gz,*.tar.bz2,*.tar.bz
else
 set wildignore+=*\\tmp\\*,*.swp,*.zip,*.exe,*.bin
endif

Plugin 'mattn/emmet-vim'
let g:user_emmet_install_global = 0
autocmd FileType html,css,php EmmetInstall

Plugin 'scrooloose/nerdtree'
map    <F3>        :NERDTreeToggle<CR>
imap   <F3> <ESC>  :NERDTreeToggle<CR>
map    <C-F3>      \be

Plugin 'nathanaelkane/vim-indent-guides'
let g:indent_guides_enable_on_vim_startup = 1
let g:indent_guides_start_level = 2
let g:indent_guides_guide_size = 1

Plugin 'msanders/snipmate.vim'

Plugin 'jpo/vim-railscasts-theme'
colorscheme railscasts

Plugin 'tpope/vim-fugitive'

" ==============Plugins End==============

behave mswin
call vundle#end()            " required
filetype plugin indent on    " required
filetype plugin on

set smarttab
set smartindent
set encoding=utf-8
set fileencoding=utf-8
set fileencodings=utf-8,ucs-bom,gbk,cp936,latin-1
set fileformat=unix

" Easier split navigations
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>

nnoremap <space> @=((foldclosed(line('.')) < 0) ? 'zc' : 'zo')<CR>      " 用空格键来开关折叠

" 当文件在外部被修改，自动更新该文件
set autoread

" 常规模式下输入 cS 清除行尾空格
nmap cS :%s/\s\+$//g<CR>:noh<CR>

" 常规模式下输入 cM 清除行尾 ^M 符号
nmap cM :%s/\r$//g<CR>:noh<CR>

set ignorecase                                        "搜索模式里忽略大小写
set smartcase                                         "如果搜索模式包含大写字符，不使用 'ignorecase' 选项，只有在输入搜索模式并且打开 'ignorecase' 选项时才会使用

set number                                            "显示行号
set laststatus=2                                      "启用状态栏信息
set cmdheight=2                                       "设置命令行的高度为2，默认为1
set cursorline                                        "突出显示当前行
"set guifont=YaHei_Consolas_Hybrid:h10                 "设置字体:字号（字体名称空格用下划线代替）
set nowrap                                            "设置不自动换行
set shortmess=atI                                     "去掉欢迎界面
set writebackup                                       "保存文件前建立备份，保存成功后删除该备份
set nobackup
set noswapfile
set smarttab
set foldenable                                        "启用折叠
set foldmethod=manual 
set laststatus=2

autocmd FileType * set tabstop=2|set shiftwidth=2|set expandtab
autocmd FileType php set tabstop=4|set shiftwidth=4|set noexpandtab
autocmd FileType go set tabstop=4|set shiftwidth=4|set noexpandtab
