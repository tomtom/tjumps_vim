" @Author:      Tom Link (micathom AT gmail com?subject=[vim])
" @Website:     http://www.vim.org/account/profile.php?user_id=4037
" @GIT:         http://github.com/tomtom/
" @License:     GPL (see http://www.gnu.org/licenses/gpl.txt)
" @Created:     2011-04-17.
" @Last Change: 2011-04-17.
" @Revision:    11
" GetLatestVimScripts: 0 0 :AutoInstall: tjumps.vim
" A tlib-based frontend to :jumps

if &cp || !has('jumplist') || exists("loaded_tjumps")
    finish
endif
let loaded_tjumps = 1

let s:save_cpo = &cpo
set cpo&vim


command! -bang -nargs=? Tjumps call tjumps#Jumps(empty("<bang>") ? <q-args> : bufname('%'))


let &cpo = s:save_cpo
unlet s:save_cpo
