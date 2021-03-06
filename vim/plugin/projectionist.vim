if filereadable('src/App.js')
    " This looks like a React app.
    let g:projectionist_heuristics = {
     \  'src/App.js': {
     \    'src/components/*.js': {
     \      'type': 'component',
     \      'alternate': 'src/__tests__/components/{}.test.js',
     \    },
     \    'src/__tests__/components/*.test.js': {
     \      'type': 'test',
     \      'alternate': 'src/components/{}.js',
     \    },
     \    'src/styles/*.css': {
     \      'type': 'stylesheet',
     \      'alternate': 'src/components/{}.js',
     \    }
     \  }
     \}
    nnoremap <Leader>a  :A<CR>
    nnoremap <Leader>ec :Ecomponent<Space>
    nnoremap <Leader>es :Estylesheet<Space>
    nnoremap <Leader>et :Etest<Space>
endif
