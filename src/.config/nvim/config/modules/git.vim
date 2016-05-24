""""""""""""""""
" MAPPINGS
""""""""""""""""

call MakePrefix('git', '<:prefix>g')
call MakePrefix('git', '<:git>g', 1)

nnoremap <:git><space> :Tig<cr>
nnoremap <:git:1><space> :Tig!<cr>

nnoremap <:git>r :GitFiles<cr>
nnoremap <:git>R :GitFiles?<cr>

nnoremap <:git>b :exec 'Tig blame -C ' . expand('%:f') . ' +' . line('.')<cr>

nnoremap <:git>l :exec 'Tig log ' . expand('%:f')<cr>
nnoremap <:git:1>l :Tig log<cr>
nnoremap <:git>L :exec 'Tig log ' . expand('%:h')<cr>
nnoremap <:git:1>L :Tig log<cr>

nnoremap <:git>s :exec 'Tig show ' . expand('%:f')<cr>
nnoremap <:git:1>s :Tig show<cr>
nnoremap <:git>S :exec 'Tig show ' . expand('%:h')<cr>
nnoremap <:git:1>S :Tig show<cr>

nnoremap <:git>y :Tig stash<cr>

nnoremap <:git:1>r :Tig refs<cr>

""""""""""""""""
" PLUGINS
""""""""""""""""

" vim-gitgutter

" don't map keys
let g:gitgutter_map_keys = 0

" go to next/prev changed hunk
nmap ]H <plug>GitGutterNextHunk
nmap [H <plug>GitGutterPrevHunk

" preview changed hunk
nmap <:prefix>Hp <plug>GitGutterPreviewHunk

" stage changed hunk
nmap <:prefix>Hs <plug>GitGutterStageHunk

" revert changed hunk
nmap <:prefix>Hr <plug>GitGutterRevertHunk
