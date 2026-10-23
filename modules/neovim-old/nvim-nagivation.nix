{
	flake.modules.nvim.navigation = {
		vim.visuals.nvim-web-devicons.enable = true;

		vim.utility.oil-nvim = {
			enable = true;
			setupOpts = {
				default_file_exporer = true;
				delete_to_trash = true;
				view_options = {show_hidden = true;};
				columns = ["icon"];
				use_default_keymaps = true;
				keymaps = {
					"<bs>" = "actions.parent";
				};
			};
		};

		vim.keymaps = [
			{
				mode = "n";
				key = "<leader>ol";
				action = "<cmd>Oil<cr>";
				desc = "[O]i[L]";
			}
		];

		vim.telescope = {
			enable = true;
		};

		vim.utility.motion.flash-nvim = {
			enable = true;
		};

		# tmux navigator currently not packaged
	};
}
