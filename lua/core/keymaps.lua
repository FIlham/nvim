vim.g.mapleader = " "
vim.g.maplocalleader = " "
local opts = { noremap = true, silent = true }

vim.keymap.set({ "n", "i" }, "<C-s>", "<Esc>:wa<CR>", vim.tbl_extend("keep", opts, { desc = "Save file" }))
vim.keymap.set("n", "<leader>e", ":Neotree toggle<CR>", vim.tbl_extend("keep", opts, { desc = "File explorer" }))
vim.keymap.set("n", "<leader>ff", ":Telescope find_files theme=dropdown<cr>", vim.tbl_extend("keep", opts, { desc = "Find files" }))
vim.keymap.set("n", "<leader>fg", ":Telescope live_grep theme=dropdown<cr>", vim.tbl_extend("keep", opts, { desc = "Live grep" }))
vim.keymap.set("n", "<leader>fb", ":Telescope buffers theme=dropdown<cr>", vim.tbl_extend("keep", opts, { desc = "Find buffers" }))
