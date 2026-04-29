{}
# {
# 	flake.nixosModules.template = {pkgs, ...}: {
# 		boot.extraModulePackages = with pkgs; [
# 			linuxKernel.packages.linux_6_18.it87
# 		];
# 	};
#
# 	flake.homeModules.template = {pkgs, ...}: {
# 		home.packages = with pkgs; [
# 			coolercontrol
# 			corectrl
# 			fancontrol-gui
# 		];
# 	};
# }

