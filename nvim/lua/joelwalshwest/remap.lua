vim.g.mapleader = " "
vim.keymap.set("n", "<Space>", "<Nop>", {noremap = true, silent = true})
vim.keymap.set("v", "<Space>", "<Nop>", {noremap = true, silent = true})

-- system clipboard
vim.keymap.set("v", "<leader>y", '"+y')

-- lazygit
vim.keymap.set("n", "<leader>H", ":LazyGit<CR>")

-- movement
vim.keymap.set("n", "H", "^")
vim.keymap.set("v", "H", "^")
vim.keymap.set("n", "L", "$")
vim.keymap.set("v", "L", "$")
vim.keymap.set("n", "{", "[mzz")
vim.keymap.set("n", "}", "]mzz")

-- searching
vim.keymap.set("n", "<leader>h", ":set hls!<CR>")
vim.keymap.set("c", "<c-j>", "<c-g>")
vim.keymap.set("c", "<c-k>", "<c-t>")
vim.keymap.set(
    "n",
    "*",
    function()
        local word = vim.fn.expand("<cword>")
        if word ~= "" then
            vim.opt.hlsearch = true
            vim.api.nvim_feedkeys("/" .. word, "n", false)
        end
    end,
    {desc = "Search for word under cursor"}
)

-- saving
vim.keymap.set("n", "<leader>w", ":w<CR>")
vim.keymap.set("n", "<leader>s", ":w<CR>")

-- tabs
vim.keymap.set("n", "st", ":tab split<CR>")
vim.keymap.set("n", "sp", "gT")
vim.keymap.set("n", "sn", "gt")

-- split management
vim.keymap.set("n", "sv", "<c-w>s<c-w>j")
vim.keymap.set("n", "ss", "<c-w>v<c-w>l")
vim.keymap.set("n", "sc", "<c-w>q")
vim.keymap.set("n", "sj", "<c-w>j")
vim.keymap.set("n", "sk", "<c-w>k")
vim.keymap.set("n", "sl", "<c-w>l")
vim.keymap.set("n", "sh", "<c-w>h")

vim.keymap.set("n", "sJ", "<c-w>J")
vim.keymap.set("n", "sK", "<c-w>K")
vim.keymap.set("n", "sL", "<c-w>L")
vim.keymap.set("n", "sH", "<c-w>H")

-- resizing
vim.keymap.set("n", "<c-w>", ":vertical resize +5<CR>")
vim.keymap.set("n", "<c-g>", ":vertical resize -5<CR>")
vim.keymap.set("n", "<c-b>", ":horizontal resize +5<CR>")
vim.keymap.set("n", "<c-m>", ":horizontal resize -5<CR>")

-- Function to switch to the next buffer without looping
local function next_buffer()
    local current_buf = vim.api.nvim_get_current_buf()
    local buffers = vim.api.nvim_list_bufs()
    local buffer_count = #buffers
    local next_buf = nil

    for i, buf in ipairs(buffers) do
        if buf == current_buf then
            if i < buffer_count then
                next_buf = buffers[i + 1]
            else
                vim.api.nvim_echo({{"Already at the last buffer", "WarningMsg"}}, true, {})
                return
            end
            break
        end
    end

    if next_buf then
        vim.api.nvim_set_current_buf(next_buf)
    end
end

-- Function to switch to the previous buffer without looping
local function prev_buffer()
    local current_buf = vim.api.nvim_get_current_buf()
    local buffers = vim.api.nvim_list_bufs()
    local buffer_count = #buffers
    local prev_buf = nil

    for i, buf in ipairs(buffers) do
        if buf == current_buf then
            if i > 1 then
                prev_buf = buffers[i - 1]
            else
                vim.api.nvim_echo({{"Already at the first buffer", "WarningMsg"}}, true, {})
                return
            end
            break
        end
    end

    if prev_buf then
        vim.api.nvim_set_current_buf(prev_buf)
    end
end
-- Map the custom function to a keybinding
vim.api.nvim_set_keymap("n", "<leader>wq", ":lua force_write_and_close()<CR>", {noremap = true, silent = true})

-- Key mappings
vim.api.nvim_set_keymap("n", "<c-k>", ":BF<CR>", {noremap = true, silent = true})
vim.api.nvim_set_keymap("n", "<c-j>", ":BB<CR>", {noremap = true, silent = true})
vim.api.nvim_set_keymap("n", "<c-x>", ":BD<CR>", {noremap = true, silent = true})
vim.api.nvim_set_keymap("n", "<leader>h", ":set invhlsearch<CR>", {noremap = true, silent = true})
vim.api.nvim_set_keymap("n", "<leader>S", ":so %<CR>", {noremap = true, silent = true})

-- Exiting
vim.api.nvim_set_keymap("n", "<leader>q", ":wqa!<CR>", {noremap = true, silent = true})
vim.api.nvim_set_keymap("n", "<leader>Q", ":qa!<CR>", {noremap = true, silent = true})

-- Bookmarks
vim.api.nvim_set_keymap("n", "mt", "mT", {noremap = true, silent = true})
vim.api.nvim_set_keymap("n", "gt", "`T", {noremap = true, silent = true})
vim.api.nvim_set_keymap("n", "ms", "mS", {noremap = true, silent = true})
vim.api.nvim_set_keymap("n", "gs", "`S", {noremap = true, silent = true})
vim.api.nvim_set_keymap("n", "mm", "mM", {noremap = true, silent = true})
vim.api.nvim_set_keymap("n", "gm", "`M", {noremap = true, silent = true})
vim.api.nvim_set_keymap("n", "my", "mY", {noremap = true, silent = true})
vim.api.nvim_set_keymap("n", "gy", "`Y", {noremap = true, silent = true})
vim.api.nvim_set_keymap("n", "mx", "mX", {noremap = true, silent = true})
vim.api.nvim_set_keymap("n", "gx", "`X", {noremap = true, silent = true})
vim.api.nvim_set_keymap("n", "mz", "mZ", {noremap = true, silent = true})
vim.api.nvim_set_keymap("n", "gz", "`Z", {noremap = true, silent = true})
