let g:projectionist_heuristics = {
    \ 'composer.json&src/&tests/': {
        \ 'src/*.php': {
            \ 'type': 'src',
            \ 'skeleton': 'class',
            \ 'alternate': 'tests/{}Test.php',
        \ },
        \ 'tests/*Test.php': {
            \ 'type': 'test',
            \ 'skeleton': 'pucase',
            \ 'alternate': 'src/{}.php',
        \ },
    \ },
    \ 'app/config/config.yml': {
        \ 'app/config/*|src/**/Ressources/config/*': {
            \ 'type': 'config',
        \ },
        \ 'src/**/Command/*Command.php': {
            \ 'type': 'command',
            \ 'skeleton': 'sfcommand',
        \ },
        \ 'src/**/Controller/*Controller.php': {
            \ 'type': 'controller',
            \ 'skeleton': 'sfcontroller',
        \ },
        \ 'src/**/DataFixtures/*Fixtures.php': {
            \ 'type': 'fixture',
            \ 'skeleton': 'sffixture',
            \ 'alternate': 'src/{dirname|basename}/Entity/{basename}.php',
        \ },
        \ 'src/**/Entity/*.php': {
            \ 'type': 'entity',
            \ 'skeleton': 'sfentity',
            \ 'alternate': [
                \ 'src/{dirname|basename}/Repository/{basename}Repository.php',
                \ 'src/{dirname|basename}/Controller/{basename}Controller.php',
                \ 'src/{dirname|basename}/Form/{basename}Type.php',
            \ ],
        \ },
        \ 'src/**/Repository/*Repository.php': {
            \ 'type': 'repository',
            \ 'alternate': 'src/{dirname|basename}/Entity/{basename}.php',
            \ 'skeleton': 'sfrepository',
        \ },
        \ 'src/**/Event/*Event.php': {
            \ 'type': 'event',
            \ 'skeleton': 'sfevent',
        \ },
        \ 'src/**/EventSubscriber/*Subscriber.php': {
            \ 'type': 'subscriber',
            \ 'skeleton': 'sfsubscriber',
        \ },
        \ 'src/**/Exception/*Exception.php': {
            \ 'type': 'exception',
        \ },
        \ 'src/**/Form/*Type.php': {
            \ 'type': 'form',
            \ 'alternate': 'src/{dirname|basename}/Entity/{basename}.php',
            \ 'skeleton': 'sfform',
        \ },
        \ 'src/*.html.twig': {
            \ 'type': 'template',
            \ 'skeleton': 'sftemplate',
        \ },
        \ 'config/services.yml': {
            \ 'type': 'services',
        \ },
        \ 'src/*.css|src/*.scss': {
            \ 'type': 'css',
        \ },
        \ 'src/*.js': {
            \ 'type': 'js',
        \ },
        \ 'var/log/*.log': {
            \ 'type': 'log',
        \ },
    \ },
\ }

nnoremap <Leader>a :A<CR>
nnoremap <Leader>va :AV<CR>

" vim: ts=2 sw=2 et fdm=marker
