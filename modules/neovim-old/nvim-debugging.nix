{
	flake.modules.nvim.debugging = {
		vim.languages.enableDAP = true;

		vim.debugger.nvim-dap = {
			enable = true;
			mappings = {
				continue = "<f5>";
				terminate = "<s-f5>";
				restart = "<up>";
				stepOver = "<down>";
				stepInto = "<right>";
				stepOut = "<left>";
				toggleBreakpoint = "<leader>b";
			};
			# configurations.* = {
			# 	stopOnEntry = true;
			# };
		};

		# appears to break tiny-inline-diagnostic
		# vim.lazy.plugins.nvim-dap-view = {
		#     package = pkgs.vimPlugins.nvim-dap-view;
		#     setupModule = "dap-view";
		#     setupOpts = {
		#         auto_toggle = true;
		#         follow_tab = false; # default, in case i want to change it later
		#         winbar = {
		#             default_section = "scopes";
		#             controls.enabled = true;
		#         };
		#     };
		# };

		# appears to break tiny-inline-diagnostic
		# # not working rn, and idk why
		# vim.lazy.plugins.nvim-dap-virtual-text = {
		#     package = pkgs.vimPlugins.nvim-dap-virtual-text;
		#     setupModule = "nvim-dap-virtual-text";
		#     setupOpts = {
		#         commented = true;
		#         highlight_changed_variables = true;
		#         highlight_new_as_changed = true;
		#         virt_text_win_col = 83; # 80 free + column + space, start on 83
		#         virt_text_pos = "inline";
		#     };
		# };
	};
}
