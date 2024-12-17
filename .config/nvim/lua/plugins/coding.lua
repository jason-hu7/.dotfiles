return {
	-- {
	--   "zbirenbaum/copilot.lua",
	--   cmd = "Copilot",
	--   build = ":Copilot auth",
	--   event = "InsertEnter",
	--   config = function()
	--     require("copilot").setup({
	--       panel = {
	--         enabled = true,
	--         auto_refresh = true,
	--       },
	--       suggestion = {
	--         enabled = true,
	--         auto_trigger = true,
	--         accept = false, -- disable built-in keymapping
	--       },
	--     })
	--
	--     -- hide copilot suggestions when cmp menu is open
	--     -- to prevent odd behavior/garbled up suggestions
	--     local cmp_status_ok, cmp = pcall(require, "cmp")
	--     if cmp_status_ok then
	--       cmp.event:on("menu_opened", function()
	--         vim.b.copilot_suggestion_hidden = true
	--       end)
	--
	--       cmp.event:on("menu_closed", function()
	--         vim.b.copilot_suggestion_hidden = false
	--       end)
	--     end
	--   end,
	-- },
	-- first: disable default <tab> and <s-tab> behavior in LuaSnip
	{
		"L3MON4D3/LuaSnip",
		keys = function()
			return {}
		end,
	},
	-- then: setup supertab in cmp
	{
		"hrsh7th/nvim-cmp",
		---@param opts cmp.ConfigSchema
		opts = function(_, opts)
			local has_words_before = function()
				unpack = unpack or table.unpack
				local line, col = unpack(vim.api.nvim_win_get_cursor(0))
				return col ~= 0
					and vim.api.nvim_buf_get_lines(0, line - 1, line, true)[1]:sub(col, col):match("%s") == nil
			end

			local luasnip = require("luasnip")
			local cmp = require("cmp")

			opts.mapping = vim.tbl_extend("force", opts.mapping, {
				["<Tab>"] = cmp.mapping(function(fallback)
					if cmp.visible() then
						cmp.select_next_item()
					-- elseif require("copilot.suggestion").is_visible() then
					-- 	require("copilot.suggestion").accept()
					elseif luasnip.expand_or_jumpable() then
						luasnip.expand_or_jump()
					elseif has_words_before() then
						cmp.complete()
					else
						fallback()
					end
				end, { "i", "s" }),
				["<S-Tab>"] = cmp.mapping(function(fallback)
					if cmp.visible() then
						cmp.select_prev_item()
					elseif luasnip.jumpable(-1) then
						luasnip.jump(-1)
					else
						fallback()
					end
				end, { "i", "s" }),
			})
		end,
	},
}
