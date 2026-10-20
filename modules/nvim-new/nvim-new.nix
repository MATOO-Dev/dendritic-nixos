{
	inputs,
	self,
	...
}: {
	flake.homeModules.nvim-new = {pkgs, ...}: {
		programs.neovim = {
			enable = true;
			package = self.packages.${pkgs.stdenv.hostPlatform.system}.nvim-new;
		};
	};

	perSystem = {pkgs, ...}: {
		packages.nvim-new =
			inputs.wrapper-modules.wrappers.neovim.wrap {
				inherit pkgs;

				# from config.settings
				settings.config_directory = ./.;

				# # from config.specs.foo
				# specs.foo = {
				# 	# after = ["bar"];
				# 	after = [];
				# 	# lazy = true;
				# 	lazy = false;
				# 	# data = with pkgs.vimPlugins; [];
				# 	data = null;
				# 	# runtimePkgs = with pkgs; [];
				# 	runtimePkgs = null;
				# };

				imports = with self.modules.neovim; [
				];
			};
	};
}
