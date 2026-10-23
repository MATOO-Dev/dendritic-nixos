{
	flake.modules.nvim.diagnostics = {pkgs, ...}: {
		vim.lsp.trouble = {
			enable = true;
			setupOpts = {
				warn_no_results = false;
				open_no_results = true;
				focus = true;
			};
			mappings.workspaceDiagnostics = "<leader>tr";
		};

		# tiny-inline-diagnostic currently not wrapped
		vim.lazy.plugins."tiny-inline-diagnostic.nvim" = {
			package = pkgs.vimPlugins.tiny-inline-diagnostic-nvim;
			setupModule = "tiny-inline-diagnostic";
			setupOpts = {
				preset = "powerline";
				options = {
					enable_on_insert = true;
					enable_on_select = true;
					show_source = false;
					multilines = {
						enabled = true;
						always_show = true;
					};
				};
			};
			after = "vim.diagnostic.config({ virtual_text = false })";
			event = "BufEnter";
			keys = [
				{
					key = "<leader>ti";
					mode = "n";
					lua = true;
					action = ''
						function()
							require("tiny-inline-diagnostic").toggle()
							vim.diagnostic.config({virtual_lines = not vim.diagnostic.config().virtual_lines})
						end
					'';
					desc = "[T]oggle [I]nline diagnostics";
				}
			];
		};
	};
}
