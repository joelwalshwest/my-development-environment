require "FTerm".setup(
    {
        border = "double",
        dimensions = {
            height = 0.9,
            width = 0.9
        },
        cmd = "/bin/bash"
    }
)

vim.cmd(
    [[
  let g:floaterm_width = 0.95
  let g:floaterm_height = 0.95
  let g:floaterm_autoinsert = v:true
  nnoremap <leader>t :FloatermToggle<CR>
  nnoremap <leader>T :FloatermNew<CR>
  tnoremap <c-k> <C-\><C-n>:FloatermNext<CR>
  tnoremap <c-j> <C-\><C-n>:FloatermPrev<CR>
  tnoremap <c-x> <C-\><C-n>:FloatermKill<CR>
  tnoremap <Esc> <C-\><C-n>
  "tunmap <Space>t
]]
)
