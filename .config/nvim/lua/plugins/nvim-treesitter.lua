-- treesitter & extensions
return {
    -- { "nvim-treesitter/playground", cmd = "TSPlaygroundToggle" },
    {
        "nvim-treesitter/nvim-treesitter-context",
        dependencies = {
            "nvim-treesitter/nvim-treesitter",
        },
    },
    {
        "nvim-treesitter/nvim-treesitter-textobjects",
        dependencies = {
            "nvim-treesitter/nvim-treesitter",
        },
    },
    {
        "nvim-treesitter/nvim-treesitter-refactor",
        dependencies = {
            "nvim-treesitter/nvim-treesitter",
        },
    },
    {
        "nvim-treesitter/playground",
        cmd = "TSPlaygroundToggle",
        dependencies = {
            "nvim-treesitter/nvim-treesitter",
        },
    },
    {
        "windwp/nvim-ts-autotag",
        dependencies = {
            "nvim-treesitter/nvim-treesitter",
        },
    },
    {
        "nvim-treesitter/nvim-treesitter",
        build = ":TSUpdate",
        config = function()
            require("nvim-treesitter.configs").setup({
                ensure_installed = "all",
                ignore_install = { "phpdoc", "tree-sitter-phpdoc" },
                highlight = {
                    enable = true,
                },
                incremental_selection = {
                    enable = true,
                    keymaps = {
                        init_selection = "<S-Tab>", --normal mode
                        node_incremental = "<Tab>", --visual mode
                        node_decremental = "<S-Tab>", --visual mode
                    },
                },
                textobjects = {
                    select = {
                        enable = true,
                        keymaps = {
                            ["af"] = "@function.outer",
                            ["if"] = "@function.inner",
                        },
                    },
                },
                playground = {
                    enable = true,
                    disable = {},
                    updatetime = 25, -- Debounced time for highlighting nodes in the playground from source code
                    persist_queries = false, -- Whether the query persists across vim sessions
                },
                refactor = {
                    highlight_definitions = {
                        enable = true,
                        clear_on_cursor_move = true,
                    },
                    smart_rename = {
                        enable = true,
                        keymaps = {
                            smart_rename = "grr",
                        },
                    },
                },
                indent = {
                    enable = true,
                },
                autotag = {
                    enable = true,
                },
                context_commentstring = {
                    enable = true,
                    config = {
                        javascriptreact = { style_element = "{/*%s*/}" },
                    },
                },
            })
        end,
    },
}

