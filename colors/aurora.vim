" ----------------------------------------------------------------------------
" Info:
" ----------------------------------------------------------------------------

" File:       aurora.vim
" Version:    2.0.0
" Maintainer: Rafal Bromirski
" URL:        https://github.com/rafalbromirski/vim-aurora
" Modified:   Sun 3 May 2020 21:03:28 CEST
" License:    MIT

" ----------------------------------------------------------------------------
" Initial Setup:
" ----------------------------------------------------------------------------

if !has("gui_running") && &t_Co < 256
  finish
endif

highlight! clear
syntax reset

let g:colors_name = "aurora"
set background=dark

" ----------------------------------------------------------------------------
" Colors:
" ----------------------------------------------------------------------------
" resources:
" - https://maketintsandshades.com/

let s:black     = '#000000'
let s:white     = '#ffffff'

let s:grey_05 = '#0b0b14'
let s:grey_10 = '#1b1b24'
let s:grey_20 = '#262631'
let s:grey_30 = '#3a3a47'
let s:grey_40 = '#'
let s:grey_50 = '#69697c'
let s:grey_60 = '#'
let s:grey_70 = '#cfcfdd'
let s:grey_80 = '#'
let s:grey_90 = '#'

let s:red          = '#ff4040'
let s:orange       = '#ff9326'
let s:yellow       = '#ffcb65'
let s:green        = '#9ceb4f'
let s:aqua         = '#18ffe0'
let s:blue         = '#31baff'
let s:purple       = '#9d8cff'

let s:darkred      = "#661a1a"
let s:darkorange   = "#663b0f"
let s:darkyellow   = "#665128"
let s:darkgreen    = "#3e5e20"
let s:darkaqua     = "#0a665a"
let s:darkblue     = "#144a66"
let s:darkpurple   = "#3f3866"

let s:lightred     = "#ffb3b3"
let s:lightorange  = "#ffd4a8"
let s:lightyellow  = "#ffeac1"
let s:lightgreen   = "#d7f7b9"
let s:lightaqua    = "#a3fff3"
let s:lightblue    = "#ade3ff"
let s:lightpurple  = "#d8d1ff"

let s:none = "NONE"

" ----------------------------------------------------------------------------
" Formatters:
" ----------------------------------------------------------------------------

let s:none   = "NONE"
let s:underline = 'underline'
let s:undercurl = 'undercurl'
let s:bold = 'bold'
let s:inverse = 'inverse'
let s:reverse = 'reverse'

" ----------------------------------------------------------------------------
" Functions:
" ----------------------------------------------------------------------------

function! s:HL(group, fg, bg, attr)
  execute 'highlight! ' . a:group . ' ctermfg=NONE'
  execute 'highlight! ' . a:group . ' ctermbg=NONE'
  execute 'highlight! ' . a:group . ' cterm=NONE'

  if !empty(a:fg)
    execute 'highlight! ' . a:group . ' guifg=' . a:fg
  else
    execute 'highlight! ' . a:group . ' guifg=NONE'
  endif

  if !empty(a:bg)
    execute 'highlight! ' . a:group . ' guibg=' . a:bg
  else
    execute 'highlight! ' . a:group . ' guibg=NONE'
  endif

  if !empty(a:attr)
    execute 'highlight! ' . a:group . ' gui=' . a:attr
  else
    execute 'highlight! ' . a:group . ' gui=NONE'
  endif
endfunction

" ----------------------------------------------------------------------------
" Vim Highlighting: (see :help highlight-groups)"
" ----------------------------------------------------------------------------

call s:HL('Normal', s:grey_70, s:grey_10, s:none)

call s:HL('ColorColumn', s:none, s:grey_20, s:none)
" call s:HL('Conceal', ...)
" call s:HL('Cursor', ...)
" call s:HL('CursorIM', ...)

call s:HL('CursorColumn', s:none, s:grey_20, s:none)
call s:HL('CursorLine', s:none, s:grey_20, s:none)

call s:HL('Directory', s:purple, s:none, s:none)

call s:HL('DiffAdd', s:grey_10, s:green, s:none)
call s:HL('DiffChange', s:lightpurple, s:darkpurple, s:none)
call s:HL('DiffDelete', s:grey_10, s:red, s:none)
call s:HL('DiffText', s:grey_10, s:blue, s:none)

call s:HL('ErrorMsg', s:red, s:none, s:none)
call s:HL('VertSplit', s:grey_20, s:none, s:none)
call s:HL('Folded', s:grey_50, s:none, s:none)
call s:HL('FoldColumn', s:grey_50, s:none, s:none)
call s:HL('SignColumn', s:none, s:none, s:none)
" call s:HL('Incsearch', s:none, s:none, s:none)

call s:HL('LineNr', s:grey_30, s:none, s:none)
call s:HL('CursorLineNr', s:yellow, s:none, s:none)
call s:HL('MatchParen', s:grey_10, s:purple, s:none)
call s:HL('ModeMsg', s:green, s:none, s:none)
call s:HL('MoreMsg', s:green, s:none, s:none)
call s:HL('NonText', s:grey_30, s:none, s:none)

call s:HL('Pmenu', s:grey_70, s:grey_30, s:none)
call s:HL('PmenuSel', s:grey_10, s:purple, s:none)
" call s:HL('PmenuSbar', ...)
" call s:HL('PmenuSbar', ...)

call s:HL('Question', s:green, s:none, s:none)
call s:HL('Search', s:grey_10, s:yellow, s:none)
call s:HL('SpecialKey', s:grey_30, s:none, s:none)
call s:HL('SpellCap', s:blue, s:darkblue, s:underline)
call s:HL('SpellLocal', s:aqua, s:darkaqua, s:underline)
call s:HL('SpellBad', s:red, s:darkred, s:underline)
call s:HL('SpellRare', s:purple, s:darkpurple, s:underline)

call s:HL('StatusLine', s:grey_70, s:grey_05, s:none)
call s:HL('StatusLineNc', s:grey_30, s:grey_05, s:none)
call s:HL('StatusLineTerm', s:grey_05, s:purple, s:none)
call s:HL('StatusLineTermNc', s:grey_05, s:darkpurple, s:none)

call s:HL('TabLine', s:grey_50, s:grey_20, s:none)
call s:HL('TabLineFill', s:grey_20, s:grey_20, s:none)
call s:HL('TabLineSel', s:grey_70, s:grey_10, s:none)

call s:HL('Title', s:yellow, s:none, s:none)

call s:HL('Visual', s:none, s:grey_30, s:none)
" call s:HL('VisualNos', ...)

call s:HL('WarningMsg', s:red, s:none, s:none)
" call s:HL('LongLineWarning', ...)
call s:HL('WildMenu', s:grey_10, s:yellow, s:none)

" ----------------------------------------------------------------------------
" Generic Syntax: (see :help group-name)
" ----------------------------------------------------------------------------

call s:HL('Comment', s:grey_50, s:none, s:none)

call s:HL('Constant', s:red, s:none, s:none)
call s:HL('String', s:green, s:none, s:none)
"   Character"
"   Number"
"   Boolean"
"   Float"

call s:HL('Identifier', s:purple, s:none, s:none)
call s:HL('Function', s:yellow, s:none, s:none)
call s:HL('Statement', s:blue, s:none, s:none)
"   Conditional"
"   Repeat"
"   Label"
call s:HL('Operator', s:aqua, s:none, s:none)
"   Keyword"
"   Exception"

call s:HL('PreProc', s:aqua, s:none, s:none)
"   Include"
"   Define"
"   Macro"
"   PreCondit"

call s:HL('Type', s:orange, s:none, s:none)
"   StorageClass"
call s:HL('Structure', s:aqua, s:none, s:none)
"   Typedef"

call s:HL('Special', s:green, s:none, s:none)
"   SpecialChar"
"   Tag"
"   Delimiter"
"   SpecialComment"
"   Debug"

call s:HL('Underlined', s:blue, s:none, s:none)
call s:HL('Ignore', s:none, s:none, s:none)
call s:HL('Error', s:red, s:darkred, s:underline)
call s:HL('Todo', s:orange, s:darkorange, s:underline)

" Quickfix window highlighting
call s:HL('qfLineNr', s:yellow, s:none, s:none)
"   qfFileName"
"   qfLineNr"
"   qfError"

" ----------------------------------------------------------------------------
" GitGutter Syntax:
" ----------------------------------------------------------------------------

call s:HL('GitGutterAdd', s:green, s:none, s:none)
call s:HL('GitGutterDelete', s:red, s:none, s:none)
call s:HL('GitGutterChange', s:yellow, s:none, s:none)

" ----------------------------------------------------------------------------
" Terminal Syntax:
" ----------------------------------------------------------------------------

call s:HL('Terminal', s:grey_70, s:grey_05, s:none)

if exists('*term_setansicolors')
  " 0    black
  " 1    dark red
  " 2    dark green
  " 3    brown
  " 4    dark blue
  " 5    dark magenta
  " 6    dark cyan
  " 7    light grey
  " 8    dark grey
  " 9    red
  " 10   green
  " 11   yellow
  " 12   blue
  " 13   magenta
  " 14   cyan
  " 15   white

  let g:terminal_ansi_colors = [
        \ s:black,
        \ s:red,
        \ s:green,
        \ s:yellow,
        \ s:blue,
        \ s:purple,
        \ s:aqua,
        \ s:grey_70,
        \ s:grey_50,
        \ s:red,
        \ s:green,
        \ s:yellow,
        \ s:blue,
        \ s:purple,
        \ s:aqua,
        \ s:white,
        \ ]
endif

" ----------------------------------------------------------------------------
" License:
" ----------------------------------------------------------------------------

" Copyright (c) 2020 Rafal Bromirski
"
" Permission is hereby granted, free of charge, to any per‐
" son obtaining a copy of this software and associated doc‐
" umentation files (the “Software”), to deal in the Soft‐
" ware without restriction, including without limitation
" the rights to use, copy, modify, merge, publish, distrib‐
" ute, sublicense, and/or sell copies of the Software, and
" to permit persons to whom the Software is furnished to do
" so, subject to the following conditions:
"
" The above copyright notice and this permission notice
" shall be included in all copies or substantial portions
" of the Software.
"
" THE SOFTWARE IS PROVIDED “AS IS”, WITHOUT WARRANTY OF ANY
" KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO
" THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICU‐
" LAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
" AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM,
" DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CON‐
" TRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CON‐
" NECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
" THE SOFTWARE.
