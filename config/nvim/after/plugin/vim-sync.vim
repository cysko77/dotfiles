if exists('*SyncUploadFile')
  " To auto sync files on read/write operation
  autocmd BufWritePost * :call SyncUploadFile()
  "autocmd BufReadPre * :call SyncDownloadFile()
endif
