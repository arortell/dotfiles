if &shell =~# 'fish$'
  set shell=sh
endif

let g:dotvim_settings = { }
let g:dotvim_settings.version = 2
source ~/.vim/vimrc
