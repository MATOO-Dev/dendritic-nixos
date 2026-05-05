{
	flake.modules.nvim.git = {
		vim.git.gitsigns = {
			enable = true;
			setupOpts = {
				signs = {
					add.text = "+┃";
					change.text = "~┃";
					delete.text = "-┃";
					topdelete.text = "-┃";
					changedelete.text = "~┃";
					untracked.text = "?┃";
				};
				signs_staged = {
					add.text = "+┃";
					change.text = "~┃";
					delete.text = "-┃";
					topdelete.text = "-┃";
					changedelete.text = "~┃";
					untracked.text = "?┃";
				};
				signs_staged_enable = true;
				# vim.cmd('hi GitSignsAdd guifg=#9ecd6f')
				# vim.cmd('hi GitSignsChange guifg=#78dce8')
				# vim.cmd('hi GitSignsDelete guifg=#dc5577')
				# vim.cmd('hi GitSignsStagedAdd guifg=#9ecd6f')
				# vim.cmd('hi GitSignsStagedChange guifg=#78dce8')
				# vim.cmd('hi GitSignsStagedDelete guifg=#dc5577')
			};
		};

		vim.git.neogit = {
			enable = true;
		};

		# vim.git.git-conflict = {
		# 	enable = true;
		# };

		# gitignore plugin currently not available

		# 		vim.utility.diffview-nvim = {
		# 			enable = true;
		# 			setupOpts = {
		# 				view.merge_tool.layout = "diff3_mixed";
		# 			};
		# 			keys = {
		# 	{
		# 		'<leader>do',
		# 		mode = 'n',
		# 		function()
		# 			if require 'diffview.lib'.get_current_view() then
		# 				vim.cmd.DiffviewClose()
		# 			else
		# 				vim.cmd.DiffviewOpen()
		# 			end
		# 		end,
		# 		desc = '[D]iffview [O]pen (toggle)'
		# 	},
		# 	{
		# 		'<leader>du',
		# 		mode = 'n',
		# 		function() vim.cmd.DiffviewRefresh() end,
		# 		desc = '[D]iffview [U]pdate'
		# 	},
		# 	{
		# 		'<leader>dl',
		# 		mode = 'n',
		# 		function() vim.cmd.DiffviewToggleFiles() end,
		# 		desc = '[D]iffview toggle file [L]ist'
		# 	},
		# },
		# 		};
	};
}
