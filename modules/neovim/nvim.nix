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
		# alejandra is formatted using a config file
		# create a custom version of alejandra that interpolates the config as cmdline arg
		# allows settings to apply to all nix files without requiring the config there
		packages.alejandra =
			pkgs.writeShellApplication {
				name = "alejandra";
				runtimeInputs = with pkgs; [alejandra];
				text = let
					alejandraConfig =
						pkgs.writers.writeTOML "alejandra.toml" {
							indentation = "Tabs";
						};
				in ''alejandra --experimental-config ${alejandraConfig} "$@"'';
			};
		packages.nvim =
			inputs.wrapper-modules.wrappers.neovim.wrap {
				inherit pkgs;

				# from config.settings
				settings.config_directory = ./.;
				settings.aliases = ["nv"];

				specs.general = with pkgs.vimPlugins; [
					catppuccin-nvim # color theme
					oil-nvim # file system navigator
				];
				specs.lazy = {
					lazy = true;
					data = with pkgs.vimPlugins;
						[
							conform-nvim # auto formatting
							lualine-nvim # status bar
							nvim-lspconfig # lsp templates
							telescope-nvim # fuzzy finder
							# undotree # tree-like undo, testing native implementation
							vim-move # move selected text
							vim-wordmotion # better word boundaries
							nvim-surround # surrounding delimiter pairs
							flash-nvim # quick jumping motions
							typst-preview-nvim # realtime preview for typst
							tiny-inline-diagnostic-nvim # nicer diagnostic virtual text
							gitsigns-nvim # show git status in files
							blink-cmp # autocomplete
							blink-indent # indentation guides
							treesj # toggle block splitting/joining
							tabout-nvim # tab out of delimiters
							tiny-cmdline-nvim # cmdline in center of window
							toggleterm-nvim # floating terminal
							nvim-dap # debugger support
							nvim-dap-view # debugger ui
							nvim-dap-virtual-text # inline values virtual text
							#############################
							nvim-treesitter.withAllGrammars # treesitter parser configs
							nvim-treesitter-textobjects # textobject detection
						]
						++ (with pkgs.unstable.vimPlugins; [
								blink-pairs # autopairs and rainbow colors
							]);
				};
				# potentially move this and conform / lspconfig into a seperate spec
				# also, look into specs.<name>.collateGrammars for treesitter
				runtimePkgs = with pkgs;
					[
						tree-sitter # syntax coloring
						ripgrep # for telescope live grep
						fd # file finder
						#############################
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
						# alejandra # nix formatter
						gdtoolkit_4 # gdscript formatter
						rustfmt # rust formatter
						stylua # lua formatter
						typstyle # typst formatter
						#############################
						lldb # llvm debugger
					]
					++ [
						self.packages.${pkgs.stdenv.hostPlatform.system}.alejandra # customized nix formatter
					];
			};
	};
}
