" use custom snippets
let g:neosnippet#snippets_directory = '~/.vim/config/snippets'

" For snippet_complete marker.
if has('conceal')
	set conceallevel=2 concealcursor=i
endif

nmap <c-s> i<plug>(neosnippet_expand_or_jump)
imap <c-s> <plug>(neosnippet_expand_or_jump)
smap <c-s> <plug>(neosnippet_expand_or_jump)
xmap <c-s> <plug>(neosnippet_expand_target)

" jump with <tab> (but don't expand)
" imap <expr><tab> neosnippet#jumpable()
" 	\? "\<plug>(neosnippet_jump)"
" 	\: pumvisible()
" 		\? "\<c-n>"
" 		\: "\<tab>"
" smap <expr><tab> neosnippet#jumpable()
" 	\? "\<plug>(neosnippet_jump)"
" 	\: "\<tab>"
