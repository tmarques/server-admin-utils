" Vim color file
" Maintainer:   Yuheng Xie <elephant@linux.net.cn>
" Last Change:  2005 Apr 6

" This color scheme uses a black background.

" First remove all existing highlighting.
set background=dark
highlight clear
if exists("syntax_on")
    syntax reset
endif

let colors_name = "greens"

"hi Cursor                         
hi Normal      ctermfg=White       
"hi Visual

hi Comment     ctermfg=DarkGrey       
hi Constant    ctermfg=DarkGrey        
hi Special     ctermfg=DarkRed    
hi Identifier  ctermfg=Cyan      
hi Statement   ctermfg=Yellow 
hi PreProc     ctermfg=DarkGreen      
hi Type        ctermfg=DarkGreen      
hi Ignore      ctermfg=DarkGrey   

"hi FoldColumn                     
"hi Folded                         

hi DiffAdd                        guifg=White      guibg=DarkBlue
hi DiffDelete                     guifg=Black      guibg=LightCyan
hi DiffText                       guifg=White      guibg=DarkRed      gui=NONE
hi DiffChange                     guifg=Black      guibg=LightYellow
hi LineNr      ctermfg=Grey ctermbg=black
" vim: ts=2 sw=2

