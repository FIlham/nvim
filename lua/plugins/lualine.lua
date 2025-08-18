return {
    'nvim-lualine/lualine.nvim',
    event = "VeryLazy",
    dependencies = { 'nvim-tree/nvim-web-devicons' },
    init = function()
        vim.g.lualine_laststatus = vim.o.laststatus
        if vim.fn.argc(-1) > 0 then
            vim.o.statusline = " "
        else
            vim.o.laststatus = 0
        end
    end,
    opts = function()
        vim.o.laststatus = vim.g.lualine_laststatus
        return {
            options = {
                disabled_filetypes = {
                    statusline = { "alpha" }
                }
            },
            globalstatus = vim.o.laststatus == 3,
            sections = {
                lualine_a = { { 'mode', icons_enabled = true } },
                lualine_b = { 'diagnostics' },
                lualine_c = {
                    function()
                        local name = vim.fn.expand("%:t")
                        return name:gsub("%s+$", "") -- removes trailing spaces
                    end
                },
                lualine_x = { 'filetype' },
                lualine_y = { 'progress' },
                lualine_z = { 'location' }
            },
            extensions = { "toggleterm", "neo-tree" }
        }
    end
}
