{
	inputs,
	self,
	...
}: {
	flake.homeModules.nvim = {pkgs, ...}: {
		programs.neovim = {
			enable = true;
			package = self.packages.${pkgs.stdenv.hostPlatform.system}.nvim;
		};
	};

	perSystem = {pkgs, ...}: {
		packages.nvim =
			inputs.wrapper-modules.wrappers.neovim.wrap {
				inherit pkgs;

				# from config.settings
				settings.config_directory = ./.;
				settings.aliases = ["nv"];

				specs.general = with pkgs.vimPlugins; [
					catppuccin-nvim
					oil-nvim
				];
				specs.lazy = {
					lazy = true;
					data = with pkgs.vimPlugins; [
						conform-nvim # auto formatting
						lualine-nvim # status bar
						nvim-lspconfig # lsp templates
						nvim-treesitter # treesitter
						telescope-nvim # fuzzy finder
						undotree # tree-like undo
						vim-wordmotion # better word boundaries
					];
				};
				info.value = "require 'nix-info'.info.value";
				# potentially move this and conform / lspconfig into a seperate spec
				runtimePkgs = with pkgs; [
					bash-language-server # bash lsp
					clang-tools # clang formatter & lsp
					cmake-language-server # cmake lsp
					csharp-ls # c# lsp
					# gdscript
					# gdshader
					glsl_analyzer # glsl lsp
					shader-slang # slang lsp
					lua-language-server # lua lsp
					marksman # markdown lsp
					nil # nix lsp
					rust-analyzer # rust lsp
					tinymist # typst lsp
					wgsl-analyzer # wgsl lsp
					#############################
					alejandra # nix formatter
					gdtoolkit_4 # gdscript formatter
					rustfmt # rust formatter
					stylua # lua formatter
				];

				imports = with self.modules.nvim-new; [
				];
			};
	};
}
