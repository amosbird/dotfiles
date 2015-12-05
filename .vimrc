if has('gui_running')
  call plug#begin('~/.vim/plugged')
  Plug 'a.vim'
  Plug 'L9'
  Plug 'FSwitch'
  Plug 'vim-auto-save'
  Plug 'visualrepeat'
  Plug 'MattesGroeger/vim-bookmarks'
  Plug 'mkitt/tabline.vim'
  Plug 'tommcdo/vim-exchange'
  Plug 'honza/vim-snippets'
  Plug 'helino/vim-json'
  Plug 'cespare/vim-toml'
  Plug 'SirVer/ultisnips'
  Plug 'octol/vim-cpp-enhanced-highlight'
  Plug 'YankRing.vim'
  Plug 'junegunn/vim-easy-align'
  Plug 'mileszs/ack.vim'
  "Plug 'Valloric/YouCompleteMe'
  Plug 'Valloric/ListToggle'
  Plug 'mbbill/undotree'
  Plug 'Raimondi/delimitMate'
  Plug 'b4winckler/vim-angry'
  Plug 'bkad/CamelCaseMotion'
  Plug 'michaeljsmith/vim-indent-object'
  Plug 'ctrlpvim/ctrlp.vim'
  Plug 'rust-lang/rust.vim'
  Plug 'FelikZ/ctrlp-py-matcher'
  Plug 'ntpeters/vim-better-whitespace'
  Plug 'scrooloose/nerdcommenter'
  Plug 'flazz/vim-colorschemes'
  Plug 'airblade/vim-rooter'
  Plug 'tpope/vim-fugitive'
  Plug 'tpope/vim-surround'
  Plug 'tpope/vim-repeat'
  Plug 'tpope/vim-sensible'
  Plug 'tpope/vim-unimpaired'
  Plug 'tpope/vim-rsi'
  Plug 'tpope/vim-eunuch'
  Plug 'tpope/vim-abolish'
  call plug#end()

  set nocompatible
  source $VIMRUNTIME/vimrc_example.vim
  source $VIMRUNTIME/mswin.vim
  behave mswin

  set tabstop=2 softtabstop=0 expandtab shiftwidth=2 smarttab
  nnoremap <silent> <CR> :noh<CR><CR>

  noremap <C-Tab> gt
  inoremap <C-Tab> <C-O>gt
  cnoremap <C-Tab> <C-C>gt
  onoremap <C-Tab> <C-C>gt
  noremap <C-S-Tab> gT
  inoremap <C-S-Tab> <C-O>gT
  cnoremap <C-S-Tab> <C-C>gT
  onoremap <C-S-Tab> <C-C>gT

  colorscheme solarized
  au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif
  set undofile                " Save undo's after file closes
  set undodir=~/.vim/undo " where to save undo histories
  set undolevels=1000         " How many undos
  set undoreload=10000        " number of lines to save for undo
  set nobackup
  set clipboard=unnamed
  set guifont=Consolas:h11:cANSI
  set guioptions-=T
  set guioptions-=l
  set guioptions-=L
  set guioptions-=r
  set guioptions-=R
  set guioptions-=m
  set guioptions-=M
  set iskeyword+=_,$,@,%,#
  set smartcase
  set autoread
  set encoding=utf-8  " The encoding displayed.
  set fileencoding=utf-8  " The encoding written to file.
  "set fencs=ucs-bom,utf-16le,utf-8,default,latin1
  set noeb vb t_vb=
  set guicursor+=a:blinkon0
  set wildignore+=*\\tmp\\*,*.swp,*.zip,*.exe  " Windows
  set wildignore+=*\\.git\\*,*\\.hg\\*,*\\.svn\\*  " Windows ('noshellslash')
  set wildignore+=*.png,*.jpg,*.gif

  """""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
  "                                rooter                                   "
  """""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

  let g:rooter_use_lcd = 1
  let g:rooter_change_directory_for_non_project_files = 1
  let g:rooter_silent_chdir = 1
  let g:rooter_patterns = [ '.git/', '.gitignore' ]




  """""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
  "                                 angry                                   "
  """""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

  let g:argumentobject_force_toplevel = 1

  """""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
  "                                 ctrlp                                   "
  """""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

  " Use Vim's cwd
  let g:ctrlp_working_path_mode = 0
  let g:ctrlp_match_window = 'bottom,order:btt,min:1,max:30'

  " Faster indexing of files; requires having ag (AKA the_silver_searcher)
  " installed.
  let g:ctrlp_user_command = 'ag -i --nocolor --nogroup --hidden --ignore .git -g "" %s'
  let g:ctrlp_match_func = { 'match': 'pymatcher#PyMatch' }
  let g:ctrlp_lazy_update = 350
  let g:ctrlp_max_files = 0
  "let ctrlp_clear_cache_on_exit = 0



  """""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
  "                       vim-cpp-enhanced-highlight                        "
  """""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

  let c_no_curly_error=1

  """""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
  "                                ack.vim                                  "
  """""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

  if executable('ag')
    let g:ackprg = "ag --nocolor --nogroup --column"
  elseif executable('ack-grep')
    let g:ackprg = "ack-grep --nocolor --nogroup --column"
  elseif executable('ack')
    let g:ackprg = "ack --nocolor --nogroup --column"
  endif

  """""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
  "                                UltiSnips                                "
  """""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

  let g:UltiSnipsExpandTrigger       = "<c-l>"
  let g:UltiSnipsJumpForwardTrigger  = "<c-j>"
  let g:UltiSnipsJumpBackwardTrigger = "<c-k>"
  let g:snips_author                 = 'Amos Bird'

  """""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
  "                                fswitch                                  "
  """""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

  " A "companion" file is a .cpp file to an .h file and vice versa

  " Opens the companion file in the current window
  nnoremap <Leader>sh :FSHere<cr>

  " Opens the companion file in the window to the left (window needs to exist)
  " This is actually a duplicate of the :FSLeft command which for some reason
  " doesn't work.
  nnoremap <Leader>sl :call FSwitch('%', 'wincmd l')<cr>

  " Same as above, only opens it in window to the right
  nnoremap <Leader>sr :call FSwitch('%', 'wincmd r')<cr>

  " Creates a new window on the left and opens the companion file in it
  nnoremap <Leader>sv :FSSplitLeft<cr>

  """""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
  "                                yankring                                 "
  """""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

  let g:yankring_history_dir = '~/.vim/yankring_history'
  " this is so that single char deletes don't end up in the yankring
  let g:yankring_min_element_length = 2
  let g:yankring_window_height = 14
  nnoremap <leader>r :YRShow<CR>

  " this makes Y yank from the cursor to the end of the line, which makes more
  " sense than the default of yanking the whole current line (we can use yy for
  " that)
  function! YRRunAfterMaps()
    nnoremap Y   :<C-U>YRYankCount 'y$'<CR>
  endfunction

  """""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
  "                              YouCompleteMe                              "
  """""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
  let g:ycm_error_symbol = 'X'
  let g:ycm_warning_symbol = '!'
  let g:ycm_confirm_extra_conf = 0
  let g:ycm_seed_identifiers_with_syntax = 1
  let g:ycm_autoclose_preview_window_after_completion = 1
  let g:ycm_min_num_identifier_candidate_chars = 4
  let g:ycm_complete_in_comments_and_strings = 1
  nnoremap <leader>y :YcmForceCompileAndDiagnostics<cr>
  nnoremap <leader>g :YcmCompleter GoTo<CR>
  nnoremap <leader>pd :YcmCompleter GoToDefinition<CR>
  nnoremap <leader>pc :YcmCompleter GoToDeclaration<CR>

  """""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
  "                                autosave                                 "
  """""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

  let g:auto_save = 1  " enable AutoSave on Vim startup
  let g:auto_save_in_insert_mode = 0  " do not save while in insert mode
  let g:auto_save_silent = 1

  """""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
  "                               alignment                                 "
  """""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

  " Start interactive EasyAlign in visual mode (e.g. vip<Enter>)
  vmap <Enter> <Plug>(EasyAlign)

  " Start interactive EasyAlign for a motion/text object (e.g. gaip)
  nmap ga <Plug>(EasyAlign)

  """""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
  "                               fugitive                                  "
  """""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

  autocmd User fugitive
        \ if fugitive#buffer().type() =~# '^\%(tree\|blob\)$' |
        \   nnoremap <buffer> .. :edit %:h<CR> |
        \ endif

  autocmd BufReadPost fugitive://* set bufhidden=delete
  set statusline=%<%f\ %h%m%r%{fugitive#statusline()}%=%-14.(%l,%c%V%)\ %P

  autocmd BufWritePre * StripWhitespace

  let g:delimitMate_expand_cr = 1
  let g:delimitMate_jump_expansion = 1

  set laststatus=2
"  set showtabline=2
  set guioptions-=e
  set backspace=indent,eol,start
  "nnoremap <F2> :!start "C:\Program Files\ConEmu\ConEmu64.exe" cmd -new_console:a<CR>
  nnoremap <F2> :!start cmd<CR>

  nnoremap <F5> :UndotreeToggle<cr>
  "let g:bookmark_sign = '>>'
  highlight clear SignColumn
endif
