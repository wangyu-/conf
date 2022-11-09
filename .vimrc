"install first: https://github.com/junegunn/vim-plug

call plug#begin('~/.vim/plugged')

Plug 'liuchengxu/space-vim-dark'
"Plug 'luochen1990/rainbow'
Plug 'kien/rainbow_parentheses.vim'

call plug#end()


if exists('+termguicolors')
  let &t_8f = "\<Esc>[38;2;%lu;%lu;%lum"
  let &t_8b = "\<Esc>[48;2;%lu;%lu;%lum"
  set termguicolors
endif
"t_8f t_8b的含义可以查看  :h xterm-true-color

color space-vim-dark

"//背景透明相关
"hi LineNr ctermbg=NONE guibg=NONE

let g:rbpt_colorpairs = [
    \ ['brown',       'RoyalBlue3'],
    \ ['Darkblue',    'SeaGreen3'],
    \ ['darkgray',    'DarkOrchid3'],
    \ ['darkgreen',   'firebrick3'],
    \ ['darkcyan',    'RoyalBlue3'],
    \ ['darkred',     'SeaGreen3'],
    \ ['darkmagenta', 'DarkOrchid3'],
    \ ['brown',       '#a8a8a8'],
    \ ['gray',        '#ff875f'],
    \ ['black',       '#00ff87'],
    \ ['darkmagenta', '#d75fd7'],
    \ ['Darkblue',    '#c4a000'],
    \ ['darkgreen',   '#00afff'],
    \ ['darkcyan',    '#87ff00'],
    \ ['darkred',     '#ff0087'],
    \ ['red',         '#ff8700'],
    \ ]

au VimEnter * RainbowParenthesesToggle
au Syntax * RainbowParenthesesLoadRound
au Syntax * RainbowParenthesesLoadSquare
au Syntax * RainbowParenthesesLoadBraces

set viminfo='20,<2000,s10,h  "这个1000设小了，跨文件复制会复制不全
set bs=indent,eol,start   "allow backspacing over everything in insert mode

"//save cursor location, new
" Put these in an autocmd group, so that you can revert them with:
" ":augroup vimStartup | au! | augroup END"
augroup vimStartup
  au!
  " When editing a file, always jump to the last known cursor position.
  " Don't do it when the position is invalid, when inside an event handler
  " (happens when dropping a file on gvim) and for a commit message (it's
  " likely a different one than last time).
  autocmd BufReadPost *
    \ if line("'\"") >= 1 && line("'\"") <= line("$") && &ft !~# 'commit'
    \ |   exe "normal! g`\""
    \ | endif

augroup END

"//save cursor position, disabled since they are causing other problems
"autocmd BufWinLeave *.* mkview
"autocmd BufWinEnter *.* silent loadview

"function TurnOffCaps()
"    let capsState = matchstr(system('xset -q'), '00: Caps Lock:\s\+\zs\(on\|off\)\ze')
"    if capsState == 'on'
"        silent! execute ':!xdotool key Caps_Lock'
"    endif
"endfunction

"au InsertLeave * call TurnOffCaps()

set ttimeout
set ttimeoutlen=3000

set hlsearch
set expandtab

autocmd Filetype c setlocal sw=4 ts=4 expandtab
