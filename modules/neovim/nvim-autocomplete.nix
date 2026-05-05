{
	flake.modules.nvim.autocomplete = {
		vim.autocomplete.blink-cmp = {
			enable = true;
			friendly-snippets.enable = true;
			setupOpts = {
				keymap.preset = "super-tab";
				cmdline.keymap.preset = "super-tab";
				completion.documentation.auto_show = true;
				completion.list.selection.auto_insert = false;
				signature.enabled = true;
				sources.default = [
					"lsp"
					"path"
					"snippets"
					"buffer"
				];
			};
			# fix keymap preset being overriden by nvf default keymaps
			mappings.next = null;
			mappings.previous = null;
		};
	};
}
