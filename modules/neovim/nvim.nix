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

				specs.general = with pkgs.vimPlugins; [];
				specs.lazy = {
					lazy = true;
					# load using vim.cmd.packadd('pname')
					# look into lazy loading with default vim.pack.add
					data = with pkgs.vimPlugins; [];
				};
				info.value = "require 'nix-info'.info.value";
				runtimePkgs = with pkgs; [];

				imports = with self.modules.nvim-new; [
				];
			};
	};
}
