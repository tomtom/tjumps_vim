" tjumps.vim
" @Author:      Tom Link (mailto:micathom AT gmail com?subject=[vim])
" @License:     GPL (see http://www.gnu.org/licenses/gpl.txt)
" @Created:     2011-04-17.
" @Last Change: 2011-04-17.
" @Revision:    46


if !exists('g:tjumps#params') "{{{2
    " :read: let g:tjumps#params = {...}
    let g:tjumps#params = {
                \ 'type': 's',
                \ 'query': 'Select jump',
                \ 'return_agent': 'tjumps#DoJump',
                \ }
endif


function! tjumps#Jumps(filter, ...) "{{{3
    let reverse_filter = a:0 >= 1 ? a:1 : 0
    redir => jumpss
    silent jumps
    redir END
    let jumps = split(jumpss, '\n')
    call remove(jumps, 0)
    if !empty(a:filter)
        let expr = reverse_filter ? 'strpart(v:val, 16) !~ a:filter' : 'strpart(v:val, 16) =~ a:filter'
        TLogVAR reverse_filter, expr
        call filter(jumps, expr)
        " let jumps = map(jumps, 'matchlist(v:val, ''^\s*\(\d\+\)\s+\(\d\+\)\s+\(\d\+\)\s+\(.*\)$'')')
    endif
    let d = copy(g:tjumps#params)
    let d.base = jumps
    call tlib#input#ListD(d)
endf


function! tjumps#DoJump(world, selected) "{{{3
    " TLogVAR a:selected
    if !empty(a:selected)
        call a:world.RestoreOrigin()
        let jump = a:selected[0]
        " TLogVAR jump
        let ml = matchlist(jump, '^\s*\(\d\+\)\s\+\(\d\+\)\s\+\(\d\+\)\s\+\(.*\)$')
        " TLogVAR ml
        exec 'norm! '. ml[1] ."\<c-o>"
    endif
endf

