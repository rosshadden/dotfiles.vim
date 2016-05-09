""""""""""""""""
" SETTINGS
""""""""""""""""

if IsLoaded('unite.vim')
	call unite#custom#profile('files', 'context', {
		\ 'candidate_icon': '>',
		\ 'start_insert': 1,
		\ 'unique': 1,
	\ })
endif

""""""""""""""""
" FUNCTIONS
""""""""""""""""

" TODO: accept filename arg, to select it in ranger
function! OpenRanger(dir)
	let l:currentPath = expand(a:dir)
	let l:tempFilePath = tempname()
	let l:cmd = 'ranger --choosefiles=' . shellescape(l:tempFilePath) . ' ' . l:currentPath

	if has('nvim')
		let l:rangerCallback = { 'name': 'ranger' , 'tempFilePath': l:tempFilePath }

		function! l:rangerCallback.on_exit(id, code)
			Bdelete!

			if filereadable(self.tempFilePath)
				for l:file in readfile(self.tempFilePath)
					exec 'edit ' . l:file
				endfor

				call delete(self.tempFilePath)
			endif
		endfunction

		enew

		call termopen(l:cmd, l:rangerCallback)

		startinsert
	else
		exec 'silent !' . l:cmd

		if filereadable(l:tempFilePath)
			for l:file in readfile(l:tempFilePath)
				exec 'edit ' . l:file
			endfor

			call delete(l:tempFilePath)
		endif

		redraw!
	endif
endfunction

""""""""""""""""
" MAPPINGS
""""""""""""""""

call MakePrefix('files', '<:prefix>f')
call MakePrefix('files', '<:files>f', 1)

" file manager
noremap <:files><space> :call OpenRanger('')<CR>
noremap <:files:1><space> :call OpenRanger('%:p:h')<CR>

" flat
nnoremap <:files>s :Unite -buffer-name=files directory file file/new directory/new<cr>
nnoremap <:files:1>s :UniteWithBufferDir -buffer-name=files directory file file/new directory/new<cr>

" recursive
let s:recSource = 'neovim'
if !has('nvim') | let s:recSource = 'async' | endif

exec 'nnoremap <:files>r :Unite -buffer-name=files -start-insert file_rec/' . s:recSource . ':!<cr>'
exec 'nnoremap <:files:1>r :UniteWithBufferDir -buffer-name=files -start-insert file_rec/' . s:recSource . ':!<cr>'

" git
nnoremap <:files>g :Unite              -buffer-name=files -start-insert file_rec/git:--cached:--others:--exclude-standard<cr>
nnoremap <:files:1>g :UniteWithBufferDir -buffer-name=files -start-insert file_rec/git:--cached:--others:--exclude-standard<cr>

" most recently used (mru) files
nnoremap <:files>m :Unite              -buffer-name=recent file_mru<cr>
nnoremap <:files:1>m :UniteWithBufferDir -buffer-name=recent file_mru<cr>
nnoremap <:files>M :Unite              -buffer-name=recent -silent -force-immediately file_mru<cr>
nnoremap <:files:1>M :UniteWithBufferDir -buffer-name=recent -silent -force-immediately file_mru<cr>
