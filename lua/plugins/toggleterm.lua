return {
    "akinsho/toggleterm.nvim",
    keys = {
        { "<leader>th", ":TermNew", desc = "Open horizontal terminal"},
        { "<leader>tv", ":TermNew direction=vertical", desc = "Open vertical terminal"},
        { "<leader>tf", ":TermNew direction=float", desc = "Open floating terminal"},
    },
    opts = {
        open_mapping = [[<C-\>]],
        autochdir = true,
        float_opts = {
            border = "curved"
        }
    }
}
