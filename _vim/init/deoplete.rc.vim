call deoplete#enable()

call deoplete#custom#var('file', 'enable_buffer_path', v:true)

" deoplete options
call deoplete#custom#option({
\ 'auto_complete_delay': 0,
\ 'camel_case': v:false,
\ 'ignore_case': v:false,
\ 'smart_case': v:true,
\ 'refresh_always': v:true,
\ 'max_list': 10000,
\})
