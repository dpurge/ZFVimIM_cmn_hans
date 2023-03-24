let s:repoPath=expand('<sfile>:p:h:h')
function! s:dbInit()
    let repoPath = s:repoPath
    let dbFile = '/misc/cmn_hans.txt'
    let dbCountFile = '/misc/cmn_hans_count.txt'
	
	let g:ZFVimIM_symbolMap = {
        \   ' ' : [''],
        \   '`' : ['·'],
        \   '!' : ['！'],
        \   '$' : ['￥'],
        \   '^' : ['……'],
        \   '-' : [''],
        \   '_' : ['——'],
        \   '(' : ['（'],
        \   ')' : ['）'],
        \   '[' : ['【'],
        \   ']' : ['】'],
        \   '<' : ['《'],
        \   '>' : ['》'],
        \   '\' : ['、'],
        \   '/' : ['、'],
        \   ';' : ['；'],
        \   ':' : ['：'],
        \   ',' : ['，'],
        \   '.' : ['。'],
        \   '?' : ['？'],
        \   "'" : ['‘', '’'],
        \   '"' : ['“', '”'],
        \   '0' : [''],
        \   '1' : [''],
        \   '2' : [''],
        \   '3' : [''],
        \   '4' : [''],
        \   '5' : [''],
        \   '6' : [''],
        \   '7' : [''],
        \   '8' : [''],
        \   '9' : [''],
        \ }

    let db = ZFVimIM_dbInit({
                \   'name' : 'cmn_hans',
                \ })
    call ZFVimIM_cloudRegister({
                \   'mode' : 'git',
                \   'dbId' : db['dbId'],
                \   'repoPath' : repoPath,
                \   'dbFile' : dbFile,
                \   'dbCountFile' : dbCountFile,
                \   'gitUserEmail' : get(g:, 'ZFVimIM_cmn_hans_gitUserEmail', get(g:, 'zf_git_user_email', '')),
                \   'gitUserName' : get(g:, 'ZFVimIM_cmn_hans_gitUserName', get(g:, 'zf_git_user_name', '')),
                \   'gitUserToken' : get(g:, 'ZFVimIM_cmn_hans_gitUserToken', get(g:, 'zf_git_user_token', '')),
                \ })
endfunction

augroup ZFVimIM_cmn_hans_augroup
    autocmd!
    autocmd User ZFVimIM_event_OnDbInit call s:dbInit()
augroup END

