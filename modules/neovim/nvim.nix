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
						telescope-nvim # fuzzy finder
						undotree # tree-like undo
						nvim-treesitter # treesitter
					];
				};
				info.value = "require 'nix-info'.info.value";
				# potentially move this and conform / lspconfig into a seperate spec
				runtimePkgs = with pkgs; [
					alejandra # nix formatter
					clang-tools # clang formatter & lsp
					gdtoolkit_4 # gdscript formatter
					rustfmt # rust formatter
					stylua # lua formatter
				];

				imports = with self.modules.nvim-new; [
				];
			};
	};
}
