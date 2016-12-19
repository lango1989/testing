"*******************************************************
"		common config
"*******************************************************
set nocompatible		"

set backspace=indent,eol,start	"设置退格键可用
set expandtab			"tab转换成空格键
set tabstop=4			"tab为4个空格距离
set shiftwidth=4		"自动对齐空格数
set smarttab			"退格键智能模式
set softtabstop=4		"退格键可以删除四个空格

set number		    	"显示行号
set autoindent			"自动缩进
set cindent			    "C语言缩进
syntax on			    "语法高亮
syntax enable			"语法高亮
set showcmd			    "显示未完成命令

set showmatch			"设置匹配模式
set ignorecase			"搜索是忽略大小写
set incsearch 			"键入就开始搜索
set hlsearch			"高亮显示所有匹配项

set backup			    "打开备份功能
set backupext=.backup	"备份文件后缀名为.backup
set patchmode=.orig		"保留一份原始文件

set foldenable			"允许折叠
"set fileencodings=ucs-bom,utf-8,b18030

inoremap jj <ESC>
inoremap ( ()<ESC>i
inoremap " ""<ESC>i
inoremap [ []<ESC>i
inoremap { {}<ESC>i
inoremap ;; <ESC>A;<ESC>
nnoremap ;; <ESC>A;<ESC>
inoremap ;l <right>

"*******************************************************
"		youcompleteme
"*******************************************************
let g:ycm_warning_symbol = '*>'
"let g:ycm_collect_identifiers_from_comments_and_strings = 1
"let g:ycm_collect_identifiers_from_tags_files = 1
"let g:ycm_complete_comments = 1


"*******************************************************
"       nerdtree
"*******************************************************
map <F2> :WMToggle<CR>


"*******************************************************
"       tagbar
"*******************************************************
map <F3> :TagbarToggle<CR>
let g:tagbar_ctags_bin = '/usr/bin/ctags'
"set g:tagbar_width=30

"*******************************************************
"       C/C++   build-run<F5>  lldb<F6>
"*******************************************************
map <F5> :call CompileRunClang()<CR>
func! CompileRunClang()
    exec "w"
    if &filetype == 'c'
        exec "!clang % -o %<"
        exec "!./%<"
    elseif &filetype == 'cpp'
        exec "!clang++ % -o %<"
        exec "!./%<"
    endif
endfunc
        

map <F6> :call Runlldb()<CR>
func! Runlldb()
    exec "w"
    if &filetype == 'c'
        exec "!clang % -g -o %<"
        exec "!lldb ./%<"
    elseif &filetype == 'cpp'
        exec "!clang++ % -g -o %<"
        exec "!lldb ./%<"
    endif
endfunc
