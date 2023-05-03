local M = {}

M.toggleterm = function()
	local toggleterm = require("toggleterm")
	if not toggleterm then
		return
	end

	toggleterm.setup({
		size = function(term)
			if term.direction == "horizontal" then
				return 15
			elseif term.direction == "vertical" then
				return vim.o.columns * 0.4
			end
		end,
		open_mapping = [[<C-\>]],
		hide_numbers = true,
		shade_filetypes = {},
		shade_terminals = true,
		shading_factor = 2,
		start_in_insert = true,
		insert_mappings = true,
		terminal_mappings = true,
		persist_size = true,
		direction = "horizontal",
		close_on_exit = true,
		shell = vim.o.shell,
	})

	function _G.set_terminal_keymaps()
		local opts = { noremap = true }
		vim.api.nvim_buf_set_keymap(0, "t", "<esc>", [[<C-\><C-n>]], opts)
		vim.api.nvim_buf_set_keymap(0, "t", "jj", [[<C-\><C-n>]], opts)
		vim.api.nvim_buf_set_keymap(0, "t", "<C-h>", [[<C-\><C-n><C-W>h]], opts)
		vim.api.nvim_buf_set_keymap(0, "t", "<C-j>", [[<C-\><C-n><C-W>j]], opts)
		vim.api.nvim_buf_set_keymap(0, "t", "<C-k>", [[<C-\><C-n><C-W>k]], opts)
		vim.api.nvim_buf_set_keymap(0, "t", "<C-l>", [[<C-\><C-n><C-W>l]], opts)
	end

	vim.cmd("autocmd! TermOpen term://* lua set_terminal_keymaps()")
end

M.nvim_autopairs = function()
	local autopairs = require("nvim-autopairs")
	if not autopairs then
		return
	end

	autopairs.setup({
		check_ts = true,
		ts_config = {
			lua = { "string" },
			javascript = { "template_string" },
			java = false,
		},
		disable_filetype = { "TelescopePrompt", "vim" },
	})
end

M.indent_blankline = function()
	local indent = require("indent_blankline")
	if not indent then
		return
	end

	vim.opt.list = true

	indent.setup({
		space_char_blankline = " ",
		show_current_context = true,
		show_current_context_start = false,
	})
end

M.nvim_colorizer = function()
	local colorizer = require("colorizer")
	if not colorizer then
		return
	end

	colorizer.setup({ "*" }, {
		RGB = true, -- #RGB hex codes
		RRGGBB = true, -- #RRGGBB hex codes
		names = false, -- "Name" codes like Blue
		RRGGBBAA = false, -- #RRGGBBAA hex codes
		rgb_fn = false, -- CSS rgb() and rgba() functions
		hsl_fn = false, -- CSS hsl() and hsla() functions
		css = false, -- Enable all CSS features: rgb_fn, hsl_fn, names, RGB, RRGGBB
		css_fn = false, -- Enable all CSS *functions*: rgb_fn, hsl_fn
		mode = "background", -- Set the display mode.
	})
end

M.comment = function()
	local comment = require("Comment")
	if not comment then
		return
	end

	comment.setup({
		toggler = {
			line = "<leader>cl",
			block = "<leader>bl",
		},
		opleader = {
			line = "<leader>cc",
			block = "<leader>cb",
		},
		pre_hook = function(ctx)
			local U = require("Comment.utils")

			local location = nil
			if ctx.ctype == U.ctype.block then
				location = require("ts_context_commentstring.utils").get_cursor_location()
			elseif ctx.cmotion == U.cmotion.v or ctx.cmotion == U.cmotion.V then
				location = require("ts_context_commentstring.utils").get_visual_start_location()
			end

			return require("ts_context_commentstring.internal").calculate_commentstring({
				key = ctx.ctype == U.ctype.line and "__default" or "__multiline",
				location = location,
			})
		end,
	})
end

M.package_info = function()
	local package = require("package-info")
	if not package then
		return
	end

	package.setup({
		icons = {
			enable = true,
			style = {
				up_to_date = "|  ",
				outdated = "|  ",
			},
		},
		autostart = true,
		hide_up_to_date = true,
		hide_unstable_versions = false,
	})
end

return M