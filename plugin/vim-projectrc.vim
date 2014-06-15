
function! GetGitDir()
  let cmd = 'git rev-parse --show-toplevel'
  let gitdir = substitute(system(cmd), '[\]\|[[:cntrl:]]', '', 'g')
  return empty(matchstr(gitdir, '^fatal:.*')) ? gitdir : ""
endfunction

let teamrc = GetGitDir() . '/.vimrc.team'
let localrc = GetGitDir() . '/.vimrc.local'

if filereadable(teamrc)
  exe 'source' teamrc 
endif

if filereadable(localrc)
  exe 'source' localrc 
endif
