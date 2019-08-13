if 2 == exists(':AsyncRun') && 2 != exists(':Make')
  " Allow plugins to be compatible with the Async plugin
  command -bang -nargs=* -complete=file Make AsyncRun -program=make @ <args>
endif
