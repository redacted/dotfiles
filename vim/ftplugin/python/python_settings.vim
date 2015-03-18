" Python filetype stuff

setlocal softtabstop=4
setlocal shiftwidth=4
setlocal tabstop=4
"setlocal tw=79
setlocal foldmethod=indent

if has("gui_running")
    highlight SpellBad term=underline gui=undercurl guisp=Orange
endif

" no trailing whitespace plz
highlight ExtraWhitespace ctermbg=red guibg=red
match ExtraWhitespace /\s\+$/

autocmd BufWrite *.py :call DeleteTrailingWS()
