function! s:DetectJS()
    if getline(1) =~# '^#!.*/bin/\(env\s\+\)\?node\>'
        setfiletype javascript
    endif
endfunction
autocmd BufNewFile,BufRead * call s:DetectJS()
" recognize .snippet files
if has("autocmd")
    autocmd BufNewFile,BufRead *.snippets setf snippets
endif
" This has to be called before ftplugins are loaded. Therefore
" it is here in ftdetect though it maybe shouldn't

" This is necessary to prevent errors when using vim as a pager.
if exists("vimpager")
    finish
endif

if has("autocmd") && &loadplugins
    augroup UltiSnipsFileType
        autocmd!
        autocmd FileType * call UltiSnips#FileTypeChanged()
    augroup END

    " restore 'filetypedetect' group declaration
    augroup filetypedetect
endif
