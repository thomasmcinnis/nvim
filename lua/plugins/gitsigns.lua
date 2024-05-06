return {
	"lewis6991/gitsigns.nvim",
	event = { "BufReadPre", "BufNewFile" },
	opts = {
		on_attach = function(bufnr)
			local gs = package.loaded.gitsigns

			local function map(mode, l, r, desc)
				vim.keymap.set(mode, l, r, { buffer = bufnr, desc = desc })
			end

			-- Navigation
			map("n", "<leader>ghn", gs.next_hunk, "Next Hunk")
			map("n", "<leader>ghp", gs.prev_hunk, "Prev Hunk")

			-- Actions
			map("n", "<leader>ghs", gs.stage_hunk, "Hunk stage")
			map("n", "<leader>ghr", gs.reset_hunk, "Hunk reset")
			-- map("v", "<leader>ghr", function()
			-- 	gs.reset_hunk({ vim.fn.line("."), vim.fn.line("v") })
			-- end, "Reset hunk")

			map("n", "<leader>gS", gs.stage_buffer, "Stage buffer")
			map("n", "<leader>gR", gs.reset_buffer, "Reset buffer")

			-- map("v", "<leader>ghs", function()
			-- 	gs.stage_hunk({ vim.fn.line("."), vim.fn.line("v") })
			-- end, "Hunk stage")
			map("n", "<leader>ghu", gs.undo_stage_hunk, "Hunk unstage")

			map("n", "<leader>ghv", gs.preview_hunk, "Hunk preview")

			map("n", "<leader>gb", function()
				gs.blame_line({ full = true })
			end, "Blame line")
			map("n", "<leader>gB", gs.toggle_current_line_blame, "Toggle line blame")

			map("n", "<leader>gd", gs.diffthis, "Diff this")
			map("n", "<leader>gD", function()
				gs.diffthis("~")
			end, "Diff this ~")

			-- Text object
			map({ "o", "x" }, "ih", ":<C-U>Gitsigns select_hunk<CR>", "Gitsigns select hunk")
		end,
		signs = {
			change = { text = "~" },
			delete = { text = "_" },
			topdelete = { text = "‾" },
			changedelete = { text = "~" },
			add = { text = "+" },
		},
	},
}
