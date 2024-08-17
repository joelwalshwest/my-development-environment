vim.cmd(
    [[
  let g:floaterm_width = 0.95
  let g:floaterm_height = 0.95
  let g:floaterm_autoinsert = v:true
  let g:floaterm_shell = "/bin/bash"
  nnoremap <leader>t :FloatermToggle<CR>
  nnoremap <leader>T :FloatermNew<CR>
  tnoremap <c-k> <C-\><C-n>:FloatermNext<CR>
  tnoremap <c-j> <C-\><C-n>:FloatermPrev<CR>
  tnoremap <c-x> <C-\><C-n>:FloatermKill<CR>
  tnoremap <Esc> <C-\><C-n>
  "tunmap <Space>t
]]
)
