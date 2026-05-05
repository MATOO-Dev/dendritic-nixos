{
	flake.modules.nvim.typing = {pkgs, ...}: {
		vim.comments.comment-nvim = {
			enable = true;
			setupOpts = {
				sticky = false;
			};
		};

		vim.utility.surround = {
			enable = true;
			# dont override default keybinds with nvf's version
			useVendoredKeybindings = false;
		};

		# vim.lazy.plugins."ultimate-autopair.nvim" = {
		# 	package = pkgs.vimPlugins.ultimate-autopair-nvim;
		# 	setupModule = "ultimate-autopair";
		# 	setupOpts = {
		# 		# { "$", "$", ft = { 'typst' } };
		# 	};
		# 	event = [
		# 		"InsertEnter"
		# 		"CmdLineEnter"
		# 	];
		# };

		vim.mini.pairs.enable = true;

		# vim-move is currently not exposed by nvf
		# vimscript plugin, so use extraPlugins rather than lazy.plugins
		vim.extraPlugins.vim-move = {
			package = pkgs.vimPlugins.vim-move;
			setup = ''
				event = "DeferredUIEnter";
			'';
		};

		# quicker is currently not exposed by nvf
		# currently not working
		# vim.lazy.plugins.quicker-nvim = {
		# 	package = pkgs.vimPlugins.quicker-nvim;
		# 	setupModule = "quicker";
		# 	setupOpts = {};
		# 	event = [ "DeferredUIEnter" ];
		# };

		# tabout is currently not exposed by nvf
		# currently not working
		# vim.lazy.plugins.tabout-nvim = {
		# 	package = pkgs.vimPlugins.tabout-nvim;
		# 	setupModule = "tabout-nvim";
		# 	setupOpts = {};
		# 	event = [ "InsertCharPre" ];
		# };

		# vim-wordmotion is currently not exposed by nvf
		# vimscript plugin, so use extraPlugins rather than lazy.plugins
		vim.extraPlugins.vim-wordmotion = {
			package = pkgs.vimPlugins.vim-wordmotion;
			setup = ''
				event = "DeferredUIEnter";
			'';
		};

		vim.utility.undotree = {
			enable = true;
		};

		vim.keymaps = [
			{
				mode = "n";
				key = "<leader>ut";
				action = ''
					function()
					vim.cmd.UndotreeToggle()
					vim.cmd.UndotreeFocus()
					end
				'';
				lua = true;
				desc = "[U]ndotree [T]oggle";
			}
		];
	};
}
