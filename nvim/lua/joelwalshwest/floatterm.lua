vim.cmd([[
  let g:floaterm_width = 0.95
  let g:floaterm_height = 0.95
  let g:floaterm_autoinsert = v:true
  nnoremap <leader>t :FloatermToggle<CR>
  nnoremap <leader>T :FloatermNew<CR>
  nnoremap <leader>; :FloatermNext<CR>
  nnoremap <leader>: :FloatermPrev<CR>
  tnoremap <Esc> <C-\><C-n>
]])
