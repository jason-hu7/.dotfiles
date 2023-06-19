return {
    "kylechui/nvim-surround",
    version = "*", -- Use for stability; omit to use `main` branch for the latest features
    event = "VeryLazy",
    config = function()
        require("nvim-surround").setup({
            keymaps = {
                -- vim-surround style keymaps
                insert = "<C-g>s",
                insert_line = "<C-g>S",
                normal = "ys",
                normal_cur = "yss",
                normal_line = "yS",
                normal_cur_line = "ySS",
                visual = "S",
                visual_line = "gS",
                delete = "ds",
                change = "cs",
            },
            surrounds = {
                HTML = {
                    ["t"] = true, -- Use "t" for HTML-style mappings
                },
                aliases = {
                    ["a"] = ">", -- Single character aliases apply everywhere
                    ["b"] = ")",
                    ["B"] = "}",
                    ["r"] = "]",
                    ["q"] = { '"', "'", "`" }, -- Table aliases only apply for changes/deletions
                },
            },
        })
    end,
}
