return -- lazy.nvim
{
    "lervag/vimtex",
    lazy=false,
    init = function()
        -- config = function()
            vim.g.tex_flavor='latex'
            -- vim.g.vimtex_view_method='skim'

            -- vim.keymap.set('n', '<leader>ovv', '<cmd>VimtexView<cr>', {})
            -- vim.keymap.set('n', '<leader>ovc', '<cmd>VimtexCompile<cr>', {})

            vim.g.vimtex_compiler_latexmk = {
                options ={
                    -- '-pdf -interaction=nonstopmode -file-line-error -outdir=./out/ -shell-escape'
                }
            }

            vim.cmd([[

            " This is necessary for VimTeX to load properly. The "indent" is optional.
            " Note that most plugin managers will do this automatically.
            " filetype plugin indent on

            " This enables Vim's and neovim's syntax-related features. Without this, some
            " VimTeX features will not work (see ":help vimtex-requirements" for more
            " info).
            " syntax enable

            " Viewer options: One may configure the viewer either by specifying a built-in
            " viewer method:
            " let g:vimtex_view_method = 'skim'
            " let g:vimtex_view_method = 'zathura'

            " Or with a generic interface:
            " let g:vimtex_view_general_viewer = 'okular'
            " let g:vimtex_view_general_options = '--unique file:@pdf\#src:@line@tex'

            " VimTeX uses latexmk as the default compiler backend. If you use it, which is
            " strongly recommended, you probably don't need to configure anything. If you
            " want another compiler backend, you can change it as follows. The list of
            " supported backends and further explanation is provided in the documentation,
            " see ":help vimtex-compiler".
            " let g:vimtex_compiler_method = 'latexrun'
            " let g:vimtex_compiler_method = 'latex'

            " Most VimTeX mappings rely on localleader and this can be changed with the
            " following line. The default is usually fine and is the symbol "\".
            " let maplocalleader = ","
            let maplocalleader = " "
            " *g:vimtex_compiler_latexmk*
            " This dictionary allows customization of the |vimtex-compiler-latexmk|
            " compiler. The values set by the user will take precedence over the default
            " values.
            "
            " Default value: >vim
            let g:tex_flavor='latex' 
            let g:vimtex_view_method = 'zathura'
            let g:vimtex_view_general_viewer = 'zathura'
            let g:vimtex_view_enabled=1
            " let g:vimtex_view_method = 'skim' 
            " let g:vimtex_view_skim_sync = 1 
            " let g:vimtex_view_skim_activate = 1 
            let g:vimtex_view_zathura_sync = 1 
            let g:vimtex_view_zathura_activate = 1 
            let g:vimtex_doc_handlers = ['vimtex#doc#handlers#texdoc']
            let g:vimtex_doc_confirm_single = 0

            " let g:vimtex_log_ignore = ['Underfull','Overfull','specifier changed to','Token not allowed in a PDF string']
            let g:vimtex_log_ignore = ['*Underfull*']
            let g:vimtex_log_verbose = 1
            let g:vimtex_quickfix_enabled=1

                " \   '-pdf',
            let g:vimtex_compiler_latexmk = {
                \ 'callback' : 1,
                \ 'aux_dir' : 'out/',
                \ 'out_dir' : '.',
                \ 'continuous' : 1,
                \ 'executable' : 'latexmk',
                \ 'hooks' : [],
                \ 'options' : [      
                \   '-interaction=nonstopmode',
                \   '-file-line-error',
                \   '-shell-escape',
                \   '-synctex=1',
                \   '-verbose',
                \ ],
                \}


                ]])

            end,
        }
