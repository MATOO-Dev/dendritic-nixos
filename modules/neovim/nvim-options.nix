{
	flake.modules.nvim.options = {
		# vim = {
		# 	# does this even do anything?
		# 	# is it part of vim, or something else?
		# 	clipboard = {
		# 		enable = false;
		# 		providers.wl-copy.enable = true;
		# 	};
		# };

		vim.options = {
			# enable relative line numbering
			number = true;
			relativenumber = true;

			# ensure tabs are 4 spaces wide, and are actually tabs instead of spaces
			tabstop = 4;
			shiftwidth = 4;
			softtabstop = 0;
			expandtab = false;

			# disable wrap, but if wrap is manually enabled, break between words
			wrap = false;
			linebreak = true;

			# ignore capitalization when searching etc, unless specified
			ignorecase = true;
			smartcase = true;

			# automatically handle indentation
			autoindent = true;
			smartindent = true;
			# indentexpr = ""; # fixes treesitter indentation, but needs to be set differently

			# folding
			foldcolumn = "0";
			foldenable = true;
			foldlevel = 99;
			foldlevelstart = 99;
			foldmethod = "expr";
			foldexpr = "v:lua.vim.lsp.foldexpr()";
			foldtext = "(folded)";
			# fillchars:append({fold = ""});

			# dont show insert/visual/etc, deferred to status bar plugin
			showmode = false;

			# line cursor in insert, block otherwise, and make it blink
			guicursor = "n-v-r:block,i:ver25,a:blinkwait700-blinkoff400-blinkon250";

			# disable automatic backups, instead give undotree more access
			swapfile = false;
			backup = false;
			undofile = true;

			# enable search highlighting and incremental search
			hlsearch = true;
			incsearch = true;

			# enable colors in TUI and pull them from terminal if possible
			termguicolors = true;

			# minimum cursor distance to top/bottom when scrolling (unless BOF/EOF)
			scrolloff = 5;

			# always show sign column
			signcolumn = "yes";

			# show bar at n chars to indicate long lines
			colorcolumn = "81";

			# enable @ in file names
			# isfname:append('@-@')

			# faster update time
			updatetime = 50;

			# higher default concel level for obsidian, typst, etc.
			conceallevel = 2;
			# vim.api.nvim_set_option('clipboard', 'unnamed')
		};

		vim.autocmds = [
			{
				enable = true;
				event = ["BufEnter"];
				pattern = ["*"];
				# command = "setlocal indentexpr=nvim_treesitter#indent()";
				command = ''setlocal indentexpr=""'';
			}
		];
	};
}
