return {
    'nvim-lualine/lualine.nvim',
    dependencies = { 'nvim-tree/nvim-web-devicons' },
    opts = {
        always_show_tabline = false,
        disable_filetypes = {
            statusline = { "neo-tree" },
        },
        sections = {
            lualine_a = { 'mode' },
            lualine_b = { 'diagnostics' },
            lualine_c = { 'filename' },
            lualine_x = { 'filetype' },
            lualine_y = { 'progress' },
            lualine_z = { 'location' }
        },
        tabline = {
  lualine_a = {'buffers'},
  lualine_z = {'tabs'}
},
        extensions = { "neo-tree" },
    }
}
