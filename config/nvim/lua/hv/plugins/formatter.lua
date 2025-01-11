return {
	"stevearc/conform.nvim",
	config = function()
		require("conform").setup({
			formatters_by_ft = {

				-- docs: https://github.com/JohnnyMorganz/StyLua
				-- installation: brew install stylua
				lua = { "stylua" },

				javascript = { "prettierd" },
				javascriptreact = { "prettierd" },
				typescript = { "prettierd" },
				typescriptreact = { "prettierd" },
				html = { "prettierd" },
				css = { "prettierd" },
				json = { "prettierd" },
				svg = { "erb_format" },
				eruby = { "erb_format" },
				clojure = { "cljfmt" },
			},
			format_on_save = function(bufnr)
				-- Disable with a global or buffer-local variable
				if
					vim.g.disable_autoformat
					or vim.b[bufnr].disable_autoformat
					or vim.bo[bufnr].filetype == "eruby.yaml"
				then
					return
				end
				return { timeout_ms = 500, lsp_fallback = true }
			end,
		})

		vim.api.nvim_create_user_command("DisableAutoformat", function(args)
			if args.bang then
				-- FormatDisable! will disable formatting just for this buffer
				vim.b.disable_autoformat = true
			else
				vim.g.disable_autoformat = true
			end
		end, {
			desc = "Disable autoformat-on-save",
			bang = true,
		})

		vim.api.nvim_create_user_command("EnableAutoformat", function()
			vim.b.disable_autoformat = false
			vim.g.disable_autoformat = false
		end, {
			desc = "Enable autoformat-on-save",
		})
	end,
}
