{
	# flake.homeModules.neovim = {self, ...}: {
	# 	home.packages = with self.packages; [nvim-full];
	# };

	# perSystem.packages.neovim-full = {
	# 	inputs,
	# 	pkgs,
	# 	...
	# }:
	# 	(inputs.nvf.lib.neovimConfiguration {
	# 			inherit pkgs;
	# 			modules = [];
	# 		}).neovim;
	#
	# perSystem.packages.neovim-small = {
	# 	inputs,
	# 	pkgs,
	# 	...
	# }:
	# 	(inputs.nvf.lib.neovimConfiguration {
	# 			inherit pkgs;
	# 			modules = [];
	# 		}).neovim;
}
