" Display fzf in a floating/popup window if possible.
if has('nvim-0.4') || has("patch-8.2.0191")
    let g:fzf_layout = { 'window': {
                \ 'width': 0.9,
                \ 'height': 0.7,
                \ 'highlight': 'fzfBorder',
                \ 'border': 'sharp' } }
else " Fallback to a split window
    let g:fzf_layout = { "window": "silent botright 16split enew" }
endif
" Disable the preview window.
let g:fzf_preview_window = ''

" Git log format.
let g:fzf_commits_log_options = '--graph --color=always
 \ --date=human --format="%C(#e3c78a)%h%C(#ff5454)%d%C(reset)
 \ - %C(#42cf89)(%ad)%C(reset) %s %C(#80a0ff){%an}%C(reset)"'

" Mappings
nnoremap <silent> <Space><Space> :Files<CR>
nnoremap <silent> <Space>.       :Files <C-r>=expand("%:h")<CR>/<CR>
nnoremap <silent> <Space>,       :Buffers<CR>
nnoremap <silent> <Space><BS>    :BDelete<CR>
nnoremap <silent> <Space>]       :Tags<CR>
nnoremap <silent> <Space>c       :BCommits<CR>
nnoremap <silent> <Space>g       :GFiles?<CR>
nnoremap <silent> <Space>s       :call FzfLoadUltiSnipsAndFuzzySearch()<CR>
nnoremap <silent> <Space>h       :Helptags<CR>
" Project-wide search for the supplied term.
noremap <Space>\ :Rg<Space>

if filereadable('config/routes.rb')
    " This looks like a Rails app.
    nnoremap <silent> <Space>ec :Files app/controllers<CR>
    nnoremap <silent> <Space>eh :Files app/helpers<CR>
    nnoremap <silent> <Space>em :Files app/models<CR>
    nnoremap <silent> <Space>es :Files app/assets/stylesheets<CR>
    nnoremap <silent> <Space>et :Files spec<CR>
    nnoremap <silent> <Space>ev :Files app/views<CR>
elseif filereadable('src/index.js')
    " This looks like a React app.
    nnoremap <silent> <Space>ec :Files src/components<CR>
    nnoremap <silent> <Space>es :Files src/styles<CR>
    nnoremap <silent> <Space>et :Files src/__tests__/components<CR>
endif

" UltiSnips is a slow plugin to load, hence, only load it on demand once fuzzy
" snippet searching has been selected.
"
function! FzfLoadUltiSnipsAndFuzzySearch()
    let l:curpos = getcurpos()
    execute plug#load('ultisnips')
    call cursor(l:curpos[1], l:curpos[2])
    :Snippets
    return ""
endfunction

" Return the source list of open buffers for the custom :BDelete command.
"
function! FzfListBuffers()
    redir => list
    silent ls
    redir END
    return split(list, "\n")
endfunction

" Change the :BCommits command to use the reverse layout.
command! -bar -bang BCommits
  \ call fzf#vim#buffer_commits({'options': '--reverse'}, <bang>0)

" Custom :BDelete command, similar to :Buffers, but will close the selected
" buffers.
command! BDelete call fzf#run(fzf#wrap({
  \  'source': FzfListBuffers(),
  \  'sink*': { lines -> execute('bwipeout '.join(map(lines, {_, line -> split(line)[0]}))) },
  \  'options': '--multi --prompt "BDelete> "'
  \}))
