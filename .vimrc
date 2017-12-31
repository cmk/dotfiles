set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

Plugin 'gmarik/Vundle.vim'
" Plugin 'mlent/ale' -- Has a small change for multi-line ghc errors, see below
Plugin 'w0rp/ale'
Plugin 'vim-airline/vim-airline'
Plugin 'eagletmt/ghcmod-vim'
Plugin 'Shougo/vimproc'
Plugin 'notech/jellybeans.vim'
call vundle#end()

let g:airline#extensions#ale#enabled = 1

nnoremap <Leader>ht :GhcModType<cr>
nnoremap <Leader>htc :GhcModTypeClear<cr>
autocmd FileType haskell nnoremap <buffer> <leader>? :call ale#cursor#ShowCursorDetail()<cr>
