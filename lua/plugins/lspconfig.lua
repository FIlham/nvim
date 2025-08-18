return {
    "neovim/nvim-lspconfig",
    event = {
        "BufReadPre",
        "BufNewFile",
        "InsertEnter"
    },
    dependencies = {
        "mason-org/mason-lspconfig.nvim",
        "hrsh7th/cmp-nvim-lsp"
    },
    config = function()
        local mason_lspconfig = require "mason-lspconfig"
        local servers = mason_lspconfig.get_installed_servers()
        local capabilities = require "cmp_nvim_lsp".default_capabilities()

        vim.diagnostic.config {
            severity_sort = true,
            float = { border = 'rounded', source = 'if_many' },
            underline = { severity = vim.diagnostic.severity.ERROR },
            signs = vim.g.have_nerd_font and {
                text = {
                    [vim.diagnostic.severity.ERROR] = '󰅚 ',
                    [vim.diagnostic.severity.WARN] = '󰀪 ',
                    [vim.diagnostic.severity.INFO] = '󰋽 ',
                    [vim.diagnostic.severity.HINT] = '󰌶 ',
                },
            } or {},
            virtual_text = {
                source = 'if_many',
                spacing = 2,
                format = function(diagnostic)
                    local diagnostic_message = {
                        [vim.diagnostic.severity.ERROR] = diagnostic.message,
                        [vim.diagnostic.severity.WARN] = diagnostic.message,
                        [vim.diagnostic.severity.INFO] = diagnostic.message,
                        [vim.diagnostic.severity.HINT] = diagnostic.message,
                    }
                    return diagnostic_message[diagnostic.severity]
                end,
            },
        }

        vim.lsp.config("lua_ls", {
            cmd = { "lua-language-server" },
            capabilities = capabilities
        })
        vim.lsp.enable("lua_ls")

        for _, server in ipairs(servers) do
            vim.lsp.config(server, {
                capabilities = capabilities
            })
            vim.lsp.enable(server)
        end

        vim.keymap.set("n", "<leader>fb", function()
            vim.lsp.buf.format()
        end, { desc = "Format file", noremap = true, silent = true })
    end
}
