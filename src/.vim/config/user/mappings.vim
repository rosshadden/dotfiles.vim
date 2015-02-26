" fix Y
map Y y$

" shift is for sucks? (avoids :W style typos, or so I'm told)
map ; :

" U => redo [:redo]
map U :redo<cr>

" write
" L-w => write [:write]
map <leader>w :write<cr>
" L-W => force save [:write!]
map <leader>W :write!<cr>

" save
" L-s => save [:update]
map <leader>s :update<cr>
" L-S => force save [:write]
map <leader>S :update!<cr>

" close
" L-c => quit [:quit]
map <leader>c :quit<cr>
" L-C => force quit [:quit!]
map <leader>C :quit!<cr>

" L-x => save and quit [:wq]
map <leader>x :wq<cr>
" L-X => force save and quit [:wq!]
map <leader>X :wq!<cr>

" L-r => reload file [:edit]
map <leader>r :edit<cr>
map <leader>R :edit!<cr>
" L-L-r => reload config [:Reload]
map [leader:1]r :Reload<cr>

" L-. => repeat last command
map <leader>. @:

" searching
	" toggle highlighted search
	nmap [leader:1]/ :nohlsearch<cr>
	nmap co/ :set hlsearch!<cr>
	" search for selected word
	vmap / "vy/<c-r>v
	vmap ? "vy?<c-r>v

" visual shifting (does not exit Visual mode)
vnoremap < <gv
vnoremap > >gv

" use Q for formatting, not Ex mode
map Q gq

" build
map <localleader><space> :Make<cr>:cc<cr>
map <localleader><localleader><space> :Make!<cr>:cc<cr>
