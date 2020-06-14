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
map <F9> :!clear && g++ % -Wall && echo Compiled Sucsessfuly && echo && echo "I--------------------------------------------------------------------------I" && echo && time ./a.out <CR>
map <F10> :!clear && ./a.out <CR>
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

" Usage:
" Add to .vimrc
" au BufRead,BufNewFile *.kt  set filetype=kotlin
" au BufRead,BufNewFile *.jet set filetype=kotlin
" au Syntax kotlin source ~/.vim/syntax/kotlin.vim

if version < 600
syntax clear
elseif exists("b:current_syntax")
finish
endif

syn keyword kotlinExternal     import package
syn keyword kotlinConditional  if then else
syn keyword kotlinRepeat       while for do
syn keyword kotlinType         type
syn keyword kotlinStatement    val var
syn keyword kotlinStatement    return
syn keyword kotlinBoolean      true false
syn keyword kotlinConstant     null
syn keyword kotlinTypedef      this super
syn keyword kotlinLangClass    Any Unit String Array Int Boolean Char Long Double Float Short Byte
syn keyword kotlinClassMod     abstract final enum open attribute
syn keyword kotlinScopeDecl    public private protected
syn keyword kotlinStorageClass abstract final open override
syn keyword kotlinExceptions   throw try catch finally
syn keyword kotlinTypedef      class trait object

syn match   kotlinNumber       "\<\(0[0-7]*\|0[xX]\x\+\|\d\+\)\=\>"
syn match   kotlinNumber       "\(\<\d\+\.\d*\|\.\d\+\)\([eE][-+]\=\d\+\)\=[fFdD]\="

syn region  kotlinString       start=+"+ end=+"+
syn region  kotlinString       start=+'+ end=+'+
syn region  kotlinString       start=+"""+ end=+"""+

syn match   kotlinFunction     "\s*\<fun\>"

syn region  kotlinComment      start="/\*" end="\*/"
syn match   kotlinLineComment  "//.*"

if !exists("did_kotlin_syntax_inits")
let did_kotlin_syntax_inits = 1    

hi link kotlinExternal     Include
hi link kotlinStatement    Statement
hi link kotlinConditional  Conditional
hi link kotlinRepeat       Repeat
hi link kotlinType         Type
hi link kotlinTypedef      Typedef
hi link kotlinVardef       Typedef
hi link kotlinBoolean      Boolean
hi link kotlinFunction     Function
hi link kotlinLangClass    Constant
hi link kotlinConstant     Constant
hi link kotlinScopeDecl    kotlinStorageClass
hi link kotlinClassDecl    kotlinStorageClass
hi link kotlinClassMod     kotlinStorageClass
hi link kotlinStorageClass StorageClass
hi link kotlinExceptions   Exception
hi link kotlinOperator     Operator
hi link kotlinNumber       Number
hi link kotlinString       String
hi link kotlinComment      Comment
hi link kotlinLineComment  Comment
endif

let b:current_syntax = "kotlin"
" endif
map <C-p> :!clear && time g++ % <cr>
