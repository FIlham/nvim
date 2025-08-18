return {
    "hrsh7th/nvim-cmp",
    event = "InsertEnter",
    dependencies = {
        {
            "L3MON4D3/LuaSnip",
            dependencies = { "rafamadriz/friendly-snippets" },
            config = function()
                require "luasnip.loaders.from_vscode".lazy_load()
            end
        },
        "neovim/nvim-lspconfig",
        "saadparwaiz1/cmp_luasnip",
        "hrsh7th/cmp-buffer",
        "hrsh7th/cmp-nvim-lsp",
        "onsails/lspkind.nvim",
        "hrsh7th/cmp-nvim-lsp-signature-help",
    },
    opts = function()
        local cmp = require "cmp"
        local luasnip = require "luasnip"
        local lspkind = require "lspkind"

        return {
            formatting = {
                format = lspkind.cmp_format {
                    mode = 'symbol_text',
                    preset = "codicons",
                    maxwidth = {
                        menu = 50,
                        abbr = 50,
                    },
                    ellipsis_char = '...',
                    show_labelDetails = true,
                    menu = ({
                        buffer = "[Buffer]",
                        nvim_lsp = "[LSP]",
                        luasnip = "[LuaSnip]",
                        nvim_lua = "[Lua]",
                        latex_symbols = "[Latex]",
                    })
                },
            },

            snippet = {
                expand = function(args)
                    require "luasnip".lsp_expand(args.body)
                end
            },
            mapping = {
                ["<CR>"] = cmp.mapping(function(fallback)
                    if cmp.visible() then
                        local entry = cmp.get_selected_entry()
                        if not entry then
                            cmp.select_next_item({ behavior = cmp.SelectBehavior.Select })
                        end
                        cmp.confirm()
                    else
                        fallback()
                    end
                end, { "i", "s", "c", }),
                ["<Tab>"] = cmp.mapping(function(fallback)
                    if cmp.visible() then
                        cmp.select_next_item()
                    elseif luasnip.locally_jumpable(1) then
                        luasnip.jump(1)
                    else
                        fallback()
                    end
                end, { "i", "s" }),

                ["<S-Tab>"] = cmp.mapping(function(fallback)
                    if cmp.visible() then
                        cmp.select_prev_item()
                    elseif luasnip.locally_jumpable(-1) then
                        luasnip.jump(-1)
                    else
                        fallback()
                    end
                end, { "i", "s" }),
            },
            window = {
                documentation = cmp.config.window.bordered(),
                completion = cmp.config.window.bordered()
            },
            sources = cmp.config.sources {
                { name = "nvim_lsp" },
                { name = "nvim_lsp_signature_help" },
                { name = "luasnip" },
            },
            {
                { name = "buffer" },
            }
        }
    end,
}
