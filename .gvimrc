"启动gvim时窗口的大小
set lines=33 columns=120

colorscheme molokai

"隐藏滚动条
set guioptions-=L
set guioptions-=r

"F2 设置隐藏或者出现菜单
map <silent> <F2> :if &guioptions =~# 'T' <Bar>
        \set guioptions-=T <Bar>
        \set guioptions-=m <bar>
    \else <Bar>
        \set guioptions+=T <Bar>
        \set guioptions+=m <Bar>
    \endif<CR>

"字体大小 字体文件在fonts 目录
set guifont=Monaco\ 14
