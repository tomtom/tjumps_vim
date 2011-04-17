" @Author:      Tom Link (micathom AT gmail com?subject=[vim])
" @Website:     http://www.vim.org/account/profile.php?user_id=4037
" @GIT:         http://github.com/tomtom/
" @License:     GPL (see http://www.gnu.org/licenses/gpl.txt)
" @Created:     2011-04-17.
" @Last Change: 2011-04-17.
" @Revision:    19
" GetLatestVimScripts: 0 0 :AutoInstall: tjumps.vim
" A tlib-based frontend to :jumps

if &cp || !has('jumplist') || exists("loaded_tjumps")
    finish
endif
if !exists('g:loaded_tlib') || g:loaded_tlib < 41
    runtime plugin/02tlib.vim
    if !exists('g:loaded_tlib') || g:loaded_tlib < 41
        echoerr 'tlib >= 0.41 is required'
        finish
    endif
endif
let loaded_tjumps = 1

let s:save_cpo = &cpo
set cpo&vim


" :display: Tjumps[!] [FILTER_RX]
" Display the list of |:jumps| and let users select an item.
" Optionally filter the list by FILTER_RX.
" With an optional bang '!', reverse the filter.
command! -bang -nargs=? Tjumps call tjumps#Jumps(<q-args>, !empty("<bang>"))


let &cpo = s:save_cpo
unlet s:save_cpo
