" use same column for j/k motions
let g:EasyMotion_startofline = 1

" use uppercase target labels and type as a lower case
let g:EasyMotion_use_upper = 1

" use smart case
let g:EasyMotion_smartcase = 1

" prefer the home row
let g:EasyMotion_keys = 'AOEUIDHTN-,.PYFGCRL;QJKXBMWVZS'

" jump to first search result with `<enter>`
let g:EasyMotion_enter_jump_first = 1


" prefix
map [prefix]e <plug>(easymotion-prefix)

" vim-sneak
nmap S <plug>(easymotion-s2)

" Replace Vim default search
" TODO: doesn't work?
" map  / <Plug>(easymotion-sn)
" omap / <Plug>(easymotion-tn)
" map  n <Plug>(easymotion-next)
" map  N <Plug>(easymotion-prev)

" better long-distance travel
map <leader>l <plug>(easymotion-lineforward)
map <leader>j <plug>(easymotion-j)
map <leader>k <plug>(easymotion-k)
map <leader>h <plug>(easymotion-linebackward)
