return { -- add any tools you want to have installed below
    {
        "williamboman/mason.nvim",
        opts = {
            ensure_installed = {
                "stylua",
                "shellcheck",
                "shfmt",
                "flake8",
                "black",
            },
        },
    },
    -- add tsserver and setup with typescript.nvim instead of lspconfig
    {
        "neovim/nvim-lspconfig",
        dependencies = {
            "jose-elias-alvarez/typescript.nvim",
            init = function()
                require("lazyvim.util").lsp.on_attach(function(_, buffer)
          -- stylua: ignore
          vim.keymap.set( "n", "<leader>co", "TypescriptOrganizeImports", { buffer = buffer, desc = "Organize Imports" })
                    vim.keymap.set("n", "<leader>cR", "TypescriptRenameFile", { desc = "Rename File", buffer = buffer })
                end)
            end,
        },
        ---@class PluginLspOpts
        opts = {
            ---@type lspconfig.options
            servers = {
                -- tsserver will be automatically installed with mason and loaded with lspconfig
                tsserver = {},
            },
            -- you can do any additional lsp server setup here
            -- return true if you don't want this server to be setup with lspconfig
            ---@type table<string, fun(server:string, opts:_.lspconfig.options):boolean?>
            setup = {
                -- setup with typescript.nvim
                tsserver = function(_, opts)
                    require("typescript").setup({ server = opts })
                    return true
                end,
                eslint = function()
                    local function get_client(buf)
                        return require("lazyvim.util").lsp.get_clients({ name = "eslint", bufnr = buf })[1]
                    end

                    local formatter = require("lazyvim.util").lsp.formatter({
                        name = "eslint: lsp",
                        primary = true,
                        priority = 200,
                        filter = "eslint",
                    })

                    -- Use EslintFixAll on Neovim < 0.10.0
                    if not pcall(require, "vim.lsp._dynamic") then
                        formatter.name = "eslint: EslintFixAll"
                        formatter.sources = function(buf)
                            local client = get_client(buf)
                            return client and { "eslint" } or {}
                        end
                        formatter.format = function(buf)
                            local client = get_client(buf)
                            if client then
                                local diag =
                                    vim.diagnostic.get(buf, { namespace = vim.lsp.diagnostic.get_namespace(client.id) })
                                if #diag > 0 then
                                    vim.cmd("EslintFixAll")
                                end
                            end
                        end
                    end

                    -- register the formatter with LazyVim
                    require("lazyvim.util").format.register(formatter)
                end,
                -- Specify * to use this function as a fallback for any server
                -- ["*"] = function(server, opts) end,
            },
        },
    },

    -- since `vim.tbl_deep_extend`, can only merge tables and not lists, the code above
    -- would overwrite `ensure_installed` with the new value.
    -- If you'd rather extend the default config, use the code below instead:
    {
        "nvim-treesitter/nvim-treesitter",
        opts = function(_, opts)
            -- add tsx and treesitter
            vim.list_extend(opts.ensure_installed, {
                "typescript",
            })
        end,
    },
}
