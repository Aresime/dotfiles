let mapleader = ","

if ! filereadable(system('echo -n "${XDG_CONFIG_HOME:-$HOME/.config}/nvim/autoload/plug.vim"'))
	echo "Downloading junegunn/vim-plug to manage plugins..."
	silent !mkdir -p ${XDG_CONFIG_HOME:-$HOME/.config}/nvim/autoload/
	silent !curl "https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim" > ${XDG_CONFIG_HOME:-$HOME/.config}/nvim/autoload/plug.vim
	autocmd VimEnter * PlugInstall
endif

" Plugins
call plug#begin(system('echo -n "${XDG_CONFIG_HOME:-$HOME/.config}/nvim/plugged"'))
Plug 'vimwiki/vimwiki'
Plug 'plasticboy/vim-markdown'
call plug#end()

" General options
" https://neovim.io/doc/user/options.html
set title " Make vim the owner of windowtitle
set linebreak " Line break not cutting of words
set t_ut=
"set laststatus=2 " Always set status line active
set encoding=utf-8 " Manually set UTF encoding
set number relativenumber " Relative numbers on sidebar
filetype plugin on " Enable plugin for different filetypes set wildmode=longest,list,full
set mouse=

" Spellchecker
set nospell " Enable spellchcker.  Enable with :set spell
set spelllang=en_us,en " Setting language
set spellsuggest=best,9 " At most show 9 suggestions

" Clipbaord options
set clipboard+=unnamed  " use the clipboards of vim and win
set paste               " Paste from a windows or from vim

" Ensure files are read as what I want - LukeSmith
	let g:vimwiki_ext2syntax = {'.Rmd': 'markdown', '.rmd': 'markdown','.md': 'markdown', '.markdown': 'markdown', '.mdown': 'markdown'}
" Wiki locations
	let g:vimwiki_list = [{'path': '$NEXTCLOUD/Notes', 'syntax': 'markdown', 'ext': '.md'},
	\ {'path': '$ONEDRIVE/Notes', 'syntax': 'markdown', 'ext': '.md'}]
	let g:vimwiki_markdown_link_ext = 1

" Save file as sudo on files that require root permission
	cabbrev w!! execute 'silent! write !sudo tee % >/dev/null' <bar> edit!

" Automatically deletes all trailing whitespace and newlines at end of file on save. & reset cursor position
 	autocmd BufWritePre * let currPos = getpos(".")
	autocmd BufWritePre * %s/\s\+$//e
	autocmd BufWritePre * %s/\n\+\%$//e
  	autocmd BufWritePre * cal cursor(currPos[1], currPos[2])
