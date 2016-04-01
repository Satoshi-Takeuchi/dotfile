set mouse=a
syntax on
colorscheme hybrid
set background=dark
set number
set smarttab
set expandtab
set virtualedit=block
set ignorecase
set smartcase
set incsearch
set nohlsearch
set wrapscan
set laststatus=2
set backspace=eol,indent,start
let g:python_highlight_all = 1

if &compatible
  set nocompatible               " Be iMproved
endif

" Required:
set runtimepath^=/Users/xyz/.vim/repos/github.com/Shougo/dein.vim

" Required:
call dein#begin(expand('/Users/xyz/.vim/'))

" Required:
call dein#add('Shougo/dein.vim')

" Add or remove your plugins here:

" " Complete, Checker
call dein#add('Shougo/neosnippet')
call dein#add('Shougo/neosnippet-snippets')
call dein#add('Shougo/neocomplete.vim')
call dein#add('davidhalter/jedi-vim')
call dein#add('SirVer/ultisnips')
call dein#add('andviro/flake8-vim')
call dein#add('scrooloose/syntastic')

" " Util
call dein#add('scrooloose/nerdtree')
call dein#add('itchyny/lightline.vim')
call dein#add('flazz/vim-colorschemes')
call dein#add('nathanaelkane/vim-indent-guides')
call dein#add('mattn/webapi-vim')
call dein#add('mizukmb/otenki.vim')
call dein#add('Shougo/unite.vim')
call dein#add('jmcantrell/vim-virtualenv')
call dein#add('Shougo/unite-outline')
call dein#add('kana/vim-smartinput')
call dein#add('kana/vim-operator-user')
call dein#add('kana/vim-textobj-user')

" " Lang
call dein#add('othree/html5.vim')
call dein#add('hail2u/vim-css3-syntax')
call dein#add('jelera/vim-javascript-syntax')
call dein#add('mattn/emmet-vim')

" You can specify revision/branch/tag.
call dein#add('Shougo/vimshell', { 'rev': '3787e5' })

" Required:
call dein#end()

" Required:
filetype plugin indent on

" If you want to install not installed plugins on startup.
"if dein#check_install()
"  call dein#install()
"endif

" Fucking ESC Key ...
set timeout timeoutlen=1000 ttimeoutlen=75


"------------------------------------
" neocomplete.vim
"------------------------------------
"Note: This option must set it in .vimrc(_vimrc).  NOT IN .gvimrc(_gvimrc)!
" Disable AutoComplPop.
let g:acp_enableAtStartup = 0
" Use neocomplete.
let g:neocomplete#enable_at_startup = 1
let g:neocomplete#enable_smart_case = 1
let g:neocomplete#enable_ignore_case = 1
let g:neocomplete#enable_auto_select = 1
let g:neocomplete#enable_enable_camel_case_completion = 0

" Set minimum syntax keyword length.
let g:neocomplete#sources#syntax#min_keyword_length = 3
let g:neocomplete#lock_buffer_name_pattern = '\*ku\*'

autocmd FileType python setlocal omnifunc=jedi#completions

let g:jedi#completions_enabled = 0
let g:jedi#auto_vim_configuration = 0

if !exists('g:neocomplete#force_omni_input_patterns')
  let g:neocomplete#force_omni_input_patterns = {}
endif

let g:neocomplete#force_omni_input_patterns.python = '\h\w*\|[^. \t]\.\w*'

" NeoSnippet setting
" Plugin key-mappings.
imap <C-k>     <Plug>(neosnippet_expand_or_jump)
smap <C-k>     <Plug>(neosnippet_expand_or_jump)
xmap <C-k>     <Plug>(neosnippet_expand_target)
" SuperTab like snippets behavior.
imap <expr><TAB> neosnippet#expandable_or_jumpable() ?
imap <expr><TAB> neosnippet#expandable_or_jumpable() ?
            \ "\<Plug>(neosnippet_expand_or_jump)"
            \: pumvisible() ? "\<C-n>" : "\<TAB>"
smap <expr><TAB> neosnippet#expandable_or_jumpable() ?
            \ "\<Plug>(neosnippet_expand_or_jump)"
            \: "\<TAB>"
" For snippet_complete marker.
if has('conceal')
    set conceallevel=2 concealcursor=i
endif

autocmd FileType python setlocal completeopt-=preview


" For Emmet
"
let g:user_emmet_leader_key='<c-t>'

