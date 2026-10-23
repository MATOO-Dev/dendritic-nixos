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
					# non-lazy plugins can be loaded using require 'xyz'
					oil-nvim
				];
				specs.lazy = {
					lazy = true;
					# load using vim.cmd.packadd('pname') or vim.pack.add
					data = with pkgs.vimPlugins; [
						telescope-nvim
					];
				};
				info.value = "require 'nix-info'.info.value";
				runtimePkgs = with pkgs; [];

				imports = with self.modules.nvim-new; [
				];
			};
	};
}
