{
	flake.modules.nvim.languages = {pkgs, ...}: {
		vim.lsp = {
			enable = true;
			formatOnSave = true;
			inlayHints.enable = false; # inline type annotations
			# lspSignature.enable = true; # incompatible with blink-cmp
		};

		vim.languages = {
			enableTreesitter = true;
			enableFormat = true;
			# enableDAP = true;
		};

		vim.treesitter = {
			fold = true;
			highlight.enable = true;
			indent.enable = true;
			textobjects.enable = true;
			addDefaultGrammars = true;
			grammars = with pkgs.vimPlugins.nvim-treesitter.builtGrammars; [gdscript gdshader godot_resource];
		};

		vim.languages.clang = {
			enable = true;
			# cmd = {
			# 	'clangd',
			# 	'--completion-style=detailed',
			# 	'--clang-tidy',
			# 	'--function-arg-placeholders=1'
			# },
		};
		vim.formatter.conform-nvim.setupOpts.formatters_by_ft.c = ["clang-format"];
		vim.formatter.conform-nvim.setupOpts.formatters_by_ft.cpp = ["clang-format"];
		vim.formatter.conform-nvim.setupOpts.formatters.clang-format.prepend_args = [
			"--style={ColumnLimit: 0, IndentWidth: 4, TabWidth: 4}"
		];

		vim.languages.lua = {
			enable = true;
			# globals?
			# telemetry?
			# diagnostics = {
			# 	globals = { 'vim', 'nixCats' },
			# },
			# telemetry = { enabled = false },
		};
		vim.lsp.servers.lua-language-server.settings.Lua.diagnostics.globals = ["vim"];
		vim.formatter.conform-nvim.setupOpts.formatters.stylua.prepend_args = [
			# "--indent-type"
			# "Spaces"
			# "--indent-width"
			# "4"
			"--quote-style"
			"AutoPreferSingle"
			"--call-parentheses"
			# "None"
			"Input"
		];

		vim.languages.csharp = {
			enable = true;
		};

		vim.lsp.lspconfig = {
			enable = true;
			sources = {
				gdscript = ''
					vim.lsp.enable("gdscript")
				'';
				gdshader = ''
					vim.lsp.enable("gdshader_lsp")
				'';
			};
		};

		# glsl_analyzer lsp currently doesnt support error checking
		vim.languages.glsl = {
			enable = true;
		};

		vim.languages.nix = {
			enable = true;
			extraDiagnostics.enable = true;
			# format.type = [ "nixfmt" ];
			format.type = ["alejandra"];
		};
		vim.formatter.conform-nvim.setupOpts.formatters.nixfmt.prepend_args = ["--indent=4"];

		vim.languages.rust = {
			enable = true;
			extensions.rustaceanvim.enable = false;
			format.enable = true;
			lsp.enable = true;
			treesitter.enable = true;
		};
		vim.formatter.conform-nvim.setupOpts.formatters_by_ft.rust = ["rustfmt"];
		vim.lsp.servers.rust-analyzer.settings.rust-analyzer.checkOnSave = false;

		vim.languages.typst = {
			enable = true;
			extensions.typst-concealer.enable = false;
			extensions.typst-preview-nvim.enable = true;
			# on_attach = function(client, bufnr)
			# 	vim.keymap.set("n", "<leader>tp", function ()
			# 		client:exec_cmd({
			# 			title = "Tinymist pin main file",
			# 			command = "tinymist.pinMain",
			# 			arguments = { vim.api.nvim_buf_get_name(0) },
			# 		}, { bufnr = bufnr })
			# 	end, { desc = "[T]inymist [P]in" })
			#
			# 	vim.keymap.set("n", "<leader>tu", function ()
			# 		client:exec_cmd({
			# 			title = "Tinymist unpin main file",
			# 			command = "tinymist.pinMain",
			# 			arguments = { vim.v.null },
			# 		}, { bufnr = bufnr })
			# 	end, { desc = "[T]inymist [U]npin" })
			# end,
		};
	};
}
