return {
    'nvim-telescope/telescope.nvim',
    event = "VeryLazy",
    tag = '0.1.5',
    dependencies = { 'nvim-lua/plenary.nvim' },
    keys = {
        { "<leader>ff", ":Telescope find_files theme=dropdown<CR>", desc = "Find files",   silent = true, noremap = true },
        { "<leader>fg", ":Telescope live_grep theme=dropdown<CR>",  desc = "Live grep",    silent = true, noremap = true },
        { "<leader>fb", ":Telescope buffers theme=dropdown<CR>",    desc = "Find buffers", silent = true, noremap = true },
    },
    opts = {}
}
