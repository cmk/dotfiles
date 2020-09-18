" store swp files in a centralized location
set directory^=$HOME/.config/nvim/swap//

" shortcuts for moving between splits
map <C-j> <C-W>j
map <C-k> <C-W>k
map <C-h> <C-W>h
map <C-l> <C-W>l

set softtabstop=2
set tabstop=2
" when indenting with '>', use 2 spaces width
set shiftwidth=2
" On pressing tab, insert 2 spaces
set expandtab

" remove trailing whitespace
autocmd BufWritePre * :%s/\s\+$//e

""" Auto Installation

  " Install plugins
if empty(glob("~/.config/nvim/autoload/plug.vim"))
  silent !curl -fLo ~/.config/nvim/autoload/plug.vim --create-dirs
        \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  auto VimEnter * PlugInstall
endif

" Install fzf and rg
if !empty(glob("~/.fzf/bin/fzf"))
  if empty(glob("~/.fzf/bin/rg"))
    if system('uname')=~'Darwin'
      silent !curl -fLo /tmp/rg.tar.gz
            \ https://github.com/BurntSushi/ripgrep/releases/download/0.10.0/ripgrep-0.10.0-x86_64-apple-darwin.tar.gz
      silent !tar xzvf /tmp/rg.tar.gz --directory /tmp
      silent !cp /tmp/ripgrep-0.10.0-x86_64-apple-darwin/rg ~/.fzf/bin/rg
    else
      silent !curl -fLo /tmp/rg.tar.gz
            \ https://github.com/BurntSushi/ripgrep/releases/download/0.10.0/ripgrep-0.10.0-x86_64-unknown-linux-musl.tar.gz
      silent !tar xzvf /tmp/rg.tar.gz --directory /tmp
      silent !cp /tmp/ripgrep-0.10.0-x86_64-unknown-linux-musl/rg ~/.fzf/bin/rg
    endif
  endif
endif

" Search the word under the cursor using ripgrep
nnoremap <leader>rg viw"ry:Rg <C-r>r<CR>

" fzf config
nnoremap <C-p> :F<cr>
let g:fzf_action = {
  \ 'ctrl-t': 'tab split',
  \ 'ctrl-i': 'split',
  \ 'ctrl-s': 'vsplit' }
let g:fzf_layout = { 'down': '~20%' }

let g:rg_command = '
  \ rg --column --line-number --no-heading --fixed-strings --ignore-case --no-ignore --hidden --follow --color "always"
  \ -g "*.{tf,yml,yaml,vim,viml,tsx,ts,js,jsx,json,php,md,styl,pug,jade,html,config,py,cpp,c,go,hs,rb,conf,graphql,gql,sql}"
  \ -g "!{.config,.git,node_modules,vendor,yarn.lock,*.sty,*.bst,build,dist}/*" '

command! -bang -nargs=* F call fzf#vim#grep(g:rg_command . shellescape(<q-args>), 1, <bang>0)
command! -bang -nargs=* FU call fzf#vim#grep(g:rg_command . '-m1 ' . shellescape(<q-args>), 1, <bang>0)

" Create undo directory
if !isdirectory($HOME . "/.config/nvim/undodir")
  call mkdir($HOME . "/.config/nvim/undodir", "p")
endif

""" Appearance

" Syntax and lines
syntax on
set number relativenumber
set nowrap
set signcolumn=yes

" Indentation
set autoindent
set expandtab
set shiftwidth=2
set softtabstop=2

" Status
set laststatus=2
set statusline=%F
set wildmenu
set showcmd

""" Plugins

call plug#begin('~/.config/nvim/plugged')
filetype plugin indent on

" Features
Plug 'scrooloose/nerdtree'                                           " File tree browser
Plug 'Xuyuanp/nerdtree-git-plugin'                                   " Git for NerdTree
Plug 'jistr/vim-nerdtree-tabs'                                       " NerdTree independent of tabs
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }    " Install fzf for user
Plug 'junegunn/fzf.vim'                                              " Fzf vim plugin
Plug 'neoclide/coc.nvim', {'branch': 'release'}                      " Language server
Plug 'gillyb/stable-windows'                                         " Stable windows!
Plug 'puremourning/vimspector'                                       " Debugger

" Small utilities
Plug 'bag-man/copypath.vim'                                          " copy path of file
Plug 'can3p/incbool.vim'                                             " Toggle true/false
Plug 'kopischke/vim-fetch'                                           " Use line numbers in file paths
Plug 'matze/vim-move'                                                " Move lines up and down
Plug 'chilicuil/vim-sprunge'                                         " Paste selection to sprunge
Plug 'FooSoft/vim-argwrap'                                           " Wrap arguments to multi-lines
Plug 'szw/vim-g'                                                     " Google from Vim
Plug 'google/vim-searchindex'                                        " Number of search results
Plug 'sickill/vim-pasta'                                             " Paste format
Plug 'cohama/agit.vim'                                               " Git log
Plug 'kamykn/spelunker.vim'                                          " Clever spell check

" Languages
Plug 'ndmitchell/ghcid', { 'rtp': 'plugins/nvim' }
Plug 'neovimhaskell/haskell-vim'

" tpope
Plug 'tpope/vim-surround'                                            " Operate on surrounding
Plug 'tpope/vim-speeddating'                                         " Increment dates
Plug 'tpope/vim-repeat'                                              " Repeat plugins
Plug 'tpope/vim-commentary'                                          " Comment out blocks
Plug 'tpope/vim-fugitive'                                            " Git integration
Plug 'tpope/vim-abolish'                                             " Flexible search
Plug 'tpope/vim-jdaddy'                                              " JSON text object
Plug 'tpope/vim-rhubarb'                                             " Github browse

" Appearance
Plug 'mkitt/tabline.vim'                                             " Cleaner tabs
Plug 'chrisbra/Colorizer'                                            " Show hex codes as colours
Plug 'kien/rainbow_parentheses.vim'                                  " Colour matched brackets
Plug 'unblevable/quick-scope'                                        " Highlight jump characters
Plug 'drzel/vim-in-proportion'                                       " Maintain splits when windows gets resized
Plug 'breuckelen/vim-resize'                                         " Use Ctrl+arrows to resize splits

" Text objects
Plug 'wellle/targets.vim'                                            " Additional text objects
Plug 'michaeljsmith/vim-indent-object'                               " Indented text object
Plug 'kana/vim-textobj-user'                                         " Add additional text objects
Plug 'jceb/vim-textobj-uri'                                          " URL objects
Plug 'glts/vim-textobj-comment'                                      " Comment text objects
Plug 'kana/vim-textobj-function'                                     " Add function based text objects
Plug 'reedes/vim-textobj-sentence'                                   " Sentence object

call plug#end()
