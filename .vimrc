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
"忽略文件
let NERDTreeIgnore=['\.pyc$']
"宽度
let g:NERDTreeWinSize=18

"vim-nerdtree-tabs配置
"
"在gui 和 vim console 自动open NERDTreeToggle
let g:nerdtree_tabs_open_on_console_startup=1
let g:nerdtree_tabs_open_on_gui_startup=1

"CtrlP配置
"搜索路径
let g:ctrlp_working_path_mode=0

"python-mode 插件配置
"运行python程序快捷键
let g:pymode_run_key = '<C-L>r'
"支持virtualenv
let g:pymode_virtualenv = 1

"python 自动排版
"需要给python-format-PythonTidy-1.23.py 给可执行权限
au FileType python set formatprg=~/.vim/plugin/python-format-PythonTidy-1.23.py
noremap <C-L>f :update<CR>gggqG
inoremap <C-L>f <ESC>:update<CR>gggqG

"代码检查忽视的错误
"E123,E125 由于排版插件问题忽略
"W391 文件最后有空行警告
"E501 单行文件字符个数限制
let g:pymode_lint_ignore = "E123,E125,W391,E128,E501"

"taglist配置
"F8 切换TtagList窗口
nnoremap <silent> <F8> :TlistToggle<CR>

"不同时显示多个文件的tag，只显示当前文件的
let Tlist_Show_One_File = 1
"如果 taglist 窗口是最后一个窗口，则退出 vim
let Tlist_Exit_OnlyWindow = 1
"在右侧窗口中显示 taglist 窗口
let Tlist_Use_Right_Window = 1
"启动vim后自动打开
let Tlist_Auto_Open=1
let Tlist_File_Fold_Auto_Close=1

"可以设置taglist窗口的高度和宽度 
"let Tlist_WinHeigh = ?
"let Tlist_WinWidth = ?

"设置taglist窗口横向显示
"let Tlist_Use_Horiz_Window=1

"supertab 设置
"tab 为 python补全
let g:SuperTabDefaultCompletionType="<C-X><C-O>" 
"let g:SuperTabDefaultCompletionType = "context"
