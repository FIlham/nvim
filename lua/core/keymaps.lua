vim.g.mapleader = " "
vim.g.maplocalleader = " "
local opts = { noremap = true, silent = true }

vim.keymap.set({ "n", "i" }, "<C-s>", "<Esc>:wa<CR>", vim.tbl_extend("keep", opts, { desc = "Save file" }))
vim.keymap.set("n", "<C-h>", "<C-w>h", opts)
vim.keymap.set("n", "<C-j>", "<C-w>j", opts)
vim.keymap.set("n", "<C-k>", "<C-w>k", opts)
vim.keymap.set("n", "<C-l>", "<C-w>l", opts)
vim.keymap.set("n", "<leader>e", ":Neotree toggle<CR>", vim.tbl_extend("keep", opts, { desc = "File explorer" }))
vim.keymap.set("n", "<leader>ff", ":Telescope find_files theme=dropdown<cr>", vim.tbl_extend("keep", opts, { desc = "Find files" }))
vim.keymap.set("n", "<leader>fg", ":Telescope live_grep theme=dropdown<cr>", vim.tbl_extend("keep", opts, { desc = "Live grep" }))
vim.keymap.set("n", "<leader>fb", ":Telescope buffers theme=dropdown<cr>", vim.tbl_extend("keep", opts, { desc = "Find buffers" }))
vim.keymap.set("n", "<leader>th", ":TermNew<CR>", vim.tbl_extend("keep", opts, { desc = "Horizontal terminal"}))
vim.keymap.set("n", "<leader>tv", ":TermNew direction=vertical<CR>", vim.tbl_extend("keep", opts , { desc = "Vertical horizontal"}))
vim.keymap.set("n", "<leader>tb", ":TermNew direction=tab<CR>", vim.tbl_extend("keep", opts, { desc = "Tab terminal"}))
vim.keymap.set("n", "<leader>tf", ":TermNew direction=float<CR>", vim.tbl_extend("keep", opts, { desc = "Float terminal"}))
vim.keymap.set("t", "<Esc>", "<C-\\><C-N><CR>", opts)
