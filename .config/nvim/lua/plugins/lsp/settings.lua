-- Mappings.
-- See `:help vim.diagnostic.*` for documentation on any of the below functions
local function opts(desc)
    return { desc = "LSP: " .. desc, noremap = true, silent = true }
end
local function goto_prev_error()
    vim.diagnostic.goto_prev({ severity = "Error" })
end

local function goto_next_error()
    vim.diagnostic.goto_next({ severity = "Error" })
end

vim.keymap.set("n", "<leader>e", vim.diagnostic.open_float, opts("open diagnostic float"))
vim.keymap.set("n", "<leader>q", vim.diagnostic.setloclist, opts("set diagnostic loc list"))

vim.keymap.set("n", "g[", vim.diagnostic.goto_prev, opts("go to previous diagnositc"))
vim.keymap.set("n", "g]", vim.diagnostic.goto_next, opts("go to next diagnostic"))
vim.keymap.set("n", "<leader>gN", goto_prev_error, opts("go to previous error"))
vim.keymap.set("n", "<leader>gn", goto_next_error, opts("go to next error"))

-- Use LspAttach autocommand to only map the following keys
-- after the language server attaches to the current buffer
vim.api.nvim_create_autocmd("LspAttach", {
    group = vim.api.nvim_create_augroup("UserLspConfig", {}),
    callback = function(ev)
        -- Enable completion triggered by <c-x><c-o>
        vim.bo[ev.buf].omnifunc = "v:lua.vim.lsp.omnifunc"

        -- Mappings.
        -- See `:help vim.lsp.*` for documentation on any of the below functions
        local function bufopts(desc)
            return { desc = "LSP: " .. desc, noremap = true, silent = true, buffer = ev.buf }
        end
        vim.keymap.set("n", "gD", vim.lsp.buf.declaration, bufopts("go to declaration"))
        vim.keymap.set("n", "gd", vim.lsp.buf.definition, bufopts("go to definition"))
        vim.keymap.set("n", "K", vim.lsp.buf.hover, bufopts("hover"))
        -- vim.keymap.set("n", "gi", vim.lsp.buf.implementation, bufopts("go to implementation"))
        -- vim.keymap.set("n", "<C-k>", vim.lsp.buf.signature_help, bufopts("signature help"))
        -- vim.keymap.set("n", "<space>wa", vim.lsp.buf.add_workspace_folder, bufopts)
        -- vim.keymap.set("n", "<space>wr", vim.lsp.buf.remove_workspace_folder, bufopts)
        -- vim.keymap.set("n", "<space>wl", function()
        --     print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
        -- end, bufopts)
        vim.keymap.set("n", "<leader>D", vim.lsp.buf.type_definition, bufopts("type definition"))
        vim.keymap.set("n", "<leader>rn", vim.lsp.buf.rename, bufopts("rename"))
        vim.keymap.set({ "n", "v" }, "<space>ca", vim.lsp.buf.code_action, bufopts("code action"))
        vim.keymap.set("n", "gr", vim.lsp.buf.references, bufopts("references"))
        vim.keymap.set("n", "<leader>F", function()
            vim.lsp.buf.format({ async = true })
        end, bufopts("format buffer"))
    end,
})

local lsp_flags = {
    -- This is the default in Nvim 0.7+
    debounce_text_changes = 150,
}

--Enable (broadcasting) snippet capability for completion
local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities.textDocument.completion.completionItem.snippetSupport = true

-- Python language server
require("lspconfig")["pyright"].setup({
    flags = lsp_flags,
})
-- TypeScript language server
require("lspconfig")["tsserver"].setup({
    capabilities = capabilities,
    flags = lsp_flags,
    settings = {
        typescript = {
            inlayHints = {
                includeInlayParameterNameHints = "literal",
                includeInlayParameterNameHintsWhenArgumentMatchesName = false,
                includeInlayFunctionParameterTypeHints = true,
                includeInlayVariableTypeHints = false,
                includeInlayPropertyDeclarationTypeHints = true,
                includeInlayFunctionLikeReturnTypeHints = true,
                includeInlayEnumMemberValueHints = true,
            },
        },
        javascript = {
            inlayHints = {
                includeInlayParameterNameHints = "all",
                includeInlayParameterNameHintsWhenArgumentMatchesName = false,
                includeInlayFunctionParameterTypeHints = true,
                includeInlayVariableTypeHints = true,
                includeInlayPropertyDeclarationTypeHints = true,
                includeInlayFunctionLikeReturnTypeHints = true,
                includeInlayEnumMemberValueHints = true,
            },
        },
    },
})
-- Lua language server
require("lspconfig")["lua_ls"].setup({
    flags = lsp_flags,
    settings = {
        Lua = {
            runtime = {
                -- Tell the language server which version of Lua you're using (most likely LuaJIT in the case of Neovim)
                version = "LuaJIT",
            },
            diagnostics = {
                -- Get the language server to recognize the `vim` global
                globals = { "vim" },
            },
            workspace = {
                -- Make the server aware of Neovim runtime files
                library = vim.api.nvim_get_runtime_file("", true),
                checkThirdParty = false,
            },
        },
    },
})
-- Vue language server
require("lspconfig")["volar"].setup({
    capabilities = capabilities,
    filetypes = { "vue" },
    flags = lsp_flags,
    init_options = {
        typescript = {
            tsdk = "/opt/homebrew/lib/node_modules/typescript/lib",
            -- Alternative location if installed as root:
            -- tsdk = '/usr/local/lib/node_modules/typescript/lib'
        },
    },
})
-- YAML language server
require("lspconfig")["yamlls"].setup({
    capabilities = capabilities,
    flags = lsp_flags,
    settings = {
        yaml = {
            keyOrdering = false,
        },
        editor = {
            tabSize = 4,
        },
    },
})
-- Bash language server
require("lspconfig")["bashls"].setup({
    capabilities = capabilities,
    flags = lsp_flags,
})
require("lspconfig")["eslint"].setup({
    flags = lsp_flags,
})
require("lspconfig")["cssls"].setup({
    capabilities = capabilities,
    flags = lsp_flags,
})
