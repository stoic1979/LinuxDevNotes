set nocompatible
source $VIMRUNTIME/vimrc_example.vim
source $VIMRUNTIME/mswin.vim
behave mswin

set diffexpr=MyDiff()
function MyDiff()
  let opt = '-a --binary '
  if &diffopt =~ 'icase' | let opt = opt . '-i ' | endif
  if &diffopt =~ 'iwhite' | let opt = opt . '-b ' | endif
  let arg1 = v:fname_in
  if arg1 =~ ' ' | let arg1 = '"' . arg1 . '"' | endif
  let arg2 = v:fname_new
  if arg2 =~ ' ' | let arg2 = '"' . arg2 . '"' | endif
  let arg3 = v:fname_out
  if arg3 =~ ' ' | let arg3 = '"' . arg3 . '"' | endif
  let eq = ''
  if $VIMRUNTIME =~ ' '
    if &sh =~ '\<cmd'
      let cmd = '""' . $VIMRUNTIME . '\diff"'
      let eq = '"'
    else
      let cmd = substitute($VIMRUNTIME, ' ', '" ', '') . '\diff"'
    endif
  else
    let cmd = $VIMRUNTIME . '\diff'
  endif
  silent execute '!' . cmd . ' ' . opt . arg1 . ' ' . arg2 . ' > ' . arg3 . eq
endfunction

syntax on
set tags=tags;/             " look for a tags file across all the oceans
set nocompatible	    " nowhere I want to be still has old school vi
set title		    " set the xterm title depending on the buffer
set ruler		    " display line number etc
set noswapfile		    " no ugly swapfile
"imap Tab <C-P>		    " great unless I actually want to type a tab!
set ts=8		    " \t is 8 cols
set sw=4		    " <</>> etc shift 4 cols
set sts=4		    " <BS> at ^ deletes 4 cols
"set expandtab		    " expand \t to spaces
set smarttab		    " use sw not ts at ^
set smartcase		    " ignore case in lowercase searches, \C circumvents
set nohlsearch		    " eye gouging searches; relief on the next line
map <C-n> :noh<CR>
set expandtab               " seems tabs are no longer my thing

"set list
"set listchars=tab:»·,trail:·

let mapleader=";"


if has("gui_running")
    set guiheadroom=0
    set guioptions-=m   " no ugly menus!
    set guioptions-=M   " don't even bother loading the menu
    set guioptions-=T   " no ugly toobar!
    set guioptions-=r   " no ugly right hand scrollbar!
    set guioptions-=R   " no ugly right hand scrollbar!
    set guioptions-=l   " no ugly left hand scrollbar!
    set guioptions-=L   " no ugly left hand scrollbar!
    set guioptions-=b   " no ugly bottom scrollbar!
    set guioptions+=c   " no ugly gui popups! (ugly text popups instead)
    set guioptions-=e   " no ugly gui tabs (ugly text tabs instead)
endif

colorscheme desert

map <leader>k :bn!<CR>
map <leader>j :bN!<CR>
map <leader>h :tabp<CR>
map <leader>l :tabn<CR>
map <leader>K :bdelete<CR>
map <C-K> :bdelete<CR>
"map <leader>K :selocal nobl<CR>:bun<CR>
map <leader>t :tabnew<CR>
map <leader>y "*y
map <leader>p "*p
map <leader>P "+gP


"mapping commands
map @ :tabnext<CR>
map ! :tabprev<CR>

"stop making files ending with ~ after extension
set nobackup
set nowritebackup
set noswapfile 
set noundofile 
