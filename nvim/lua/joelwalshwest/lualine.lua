local lualine_imported, lualine = pcall(require, "lualine")
if not lualine_imported then
    print("lualine not imported")
    return
end

lualine.setup(
    {
        sections = {
            lualine_d = {
                {
                    "diagnostics",
                    -- Table of diagnostic sources, available sources are:
                    --   'nvim_lsp', 'nvim_diagnostic', 'nvim_workspace_diagnostic', 'coc', 'ale', 'vim_lsp'.
                    -- or a function that returns a table as such:
                    --   { error=error_cnt, warn=warn_cnt, info=info_cnt, hint=hint_cnt }
                    sources = {"nvim_diagnostic", "coc", "nvim_lsp"},
                    -- Displays diagnostics for the defined severity types
                    sections = {"error", "warn", "info", "hint"},
                    diagnostics_color = {
                        -- Same values as the general color option can be used here.
                        error = "DiagnosticError", -- Changes diagnostics' error color.
                        warn = "DiagnosticWarn", -- Changes diagnostics' warn color.
                        info = "DiagnosticInfo", -- Changes diagnostics' info color.
                        hint = "DiagnosticHint" -- Changes diagnostics' hint color.
                    },
                    symbols = {error = "􀂝  ", warn = "􀃁  ", info = "􁊈  ", hint = "􀂣  "},
                    colored = true, -- Displays diagnostics status in color if set to true.
                    update_in_insert = false, -- Update diagnostics in insert mode.
                    always_visible = false -- Show diagnostics even if there are none.
                }
            },
            lualine_c = {
                {
                    "filename",
                    file_status = true, -- Displays file status (readonly status, modified status)
                    newfile_status = false, -- Display new file status (new file means no write after created)
                    path = 0, -- 0: Just the filename
                    -- 1: Relative path
                    -- 2: Absolute path
                    -- 3: Absolute path, with tilde as the home directory
                    -- 4: Filename and parent dir, with tilde as the home directory

                    shorting_target = 40, -- Shortens path to leave 40 spaces in the window
                    -- for other components. (terrible name, any suggestions?)
                    symbols = {
                        modified = "⏺︎ ", -- Text to show when the file is modified.
                        readonly = "􀎡 ", -- Text to show when the file is non-modifiable or readonly.
                        unnamed = " ", -- Text to show for unnamed buffers.
                        newfile = "New File" -- Text to show for newly created file before first write
                    }
                }
            }
        },
        options = {
            theme = "auto",
            section_separators = "",
            component_separators = "",
            icons_enabled = true
        }
    }
)
