execute pathogen#infect()
 
syntax on

set background=dark
let g:solarized_termcolors=256

filetype plugin indent on

"搜索不顯示高亮
set nohlsearch
""不要生成swap文件
set noswapfile
"缺省不产生备份文件
set nobackup



"通用快捷键配置

"写入 Ctrl+L,s
map <silent> <C-L>s <ESC>:update<CR>
imap <silent> <C-L>s <ESC>:update<CR>
"退出 Ctrl+L,q
map <silent> <C-L>q <ESC>:quit<CR>
imap <silent> <C-L>q <ESC>:quit<CR>

"CTRL+L,v 粘贴
inoremap <C-L>v <ESC>"+gP

"CTRL+L,c 复制
vnoremap <C-L>c "+y

"CTRL+L,x 剪切
vnoremap <C-L>x "+x

"jj --> ESC
imap jj <ESC>

"Tab 快捷键
"CTRL+L,t 新建tab
map <silent> <C-L>t <ESC>:tabe<CR>
"CTRL+L,j 上一个tab
map <silent> <C-L>j <ESC>:tabp<CR>
"Ctrl+L,k 下一个tab
map <silent> <C-L>k <ESC>:tabn<CR>

"插件配置

"NERDTree配置
"把 F8 映射到 切换NERDTree插件
map <F7> :NERDTreeToggle<CR>
nmap <F7> :NERDTreeToggle<CR>
"改变tree目录的同时改变工程的目录
let NERDTreeChDirMode=1

"vim-nerdtree-tabs配置
"
"在gui 和 vim console 自动open NERDTreeToggle
let g:nerdtree_tabs_open_on_console_startup=1
let g:nerdtree_tabs_open_on_gui_startup=1

"python-mode 插件配置
"运行python程序快捷键
let g:pymode_run_key = '<C-L>r'

"python 自动排版
"需要给python-format-PythonTidy-1.23.py 给可执行权限
au FileType python set formatprg=~/.vim/plugin/python-format-PythonTidy-1.23.py
noremap <C-L>f :update<CR>gggqG
inoremap <C-L>f <ESC>:update<CR>gggqG

"代码检查忽视的错误
"E123,E125 由于排版插件问题忽略
"W391 文件最后有空行警告
let g:pymode_lint_ignore = "E123,E125,W391,E128"
