if exists(':Tabularize')
    " For assignments
    nmap <silent> ca= :Tabularize /\v^%(%([-.+<>!]?\=)@!.)+\zs[-.+]?\=/l1r1<CR>
    vmap <silent> ca= :Tabularize /\v^%(%([-.+<>!]?\=)@!.)+\zs[-.+]?\=/l1r1<CR>

    " For Doxygen tag @param type $var desc
    nmap <silent> caà :Tabularize /$\w*<CR>
    vmap <silent> caà :Tabularize /$\w*<CR>

    " For function params on a line
    " Ex. : $db->bind('name', $var, -1);
    "       $db->bind('anotherName', $anotherVar, -1);
    nmap <silent> ca, :Tabularize /,\zs/l0l1<CR>
    vmap <silent> ca, :Tabularize /,\zs/l0l1<CR>

    " For JSON syntax
    nmap <silent> ca: :Tabularize /^[^:]*:\zs/l0l1<CR>
    vmap <silent> ca: :Tabularize /^[^:]*:\zs/l0l1<CR>

    " For variables, ex.: multiple lines function definition
    nmap <silent> ca$ :Tabularize /\$/l1c0<CR>
    vmap <silent> ca$ :Tabularize /\$/l1c0<CR>
endif
