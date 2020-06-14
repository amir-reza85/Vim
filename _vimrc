" VIM Configuration File
" Description: Optimized for C/C++ development, but useful also for other things.
" Author: Gerhard Gappmeier
"

" set UTF-8 encoding
set enc=utf-8
set fenc=utf-8
set termencoding=utf-8
" disable vi compatibility (emulation of old bugs)
set nocompatible
" use indentation of previous line
set autoindent
" use intelligent indentation for C
set smartindent
" configure tabwidth and insert spaces instead of tabs
set tabstop=4        " tab width is 4 spaces
set shiftwidth=4     " indent also with 4 spaces
" wrap lines at 120 chars. 80 is somewaht antiquated with nowadays displays.
syntax on
" colorscheme wombat256
" turn line numbers on
set number
" highlight matching braces
set showmatch
" intelligent comments
set comments=sl:/*,mb:\ *,elx:\ */

" Install OmniCppComplete like described on http://vim.wikia.com/wiki/C++_code_completion
" This offers intelligent C++ completion when typing ‘.’ ‘->’ or <C-o>
" Load standard tag files
set tags+=~/.vim/tags/cpp
set tags+=~/.vim/tags/gl
set tags+=~/.vim/tags/sdl
set tags+=~/.vim/tags/qt4
map <F9> :!clear && g++ % -Wall && echo Compiled Sucsessfuly && echo && echo "I--------------------------------------------------------------------------I" && echo && ./a.exe <CR>
map <F10> :!clear && ./a.exe <CR>
map <C-x> :Texplore <CR>
map <C-RIGHT> :tabn <CR>
map <C-LEFT> :tabp <CR>
map <C-k> :tabp <CR>
map <C-l> :tabn <CR>
map <F3> :!clear && python3 % <CR>
map <C-h> :set number <CR>
map <C-j> :set nonumber <CR>
set undofile
map <F6> :!clear && kotlinc % -include-runtime -d a.jar && echo Compile Finish && echo && java -jar a.jar <cr>
map <F7> :!clear && java -jar a.jar <cr>
let ext = expand('%:e')
" if ext == "kt"
" Vim syntax file
" Language   : Kotlin (http://jetbrains.com/kotlin)
" Maintainers: Sergey Ignatov <sergey.ignatov@jetbrains.com>
" Last Change: 2011 December 26
map <C-p> :!clear && time g++ % <cr>
