" Define to 250ms in order to update faster the status of each lines.
" Defaults to 4s
set updatetime=250

" Uses the leader to not conflict with the deplacement mappings
" [Push|Stage|Undo] Hunk
nmap <Leader>ph <Plug>GitGutterPreviewHunk
nmap <Leader>sh <Plug>GitGutterStageHunk
nmap <Leader>uh <Plug>GitGutterUndoHunk

let g:gitgutter_diff_args = '-w'
